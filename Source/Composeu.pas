unit Composeu;

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
  CWSEdit,
  CWSComboBox,
  CWSLabelColumn,
  CWSListBox,

  RzLabel,
  RzStatus,
  RzPanel,

  SVGIconImageListBase,
  SVGIconImageList,

  FileSystemMonitor,
  Mainu;

const
  WM_SET_NEXT_ENABLED = WM_USER + 0;
  WM_SET_EDITDEL_BTNS_ENABLED = WM_USER + 1;
  WM_SET_SELECTED_FILE = WM_USER + 2;

type
  TfrmCompose = class(TForm)
    pnlButtons: TCWSSettingsPanel;
    sbMain: TRzStatusBar;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    SVGIconImageList1: TSVGIconImageList;
    btnBack: TCWSButton;
    btnNext: TCWSButton;
    pnlLanguage: TPanel;
    pnlFiles: TPanel;
    pnlEditDel: TPanel;
    lblLanguage: TRzLabel;
    cboLanguage: TCWSComboBox;
    btnCreateTemplate: TCWSButton;
    pnlSubject: TPanel;
    lblSubject: TRzLabel;
    edtSubject: TCWSEdit;
    pnlDelete: TPanel;
    btnDeleteTemplate: TCWSButton;
    pnlEdit: TPanel;
    btnEditTemplate: TCWSButton;
    lstTemplates: TCWSListBox;
    pnlTemplateFiles: TCWSSettingsPanel;
    lblTemplateFiles: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure edtSubjectChange(Sender: TObject);
    procedure btnCreateTemplateClick(Sender: TObject);
    procedure cboLanguageChange(Sender: TObject);
    procedure btnDeleteTemplateClick(Sender: TObject);
    procedure btnEditTemplateClick(Sender: TObject);
    procedure ShowEditMessageTemplateForm(ALanguage: String);
    procedure btnNextClick(Sender: TObject);
    procedure lstTemplatesClick(Sender: TObject);
  private
    FParentForm: TfrmMain;
    FMonitor: IFileSystemMonitor;
    FStopRefresh: Boolean;
    FLoading: Boolean;
    FSelectedFile: String;
    FEditing: Boolean;
    FLanguageFileList: TStringList;
    procedure RefreshFileList;
    procedure OnFileChange(
      Sender: TObject; const
      APath: String;
      AChangeType: TFileChangeType);
    procedure ApplyTheme;
    procedure SetCreateBtnEnabled;
    procedure OnSetNextBtnEnabled(var Msg: TMessage);
      message WM_SET_NEXT_ENABLED;
    procedure OnSetEditDelBtnSEnabled(var Msg: TMessage);
      message WM_SET_EDITDEL_BTNS_ENABLED;
    procedure OnSetSelectedFile(var Msg: TMessage);
      message WM_SET_SELECTED_FILE;
    procedure SetSelectedFile;
  public
    { Public declarations }
    procedure SetParentForm(AParent: TfrmMain);
    property StopRefresh: Boolean
      read FStopRefresh
      write FStopRefresh;
  end;

var
  frmCompose: TfrmCompose;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  CWSFluentColorsMulti,
  RzCommon,

  dlg_info,

  Constsu,
  Utilsu,
  IniFileHandleru,
  FileUtilsu,
  EditMessageTemplateu;

procedure TfrmCompose.FormCreate(Sender: TObject);
begin
  ScaleForPPI(CurrentPPI);
  RegisterThemeChange(Self.ApplyTheme);
  FluentApplySystemTheme;
  FSelectedFile := '';
  FEditing := False;
  cboLanguage.Font.Size := InputFontSize;
  edtSubject.Font.Size := InputFontSize;
  lstTemplates.Font.Size := InputFontSize;
  TUtils.AdjustButtonsPanel(pnlButtons);
  FLanguageFileList := TStringList.Create;
end;

procedure TfrmCompose.FormDestroy(Sender: TObject);
begin
  if Assigned(FLanguageFileList) then begin
    FreeAndNil(FLanguageFileList);
  end;
  FStopRefresh := True;
  UnregisterThemeChange(Self.ApplyTheme);
