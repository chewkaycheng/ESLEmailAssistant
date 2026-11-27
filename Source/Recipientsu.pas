unit Recipientsu;

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

  SVGIconImageListBase,
  SVGIconImageList,

  CWSSettingsPanel,
  CWSButton,
  CWSRadioButton,
  CWSDBGrid,
  CWSCheckDBGrid,

  RzStatus,
  RzPanel,
  RzLabel,

  Mainu,
  Constsu;

type
  TfrmRecipients = class(TForm)
    SVGIconImageList1: TSVGIconImageList;
    sbMain: TRzStatusBar;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    pnlButtons: TCWSSettingsPanel;
    pnlRecipients: TPanel;
    pnlChoose: TPanel;
    lblChoose: TRzLabel;
    pnlSelectBtns: TPanel;
    pnlClearAllBtn: TPanel;
    btnClearAll: TCWSButton;
    pnlSelectAllBtn: TPanel;
    btnSelectAll: TCWSButton;
    pnlGridsOuter: TPanel;
    grdStudentsByCountries: TCWSCheckDBGrid;
    grdStudentsByClassLevels: TCWSCheckDBGrid;
    pnlInstructions: TPanel;
    lblStudentsType: TRzLabel;
    pnlGridsInner: TPanel;
    pnlRadioBtnsOuter: TPanel;
    pnlRadioBtns: TPanel;
    rbAllStudents: TCWSRadioButton;
    rbStudentsByCountries: TCWSRadioButton;
    rbStudentsByClassLevels: TCWSRadioButton;
    btnGenerateList: TCWSButton;
    btnBack: TCWSButton;
    btnNext: TCWSButton;
    stpSpacer: TRzStatusPane;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbAllStudentsClick(Sender: TObject);
    procedure rbStudentsByCountriesClick(Sender: TObject);
    procedure rbStudentsByClassLevelsClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnClearAllClick(Sender: TObject);
    procedure btnGenerateListClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    { Private declarations }
    FParentForm: TfrmMain;
    procedure ApplyTheme;
    procedure SetNextButtonEnabled;
    procedure GenerateRecipientsCSV;
  public
    { Public declarations }
    procedure SetParentForm(AParent: TfrmMain);
    procedure InitializeRecipientsForm(ASelect: Boolean);
    procedure SelectAllStudents;
    procedure SelectStudentsByCountries;
    procedure SelectStudentsByClassLevels;
    procedure SelectAllRecords(ATableName: String);
    procedure DeselectAllRecords(ATableName: String);
    procedure SetRecipientType(AType: TRecipientType);
  end;

var
  frmRecipients: TfrmRecipients;

implementation

{$R *.dfm}

uses
  System.IOUtils,

  CWSFluentColorsMulti,
  RzCommon,

  Utilsu,
  IniFileHandleru;

{ TfrmRecipients }

procedure TfrmRecipients.FormCreate(Sender: TObject);
begin
  ScaleForPPI(CurrentPPI);
  RegisterThemeChange(Self.ApplyTheme);
  FluentApplySystemTheme;

  pnlGridsOuter.Align := alNone;
  pnlGridsOuter.Align := alClient;

  grdStudentsByCountries.Font.Size := InputFontSize;
  grdStudentsByClassLevels.Font.Size := InputFontSize;

  TUtils.AdjustButtonsPanel(pnlButtons);
end;

procedure TfrmRecipients.FormDestroy(Sender: TObject);
begin
  UnregisterThemeChange(Self.ApplyTheme);
end;

procedure TfrmRecipients.FormShow(Sender: TObject);
begin
  FParentForm.SVGimgSteps.ImageIndex := 1;
  if TFile.Exists(FParentForm.FullCheckpointCSVFileName) then begin
    stpLeft.Caption := 'A recipient list has been generated previously. ' +
      'You may generate a new one.';
  end else begin
    stpLeft.Caption := '';
  end;
  SetNextButtonEnabled;
  case FParentForm.SessionIniValues.RecipientType of
    rtAllStudents: begin
      rbAllStudents.Checked := True;
      SelectAllStudents;
    end;
    rtStudentsByCountries: begin
      rbStudentsByCountries.Checked := True;
      SelectStudentsByCountries;
    end;
    rtStudentsByClassLevels: begin
      rbStudentsByClassLevels.Checked := True;
      SelectStudentsByClassLevels;
    end;
  end;
