unit Utilsu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,

  Vcl.ImgList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.ButtonStylesAttributes,
  Vcl.StyledButton,
  Vcl.TitleBarCtrls,

  RzLstBox,
  RzCommon,
  RzLabel,
  RzCmboBx,
  RzPanel,
  RzTabs,

  SynEdit,

  CWSSettingsPanel,
  CWSButton,
  CWSRadioButton,
  CWSCheckDBGrid,
  CWSEdit,
  CWSComboBox,
  CWSListBox,
  CWSPopupMenu,
  CWSMemo,

  scGPControls,

  SVGIconImageListBase,
  SVGIconImageList,
  SVGIconImage,

  Constsu;

type
  TUtils = class
  private
  public
    class procedure SetTPanelsColor(AForm: TForm);
    class procedure SetTitlebarColor(ATitlebar: TTitleBar);
    class procedure SetPanelColor(APanel: TCWSSettingsPanel);
    class procedure SetThemeButtonColor(ABtn: TCWSButton);
    class procedure SetRadioButtonColor(ARadioBtn: TCWSRadioButton);
    class procedure SetGridColor(AGrid: TCWSCheckDBGrid);
    class procedure SetLabelColor(ALabel: TRZLabel);
    class procedure SetEditColor(AEdit: TCWSEdit);
    class procedure SetComboBoxColor(AComboBox: TCWSComboBox);
    class procedure SetListBoxColor(AListBox: TCWSListBox);
    class procedure SetMenuButtonColor(AButton: TscGPButton);
    class procedure SetStatusBarColor(AStatusBar: TRzStatusBar);
    class procedure SetPopUpMenuColor(AMenu: TCWSPopupMenu);
    class procedure SetSynEditColors(AEdit: TSynEdit);
    class procedure AdjustButtonsPanel(APanel: TCWSSettingsPanel);
    class procedure SetMemoColor(AMemo: TCWSMemo);

    class procedure EnsureDirectoryCreated(ADirectory: String);
    class procedure SetButtonColors(AButton: TCWSButton);

    class function FormatErrorMessage(
      AProcName: String;
      AErrorMsg: String;
      ACallStack: String): String;
  end;

implementation

uses
  CWSFluentColorsMulti,

  System.IOUtils,
  System.UITypes;

{ TUiUtils }

function AlphaColorToColor(const A: TAlphaColor): TColor;
var
  C: TAlphaColorRec absolute A;
begin
  Result := TColor($00000000 or (C.B shl 16) or (C.G shl 8) or C.R);
end;

class procedure TUtils.SetPanelColor(APanel: TCWSSettingsPanel);
begin
  APanel.Color := flNeutralBackground1;
  APanel.FillColor := flNeutralBackground1;
  APanel.BorderColor := flNeutralStroke1;
end;

class procedure TUtils.SetPopUpMenuColor(AMenu: TCWSPopupMenu);
begin
  AMenu.BackgroundColor := flNeutralBackground1;
  AMenu.BorderColor := flNeutralStroke1;
  AMenu.TextColor := flNeutralForeground1;
  AMenu.DisabledTextColor := flNeutralForegroundDisabled;
  AMenu.HighlightColor := flNeutralBackground1Hover;
  AMenu.HighlightTextColor := flNeutralForeground1;
  AMenu.SeparatorColor := flNeutralStroke1;
  AMenu.ShortCutColor := flNeutralForeground3;
end;

class procedure TUtils.SetRadioButtonColor(ARadioBtn: TCWSRadioButton);
begin
  ARadioBtn.RadioColorNormal := flNeutralForeground3;
  ARadioBtn.RadioColorChecked := flBrandBackground;
  ARadioBtn.RadioColorDisabled := flNeutralStrokeDisabled;
  ARadioBtn.FillColorNormal := flNeutralBackground3;
  ARadioBtn.FillColorDisabled := flNeutralBackgroundDisabled;
  ARadioBtn.DotColor := clWhite;
  ARadioBtn.FontColorNormal := flNeutralForeground1;
  ARadioBtn.FontColorChecked := flNeutralForeground1;
  ARadioBtn.FontColorDisabled := flNeutralForegroundDisabled;
end;

class procedure TUtils.SetStatusBarColor(AStatusBar: TRzStatusBar);
begin
  AStatusBar.Font.Color := flNeutralForeground1;
  AStatusBar.Color := flNeutralBackground1;
end;

class procedure TUtils.SetSynEditColors(AEdit: TSynEdit);
begin
  AEdit.Color :=  flNeutralBackground2;
  AEdit.Font.Color := flNeutralForeground1;
end;

