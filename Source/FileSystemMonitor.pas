{-----------------------------------------------------------------------------
 Unit Name: FileSystemMonitor
 Author:    PyScripter
 Purpose:   Component for monitoring changes in files and/or directories
 License:   MIT
-----------------------------------------------------------------------------}

unit FileSystemMonitor;

interface

uses
  Vcl.Forms,
  Utilsu;

type
  TFileChangeType = (fcAdded, fcRemoved, fcModified, fcRenamedOld, fcRenamedNew);

  TMonitorChangeHandler = procedure(Sender: TObject; const Path: string;
    ChangeType: TFileChangeType) of object;

  TNotifyFlag = (
    nfFileName, nfDirName, nfAttributes, nfSize, nfLastWrite, nfLastAccess,
    nfCreation, nfSecurity
  );
  TNotifyFlags = set of TNotifyFlag;

  const
    DefaultNotifyFlags = [nfFileName, nfDirName, nfSize, nfLastWrite, nfCreation];

type

  IFileSystemMonitor = interface
  ['{83753FF0-14C9-4F3D-B5F1-7C0C3A468A6E}']
    function GetBufferSize: Integer;
    procedure SetBufferSize(const BufferSize: Integer);
    function AddDirectory(const Directory: string; WatchSubtree: Boolean;
      OnChange: TMonitorChangeHandler; NotifyFlags: TNotifyFlags = DefaultNotifyFlags): Boolean;
    function AddFile(const FilePath: string; OnChange: TMonitorChangeHandler;
      NotifyFlags: TNotifyFlags = DefaultNotifyFlags): Boolean;
    function RemoveDirectory(const Directory: string; OnChange: TMonitorChangeHandler): Boolean;
    function RemoveFile(const FilePath: string; OnChange: TMonitorChangeHandler): Boolean;
    function IsMonitoring: Boolean;
    property BufferSize: Integer read GetBufferSize write SetBufferSize;
  end;

  function CreateFileSystemMonitor(
    AParent: TForm;
    AThreadException: TThreadException): IFileSystemMonitor;

implementation

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  System.SyncObjs,
  System.IOUtils,

  constsu;

type
  TFileNotifyInformation = record
    NextEntryOffset: DWORD;
    Action: DWORD;
    FileNameLength: DWORD;
    FileName: array[0..MAX_PATH - 1] of WideChar;
  end;
  PFileNotifyInformation = ^TFileNotifyInformation;

  TDirectoryHandlerInfo = record
    Handler: TMonitorChangeHandler;
    WatchSubtree: Boolean;
    class function Create(AHandler: TMonitorChangeHandler;
      AWatchSubtree: Boolean): TDirectoryHandlerInfo; static;
  end;

  TMonitorInfo = class
  // Reference counted.  The object is kept alive by:
  //   * the entry in TFileSystemMonitor.FMonitorList,
  //   * every pending ReadDirectoryChangesW request,
  //   * every change notification that has been queued but not yet executed.
  // The OVERLAPPED structure submitted to the I/O subsystem lives inside the
  // object, so the object must not be destroyed while a request is pending.
  private
    FRefCount: Integer;
  public
    Overlapped: TOverlapped;
    Directory: string;
    DirectoryHandle: THandle;
    Buffer: TBytes;
    NotifyFilter: DWORD;
    DirectoryHandlers: TList<TDirectoryHandlerInfo>;
    FThreadException: TThreadException;
    FParent: TForm;
    FileHandlers: TDictionary<string, TArray<TMonitorChangeHandler>>;
    constructor Create(
      const ADirectory: string;
      ADirectoryHandle: THandle;
      BufferSize: Integer;
      AThreadException: TThreadException;
      AParent: TForm);
    destructor Destroy; override;
    function AddRef: Integer;
    function Release: Integer;
    function WatchSubtree: Boolean;
  end;

  TMonitorLifetime = class
  // Shared token held by every queued change notification.  It answers the one
  // question a notification still has to ask: does the monitor that queued me
  // still exist?  The monitor closes the token in its destructor; the token frees
  // itself once the last notification holding it has finished.
  private
    FLock: TCriticalSection;
    FClosed: Boolean;
    FRefCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function AddRef: Integer;
    procedure Release;
    function BeginUse: Boolean;
    procedure EndUse;
    procedure Close;
  end;

  TFileSystemMonitor = class(TInterfacedObject, IFileSystemMonitor)
  private
    FCompletionPort: THandle;
    FMonitorList: TList<TMonitorInfo>;
    FWorkerThread: TThread;
    FKillThreadEvent: TEvent;
    FThreadEndedEvent: TEvent;
    FSync: TCriticalSection;
    FTerminating: Boolean;
    FPendingIoCount: Integer;
    FLifetime: TMonitorLifetime;
    FParent: TForm;
    FThreadException: TThreadException;
    class var FBufferSize: Integer; // default 65536
    procedure HandleChange(MonitorInfo: TMonitorInfo; NumBytes: DWORD);
    procedure WorkerThreadMethod;
    procedure MonitoredDirectoryRemoved(MonitorInfo: TMonitorInfo);
    function NormalizePath(const Path: string): string;
    function AddDirectoryMonitor(const Directory: string; WatchSubtree: Boolean;
        NotifyFlags: TNotifyFlags; const FilePath: string; OnChange:
        TMonitorChangeHandler): Boolean;
    function NotifyFlagsToDWORD(const Flags: TNotifyFlags): DWORD;
    function StartDirectoryMonitoring(MonitorInfo: TMonitorInfo): Boolean;
    procedure Start;
    procedure Stop;
    // IFileSystemMonitor implementation
    function GetBufferSize: Integer;
    procedure SetBufferSize(const BufferSize: Integer);
    function AddDirectory(const Directory: string; WatchSubtree: Boolean;
      OnChange: TMonitorChangeHandler; NotifyFlags: TNotifyFlags = DefaultNotifyFlags): Boolean;
    function AddFile(const FilePath: string; OnChange: TMonitorChangeHandler;
      NotifyFlags: TNotifyFlags = DefaultNotifyFlags): Boolean;
    function RemoveDirectory(const Directory: string; OnChange: TMonitorChangeHandler): Boolean;
    function RemoveFile(const FilePath: string; OnChange: TMonitorChangeHandler): Boolean;
    function IsMonitoring: Boolean;
  public
    constructor Create(
      AParent: TForm;
      AThreadException: TThreadException); reintroduce;
    destructor Destroy; override;
  end;


