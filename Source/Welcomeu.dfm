object frmWelcome: TfrmWelcome
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderStyle = bsNone
  Caption = 'WELCOME'
  ClientHeight = 611
  ClientWidth = 1187
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
  object lblWelcome_Message: TRzLabel
    AlignWithMargins = True
    Left = 24
    Top = 5
    Width = 1145
    Height = 499
    Margins.Left = 24
    Margins.Top = 5
    Margins.Right = 18
    Margins.Bottom = 5
    Align = alClient
    Caption = 
      'The ESL Mail Processing Assistant will help you send personalize' +
      'd emails to students.'#13#10#13#10'You may start a new session to select s' +
      'tudents and create email messages. '#13#10#13#10'You can also resume and c' +
      'ontinue to work on a session that you have created where either ' +
      'email sending has not been initiated, or email sending has been ' +
      'initiated and the process was somehow interrupted.'#13#10#13#10'The messag' +
      'e templates of all emails as well as a list of emails that are s' +
      'ent in a session will be archived.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
    ExplicitWidth = 1136
    ExplicitHeight = 256
  end
  object sbMain: TRzStatusBar
    Left = 0
    Top = 509
    Width = 1187
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
      ExplicitLeft = 746
      ExplicitTop = 2
      ExplicitHeight = 27
    end
  end
  object pnlButtons: TCWSSettingsPanel
    Left = 0
    Top = 539
    Width = 1187
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    DoubleBuffered = True
    CornerRadius = 0
    BorderEdges = [beTop]
    object btnNewSession: TCWSButton
      AlignWithMargins = True
      Left = 753
      Top = 11
      Width = 200
      Height = 50
      Margins.Left = 5
      Margins.Top = 11
      Margins.Right = 6
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
      Caption = 'New Session'
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
      OnClick = btnNewSessionClick
    end
    object btnResumeSession: TCWSButton
      AlignWithMargins = True
      Left = 965
      Top = 11
      Width = 198
      Height = 50
      Margins.Left = 6
      Margins.Top = 11
      Margins.Right = 24
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
      Caption = 'Resume Session'
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
      OnClick = btnResumeSessionClick
    end
  end
  object SVGIconImageList1: TSVGIconImageList
    Size = 24
    SVGIconItems = <
      item
        IconName = 'add-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M11,13H5V11h6V5h2' +
          'v6h6v2H13v6H11V13Z"/></svg>'
      end
      item
        IconName = 'resume-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M6,18V6H8V18H6Zm4' +
          ',0l10-6L10,6V18Zm2-3.53V9.52L16.13,12L12,14.48ZM12,12Z"/></svg>'
      end>
    Scaled = True
    Left = 870
    Top = 342
  end
end
