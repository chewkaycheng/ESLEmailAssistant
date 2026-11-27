unit Mainu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IniFiles,
  System.ImageList,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.Imaging.jpeg,
  Vcl.TitleBarCtrls,

  ipwsmtp,
  ipwcore,
  ipwtypes,
  ipwoauth,

  SVGIconImage,
  SVGIconImageListBase,
  SVGIconImageList,

  CWSSettingsPanel,
  CWSButton,
  CWSFluentColorsMulti,

  RzPanel,

  scControls,
  scGPControls,

  DMMainu,
  SimpleLoggeru,
  IniFileHandleru,
  Constsu, Messageu;

type
  TfrmMain = class(TForm)
    SVGimlSteps: TSVGIconImageList;
    SVGimlStepsDarkMode: TSVGIconImageList;
    brTitle: TTitleBarPanel;
    pnlMain: TCWSSettingsPanel;
    pnlImage: TCWSSettingsPanel;
    Image1: TImage;
    pnlContent: TPanel;
    pnlHeaders: TPanel;
    pnlSteps: TPanel;
    SVGimgSteps: TSVGIconImage;
    pnlTitle: TPanel;
    lblTitle: TLabel;
    btnTheme: TCWSButton;
    CWSSettingsPanel1: TCWSSettingsPanel;
    pnlContentForm: TPanel;
    iOAuthMain: TipwOAuth;
    ismtpMain: TipwSMTP;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnThemeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure iOAuthMainError(Sender: TObject; ErrorCode: Integer;
      const Description: string);
    procedure iOAuthMainLaunchBrowser(Sender: TObject; var URL,
      Command: string);
    procedure iOAuthMainReturnURL(Sender: TObject; const URLPath,
      QueryString: string; var ResponseHeaders, ResponseBody: string);
  private
    // Directory that contains the source files
    FFullSourceFilesDir: String;
    // Directory that contains the backup file directories
    FFullBackupFilesDir: String;
    // Checkpoint file - contains the recipients. As each emails are
    // sent the name is removed from this file. In case there is
    // an exception during email sending, the send function can be
    // reinitiated and the remaining recipients are read from
    // the checkpoint file.
    FFullCheckpointCSVFileName: String;
    // A CSV file that holds the countries that a user selects
    // in the Recipients form
    FFullRecipientsByCountriesCSVFileName: String;
    // A CSV file that holds the class levels thast a user selects
    // in the Recipients form
    FFullRecipientsByClassLevelsCSVFileName: String;
    // Full path of the session ini file name
    FFullSessionIniFileName: String;
    // Full path of the app ini file name
    FFullAppIniFileName: String;
    // Full path of the list for emails that have caused
    // an error during sending
    FFullSendErrorFileName: String;
    // App Ini File handler
    FAppIniFileHandler: TAppIniFileHandler;
    // ESLAdmin Ini File handler
    FESLAdminIniFileHandler: TESLAdminIniFileHandler;
    // Session Ini File handler
    FSessionIniFileHandler: TSessionIniFileHandler;
    // User has initiated email sending.
    FSendEmailInitated: Boolean;
    // Selected student in the Preview form
    FSelectedStudent: String;
    // Subject of the email in the Compose form
    // FSubject: String;
    // Selected file in the file list box in the Compose form
    FSelectedFile: String;
    // Indicates if the email authorization has been performed
    FIsAuthorized: Boolean;
    FDmMain: TDmMain;
    FLogger: TSimpleLogger;

    FAuthorizationErrorMsg: String;

    FDarkMode: Boolean;
    FActiveForm: TForm;
    FMessageForm: TfrmMessage;

    // Navigation
    procedure ShowChildForm(AForm: TForm);

    // Helper Methods
    procedure Initialize;
    procedure SetupPathsAndFileNames;
    procedure CreateFilesAndDirectories;
    procedure SetThemeBtnDarkMode;
    procedure SetThemeBtnLightMode;

    // Theming
    procedure ApplyTheme;

    // Give Self to the child forms
    procedure InitializeChildForms;

    // Set up Logger
    procedure SetupLogger;

    // Set up datamodule and functions
    procedure SetupDataModule;

    // Set up email
    procedure SetupEmail;

    function GetSessionIniValues: TSessionIniValues;
    procedure SetSessionIniValues(const Value: TSessionIniValues);
  public
    ExcludedFileList: TStringList;

    property FullSourceFilesDir: String
      read FFullSourceFilesDir;
    property FullBackupFilesDir: String
      read FFullBackupFilesDir;
    property FullCheckpointCSVFileName: String
      read FFullCheckpointCSVFileName;
    property FullRecipientsByCountriesCSVFileName: String
      read FFullRecipientsByCountriesCSVFileName;
    property FullRecipientsByClassLevelsCSVFileName: String
      read FFullRecipientsByClassLevelsCSVFileName;
    property FullSendErrorFileName: String
      read FFullSendErrorFileName;
    property SendEmailInitated: Boolean
      read FSendEmailInitated
      write FSendEmailInitated;
    property SelectedStudent: String
      read FSelectedStudent
      write FSelectedStudent;
    property SelectedFile: String
      read FSelectedFile
      write FSelectedFile;
    property Logger: TSimpleLogger
      read FLogger;
    property DmMain: TDmMain
      read FDmMain;
    property AuthorizationErrorMsg: String
      read FAuthorizationErrorMsg
      write FAuthorizationErrorMsg;
    property IsAuthorized: Boolean
      read FIsAuthorized
      write FIsAuthorized;
    property SessionIniValues: TSessionIniValues
      read GetSessionIniValues
      write SetSessionIniValues;

    procedure ShowWelcomeForm;
    procedure ShowRecipientsForm;
    procedure ShowComposeForm;
    procedure ShowPreviewForm;
    procedure ShowAuthorizeForm;
    procedure ShowSendEmailsForm;
    procedure ShowInfoMessage(
      const AMsgCaption,
      AMsg: String);
    function ShowQuestionMessage(
      const AMsgCaption,
      AMsg: String): Integer;
    procedure ShowErrorMessage(
      const AMsgCaption,
      AProcName,
      AErrorMsg,
      ACallStack: String);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  WinApi.ShellAPI,
  System.IOUtils,
  System.UITypes,

  Utilsu,
  Welcomeu,
  Recipientsu,
  Composeu,
  Previewu,
  Authorizeu,
  SendEmailsu,
  EditMessageTemplateu;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    // Set the Width and Height of the main window
    Width := MulDiv(FormWidth, Screen.PixelsPerInch, 96);
    Height := MulDiv(FormHeight, Screen.PixelsPerInch, 96);
  
    Initialize;
    FMessageForm := TfrmMessage.Create(Self);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.FormCreate',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  try
    InitializeChildForms;
    ShowChildForm(frmWelcome);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.FormShow',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    if TFile.Exists(FFullCheckpointCSVFileName) then begin
      FSessionIniFileHandler.WriteSessionIniValues;
    end;
  
    frmCompose.StopRefresh := True;
  
    //SaveSubjectToFile;
    UnregisterThemeChange(Self.ApplyTheme);
    //FAppIniFileHandler.AppIniValues.DarkMode := FDarkMode;
    FAppIniFileHandler.WriteAppIniValues;
  
    FAppIniFileHandler.Free;
    FESLAdminIniFileHandler.Free;
    FSessionIniFileHandler.Free;
  
    FDmMain.Free;
    ExcludedFileList.Free;
    FMessageForm.Free;
    FLogger.Free;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.FormClose',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;