{ TDirectoryHandlerInfo }

class function TDirectoryHandlerInfo.Create(AHandler: TMonitorChangeHandler;
  AWatchSubtree: Boolean): TDirectoryHandlerInfo;
begin
  Result.Handler := AHandler;
  Result.WatchSubtree := AWatchSubtree;
end;

function TFileSystemMonitor.NotifyFlagsToDWORD(const Flags: TNotifyFlags): DWORD;
begin
  Result := 0;
  if nfFileName in Flags then Result := Result or FILE_NOTIFY_CHANGE_FILE_NAME;
  if nfDirName in Flags then Result := Result or FILE_NOTIFY_CHANGE_DIR_NAME;
  if nfAttributes in Flags then Result := Result or FILE_NOTIFY_CHANGE_ATTRIBUTES;
  if nfSize in Flags then Result := Result or FILE_NOTIFY_CHANGE_SIZE;
  if nfLastWrite in Flags then Result := Result or FILE_NOTIFY_CHANGE_LAST_WRITE;
  if nfLastAccess in Flags then Result := Result or FILE_NOTIFY_CHANGE_LAST_ACCESS;
  if nfCreation in Flags then Result := Result or FILE_NOTIFY_CHANGE_CREATION;
  if nfSecurity in Flags then Result := Result or FILE_NOTIFY_CHANGE_SECURITY;
end;

{ TFileSystemMonitor }

const
  // Completion key posted by Stop when the worker must leave the loop regardless
  // of how many requests are still pending.
  FORCE_EXIT_KEY = ULONG_PTR($DEADBEEF);

constructor TFileSystemMonitor.Create(
  AParent: TForm;
  AThreadException: TThreadException);
begin
  try
    inherited Create;
    FParent := AParent;
    FBufferSize := 65536;
    FMonitorList := TList<TMonitorInfo>.Create;
    FSync := TCriticalSection.Create;
    FLifetime := TMonitorLifetime.Create;
    FTerminating := False;
    FPendingIoCount := 0;
    FKillThreadEvent := TEvent.Create(Nil, True, False, '');
    FThreadEndedEvent := TEvent.Create(Nil, True, False, '');
    // Create empty Completion port
    FCompletionPort := CreateIoCompletionPort(INVALID_HANDLE_VALUE, 0, 0, 0);
    if FCompletionPort = 0 then
      raise EOSError.Create('Failed to create I/O completion port.');
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TFileSystemMonitor.Create',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

destructor TFileSystemMonitor.Destroy;
var
  MonitorInfo: TMonitorInfo;
