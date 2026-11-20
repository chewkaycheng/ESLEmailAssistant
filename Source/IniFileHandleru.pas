unit IniFileHandleru;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IOUtils,
  System.IniFiles,
  Data.DB,
  PhaSecurity,

  Constsu;

type
  TAppIniValues = record
    DarkMode: Boolean;
  end;

  TESLAdminIniValues = record
    ApplicationName: String;
    Server: String;
    Database: String;
    Username: String;
    Userpass: String;
    NATag: String;
    DateFormat: String;
    TimeFormat: String;
    IOHandler: String;
    Host: String;
    Port: Integer;
    EmlUsername: String;
    EmlPassword: String;
    ClientId: String;
    ClientSecret: String;
    UseTLS: String;
    Convenience: Boolean;
  end;

  TSessionIniValues = record
    SendEmailsInitiated: Boolean;
    SelectedStudent: String;
    RecipientType: TRecipientType;
    Subject: String;
  end;

  TAppIniFileHandler = class
  private
    FAppIniFile: TIniFile;
  public
    IniValues: TAppIniValues;

    constructor Create(AFullAppIniFileName: String); reintroduce;
    destructor Destroy; override;

    procedure ReadAppIniValues;
    procedure WriteAppIniValues;
  end;

  TESLAdminIniFileHandler = class
  private
    FESLAdminIniValues: TESLAdminIniValues;
    FESLAdminIniFile: TIniFile;
    FSecurity: TPhaSecurity;
  public
    property IniValues: TESLAdminIniValues
      read FESLAdminIniValues;

    constructor Create;
    destructor Destroy; override;

    function ReadESLAdminIniValues: Boolean;
  end;

  TSessionIniFileHandler = class
  private
    FSessionIniFile: TIniFile;
    FIniValues: TSessionIniValues;
  public
    property IniValues: TSessionIniValues
      read FIniValues
      write FIniValues;

    constructor Create(AFullSesionIniFileName: String); reintroduce;
    destructor Destroy; override;

    procedure ReadIniValues;
    procedure WriteSessionIniValues;

  end;
implementation

uses
  WinApi.Windows,
  WinApi.ShlObj,
  Vcl.Dialogs,

  PhaUtils,
  PhaResourceStrings;

{ TAppIniFileHandler }

constructor TAppIniFileHandler.Create(AFullAppIniFileName: String);
begin
  inherited Create;
  FAppIniFile := TIniFile.Create(AFullAppIniFileName);
  ReadAppIniValues;
end;

destructor TAppIniFileHandler.Destroy;
begin
  if Assigned(FAppIniFile) then begin
    FreeAndNil(FAppIniFile);
  end;
  inherited;
end;

procedure TAppIniFileHandler.ReadAppIniValues;
begin
  IniValues.DarkMode := FAppIniFile.ReadBool(
    IniSettingsSection,
    IniDarkMode,
    False);
end;

procedure TAppIniFileHandler.WriteAppIniValues;
begin
  FAppIniFile.WriteBool(
    IniSettingsSection,
    IniDarkMode,
    IniValues.DarkMode);
end;

{ TESLAdminIniFileHandler }

constructor TESLAdminIniFileHandler.Create;
var
  LFullIniFileName        : String;
  LPath                   : array [0..1023] of Char;
  LAppExeName             : array [0..1023] of Char;
  LLocalAppData           : String;
begin
  FSecurity := TPhaSecurity.Create;
  GetModuleFileName(
    0,
    LAppExeName,
    sizeof(LAppExeName));
  SHGetFolderPath(
    0,
    CSIDL_LOCAL_APPDATA,
    0,
    SHGFP_TYPE_CURRENT,
    @LPath[0]);
  LLocalAppData := IncludeTrailingPathDelimiter(LPath) + ESLAdmin + '\';
  LFullIniFileName := LLocalAppData +  ESLAdmin + '.ini';
  if Not(FileExists(LFullIniFileName)) then begin
    raise Exception.Create(LFullIniFileName + ' does not exist');
  end;

  FESLAdminIniFile := TIniFile.Create(LFullIniFileName);
end;

destructor TESLAdminIniFileHandler.Destroy;
begin
  if Assigned(FSecurity) then begin
    FreeAndNil(FSecurity);
  end;
  if Assigned(FESLAdminIniFile) then
    FreeAndNil(FESLAdminIniFile);

  inherited;
end;

function TESLAdminIniFileHandler.ReadESLAdminIniValues: Boolean;
var
  LEncryptedUsername      : String;
  LEncryptedUserpass      : String;
  LEncryptedConv          : String;
  LEncryptedClientID      : String;
  LEncryptedClientSecret  : String;
