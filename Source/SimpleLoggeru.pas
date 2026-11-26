unit SimpleLoggeru;

interface

uses
  System.Classes,
  System.SysUtils,
  System.IOUtils,
  System.DateUtils,
  System.SyncObjs,
  Winapi.Windows;

type
  // 1. Define the Log Levels
  TLogLevel = (
    llDebug,    // For detailed debugging info
    llInfo,     // General operational messages
    llWarning,  // Something unusual but not critical
    llError,    // A function failed, but the app can continue
    llFatal     // The application cannot recover from this
  );

  // Helper function to get the string representation of the log level
  function LogLevelToString(const ALevel: TLogLevel): String;

type
  TSimpleLogger = class
  private
    FLogDirectoryPath: String;
    FLogFileName: String;
    FFullPath: String;
    FFallbackPath: String;
    FUseFallback: Boolean;
    FErrorMsg: String;
    FHasErrors: Boolean;
    FLock: TCriticalSection;

    // private method to ensure the log directory exists
    procedure EnsureLogDirectoryCreated;
    procedure SetErrorMsg(const Value: String);
    procedure SetHasErrors(const Value: Boolean);

    // Records a logger problem without raising; the UI reads
    // HasErrors / ErrorMsg on the main thread.
    procedure RecordError(const AMsg: String);

    // Per-user location used when the primary log path is not writable.
    function BuildFallbackPath: String;

    // Appends one entry, returns False instead of raising on failure.
    function TryAppend(const APath, AText: String): Boolean;

    // Last resort sink: the Windows Application event log.
    procedure LogToEventLog(const ALevel: TLogLevel; const AMsg: String);
  public
    property HasErrors: Boolean
      read FHasErrors
      write SetHasErrors;
    property ErrorMsg: String
      read FErrorMsg
      write SetErrorMsg;

    // Constructor: Initializes the logger by setting up the path
    constructor Create(const ALogName: String = 'application.log');
    destructor Destroy; override;

    // Public method to write the log entry
    procedure WriteLog(const ALevel: TLogLevel;
                       const AMsg: String);
  end;

implementation

uses
  Vcl.Forms,
  Vcl.Dialogs;

function LogLevelToString(const ALevel: TLogLevel): String;
begin
  case ALevel of
    llDebug: Result := 'DEBUG';
    llInfo:   Result := 'INFO';
    llWarning: Result := 'WARN';
    llError:   Result := 'ERROR';
    llFatal:   Result := 'FATAL';
  end;
end;

{ TSimpleLogger }

constructor TSimpleLogger.Create(const ALogName: String);
begin
  FHasErrors := False;
  FUseFallback := False;
  FErrorMsg := '';
  FFallbackPath := '';

  // The constructor must never raise: the caller has nothing left to fall
  // back on if the logger itself fails during start-up. Every problem below
  // is recorded in FHasErrors / FErrorMsg instead of being propagated.
  try
    FLock := TCriticalSection.Create;
  except
    On E: Exception do begin
      FLock := nil;
      RecordError('Logger lock could not be created: ' + E.Message);
    end;
  end;

  // 1. Determine the log directory path (Executable directory)
  // ExtractFilePath(Application.ExeName) is the standard way to
  // get the directory where the EXE resides.
  try
    FLogFileName := ALogName;
    FLogDirectoryPath := TPath.Combine(
      TPath.GetDirectoryName(
        ExtractFilePath(Application.ExeName)),
      'log');

    // 2. Set the file name and full path
    FFullPath := TPath.Combine(
      FLogDirectoryPath,
      FLogFileName);

    // 3. Ensure the directory exists before any writing occurs
    EnsureLogDirectoryCreated;
  except
    On E: Exception do
      RecordError('Log path could not be prepared (' + E.ClassName + '): ' + E.Message);
  end;

  // 4. Prepare a per-user fallback so logging survives a read-only or
  //    missing primary directory on the customer machine.
  try
    FFallbackPath := BuildFallbackPath;
  except
    On E: Exception do begin
      FFallbackPath := '';
      RecordError('Fallback log path could not be prepared: ' + E.Message);
    end;
  end;
end;

destructor TSimpleLogger.Destroy;
begin
  // Cleanup is minimal since we are only writing to a file,
  // but it's good practice to handle resource cleanup here.
  // FreeAndNil also covers the case where Create never allocated the lock.
  FreeAndNil(FLock);
  inherited;
end;

procedure TSimpleLogger.EnsureLogDirectoryCreated;
var
  LDirPath: String;
begin
  LDirPath := TPath.GetDirectoryName(FFullPath);

  // Check if the directory needs to be created
  if Not(TDirectory.Exists(LDirPath)) then begin
    try
      TDirectory.CreateDirectory(LDirPath);
    except
      on E:Exception do
        RecordError('Log directory could not be created (' + LDirPath + '): ' + E.Message);
    end;
  end;
end;

procedure TSimpleLogger.SetErrorMsg(const Value: String);
begin
  FErrorMsg := Value;
end;

procedure TSimpleLogger.SetHasErrors(const Value: Boolean);
begin
  FHasErrors := Value;