begin
  try
    // Tell every change notification that is still waiting that the monitor is on
    // its way out.  This also waits for a notification that is running right now.
    // It has to happen before Stop, because stopping the worker pumps the queue of
    // waiting notifications on the calling thread.
    if Assigned(FLifetime) then FLifetime.Close;

    Stop; // Drains all pending I/O, so only the list references are left

    for MonitorInfo in FMonitorList do
      MonitorInfo.Release;

    FreeAndNil(FMonitorList);

    if FCompletionPort <> 0 then
    begin
      CloseHandle(FCompletionPort);
      FCompletionPort := 0;
    end;

    FreeAndNil(FSync);

    // The token stays alive until the last waiting notification has noticed the
    // close and let go of its reference.
    if Assigned(FLifetime) then FLifetime.Release;
    if Assigned(FKillThreadEvent) then begin
      FreeAndNil(FKillThreadEvent);
    end;
    if Assigned(FThreadEndedEvent) then begin
      FreeAndNil(FThreadEndedEvent);
    end;
    inherited;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TFileSystemMonitor.Destroy',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

function TFileSystemMonitor.GetBufferSize: Integer;
begin
  Result := FBufferSize;
end;

function TFileSystemMonitor.NormalizePath(const Path: string): string;
var
  LongPath: array[0..MAX_PATH - 1] of Char;
begin
  try
    Result := TPath.GetFullPath(Path);

    // Remove trailing path delimiter
    Result := ExcludeTrailingPathDelimiter(Result);

    // Convert to long path (correct casing, expand 8.3 names)
    if GetLongPathName(PChar(Result), LongPath, MAX_PATH) > 0 then
      Result := LongPath;

    // Uppercase drive letter if present
    if (Length(Result) >= 2) and (Result[2] = DriveDelim) then
      Result[1] := UpCase(Result[1]);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TFileSystemMonitor.NormalizePath',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

function TFileSystemMonitor.AddDirectory(
  const Directory: string;
  WatchSubtree: Boolean;
  OnChange: TMonitorChangeHandler;
  NotifyFlags: TNotifyFlags = DefaultNotifyFlags): Boolean;
begin
  try
    Result := AddDirectoryMonitor(
      Directory,
      WatchSubtree,
      NotifyFlags,
      '',
      OnChange);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TFileSystemMonitor.AddDirectory',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

function TFileSystemMonitor.AddFile(
  const FilePath: string;
  OnChange: TMonitorChangeHandler;
  NotifyFlags: TNotifyFlags = DefaultNotifyFlags):Boolean;
begin
  try
    Result := AddDirectoryMonitor(
      TPath.GetDirectoryName(FilePath),
      False,
      NotifyFlags,
      FilePath,
      OnChange);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TFileSystemMonitor.AddFile',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

function TFileSystemMonitor.AddDirectoryMonitor(
  const Directory: string;
  WatchSubtree: Boolean;
  NotifyFlags: TNotifyFlags;
  const FilePath: string;
  OnChange: TMonitorChangeHandler): Boolean;
var
  MonitorInfo: TMonitorInfo;
  DirectoryHandle: THandle;
  NormalizedDir, NormalizedFile: string;
  HandlerList: TArray<TMonitorChangeHandler>;
