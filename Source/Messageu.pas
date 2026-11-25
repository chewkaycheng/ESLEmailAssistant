unit Messageu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.TitleBarCtrls, scControls,
  scGPControls, scGPFontControls, CWSButton, Vcl.StdCtrls, RzLabel,
  CWSLabelColumn, CWSSettingsPanel, CWSMemo, RzStatus, Vcl.ExtCtrls, RzPanel,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList;

type
  TfrmMessage = class(TForm)
    brTitle: TTitleBarPanel;
    MessageImage: TscGPCharImage;
    pnlButtons: TCWSSettingsPanel;
    btnCancel: TCWSButton;
    btnOk: TCWSButton;
    lblMessage: TRzLabel;
    pnlTitle: TCWSSettingsPanel;
    lblCaption: TCWSLabelColumn;
    memError: TCWSMemo;
    sbMain: TRzStatusBar;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    btnCopy: TCWSButton;
    SVGIconImageList1: TSVGIconImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    procedure ApplyTheme;
  public
  end;

implementation

uses
  System.IOUtils,
  CWSFluentColorsMulti,

  Constsu,
  Utilsu;

{$R *.dfm}

procedure TfrmMessage.ApplyTheme;
var
  LComp: TComponent;
  I: Integer;
begin
  Self.Color := flNeutralBackground1;
  TCWSMemo(memError).BackgroundColor := flNeutralBackground2;
  TCWSMemo(memError).BackgroundFocusColor := flNeutralBackground2;
  TCWSMemo(memError).BackgroundHoverColor := flNeutralBackground1Hover;
  TCWSMemo(memError).BorderColor := flNeutralStroke1;
  TCWSMemo(memError).DisabledColor := flNeutralBackgroundDisabled;
  TCWSMemo(memError).DisabledBorderColor := flNeutralStrokeDisabled;
  TCWSMemo(memError).LabelColor := flNeutralForeground2;
  TCWSMemo(memError).AccentColor := flNeutralForeground2BrandPressed;
  TCWSMemo(memError).Font.Color := flNeutralForeground1;

  TUtils.SetStatusBarColor(sbMain);
  TUtils.SetPanelColor(pnlTitle);
  TUtils.SetPanelColor(pnlButtons);
  lblCaption.LeftFont.Color := flNeutralForeground1;
  for I := 0 to ComponentCount - 1 do  begin
    LComp := Components[I];
    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(LComp as TRzLabel)
    end;
  end;
end;

procedure TfrmMessage.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMessage.btnCopyClick(Sender: TObject);
begin
  memError.SelectAll;
  memError.CopyToClipboard;
  ShowMessage('Error copied to clipboard.');
end;

procedure TfrmMessage.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmMessage.FormCreate(Sender: TObject);
begin
  ScaleForPPI(CurrentPPI);
  RegisterThemeChange(Self.ApplyTheme);
  FluentApplySystemTheme;
  TUtils.AdjustButtonsPanel(pnlButtons);

  Constraints.MinHeight := MulDiv(350, Screen.PixelsPerInch, 96);
  Constraints.MinWidth := MulDiv(540, Screen.PixelsPerInch, 96);
  Width := MulDiv(540, Screen.PixelsPerInch, 96);
  Height := MulDiv(350, Screen.PixelsPerInch, 96);
end;

procedure TfrmMessage.FormDestroy(Sender: TObject);
begin
  UnregisterThemeChange(Self.ApplyTheme);
end;

end.
