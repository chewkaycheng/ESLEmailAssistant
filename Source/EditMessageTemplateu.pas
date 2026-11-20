unit EditMessageTemplateu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  System.ImageList,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.TitleBarCtrls,
  Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan,
  Vcl.ToolWin,
  Vcl.ActnCtrls,
  Vcl.ActnMenus,
  Vcl.StdActns,
  Vcl.ActnList,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.Menus,
  Vcl.StdCtrls,

  scControls,
  scGPControls,
  scGPPagers,
  scImageCollection,
  scGPImages,
  scDrawUtils,

  CWSButton,
  CWSSystemMenu,
  CWSStoreButton,
  SVGIconImageListBase,
  SVGIconImageList,
  CWSSettingsPanel,
  CWSPopupMenu,

  SynEditMiscClasses,
  SynEdit,

  RzButton,
  RzPanel,
  RzCommon,
  RzStatus,
  RzLabel,

  Mainu;

const
  EM_SETUNDOLIMIT = WM_USER + 84;

type
  TfrmEditMessageTemplate = class(TForm)
    brTitle: TTitleBarPanel;
    SVGIconImageList1: TSVGIconImageList;
    pnlMenuButtons: TCWSSettingsPanel;
    pnlRight: TCWSSettingsPanel;
    pnlLeft: TCWSSettingsPanel;
    pnlCenter: TCWSSettingsPanel;
    vimlEmailContentSmall: TscGPVirtualImageList;
    icolEmailContentSmall: TscGPImageCollection;
    icolEmailContentLarge: TscGPImageCollection;
    vimlEmailContentLarge: TscGPVirtualImageList;
    popMenuTemplate: TCWSPopupMenu;
    File2: TMenuItem;
    Save1: TMenuItem;
    N3: TMenuItem;
    Exit2: TMenuItem;
    btnSave: TscGPButton;
    btnExit: TscGPButton;
    btnUndo: TscGPButton;
    btnPaste: TscGPButton;
    btnRedo: TscGPButton;
    btnCopy: TscGPButton;
    btnCut: TscGPButton;
    btnStudentName: TscGPButton;
    btnChildcareLevel: TscGPButton;
    btnTeacherName: TscGPButton;
    btnClassLevel: TscGPButton;
    btnRoomNumber: TscGPButton;
    pnlMessageTemplate: TCWSSettingsPanel;
    edtMessageTemplate: TSynEdit;
    aclEmailContent: TActionList;
    FileNew: TAction;
    FileOpen: TAction;
    FileSave: TAction;
    FileSaveAs: TAction;
    FileExit: TAction;
    EditCut: TEditCut;
    EditCopy: TEditCopy;
    EditPaste: TEditPaste;
    StudentName: TAction;
    RoomNumber: TAction;
    TeacherName: TAction;
    ClassLevel: TAction;
    Childcare: TAction;
    EditUndo: TEditUndo;
    EditSynEditRedo: TSynEditRedo;
    sbMain: TRzStatusBar;
    stpSpacer: TRzStatusPane;
    stpLeft: TRzStatusPane;
    Edit2: TMenuItem;
    Undo2: TMenuItem;
    Redo2: TMenuItem;
    N4: TMenuItem;
    Cut2: TMenuItem;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    InsertToken1: TMenuItem;
    StudentName2: TMenuItem;
    eacherName1: TMenuItem;
    RoomNumber2: TMenuItem;
    ClassLevel2: TMenuItem;
    ChildcareLevel1: TMenuItem;
    pnlPopup: TCWSSettingsPanel;
    btnPopup: TscGPButton;
    CWSSettingsPanel1: TCWSSettingsPanel;
    lblInstructions: TRzLabel;
    stpRight: TRzStatusPane;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FileExitExecute(Sender: TObject);
    procedure btnPopupClick(Sender: TObject);
    procedure edtMessageTemplateChange(Sender: TObject);
    procedure UpdateStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FileSaveExecute(Sender: TObject);
    procedure InsertToken(AToken: String);
    procedure StudentNameExecute(Sender: TObject);
    procedure RoomNumberExecute(Sender: TObject);
    procedure TeacherNameExecute(Sender: TObject);
    procedure ChildcareExecute(Sender: TObject);
    procedure ClassLevelExecute(Sender: TObject);
  private
    { Private declarations }
    FLanguage: String;
    FParentForm: TfrmMain;
    FHighlighting: Boolean;
    FUserEdited: Boolean;
    FSourceFile: String;
    procedure ApplyTheme;
  public
    property Language: String
      read FLanguage
      write FLanguage;
    procedure SetParentForm(AParent: TfrmMain);
  end;