begin
  FSync.Enter;
  try
    try
      Result := False;
      if not TDirectory.Exists(Directory) then Exit;
      if not Assigned(OnChange) then Exit;

      NormalizedDir := NormalizePath(Directory);

      for MonitorInfo in FMonitorList do
      begin
        if SameText(MonitorInfo.Directory, NormalizedDir) then
        begin
           // The folder is already monitored
          if FilePath = '' then
          begin
            MonitorInfo.DirectoryHandlers.Add(TDirectoryHandlerInfo.Create(OnChange, WatchSubtree));
            if WatchSubtree and not MonitorInfo.WatchSubtree then
            begin
              CancelIoEx(MonitorInfo.DirectoryHandle, @MonitorInfo.Overlapped);
              StartDirectoryMonitoring(MonitorInfo);
            end;
          end
          else
          begin
            NormalizedFile := NormalizePath(FilePath);
            if MonitorInfo.FileHandlers.TryGetValue(NormalizedFile, HandlerList) then
              MonitorInfo.FileHandlers[NormalizedFile] := HandlerList + [OnChange]
            else
              MonitorInfo.FileHandlers.Add(NormalizedFile, [OnChange]);
          end;
          if NotifyFlagsToDWORD(NotifyFlags) <> MonitorInfo.NotifyFilter then
          begin
            MonitorInfo.NotifyFilter := MonitorInfo.NotifyFilter or
              NotifyFlagsToDWORD(NotifyFlags);
            CancelIoEx(MonitorInfo.DirectoryHandle, @MonitorInfo.Overlapped);
            StartDirectoryMonitoring(MonitorInfo);
          end;

          Exit(True);
        end;
      end;

      // Create new folder monitor
      DirectoryHandle := CreateFile(
        PChar(NormalizedDir),
        FILE_LIST_DIRECTORY,
        FILE_SHARE_READ or FILE_SHARE_WRITE or FILE_SHARE_DELETE,
        nil,
        OPEN_EXISTING,
        FILE_FLAG_BACKUP_SEMANTICS or FILE_FLAG_OVERLAPPED,
        0
      );


      if DirectoryHandle = INVALID_HANDLE_VALUE then
        Exit;

      MonitorInfo := TMonitorInfo.Create(
        NormalizedDir,
        DirectoryHandle,
        FBufferSize,
        FThreadException,
        FParent);
      try
        MonitorInfo.NotifyFilter := NotifyFlagsToDWORD(NotifyFlags);
        if FilePath = '' then begin
          MonitorInfo.DirectoryHandlers.Add(TDirectoryHandlerInfo.Create(OnChange, WatchSubtree));
        end else
        begin
          NormalizedFile := NormalizePath(FilePath);
          MonitorInfo.FileHandlers.Add(NormalizedFile, [OnChange]);
        end;

        if (CreateIoCompletionPort(DirectoryHandle, FCompletionPort,
          ULONG_PTR(Pointer(MonitorInfo)), 0) <> FCompletionPort) or
          not StartDirectoryMonitoring(MonitorInfo)
        then
          raise EOSError.Create('Failed to start directory monitoring.');

        if not IsMonitoring then
          Start;

        FMonitorList.Add(MonitorInfo); // The list owns the initial reference

        Result := True;
      except
        MonitorInfo.Release;
        raise;
      end;
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E: Exception do begin
        FThreadException.SetErrorInfo(
          'TFileSystemMonitor.AddDirectoryMonitor',
          E.Message,
          E.StackTrace);
        PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
      end;
      {$ENDIF}
    end;
  finally
    FSync.Leave;
  end;
end;

function TFileSystemMonitor.StartDirectoryMonitoring(MonitorInfo: TMonitorInfo): Boolean;
begin
  try
    ZeroMemory(@MonitorInfo.Overlapped, SizeOf(TOverlapped));

    // The pending request owns a reference to MonitorInfo.  It keeps the object
    // (and its OVERLAPPED structure) alive until the completion packet has been
    // processed by the worker thread.  Must be called with FSync held.
    MonitorInfo.AddRef;
    Result := ReadDirectoryChangesW(
      MonitorInfo.DirectoryHandle,
      @MonitorInfo.Buffer[0],
      Length(MonitorInfo.Buffer),
      MonitorInfo.WatchSubtree,
      MonitorInfo.NotifyFilter,
      nil,
      @MonitorInfo.Overlapped,
      nil
    );

    if Result then
      Inc(FPendingIoCount)
    else
      MonitorInfo.Release;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TFileSystemMonitor.StartDirectoryMonitoring',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

procedure TFileSystemMonitor.HandleChange(MonitorInfo: TMonitorInfo; NumBytes: DWORD);

  procedure LaunchHandlers(const Path: string; ChangeType: TFileChangeType);
  // The anonymous method is contained in a function, so that we capture values
  // and not variables which may change by the time the method is executed
  var
    Lifetime: TMonitorLifetime;
  begin
    // The queued method owns a reference to MonitorInfo, so the record stays
    // alive until the notification has been delivered, even if the folder is
    // removed meanwhile.  It also owns a reference to the monitor's lifetime
    // token, which tells it whether the monitor itself is still there.
    MonitorInfo.AddRef;
    Lifetime := FLifetime;
    Lifetime.AddRef;
    // The notification is not tied to the worker thread: queuing it for the
    // worker would make it disappear silently when the worker is freed.
    TThread.Queue(nil,
      procedure
      var
        FullPath: string;
        IsSubdirectoryChange: Boolean;
        HandlerInfo: TDirectoryHandlerInfo;
        Handler: TMonitorChangeHandler;
        FileHandlerList: TArray<TMonitorChangeHandler>;
      begin
        try
          // If the monitor has been destroyed, nothing here may be touched
          if not Lifetime.BeginUse then
            Exit;
          try
            FSync.Enter;
            try
              try
                // Make sure MonitorInfo is still monitored
                if FMonitorList.IndexOf(MonitorInfo) < 0 then Exit;

                FullPath := TPath.Combine(MonitorInfo.Directory, Path);
                IsSubdirectoryChange := not SameText(MonitorInfo.Directory,
                  TPath.GetDirectoryName(FullPath));

                for HandlerInfo in MonitorInfo.DirectoryHandlers do
                  if HandlerInfo.WatchSubtree or not IsSubdirectoryChange then
                    HandlerInfo.Handler(Self, FullPath, ChangeType);

                if MonitorInfo.FileHandlers.TryGetValue(FullPath, FileHandlerList) then
                  for Handler in FileHandlerList do
                    Handler(Self, FullPath, ChangeType);
              except
                {$IFDEF MadExceptOn}
                raise;
                {$ELSE}
                On E: Exception do begin
                  FThreadException.SetErrorInfo(
                    'TThread.Queue',
                    E.Message,
                    E.StackTrace);
                  PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
                end;
                {$ENDIF}
              end;
            finally
              FSync.Leave;
            end;
          finally
            Lifetime.EndUse;
          end;
        finally
          Lifetime.Release;
          MonitorInfo.Release;
        end;
      end);
  end;

