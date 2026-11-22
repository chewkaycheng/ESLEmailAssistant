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
      OnClick = btnSendEmailsClick
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
      Width = 524
      Height = 588
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 17
      Margins.Bottom = 0
      Align = alClient
      DoubleBuffered = True
      object CWSSettingsPanel4: TCWSSettingsPanel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 514
        Height = 45
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        DoubleBuffered = True
        CornerRadius = 0
        BorderEdges = [beBottom]
        object lblSending: TRzLabel
          AlignWithMargins = True
          Left = 8
          Top = 5
          Width = 498
          Height = 35
          Margins.Left = 8
          Margins.Top = 5
          Margins.Right = 8
          Margins.Bottom = 5
          Align = alClient
          AutoSize = False
          Caption = 'Sending Email to:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 501
          ExplicitHeight = 36
        end
      end
      object pnlSummary: TCWSSettingsPanel
        Left = 0
        Top = 55
        Width = 524
        Height = 533
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        Visible = False
        DoubleBuffered = True
        BorderWidth = 0
        object pnlChildcare: TCWSSettingsPanel
          AlignWithMargins = True
          Left = 5
          Top = 207
          Width = 514
          Height = 40
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          DoubleBuffered = True
          CornerRadius = 0
          BorderWidth = 0
          object lblChildcareRight: TRzLabel
            AlignWithMargins = True
            Left = 144
            Top = 5
            Width = 362
            Height = 30
            Margins.Left = 8
            Margins.Top = 5
            Margins.Right = 8
            Margins.Bottom = 5
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
          object lblChildcareLeft: TRzLabel
            AlignWithMargins = True
            Left = 8
            Top = 5
            Width = 120
            Height = 30
            Margins.Left = 8
            Margins.Top = 5
            Margins.Right = 8
            Margins.Bottom = 5
            Align = alLeft
            AutoSize = False
            Caption = 'Childcare:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitHeight = 31
          end
        end
        object pnlClassLevel: TCWSSettingsPanel
          AlignWithMargins = True
          Left = 5
          Top = 156
          Width = 514
          Height = 41
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          DoubleBuffered = True
          CornerRadius = 0
          BorderWidth = 0
          object lblClassLevelRight: TRzLabel
            AlignWithMargins = True
            Left = 144
            Top = 5
            Width = 362
            Height = 31
            Margins.Left = 8
            Margins.Top = 5
            Margins.Right = 8
            Margins.Bottom = 5
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
          object lblClassLevelLeft: TRzLabel
            AlignWithMargins = True
            Left = 8
            Top = 5
            Width = 120
            Height = 31
            Margins.Left = 8
            Margins.Top = 5
            Margins.Right = 8
            Margins.Bottom = 5
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
        object pnlRoom: TCWSSettingsPanel
          AlignWithMargins = True
          Left = 5
          Top = 106
          Width = 514
          Height = 40
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          DoubleBuffered = True
          CornerRadius = 0
          BorderWidth = 0
          object lblRoomRight: TRzLabel
            AlignWithMargins = True
            Left = 144
            Top = 5
            Width = 362
            Height = 30
            Margins.Left = 8
            Margins.Top = 5
            Margins.Right = 8
            Margins.Bottom = 5
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
          object lblRoomLeft: TRzLabel
            AlignWithMargins = True
            Left = 8
            Top = 5
            Width = 120
            Height = 30
            Margins.Left = 8
            Margins.Top = 5
            Margins.Right = 8
            Margins.Bottom = 5
            Align = alLeft
            AutoSize = False
            Caption = 'Room:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitHeight = 31
          end
        end
        object pnlStudent: TCWSSettingsPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 514
          Height = 40
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          DoubleBuffered = True
          CornerRadius = 0
          BorderWidth = 0
          object lblNameRight: TRzLabel
            AlignWithMargins = True
            Left = 144
            Top = 5
            Width = 362
            Height = 35
            Margins.Left = 8
            Margins.Top = 5
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
            Top = 5
            Width = 120
            Height = 35
            Margins.Left = 8
            Margins.Top = 5
            Margins.Right = 8
            Margins.Bottom = 0
            Align = alLeft
            AutoSize = False
            Caption = 'Student:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitHeight = 36
          end
        end
        object pnlTeacher: TCWSSettingsPanel
          AlignWithMargins = True
          Left = 5
          Top = 55
          Width = 514
          Height = 41
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alTop
          DoubleBuffered = True
          CornerRadius = 0
          BorderWidth = 0
          object lblTeacherRight: TRzLabel
            AlignWithMargins = True
            Left = 144
            Top = 5
            Width = 362
            Height = 36
            Margins.Left = 8
            Margins.Top = 5
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
            Top = 5
            Width = 120
            Height = 31
            Margins.Left = 8
            Margins.Top = 5
            Margins.Right = 8
            Margins.Bottom = 5
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
      end
    end
    object CWSSettingsPanel2: TCWSSettingsPanel
      AlignWithMargins = True
      Left = 558
      Top = 0
      Width = 354
      Height = 588
      Margins.Left = 17
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      DoubleBuffered = True
      object circProgress: TCWSProgressCircle
        AlignWithMargins = True
        Left = 50
        Top = 105
        Width = 254
        Height = 255
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
        ExplicitTop = 104
        ExplicitWidth = 255
      end
      object CWSSettingsPanel10: TCWSSettingsPanel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 344
        Height = 45
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        DoubleBuffered = True
        CornerRadius = 0
        BorderEdges = [beBottom]
        object RzLabel1: TRzLabel
          AlignWithMargins = True
          Left = 8
          Top = 5
          Width = 328
          Height = 35
          Margins.Left = 8
          Margins.Top = 5
          Margins.Right = 8
          Margins.Bottom = 5
          Align = alClient
          AutoSize = False
          Caption = 'Percent Complete:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -26
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 330
          ExplicitHeight = 36
        end
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
      end
      item
        IconName = 'stop-circle-black'
        SVGText = 
          '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
          ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg wid' +
          'th="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns=' +
          '"http://www.w3.org/2000/svg">'#13#10'<path fill-rule="evenodd" clip-ru' +
          'le="evenodd" d="M12 2.75C6.89137 2.75 2.75 6.89137 2.75 12C2.75 ' +
          '17.1086 6.89137 21.25 12 21.25C17.1086 21.25 21.25 17.1086 21.25' +
          ' 12C21.25 6.89137 17.1086 2.75 12 2.75ZM1.25 12C1.25 6.06294 6.0' +
          '6294 1.25 12 1.25C17.9371 1.25 22.75 6.06294 22.75 12C22.75 17.9' +
          '371 17.9371 22.75 12 22.75C6.06294 22.75 1.25 17.9371 1.25 12ZM1' +
          '1.948 7.25H12.052C12.9505 7.24997 13.6997 7.24995 14.2945 7.3299' +
          '1C14.9223 7.41432 15.4891 7.59999 15.9445 8.05546C16.4 8.51093 1' +
          '6.5857 9.07773 16.6701 9.70552C16.7501 10.3003 16.75 11.0495 16.' +
          '75 11.948V12.052C16.75 12.9505 16.7501 13.6997 16.6701 14.2945C1' +
          '6.5857 14.9223 16.4 15.4891 15.9445 15.9445C15.4891 16.4 14.9223' +
          ' 16.5857 14.2945 16.6701C13.6997 16.7501 12.9505 16.75 12.052 16' +
          '.75H11.948C11.0495 16.75 10.3003 16.7501 9.70552 16.6701C9.07773' +
          ' 16.5857 8.51093 16.4 8.05546 15.9445C7.59999 15.4891 7.41432 14' +
          '.9223 7.32991 14.2945C7.24995 13.6997 7.24997 12.9505 7.25 12.05' +
          '2V11.948C7.24997 11.0495 7.24995 10.3003 7.32991 9.70552C7.41432' +
          ' 9.07773 7.59999 8.51093 8.05546 8.05546C8.51093 7.59999 9.07773' +
          ' 7.41432 9.70552 7.32991C10.3003 7.24995 11.0495 7.24997 11.948 ' +
          '7.25ZM9.90539 8.81654C9.44393 8.87858 9.24643 8.9858 9.11612 9.1' +
          '1612C8.9858 9.24643 8.87858 9.44393 8.81654 9.90539C8.75159 10.3' +
          '884 8.75 11.036 8.75 12C8.75 12.964 8.75159 13.6116 8.81654 14.0' +
          '946C8.87858 14.5561 8.9858 14.7536 9.11612 14.8839C9.24643 15.01' +
          '42 9.44393 15.1214 9.90539 15.1835C10.3884 15.2484 11.036 15.25 ' +
          '12 15.25C12.964 15.25 13.6116 15.2484 14.0946 15.1835C14.5561 15' +
          '.1214 14.7536 15.0142 14.8839 14.8839C15.0142 14.7536 15.1214 14' +
          '.5561 15.1835 14.0946C15.2484 13.6116 15.25 12.964 15.25 12C15.2' +
          '5 11.036 15.2484 10.3884 15.1835 9.90539C15.1214 9.44393 15.0142' +
          ' 9.24643 14.8839 9.11612C14.7536 8.9858 14.5561 8.87858 14.0946 ' +
          '8.81654C13.6116 8.75159 12.964 8.75 12 8.75C11.036 8.75 10.3884 ' +
          '8.75159 9.90539 8.81654Z" fill="#1C274C"/>'#13#10'</svg>'
      end>
    Scaled = True
    Left = 840
    Top = 333
  end
end