var
  frmEditMessageTemplate: TfrmEditMessageTemplate;

implementation

uses
  System.IOUtils,

  CWSFluentColorsMulti,

  Constsu,
  Utilsu,
  IniFileHandleru,
  FileUtilsu,
  SynHighlighterEmailTokens;

{$R *.dfm}

procedure TfrmEditMessageTemplate.FileExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditMessageTemplate.FileSaveExecute(Sender: TObject);
begin
  if not(FUserEdited) or (Length(Trim(edtMessageTemplate.Text)) = 0) then Exit;
  //edtMessageTemplate.PlainText := True;
  edtMessageTemplate.Lines.SaveToFile(FSourceFile, TEncoding.UTF8);
  FUserEdited := False;
  stpLeft.Caption :=  'Saved: ' + FSourceFile;
  UpdateStatusBar;
end;

procedure TfrmEditMessageTemplate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FUserEdited then begin
    if Length(Trim(edtMessageTemplate.Text)) = 0 then begin
      ShowMessage('There is no content in the email message. The file will not be saved.');
      Close;
    end else begin
      if (MessageDlg(
        'The file ' + FLanguage + '.txt has been modified. ' +  #10#13 +
        'Do you wish to save the file?',
       TMsgDlgType.mtConfirmation,
       [mbYes, mbNo], 0, mbNo)) = mrYes then begin
        edtMessageTemplate.Lines.SaveToFile(FSourceFile, TEncoding.UTF8);
        FUserEdited := False;
      end;
    end;
  end;
  edtMessageTemplate.Text := '';
end;

procedure TfrmEditMessageTemplate.FormCreate(Sender: TObject);
var
  LHighlighter: TSynHighlighterEmailTokens;
begin
  RegisterThemeChange(Self.ApplyTheme);
  FluentApplySystemTheme;

  Width  := MulDiv(860, Screen.PixelsPerInch, 96);
  Height := MulDiv(700, Screen.PixelsPerInch, 96);

  LHighlighter := TSynHighlighterEmailTokens.Create(Self);
  edtMessageTemplate.Highlighter := LHighlighter;
  popMenuTemplate.FOnt.Size := 9;
end;

procedure TfrmEditMessageTemplate.FormShow(Sender: TObject);
begin
  ScaleForPPI(CurrentPPI);
  Caption := 'Edit Message Template (Language: ' +
             Uppercase(FLanguage) + ')';

  FHighlighting := False;
  FUserEdited := False;
  NotifyThemeChange;

  if Pos('.txt', FLanguage) > 0 then begin
    FSourceFile := IncludeTrailingPathDelimiter(
      FParentForm.FullSourceFilesDir) + FLanguage;
  end else begin
    FSourceFile := IncludeTrailingPathDelimiter(
      FParentForm.FullSourceFilesDir) + FLanguage + '.txt';
  end;
  if TFile.Exists(FSourceFile) then begin
    //edtMessageTemplate.PlainText := True;
    edtMessageTemplate.Lines.LoadFromFile(FSourceFile, TEncoding.UTF8);
    edtMessageTemplate.ClearUndo;
  end else begin
    edtMessageTemplate.Clear;
    edtMessageTemplate.ClearUndo;
  end;

  stpLeft.Caption := 'Editing ' + FSourceFile;

  lblInstructions.Caption := Format('Copy the %s content of the message template ' +
    'from the source document and paste below.' + #13#10 +
    'Right click to insert a Student Name token, a Teacher Name token, etc.',
      [UpperCase(FLanguage)]);
  UpdateStatusBar;

  // Reset after load+highlight so initial state is clean
  FUserEdited := False;
  FileSave.Enabled := False;
  btnSave.Enabled := False;

