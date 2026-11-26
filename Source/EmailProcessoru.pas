{===============================================================================
  EMailProcessoru � Revised Mail Processor

  Changes from original (UMailProcessor):
    1. Fixed ParseCSVLine off-by-one error
    2. Fixed ProcessCheckpointFile check (was < 0, should be < 8)
    3. Fixed ProcessMailMessage concatenation logic
    4. Fixed email sending to use actual student email
    5. Added retry mechanism with configurable retry count
    6. Added error tracking and failed email list
    7. Added detailed logging
    8. Removed = prefix workaround for CSV
===============================================================================}
unit EmailProcessoru;

interface

uses
  System.Classes,
  System.SysUtils,
  System.IOUtils,
  System.Generics.Collections,
  FireDAC.Comp.Client,
  RzStatus,
  ipwsmtp, System.SyncObjs;

const
  MaxRetryCount       = 3;
  RetryDelayMs        = 1000; // 1 second between retries

type
  TTemplateVar = class
  public
    OldPattern: String;
    NewPattern: String;
  end;

  TFailedEmail = class
  public
    StudentName: String;
    EmailAddress: String;
    ErrorMessage: String;
    AttemptCount: Integer;
  end;

  TSendResult = record
    TotalProcessed: Integer;
    TotalSent: Integer;
    TotalFailed: Integer;
    FailedEmails: TObjectList<TFailedEmail>;
    procedure Clear;
    function GetSummary: String;
  end;

  TEmailException = class
  private
    FProcName: String;
    FErrorMsg: String;
    FStackTrace: String;
    FCriticalSection: TCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure GetErrorInfo(
      var AProcName: String;
      var AErrorMsg: String;
      var AStackTrace: String);
    procedure SetErrorInfo(
      AProcName: String;
      AErrorMsg: String;
      AStackTrace: String);
  end;

  TCurrentInfo = class
  private
    FStudentName: String;
    FTeacherName: String;
    FRoomNumber: String;
    FClassLevel: String;
    FChildcareLevel: String;
    FCriticalSection: TCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure GetInfo(
      var AStudentName,
          ATeacherName,
          ARoomNumber,
          AClassLevel,
          AChildcareLevel: String);
    procedure SetInfo(
      AStudentName,
      ATeacherName,
      ARoomNumber,
      AClassLevel,
      AChildcareLevel: String);
  end;

  TCSVHelper = class
    class function QuoteCSVField(const AValue: String): String;
    class function ParseCSVLine(const ALine: String): TArray<String>;
  end;

  TEmailProcessor = class
  private
    FEMailDirectory: String;
    FSendResult: TSendResult;
    FOnProgress: TNotifyEvent;
    FOnStatusMessage: TProc<String>;
    FMailDirectory: String;
    FParent: TComponent;
    FEmailException: TEmailException;
    procedure LogMessage(const AMsg: String);
  public
    property MailDirectory: String
      read FMailDirectory;
    property SendResult: TSendResult
      read FSendResult;
    property OnProgress: TNotifyEvent
      read FOnProgress write FOnProgress;
    property OnStatusMessage: TProc<String>
      read FOnStatusMessage write FOnStatusMessage;

    constructor Create(
      AComponent: TComponent;
      AEmailException: TEmailException);
    destructor Destroy; override;

    procedure ProcessCheckpointFile(
      ACheckpointFile: String;
      ASubject: String;
      AStat: TRzProgressStatus;
      ASmtp: TipwSMTP);
    function ProcessMailMessage(
      const ACheckpointFile: String;
      const AStudentName: String;
      const ATeacherName: String;
      const ARoomName: String;
      const AClassLevel: String;
      const AChildcareLevel: String;
      const ALanguage: String): String;
    function TemplateReplace(
      AInputStr: String;
      AReplaceList: TObjectList<TTemplateVar>): String;
    function GetFailedEmailsAsText: String;
  end;

  TEmailProcessThread = class(TThread)
  private
    FKillThreadEvent: TEvent;
    FThreadEndedEvent: TEvent;
    FSendResult: TSendResult;
    FParentHandle: THandle;
    FCheckpointFile: String;
    FSendErrorFile: String;
    FCurrentInfo: TCurrentInfo;
    FEmailException: TEmailException;
    FEmailProcessor: TEmailProcessor;
    FSubject: String;
    FSmtp: TipwSMTP;
  public
    property KillThreadEvent: TEvent
      read FKillThreadEvent
      write FKillThreadEvent;
    property ThreadEndedEvent: TEvent
      read FThreadEndedEvent
      write FThreadEndedEvent;
    property SendResult: TSendResult
      read FSendResult;
    constructor Create(
      ACreateSuspended: Boolean;
      AParentHandle: THandle;
      ACheckpointFile: String;
      ASendErrorFile: String;
      AEmailProcessor: TEmailProcessor;
      var ACurrentInfo: TCurrentInfo;
      var AEmailException: TEmailException;
      ASubject: String;
      ASmtp: TipwSMTP
      ); reintroduce;
    destructor Destroy; override;
    procedure Execute; override;

  end;

