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
  try
    inherited FormCreate(Sender);
    TUtils.AdjustButtonsPanel(pnlButtons);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmAuthorize.FormCreate',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmAuthorize.FormDestroy(Sender: TObject);
begin
  inherited FormDestroy(Sender);
end;

procedure TfrmAuthorize.FormShow(Sender: TObject);
begin
  try
    FParentForm.SVGimgSteps.ImageIndex := 4;
    btnNext.Enabled := FParentForm.IsAuthorized;
    btnAuthorize.Enabled := Not(FParentForm.IsAuthorized);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmAuthorize.FormShow',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmAuthorize.ApplyTheme;
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
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmAuthorize.ApplyTheme',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmAuthorize.CheckAuthorization;
begin
  try
    btnAuthorize.Enabled := Not(FParentForm.IsAuthorized);
    btnNext.Enabled := FParentForm.IsAuthorized;

    if FParentForm.IsAuthorized then begin
      stpLeft.Caption :=  '✓ Authorization successful! You may proceed.';
    end else begin
      stpLeft.Caption :=  'Click "Authorize" to connect to Gmail.';
    end;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmAuthorize.CheckAuthorization',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmAuthorize.CWSButton1Click(Sender: TObject);
begin
  try
    FParentForm.ShowSendEmailsForm;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmAuthorize.CWSButton1Click',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmAuthorize.btnAuthorizeClick(Sender: TObject);
begin
  try
    FAuthorizationError := '';
    FAuthorization := FParentForm.iOAuthMain.GetAuthorization();
    FRefreshToken := FParentForm.iOAuthMain.RefreshToken;
    FParentForm.ismtpMain.AuthMechanism := TipwAuthMechanisms.amXOAUTH2;
    FParentForm.ismtpMain.Config('AuthorizationIdentity=' + FAuthorization);
    FParentForm.IsAuthorized := True;
    CheckAuthorization;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmAuthorize.btnAuthorizeClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmAuthorize.btnBackClick(Sender: TObject);
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
        'TfrmAuthorize.btnBackClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

end.