{ ============================================================================
  HELPER METHODS
  ============================================================================ }
procedure TfrmMain.SetupPathsAndFileNames;
begin      
  // Create source_files directory if it does not exist
  FFullSourceFilesDir := IncludeTrailingPathDelimiter(
    ExtractFilePath(Application.ExeName)) + SourceFilesDir;

  // Construct the backup files directory
  FFullBackupFilesDir := IncludeTrailingPathDelimiter(
      ExtractFilePath(Application.ExeName)) + BackupFilesDir;

  // Construct the full checkpoint CSV file name
  FFullCheckpointCSVFileName :=
    IncludeTrailingPathDelimiter(FFullSourceFilesDir) +
      CheckpointFile;

  // Construct the full Recipients by Countries CSV file name
  FFullRecipientsByCountriesCSVFileName :=
      IncludeTrailingPathDelimiter(FFullSourceFilesDir) +
      RecipientsByCountriesCsv;

  // Construct the full Recipients by Class Levels CSV file name
  FFullRecipientsByClassLevelsCSVFileName :=
    IncludeTrailingPathDelimiter(FFullSourceFilesDir) +
    RecipientsByClassLevelsCsv;

  // Construct the full session ini file name
  FFullSessionIniFileName :=  IncludeTrailingPathDelimiter(FFullSourceFilesDir) +
    SessionIniFile;

  // Construct the full app ini file name
  FFullAppIniFileName := IncludeTrailingPathDelimiter(
    ExtractFilePath(Application.ExeName)) +
    AppIniFile;

  // Construct the full send error file name
  FFullSendErrorFileName := IncludeTrailingPathDelimiter(
    FFullSourceFilesDir) +
    SendErrorFile;
