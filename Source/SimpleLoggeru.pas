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
    FErrorMsg: String;
    FHasErrors: Boolean;
    FLock: TCriticalSection;

    // private method to ensure the log directory exists
    procedure EnsureLogDirectoryCreated;
    procedure SetErrorMsg(const Value: String);
    procedure SetHasErrors(const Value: Boolean);
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
  FLock := TCriticalSection.Create;

  // 1. Determine the log directory path (Executable directory)
  // ExtractFilePath(Application.ExeName) is the standard way to
  // get the directory where the EXE resides.
  FLogDirectoryPath := TPath.Combine(
    TPath.GetDirectoryName(
      ExtractFilePath(Application.ExeName)),
    'log');

  // 2. Set the file name and full path
  FLogFileName := ALogName;
  FFullPath := TPath.Combine(
    FLogDirectoryPath,
    FLogFileName);

  // 3. Ensure the directory exists before any writing occurs
  EnsureLogDirectoryCreated;
end;

destructor TSimpleLogger.Destroy;
begin
  // Cleanup is minimal since we are only writing to a file,
  // but it's good practice to handle resource cleanup here.
  FLock.Free;
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
      on E:Exception do begin
        FHasErrors := True;
        FErrorMsg := E.Message;
      end;
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

procedure TSimpleLogger.WriteLog(
  const ALevel: TLogLevel;
  const AMsg: String);
var
  LTimeStampStr: String;
  LLevelStr: String;
  LLogEntry: String;
begin
  // 1. Format Timestamp: e.g., 2023-10-27 14:30:15
  LTimeStampStr := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);

  // 2. Get formatted level string
  LLevelStr := LogLevelToString(ALevel);

  // 3. Combineinto the required format: [Timestamp] [LogLevel] Message
  LLogEntry := Format(
    '[%s] [%s], %s',
    [LTimeStampStr, LLevelStr, AMsg]);

  // 4. Write to file (Appending automatically happens
  //    with TFileAppendAllTextFile
  FLock.Enter;
  try
    try
      TFile.AppendAllText(FFullPath, sLineBreak + LLogEntry);
    except
      on E:Exception do begin
        // ShowMessage is NOT thread-safe — do not call from here.
        // Use OutputDebugString if you want a debug-only signal.
        OutputDebugString(PChar('SimpleLogger.WriteLog failed: ' + E.Message));
      end;
    end;
  finally
    FLock.Leave;
  end;
end;

end.
