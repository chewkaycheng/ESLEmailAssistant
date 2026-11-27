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

  BaseFormu,
  FileSystemMonitor,
  Mainu,
  RzAnimtr;

const
  WM_SET_NEXT_ENABLED = WM_USER + 0;
  WM_SET_EDITDEL_BTNS_ENABLED = WM_USER + 1;
  WM_SET_SELECTED_FILE = WM_USER + 2;

type
  TfrmCompose = class(TfrmBase)
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
    SVGIconImageList2: TSVGIconImageList;
    aniArrow: TRzAnimator;
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
    procedure SetCreateBtnEnabled;
    procedure OnSetNextBtnEnabled(var Msg: TMessage);
      message WM_SET_NEXT_ENABLED;
    procedure OnSetEditDelBtnSEnabled(var Msg: TMessage);
      message WM_SET_EDITDEL_BTNS_ENABLED;
    procedure OnSetSelectedFile(var Msg: TMessage);
      message WM_SET_SELECTED_FILE;
    procedure SetSelectedFile;
  protected
    procedure ApplyTheme; override;
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
  inherited FormCreate(Sender);
  try
    FSelectedFile := '';
    FEditing := False;
    cboLanguage.Font.Size := InputFontSize;
    edtSubject.Font.Size := InputFontSize;
    lstTemplates.Font.Size := InputFontSize;
    TUtils.AdjustButtonsPanel(pnlButtons);
    FLanguageFileList := TStringList.Create;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.FormCreate',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(FLanguageFileList) then begin
      FreeAndNil(FLanguageFileList);
    end;
    FStopRefresh := True;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.FormDestroy',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.FormShow(Sender: TObject);
var
  I: Integer;
begin
  try
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
      FMonitor := CreateFileSystemMonitor(
        Self,
        FThreadException);
      FMonitor.AddDirectory(
        FParentForm.FullSourceFilesDir,
        False,
        OnFileChange);
    end;

    FLoading := True;
    try
      edtSubject.Text := FParentForm.SessionIniValues.Subject;
      aniArrow.Visible := Length(Trim(edtSubject.Text)) < 2;
    finally
      FLoading := False;
    end;
    RefreshFileList;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.FormShow',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;


procedure TfrmCompose.SetCreateBtnEnabled;
var
  LCreated: Boolean;
begin
  try
    LCreated := TFileUtils.LanguageContentCreated(
      cboLanguage.Items[cboLanguage.ItemIndex],
        FParentForm.FullSourceFilesDir);
    btnCreateTemplate.Enabled := Not(LCreated);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.SetCreateBtnEnabled',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.SetParentForm(AParent: TfrmMain);
begin
  FParentForm := AParent;
end;

procedure TfrmCompose.ShowEditMessageTemplateForm(ALanguage: String);
begin
  try
    frmEditMessageTemplate.Language :=
      ALanguage;
    frmEditMessageTemplate.ShowModal;
    SetCreateBtnEnabled;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.ShowEditMessageTemplateForm',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;

end;

procedure TfrmCompose.ApplyTheme;
var
  I: Integer;
  LComp: TComponent;
begin
  try
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
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.ApplyTheme',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;

end;

procedure TfrmCompose.btnBackClick(Sender: TObject);
begin
  try
    FParentForm.ShowRecipientsForm;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.btnBackClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
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
    try
      LLanguage :=
        cboLanguage.Items[cboLanguage.ItemIndex];
      ShowEditMessageTemplateForm(LLanguage);
      LIndex := lstTemplates.Items.IndexOf(LLanguage + '.txt');
      if LIndex >= 0 then begin
        FSelectedFile := LLanguage + '.txt';
        lstTemplates.ItemIndex := LIndex;
      end;
    except
      {$IFDEF MadExceptOn}
      raise;
      {$ELSE}
      On E: Exception do begin
        FParentForm.ShowErrorMessage(
          'Error',
          'TfrmCompose.btnCreateTemplateClick',
          E.Message,
          E.StackTrace
          );
      end;
      {$ENDIF}
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
  try
    if (lstTemplates.ItemIndex = -1) then begin
        FParentForm.ShowInfoMessage(
          'Information',
          'Select a file by clicking on the file name.');
        Exit;
      end;

      LFileName :=  lstTemplates.Items[
        lstTemplates.ItemIndex];
      LFullFileName :=
        IncludeTrailingPathDelimiter(FParentForm.FullSourceFilesDir) +
          LFileName;
      if FParentForm.ShowQuestionMessage(
        'Confirm',
        Format(
          'Are you sure you want to delete "%s"?',
          [LFileName])) = mrYes then begin
        if Not(DeleteFile(LFullFileName)) then begin
          FParentForm.ShowInfoMessage(
            'Information',
            Format('Could not delete %s - ', [LFileName]) +
            SysErrorMessage(GetLastError));
        end;
      end;
      SetCreateBtnEnabled;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.btnDeleteTemplateClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.btnEditTemplateClick(Sender: TObject);
var
  ALanguage: String;
begin
  if (lstTemplates.ItemIndex = -1) then begin
    FParentForm.ShowInfoMessage(
      'Infromation',
      'Select a file by clicking on the file name.');
    Exit;
  end;

  try
    ALanguage := lstTemplates.Items[
          lstTemplates.ItemIndex];
    ShowEditMessageTemplateForm(ALanguage);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.btnEditTemplateClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.btnNextClick(Sender: TObject);
begin
  try
    FParentForm.ShowPreviewForm;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.btnNextClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.cboLanguageChange(Sender: TObject);
begin
  try
    SetCreateBtnEnabled;

  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.cboLanguageChange',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.edtSubjectChange(Sender: TObject);
var
  LIniValues: TSessionIniValues;
begin
  try
    if FLoading then begin
      Exit;
    end;

    LIniValues := FParentForm.SessionIniValues;
    LIniValues.Subject := edtSubject.Text;
    FParentForm.SessionIniValues := LIniValues;

    aniArrow.Visible := Length(Trim(edtSubject.Text)) < 2;
    RefreshFileList;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.edtSubjectChange',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;

end;

procedure TfrmCompose.OnFileChange(Sender: TObject; const APath: String;
  AChangeType: TFileChangeType);
begin
  try
    if FStopRefresh then Exit;
  
    case AChangeType of
      TFileChangeType.fcAdded,
      TFileChangeType.fcModified,
      TFileChangeType.fcRenamedOld,
      TFileChangeType.fcRemoved:
        RefreshFileList;
    end;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.OnFileChange',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.OnSetEditDelBtnSEnabled(var Msg: TMessage);
begin
  try
    btnEditTemplate.Enabled := lstTemplates.Items.Count > 0;
    btnDeleteTemplate.Enabled := lstTemplates.Items.Count > 0;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.OnSetEditDelBtnSEnabled',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.OnSetNextBtnEnabled(var Msg: TMessage);
begin
  btnNext.Enabled := Boolean(Msg.WParam);
end;

procedure TfrmCompose.OnSetSelectedFile(var Msg: TMessage);
begin
  try
    SetSelectedFile;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.OnSetSelectedFile',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.SetSelectedFile;
var
  LIndex: Integer;
begin
  try
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
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.SetSelectedFile',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.lstTemplatesClick(Sender: TObject);
begin
  try
    if lstTemplates.ItemIndex <> -1 then begin
      FSelectedFile := lstTemplates.Items[lstTemplates.ItemIndex];
    end;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.lstTemplatesClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmCompose.RefreshFileList;
var
  Files: TArray<String>;
  I: Integer;
  LFileName: String;
  LEnabled: Boolean;
begin
  try
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
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmCompose.RefreshFileList',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

end.