end;

procedure TSimpleLogger.RecordError(const AMsg: String);
begin
  FHasErrors := True;
  FErrorMsg := AMsg;
end;

function TSimpleLogger.BuildFallbackPath: String;
var
  LBaseDir: String;
  LAppName: String;
  LDirPath: String;
begin
  Result := '';

  LBaseDir := System.SysUtils.GetEnvironmentVariable('LOCALAPPDATA');
  if LBaseDir = '' then
    LBaseDir := System.SysUtils.GetEnvironmentVariable('TEMP');
  if LBaseDir = '' then
    LBaseDir := TPath.GetHomePath;
  if LBaseDir = '' then
    Exit;

  LAppName := ChangeFileExt(ExtractFileName(Application.ExeName), '');
  if LAppName = '' then
    LAppName := 'Application';

  Result := TPath.Combine(
    TPath.Combine(
      TPath.Combine(LBaseDir, LAppName),
      'log'),
    FLogFileName);

  LDirPath := TPath.GetDirectoryName(Result);
  if not TDirectory.Exists(LDirPath) then
    TDirectory.CreateDirectory(LDirPath);
end;

function TSimpleLogger.TryAppend(const APath, AText: String): Boolean;
var
  LDirPath: String;
begin
  Result := False;
  if APath = '' then
    Exit;

  try
    LDirPath := TPath.GetDirectoryName(APath);
    if (LDirPath <> '') and (not TDirectory.Exists(LDirPath)) then
      TDirectory.CreateDirectory(LDirPath);

    TFile.AppendAllText(APath, sLineBreak + AText);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TSimpleLogger.LogToEventLog(
  const ALevel: TLogLevel;
  const AMsg: String);
var
  LHandle: THandle;
  LSource: String;
  LType: WORD;
  LStrings: array[0..0] of PWideChar;
begin
  try
    LSource := ChangeFileExt(ExtractFileName(Application.ExeName), '');
    if LSource = '' then
      LSource := 'Application';

    LHandle := RegisterEventSourceW(nil, PWideChar(LSource));
    if LHandle = 0 then
      Exit;

    try
      case ALevel of
        llDebug, llInfo: LType := EVENTLOG_INFORMATION_TYPE;
        llWarning:       LType := EVENTLOG_WARNING_TYPE;
      else
        LType := EVENTLOG_ERROR_TYPE;
      end;

      LStrings[0] := PWideChar(AMsg);
      ReportEventW(LHandle, LType, 0, 1, nil, 1, 0, @LStrings, nil);
    finally
      DeregisterEventSource(LHandle);
    end;
  except
    // A failing event log must never take the application down.
  end;
end;

procedure TSimpleLogger.WriteLog(
  const ALevel: TLogLevel;
  const AMsg: String);
var
  LTimeStampStr: String;
  LLevelStr: String;
  LLogEntry: String;
  LWritten: Boolean;
begin
  // 1. Format Timestamp: e.g., 2023-10-27 14:30:15
  LTimeStampStr := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);

  // 2. Get formatted level string
  LLevelStr := LogLevelToString(ALevel);

  // 3. Combineinto the required format: [Timestamp] [LogLevel] Message
  LLogEntry := Format(
    '[%s] [%s], %s',
    [LTimeStampStr, LLevelStr, AMsg]);

  // 4. Write through the sink chain below. Nothing here may raise and
  //    nothing here may show a dialog: WriteLog is called from worker
  //    threads and from inside exception handlers.
  if FLock <> nil then
    FLock.Enter;
  try
    try
      LWritten := False;

      // Primary sink: the configured log file.
      if not FUseFallback then
      begin
        if TryAppend(FFullPath, LLogEntry) then
          LWritten := True
        else
          // Remember the failure; retrying a read-only path on every line
          // would only cost one exception per log entry.
          FUseFallback := True;
      end;

      // Fallback sink: a per-user directory that is always writable.
      if (not LWritten) and (FFallbackPath <> '') then
        LWritten := TryAppend(FFallbackPath, LLogEntry);

      // Last resort: there is no debugger on the customer machine, so the
      // entry goes to the Windows Application event log. OutputDebugString
      // remains a signal for development machines only.
      if not LWritten then
      begin
        try
          RecordError('Log entry could not be written to: ' + FFullPath);
          OutputDebugString(PChar(LLogEntry));
          if Ord(ALevel) >= Ord(llError) then
            LogToEventLog(ALevel, LLogEntry);
        except
          // Still no raising: this code also runs inside exception handlers,
          // where a new exception would hide the original one.
        end;
      end;
    except
      try
        RecordError('Log entry could not be written to: ' + FFullPath);
        OutputDebugString(PChar(LLogEntry));
        if Ord(ALevel) >= Ord(llError) then
          LogToEventLog(ALevel, LLogEntry);
      except
        // Still no raising: this code also runs inside exception handlers,
        // where a new exception would hide the original one.
      end;
    end;
  finally
    if FLock <> nil then
      FLock.Leave;
  end;
end;

end.