var
  NotifyInfo: PFileNotifyInformation;
  Offset: Longint;
  Path: string;
  ChangeType: TFileChangeType;
begin
  if NumBytes = 0 then
    Exit;

  try
    NotifyInfo := PFileNotifyInformation(@MonitorInfo.Buffer[0]);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TFileSystemMonitor.HandleChange',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
  repeat
    try
      Offset := NotifyInfo^.NextEntryOffset;
      SetString(Path, NotifyInfo^.FileName, NotifyInfo^.FileNameLength div SizeOf(Char));
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E: Exception do begin
        FThreadException.SetErrorInfo(
          'TFileSystemMonitor.HandleChange',
          E.Message,
          E.StackTrace);
        PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
      end;
      {$ENDIF}
    end;

    FSync.Enter;
    try
      try
        case NotifyInfo^.Action of
          FILE_ACTION_ADDED: ChangeType := fcAdded;
          FILE_ACTION_REMOVED: ChangeType := fcRemoved;
          FILE_ACTION_MODIFIED: ChangeType := fcModified;
          FILE_ACTION_RENAMED_OLD_NAME: ChangeType := fcRenamedOld;
          FILE_ACTION_RENAMED_NEW_NAME: ChangeType := fcRenamedNew;
        else
          ChangeType := fcModified;  // to keep the compiler happy
        end;

        LaunchHandlers(Path, ChangeType);
      except
        {$IFDEF MadExceptOn}
        raise;
        {$ELSE}
        On E: Exception do begin
          FThreadException.SetErrorInfo(
            'TFileSystemMonitor.HandleChange',
            E.Message,
            E.StackTrace);
          PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
        end;
        {$ENDIF}
      end;
    finally
      FSync.Leave;
    end;

    try
      if Offset > 0 then
        PByte(NotifyInfo) := PByte(NotifyInfo) + Offset
      else
        Break;
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E: Exception do begin
        FThreadException.SetErrorInfo(
          'TFileSystemMonitor.HandleChange',
          E.Message,
          E.StackTrace);
        PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
      end;
      {$ENDIF}
    end;
  until False;

  try
    // Re-arm the request, unless the monitor is shutting down or has been removed
    if not (FKillThreadEvent.WaitFor(0) = TWaitResult.wrSignaled) and (FMonitorList.IndexOf(MonitorInfo) >= 0) then
      StartDirectoryMonitoring(MonitorInfo);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TFileSystemMonitor.HandleChange',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

procedure TFileSystemMonitor.WorkerThreadMethod;
var
  NumBytes: DWORD;
  CompletionKey: ULONG_PTR;
  Overlapped: POverlapped;
  MonitorInfo: TMonitorInfo;
  Success: Boolean;
  MonitorEntry: TMonitorInfo;
  DirectoriesToDelete: TArray<TMonitorInfo>;
  AllIdle: Boolean;