end;

procedure TfrmRecipients.SetNextButtonEnabled;
var
  LIsEnabled: Boolean;
begin
  // If checkpoint file exists then enable the next button
  // in the Recipients tabsheet
  btnNext.Enabled := TFile.Exists(FParentForm.FullCheckpointCSVFileName);
end;

procedure TfrmRecipients.SetParentForm(AParent: TfrmMain);
begin
  FParentForm := AParent;
  grdStudentsByCountries.DataSource := FParentForm.DmMain.dsCountries;
  grdStudentsByClassLevels.DataSource := FParentForm.DmMain.dsClassLevels;
end;

procedure TfrmRecipients.ApplyTheme;
var
  I: Integer;
  LComp: TComponent;
begin
  Self.Color := flNeutralBackground1;

  TUtils.SetStatusBarColor(sbMain);
  TUtils.SetTPanelsColor(Self);
  TUtils.SetPanelColor(pnlButtons);

  for I := 0 to ComponentCount - 1 do  begin
    LComp := Components[I];
    if LComp is TCWSButton then begin
      TUtils.SetButtonColors(LComp as TCWSButton);
    end;

    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(LComp as TRzLabel)
    end;

    if LComp is TCWSRadioButton then begin
      TUtils.SetRadioButtonColor(LComp as TCWSRadioButton);
    end;

    if LComp is TCWSCheckDBGrid then begin
      TUtils.SetGridColor(LComp as TCWSCheckDBGrid);
    end;
  end;
end;

procedure TfrmRecipients.InitializeRecipientsForm(ASelect: Boolean);
begin
  if (ASelect) then begin
    DeselectAllRecords(CountriesTable);
    DeselectAllRecords(ClassLevelsTable);
  end;

  SetRecipientType(rtAllStudents);
end;

procedure TfrmRecipients.rbAllStudentsClick(Sender: TObject);
begin
  SelectAllStudents;
end;

procedure TfrmRecipients.rbStudentsByClassLevelsClick(Sender: TObject);
begin
  SelectStudentsByClassLevels;
end;

procedure TfrmRecipients.rbStudentsByCountriesClick(Sender: TObject);
begin
  SelectStudentsByCountries;
end;

procedure TfrmRecipients.SetRecipientType(AType: TRecipientType);
var
  LIniValues: TSessionIniValues;
begin
  LIniValues := FParentForm.SessionIniValues;
  LIniValues.RecipientType := AType;
  FParentForm.SessionIniValues := LIniValues;
end;

procedure TfrmRecipients.SelectAllStudents;
begin
  SetRecipientType(rtAllStudents);
  pnlGridsInner.Visible := False;
  pnlSelectBtns.Visible := False;
  lblStudentsType.Caption := 'All active students will be included. ' +
    'Click on Generate List.';
end;

procedure TfrmRecipients.SelectStudentsByClassLevels;
begin
  SetRecipientType(rtStudentsByClassLevels);
  pnlGridsInner.Visible := True;
  pnlSelectBtns.Visible := True;
  grdStudentsByCountries.Visible := False;
  grdStudentsByClassLevels.Visible := True;
  grdStudentsByClassLevels.Align := alClient;
  lblStudentsType.Caption :=
      'Select Students By Class Levels. Then Click on Generate List.';
end;

procedure TfrmRecipients.SelectStudentsByCountries;
begin
  SetRecipientType(rtStudentsByCountries);
  pnlGridsInner.Visible := True;
  pnlSelectBtns.Visible := True;
  grdStudentsByCountries.Visible := True;
  grdStudentsByClassLevels.Visible := False;
  grdStudentsByCountries.Align := alClient;
  lblStudentsType.Caption :=
      'Select Students By Countries. Then Click on Generate List.';