class procedure TUtils.SetThemeButtonColor(ABtn: TCWSButton);
begin
  ABtn.Color := flNeutralBackground1;
  ABtn.BckNormalColor := flNeutralBackground1;
  ABtn.BckHoverColor := flNeutralBackground1Hover;
  ABtn.BckPressedColor := flNeutralBackground1Pressed;

  ABtn.BorderColorNormal := flNeutralStroke1;
  ABtn.BorderColorHover := flNeutralStroke1;
  ABtn.BorderColorPressed := flNeutralStroke1;

  ABtn.IconColorNormal := flNeutralForeground3;
  ABtn.IconColorHover := flNeutralForeground1Hover;
  ABtn.IconColorPressed := flNeutralForeground2BrandPressed;
end;

class procedure TUtils.SetTitlebarColor(ATitlebar: TTitleBar);
begin
  ATitlebar.BackgroundColor := flNeutralBackground1;
  ATitlebar.ButtonBackgroundColor := flNeutralBackground1;
  ATitlebar.ButtonForegroundColor := flNeutralForeground1;
  ATitlebar.ButtonHoverBackgroundColor := flNeutralBackground1Hover;
  ATitlebar.ButtonHoverForegroundColor := flNeutralForeground1Hover;
  ATitlebar.ButtonInactiveBackgroundColor := flNeutralBackground1;
  ATitlebar.ButtonInactiveForegroundColor := flNeutralForegroundDisabled;
  ATitlebar.ButtonPressedBackgroundColor := flNeutralBackground1Pressed;
  ATitlebar.ButtonPressedForegroundColor := flNeutralForeground1Pressed;
  ATitlebar.ForegroundColor := flNeutralForeground1;
  ATitlebar.InactiveBackgroundColor := flNeutralBackground1;
  ATitlebar.InactiveForegroundColor := flNeutralForegroundDisabled;
end;

class procedure TUtils.SetTPanelsColor(AForm: TForm);
var
  I: Integer;
begin
  for I := 0 to AForm.ComponentCount - 1 do begin
    if AForm.Components[i] is TPanel then begin
      (AForm.Components[i] as TPanel).Color := flNeutralBackground1;
    end;
  end;
end;

class procedure TUtils. AdjustButtonsPanel(APanel: TCWSSettingsPanel);
begin
  APanel.Align := alNone;
  APanel.Align := alBottom;
  APanel.BringToFront;
end;

class procedure TUtils.EnsureDirectoryCreated(ADirectory: String);
begin
  // Check if the directory needs to be created
  if Not(TDirectory.Exists(ADirectory)) then begin
    TDirectory.CreateDirectory(ADirectory);
  end;
end;

class function TUtils.FormatErrorMessage(
  AProcName,
  AErrorMsg,
  ACallStack: String): String;
begin
  Result := 'An Error has occurred in the application. Click on the Copy Error ' +
            'button to copy the message to notepad, then save the file and send to ' +
            'tech support.' + #13#10 + #13#10;
  Result := Result + 'Procedure/Function: ' + AProcName + #13#10;
  Result := Result + 'Error Message: ' + AErrorMsg + #13#10 + #13#10;
  Result := Result + 'Call Stack: ' + ACallStack;
end;

class procedure TUtils.SetButtonColors(AButton: TCWSButton);
begin
  TCWSButton(AButton).BckNormalColor := flBrandBackground;
  TCWSButton(AButton).BckHoverColor := flBrandBackgroundHover;
  TCWSButton(AButton).BckPressedColor := flBrandBackgroundSelected;
  TCWSButton(AButton).BckDisabledColor := clNone;

  TCWSButton(AButton).BorderColorNormal := flBrandBackground;
  TCWSButton(AButton).BorderColorHover := flBrandBackgroundHover;
  TCWSButton(AButton).BorderColorPressed := flBrandBackgroundSelected;
  TCWSButton(AButton).BorderColorDisabled := $00BDBDBD;

  TCWSButton(AButton).CaptionColorHover := clWhite;
  TCWSButton(AButton).CaptionColorNormal := clWhite;
  TCWSButton(AButton).CaptionColorDisabled := clWebSlateGray;

  TCWSButton(AButton).IconColorHover := clWhite;
  TCWSButton(AButton).IconColorNormal := clWhite;
end;