begin
  try
    try
      while True do
      begin
        NumBytes := 0;
        CompletionKey := 0;
        Overlapped := nil;

        Success := GetQueuedCompletionStatus(
          FCompletionPort,
          NumBytes,
          CompletionKey,
          Overlapped,
          500 // 5-second timeout
        );

        // Forced stop: leave before the pending requests are accounted for
        if CompletionKey = FORCE_EXIT_KEY then Break;

        // A failed request (for example ERROR_OPERATION_ABORTED after CancelIoEx)
        // still produces a completion packet: the call returns False but fills in
        // Overlapped, CompletionKey and NumBytes.  It must be counted down and
        // released like any other packet, otherwise FPendingIoCount never reaches
        // zero and Stop waits forever.
        if Success or (Overlapped <> nil) then
        begin
          // A zero CompletionKey is the wake-up packet posted by Stop
          MonitorInfo := TMonitorInfo(Pointer(CompletionKey));
          if MonitorInfo <> nil then
          begin
            // Handle the Change, then drop the reference owned by the request
            FSync.Enter;
            try
              if Success and not (FKillThreadEvent.WaitFor(0) = TWaitResult.wrSignaled) then
                HandleChange(MonitorInfo, NumBytes);
              Dec(FPendingIoCount);
            finally
              FSync.Leave;
            end;
            MonitorInfo.Release;
          end;
        end
        else if GetLastError = WAIT_TIMEOUT then
        begin
          // If a monitored directory gets deleted/renamed we get no notification.
          // So periodically we need to check whether the monitored directories
          // still exist.
          DirectoriesToDelete := [];
          FSync.Enter;
          try
            for MonitorEntry in FMonitorList do
            begin
              if not TDirectory.Exists(MonitorEntry.Directory) then
                DirectoriesToDelete := DirectoriesToDelete + [MonitorEntry];
            end;

            for MonitorInfo in DirectoriesToDelete do
            begin
              // Send remove notifications
              MonitoredDirectoryRemoved(MonitorInfo);
              // Stop monitoring this directory
              FMonitorList.Remove(MonitorInfo);
              // Complete the pending request, so that its reference is released
              CancelIoEx(MonitorInfo.DirectoryHandle, @MonitorInfo.Overlapped);
              MonitorInfo.Release;
            end;
          finally
            FSync.Leave;
          end;
        end
        else
          // The completion port is no longer usable (for example it was closed),
          // so no more packets can arrive.  Leave instead of spinning forever.
          Break;

        // Exit only after every pending request has been completed and released
        if (FKillThreadEvent.WaitFor(0) = TWaitResult.wrSignaled) then
        begin
          FSync.Enter;
          try
            AllIdle := FPendingIoCount <= 0;
          finally
            FSync.Leave;
          end;
          if AllIdle then
            Break;
        end;
      end;
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E: Exception do begin
        FThreadException.SetErrorInfo(
          'TFileSystemMonitor.WorkerThreadMethod',
          E.Message,
          E.StackTrace);
        PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
      end;
      {$ENDIF}
    end;
  finally
    FThreadEndedEvent.SetEvent;
  end;
end;

procedure TFileSystemMonitor.SetBufferSize(const BufferSize: Integer);
begin
  FBufferSize := BufferSize;
end;

procedure TFileSystemMonitor.Start;
begin
  FSync.Enter;
  try
    try
      if (FWorkerThread <> nil) then
        Exit;

      FTerminating := False;
      FWorkerThread := TThread.CreateAnonymousThread(WorkerThreadMethod);
      FWorkerThread.FreeOnTerminate := False;
      FWorkerThread.NameThreadForDebugging('File System Monitor');
      FWorkerThread.Start;
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E: Exception do begin
        FThreadException.SetErrorInfo(
          'TFileSystemMonitor.SetBufferSize',
          E.Message,
          E.StackTrace);
        PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
      end;
      {$ENDIF}
    end;
  finally
    FSync.Leave;
  end;
end;

procedure TFileSystemMonitor.Stop;
var
  MonitorInfo: TMonitorInfo;
  WaitResult: TWaitResult;
begin
  FSync.Enter;
  try
    try
      if IsMonitoring then
      begin
        FKillThreadEvent.SetEvent;

        // Cancel every pending request.  Each one posts a completion packet,
        // which lets the worker thread release the reference it holds and then
        // exit (see WorkerThreadMethod).
        for MonitorInfo in FMonitorList do
          CancelIoEx(MonitorInfo.DirectoryHandle, @MonitorInfo.Overlapped);

        // Wake up the worker so that it re-evaluates the exit condition
        PostQueuedCompletionStatus(FCompletionPort, 0, 0, nil);
      end;
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E: Exception do begin
        FThreadException.SetErrorInfo(
          'TFileSystemMonitor.Stop',
          E.Message,
          E.StackTrace);
        PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
      end;
      {$ENDIF}
    end;
  finally
    FSync.Leave;
  end;

  try
    // Give the worker 5 seconds to drain its pending requests
    WaitResult := FThreadEndedEvent.WaitFor(5000);
    if WaitResult <> TWaitResult.wrSignaled then
    begin
      // The pending requests may never complete (for example if their packets were
      // lost).  The sentinel makes the worker leave at once instead of waiting for
      // FPendingIoCount to reach zero, so the FreeAndNil below cannot block forever.
      PostQueuedCompletionStatus(FCompletionPort, 0, FORCE_EXIT_KEY, nil);
      FThreadEndedEvent.WaitFor(2000);
    end;

    FreeAndNil(FWorkerThread); // Waits for termination
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TFileSystemMonitor.Stop',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

function TFileSystemMonitor.RemoveDirectory(const Directory: string; OnChange:
    TMonitorChangeHandler): Boolean;
