unit Previewu;

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
  CWSComboBox,
  CWSMemo,

  RzStatus,
  RzPanel,
  RzLabel,

  SVGIconImageListBase,
  SVGIconImageList,

  Constsu,
  BaseFormu,
  EmailProcessoru,
  Mainu;

type
  TfrmPreview = class(TfrmBase)
    SVGIconImageList1: TSVGIconImageList;
    sbMain: TRzStatusBar;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    pnlButtons: TCWSSettingsPanel;
    Panel1: TPanel;
    pnlStudent: TPanel;
    lblStudent: TRzLabel;
    cboStudent: TCWSComboBox;
    memPreview: TCWSMemo;
    ScrollTimer: TTimer;
    btnNewSession: TCWSButton;
    btnNext: TCWSButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNewSessionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboStudentChange(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    FSelectedStudent: String;
    FEMailProcessor: TEmailProcessor;
    FSLStudents: TStringList;
    FLoading: Boolean;
    procedure LoadStudentPreviewCombo;
    procedure DisplayPreviewText;
    procedure ScrollPreviewToTop(Sender: TObject);
  protected
    procedure ApplyTheme; override;
  public
  end;

var
  frmPreview: TfrmPreview;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  CWSFluentColorsMulti,
  RzCommon,

  Utilsu;

procedure TfrmPreview.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);

  // One-shot scroll timer for preview
  ScrollTimer.Enabled := False;
  ScrollTimer.Interval := 1;
  ScrollTimer.OnTimer := ScrollPreviewToTop;

  FSelectedStudent := '';
  FSLStudents := TStringList.Create;
  cboStudent.Font.Size := InputFontSize;
  TUtils.AdjustButtonsPanel(pnlButtons);
  FEmailProcessor := TEmailProcessor.Create(
    Self,
    FEmailException);
end;

procedure TfrmPreview.FormDestroy(Sender: TObject);
begin
  if Assigned(FSLStudents) then begin
    FSLStudents.Free;
  end;
  if Assigned(FEMailProcessor) then begin
    FreeAndNil(FEMailProcessor);
  end;
  inherited FormDestroy(Sender);
end;

procedure TfrmPreview.FormShow(Sender: TObject);
begin
  FParentForm.SVGimgSteps.ImageIndex := 3;
  FSLStudents.Clear;
  FSLStudents.LoadFromFile(
      FParentForm.FullCheckpointCSVFileName,
      TEncoding.UTF8);

  LoadStudentPreviewCombo;

  DisplayPreviewText;
end;

procedure TfrmPreview.btnNewSessionClick(Sender: TObject);
begin
  if FParentForm.SendEmailInitated then begin
    FParentForm.ShowWelcomeForm;
  end else begin
    FParentForm.ShowComposeForm;
  end;
end;

procedure TfrmPreview.btnNextClick(Sender: TObject);
begin
  FParentForm.ShowAuthorizeForm;
end;

procedure TfrmPreview.cboStudentChange(Sender: TObject);
begin
  if Not(FLoading) then begin
    DisplayPreviewText;
  end;
end;

procedure TfrmPreview.DisplayPreviewText;
var
  LFields: TArray<String>;
  LStudentName, LTeacherName, LRoomName: String;
  LClassLevel, LChildcareLevel, LLanguage: String;
  LMessage: String;
  I: Integer;
  LIndex: Integer;
begin
  if (cboStudent.Items.Count = 0) or
   Not(TFile.Exists(FParentForm.FullCheckpointCSVFileName)) then Exit;
  FSelectedStudent := cboStudent.Items[
    cboStudent.ItemIndex];

  if FSLStudents.Count >= 2 then begin
    for I := 1 to FSLStudents.Count - 1 do begin
      LFields := TCSVHelper.ParseCSVLine(
      FSLStudents[I]);
      if (Length(LFields) >= 8) and SameText(LFields[0], FSelectedStudent) then begin
        LStudentName    := LFields[0];
        LTeacherName    := LFields[1];
        LRoomName       := LFields[2];
        LClassLevel     := LFields[3];
        LChildcareLevel := LFields[4];
        LLanguage       := LFields[7];

        LMessage := FEmailProcessor.ProcessMailMessage(
          FParentForm.FullCheckpointCSVFileName,
          LStudentName,
          LTeacherName,
          LRoomName,
          LClassLevel,
          LChildcareLevel,
          LLanguage);

        memPreview.Lines.Clear;
        memPreview.Lines.Text := LMessage;
        ScrollTimer.Enabled := False;
        ScrollTimer.Enabled := True;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmPreview.LoadStudentPreviewCombo;
var
  LLines: TStringList;
  I: Integer;
  LFields: TArray<String>;
begin
  LLines := TStringList.Create;
  try
    cboStudent.Items.Clear;
    memPreview.Lines.Clear;
    LLines.LoadFromFile(FParentForm.FullCheckpointCSVFileName, TEncoding.UTF8);
    LLines.Sorted := True;
    for I := 1 to LLines.Count - 1 do begin
      LFields := TCSVHelper.ParseCSVLine(LLines[I]);
      if Length(LFields) >= 1 then
        cboStudent.Items.Add(LFields[0]);
    end;

    // Sorted causes exception for TWCSComboBox
    //cboStudent.Sorted := True;

    FLoading := True;
    try
      cboStudent.ItemIndex := 0;
      if cboStudent.Items.Count > 0 then begin
        if Length(Trim(FSelectedStudent)) > 0 then begin
          cboStudent.ItemIndex := 0;
          I := cboStudent.Items.IndexOf(FSelectedStudent);
          if I >= 0 then begin
            cboStudent.ItemIndex := I;
          end;
        end;
      end;
    finally
      FLoading := False;
    end;
  finally
    LLines.Free;
  end;
end;

procedure TfrmPreview.ScrollPreviewToTop(Sender: TObject);
var
  Files: TArray<String>;
  I: Integer;
  LFileName: String;
begin
  ScrollTimer.Enabled := False;
  memPreview.SelStart := 0;
  memPreview.SelLength := 0;
  SendMessage(
    memPreview.Handle,
    WM_VSCROLL,
    MakeWParam(SB_TOP, 0),
    0);
end;

procedure TfrmPreview.ApplyTheme;
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
    if LComp is TCWSMemo then begin
      TUtils.SetMemoColor(TCWSMemo(LComp));
    end;

    if LComp is TCWSSettingsPanel then begin
      TUtils.SetPanelColor(TCWSSettingsPanel(LComp));
    end;

    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(LComp as TRzLabel)
    end;

    if LComp is TCWSComboBox then begin
      TUtils.SetComboBoxColor(LComp as TCWSComboBox);
    end;
  end;
end;


end.