end;

procedure TfrmMain.CreateFilesAndDirectories;
begin
  try
    TUtils.EnsureDirectoryCreated(FFullSourceFilesDir);
    TUtils.EnsureDirectoryCreated(FFullBackupFilesDir);
    FAppIniFileHandler := TAppIniFileHandler.Create(FFullAppIniFileName);
    FESLAdminIniFileHandler := TESLAdminIniFileHandler.Create;
    FSessionIniFileHandler :=
    TSessionIniFileHandler.Create(FFullSessionIniFileName);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.CreateFilesAndDirectories',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmMain.Initialize;
begin
  try
    // Set up file and directory names
    SetupPathsAndFileNames;
  
    // Create directories and files as required
    CreateFilesAndDirectories;
  
    // Read session Ini Values
    //FAppIniFileHandler.ReadAppIniValues;
    FESLAdminIniFileHandler.ReadESLAdminIniValues;
  
    // Set the theme controller and apply the theme
    RegisterThemeChange(Self.ApplyTheme);
    FluentApplySystemTheme;
    if FluentIsWindowsDarkMode then
    begin
      FDarkMode := True;
      SetThemeBtnDarkMode;
    end else
    begin
      FDarkMode := False;
      SetThemeBtnLightMode;
    end;
  
    SetupLogger;
    // Countries table and Class levels table are loaded in the
    // SetupDataModule procedure
    SetupDataModule;
    SetupEmail;
  
    // Create and populate the excluded file list
    ExcludedFileList := TStringList.Create;
    ExcludedFileList.Add(SubjectFile);
  
    // Load subject from file
    //LoadSubjectFromFile;
  
    FSelectedFile := '';
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.Initialize',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmMain.SetupLogger;
begin
  try
    FLogger := TSimpleLogger.Create(AppLogFile);
    FLogger.WriteLog(TLogLevel.llInfo, 'ESL EMail Assistant started.');
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
     ShowErrorMessage(
        'Error',
        'TfrmMain.SetupLogger',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmMain.SetupDataModule;
begin
  try
    FDmMain := TDmMain.Create(Self, FLogger, FESLAdminIniFileHandler);
    FDmMain.Setup;
    // Load Countries table
    FdMMain.LoadCountriesTable(FFullRecipientsByCountriesCSVFileName);
    // Load Class Levels table
    FdmMain.LoadClassLevelsTable(FFullRecipientsByClassLevelsCSVFileName);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.SetupDataModule',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmMain.SetupEmail;
var
  LEmlUserName: String;
begin
  try
    FAuthorizationErrorMsg        := '';
    FIsAuthorized                 := False;
    LEmlUserName                  :=
      FESLAdminIniFileHandler.IniValues.EmlUsername;
    iOAuthMain.ClientId           :=
      FESLAdminIniFileHandler.IniValues.ClientId;
    iOAuthMain.ClientSecret       :=
      FESLAdminIniFileHandler.IniValues.ClientSecret;
    iOAuthMain.ServerAuthURL      := IniServerAuthUrl;
    iOAuthMain.ServerTokenURL     := IniServerTokenUrl;
    iOAuthMain.RefreshToken       := '';
    iOAuthMain.AuthorizationScope := IniAuthorizationScope;
  
    if Length(Trim(LEmlUserName)) > 0 then begin
      ismtpMain.User := LEmlUserName;
      ismtpMain.From := LEmlUserName;
      ismtpMain.MailServer := IniGoogleMailServer;
    end;
  
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.SetupEmail',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmMain.InitializeChildForms;
begin
  try
    frmWelcome.SetParentForm(Self);
    frmRecipients.SetParentForm(Self);
    frmCompose.SetParentForm(Self);
    frmPreview.ParentForm := Self;
    frmAuthorize.ParentForm := Self;
    frmSendEmails.ParentForm := Self;
    frmEditMessageTemplate.SetParentForm(Self);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E:Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.InitializeChildForms',
        E.Message,
        E.StackTrace
      );
    end;
    {$ENDIF}
  end
