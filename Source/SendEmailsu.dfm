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
  object CWSSettingsPanel1: TCWSSettingsPanel
    AlignWithMargins = True
    Left = 24
    Top = 12
    Width = 912
    Height = 588
    Margins.Left = 24
    Margins.Top = 12
    Margins.Right = 24
    Margins.Bottom = 18
    Align = alClient
    DoubleBuffered = True
    BorderWidth = 0
    object CWSSettingsPanel3: TCWSSettingsPanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 526
      Height = 588
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 16
      Margins.Bottom = 0
      Align = alClient
      DoubleBuffered = True
      object CWSSettingsPanel5: TCWSSettingsPanel
        AlignWithMargins = True
        Left = 4
        Top = 249
        Width = 518
        Height = 40
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        DoubleBuffered = True
        CornerRadius = 0
        BorderWidth = 0
        object lblChildcareRight: TRzLabel
          AlignWithMargins = True
          Left = 144
          Top = 4
          Width = 366
          Height = 32
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 4
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 7
        end
        object lblChildcareLeft: TRzLabel
          AlignWithMargins = True
          Left = 8
          Top = 4
          Width = 120
          Height = 32
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 4
          Align = alLeft
          AutoSize = False
          Caption = 'Childcare:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
      object CWSSettingsPanel4: TCWSSettingsPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 518
        Height = 45
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        DoubleBuffered = True
        CornerRadius = 0
        BorderEdges = [beBottom]
        object lblSending: TRzLabel
          AlignWithMargins = True
          Left = 8
          Top = 4
          Width = 502
          Height = 37
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 4
          Align = alClient
          AutoSize = False
          Caption = 'Sending Email to:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 14
          ExplicitWidth = 120
          ExplicitHeight = 51
        end
      end
      object CWSSettingsPanel6: TCWSSettingsPanel
        AlignWithMargins = True
        Left = 4
        Top = 57
        Width = 518
        Height = 40
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        DoubleBuffered = True
        CornerRadius = 0
        BorderWidth = 0
        object lblNameRight: TRzLabel
          AlignWithMargins = True
          Left = 144
          Top = 4
          Width = 366
          Height = 36
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 0
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 7
          ExplicitHeight = 32
        end
        object lblNameLeft: TRzLabel
          AlignWithMargins = True
          Left = 8
          Top = 4
          Width = 120
          Height = 36
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 0
          Align = alLeft
          AutoSize = False
          Caption = 'Name:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
      object CWSSettingsPanel7: TCWSSettingsPanel
        AlignWithMargins = True
        Left = 4
        Top = 105
        Width = 518
        Height = 40
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        DoubleBuffered = True
        CornerRadius = 0
        BorderWidth = 0
        object lblTeacherRight: TRzLabel
          AlignWithMargins = True
          Left = 144
          Top = 4
          Width = 366
          Height = 36
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 0
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 7
          ExplicitHeight = 32
        end
        object lblTeacherLeft: TRzLabel
          AlignWithMargins = True
          Left = 8
          Top = 4
          Width = 120
          Height = 32
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 4
          Align = alLeft
          AutoSize = False
          Caption = 'Teacher:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
      object CWSSettingsPanel8: TCWSSettingsPanel
        AlignWithMargins = True
        Left = 4
        Top = 153
        Width = 518
        Height = 40
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        DoubleBuffered = True
        CornerRadius = 0
        BorderWidth = 0
        object lblRoomRight: TRzLabel
          AlignWithMargins = True
          Left = 144
          Top = 4
          Width = 366
          Height = 32
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 4
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 7
        end
        object lblRoomLeft: TRzLabel
          AlignWithMargins = True
          Left = 8
          Top = 4
          Width = 120
          Height = 32
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 4
          Align = alLeft
          AutoSize = False
          Caption = 'Room:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
      object CWSSettingsPanel9: TCWSSettingsPanel
        AlignWithMargins = True
        Left = 4
        Top = 201
        Width = 518
        Height = 40
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        DoubleBuffered = True
        CornerRadius = 0
        BorderWidth = 0
        object lblClassLevelRight: TRzLabel
          AlignWithMargins = True
          Left = 144
          Top = 4
          Width = 366
          Height = 32
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 4
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 7
        end
        object lblClassLevelLeft: TRzLabel
          AlignWithMargins = True
          Left = 8
          Top = 4
          Width = 120
          Height = 32
          Margins.Left = 8
          Margins.Top = 4
          Margins.Right = 8
          Margins.Bottom = 4
          Align = alLeft
          AutoSize = False
          Caption = 'Class Level:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object CWSSettingsPanel2: TCWSSettingsPanel
      AlignWithMargins = True
      Left = 558
      Top = 0
      Width = 354
      Height = 588
      Margins.Left = 16
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      DoubleBuffered = True
      object circProgress: TCWSProgressCircle
        AlignWithMargins = True
        Left = 50
        Top = 50
        Width = 254
        Height = 293
        Margins.Left = 50
        Margins.Top = 50
        Margins.Right = 50
        Margins.Bottom = 50
        MaxValue = 100.00000000000000000
        TrackColor = 15658734
        ProgressColor = 680148
        TextColor = clBlack
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clCaptionText
        Font.Height = -18
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
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
      end
      item
        IconName = 'prev-black'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" heig' +
          'ht="24px" width="24px" fill="#000000"><path d="M10,22L0,12L10,2l' +
          '1.78,1.77L3.55,12l8.23,8.23L10,22Z"/></svg>'
      end>
    Scaled = True
    Left = 840
    Top = 333
  end
end
