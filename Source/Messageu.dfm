object frmMessage: TfrmMessage
  Left = 0
  Top = 0
  Caption = 'MESSAGE'
  ClientHeight = 343
  ClientWidth = 520
  Color = clBtnFace
  CustomTitleBar.Control = brTitle
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 31
  CustomTitleBar.SystemColors = False
  CustomTitleBar.SystemButtons = False
  CustomTitleBar.BackgroundColor = 13924352
  CustomTitleBar.ForegroundColor = 65793
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = 65793
  CustomTitleBar.ButtonBackgroundColor = 13924352
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = 11166464
  CustomTitleBar.ButtonPressedForegroundColor = 7028224
  CustomTitleBar.ButtonPressedBackgroundColor = 15395562
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 31
  Position = poMainFormCenter
  StyleElements = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object lblMessage: TRzLabel
    AlignWithMargins = True
    Left = 100
    Top = 139
    Width = 404
    Height = 126
    Margins.Left = 8
    Margins.Top = 50
    Margins.Right = 16
    Margins.Bottom = 10
    Align = alClient
    Caption = 'lblMessage'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 78
    ExplicitHeight = 21
  end
  object brTitle: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 30
    CustomButtons = <>
  end
  object MessageImage: TscGPCharImage
    AlignWithMargins = True
    Left = 10
    Top = 99
    Width = 72
    Height = 166
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alLeft
    FluentUIOpaque = False
    TabOrder = 1
    CustomImageIndex = -1
    DragForm = False
    DragTopForm = True
    StyleKind = scpsTransparent
    ShowCaption = False
    BorderStyle = scpbsNone
    WallpaperIndex = -1
    LightBorderColor = clBtnHighlight
    ShadowBorderColor = clBtnShadow
    CaptionGlowEffect.Enabled = False
    CaptionGlowEffect.Color = clBtnShadow
    CaptionGlowEffect.AlphaValue = 255
    CaptionGlowEffect.GlowSize = 7
    CaptionGlowEffect.Offset = 0
    CaptionGlowEffect.Intensive = True
    CaptionGlowEffect.StyleColors = True
    Color = 16744448
    Caption = 'MessageImage'
    StorePaintBuffer = False
    WordWrap = False
    DrawTextMode = scdtmGDI
    ImageColor = 16744448
    ImageColorAlpha = 255
    ImageSize = 0
    ImageIndex = 90
    Frame = scgpcfNone
    FrameRadius = 10
    FrameFillColor = clWindow
    FrameFillColorAlpha = 100
    FrameColor = clBtnText
    FrameWidth = 2
    RotationAngle = 0
    AnimationAcceleration = False
    RotateAnimation = False
    Transparent = True
  end
  object pnlButtons: TCWSSettingsPanel
    Left = 0
    Top = 275
    Width = 520
    Height = 48
    Align = alBottom
    DoubleBuffered = True
    CornerRadius = 0
    RoundedCorners = []
    BorderEdges = [beTop]
    object btnCancel: TCWSButton
      AlignWithMargins = True
      Left = 231
      Top = 7
      Width = 133
      Height = 34
      Margins.Top = 7
      Margins.Right = 4
      Margins.Bottom = 7
      Align = alRight
      TabOrder = 0
      ButtonStyle = bsCustom
      IconFontName = 'Segoe MDL2 Assets'
      BckNormalColor = 12413967
      BckHoverColor = 10706449
      BckPressedColor = 6175500
      BorderColorNormal = 12413967
      BorderColorHover = 10706449
      BorderColorPressed = 6175500
      Caption = 'Cancel'
      IconColorNormal = clWhite
      IconColorHover = clWhite
      IconColorPressed = clWhite
      CaptionColorNormal = clWhite
      CaptionColorHover = clWhite
      CaptionColorPressed = clWhite
      IsCancel = True
      BckDisabledColor = 15790320
      BorderColorDisabled = 14737632
      CaptionColorDisabled = 12434877
      IconColorDisabled = 12434877
      IconMode = icmImageList
      Images = SVGIconImageList1
      ImageIndex = 1
      ImageIndexPressed = 1
      OnClick = btnCancelClick
    end
    object btnOk: TCWSButton
      AlignWithMargins = True
      Left = 372
      Top = 7
      Width = 132
      Height = 34
      Margins.Left = 4
      Margins.Top = 7
      Margins.Right = 16
      Margins.Bottom = 7
      Align = alRight
      TabOrder = 1
      ButtonStyle = bsCustom
      IconFontName = 'Segoe MDL2 Assets'
      IconFontSize = 16
      BckNormalColor = 12413967
      BckHoverColor = 10706449
      BckPressedColor = 6175500
      BorderColorNormal = 12413967
      BorderColorHover = 10706449
      BorderColorPressed = 6175500
      Caption = 'Ok'
      IconColorNormal = clWhite
      IconColorHover = clWhite
      IconColorPressed = clWhite
      CaptionColorNormal = clWhite
      CaptionColorHover = clWhite
      CaptionColorPressed = clWhite
      IsDefault = True
      BckDisabledColor = 15790320
      BorderColorDisabled = 14737632
      CaptionColorDisabled = 12434877
      IconColorDisabled = 12434877
      IconMode = icmImageList
      Images = SVGIconImageList1
      ImageIndex = 0
      ImageIndexPressed = 0
      OnClick = btnOkClick
    end
    object btnCopy: TCWSButton
      AlignWithMargins = True
      Left = 91
      Top = 7
      Width = 133
      Height = 34
      Margins.Top = 7
      Margins.Right = 4
      Margins.Bottom = 7
      Align = alRight
      TabOrder = 2
      ButtonStyle = bsCustom
      IconFontName = 'Segoe MDL2 Assets'
      BckNormalColor = 12413967
      BckHoverColor = 10706449
      BckPressedColor = 6175500
      BorderColorNormal = 12413967
      BorderColorHover = 10706449
      BorderColorPressed = 6175500
      Caption = 'Copy Error'
      IconColorNormal = clWhite
      IconColorHover = clWhite
      IconColorPressed = clWhite
      CaptionColorNormal = clWhite
      CaptionColorHover = clWhite
      CaptionColorPressed = clWhite
      IsCancel = True
      BckDisabledColor = 15790320
      BorderColorDisabled = 14737632
      CaptionColorDisabled = 12434877
      IconColorDisabled = 12434877
      IconMode = icmImageList
      Images = SVGIconImageList1
      ImageIndex = 2
      ImageIndexPressed = 2
      OnClick = btnCopyClick
      ExplicitLeft = 231
    end
  end
  object pnlTitle: TCWSSettingsPanel
    Left = 0
    Top = 30
    Width = 520
    Height = 59
    Align = alTop
    DoubleBuffered = True
    RoundedCorners = []
    BorderEdges = [beBottom]
    object lblCaption: TCWSLabelColumn
      AlignWithMargins = True
      Left = 20
      Top = 3
      Width = 497
      Height = 53
      Margins.Left = 20
      LeftText = 'Message'
      LeftFont.Charset = DEFAULT_CHARSET
      LeftFont.Color = clWindowText
      LeftFont.Height = -21
      LeftFont.Name = 'Segoe UI'
      LeftFont.Style = []
      LeftFont.Quality = fqClearTypeNatural
      RightFont.Charset = DEFAULT_CHARSET
      RightFont.Color = clWindowText
      RightFont.Height = -12
      RightFont.Name = 'Segoe UI'
      RightFont.Style = []
      LeftColumnWidth = 300
      Align = alClient
      ExplicitLeft = 232
      ExplicitTop = 32
      ExplicitWidth = 188
      ExplicitHeight = 21
    end
  end
  object memError: TCWSMemo
    AlignWithMargins = True
    Left = 100
    Top = 109
    Width = 404
    Height = 154
    Margins.Left = 8
    Margins.Top = 20
    Margins.Right = 16
    Margins.Bottom = 12
    Text = ''
    ShowAccentBar = False
    BackgroundColor = clLime
    BackgroundFocusColor = clGreen
    BorderColor = clNone
    CornerRadius = 4.00000000000000000
    Align = alClient
    TabOrder = 4
  end
  object sbMain: TRzStatusBar
    Left = 0
    Top = 323
    Width = 520
    Height = 20
    AutoStyle = False
    SimpleFrameStyle = fsNone
    BorderColor = clSilver
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = []
    BorderWidth = 1
    Color = 15987699
    FlatColor = clWhite
    GradientColorStyle = gcsCustom
    StyleElements = [seFont, seClient]
    TabOrder = 5
    VisualStyle = vsClassic
    object stpLeft: TRzStatusPane
      Left = 1
      Top = 1
      Width = 496
      Height = 18
      FrameStyle = fsNone
      Align = alLeft
      Caption = ''
    end
    object stpRight: TRzStatusPane
      Left = 497
      Top = 1
      Width = 281
      Height = 18
      BorderWidth = 0
      FillColor = clWhite
      FlatColor = clWhite
      FrameStyle = fsNone
      ParentFillColor = False
      Align = alLeft
      StyleElements = [seFont, seClient]
      Caption = ''
    end
  end
  object SVGIconImageList1: TSVGIconImageList
    SVGIconItems = <
      item
        IconName = 'check-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M9.55,18l-5.7-5.7' +
          'l1.43-1.42l4.28,4.28l9.18-9.18L20.15,7.4L9.55,18Z"/></svg>'
      end
      item
        IconName = 'cancel-svgrepo-com'
        SVGText = 
          '<?xml version="1.0" encoding="UTF-8"?>'#13#10'<!-- Uploaded to: SVG Re' +
          'po, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg w' +
          'idth="800px" height="800px" viewBox="0 0 512 512" version="1.1" ' +
          'xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.or' +
          'g/1999/xlink">'#13#10'    <title>cancel</title>'#13#10'    <g id="Page-1" st' +
          'roke="none" stroke-width="1" fill="none" fill-rule="evenodd">'#13#10' ' +
          '       <g id="work-case" fill="#000000" transform="translate(91.' +
          '520000, 91.520000)">'#13#10'            <polygon id="Close" points="32' +
          '8.96 30.2933333 298.666667 1.42108547e-14 164.48 134.4 30.293333' +
          '3 1.42108547e-14 1.42108547e-14 30.2933333 134.4 164.48 1.421085' +
          '47e-14 298.666667 30.2933333 328.96 164.48 194.56 298.666667 328' +
          '.96 328.96 298.666667 194.56 164.48">'#13#10#13#10'</polygon>'#13#10'        </g' +
          '>'#13#10'    </g>'#13#10'</svg>'
      end
      item
        IconName = 'copy-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M19,19H8q-0.82,0-' +
          '1.41-0.59T6,17V3Q6,2.17 6.59,1.59T8,1h7l6,6V17q0,0.82-0.59,1.41T' +
          '19,19ZM14,8V3H8V17H19V8H14ZM4,23q-0.82,0-1.41-0.59T2,21V7H4V21H1' +
          '5v2H4ZM8,3V8V3V8v9V3Z"/></svg>'
      end>
    Scaled = True
    Left = 264
    Top = 140
  end
end
