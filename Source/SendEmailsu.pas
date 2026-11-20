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

  SVGIconImageListBase,
  SVGIconImageList,

  RzStatus,
  RzPanel,
  RzLabel,

  BaseFormu;

type
  TfrmSendEmails = class(TfrmBase)
    pnlButtons: TCWSSettingsPanel;
    btnSendEmails: TCWSButton;
    sbMain: TRzStatusBar;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    SVGIconImageList1: TSVGIconImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
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

  Constsu,
  Utilsu;

{$R *.dfm}

{ TfrmSendEmails }

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

procedure TfrmSendEmails.ApplyTheme;
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

  end;
end;

end.
