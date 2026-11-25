unit Welcomeu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.StdCtrls,
  CWSSettingsPanel,
  CWSButton,
  SVGIconImageListBase,
  SVGIconImageList,
  RzLabel,
  RzPanel,
  RzStatus,

  Mainu;

type
  TfrmWelcome = class(TForm)
    SVGIconImageList1: TSVGIconImageList;
    lblWelcome_Message: TRzLabel;
    sbMain: TRzStatusBar;
    pnlButtons: TCWSSettingsPanel;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    btnNewSession: TCWSButton;
    btnResumeSession: TCWSButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewSessionClick(Sender: TObject);
    procedure btnResumeSessionClick(Sender: TObject);
  private
    { Private declarations }
    FParentForm: TfrmMain;
    procedure ApplyTheme;
    function RelevantSessionFilesExist: Boolean;
  public
    { Public declarations }
    procedure SetParentForm(AParent: TfrmMain);
  end;

var
  frmWelcome: TfrmWelcome;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  CWSFluentColorsMulti,
  RzCommon,

  Recipientsu,
  DmMainu,
  FileUtilsu,
  IniFileHandleru,
  Constsu,
  Utilsu;

{ TfrmWelcome }

procedure TfrmWelcome.FormCreate(Sender: TObject);
begin
  ScaleForPPI(CurrentPPI);
  RegisterThemeChange(Self.ApplyTheme);
  FluentApplySystemTheme;

  TUtils.AdjustButtonsPanel(pnlButtons);
end;

procedure TfrmWelcome.FormDestroy(Sender: TObject);
begin
  UnregisterThemeChange(Self.ApplyTheme);
end;

procedure TfrmWelcome.FormShow(Sender: TObject);
begin
  FParentForm.SVGimgSteps.ImageIndex := 0;
  // Disable the Resume session button if the source directory
  // is empty. Only option is to start a new session.
  // Check if there are cases where the directory is not empty
  // but contains excluded files
  btnResumeSession.Enabled :=
    RelevantSessionFilesExist;
end;

procedure TfrmWelcome.SetParentForm(AParent: TfrmMain);
begin
  FParentForm := AParent;
end;

procedure TfrmWelcome.ApplyTheme;
var
  LComp: TComponent;
  I: Integer;
begin
  Self.Color := flNeutralBackground1;

  TUtils.SetStatusBarColor(sbMain);
  TUtils.SetTPanelsColor(Self);
  TUtils.SetPanelColor(pnlButtons);

  for I := 0 to ComponentCount - 1 do  begin
    LComp := Components[I];
    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(LComp as TRzLabel)
    end;

    if LComp is TCWSButton then begin
      TUtils.SetButtonColors(LComp as TCWSButton);
    end;
  end;
end;

procedure TfrmWelcome.btnNewSessionClick(Sender: TObject);
var
  LFile: string;
  LIniValues: TSessionIniValues;
begin
  // Check if source_files directory has files. If so, confirm that the
  // user wants to start a new session.
  if RelevantSessionFilesExist then begin
    if (MessageDlg(
      'The source files directory already contains files. ' +
      'Do you wish to start fresh? Existing files will be moved to backup.',
      TMsgDlgType.mtConfirmation,
      [mbYes, mbNo], 0, mbNo)) = mrYes then begin
      TFileUtils.MoveSourceFilesToBackupDir(
        FParentForm.FullBackupFilesDir,
        FParentForm.FullSourceFilesDir);
      // The Countries list or Class Levels list will be moved tp
      // backup. Clear all the selected entries in the Countries
      // and Class Levels grids.
    end else begin
      Exit;
    end;
  end;

  // Delete all non relevant files in the directory.
  for LFile in TDirectory.GetFiles(FParentForm.FullSourceFilesDir) do begin
    TFile.Delete(LFile);
  end;

  FParentForm.SelectedStudent := '';
  FParentForm.SendEmailInitated := False;

  // Clear the Email subject value
  LIniValues := FParentForm.SessionIniValues;
  LIniValues.Subject := '';
  FParentForm.SessionIniValues := LIniValues;

  // Clear the selected values in the Countries
  // and Class Levels table.
  frmRecipients.InitializeRecipientsForm(True);
  FParentForm.ShowRecipientsForm;
end;

procedure TfrmWelcome.btnResumeSessionClick(Sender: TObject);
begin
  // If sending emails was initiated, it means that there is a possibility
  // that the email sending process was terminated prematurely due to
  // possible exceptions. In this case we bypass the Recipients and
  // Compose tabsheets because we want to keep the data consistent.
  // We only allow the user to restart the email sending process for the
  // remainder of the students when the sending process was terminated.
  if FParentForm.SendEmailInitated then begin
    FParentForm.ShowPreviewForm;
  end else begin
    FParentForm.ShowRecipientsForm;
  end;
end;

function TfrmWelcome.RelevantSessionFilesExist: Boolean;
var
  LFiles: TArray<String>;
  I: Integer;
  LFileName: String;
  LLanguage: String;
  LLanguageList: TStringList;
begin
  Result := False;
  // Checkpoint file exists
  if TFile.Exists(FParentForm.FullCheckpointCSVFileName) then begin
    Result := True;
    Exit;
  end;

  // Any of the language text files exist
  LFiles := TDirectory.GetFiles(
      FParentForm.FullSourceFilesDir,
      '*.txt',
      TSearchOption.soTopDirectoryOnly);
  for I := 0 to High(LFiles) do begin
    LFileName := LowerCase(ExtractFileName(LFiles[i]));
    if (FParentForm.ExcludedFileList.IndexOf(LFileName) <> -1) then begin
      Continue;
    end else begin
      Result := True;
      Exit;
    end;
  end;
end;

end.
