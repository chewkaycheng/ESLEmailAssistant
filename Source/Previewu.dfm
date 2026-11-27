object frmPreview: TfrmPreview
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'PREVIEW'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object sbMain: TRzStatusBar
    Left = 0
    Top = 460
    Width = 640
    Height = 20
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
    TabOrder = 0
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
      Width = 422
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
  object pnlButtons: TCWSSettingsPanel
    Left = 0
    Top = 412
    Width = 640
    Height = 48
    Align = alBottom
    DoubleBuffered = True
    CornerRadius = 0
    BorderEdges = [beTop]
    object btnNewSession: TCWSButton
      AlignWithMargins = True
      Left = 351
      Top = 7
      Width = 133
      Height = 34
      Margins.Left = 4
      Margins.Top = 7
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
      ImageIndex = 1
      ImageIndexPressed = 1
      OnClick = btnNewSessionClick
    end
    object btnNext: TCWSButton
      AlignWithMargins = True
      Left = 491
      Top = 7
      Width = 133
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
      ImageIndex = 0
      ImageIndexPressed = 0
      OnClick = btnNextClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 43
    Width = 640
    Height = 369
    Margins.Left = 12
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    Padding.Left = 16
    Padding.Top = 16
    Padding.Right = 16
    Padding.Bottom = 12
    ParentBackground = False
    TabOrder = 2
    object memPreview: TCWSMemo
      Left = 17
      Top = 17
      Width = 606
      Height = 339
      Text = ''
      ReadOnly = True
      CornerRadius = 6.00000000000000000
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlStudent: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 43
    Margins.Left = 12
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object lblStudent: TRzLabel
      AlignWithMargins = True
      Left = 17
      Top = 4
      Width = 184
      Height = 35
      Margins.Left = 16
      Align = alLeft
      Caption = 'Select a student to preview:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      CenterPoint = cpLowerRight
      ExplicitHeight = 20
    end
    object cboStudent: TCWSComboBox
      AlignWithMargins = True
      Left = 234
      Top = 9
      Width = 389
      Height = 30
      Margins.Left = 30
      Margins.Top = 8
      Margins.Right = 16
      Style = csDropDownList
      CornerRadius = 4.00000000000000000
      DropdownCornerRadius = 8.00000000000000000
      ItemHighlightCornerRadius = 4.00000000000000000
      Text = ''
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnChange = cboStudentChange
    end
  end
  object SVGIconImageList1: TSVGIconImageList
    SVGIconItems = <
      item
        IconName = 'next-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M8.03,22L6.25,20.' +
          '23L14.48,12L6.25,3.77L8.03,2l10,10l-10,10Z"/></svg>'
      end
      item
        IconName = 'prev-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M10,22L0,12L10,2l' +
          '1.78,1.77L3.55,12l8.23,8.23L10,22Z"/></svg>'
      end>
    Scaled = True
    Left = 596
    Top = 342
  end
  object ScrollTimer: TTimer
    Left = 386
    Top = 462
  end
end
