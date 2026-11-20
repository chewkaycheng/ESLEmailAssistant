unit SendEmailsu;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ImgList,

  CWSButton,
  CWSSettingsPanel,
  CWSProgressCircle,

  SVGIconImageListBase,
  SVGIconImageList,

  RzStatus,
  RzPanel,
  RzLabel,

  Constsu,
  BaseFormu;


type
  TfrmSendEmails = class(TfrmBase)
    pnlButtons: TCWSSettingsPanel;
    btnSendEmails: TCWSButton;
    sbMain: TRzStatusBar;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    SVGIconImageList1: TSVGIconImageList;
    btnBack: TCWSButton;
    CWSSettingsPanel1: TCWSSettingsPanel;
    CWSSettingsPanel3: TCWSSettingsPanel;
    CWSSettingsPanel2: TCWSSettingsPanel;
    circProgress: TCWSProgressCircle;
    CWSSettingsPanel5: TCWSSettingsPanel;
    CWSSettingsPanel4: TCWSSettingsPanel;
    lblChildcareRight: TRzLabel;
    lblChildcareLeft: TRzLabel;
    CWSSettingsPanel6: TCWSSettingsPanel;
    lblNameRight: TRzLabel;
    lblNameLeft: TRzLabel;
    CWSSettingsPanel7: TCWSSettingsPanel;
    lblTeacherRight: TRzLabel;
    lblTeacherLeft: TRzLabel;
    CWSSettingsPanel8: TCWSSettingsPanel;
    lblRoomRight: TRzLabel;
    lblRoomLeft: TRzLabel;
    CWSSettingsPanel9: TCWSSettingsPanel;
    lblClassLevelRight: TRzLabel;
    lblClassLevelLeft: TRzLabel;
    lblSending: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    procedure OnReadCurrentInfo(var Msg: TMessage);
       message WM_READ_CURRENT_INFO;
    procedure OnShowErrorMsg(var Msg: TMessage);
       message WM_SHOW_SEND_ERROR;
    procedure OnSendEmailsCompleted(var Msg: TMessage);
      message WM_SEND_EMAILS_COMPLETED;

  public
  protected
    procedure ApplyTheme; override;
  end;

var
  frmSendEmails: TfrmSendEmails;

implementation

uses
  System.IOUtils,
  CWSFluentColorsMulti,
  RzCommon,

  Utilsu;

{$R *.dfm}

{ TfrmSendEmails }

procedure TfrmSendEmails.btnBackClick(Sender: TObject);
begin
  if Not(FParentForm.SendEmailInitated) then begin
    if FParentForm.IsAuthorized then begin
      FParentForm.ShowPreviewForm;
    end else begin
      FParentForm.ShowAuthorizeForm;
    end;
  end;
end;

procedure TfrmSendEmails.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
end;

procedure TfrmSendEmails.FormDestroy(Sender: TObject);
begin
  inherited FormDestroy(Sender);

end;

procedure TfrmSendEmails.FormShow(Sender: TObject);
begin
  FParentForm.SVGimgSteps.ImageIndex := 5;
end;

procedure TfrmSendEmails.OnReadCurrentInfo(var Msg: TMessage);
begin

end;

procedure TfrmSendEmails.OnSendEmailsCompleted(var Msg: TMessage);
begin
// to implement
end;

procedure TfrmSendEmails.OnShowErrorMsg(var Msg: TMessage);
begin

end;

procedure TfrmSendEmails.ApplyTheme;
var
  I: Integer;
  LComp: TComponent;
begin
  Self.Color := flNeutralBackground1;

  TUtils.SetStatusBarColor(sbMain);
  TUtils.SetTPanelsColor(Self);
  TUtils.SetPanelColor(pnlButtons);

  circProgress.TextColor := flNeutralForeground1;

  for I := 0 to ComponentCount - 1 do  begin
    LComp := Components[I];

    if LComp is TCWSSettingsPanel then begin
      TUtils.SetPanelColor(TCWSSettingsPanel(LComp));
    end;

    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(LComp as TRzLabel)
    end;
  end;
end;

end.