var
  MonitorInfo: TMonitorInfo;
  NormalizedDir: string;
  I: Integer;
  OldWatchSubtree: Boolean;
begin
  FSync.Enter;
  try
    try
      Result := False;
      NormalizedDir := NormalizePath(Directory);
      for MonitorInfo in FMonitorList.ToArray do
      begin
        if SameText(MonitorInfo.Directory, NormalizedDir) then
        begin
          for I := MonitorInfo.DirectoryHandlers.Count - 1 downto 0 do
          begin
            if TMethod(MonitorInfo.DirectoryHandlers[I].Handler) = TMethod(OnChange) then
            begin
              Result := True;
              OldWatchSubtree := MonitorInfo.WatchSubtree;
              MonitorInfo.DirectoryHandlers.Delete(I);

              if (MonitorInfo.DirectoryHandlers.Count = 0) and
                (MonitorInfo.FileHandlers.Count = 0) then
              begin
                FMonitorList.Remove(MonitorInfo);
                // Complete the pending request, so that its reference is released
                CancelIoEx(MonitorInfo.DirectoryHandle, @MonitorInfo.Overlapped);
                MonitorInfo.Release;
              end
              else if OldWatchSubtree <> MonitorInfo.WatchSubtree then
              begin
                CancelIoEx(MonitorInfo.DirectoryHandle, @MonitorInfo.Overlapped);
                StartDirectoryMonitoring(MonitorInfo);
              end;

              Break;
            end;
          end;
        end;
      end;
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E: Exception do begin
        FThreadException.SetErrorInfo(
          'TFileSystemMonitor.RemoveDirectory',
          E.Message,
          E.StackTrace);
        PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
      end;
      {$ENDIF}
    end;
  finally
    FSync.Leave;
  end;
end;

function TFileSystemMonitor.RemoveFile(const FilePath: string; OnChange:
    TMonitorChangeHandler): Boolean;
var
  MonitorInfo: TMonitorInfo;
  NormalizedFile, Directory: string;
  HandlerList: TArray<TMonitorChangeHandler>;
  HandlerIndex: Integer;
begin
  FSync.Enter;
  try
    try
      Result := False;
      NormalizedFile := NormalizePath(FilePath);
      Directory := TPath.GetDirectoryName(NormalizedFile);

      for MonitorInfo in FMonitorList.ToArray do
      begin
        if SameText(MonitorInfo.Directory, Directory) then
        begin
          if MonitorInfo.FileHandlers.TryGetValue(NormalizedFile, HandlerList) then
          begin
            HandlerIndex := TArray.IndexOf<TMonitorChangeHandler>(HandlerList, OnChange);
            if HandlerIndex >= 0 then
            begin
              Result := True;
              Delete(HandlerList, HandlerIndex, 1);
              if Length(HandlerList) = 0 then
                MonitorInfo.FileHandlers.Remove(NormalizedFile);

              if (MonitorInfo.DirectoryHandlers.Count = 0) and
                (MonitorInfo.FileHandlers.Count = 0) then
              begin
                FMonitorList.Remove(MonitorInfo);
                // Complete the pending request, so that its reference is released
                CancelIoEx(MonitorInfo.DirectoryHandle, @MonitorInfo.Overlapped);
                MonitorInfo.Release;
              end;

              Break;
            end;
          end;
        end;
      end;
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E: Exception do begin
        FThreadException.SetErrorInfo(
          'TFileSystemMonitor.RemoveFile',
          E.Message,
          E.StackTrace);
        PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
      end;
      {$ENDIF}
    end;
  finally
    FSync.Leave;
  end;
end;

function TFileSystemMonitor.IsMonitoring: Boolean;
begin
  FSync.Enter;
  try
    Result := (FWorkerThread <> nil) and not FWorkerThread.Finished;
  finally
    FSync.Leave;
  end;
end;

procedure TFileSystemMonitor.MonitoredDirectoryRemoved(
  MonitorInfo: TMonitorInfo);
// Called when a monitored directory was deleted/renamed
// Notifies all handlers about the removal
// Everything the notification needs is copied out of MonitorInfo here, and the
// queued method keeps a reference of its own, so it never touches a stale object
var
  Directory: string;
  DirectoryHandlers: TArray<TDirectoryHandlerInfo>;
  FileHandlers: TArray<TPair<string, TArray<TMonitorChangeHandler>>>;
  Lifetime: TMonitorLifetime;