begin
  FESLAdminIniValues.Server     := FESLAdminIniFile.ReadString(
    IniDatabaseSection, IniServer, IniServerDefault);
  FESLAdminIniValues.Database   := FESLAdminIniFile.ReadString(
    IniDatabaseSection, IniDatabase, '');
  LEncryptedUsername       := FESLAdminIniFile.ReadString(
    IniDatabaseSection, IniParam2, '');
  LEncryptedConv           := FESLAdminIniFile.ReadString(
    IniDatabaseSection, IniConv, '');
  if FSecurity.Decode(LEncryptedConv) = IniConvenience then begin
    FESLAdminIniValues.Convenience := True;
  end else begin
    FESLAdminIniValues.Convenience := False;
  end;

  FESLAdminIniValues.Username
    := FSecurity.Decode(LEncryptedUsername);
  LEncryptedUserpass
    := FESLAdminIniFile.ReadString(
        IniDatabaseSection,
        IniParam1,
        '');
  FESLAdminIniValues.Userpass
    := FSecurity.Decode(LEncryptedUserpass);
  FESLAdminIniValues.NATag
    := FESLAdminIniFile.ReadString(
        IniImportSection,
        IniNATag,
        IniNATagDefault);
  FESLAdminIniValues.DateFormat
    := FESLAdminIniFile.ReadString(
        IniImportSection,
        IniDateFormat,
        IniDateFormatDefault);
  FESLAdminIniValues.TimeFormat
    := FESLAdminIniFile.ReadString(
        IniImportSection,
        IniTimeFormat,
        IniTimeFormatDefault);
  FESLAdminIniValues.IOHandler
    := FESLAdminIniFile.ReadString(
        IniEmailSection,
        IniIOHandler,
        '');
  FESLAdminIniValues.Host
    := FESLAdminIniFile.ReadString(
        IniEmailSection,
        IniHost,
        '');
  FESLAdminIniValues.Port
    := FESLAdminIniFile.ReadInteger(
        IniEmailSection,
        IniPort,
        0);
  LEncryptedUsername
    := FESLAdminIniFile.ReadString(
        IniEmailSection,
        IniUsername,
        '');
  FESLAdminIniValues.EmlUsername
    := FSecurity.Decode(LEncryptedUsername);
  LEncryptedUserpass
    := FESLAdminIniFile.ReadString(
        IniEmailSection,
        IniPassword,
        '');
  FESLAdminIniValues.EmlPassword
    := FSecurity.Decode(LEncryptedUserpass);
  FESLAdminIniValues.UseTLS
    := FESLAdminIniFile.ReadString(
        IniEmailSection,
        IniUseTLS,
        '');
  LEncryptedClientID
    := FESLAdminIniFile.ReadString(
        IniEmailSection,
        IniClientID,
        '');
  FESLAdminIniValues.ClientId
    :=  FSecurity.Decode(LEncryptedClientID);
  LEncryptedClientSecret
    := FESLAdminIniFile.ReadString(
        IniEmailSection,
        IniClientSecret,
        '');
  FESLAdminIniValues.ClientSecret
    := FSecurity.Decode(LEncryptedClientSecret);
end;

{ TSessionIniFileHandler }

constructor TSessionIniFileHandler.Create(AFullSesionIniFileName: String);
begin
  inherited Create;
  FSessionIniFile := TIniFile.Create(AFullSesionIniFileName);
  ReadIniValues;
end;

destructor TSessionIniFileHandler.Destroy;
begin
  if Assigned(FSessionIniFile) then begin
    FreeAndNil(FSessionIniFile);
  end;
  inherited;
end;

procedure TSessionIniFileHandler.ReadIniValues;
var
  LValue: Integer;
begin
  FIniValues.SendEmailsInitiated :=
    FSessionIniFile.ReadBool(
      Settings,
      SendEmailInitiated,
      False);
  FIniValues.SelectedStudent :=
    FSessionIniFile.ReadString(
      Settings,
      SelectedStudent,
      '');
  FIniValues.Subject :=
    FSessionIniFile.ReadString(
      Settings,
      Subject,
      '');

  LValue := FSessionIniFile.ReadInteger(
    Settings, RecipientType, Integer(rtAllStudents));

    if LValue in
      [Integer(Low(TRecipientType))
        ..Integer(High(TRecipientType))] then begin
      FIniValues.RecipientType :=
        TRecipientType(LValue);
    end else begin
       FIniValues.RecipientType := rtAllStudents;
    end;
end;

procedure TSessionIniFileHandler.WriteSessionIniValues;
begin
  FSessionIniFile.WriteBool(
    Settings,
    SendEmailInitiated,
    IniValues.SendEmailsInitiated);
  FSessionIniFile.WriteString(
     Settings,
     SelectedStudent,
     IniValues.SelectedStudent);
  FSessionIniFile.WriteInteger(
    Settings,
    RecipientType,
    Integer(IniValues.RecipientType));
  FSessionIniFile.WriteString(
    Settings,
    Subject,
    IniValues.Subject);
end;

end.
