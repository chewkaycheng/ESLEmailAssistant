object frmAuthorize: TfrmAuthorize
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderStyle = bsNone
  Caption = 'AUTHORIZE'
  ClientHeight = 720
  ClientWidth = 960
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 25
  object lblEmails_Authorize: TRzLabel
    AlignWithMargins = True
    Left = 24
    Top = 12
    Width = 912
    Height = 594
    Margins.Left = 24
    Margins.Top = 12
    Margins.Right = 24
    Margins.Bottom = 12
    Align = alClient
    Caption = 
      'Before Sending mail:'#13#10'  1. Open your browser. Log in to Google M' +
      'ail as esladmin@ibcs.org.'#13#10'  2. Come back to this app and click ' +
      'on the Authorize button.'#13#10'  3. A browser window will open. You m' +
      'ay need to select an account.'#13#10'  4. On the browser page which st' +
      'ates ESLAdmin wants to access your account'#13#10'      click the "All' +
      'ow" button.'#13#10'  5. If you see that the authorization is successfu' +
      'l, close the browser.'#13#10'  6. Click on the Next button to proceed ' +
      'to send the emails.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 832
    ExplicitHeight = 256
  end
  object pnlButtons: TCWSSettingsPanel
    Left = 0
    Top = 648
    Width = 960
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    DoubleBuffered = True
    CornerRadius = 0
    BorderEdges = [beTop]
    object btnBack: TCWSButton
      AlignWithMargins = True
      Left = 527
      Top = 11
      Width = 199
      Height = 50
      Margins.Left = 6
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
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
      Caption = 'Back'
      IconColorNormal = clWhite
      IconColorHover = clWhite
      IconColorPressed = clWhite
      CaptionColorNormal = clWhite
      CaptionColorHover = clWhite
      CaptionColorPressed = clWhite
      BckDisabledColor = 15790320
      BorderColorDisabled = 14737632
      CaptionColorDisabled = 12434877
      IconColorDisabled = 12434877
      IconMode = icmImageList
      Images = SVGIconImageList1
      ImageIndex = 0
      ImageIndexPressed = 0
      OnClick = btnBackClick
    end
    object btnNext: TCWSButton
      AlignWithMargins = True
      Left = 737
      Top = 11
      Width = 199
      Height = 50
      Margins.Left = 6
      Margins.Top = 11
      Margins.Right = 24
      Margins.Bottom = 11
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
      Caption = 'Next'
      IconColorNormal = clWhite
      IconColorHover = clWhite
      IconColorPressed = clWhite
      CaptionColorNormal = clWhite
      CaptionColorHover = clWhite
      CaptionColorPressed = clWhite
      IconPosition = ipRight
      BckDisabledColor = 15790320
      BorderColorDisabled = 14737632
      CaptionColorDisabled = 12434877
      IconColorDisabled = 12434877
      IconMode = icmImageList
      Images = SVGIconImageList1
      ImageIndex = 1
      ImageIndexPressed = 1
    end
    object btnAuthorize: TCWSButton
      AlignWithMargins = True
      Left = 317
      Top = 11
      Width = 199
      Height = 50
      Margins.Left = 6
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
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
      Caption = 'Authorize'
      IconColorNormal = clWhite
      IconColorHover = clWhite
      IconColorPressed = clWhite
      CaptionColorNormal = clWhite
      CaptionColorHover = clWhite
      CaptionColorPressed = clWhite
      BckDisabledColor = 15790320
      BorderColorDisabled = 14737632
      CaptionColorDisabled = 12434877
      IconColorDisabled = 12434877
      IconMode = icmImageList
      Images = SVGIconImageList1
      ImageIndex = 2
      ImageIndexPressed = 2
      OnClick = btnAuthorizeClick
    end
  end
  object sbMain: TRzStatusBar
    Left = 0
    Top = 618
    Width = 960
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    AutoStyle = False
    SimpleFrameStyle = fsNone
    BorderColor = clSilver
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = []
    BorderWidth = 1
    FlatColor = clWhite
    GradientColorStyle = gcsCustom
    StyleElements = [seFont, seClient]
    TabOrder = 1
    VisualStyle = vsClassic
    object stpLeft: TRzStatusPane
      Left = 1
      Top = 1
      Width = 744
      Height = 28
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      FrameStyle = fsNone
      Align = alLeft
      Caption = ''
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitHeight = 27
    end
    object stpRight: TRzStatusPane
      Left = 745
      Top = 1
      Width = 423
      Height = 28
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      BorderWidth = 0
      FillColor = clWhite
      FlatColor = clWhite
      FrameStyle = fsNone
      ParentFillColor = False
      Align = alLeft
      StyleElements = [seFont, seClient]
      Caption = ''
      ExplicitLeft = 746
      ExplicitTop = 2
      ExplicitHeight = 27
    end
  end
  object CWSButton1: TCWSButton
    Left = 54
    Top = 528
    Width = 225
    Height = 48
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 2
    IconFontName = 'Segoe MDL2 Assets'
    BckNormalColor = clWhite
    BckHoverColor = clWhitesmoke
    BckPressedColor = 14737632
    BorderColorNormal = 13750737
    BorderColorHover = 13092807
    BorderColorPressed = 11776947
    Caption = 'Button'
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
    OnClick = CWSButton1Click
  end
  object SVGIconImageList1: TSVGIconImageList
    Size = 24
    SVGIconItems = <
      item
        IconName = 'prev-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M10,22L0,12L10,2l' +
          '1.78,1.77L3.55,12l8.23,8.23L10,22Z"/></svg>'
      end
      item
        IconName = 'next-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M8.03,22L6.25,20.' +
          '23L14.48,12L6.25,3.77L8.03,2l10,10l-10,10Z"/></svg>'
      end
      item
        IconName = 'shield-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M12,22q-3.47-0.88' +
          '-5.74-3.99T4,11.1V5l8-3l8,3v6.1q0,3.8-2.26,6.91T12,22Zm0-2.1q2.6' +
          '-0.82 4.3-3.3T18,11.1V6.38L12,4.13L6,6.38V11.1q0,3.03 1.7,5.5T12' +
          ',19.9ZM12,12Z"/></svg>'
      end>
    Scaled = True
    Left = 568
    Top = 346
  end
end