begin
  Directory := MonitorInfo.Directory;
  DirectoryHandlers := MonitorInfo.DirectoryHandlers.ToArray;
  FileHandlers := MonitorInfo.FileHandlers.ToArray;

  MonitorInfo.AddRef;
  Lifetime := FLifetime;
  Lifetime.AddRef;
  TThread.Queue(nil,
    procedure
    var
      FileName: string;
      HandlerInfo: TDirectoryHandlerInfo;
      Handler: TMonitorChangeHandler;
      Pair: TPair<string, TArray<TMonitorChangeHandler>>;
      FileHandlerList: TArray<TMonitorChangeHandler>;
    begin
      try
        // If the monitor has been destroyed, nothing here may be touched
        if not Lifetime.BeginUse then
          Exit;
        try
          FSync.Enter;
          try
            try
              for HandlerInfo in DirectoryHandlers do
                HandlerInfo.Handler(Self, Directory, fcRemoved);

              for Pair in FileHandlers do
              begin
                FileName := Pair.Key;
                FileHandlerList := Pair.Value;
                for Handler in FileHandlerList do
                  Handler(Self, FileName, fcRemoved);
              end;
            except
              {$IFDEF MadExceptOn}
              raise;
              {$ELSE}
              On E: Exception do begin
                FThreadException.SetErrorInfo(
                  'TFileSystemMonitor.MonitoredDirectoryRemoved',
                  E.Message,
                  E.StackTrace);
                PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
              end;
              {$ENDIF}
            end;
          finally
            FSync.Leave;
          end;
        finally
          Lifetime.EndUse;
        end;
      finally
        Lifetime.Release;
        MonitorInfo.Release;
      end;
    end);
end;

{ TMonitorLifetime }

constructor TMonitorLifetime.Create;
begin
  inherited Create;
  FLock := TCriticalSection.Create;
  FRefCount := 1; // the reference owned by the monitor
end;

destructor TMonitorLifetime.Destroy;
begin
  FLock.Free;
  inherited;
end;

function TMonitorLifetime.AddRef: Integer;
begin
  Result := TInterlocked.Increment(FRefCount);
end;

procedure TMonitorLifetime.Release;
begin
  if TInterlocked.Decrement(FRefCount) = 0 then
    Free;
end;

function TMonitorLifetime.BeginUse: Boolean;
// Keeps the lock while the caller works, so that Close cannot return in the
// middle of a notification.  The caller must pair a True result with EndUse.
begin
  FLock.Enter;
  Result := not FClosed;
  if not Result then
    FLock.Leave;
end;

procedure TMonitorLifetime.EndUse;
begin
  FLock.Leave;
end;

procedure TMonitorLifetime.Close;
// Called from the monitor's destructor
begin
  FLock.Enter; // waits for a notification that is running on another thread
  try
    FClosed := True;
  finally
    FLock.Leave;
  end;
end;

{ TMonitorInfo }

constructor TMonitorInfo.Create(
  const ADirectory: string;
  ADirectoryHandle: THandle;
  BufferSize: Integer;
  AThreadException: TThreadException;
  AParent: TForm);
begin
  inherited Create;
  FThreadException := AThreadException;
  FParent := AParent;
  try
    FRefCount := 1; // the reference owned by the creator
    Directory := ADirectory;
    DirectoryHandle := ADirectoryHandle;
    SetLength(Buffer, BufferSize);
    DirectoryHandlers := TList<TDirectoryHandlerInfo>.Create;
    FileHandlers := TDictionary<string, TArray<TMonitorChangeHandler>>.Create;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TMonitorInfo.Create',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

destructor TMonitorInfo.Destroy;
begin
  try
    if DirectoryHandle <> INVALID_HANDLE_VALUE then
    begin
      CancelIoEx(DirectoryHandle, @Overlapped);
      CloseHandle(DirectoryHandle);
      DirectoryHandle := INVALID_HANDLE_VALUE;
    end;
    DirectoryHandlers.Free;
    FileHandlers.Free;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TMonitorInfo.Destroy',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
  inherited;
end;

function TMonitorInfo.AddRef: Integer;
begin
  Result := TInterlocked.Increment(FRefCount);
end;

function TMonitorInfo.Release: Integer;
begin
  Result := TInterlocked.Decrement(FRefCount);
  if Result = 0 then
    Free;
end;

function TMonitorInfo.WatchSubtree: Boolean;
var
  HandlerInfo: TDirectoryHandlerInfo;
begin
  try
  Result := False;
    for HandlerInfo in DirectoryHandlers do
      if HandlerInfo.WatchSubtree then
        Exit(True);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FThreadException.SetErrorInfo(
        'TMonitorInfo.WatchSubtree',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

function CreateFileSystemMonitor(
  AParent: TForm;
  AThreadException: TThreadException): IFileSystemMonitor;
begin
  Result := TFileSystemMonitor.Create(
    AParent,
    AThreadException);
end;


end.
