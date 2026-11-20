object dlgInfo: TdlgInfo
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'dlgInfo'
  ClientHeight = 297
  ClientWidth = 660
  Color = clBtnFace
  CustomTitleBar.Control = brTitle
  CustomTitleBar.Enabled = True
  CustomTitleBar.SystemHeight = False
  CustomTitleBar.ShowCaption = False
  CustomTitleBar.ShowIcon = False
  CustomTitleBar.SystemColors = False
  CustomTitleBar.SystemButtons = False
  CustomTitleBar.BackgroundColor = 13924352
  CustomTitleBar.ForegroundColor = clWhite
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = clWhite
  CustomTitleBar.ButtonBackgroundColor = 13924352
  CustomTitleBar.ButtonHoverForegroundColor = clWhite
  CustomTitleBar.ButtonHoverBackgroundColor = 11166464
  CustomTitleBar.ButtonPressedForegroundColor = clWhite
  CustomTitleBar.ButtonPressedBackgroundColor = 7028224
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 1
  Position = poDefault
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 28
  object lblTitle: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 15
    Width = 630
    Height = 40
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Info!!!'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 83
  end
  object lblDescription: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 74
    Width = 630
    Height = 122
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 5
    Align = alClient
    Caption = 
      'The main window behind this dialog is dimmed by a TCWSDimOverlay' +
      ' component.Close this dialog to fade the overlay back out.'
    WordWrap = True
    ExplicitWidth = 617
    ExplicitHeight = 56
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 201
    Width = 660
    Height = 96
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      660
      96)
    object shpLineBottom: TShape
      Left = 0
      Top = 0
      Width = 660
      Height = 2
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Pen.Width = 2
    end
    object btnOK: TCWSButton
      Left = 420
      Top = 24
      Width = 225
      Height = 53
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Anchors = [akRight, akBottom]
      TabOrder = 0
      IconFontName = 'Segoe MDL2 Assets'
      BckNormalColor = clWhite
      BckHoverColor = clWhitesmoke
      BckPressedColor = 14737632
      BorderColorNormal = 13750737
      BorderColorHover = 13092807
      BorderColorPressed = 11776947
      Caption = 'OK'
      IconColorNormal = 2368548
      IconColorHover = 2368548
      IconColorPressed = 2368548
      CaptionColorNormal = 2368548
      CaptionColorHover = 2368548
      CaptionColorPressed = 2368548
      BckDisabledColor = 15790320
      BorderColorDisabled = 14737632
      CaptionColorDisabled = 12434877
      IconColorDisabled = 12434877
      OnClick = btnOKClick
    end
  end
  object brTitle: TTitleBarPanel
    Left = 0
    Top = 60
    Width = 660
    Height = -1
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    CustomButtons = <>
    ExplicitTop = 57
  end
end