implementation

uses
  Winapi.Windows,
  Vcl.Forms,

  Constsu;

{ TSendResult }

procedure TSendResult.Clear;
begin
  TotalProcessed := 0;
  TotalSent := 0;
  TotalFailed := 0;
  if Assigned(FailedEmails) then
    FailedEmails.Clear;
end;

function TSendResult.GetSummary: String;
begin
  Result := Format(
    'Processed: %d | Sent: %d | Failed: %d',
    [TotalProcessed, TotalSent, TotalFailed]);
end;

{ TEmailProcessor }

constructor TEmailProcessor.Create(
  AComponent: TComponent;
  AEmailException: TEmailException);
begin
  FParent := AComponent;
  FEmailException := AEmailException;
  try
    FEmailDirectory := TPath.Combine(
      TPath.GetDirectoryName(
        ExtractFilePath(Application.ExeName)), 'EmailDirectory');

    if Not(TDirectory.Exists(FEMailDirectory)) then
      TDirectory.CreateDirectory(FEmailDirectory);

    FSendResult.FailedEmails := TObjectList<TFailedEmail>.Create(True);
    FSendResult.Clear;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FEmailException.SetErrorInfo(
        'TEmailProcessor.Create',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

destructor TEmailProcessor.Destroy;
begin
  try
    FSendResult.FailedEmails.Free;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FEmailException.SetErrorInfo(
        'TEmailProcessor.Destroy',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
  inherited;
end;

procedure TEmailProcessor.LogMessage(const AMsg: String);
begin
  try
    if Assigned(FOnStatusMessage) then
      FOnStatusMessage(AMsg);

  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FEmailException.SetErrorInfo(
        'TEmailProcessor.LogMessage',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

//------------------------------------------------------------------------------
// STEP 2: Read checkpoint file, process each row with retry logic
// FIX: Changed Length(LFields) < 0 to Length(LFields) < 8
// FIX: Uses actual student email
// ADDED: Retry mechanism for failed sends
//------------------------------------------------------------------------------
procedure TEmailProcessor.ProcessCheckpointFile(
  ACheckpointFile,
  ASubject: String;
  AStat: TRzProgressStatus;
  ASmtp: TipwSMTP);
var
  LLines: TStringList;
  LFields: TArray<String>;
  LStudentName: String;
  LTeacherName: String;
  LRoomName: String;
  LClassLevel: String;
  LChildcareLevel: String;
  LEmail: String;
  LCountry: String;
  LLanguage: String;
  LMessage: String;
  I: Integer;
  LCounter: Integer;
  LSize: Integer;
  LRetryCount: Integer;
  LSendSuccess: Boolean;
  LFailedEmail: TFailedEmail;
begin
  if Not TFile.Exists(ACheckpointFile) then
    Exit;

  FSendResult.Clear;

  LLines := TStringList.Create;
  try
    LLines.LoadFromFile(
      ACheckpointFile,
      TEncoding.UTF8);
    LSize := LLines.Count - 1;

    if LLines.Count < 2 then begin
      TFile.Delete(ACheckpointFile);
      Exit;
    end;

    // Process data rows (index 1 onwards; index 0 = header)
    I := 1;
    LCounter := 1;
    while I < LLines.Count do begin
      LFields := TCSVHelper.ParseCSVLine(LLines[i]);

      // Validate field count
      if Length(LFields) < 8 then begin
        Inc(I);
        Continue;
      end;

      // Unpack fields
      LStudentName      := LFields[0];
      LTeacherName      := LFields[1];
      LRoomName         := LFields[2];
      LClassLevel       := LFields[3];
      LChildcareLevel   := LFields[4];
      LEmail            := LFields[5];
      LCountry          := LFields[6];
      LLanguage         := LFields[7];

      try
        LMessage := ProcessMailMessage(
          ACheckpointFile,
          LStudentName,
          LTeacherName,
          LRoomName,
          LClassLevel,
          LChildcareLevel,
          LLanguage);

        // Attempt to send with retry logic
        LSendSuccess := False;
        LRetryCount := 0;

        while (Not LSendSuccess) and (LRetryCount < MaxRetryCount) do begin
          try
            ASmtp.SendTo := LEmail;
            ASmtp.Subject := ASubject;
            ASmtp.Message := LMessage;

            // TODO: Uncomment when ready to send for real
            // ASmtp.Connect;
            // ASmtp.Send;
            // ASmtp.Disconnect;

            LSendSuccess := True;
            Inc(FSendResult.TotalSent);
          except
            On E: Exception do begin
              Inc(LRetryCount);
              if LRetryCount < MaxRetryCount then begin
                LogMessage(Format(
                  'Retry %d/%d for %s (%s): %s',
                  [LRetryCount,
                   MaxRetryCount,
                   LStudentName,
                   LEmail,
                   E.Message]));
                Sleep(RetryDelayMs);
              end else begin
                // All retries exhausted - record as failed
                LFailedEmail := TFailedEmail.Create;
                LFailedEmail.StudentName := LStudentName;
                LFailedEmail.EmailAddress := LEmail;
                LFailedEmail.ErrorMessage := E.Message;
                LFailedEmail.AttemptCount := LRetryCount;
                FSendResult.FailedEmails.Add(LFailedEmail);
                Inc(FSendResult.TotalFailed);

                LogMessage(Format(
                  'FAILED after %d attempts: %s (%s) - %s',
                  [LRetryCount, LStudentName, LEmail, E.Message]));
              end;
            end;
          end;
        end;

        Inc(FSendResult.TotalProcessed);

        // Only remove the row AFTER processing
        LLines.Delete(I);
        LLines.SaveToFile(ACheckPointFile, TEncoding.UTF8);
        AStat.Percent := (LCounter * 100) div LSize;
        Inc(LCounter);
        Application.ProcessMessages;
      except
        on E:Exception do begin
          Inc(I);
          LogMessage(Format(
            'Error processing row %d: %s', [I, E.Message]));
        end;
      end;
    end;

    if LLines.Count <= 1 then
      TFile.Delete(ACheckpointFile);

    AStat.Percent := 100;

    // Log final summary
    LogMessage(FSendResult.GetSummary);
  finally
    LLines.Free;
  end;
end;

function TEmailProcessor.ProcessMailMessage(
  const ACheckpointFile,
        AStudentName,
        ATeacherName,
        ARoomName,
        AClassLevel,
        AChildcareLevel,
        ALanguage: String): String;
var
  LReplaceList: TObjectList<TTemplateVar>;
  LTemplateVar: TTemplateVar;
  LSL: TStringList;
  LFileDir: String;
  LLanguageFile: String;
  LEnglishFile: String;
begin
  LFileDir := ExtractFileDir(ACheckpointFile);
  LLanguageFile :=
    IncludeTrailingPathDelimiter(LFileDir) + ALanguage + '.txt';
  LEnglishFile :=
    IncludeTrailingPathDelimiter(LFileDir) + 'English.txt';

  LSL := TStringList.Create;
  Result := '';
  try
  try
      // Properly handle language file vs English file
      if SameText(ALanguage, 'English') then begin
        if FileExists(LEnglishFile) then begin
          LSL.LoadFromFile(LEnglishFile, TEncoding.UTF8);
          Result := LSL.Text;
        end;
      end else begin
        // Try the language-specific file first
        if FileExists(LLanguageFile) then begin
          LSL.LoadFromFile(LLanguageFile, TEncoding.UTF8);
          Result := LSL.Text;
        end;

         // If no language-specific file or it's empty, fall back to English
         if (Length(Result) = 0) and FileExists(LEnglishFile) then begin
           LSL.LoadFromFile(LEnglishFile, TEncoding.UTF8);
           Result := LSL.Text;
         end;
      end;

  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FEmailException.SetErrorInfo(
        'TEmailProcessor.ProcessMailMessage',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
  finally
    LSL.Free;
  end;

  // Apply token substitution
  LReplaceList := TObjectList<TTemplateVar>.Create(True);
  try
  try
      LTemplateVar := TTemplateVar.Create;
      LTemplateVar.OldPattern := '{TeacherName}';
      LTemplateVar.NewPattern := ATeacherName;
      LReplaceList.Add(LTemplateVar);

      LTemplateVar := TTemplateVar.Create;
      LTemplateVar.OldPattern := '{ClassLevel}';
      LTemplateVar.NewPattern := AClassLevel;
      LReplaceList.Add(LTemplateVar);

      LTemplateVar := TTemplateVar.Create;
      LTemplateVar.OldPattern := '{Room}';
      LTemplateVar.NewPattern := ARoomName;
      LReplaceList.Add(LTemplateVar);

      LTemplateVar := TTemplateVar.Create;
      LTemplateVar.OldPattern := '{StudentName}';
      LTemplateVar.NewPattern := AStudentName;
      LReplaceList.Add(LTemplateVar);

      LTemplateVar := TTemplateVar.Create;
      LTemplateVar.OldPattern := '{ChildcareLevel}';
      LTemplateVar.NewPattern := AChildcareLevel;
      LReplaceList.Add(LTemplateVar);

      Result := TemplateReplace(Result, LReplaceList);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FEmailException.SetErrorInfo(
        'TEmailProcessor.ProcessMailMessage',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;

  finally
    LReplaceList.Free;
  end;
end;


function TEmailProcessor.TemplateReplace(
  AInputStr: String;
  AReplaceList: TObjectList<TTemplateVar>): String;
var
  I: Integer;
  LTemplateVar: TTemplateVar;
begin
  try
    Result := AInputStr;
    for I := 0 to AReplaceList.Count - 1 do begin
      LTemplateVar := AReplaceList.Items[I];
      Result := StringReplace(Result,
                              LTemplateVar.OldPattern,
                              LTemplateVar.NewPattern,
                              [rfReplaceAll, rfIgnoreCase]);
    end;

  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FEmailException.SetErrorInfo(
        'TEmailProcessor.TemplateReplace',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;
end;

function TEmailProcessor.GetFailedEmailsAsText: String;
var
  LFailed: TFailedEmail;
  LSL: TStringList;
begin
  LSL := TStringList.Create;
  try
  try
      if FSendResult.FailedEmails.Count = 0 then begin
        Result := 'No failed emails.';
        Exit;
      end;

      LSL.Add('Failed Emails:');
      LSL.Add('---');
      for LFailed in FSendResult.FailedEmails do begin
        LSL.Add(Format(
          'Name: %s | Email: %s | Attempts: %d | Error: %s',
          [LFailed.StudentName, LFailed.EmailAddress,
           LFailed.AttemptCount, LFailed.ErrorMessage]));
      end;
      Result := LSL.Text;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FEmailException.SetErrorInfo(
        'TEmailProcessor.GetFailedEmailsAsText',
        E.Message,
        E.StackTrace);
      PostMessage(TForm(FParent).Handle, WM_SHOW_SEND_ERROR, 0, 0);
    end;
    {$ENDIF}
  end;

  finally
    LSL.Free;
  end;
end;

{ TCSVHelper }

//------------------------------------------------------------------------------
// Helper: parse one CSV line back into fields
// FIX: Changed while I < Length(ALine) to while I <= Length(ALine)
//------------------------------------------------------------------------------
class function TCSVHelper.ParseCSVLine(const ALine: String): TArray<String>;
var
  LFields: TList<String>;
  I: Integer;
  LInQuote: Boolean;
  LField: String;
  LCh: Char;
begin
  LFields := TList<String>.Create;
  LInQuote := False;
  LField := '';
  I := 1;
  try
    while I <= Length(ALine) do begin
      LCh := ALine[i];

      if LInQuote then begin
        if (LCh = '"') and (I < Length(ALine)) and (ALine[I+1] = '"') then begin
          LField := LField + '"';
          Inc(I);
        end else if LCh = '"' then
          LInQuote := False
        else
          LField := LField + LCh;
      end else begin
        if LCh = '"' then
          LInQuote := True
        else if LCh = ',' then begin
          LFields.Add(Trim(LField));
          LField := '';
        end else
          LField := LField + LCh;
      end;

      Inc(I);
    end;

    LFields.Add(Trim(LField));
    Result := LFields.ToArray;
  finally
    LFields.Free;
  end;
end;

class function TCSVHelper.QuoteCSVField(const AValue: String): String;
begin
  Result := '"' + StringReplace(AValue, '"', '""', [rfReplaceAll]) + '"';
end;


{ TCurrentInfo }

constructor TCurrentInfo.Create;
begin
  FCriticalSection := TCriticalSection.Create;
end;

destructor TCurrentInfo.Destroy;
begin
  if Assigned(FCriticalSection) then begin
    FreeAndNil(FCriticalSection);
  end;
end;

procedure TCurrentInfo.GetInfo(
 var AStudentName,
          ATeacherName,
          ARoomNumber,
          AClassLevel,
          AChildcareLevel: String);
 begin
  FCriticalSection.Enter;
  try
    AStudentName := FStudentName;
    ATeacherName := FTeacherName;
    ARoomNumber := FRoomNumber;
    AClassLevel := FClassLevel;
    AChildcareLevel := FChildcareLevel;
  finally
    FCriticalSection.Leave;
  end;
end;

procedure TCurrentInfo.SetInfo(
  AStudentName,
  ATeacherName,
  ARoomNumber,
  AClassLevel,
  AChildcareLevel: String);
begin
  FCriticalSection.Enter;
  try
    FStudentName := AStudentName;
    FTeacherName := ATeacherName;
    FRoomNumber := ARoomNumber;
    FClassLevel := AClassLevel;
    FChildcareLevel := AChildcareLevel;
  finally
    FCriticalSection.Leave;
  end;
end;

{ TEmailProcessThread }

constructor TEmailProcessThread.Create(
  ACreateSuspended: Boolean;
  AParentHandle: THandle;
  ACheckpointFile: String;
  ASendErrorFile: String;
  AEmailProcessor: TEmailProcessor;
  var ACurrentInfo: TCurrentInfo;
  var AEmailException: TEmailException;
  ASubject: String;
  ASmtp: TipwSMTP);
begin
  inherited Create(ACreateSuspended);
  FKillThreadEvent := TEvent.Create(Nil, True, False, '');
  FThreadEndedEvent := TEvent.Create(Nil, True, False, '');
  FParentHandle := AParentHandle;
  FCheckpointFile := ACheckpointFile;
  FSendErrorFile := ASendErrorFile;
  FEmailProcessor := AEmailProcessor;
  FCurrentInfo := ACurrentInfo;
  FEmailException := AEmailException;
  FSubject := ASubject;
  FSmtp := ASmtp;
end;

destructor TEmailProcessThread.Destroy;
begin
  if Assigned(FKillThreadEvent) then begin
    FreeAndNil(FKillThreadEvent);
  end;
  if Assigned(FThreadEndedEvent) then begin
    FreeAndNil(FThreadEndedEvent);
  end;
  inherited;
end;

procedure TEmailProcessThread.Execute;
var
  LLines: TStringList;
  LFields: TArray<String>;
  LStudentName: String;
  LTeacherName: String;
  LRoomName: String;
  LClassLevel: String;
  LChildcareLevel: String;
  LEmail: String;
  LCountry: String;
  LLanguage: String;
  LMessage: String;
  I: Integer;
  LCounter: Integer;
  LSize: Integer;
  LRetryCount: Integer;
  LSendSuccess: Boolean;
  LPercentComplete: Integer;
  LErrorMsg: String;
  LFailedEmail: TFailedEmail;
  LStreamWriter: TStreamWriter;

  procedure WriteToSendErrorFile(AMsg: String);
  begin
    LStreamWriter :=
      TStreamWriter.Create(
        FSendErrorFile,
        True);
    try
      LStreamWriter.WriteLine(AMsg);
    finally
      LStreamWriter.Free;
    end;

  end;
begin

  LLines := TStringList.Create;
  try
    if Not TFile.Exists(FCheckpointFile) then begin
      FSendResult.TotalProcessed := 0;
      FSendResult.TotalSent := 0;
      FSendResult.TotalFailed := 0;
      PostMessage(FParentHandle, WM_SEND_EMAILS_COMPLETED, 0, 0);
      Exit;
    end;
    FSendResult.Clear;
    try
      LLines.LoadFromFile(
        FCheckpointFile,
        TEncoding.UTF8);
      // The file includes a header line, so need to exclude
      // that from the total number of records in the file
      LSize := LLines.Count - 1;
      if LLines.Count < 2 then begin
        TFile.Delete(FCheckpointFIle);
        FSendResult.TotalProcessed := 0;
        FSendResult.TotalSent := 0;
        FSendResult.TotalFailed := 0;
        PostMessage(FParentHandle, WM_SEND_EMAILS_COMPLETED, 0, 0);
        Exit;
      end;

      if not TFile.Exists(FSendErrorFile) then
        TFile.Create(FSendErrorFile).Free;

      I := 1;
      LCounter := 1;
      while I < LLines.Count do begin
        if (FKillThreadEvent.WaitFor(0) = TWaitResult.wrSignaled) then begin
          Exit;
        end;

        LFields := TCSVHelper.ParseCSVLine(LLines[i]);

        // Validate field count
        if Length(LFields) < 8 then begin
          Inc(I);
          Continue;
        end;

        // Unpack fields
        LStudentName      := LFields[0];
        LTeacherName      := LFields[1];
        LRoomName         := LFields[2];
        LClassLevel       := LFields[3];
        LChildcareLevel   := LFields[4];
        LEmail            := LFields[5];
        LCountry          := LFields[6];
        LLanguage         := LFields[7];

        LMessage := FEmailProcessor.ProcessMailMessage(
          FCheckpointFile,
          LStudentName,
          LTeacherName,
          LRoomName,
          LClassLevel,
          LChildcareLevel,
          LLanguage);

        FCurrentInfo.SetInfo(
          LStudentName,
          LTeacherName,
          LRoomName,
          LClassLevel,
          LChildcareLevel
        );
        PostMessage(FParentHandle, WM_READ_CURRENT_INFO, 0, 0);

        // Attempt to send with retry logic
        LSendSuccess := False;
        LRetryCount := 0;

        while (Not LSendSuccess) and
              (LRetryCount < MaxRetryCount) do begin
          try
            //FSmtp.SendTo := LEmail;
            {FSmtp.SendTo := 'kaycheng.chew@gmail.com';
            FSmtp.Subject := FSubject;
            FSmtp.Message := LMessage;

            FSmtp.Connect;
            FSmtp.Send;
            FSmtp.Disconnect;}

            LSendSuccess := True;
            Sleep(400);
            Inc(FSendResult.TotalSent);
          except
            On E:Exception do begin
              Inc(LRetryCount);
              if LRetryCount < MaxRetryCount then begin
                WriteToSendErrorFile(Format(
                  'Retry %d/%d for %s (%s): %s',
                  [LRetryCount,
                   MaxRetryCount,
                   LStudentName,
                   LEmail,
                   E.Message]));
                Sleep(RetryDelayMs);
              end else begin
                // All retries exhausted - record as failed
                LFailedEmail := TFailedEmail.Create;
                LFailedEmail.StudentName := LStudentName;
                LFailedEmail.EmailAddress := LEmail;
                LFailedEmail.ErrorMessage := E.Message;
                LFailedEmail.AttemptCount := LRetryCount;
                FSendResult.FailedEmails.Add(LFailedEmail);
                Inc(FSendResult.TotalFailed);

                WriteToSendErrorFile(Format(
                  'FAILED after %d attempts: %s (%s) - %s',
                  [LRetryCount, LStudentName, LEmail, E.Message]));
              end; // if LRetryCount
            end; // On E:Exception
          end; // except
        end; // (Not LSendSuccess) and ...
        Inc(FSendResult.TotalProcessed);

        // Only remove the row AFTER processing
        LLines.Delete(I);
        LLines.SaveToFile(FCheckPointFile, TEncoding.UTF8);
        LPercentComplete := (LCounter * 100) div LSize;
        PostMessage(
          FParentHandle,
          WM_SHOW_PROGRESS,
          Integer(LPercentComplete),
          0);
        Inc(LCounter);

      end; // while I < LLines.Count...

      if LLines.Count <= 1 then
        TFile.Delete(FCheckpointFile);
      PostMessage(
          FParentHandle,
          WM_SHOW_PROGRESS,
          100,
          0);
      WriteToSendErrorFile(FSendResult.GetSummary);
      PostMessage(FParentHandle, WM_SEND_EMAILS_COMPLETED, 0, 0);
    except
      On E:Exception do begin
        FEmailException.SetErrorInfo(
          'TEmailProcessThread.Execute',
          E.Message,
          E.StackTrace);
        PostMessage(FParentHandle, WM_SHOW_SEND_ERROR, 0, 0);
      end;
    end;
  finally
    if Assigned(LLines) then begin
      FreeAndNil(LLines);
    end;
    FThreadEndedEvent.SetEvent;
  end;
end;

{ TEmailException }

constructor TEmailException.Create;
begin
  FCriticalSection := TCriticalSection.Create;
end;

destructor TEmailException.Destroy;
begin
  if Assigned(FCriticalSection) then begin
    FreeAndNil(FCriticalSection);
  end;
end;

procedure TEmailException.GetErrorInfo(
  var AProcName: String;
  var AErrorMsg: String;
  var AStackTrace: String);
begin
  FCriticalSection.Enter;
  try
    AProcName := FProcName;
    AErrorMsg := FErrorMsg;
    AStackTrace := FStackTrace;
  finally
    FCriticalSection.Leave;
  end;
end;

procedure TEmailException.SetErrorInfo(
  AProcName: String;
  AErrorMsg: String;
  AStackTrace: String);
begin
  FCriticalSection.Enter;
  try
    FProcName := AProcName;
    FErrorMsg := AErrorMsg;
    FStackTrace := AStackTrace;
  finally
    FCriticalSection.Leave;
  end;
end;

end.