//  if FluentThemeMode = ftmDark  then begin
//     mmMain.ThemeKind := TDaisyThemeKind.dtDark;
//  end else begin
//     mmMain.ThemeKind := TDaisyThemeKind.dtInherit;
//  end;

end;

procedure TfrmEditMessageTemplate.InsertToken(AToken: String);
var
  LSelStart: Integer;
begin
  LSelStart := edtMessageTemplate.SelStart;
  edtMessageTemplate.SelLength := 0;
  edtMessageTemplate.SelText := AToken;
  edtMessageTemplate.SelStart := LSelStart + Length(AToken);
  edtMessageTemplate.SelLength := 0;
  edtMessageTemplate.SetFocus;
end;

procedure TfrmEditMessageTemplate.RoomNumberExecute(Sender: TObject);
begin
  InsertToken('{Room}');
end;

procedure TfrmEditMessageTemplate.SetParentForm(AParent: TfrmMain);
begin
  FParentForm := AParent;
end;

procedure TfrmEditMessageTemplate.StudentNameExecute(Sender: TObject);
begin
  InsertToken('{StudentName}');
end;

procedure TfrmEditMessageTemplate.TeacherNameExecute(Sender: TObject);
begin
  InsertToken('{TeacherName}');
end;

procedure TfrmEditMessageTemplate.UpdateStatusBar;
begin
  stpRight.Caption :=  Format('Lines: %d', [edtMessageTemplate.Lines.Count]);
end;

procedure TfrmEditMessageTemplate.btnPopupClick(Sender: TObject);
var
  P: TPoint;
begin
  P := btnPopup.ClientToScreen(Point(0, btnPopup.Height));
  popMenuTemplate.Popup(P.X, P.Y);
end;

procedure TfrmEditMessageTemplate.ChildcareExecute(Sender: TObject);
begin
  InsertToken('{ChildcareLevel}');
end;

procedure TfrmEditMessageTemplate.ClassLevelExecute(Sender: TObject);
begin
  InsertToken('{ClassLevel}');
end;

procedure TfrmEditMessageTemplate.edtMessageTemplateChange(Sender: TObject);
begin
  UpdateStatusBar;
  // Only flag as edited if this is a user change, not our highlighting
  FUserEdited := True;
  FileSave.Enabled := True;
  btnSave.Enabled := True;
end;

procedure TfrmEditMessageTemplate.ApplyTheme;
var
  I: Integer;
  LComp: TComponent;
begin
  Self.Color := flNeutralBackground1;
  TUtils.SetTitlebarColor(Self.CustomTitleBar);

  for I := 0 to ComponentCount - 1 do begin
    LComp := Components[i];

    if LComp Is TSynEdit then begin
      TUtils.SetSynEditColors(TSynEdit(LComp));
    end;

    if LComp Is TRzStatusBar then begin
      TUtils.SetStatusBarColor(TRzStatusBar(LComp));
    end;

    if LComp Is TCWSPopupMenu then begin
      TUtils.SetPopUpMenuColor(TCWSPopupMenu(LComp));
    end;

    if LComp is TCWSSettingsPanel then begin
      TUtils.SetPanelColor(TCWSSettingsPanel(LComp));
    end;

    if LComp is TscGPButton then begin
      TUtils.SetMenuButtonColor(TscGPButton(LComp));
    end;

    if LComp is TCWSSettingsPanel then begin
      TUtils.SetPanelColor(TCWSSettingsPanel(LComp));
    end;

    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(TRzLabel(LComp));
    end;

    if LComp is TRzToolbarButton then begin
      TRzToolbarButton(LComp).Caption := '';
      TRzToolbarButton(LComp).ShowCaption := False;
    end;
  end;

  Invalidate;
end;

procedure TfrmEditMessageTemplate .FormDestroy(Sender: TObject);
begin
  UnregisterThemeChange(Self.ApplyTheme);
end;


end.