end;

procedure TfrmCompose.FormShow(Sender: TObject);
var
  I: Integer;
begin
  FParentForm.SVGimgSteps.ImageIndex := 2;

  if cboLanguage.ItemCount = 0 then begin
    FParentForm.DmMain.LoadLanguages(FLanguageFileList);
    cboLanguage.Items.Text := FLanguageFileList.Text;
    for i := 0 to FLanguageFileList.Count - 1 do begin
      FLanguageFileList[i] := FLanguageFileList[i] + '.txt';
    end;

    cboLanguage.ItemIndex :=
      cboLanguage.Items.IndexOf('English');
  end;

  // Set up file system monitor
  if Not(Assigned(FMonitor)) then begin
    FStopRefresh := False;
    FMonitor := CreateFileSystemMonitor;
    FMonitor.AddDirectory(
      FParentForm.FullSourceFilesDir,
      False,
      OnFileChange);
  end;

  FLoading := True;
  try
    edtSubject.Text := FParentForm.SessionIniValues.Subject;
  finally
    FLoading := False;
  end;
  RefreshFileList;
end;


procedure TfrmCompose.SetCreateBtnEnabled;
var
  LCreated: Boolean;
begin
  LCreated := TFileUtils.LanguageContentCreated(
    cboLanguage.Items[cboLanguage.ItemIndex],
      FParentForm.FullSourceFilesDir);
  btnCreateTemplate.Enabled := Not(LCreated);
end;

procedure TfrmCompose.SetParentForm(AParent: TfrmMain);
begin
  FParentForm := AParent;
end;

procedure TfrmCompose.ShowEditMessageTemplateForm(ALanguage: String);
begin
  frmEditMessageTemplate.Language :=
    ALanguage;
  frmEditMessageTemplate.ShowModal;
  SetCreateBtnEnabled;
end;

procedure TfrmCompose.ApplyTheme;
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

    if LComp is TCWSSettingsPanel then begin
      TUtils.SetPanelColor(TCWSSettingsPanel(LComp));
    end;

    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(LComp as TRzLabel)
    end;

    if LComp is TCWSEdit then begin
      TUtils.SetEditColor(LComp as TCWSEdit);
    end;

    if LComp is TCWSComboBox then begin
      TUtils.SetComboBoxColor(LComp as TCWSComboBox);
    end;

    if LComp is TCWSListBox then begin
      TUtils.SetListBoxColor(LComp as TCWSListBox);
    end;
  end;
end;

procedure TfrmCompose.btnBackClick(Sender: TObject);
begin
  FParentForm.ShowRecipientsForm;
end;

procedure TfrmCompose.btnCreateTemplateClick(Sender: TObject);
var
  LLanguage: String;
  LIndex: Integer;
begin
//  dlgInfo.PDescription := '';
//  dlgInfo.PDescription := 'Hello';
//  dlgInfo.ShowModal;
  FEditing := True;
  try
    LLanguage :=
      cboLanguage.Items[cboLanguage.ItemIndex];
    ShowEditMessageTemplateForm(LLanguage);
    LIndex := lstTemplates.Items.IndexOf(LLanguage + '.txt');
    if LIndex >= 0 then begin
      FSelectedFile := LLanguage + '.txt';
      lstTemplates.ItemIndex := LIndex;
    end;
  finally
    FEditing := False;
  end;
end;

procedure TfrmCompose.btnDeleteTemplateClick(Sender: TObject);
var
  LFileName: String;
  LFullFileName: String;
begin
  if (lstTemplates.ItemIndex = -1) then begin
      ShowMessage('Select a file by clicking on the file name.');
      Exit;
    end;

    LFileName :=  lstTemplates.Items[
      lstTemplates.ItemIndex];
    LFullFileName :=
      IncludeTrailingPathDelimiter(FParentForm.FullSourceFilesDir) +
        LFileName;
    if MessageDlg(
         Format('Are you sure you want to delete "%s"?', [LFileName]),
         mtConfirmation,
         [mbYes, mbNo], 0) = mrYes then begin
      if Not(DeleteFile(LFullFileName)) then begin
        ShowMessage('Could not delete the file: ' + SysErrorMessage(GetLastError));
      end;
    end;
    SetCreateBtnEnabled;
