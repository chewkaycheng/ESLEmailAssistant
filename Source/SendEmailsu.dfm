object frmSendEmails: TfrmSendEmails
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Align = alBottom
  BorderStyle = bsNone
  Caption = 'SEND EMAILS'
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
  object pnlButtons: TCWSSettingsPanel
    Left = 0
    Top = 618
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
    ExplicitLeft = -22
    ExplicitTop = 592
    object btnSendEmails: TCWSButton
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
      Caption = 'Send Emails'
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
    end
  end
  object sbMain: TRzStatusBar
    Left = 0
    Top = 690
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
    ExplicitLeft = 10
    ExplicitTop = 569
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
      ExplicitLeft = 13
      ExplicitTop = -23
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
  object SVGIconImageList1: TSVGIconImageList
    Size = 24
    SVGIconItems = <
      item
        IconName = 'email-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M18,20l-1.4-1.4L1' +
          '8.18,17H14V15h4.18L16.6,13.4L18,12l4,4l-4,4ZM4,17q-0.82,0-1.41-0' +
          '.59T2,15V5Q2,4.17 2.59,3.59T4,3H17q0.82,0 1.41,0.59T19,5v5.1q-0.' +
          '25-0.05-0.5-0.08T18,10t-0.5,0.01T17,10.07V6.4L10.4,11L4,6.43V15h' +
          '8.08q-0.05,0.25-0.06,0.5T12,16t0.03,0.5T12.1,17H4ZM5.45,5L10.4,8' +
          '.55L15.5,5H5.45ZM4,15q0-2.05 0-3.49t0-1.44V6.4Q4,6.05 4,5.7T4,5Q' +
          '4,5.35 4,5.71T4,6.43V15Z"/></svg>'
      end>
    Scaled = True
    Left = 596
    Top = 342
  end
end