class procedure TUtils.SetComboBoxColor(AComboBox: TCWSComboBox);
begin
  TCWSComboBox(AComboBox).BackgroundColor := flNeutralBackground2;
  TCWSComboBox(AComboBox).DropdownBackColor := flNeutralBackground2;
  TCWSComboBox(AComboBox).BackgroundHoverColor := flNeutralBackground1Hover;
  TCWSComboBox(AComboBox).BorderColor := flNeutralStroke1;
  TCWSComboBox(AComboBox).DropdownBorderColor := flNeutralStroke1;

  TCWSComboBox(AComboBox).DisabledColor := flNeutralBackgroundDisabled;
  TCWSComboBox(AComboBox).DisabledBorderColor := flNeutralStrokeDisabled;

  TCWSComboBox(AComboBox).AccentColor := flNeutralForeground2BrandPressed;

  TCWSComboBox(AComboBox).Font.Color := flNeutralForeground1;
  TCWSComboBox(AComboBox).ItemHighlightColor := flNeutralBackground1Selected;
  TCWSComboBox(AComboBox).ItemHighlightPressedColor := flNeutralBackground1Selected;
  TCWSComboBox(AComboBox).ItemHighlightTextColor := flNeutralForeground2;
  TCWSComboBox(AComboBox).ItemNormalTextColor := flNeutralForeground1;
  TCWSComboBox(AComboBox).TextColor := flNeutralForeground1;
end;


class procedure TUtils.SetEditColor(AEdit: TCWSEdit);
begin
  AEdit.BackgroundColor := flNeutralBackground2;
  AEdit.BackgroundFocusColor := flNeutralBackground2;
  AEdit.BackgroundHoverColor := flNeutralBackground1Hover;
  AEdit.BorderColor := flNeutralStroke1;
  AEdit.ButtonHoverColor := flNeutralBackground2Hover;
  AEdit.ButtonPressedColor := flNeutralBackground2Selected;

  AEdit.ButtonIconColor := flNeutralForeground1;
  AEdit.DisabledColor := flNeutralBackgroundDisabled;
  AEdit.DisabledBorderColor := flNeutralStrokeDisabled;

  AEdit.LabelColor := flNeutralForeground2;

  AEdit.AccentColor := flNeutralForeground2BrandPressed;

  AEdit.Font.Color := flNeutralForeground1;
end;

class procedure TUtils.SetGridColor(AGrid: TCWSCheckDBGrid);
begin
  AGrid.BackgroundColor := flNeutralBackground2;
  AGrid.BorderColor := flNeutralStroke1;
  AGrid.CellTextColor := flNeutralForeground1;
  AGrid.CellColor := flNeutralBackground2;
  AGrid.FixedColor := flNeutralBackground1;
  AGrid.FixedTextColor := flNeutralForeground1;
  AGrid.CellHighlightColor := flBrandBackgroundSelected;
  AGrid.GridLineColor := flNeutralStroke1;
  AGrid.CellTextColor := flNeutralForeground1;
  AGrid.Font.Color := flNeutralForeground1;
end;

class procedure TUtils.SetLabelColor(ALabel: TRZLabel);
begin
  ALabel.Font.Color := flNeutralForeground1;
  ALabel.Color := flNeutralBackground1;
end;

class procedure TUtils.SetListBoxColor(AListBox: TCWSListBox);
begin
  AListBox.BackgroundColor := flNeutralBackground2;
  AListBox.BackgroundHoverColor := flNeutralBackground1Hover;
  AListBox.BorderColor := flNeutralStroke1;

  AListBox.DisabledColor := flNeutralBackgroundDisabled;
  AListBox.DisabledBorderColor := flNeutralStrokeDisabled;


  AListBox.AccentColor := flNeutralForeground2BrandPressed;
  AListBox.BackgroundFocusColor := flNeutralBackground2;
  AListBox.Font.Color := flNeutralForeground1;
  //AListBox.TextColor := flNeutralForeground1;
end;

class procedure TUtils.SetMemoColor(AMemo: TCWSMemo);
begin
  AMemo.BackgroundColor := flNeutralBackground2;
  AMemo.BackgroundFocusColor := flNeutralBackground2;
  AMemo.BackgroundHoverColor := flNeutralBackground1Hover;
  AMemo.BorderColor := flNeutralStroke1;

  AMemo.DisabledColor := flNeutralBackgroundDisabled;
  AMemo.DisabledBorderColor := flNeutralStrokeDisabled;

  AMemo.LabelColor := flNeutralForeground2;

  AMemo.AccentColor := flNeutralForeground2BrandPressed;

  AMemo.Font.Color := flNeutralForeground1;
end;

class procedure TUtils.SetMenuButtonColor(AButton: TscGPButton);
begin
  AButton.Options.NormalColor := flNeutralBackground1;
  AButton.Options.HotColor := flNeutralBackground1Hover;
  AButton.Options.PressedColor := flNeutralBackground3;
  AButton.Options.FocusedColor := flNeutralBackground3;
  AButton.Options.FontNormalColor := flNeutralforeground1;
  AButton.Options.FontHotColor := flNeutralforeground1;

  AButton.Options.FrameNormalColor := clNone;
  AButton.Options.FrameHotColor := clNone;
  AButton.Options.FrameFocusedColor := clNone;
  AButton.Options.FrameDisabledColor := clNone;
  AButton.Options.FrameWidth := 0;

  AButton.Options.DisabledColor := flNeutralBackground1;
end;

end.