end;

procedure TfrmCompose.btnEditTemplateClick(Sender: TObject);
var
  ALanguage: String;
begin
  if (lstTemplates.ItemIndex = -1) then begin
    ShowMessage('Select a file by clicking on the file name.');
    Exit;
  end;

  ALanguage := lstTemplates.Items[
        lstTemplates.ItemIndex];
  ShowEditMessageTemplateForm(ALanguage);
end;

procedure TfrmCompose.btnNextClick(Sender: TObject);
begin
  FParentForm.ShowPreviewForm;
end;

procedure TfrmCompose.cboLanguageChange(Sender: TObject);
begin
  SetCreateBtnEnabled;
end;

procedure TfrmCompose.edtSubjectChange(Sender: TObject);
var
  LIniValues: TSessionIniValues;
begin
  if FLoading then begin
    Exit;
  end;

  LIniValues := FParentForm.SessionIniValues;
  LIniValues.Subject := edtSubject.Text;
  FParentForm.SessionIniValues := LIniValues;

  RefreshFileList;
end;

procedure TfrmCompose.OnFileChange(Sender: TObject; const APath: String;
  AChangeType: TFileChangeType);
begin
  if FStopRefresh then Exit;

  case AChangeType of
    TFileChangeType.fcAdded,
    TFileChangeType.fcModified,
    TFileChangeType.fcRenamedOld,
    TFileChangeType.fcRemoved:
      RefreshFileList;
  end;
end;

procedure TfrmCompose.OnSetEditDelBtnSEnabled(var Msg: TMessage);
begin
  btnEditTemplate.Enabled := lstTemplates.Items.Count > 0;
  btnDeleteTemplate.Enabled := lstTemplates.Items.Count > 0;
end;

procedure TfrmCompose.OnSetNextBtnEnabled(var Msg: TMessage);
begin
  btnNext.Enabled := Boolean(Msg.WParam);
end;

procedure TfrmCompose.OnSetSelectedFile(var Msg: TMessage);
begin
  SetSelectedFile;
end;

procedure TfrmCompose.SetSelectedFile;
var
  LIndex: Integer;
begin
  if FEditing then begin
    Exit;
  end;

  if lstTemplates.Items.Count = 0 then begin
    FSelectedFile := '';
    Exit;
  end;

  if Length(Trim(FSelectedFile)) = 0 then begin
    lstTemplates.ItemIndex := 0;
    Exit;
  end;

  LIndex :=  lstTemplates.Items.IndexOf(FSelectedFile);
  if LIndex = -1 then begin
    FSelectedFile := lstTemplates.Items[0];
    lstTemplates.ItemIndex := 0;
  end else begin
    lstTemplates.ItemIndex := LIndex;
  end;
end;

procedure TfrmCompose.lstTemplatesClick(Sender: TObject);
begin
  if lstTemplates.ItemIndex <> -1 then begin
    FSelectedFile := lstTemplates.Items[lstTemplates.ItemIndex];
  end;
end;

procedure TfrmCompose.RefreshFileList;
var
  Files: TArray<String>;
  I: Integer;
  LFileName: String;
  LEnabled: Boolean;
begin
  if FStopRefresh then Exit;

  lstTemplates.Items.BeginUpdate;
  try
    lstTemplates.Clear;

    LEnabled := TFileUtils.RefreshList(
      lstTemplates.Items,
      FParentForm.FullSourceFilesDir,
      FParentForm.ExcludedFileList,
      FLanguageFileList) and
      (Length(Trim(edtSubject.Text)) >= 2); // At least 2 characters
                                            // in the edtSubject field before
                                            // next button is enabled
    PostMessage(Self.Handle, WM_SET_NEXT_ENABLED, Integer(LEnabled), 0);
    PostMessage(Self.Handle, WM_SET_EDITDEL_BTNS_ENABLED, 0, 0);
    PostMessage(Self.Handle, WM_SET_SELECTED_FILE, 0, 0);
  finally
    lstTemplates.Items.EndUpdate;
  end;
end;

end.