end;

procedure TfrmMain.iOAuthMainError(Sender: TObject; ErrorCode: Integer;
  const Description: string);
begin
  ShowErrorMessage(
    'Error',
    'TfrmMain.iOAuthMainError',
    'OAuth Error ' + IntToStr(ErrorCode) + ': ' + Description,
    '');
end;

procedure TfrmMain.iOAuthMainLaunchBrowser(Sender: TObject; var URL,
  Command: string);
begin
  try
    Command := '';
    ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);  
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E:Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.iOAuthMainLaunchBrowser',
        E.Message,
        E.StackTrace
      );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmMain.iOAuthMainReturnURL(Sender: TObject; const URLPath,
  QueryString: string; var ResponseHeaders, ResponseBody: string);
var
  LSList: TStringList;
begin
  LSList := TStringList.Create;
  try  
    try
      LSList.LoadFromFile('./auth.html', TEncoding.UTF8);
      ResponseHeaders := 'Content-Type: text/html; charset=utf-8';
      ResponseBody := LSList.Text;
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E:Exception do begin
        ShowErrorMessage(
          'Error',
          'TfrmMain.iOAuthMainReturnURL',
          E.Message,
          E.StackTrace
        );
      end;
      {$ENDIF}
    end;    
  finally
    LSList.Free;
  end;
end;

procedure TfrmMain.SetThemeBtnLightMode;
begin
  try
    btnTheme.IconGlyph := '';
    btnTheme.IconGlyphPressed := '';
    btnTheme.IconOffsetX := 3;
    btnTheme.IconOffsetY := 0;
    SVGimgSteps.ImageList := SVGimlSteps;
  except
    {$IFDEF MadExceptOn}
      raise;
    {$ELSE}
    On E:Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.SetThemeBtnLightMode',
        E.Message,
        E.StackTrace
      );
    end;
    {$ENDIF}
  end;
end;

function TfrmMain.GetSessionIniValues: TSessionIniValues;
begin
  Result := FSessionIniFileHandler.IniValues;
end;

procedure TfrmMain.SetSessionIniValues(const Value: TSessionIniValues);
begin
  FSessionIniFileHandler.IniValues := Value;
end;

procedure TfrmMain.SetThemeBtnDarkMode;
begin
  try
    btnTheme.IconGlyph := '';
    btnTheme.IconGlyphPressed := '';
    btnTheme.IconOffsetX := 3;
    btnTheme.IconOffsetY := 1;
    SVGimgSteps.ImageList := SVGimlStepsDarkMode;
  except
    {$IFDEF MadExceptOn}
    raise;
  {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.SetThemeBtnDarkMode',
        E.Message,
        E.StackTrace
        );
    end;
  {$ENDIF}
  end;
end;

procedure TfrmMain.ApplyTheme;
var
  I: Integer;
  Comp: TComponent;
begin
  try
    //Set colors to form and title bar
    Self.Color := flNeutralBackground1;
    lblTitle.Font.Color := flNeutralForeground1;
    TUtils.SetTitlebarColor(Self.CustomTitleBar);
    TUtils.SetThemeButtonColor(btnTheme);
  
    TUtils.SetPanelColor(pnlMain);
    TUtils.SetPanelColor(pnlImage);
    TUtils.SetTPanelsColor(Self);
  
    CWSSettingsPanel1.FillColor := flNeutralBackground2;
    CWSSettingsPanel1.BorderColor := flNeutralStroke1;
    
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.ApplyTheme',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;

//  pnlContentForm.Color := flNeutralBackground2;
//  pnlTitle.Color := flNeutralBackground1;
//  pnlSteps.Color := flNeutralBackground1;

  Invalidate;
