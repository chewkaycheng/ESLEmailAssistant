unit Authorizeu;

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

  SVGIconImageListBase,
  SVGIconImageList,

  RzStatus,
  RzPanel,
  RzLabel,

  BaseFormu;

type
  TfrmAuthorize = class(TfrmBase)
    pnlButtons: TCWSSettingsPanel;
    btnBack: TCWSButton;
    btnNext: TCWSButton;
    SVGIconImageList1: TSVGIconImageList;
    sbMain: TRzStatusBar;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    lblEmails_Authorize: TRzLabel;
    btnAuthorize: TCWSButton;
    CWSButton1: TCWSButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAuthorizeClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure CWSButton1Click(Sender: TObject);
  private
    FIsAuthorized: Boolean;
    FAuthorization: String;
    FAuthorizationError: String;
    FRefreshToken: String;
    procedure CheckAuthorization;
  public
  protected
    procedure ApplyTheme; override;
  end;

var
  frmAuthorize: TfrmAuthorize;

implementation

uses
  System.IOUtils,
  CWSFluentColorsMulti,
  RzCommon,
  ipwtypes,
  Constsu,
  Utilsu;

{$R *.dfm}

procedure TfrmAuthorize.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FIsAuthorized := False;
  TUtils.AdjustButtonsPanel(pnlButtons);
end;

procedure TfrmAuthorize.FormDestroy(Sender: TObject);
begin
  inherited FormDestroy(Sender);
end;

procedure TfrmAuthorize.FormShow(Sender: TObject);
begin
  FParentForm.SVGimgSteps.ImageIndex := 4;
  btnNext.Enabled := FIsAuthorized;
  btnAuthorize.Enabled := Not(FIsAuthorized);
end;

procedure TfrmAuthorize.ApplyTheme;
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
    if LComp is TCWSSettingsPanel then begin
      TUtils.SetPanelColor(TCWSSettingsPanel(LComp));
    end;

    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(LComp as TRzLabel)
    end;

    if LComp is TCWSButton then begin
      TUtils.SetButtonColors(LComp as TCWSButton);
    end;
  end;
end;

procedure TfrmAuthorize.CheckAuthorization;
begin
  btnAuthorize.Enabled := Not(FIsAuthorized);
  btnNext.Enabled := FIsAuthorized;

  if FIsAuthorized then begin
    stpLeft.Caption :=  '✓ Authorization successful! You may proceed.';
  end else begin
    stpLeft.Caption :=  'Click "Authorize" to connect to Gmail.';
  end;
end;

procedure TfrmAuthorize.CWSButton1Click(Sender: TObject);
begin
  FParentForm.ShowSendEmailsForm;
end;

procedure TfrmAuthorize.btnAuthorizeClick(Sender: TObject);
begin
  FAuthorizationError := '';
  try
    FAuthorization := FParentForm.iOAuthMain.GetAuthorization();
    FRefreshToken := FParentForm.iOAuthMain.RefreshToken;
    FParentForm.ismtpMain.AuthMechanism := TipwAuthMechanisms.amXOAUTH2;
    FParentForm.ismtpMain.Config('AuthorizationIdentity=' + FAuthorization);
    FIsAuthorized := True;
    CheckAuthorization;
  except
    On E:Exception do begin
      FIsAuthorized := False;
      ShowMessage('Unable to authorize: ' + E.Message);
    end;
  end;
end;

procedure TfrmAuthorize.btnBackClick(Sender: TObject);
begin
  FParentForm.ShowPreviewForm;
end;

end.