end;

procedure TfrmRecipients.btnBackClick(Sender: TObject);
begin
  FParentForm.ShowWelcomeForm;
end;

procedure TfrmRecipients.btnNextClick(Sender: TObject);
begin
  FParentForm.ShowComposeForm;
end;


procedure TfrmRecipients.btnGenerateListClick(Sender: TObject);
var
  LRecipientType: TRecipientType;
  LCount: Integer;
begin
  try
    stpLeft.Caption := '';
    stpRight.Caption := '';

//    if TFile.Exists(
//      FParentForm.FullCheckpointCSVFileName) then begin
//        TFile.Delete(FParentForm.FullCheckpointCSVFileName);
//    end;
//    if TFile.Exists(
//      FParentForm.FullRecipientsByCountriesCSVFileName) then begin
//        TFile.Delete(FParentForm.FullRecipientsByCountriesCSVFileName);
//    end;
//    if TFile.Exists(
//      FParentForm.FullRecipientsByClassLevelsCSVFileName) then begin
//        TFile.Delete(FParentForm.FullRecipientsByClassLevelsCSVFileName);
//    end;

//    if rbAllStudents.Checked then begin
//      LRecipientType := rtAllStudents;
//    end else if rbStudentsByCountries.Checked then begin
//      LRecipientType := rtStudentsByCountries;
//    end else if rbStudentsByClassLevels.Checked then begin
//      LRecipientType := rtStudentsByClassLevels;
//    end;

    if Not(FParentForm.DmMain.GenerateSQL(
      FParentForm.SessionIniValues.RecipientType
    )) then begin
      Exit;
    end;
    LCount := FParentForm.DmMain.GetStudentCount;

    if LCount = 0 then begin
      FParentForm.ShowInfoMessage(
        'Information',
        'No students match your selection. Please reselect again.');
      stpLeft.Caption := '';
      Exit;
    end else begin
      FParentForm.DmMain.GenerateCheckpointFile(
        FParentForm.FullCheckpointCSVFileName);
      GenerateRecipientsCSV;
      stpLeft.Caption := Format(
        '%d student(s) match your selection. Email list generated.', [LCount]);
    end;
  finally
    SetNextButtonEnabled;
  end;
end;

procedure TfrmRecipients.GenerateRecipientsCSV;
begin
  if TFile.Exists(
    FParentForm.FullRecipientsByCountriesCSVFileName) then begin
      TFile.Delete(FParentForm.FullRecipientsByCountriesCSVFileName);
  end;
  if TFile.Exists(
    FParentForm.FullRecipientsByClassLevelsCSVFileName) then begin
      TFile.Delete(FParentForm.FullRecipientsByClassLevelsCSVFileName);
  end;

  if rbStudentsByCountries.Checked then begin
    FParentForm.DmMain.WriteRecipientsByCountryCsv(
      FParentForm.FullRecipientsByCountriesCSVFileName);
  end else if rbStudentsByClassLevels.Checked then begin
    FParentForm.DmMain.WriteRecipientsByClassLevelsCsv(
      FParentForm.FullRecipientsByClassLevelsCSVFileName);
  end;
end;

procedure TfrmRecipients.btnSelectAllClick(Sender: TObject);
begin
  if rbStudentsByCountries.Checked then begin
    SelectAllRecords(CountriesTable);
  end else begin
    SelectAllRecords(ClassLevelsTable);
  end;
end;

procedure TfrmRecipients.btnClearAllClick(Sender: TObject);
begin
  if rbStudentsByCountries.Checked then begin
    DeselectAllRecords(CountriesTable);
  end else begin
    DeselectAllRecords(ClassLevelsTable);
  end;
end;

procedure TfrmRecipients.DeselectAllRecords(ATableName: String);
begin
  FParentForm.DmMain.ChangeAllRecords(False, ATableName);
end;

procedure TfrmRecipients.SelectAllRecords(ATableName: String);
begin
  FParentForm.DmMain.ChangeAllRecords(True, ATableName);
end;

end.