end;

procedure TfrmMain.btnThemeClick(Sender: TObject);
begin
  try
    if FDarkMode then  begin
      FDarkMode := False;
      FluentApplyTheme(ftmLight);
      SetThemeBtnLightMode;
    end else begin
      FDarkMode := True;
      FluentApplyTheme(ftmDark);
      SetThemeBtnDarkMode;
    end;  
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.btnThemeClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;

end;

procedure TfrmMain.ShowRecipientsForm;
begin
  ShowChildForm(frmRecipients);
end;

procedure TfrmMain.ShowSendEmailsForm;
begin
  ShowChildForm(frmSendEmails);
end;

procedure TfrmMain.ShowWelcomeForm;
begin
  ShowChildForm(frmWelcome);
end;

procedure TfrmMain.ShowComposeForm;
begin
  ShowChildForm(frmCompose);
end;

procedure TfrmMain.ShowPreviewForm;
begin
  ShowChildForm(frmPreview);
end;

procedure TfrmMain.ShowAuthorizeForm;
begin
  ShowChildForm(frmAuthorize);
end;

procedure TfrmMain.ShowChildForm(AForm: TForm);
begin
  try
    if FActiveForm = AForm then begin
      Exit;
    end;
  
    if Assigned(FActiveForm) then begin
      FActiveForm.Close;
      FActiveForm := Nil;
    end;
  
    AForm.Parent := pnlContentForm;
    AForm.Align := alClient;
    AForm.Show;
    lblTitle.Caption := AForm.Caption;
    FActiveForm := AForm;
  
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      ShowErrorMessage(
        'Error',
        'TfrmMain.ShowChildForm',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmMain.ShowErrorMessage(
  const AMsgCaption,
  AProcName,
  AErrorMsg,
  ACallStack: String);
var
  LErrorMsg: String;
begin
  LErrorMsg := TUtils.FormatErrorMessage(AProcName, AErrorMsg, ACallStack);
  
  // 1. Log the error
  FLogger.WriteLog(llError, LErrorMsg);
  
  FMessageForm.lblCaption.LeftText := AMsgCaption;
  FMessageForm.MessageImage.ImageIndex := 87;
  FMessageForm.MessageImage.ImageColor := $004040FF;
  
  FMessageForm.memError.Visible := True;
  FMessageForm.lblMessage.Visible := False;
  FMessageForm.memError.Text := LErrorMsg;
  FMessageForm.btnOK.Visible := True;
  FMessageForm.btnCancel.Visible := False;
  FMessageForm.btnYes.Visible := False;
  FMessageForm.btnNo.Visible := False;
  FMessageForm.btnCopy.Visible := True;
  FMessageForm.ShowModal;  
end;

procedure TfrmMain.ShowInfoMessage(const AMsgCaption, AMsg: String);
begin
  FMessageForm.lblCaption.LeftText := AMsgCaption;
  FMessageForm.lblMessage.Caption := AMsg;
  FMessageForm.memError.Visible := False;
  FMessageForm.lblMessage.Visible := True;
  FMessageForm.btnOK.Visible := True;
  FMessageForm.btnCancel.Visible := False;
  FMessageForm.btnYes.Visible := False;
  FMessageForm.btnNo.Visible := False;
  FMessageForm.btnCopy.Visible := False;
  FMessageForm.ShowModal;
end;

function TfrmMain.ShowQuestionMessage(const AMsgCaption, AMsg: String): Integer;
begin
  FMessageForm.lblCaption.LeftText  := AMsgCaption;
  FMessageForm.MessageImage.ImageIndex := 89;
  FMessageForm.btnCancel.Visible := True;
  FMessageForm.lblMessage.Caption := AMsg;
  FMessageForm.memError.Visible := False;
  FMessageForm.lblMessage.Visible := True;
  FMessageForm.btnOK.Visible := False;
  FMessageForm.btnCancel.Visible := False;
  FMessageForm.btnYes.Visible := True;
  FMessageForm.btnNo.Visible := True;
  FMessageForm.btnCopy.Visible := False;
  FMessageForm.ShowModal;
  Result := FMessageForm.ModalResult;
end;

end.
