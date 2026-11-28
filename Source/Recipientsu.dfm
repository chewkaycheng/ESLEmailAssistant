object frmRecipients: TfrmRecipients
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderStyle = bsNone
  Caption = 'RECIPIENTS'
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
    TabOrder = 0
    VisualStyle = vsClassic
    object stpLeft: TRzStatusPane
      Left = 25
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
      ExplicitLeft = 26
      ExplicitTop = 2
      ExplicitHeight = 27
    end
    object stpRight: TRzStatusPane
      Left = 769
      Top = 1
      Width = 421
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
      ExplicitLeft = 770
      ExplicitTop = 2
      ExplicitHeight = 27
    end
    object stpSpacer: TRzStatusPane
      Left = 1
      Top = 1
      Width = 24
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
    object btnGenerateList: TCWSButton
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
      TabOrder = 0
      ButtonStyle = bsCustom
      IconFontName = 'Segoe MDL2 Assets'
      BckNormalColor = 12413967
      BckHoverColor = 10706449
      BckPressedColor = 6175500
      BorderColorNormal = 12413967
      BorderColorHover = 10706449
      BorderColorPressed = 6175500
      Caption = 'Generate List'
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
      OnClick = btnGenerateListClick
    end
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
      TabOrder = 2
      ButtonStyle = bsCustom
      IconFontName = 'Segoe MDL2 Assets'
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
  object pnlRecipients: TPanel
    Left = 0
    Top = 0
    Width = 960
    Height = 618
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object pnlChoose: TPanel
      Left = 1
      Top = 1
      Width = 958
      Height = 36
      Margins.Left = 12
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 1
      Color = clWhite
      Padding.Left = 24
      ParentBackground = False
      TabOrder = 0
      object lblChoose: TRzLabel
        Left = 25
        Top = 1
        Width = 616
        Height = 34
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        Caption = 'Choose which students to include in the Email Recipient List:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlBottom
        ExplicitLeft = 26
        ExplicitTop = 2
        ExplicitHeight = 31
      end
    end
    object pnlSelectBtns: TPanel
      Left = 723
      Top = 151
      Width = 236
      Height = 466
      Margins.Left = 12
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      BevelOuter = bvNone
      BorderWidth = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object pnlClearAllBtn: TPanel
        Left = 1
        Top = 52
        Width = 234
        Height = 64
        Margins.Left = 12
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 1
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object btnClearAll: TCWSButton
          AlignWithMargins = True
          Left = 7
          Top = 13
          Width = 202
          Height = 49
          Margins.Left = 6
          Margins.Top = 12
          Margins.Right = 24
          Margins.Bottom = 0
          Align = alTop
          Color = clBtnFace
          TabOrder = 0
          ButtonStyle = bsCustom
          IconFontName = 'Segoe MDL2 Assets'
          BckNormalColor = 12413967
          BckHoverColor = 10706449
          BckPressedColor = 6175500
          BorderColorNormal = 12413967
          BorderColorHover = 10706449
          BorderColorPressed = 6175500
          Caption = 'Clear All'
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
          ImageIndex = 4
          ImageIndexPressed = 4
          OnClick = btnClearAllClick
        end
      end
      object pnlSelectAllBtn: TPanel
        Left = 1
        Top = 1
        Width = 234
        Height = 51
        Margins.Left = 12
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 6
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 1
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object btnSelectAll: TCWSButton
          AlignWithMargins = True
          Left = 7
          Top = 1
          Width = 202
          Height = 49
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 24
          Margins.Bottom = 0
          Align = alTop
          Color = clBtnFace
          TabOrder = 0
          ButtonStyle = bsCustom
          IconFontName = 'Segoe MDL2 Assets'
          BckNormalColor = 12413967
          BckHoverColor = 10706449
          BckPressedColor = 6175500
          BorderColorNormal = 12413967
          BorderColorHover = 10706449
          BorderColorPressed = 6175500
          Caption = 'Select All'
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
          ImageIndex = 3
          ImageIndexPressed = 3
          OnClick = btnSelectAllClick
        end
      end
    end
    object pnlGridsOuter: TPanel
      Left = 1
      Top = 151
      Width = 722
      Height = 466
      Margins.Left = 12
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      Color = clWhite
      Padding.Left = 24
      Padding.Right = 5
      Padding.Bottom = 15
      ParentBackground = False
      TabOrder = 2
      object pnlGridsInner: TPanel
        Left = 25
        Top = 1
        Width = 691
        Height = 449
        Margins.Left = 12
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 1
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object grdStudentsByClassLevels: TCWSCheckDBGrid
          Left = 1
          Top = 1
          Width = 689
          Height = 447
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -21
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          CornerRadiusF = 6.00000000000000000
        end
        object grdStudentsByCountries: TCWSCheckDBGrid
          Left = 144
          Top = 96
          Width = 437
          Height = 245
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -21
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          CornerRadiusF = 6.00000000000000000
        end
      end
    end
    object pnlRadioBtnsOuter: TPanel
      Left = 1
      Top = 37
      Width = 958
      Height = 78
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
      object pnlRadioBtns: TPanel
        Left = 1
        Top = 1
        Width = 956
        Height = 48
        Margins.Left = 12
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 1
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object rbAllStudents: TCWSRadioButton
          AlignWithMargins = True
          Left = 25
          Top = 6
          Width = 164
          Height = 36
          Margins.Left = 24
          Margins.Top = 5
          Margins.Right = 12
          Margins.Bottom = 5
          Caption = 'All Students'
          Checked = True
          GroupIndex = 1
          RadioSize = 18
          TextSpacing = 6
          RadioColorNormal = 9079434
          RadioColorChecked = 12413967
          RadioColorDisabled = 13092807
          FillColorNormal = clWhite
          FillColorDisabled = 15790320
          DotColor = clWhite
          FontColorNormal = 2368548
          FontColorChecked = 2368548
          FontColorDisabled = 12434877
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = rbAllStudentsClick
        end
        object rbStudentsByCountries: TCWSRadioButton
          AlignWithMargins = True
          Left = 522
          Top = 6
          Width = 272
          Height = 36
          Margins.Left = 12
          Margins.Top = 5
          Margins.Right = 12
          Margins.Bottom = 5
          Caption = 'Students By Countries'
          GroupIndex = 1
          RadioSize = 18
          TextSpacing = 6
          RadioColorNormal = 9079434
          RadioColorChecked = 12413967
          RadioColorDisabled = 13092807
          FillColorNormal = clWhite
          FillColorDisabled = 15790320
          DotColor = clWhite
          FontColorNormal = 2368548
          FontColorChecked = 2368548
          FontColorDisabled = 12434877
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rbStudentsByCountriesClick
        end
        object rbStudentsByClassLevels: TCWSRadioButton
          AlignWithMargins = True
          Left = 213
          Top = 6
          Width = 285
          Height = 36
          Margins.Left = 12
          Margins.Top = 5
          Margins.Right = 12
          Margins.Bottom = 5
          Caption = 'Students By Class Level'
          GroupIndex = 1
          RadioSize = 18
          TextSpacing = 6
          RadioColorNormal = 9079434
          RadioColorChecked = 12413967
          RadioColorDisabled = 13092807
          FillColorNormal = clWhite
          FillColorDisabled = 15790320
          DotColor = clWhite
          FontColorNormal = 2368548
          FontColorChecked = 2368548
          FontColorDisabled = 12434877
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = rbStudentsByClassLevelsClick
        end
      end
    end
    object pnlInstructions: TPanel
      Left = 1
      Top = 115
      Width = 958
      Height = 36
      Margins.Left = 12
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      object lblStudentsType: TRzLabel
        AlignWithMargins = True
        Left = 25
        Top = 1
        Width = 510
        Height = 29
        Margins.Left = 24
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        Caption = 'Choose which students to include in the email list:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ExplicitLeft = 26
        ExplicitTop = 2
        ExplicitHeight = 31
      end
    end
  end
  object SVGIconImageList1: TSVGIconImageList
    Size = 24
    SVGIconItems = <
      item
        IconName = 'next-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M8.03,22L6.25,20.' +
          '23L14.48,12L6.25,3.77L8.03,2l10,10l-10,10Z"/></svg>'
      end
      item
        IconName = 'prev.grey'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#646464"><path d="M10,22L0,12L10,2l' +
          '1.78,1.77L3.55,12l8.23,8.23L10,22Z"/></svg>'
      end
      item
        IconName = 'list-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M9,19V17H21v2H9Zm' +
          '0-6V11H21v2H9ZM9,7V5H21V7H9ZM5,20q-0.83,0-1.41-0.59T3,18t0.59-1.' +
          '41T5,16t1.41,0.59Q7,17.18 7,18T6.41,19.41T5,20Zm0-6q-0.83,0-1.41' +
          '-0.59T3,12t0.59-1.41T5,10t1.41,0.59Q7,11.18 7,12T6.41,13.41T5,14' +
          'ZM3.59,7.41Q3,6.82 3,6T3.59,4.59T5,4T6.41,4.59Q7,5.18 7,6T6.41,7' +
          '.41T5,8T3.59,7.41Z"/></svg>'
      end
      item
        IconName = 'select-all-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M7,17V7H17V17H7Zm' +
          '2-2h6V9H9v6ZM5,19v2q-0.83,0-1.41-0.59T3,19H5ZM3,17V15H5v2H3Zm0-4' +
          'V11H5v2H3ZM3,9V7H5V9H3ZM5,5H3Q3,4.17 3.59,3.59T5,3V5ZM7,21V19H9v' +
          '2H7ZM7,5V3H9V5H7Zm4,16V19h2v2H11ZM11,5V3h2V5H11Zm4,16V19h2v2H15Z' +
          'M15,5V3h2V5H15Zm4,16V19h2q0,0.82-0.59,1.41T19,21Zm0-4V15h2v2H19Z' +
          'm0-4V11h2v2H19Zm0-4V7h2V9H19Zm0-4V3q0.83,0 1.41,0.59T21,5H19Z"/>' +
          '</svg>'
      end
      item
        IconName = 'deselect-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M19.78,22.6L14.18' +
          ',17H7V9.82L1.4,4.22L2.8,2.8L21.2,21.2l-1.43,1.4ZM9,15h3.18L9,11.' +
          '83V15Zm8-0.83l-2-2V9H11.83l-2-2H17v7.17ZM5,19v2q-0.83,0-1.41-0.5' +
          '9T3,19H5ZM3,17V15H5v2H3Zm0-4V11H5v2H3ZM3,9V7H5V9H3ZM7,21V19H9v2H' +
          '7ZM7,5V3H9V5H7Zm4,16V19h2v2H11ZM11,5V3h2V5H11Zm4,16V19h2v2H15ZM1' +
          '5,5V3h2V5H15Zm4,12V15h2v2H19Zm0-4V11h2v2H19Zm0-4V7h2V9H19Zm0-4V3' +
          'q0.83,0 1.41,0.59T21,5H19Z"/></svg>'
      end>
    Scaled = True
    Left = 476
    Top = 334
  end
end
