object frmCompose: TfrmCompose
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderStyle = bsNone
  Caption = 'MESSAGE TEMPLATES'
  ClientHeight = 720
  ClientWidth = 960
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 25
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
      TabOrder = 1
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
      Width = 420
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
  object pnlLanguage: TPanel
    Left = 0
    Top = 0
    Width = 960
    Height = 65
    Margins.Left = 12
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object lblLanguage: TRzLabel
      AlignWithMargins = True
      Left = 25
      Top = 6
      Width = 106
      Height = 53
      Margins.Left = 24
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Language:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      CenterPoint = cpLowerRight
      ExplicitHeight = 31
    end
    object cboLanguage: TCWSComboBox
      AlignWithMargins = True
      Left = 273
      Top = 18
      Width = 450
      Height = 46
      Margins.Left = 137
      Margins.Top = 17
      Margins.Right = 9
      Margins.Bottom = 0
      Style = csDropDownList
      CornerRadius = 4.00000000000000000
      DropdownCornerRadius = 8.00000000000000000
      ItemHighlightTextColor = clWhite
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
      OnChange = cboLanguageChange
    end
    object btnCreateTemplate: TCWSButton
      AlignWithMargins = True
      Left = 737
      Top = 13
      Width = 198
      Height = 51
      Margins.Left = 5
      Margins.Top = 12
      Margins.Right = 24
      Margins.Bottom = 0
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
      Caption = 'Create Template'
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
      OnClick = btnCreateTemplateClick
    end
  end
  object pnlFiles: TPanel
    Left = 0
    Top = 203
    Width = 726
    Height = 415
    Margins.Left = 12
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    Padding.Left = 24
    Padding.Right = 9
    Padding.Bottom = 18
    ParentBackground = False
    TabOrder = 3
    object lstTemplates: TCWSListBox
      Left = 25
      Top = 1
      Width = 691
      Height = 395
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Items.Strings = (
        '')
      IntegralHeight = False
      ItemHeight = 30
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = lstTemplatesClick
      OnDblClick = btnEditTemplateClick
      CornerRadiusF = 6.00000000000000000
    end
  end
  object pnlEditDel: TPanel
    Left = 726
    Top = 203
    Width = 234
    Height = 415
    Margins.Left = 12
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alRight
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    object pnlDelete: TPanel
      Left = 1
      Top = 52
      Width = 232
      Height = 63
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
      object btnDeleteTemplate: TCWSButton
        AlignWithMargins = True
        Left = 6
        Top = 13
        Width = 201
        Height = 49
        Margins.Left = 6
        Margins.Top = 12
        Margins.Right = 24
        Margins.Bottom = 0
        Align = alRight
        TabOrder = 0
        ButtonStyle = bsCustom
        IconFontName = 'Segoe MDL2 Assets'
        IconFontSize = 16
        BckNormalColor = 12413967
        BckHoverColor = 10706449
        BckPressedColor = 6175500
        BorderColorNormal = 12413967
        BorderColorHover = 10706449
        BorderColorPressed = 6175500
        Caption = 'Delete Template'
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
        OnClick = btnDeleteTemplateClick
      end
    end
    object pnlEdit: TPanel
      Left = 1
      Top = 1
      Width = 232
      Height = 51
      Margins.Left = 12
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object btnEditTemplate: TCWSButton
        AlignWithMargins = True
        Left = 6
        Top = 1
        Width = 201
        Height = 49
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 24
        Margins.Bottom = 0
        Align = alRight
        TabOrder = 0
        ButtonStyle = bsCustom
        IconFontName = 'Segoe MDL2 Assets'
        IconFontSize = 16
        BckNormalColor = 12413967
        BckHoverColor = 10706449
        BckPressedColor = 6175500
        BorderColorNormal = 12413967
        BorderColorHover = 10706449
        BorderColorPressed = 6175500
        Caption = 'Edit Template'
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
        OnClick = btnEditTemplateClick
      end
    end
  end
  object pnlSubject: TPanel
    Left = 0
    Top = 65
    Width = 960
    Height = 72
    Margins.Left = 12
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    object lblSubject: TRzLabel
      AlignWithMargins = True
      Left = 25
      Top = 6
      Width = 216
      Height = 60
      Margins.Left = 24
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      AutoSize = False
      Caption = 'Subject (Required):'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 26
    end
    object edtSubject: TCWSEdit
      AlignWithMargins = True
      Left = 270
      Top = 13
      Width = 665
      Height = 46
      Cursor = crIBeam
      Margins.Left = 24
      Margins.Top = 12
      Margins.Right = 24
      Margins.Bottom = 12
      Text = ''
      CornerRadius = 4.00000000000000000
      TextHint = 'Enter the subject for the Emails (min 2 letters).'
      OnChange = edtSubjectChange
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      ExplicitHeight = 48
    end
    object aniArrow: TRzAnimator
      Left = 236
      Top = 24
      Width = 24
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Delay = 300
      ImageIndex = 1
      ImageList = SVGIconImageList2
    end
  end
  object pnlTemplateFiles: TCWSSettingsPanel
    AlignWithMargins = True
    Left = 5
    Top = 155
    Width = 950
    Height = 43
    Margins.Left = 5
    Margins.Top = 18
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    DoubleBuffered = True
    BorderEdges = []
    object lblTemplateFiles: TRzLabel
      AlignWithMargins = True
      Left = 24
      Top = 6
      Width = 864
      Height = 31
      Margins.Left = 24
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alLeft
      Caption = 
        'Message Template Files (an English language Message Template Fil' +
        'e is required.)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitHeight = 32
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
        IconName = 'prev-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M10,22L0,12L10,2l' +
          '1.78,1.77L3.55,12l8.23,8.23L10,22Z"/></svg>'
      end
      item
        IconName = 'add-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M11,13H5V11h6V5h2' +
          'v6h6v2H13v6H11V13Z"/></svg>'
      end
      item
        IconName = 'edit-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M5,19H6.43L16.2,9' +
          '.23L14.78,7.8L5,17.58V19ZM3,21V16.75L16.2,3.57q0.3-0.28 0.66-0.4' +
          '3T17.63,3q0.4,0 0.78,0.15T19.05,3.6L20.43,5q0.3,0.27 0.44,0.65T2' +
          '1,6.4q0,0.4-0.14,0.76T20.43,7.82L7.25,21H3ZM19,6.4L17.6,5L19,6.4' +
          'ZM15.48,8.52L14.78,7.8L16.2,9.23l-0.72-0.7Z"/></svg>'
      end
      item
        IconName = 'delete-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M7,21q-0.82,0-1.4' +
          '1-0.59T5,19V6H4V4H9V3h6V4h5V6H19V19q0,0.82-0.59,1.41T17,21H7ZM17' +
          ',6H7V19H17V6ZM9,17h2V8H9v9Zm4,0h2V8H13v9ZM7,6V19V6Z"/></svg>'
      end>
    Scaled = True
    Left = 822
    Top = 480
  end
  object SVGIconImageList2: TSVGIconImageList
    Size = 24
    SVGIconItems = <
      item
        IconName = 'right-arrow-black'
        SVGText = 
          '<?xml version="1.0" encoding="utf-8"?>'#13#10#13#10'<!-- Uploaded to: SVG ' +
          'Repo, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#10'<svg ' +
          'fill="#000000" height="800px" width="800px" version="1.1" id="La' +
          'yer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://ww' +
          'w.w3.org/1999/xlink" '#13#10#9' viewBox="0 0 512 512" enable-background' +
          '="new 0 0 512 512" xml:space="preserve">'#13#10'<polygon points="512,2' +
          '61.5 298.7,90.8 298.7,218.8 0,218.8 0,304.2 298.7,304.2 298.7,43' +
          '2.2 "/>'#13#10'</svg>'
      end
      item
        IconName = 'right-arrow-1-white'
        SVGText = 
          '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.or' +
          'g/Graphics/SVG/1.1/DTD/svg11.dtd">'#10#13'<!-- Uploaded to: SVG Repo, ' +
          'www.svgrepo.com, Transformed by: SVG Repo Mixer Tools -->'#10'<svg f' +
          'ill="#ffffff" height="200px" width="200px" version="1.1" id="Lay' +
          'er_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www' +
          '.w3.org/1999/xlink" viewBox="0 0 512 512" enable-background="new' +
          ' 0 0 512 512" xml:space="preserve" style="width: 200px; height: ' +
          '200px; color: rgb(255, 255, 255);" stroke="#ffffff">'#10#13'<g id="SVG' +
          'Repo_bgCarrier" stroke-width="0"/>'#10#13'<g id="SVGRepo_tracerCarrier' +
          '" stroke-linecap="round" stroke-linejoin="round"/>'#10#13'<g id="SVGRe' +
          'po_iconCarrier">'#10#13'<!-- Uploaded to: SVG Repo, www.svgrepo.com, G' +
          'enerator: SVG Repo Mixer Tools --> <polygon points="512,261.5 29' +
          '8.7,90.8 298.7,218.8 0,218.8 0,304.2 298.7,304.2 298.7,432.2 "/>' +
          ' </g>'#10#13'</svg>'
      end>
    Scaled = True
    Left = 508
    Top = 393
  end
end
