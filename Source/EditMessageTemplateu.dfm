object frmEditMessageTemplate: TfrmEditMessageTemplate
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Edit Email Message Template'
  ClientHeight = 831
  ClientWidth = 1268
  Color = clBtnFace
  CustomTitleBar.Control = brTitle
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 45
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
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 45
  Position = poScreenCenter
  StyleElements = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 25
  object brTitle: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 1268
    Height = 44
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    CustomButtons = <>
  end
  object pnlMenuButtons: TCWSSettingsPanel
    Left = 0
    Top = 100
    Width = 1268
    Height = 100
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    DoubleBuffered = True
    RoundedCorners = []
    BorderEdges = []
    object pnlRight: TCWSSettingsPanel
      Left = 743
      Top = 0
      Width = 508
      Height = 100
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      DoubleBuffered = True
      RoundedCorners = []
      BorderEdges = [beRight]
      object btnStudentName: TscGPButton
        AlignWithMargins = True
        Left = 12
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 12
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 0
        Action = StudentName
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 5
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 5
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
      object btnChildcareLevel: TscGPButton
        AlignWithMargins = True
        Left = 404
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 1
        Action = Childcare
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 9
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 9
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
      object btnTeacherName: TscGPButton
        AlignWithMargins = True
        Left = 110
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 2
        Action = TeacherName
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 6
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 6
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
      object btnClassLevel: TscGPButton
        AlignWithMargins = True
        Left = 306
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 3
        Action = ClassLevel
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 8
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 8
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
      object btnRoomNumber: TscGPButton
        AlignWithMargins = True
        Left = 208
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 4
        Action = RoomNumber
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 7
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 7
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
    end
    object pnlLeft: TCWSSettingsPanel
      Left = 0
      Top = 0
      Width = 230
      Height = 100
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      DoubleBuffered = True
      RoundedCorners = []
      BorderEdges = [beRight]
      object btnSave: TscGPButton
        AlignWithMargins = True
        Left = 24
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 24
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 0
        Action = FileSave
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 0
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 0
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
      object btnExit: TscGPButton
        AlignWithMargins = True
        Left = 122
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 12
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 1
        Action = FileExit
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 1
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 1
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
    end
    object pnlCenter: TCWSSettingsPanel
      Left = 230
      Top = 0
      Width = 513
      Height = 100
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      DoubleBuffered = True
      RoundedCorners = []
      BorderEdges = [beRight]
      object btnUndo: TscGPButton
        AlignWithMargins = True
        Left = 12
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 12
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 0
        Action = EditUndo
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 10
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 10
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
      object btnPaste: TscGPButton
        AlignWithMargins = True
        Left = 404
        Top = 5
        Width = 93
        Height = 90
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 12
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 1
        Action = EditPaste
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 4
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 4
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
      object btnRedo: TscGPButton
        AlignWithMargins = True
        Left = 110
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 2
        Action = EditSynEditRedo
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 11
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 11
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
      object btnCopy: TscGPButton
        AlignWithMargins = True
        Left = 306
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 3
        Action = EditCopy
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 3
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 3
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
      object btnCut: TscGPButton
        AlignWithMargins = True
        Left = 208
        Top = 5
        Width = 90
        Height = 90
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 8
        Margins.Bottom = 5
        Align = alLeft
        ParentShowHint = False
        FluentUIOpaque = False
        ShowHint = True
        TabOrder = 4
        Action = EditCut
        Animation = False
        Badge.Color = clRed
        Badge.ColorAlpha = 255
        Badge.Font.Charset = DEFAULT_CHARSET
        Badge.Font.Color = clWhite
        Badge.Font.Height = -17
        Badge.Font.Name = 'Tahoma'
        Badge.Font.Style = [fsBold]
        Badge.Visible = False
        CaptionCenterAlignment = False
        CanFocused = False
        CustomDropDown = False
        DrawTextMode = scdtmGDI
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        Images = vimlEmailContentLarge
        ImageIndex = 2
        ImageMargin = 0
        TransparentBackground = True
        Options.NormalColor = clBtnFace
        Options.HotColor = clBtnFace
        Options.PressedColor = clBtnShadow
        Options.FocusedColor = clBtnFace
        Options.DisabledColor = clBtnFace
        Options.NormalColor2 = clNone
        Options.HotColor2 = clNone
        Options.PressedColor2 = clNone
        Options.FocusedColor2 = clNone
        Options.DisabledColor2 = clNone
        Options.NormalColorAlpha = 255
        Options.HotColorAlpha = 255
        Options.PressedColorAlpha = 255
        Options.FocusedColorAlpha = 255
        Options.DisabledColorAlpha = 255
        Options.NormalColor2Alpha = 255
        Options.HotColor2Alpha = 255
        Options.PressedColor2Alpha = 255
        Options.FocusedColor2Alpha = 255
        Options.DisabledColor2Alpha = 255
        Options.FrameNormalColor = clBtnShadow
        Options.FrameHotColor = clHighlight
        Options.FramePressedColor = clHighlight
        Options.FrameFocusedColor = clHighlight
        Options.FrameDisabledColor = clBtnShadow
        Options.FrameWidth = 2
        Options.FrameNormalColorAlpha = 255
        Options.FrameHotColorAlpha = 255
        Options.FramePressedColorAlpha = 255
        Options.FrameFocusedColorAlpha = 255
        Options.FrameDisabledColorAlpha = 255
        Options.FontNormalColor = clBtnText
        Options.FontHotColor = clBtnText
        Options.FontPressedColor = clBtnText
        Options.FontFocusedColor = clBtnText
        Options.FontDisabledColor = clBtnShadow
        Options.ShapeFillGradientAngle = 90
        Options.ShapeFillGradientPressedAngle = -90
        Options.ShapeFillGradientColorOffset = 25
        Options.ShapeCornerRadius = 17
        Options.ShapeStyle = scgpRect
        Options.ShapeStyleLineSize = 0
        Options.ArrowSize = 14
        Options.ArrowAreaSize = 0
        Options.ArrowType = scgpatDefault
        Options.ArrowThickness = 2
        Options.ArrowThicknessScaled = False
        Options.ArrowNormalColor = clBtnText
        Options.ArrowHotColor = clBtnText
        Options.ArrowPressedColor = clBtnText
        Options.ArrowFocusedColor = clBtnText
        Options.ArrowDisabledColor = clBtnText
        Options.ArrowNormalColorAlpha = 200
        Options.ArrowHotColorAlpha = 255
        Options.ArrowPressedColorAlpha = 255
        Options.ArrowFocusedColorAlpha = 200
        Options.ArrowDisabledColorAlpha = 125
        Options.StyleColors = True
        Options.PressedHotColors = False
        HotImageIndex = 2
        FluentLightEffect = False
        FocusedImageIndex = -1
        PressedImageIndex = -1
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        ShowCaption = False
        SplitButton = False
        RepeatClick = False
        RepeatClickInterval = 100
        GlowEffect.Enabled = False
        GlowEffect.Color = clHighlight
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        GlowEffect.HotColor = clNone
        GlowEffect.PressedColor = clNone
        GlowEffect.FocusedColor = clNone
        GlowEffect.PressedGlowSize = 7
        GlowEffect.PressedAlphaValue = 255
        GlowEffect.States = [scsHot, scsPressed, scsFocused]
        ImageGlow = True
        ShowGalleryMenuFromTop = False
        ShowGalleryMenuFromRight = False
        ShowMenuArrow = True
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
        ToggleMode = False
      end
    end
  end
  object pnlMessageTemplate: TCWSSettingsPanel
    AlignWithMargins = True
    Left = 24
    Top = 292
    Width = 1220
    Height = 497
    Margins.Left = 24
    Margins.Top = 0
    Margins.Right = 24
    Margins.Bottom = 12
    Align = alClient
    DoubleBuffered = True
    CornerRadius = 6
    object edtMessageTemplate: TSynEdit
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 1204
      Height = 481
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Consolas'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      PopupMenu = popMenuTemplate
      TabOrder = 0
      CodeFolding.FolderBarLinesColor = clNone
      CodeFolding.ShowHintMark = False
      UseCodeFolding = False
      BookmarkOptions.Xoffset = 18
      BorderStyle = bsNone
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Consolas'
      Gutter.Font.Style = []
      Gutter.Font.Quality = fqClearTypeNatural
      Gutter.Visible = False
      Gutter.Bands = <
        item
          Kind = gbkMarks
          Width = 13
        end
        item
          Kind = gbkLineNumbers
        end
        item
          Kind = gbkFold
        end
        item
          Kind = gbkTrackChanges
        end
        item
          Kind = gbkMargin
          Width = 3
        end>
      IndentGuides.Visible = False
      Lines.Strings = (
        'edtMessageTemplate')
      RightEdge = 0
      RightEdgeColor = clNone
      ScrollbarAnnotations = <
        item
          AnnType = sbaCarets
          AnnPos = sbpFullWidth
          FullRow = False
        end
        item
          AnnType = sbaBookmark
          AnnPos = sbpLeft
          FullRow = True
        end
        item
          AnnType = sbaTrackChanges
          AnnPos = sbpRight
          FullRow = True
        end>
      WordWrap = True
      OnChange = edtMessageTemplateChange
    end
  end
  object sbMain: TRzStatusBar
    Left = 0
    Top = 801
    Width = 1268
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
    Color = 15987699
    FlatColor = clWhite
    GradientColorStyle = gcsCustom
    StyleElements = [seFont, seClient]
    TabOrder = 3
    VisualStyle = vsClassic
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
    object stpLeft: TRzStatusPane
      Left = 25
      Top = 1
      Width = 744
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
      ExplicitLeft = 26
      ExplicitTop = 2
      ExplicitHeight = 27
    end
    object stpRight: TRzStatusPane
      Left = 769
      Top = 1
      Width = 423
      Height = 28
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      FrameStyle = fsNone
      Align = alLeft
      Caption = ''
      ExplicitLeft = 770
      ExplicitTop = 2
      ExplicitHeight = 27
    end
  end
  object pnlPopup: TCWSSettingsPanel
    Left = 0
    Top = 44
    Width = 1268
    Height = 56
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    DoubleBuffered = True
    BorderEdges = []
    object btnPopup: TscGPButton
      AlignWithMargins = True
      Left = 24
      Top = 5
      Width = 122
      Height = 49
      Margins.Left = 24
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 2
      Align = alLeft
      FluentUIOpaque = False
      TabOrder = 0
      OnClick = btnPopupClick
      Animation = False
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -17
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      Caption = '  Menu'
      CaptionCenterAlignment = True
      CanFocused = False
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      Margin = -1
      Spacing = 1
      Layout = blGlyphLeft
      Images = vimlEmailContentSmall
      ImageIndex = 12
      ImageMargin = 0
      TransparentBackground = True
      Options.NormalColor = clBtnFace
      Options.HotColor = clBtnFace
      Options.PressedColor = clBtnShadow
      Options.FocusedColor = clBtnFace
      Options.DisabledColor = clBtnFace
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 255
      Options.HotColorAlpha = 255
      Options.PressedColorAlpha = 255
      Options.FocusedColorAlpha = 255
      Options.DisabledColorAlpha = 255
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clBtnShadow
      Options.FrameHotColor = clHighlight
      Options.FramePressedColor = clHighlight
      Options.FrameFocusedColor = clHighlight
      Options.FrameDisabledColor = clBtnShadow
      Options.FrameWidth = 2
      Options.FrameNormalColorAlpha = 255
      Options.FrameHotColorAlpha = 255
      Options.FramePressedColorAlpha = 255
      Options.FrameFocusedColorAlpha = 255
      Options.FrameDisabledColorAlpha = 255
      Options.FontNormalColor = clBtnText
      Options.FontHotColor = clBtnText
      Options.FontPressedColor = clBtnText
      Options.FontFocusedColor = clBtnText
      Options.FontDisabledColor = clBtnShadow
      Options.ShapeFillGradientAngle = 90
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 15
      Options.ShapeStyle = scgpRect
      Options.ShapeStyleLineSize = 0
      Options.ArrowSize = 14
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      HotImageIndex = 12
      FluentLightEffect = False
      FocusedImageIndex = -1
      PressedImageIndex = -1
      UseGalleryMenuImage = False
      UseGalleryMenuCaption = False
      ScaleMarginAndSpacing = False
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      GlowEffect.Enabled = False
      GlowEffect.Color = clHighlight
      GlowEffect.AlphaValue = 255
      GlowEffect.GlowSize = 7
      GlowEffect.Offset = 0
      GlowEffect.Intensive = True
      GlowEffect.StyleColors = True
      GlowEffect.HotColor = clNone
      GlowEffect.PressedColor = clNone
      GlowEffect.FocusedColor = clNone
      GlowEffect.PressedGlowSize = 7
      GlowEffect.PressedAlphaValue = 255
      GlowEffect.States = [scsHot, scsPressed, scsFocused]
      ImageGlow = True
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
      ToggleMode = False
    end
  end
  object CWSSettingsPanel1: TCWSSettingsPanel
    AlignWithMargins = True
    Left = 0
    Top = 224
    Width = 1268
    Height = 63
    Margins.Left = 0
    Margins.Top = 24
    Margins.Right = 0
    Margins.Bottom = 5
    Align = alTop
    DoubleBuffered = True
    BorderEdges = []
    object lblInstructions: TRzLabel
      AlignWithMargins = True
      Left = 24
      Top = 0
      Width = 900
      Height = 62
      Margins.Left = 24
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 
        'Copy the contents of the message template from the source docume' +
        'nt and paste below.'#13#10'Right click to enter Student Name token, Te' +
        'acher Name token, etc.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
  end
  object SVGIconImageList1: TSVGIconImageList
    ColorDepth = cd16Bit
    Size = 48
    SVGIconItems = <
      item
        IconName = 'cut-svgrepo-com'
        SVGText = 
          '<?xml version="1.0" encoding="utf-8"?>'#13#10'<!-- Uploaded to: SVG Re' +
          'po, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg f' +
          'ill="#000000" width="800px" height="800px" viewBox="0 0 32 32" v' +
          'ersion="1.1" xmlns="http://www.w3.org/2000/svg">'#13#10'<title>cut</ti' +
          'tle>'#13#10'<path d="M5.75 17.531h-0.125c-1.313 0-2.719 0.625-3.781 1.' +
          '656-1.094 1-1.844 2.344-1.844 3.688 0 1.531 1.094 2.469 2.594 2.' +
          '469 1.281 0 2.719-0.656 3.813-1.656 1.063-1.031 1.813-2.344 1.81' +
          '3-3.688 0-0.156 0-0.375-0.031-0.531l1-0.875 9.813 5.031c0.156 0.' +
          '063 0.313 0.125 0.469 0.125 0.219 0 0.625-0.125 1.063-0.188 0.40' +
          '6-0.094 0.844-0.188 1.094-0.219 0.438-0.063 0.781-0.469 0.781-0.' +
          '906 0-0.313-0.156-0.594-0.438-0.781l-8.156-5.656 8.156-5.656c0.2' +
          '81-0.188 0.438-0.469 0.438-0.781 0-0.438-0.344-0.875-0.781-0.938' +
          '-0.125 0-0.281-0.031-0.469-0.094-0.375-0.094-0.875-0.156-1.25-0.' +
          '219s-0.656-0.063-0.906 0.063c-0.063 0.031-0.25 0.125-0.594 0.281' +
          '-0.313 0.156-0.719 0.375-1.188 0.625s-1 0.5-1.563 0.813c-0.563 0' +
          '.281-1.219 0.594-1.781 0.906-1.188 0.594-2.344 1.188-3.219 1.625' +
          '-0.438 0.219-0.813 0.438-1.094 0.563-0.25 0.125-0.375 0.219-0.37' +
          '5 0.219l-1-0.906c0.031-0.156 0.031-0.344 0.031-0.5 0-1.344-0.75-' +
          '2.688-1.813-3.688-1.094-1-2.531-1.656-3.813-1.656-1.5 0-2.594 0.' +
          '938-2.594 2.469 0 1.313 0.75 2.656 1.875 3.688 1.125 1.063 2.563' +
          ' 1.75 3.875 1.656 0.125 0.188 0.406 0.438 0.688 0.688s0.531 0.53' +
          '1 0.719 0.719v0.25c-0.188 0.188-0.406 0.406-0.719 0.688-0.281 0.' +
          '25-0.531 0.531-0.688 0.719zM2.313 9.125v-0.094c0.094-0.031 0.188' +
          '-0.031 0.281-0.031 0.75 0 1.563 0.469 2.094 0.906 0.25 0.219 0.5' +
          '63 0.594 0.781 0.969 0.25 0.375 0.469 0.813 0.469 1.156v0.063c-0' +
          '.156 0.031-0.25 0.031-0.313 0.031-0.75 0-1.5-0.469-2.063-0.938-0' +
          '.219-0.219-0.563-0.531-0.813-0.906s-0.438-0.813-0.438-1.156zM6.8' +
          '44 17.75l1.281-1.25-0.063-1.5 11.406-5.813 2 0.375-11.875 8.188-' +
          '0.531-0.281-1.25 1.125c-0.219-0.344-0.563-0.625-0.969-0.844zM7.2' +
          '5 14.625l-0.406-0.438c0.406-0.156 0.75-0.438 0.969-0.781l0.5 0.4' +
          '38c-0.469 0.219-0.875 0.344-1.063 0.781zM8.688 16c0 0.5 0.406 0.' +
          '906 0.906 0.906 0.531 0 0.938-0.406 0.938-0.906 0-0.531-0.406-0.' +
          '938-0.906-0.938-0.563 0-0.938 0.406-0.938 0.938zM10.563 18.219l2' +
          '.406-1.656 8.5 5.875-2 0.375zM2.344 22.875c0-0.688 0.469-1.469 1' +
          '.156-2.031s1.5-1 2.125-1c0.094 0 0.188 0.031 0.25 0.031v0.063c0.' +
          '031 0 0.031 0.031 0.031 0.063 0 0.688-0.469 1.438-1.156 2s-1.469' +
          ' 1-2.156 1h-0.125c-0.031-0.031-0.063-0.031-0.125-0.031v-0.094z">' +
          '</path>'#13#10'</svg>'
      end
      item
        IconName = 'exit-svgrepo-com'
        SVGText = 
          '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
          ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg wid' +
          'th="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns=' +
          '"http://www.w3.org/2000/svg">'#13#10'<path d="M14 7.63636L14 4.5C14 4.' +
          '22386 13.7761 4 13.5 4L4.5 4C4.22386 4 4 4.22386 4 4.5L4 19.5C4 ' +
          '19.7761 4.22386 20 4.5 20L13.5 20C13.7761 20 14 19.7761 14 19.5L' +
          '14 16.3636" stroke="#000000" stroke-width="2" stroke-linecap="ro' +
          'und" stroke-linejoin="round"/>'#13#10'<path d="M10 12L21 12M21 12L18.0' +
          '004 8.5M21 12L18 15.5" stroke="#000000" stroke-width="2" stroke-' +
          'linecap="round" stroke-linejoin="round"/>'#13#10'</svg>'
      end
      item
        IconName = 'paste-svgrepo-com'
        SVGText = 
          '<?xml version="1.0" encoding="utf-8"?>'#13#10#13#10'<!-- Uploaded to: SVG ' +
          'Repo, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#10'<svg ' +
          'version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xm' +
          'lns:xlink="http://www.w3.org/1999/xlink" '#13#10#9' viewBox="0 0 32 32"' +
          ' enable-background="new 0 0 32 32" xml:space="preserve">'#13#10'<path ' +
          'fill="none" stroke="#000000" stroke-width="2" stroke-miterlimit=' +
          '"10" d="M17,6c0-1.1-0.9-2-2-2s-2,0.9-2,2h-3v4h10V6H17z"/>'#13#10'<poly' +
          'line fill="none" stroke="#000000" stroke-width="2" stroke-miterl' +
          'imit="10" points="10,6 6,6 6,27 14,27 "/>'#13#10'<polyline fill="none"' +
          ' stroke="#000000" stroke-width="2" stroke-miterlimit="10" points' +
          '="24,15 24,6 20,6 "/>'#13#10'<rect x="14" y="15" fill="none" stroke="#' +
          '000000" stroke-width="2" stroke-miterlimit="10" width="12" heigh' +
          't="14"/>'#13#10'</svg>'
      end
      item
        IconName = 'redo-svgrepo-com'
        SVGText = 
          '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
          ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg wid' +
          'th="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns=' +
          '"http://www.w3.org/2000/svg">'#13#10'<path fill-rule="evenodd" clip-ru' +
          'le="evenodd" d="M16.4697 3.46967C16.7626 3.17678 17.2374 3.17678' +
          ' 17.5303 3.46967L20.5303 6.46967C20.8232 6.76256 20.8232 7.23744' +
          ' 20.5303 7.53033L17.5303 10.5303C17.2374 10.8232 16.7626 10.8232' +
          ' 16.4697 10.5303C16.1768 10.2374 16.1768 9.76256 16.4697 9.46967' +
          'L18.1893 7.75H9.00001C6.6528 7.75 4.75 9.65279 4.75 12C4.75 14.3' +
          '472 6.65279 16.25 9 16.25H16C16.4142 16.25 16.75 16.5858 16.75 1' +
          '7C16.75 17.4142 16.4142 17.75 16 17.75H9C5.82436 17.75 3.25 15.1' +
          '756 3.25 12C3.25 8.82436 5.82437 6.25 9.00001 6.25H18.1893L16.46' +
          '97 4.53033C16.1768 4.23744 16.1768 3.76256 16.4697 3.46967Z" fil' +
          'l="#1C274C"/>'#13#10'</svg>'
      end
      item
        IconName = 'save-alt-svgrepo-com'
        SVGText = 
          '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
          ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg fil' +
          'l="#000000" width="800px" height="800px" viewBox="0 0 32 32" xml' +
          'ns="http://www.w3.org/2000/svg">'#13#10'    <path d="M26 0H6a6 6 0 0 0' +
          '-6 6v20a6 6 0 0 0 6 6h20a6 6 0 0 0 6-6V6a6 6 0 0 0-6-6zm-6 2v3a1' +
          ' 1 0 1 0 2 0V2h1v7H9V2zm10 24a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V6a4 ' +
          '4 0 0 1 4-4h1v8a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V2h1a4 4 0 0 1 4 4' +
          'zM24 14H8a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h16a1 1 0 0 0 1-1V15a1 1' +
          ' 0 0 0-1-1zm-1 12H9V16h14zM12 20h8a1 1 0 0 0 0-2h-8a1 1 0 0 0 0 ' +
          '2zM12 24h8a1 1 0 0 0 0-2h-8a1 1 0 0 0 0 2z"/>'#13#10'</svg>'
      end
      item
        IconName = 'undo-left-round-svgrepo-com'
        SVGText = 
          '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
          ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg wid' +
          'th="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns=' +
          '"http://www.w3.org/2000/svg">'#13#10'<path fill-rule="evenodd" clip-ru' +
          'le="evenodd" d="M7.53033 3.46967C7.82322 3.76256 7.82322 4.23744' +
          ' 7.53033 4.53033L5.81066 6.25H15C18.1756 6.25 20.75 8.82436 20.7' +
          '5 12C20.75 15.1756 18.1756 17.75 15 17.75H8.00001C7.58579 17.75 ' +
          '7.25001 17.4142 7.25001 17C7.25001 16.5858 7.58579 16.25 8.00001' +
          ' 16.25H15C17.3472 16.25 19.25 14.3472 19.25 12C19.25 9.65279 17.' +
          '3472 7.75 15 7.75H5.81066L7.53033 9.46967C7.82322 9.76256 7.8232' +
          '2 10.2374 7.53033 10.5303C7.23744 10.8232 6.76256 10.8232 6.4696' +
          '7 10.5303L3.46967 7.53033C3.17678 7.23744 3.17678 6.76256 3.4696' +
          '7 6.46967L6.46967 3.46967C6.76256 3.17678 7.23744 3.17678 7.5303' +
          '3 3.46967Z" fill="#1C274C"/>'#13#10'</svg>'
      end>
    DisabledGrayScale = False
    Scaled = True
    Left = 615
    Top = 754
  end
  object vimlEmailContentSmall: TscGPVirtualImageList
    ColorDepth = cd32Bit
    DirectDraw = True
    PixelOffsetMode = scgppomHighQuality
    InterpolationMode = scgppimDefault
    Width = 24
    Height = 24
    DefaultWidth = 24
    DefaultHeight = 24
    SourceImageCollection = icolEmailContentSmall
    Left = 296
    Top = 658
  end
  object icolEmailContentSmall: TscGPImageCollection
    Images = <
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C18000002B14944415478DA
          DD95DB4B14511CC7BFE38DCDD62DEDE2AA154551E9EAAABD1411461743A38232
          BB79A9B492E8A5D79E7BEB0F28B4E8C1A287205C2BB58B6F22959BDA8D68CDD6
          DD55225C570B5D47DD99739A33B3678A988901F1A17E70F8FD9873CEF7F3BBCC
          300216D884FF0BB0A573A29B02DBC5C918C4A88486F5022EB9D2D43D4288BA24
          5986AC2C4992D5589224340FCDE24174A94FD92FF31DCE0A98028A3B27282885
          3825A9800BEB282EE6D9D923653100854C64DC781940A33784FAE21CD4BA33D1
          1C98434B341D84D21091E9AECF479D7E63C0F371CAC466A21AE0DC5A82864DA9
          CA0EE3D23880A0B12788A6D7C3A82BCA468D7B25EE04626899CE6059B0739F7C
          479CB98680A267E39479712A86996919756B249CDF6853F73880B5A9C93B8C5B
          7D23385B9885EA8215B81B94E051005AA5C04045A6600A6042AC020638B32A86
          FA0D293A408310DCEC1DC1EDFEAF38ED76A2CAB51CF742323CE232559C553B50
          E13406143E8DA82D9A55C467A6256C75CCE26A7E129212D47B4A8F890A91656D
          E06CD8A232EC6B8309788FF4782B016506C600F79308E54273226101486C4EBB
          A825A719FD15324BB4A5401004AD0206A834037444288DDFD60E6BC2FCA25A1E
          17A754EF39CF9C9F193C96650C28E818A3F31567660E681FA3F31567EECB7113
          407EDB18E5E2CDDBD2909F26E8C3FCDDFF19BFF94E70F963721C4CE13F916D02
          781CE605A07F9FC392388FF7F6D8F44AFD274D002E068897DC5B6AB72CCE56A9
          7791FE720C9D3201E43D0A53DE4FEF9E54CBE22C2EEBB5C7E7F237C0C330E565
          BEDA6DB32CCE7C799F43FFE2035539C680DCD651FE19E0C5CE64CBE2CC1F789B
          AECF20506D06F08CD26FF75B91597908DD254996C5993FF82E033FDADAE128DF
          8F608D0960B367B44B4963074BE47A61025C8BAD897F984CC415FF12FEDFE80A
          D5AE2E31042C84FDFB809F6A9CCD379B49CE480000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C180000022F4944415478DA
          BD955B6B134114C7FF5372C39AB48BD8BAB9F4429B86A2BEA8857E077DD28F21
          A2E29B509BA59156444445444444F451C13EE807D0179FA44FBE094A2DA18418
          12B518939DF14C7663D2EE64761EACC3EEEC70E6F23BE7FC87B30CFBDCD87F07
          1C7DFEE30C17E28510880BEAE881F7EDBE508E5D8E268338B7757EECB51630FF
          EC7B91D62FAB0EE13C14E6942F8C17B580C2D33A01D87298C76A3877B62FDA7A
          40FE495D2E1808E07C308CE69CCA6503002D3488A06F4CEE73C108C09DEA958C
          1E30F3B836500365046E0BEE4E0388248068221C30FD4802BA1118DCA0F66FD8
          D343880DC7F0E943BD54BB3AB7A4054C3EACF669805E0AC8D3FE08E0CF71B78D
          89F904A616D2F8F6B5B1F1762175028C092D4046E01DE41F425E26A23F319A39
          280DE8ECEE303C90954BC1CAA6E09BEFAEDBB8D4850400B907953E0D7A80CC6C
          0413278FC0A4D1B66BEB69B6A20464EE572845C108B2F908264FD946006A4BAF
          D2ACA404D8F7B6831AC814C576303633DAB1795E8ABF691A492761D949B31449
          C05E0DA4C882C454DE26B24F1D1FC6EC6216D52FB58D778B965EE4F13BE58006
          BBF4E07BECED167273511C48C6F1F17DB5D42C1DD35FD3C3B7CBBE06665554B8
          2EC4AF06F8500C2212775A4EBEA8051CBAB5E56BA00604229063994278B5C85D
          3100781A9855D15DFF04178EB81E02B06E6EFA1AA80F5146D08313A0A0078CDC
          D8546860A8078783D5104072EDF36970F692F6C5C32B6A6F8EFA26ED3B8BB5C2
          1B2DE05FB77D07FC016E290146D1FAAE040000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C18000005B04944415478DA
          95967B4C53571CC7CFB9B7CFDB077DDD5B0AAD305A14A83C02A82C9941DC0BD8
          DC640B5D5C7C8C6C912CEADC12B36559F4B6FB632653114520218C45976D092C
          73EA00DDABF898E846A7880E84392BA88880F26829B7B7EDDDB91D753090CDF3
          CF696F7BBE9FF3FB9EDFEF772E04FF1E1C07393441FE330C7F7C8481D672FCB2
          F0E2F05A38FDE77A8EC36D0084C2C23487155B016CB0C1E07FC9D2348D59AD56
          68B3D966FDF70180433B47034D9CD00500910580077D0F469ECF276E77383824
          C4B5B571C2AC2C106AED0322E65A0B9B97971780115BF85DEFB91128760D02FB
          041B4A90CBF14BA628F8EECE05D8491A45E370C0D01CE20287C311A8AEFE3C51
          2C06DB653249BA52A9D00A71FC877B23C3AFF311C1E27A0EE76DA07F1B7FCA75
          57FABDFB4A3FE3EFBF714BB33435C164568EA540E67147A6E4779A4310F80F24
          225E5671303B8AE0BE55AB947AAD56078201A67374F06661D19A1277387A643C
          0E1060E517638786EF06D7794E1CD970ADF9B54389EF9C7EDFF8E2131F454D4E
          7CFC4DBEECBD5C272738990703BCB81389E721F1F2F2BA25320236CA65229D46
          AB8338C65D9C1CE92F78DE56722762ED0340B2BDFB6B65345994A29958FEA92D
          F6CCC69FBDAB7B18E2F078CFAD86B652A38D46000702D0B413ED3C2FB00B892B
          A5A1460521D1E9283DC42177C93F3E905FF0F2BAFEFAFA7A3C72E0B0B81859D4
          0083291BBF2B91A62EA9335888EE3893E8C8E098FF2577AFD7AC25E0A465A16A
          434512ACDFD7D424DE5A58C89495D5661304D7A490497424A987021CB48F0DF6
          16AE7EF58DDBD3C5235904C3C78CE6451B0EEF175B92362BCC666E72C20305D0
          170C48083C4919F2ED4CF62C8FB3C4B976EDFD6499421C3C26974B75A45E0F85
          10B63303770A0AD6CDDCF9AC348D6452D273BBB3FC12324EA4945BC5D68C1D04
          C6C0ED195EFCC9A5499D8D3FB6D27DEE9EBD3A8D2A56ABD301210EE7B4656E00
          AA429A06309C8E533095EDAB55F4D370EFAA9C04B348A10962B8003F77AE3548
          10325C2A16B68FDE75CF69CB430053A3B81ECF4D21A1A75F015D35D9ACF3E851
          DD7830D46230445B193FCBC4C41AC57DEE3F3BBA2E9C5A59BACD31349FF89C00
          3EBD6C0D0053DF776135A5D96C657965DAF5DB7DCD2996C76204B8804DCBC814
          527A7D0FC4D5CF180C52B7D3E914F015FBBF00E162420C60B743E07084EC3DDC
          2BD8D9E3D5C9D890FA9ED717A2B49A803EDA20D047EB314CACBC1EC2C4F96663
          54F77C9059877C9FE354D5432011F30697B576F9CB6EBAEF6125D137F134A5E7
          C2A5F68E37E3E213AA488ACCD49231402257BBFD21E659B3917A28044E6D1D03
          E870F777B1053F5D1DAFB9CF4A8D7CF31A76DF0AB12CC4159CCFB75E7B71D996
          D2B51D759595269D21B6514791A954B40988A451D7D94926DF6CE6211C82C019
          10186964F4D911CBE9ABFEB6BEAE0145E04EEF71814A6521620D0B83632320D8
          77637DE7C1A2CFB6ECDB27AED8BA95A9ADAD88D1A98C2750248B4983098811C4
          CBF8F353CCB32381B9A8F44FA2D24FDFEDDE14608803ECE57374F7972F7C9850
          7468B1343DB303656667CEE153E935AE52965F10C99AEAEAEA583D493593248A
          C4B0004194EE200CCCB2EB0120E9ED5F3689A8F80386289FE3C4A6383B7DC69B
          7DCC35FC2B3BEA39DFB12325679AA5DC7408A5259B298A4AD5451B814812752D
          C406F21313F57FF0F704EAB62188FA2EC6674CC69ABAC449BDB54D939C20371A
          454E1F0316F5F5B2C6A0FBCAE68EF2DCCA48CF8A841E81D4D6D6C628084593C9
          644C37C659008789FB47C72756A525C7B83864FFD421FF0D495E73B030A08EA9
          1452B1F1AC77CC877B46F67456E7EFE00F7CAE148C40AAAAAAD494867A4BAD51
          E79086052AA95C75DE12AFDB86DA756046ABE02FEAB4B4B532AF21335E2AF20D
          5D3EF6C100A263003842E02183B7829F793BA6176BD8CFF07D30B3D2306047BB
          8DDCC1E1BB02BD0480F9DF2E78C19696167CC58A153C848B88CFD92AC2CF681A
          A26AE61EFDB565F6F80B924ABDB419D14CDB0000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C180000030F4944415478DA
          B5956B48536118C7FFC74B53DB9A972EA0424A65E505C9118B1041A2614A421F
          94925A61CCC2C23E94D145908A6ED80ABA48817E480B14B228BAA8A4A2A596E2
          8795498497D4E9863AB7B979D9E59CD37BA6E4CACD6DB41E3887E785E739BFF3
          3CFFE77D5F0AFFD928FB8556AB8DF2F5F5155114E5E32C816118A550286CF718
          A0D7EB37B12CFB553331C56318D6694248281F6AB5AA223E3EFEB047009D4E97
          A31E9D7C5A58540DC1FA28C7C1249AD58CE2CE4D299423430F4422D1494F2A38
          A81C9EA8BC5AA1C0DA3DFB9C26BC7F538304CD30EE9548D1D7D77B5D2C165FF0
          2AE05D5B2378E313D8363B8EDBD772D8E96963F3DCDC9C3C2626E6B55700B5ED
          4D205A21684489448B0E92942D48CBD84E2B148A23A9A9A94FDC06D00C03963C
          41FE40E646BFDF09648AC87B7E0866C6C6D1D0A840188C3826DB65EAECECCC96
          4824AFDC020C8C0E4367D42394106E646C765A51DD20D0F9FC2DC4E1C081EC1D
          335D5D5DE904D2EC768BF82B80435BB12CA05F078CD7BE8024211869BBE3B4D5
          D5D5A28282828165017D233F31A9D7216CE50A9464C63A05F4EB81B119D234B2
          775A4B1FE2DCE9BD686D6BBA2C954A8BBD5281BDBD2C7B868CF4247CEE6896E7
          E6E69E71A1C110D160EA0F0DD4E44F79BE40300F501989E00BB941640642033C
          0438AAA04733BF8EE403DDC4A7170821041825F41030A41EC1D4B4C156C195B4
          0DB6984F2AC0442F6DCDEA40202ECC4380C56A8185B662158F822C31607EEEAD
          80D501806B1BCFCF4D4071E94784ED4C5D6C113F0079296B6C7ED33060342FB4
          85FC753299FD162589219B31699D0B00394D252693B5AEACB2058C75F1B8FED1
          DD8BA2BB676D3E378E666669051C80137E5900395FA88E8E8EFB02812099F83E
          9C454444C4165FACC0F14B276C31DF88B066072DE23E1EED4A643B1390C73F2B
          2B2BB0BCBC5C690FF8A77DF0B7912A020D06C34CE1A947888C0E770BD0FB7D10
          E78BF6E3436BC32D994C56B82C8033954AF5C56A45C2DCACD92D808F0FC55DA9
          E6FCFCFCBCAAAAAAC72E0172B93C945CF047892B740740D3345B5F5FDF535353
          534F961A97006FD82F3BE4DC2827FD06A00000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C180000048D4944415478DA
          B5D5FB6F93551807F0EF79DF5EB6B55DD7BE6DB701D3DDC0DD5982C438D06C03
          04C775892E2161C09C308978892624F21F10638C21F20341343A33598D17B672
          51A645E2E2051830D886A81BA1DCB6769776EDB6B77D7B7CDAB18EC6218DD137
          39794F9FF39EF379CF73CE79CBF03F5F2CD107ED76FB66BABD12A973CEDFABAB
          AB3BF29F01CDCDCD5534680763EC6CA40FD597D0BDBABEBEDEF9AF00DEBAD308
          88E57EA4E82FC9D6E2EBB2716D80ABCB4321C5623299D8B8CFE7D631B92B4B33
          E628D30C5DD121300E281758DDC1B18702BC75770E84F0CFD464F5291A347B16
          CEB47015E375F4F64C8140E961D1BE5BA46B3088321451ED1F5CFAF2FB415BFE
          7024AE84D19B9BC48ECE01ECDA439DF74127C16B2DC1A133AE7F4CC18B4F2D40
          EAD065C0EF81A7B816DEFC9510EE8D1A0EA380F507F91A218C1605480B53D0D4
          EB80B9EF1850D18090E5311C387818E37EFF9C831BF47AECDAD10095FB2AD0F9
          21860B6A3052B81602B511E252A951CE06A6F8BB9CE1F530273102F43820F512
          F07423602B4030187C20A0D7E9A056AB81C13EE0870FE029ACC168F1DA2645C1
          A960125C258CC96C80F34C45C61E0232148E8D52AF23D9D24340E50B041426B2
          C908E8059C87E12E583D617D7C63CA0317B96F82379AAF380E596916A86E8C03
          06430C3FF944F0B9808951E0561F264D8F60C8907551AF827D59BAB87F1163DE
          38A06792BF215D76BC63BB42C08AC80C8A626D1DA3224E8D09094D2853CBB02E
          5DE5CCD3B2AA28F0BBCC9B42616CA3343D418060BB4CC0AA8638E09B11215A12
          029218DF94A93990AF65BBA78129FE3DE5BF927612A44B0ED8BA0978663B905E
          1CEB747C58C0094F625F160EEEDC5F9C52155B83DF38D77219B584B448170920
          046BE201879BE11895CEEF6EC23726C7E2B6CC14E42E4AC32F67EE4010382A56
          2E408641F567636EF24191E164EC95AEC9FC494A53A7F9020184A0661B0125B1
          81DA8618DA06813F7A4630EE9D05CC962458E7EB70AD7B188C367F61B9849C54
          3536676B23E7E136EB97F951CAFDFA487A2267C1DCD50EEB0C90310B7C7517F8
          9A8ADF17C4E4B80CA3657A378EB903E0F75E53AD16609492F1A84EC4D6DCE448
          7A8EB30199F7D3C0D9F703962E02D6C5035FDCE1F8F23670DA7E15531341E494
          5AA3F1FEEEA1B8FC2FAF5D04739AE6FC5B45865A325CEC26E79660088B951098
          C2F09CE97C7B93E53C011BB612501AEBF8F92D1E2D13DE294CFA8348B54ECFC0
          3B14887C07A3755123229566463F9DADCB8CB38B7C6FAB2EE161EC309D6B6F92
          CE11B0A93E0E387293A3D5C5E1EABE8B807732164FB5E991B1508A9BC5BC14D1
          F366997E4B8E9A9D8802D7A7F8B630C3479114A5FDDA0EF35902D63F0F642D8D
          756AB9C1F1D98D307A4EF621303A118B9BE61B91B73C370EC837AAF06AB1FE52
          B6862D8E02F445AD6461B4D162E90D173A20FD680792B4400E7564D387EB53A1
          8C4A2912B9E6E9C45B7B9718B7E7A9D9B77FFF3F78FB251B047E9AAA05F7C73F
          B655E393F415090174D29CA7565BE2D720AE9D537CDFCE2C6844D54CAC3EFFB5
          46975ADA9BA0D0E67CD6B6E181C05C57512BD7980CEE0A0645F5B067B5AA5057
          C7AA059E48FD2FC56BD36772D194720000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C18000003584944415478DA
          B5966D48535118C7FFE75CDDA66EA9DB7A51338D4AB3173588282249C1C0B4F0
          4B5052D0CB87A00F41440615BE500951D00B14BD114194147D48222BD2741544
          50D08A4A8BACCC49E55C975D659B7AEFE9D90D96BDA8DBAA33C6739F3DCF737E
          E7FE9F73CF1DC37F1E2CDCC4A2A2A289644AE81BB45055F594C3E190FF09A0B0
          B0701B63AC8E2E4DC37EAEE79CEF6D6A6A7AF557005AF9663227FF141342A864
          B6B4B4B49C8E0A505C5C9CA0696A9710481A2987330C0E0EA91346926B540049
          B392A46918EB2E2967757373F3E58801244F259903630148AA4A92E9603480EA
          0C1BAFF9D0ABE9BE2106C849919097CE913F45426A12C789BB0138DA876A0950
          1331A0B52EBF2D233D2DFB7DAF4072FCF7C983905F87E34967DBD23DCE9C8801
          A23EAB1589590541919DED1EE4655B43B1904FFA406E6F65156F8A2206E890C6
          B2370498FEB4CD83FC993F00C3FCD7ACE47AF648F5E100AA0950334A4A1501F6
          460FB8B22A0E16DF1D4A5DFC7B10F711E75DC60A1DFEA80138F5363121E03BD4
          6DAFD838CE6CE3888903867CF0F6F56AA9EE4BE7FA93276DC73ABB377240B5E0
          3CAD7B0783D82D14C5B2865DF35F88DF65229F3E0CEBFAEBFCF52837318B4511
          8CEDD3BA520FA19669E101AE0889CBAEABB479CA755FD390E8FD883CF60AF3A5
          1778ACCEC633E44036A70312C72DFB51C89AA96381A56B49C6B273DD6302A433
          AE6053AB7F157C66E0256CAA1BBD921D6DC659A1F202E36BDCB61F81224CB295
          FBE7B19286F72303CEF658242DD0453B67DC98FDA191CA65348F3F8C19B19F75
          5F15AC437A346F06ABADD54200716B45192DD01EC8DCF4F098BCA8A2D3A755A5
          502FA719BDB00A0F7A020CC73F4DC1D3AF429F243F9961A18D21C510C0DABEC3
          306A5E246B6E3D260B736752497D260B362B04682C5368C5E6E0F5D7F40D83AE
          B8F9B1C10734810FC06CA08D6388A76399E3FE8D1BFA244B4A4B31A409F81417
          0C9EC7E8B11623EDCB6502F5C33F75BD6A4B9B1E3A50BE036EAED069F7FACA31
          288CBFC9C0E9D03727D9F0F9DD3BBD6252662614D943BD177F946DE2FE8398EB
          74B2E180E08362743F50A02A2A94763FFC9F067E2A720F0CE0BCCBA5176C983C
          19D6D8D8517BF333A0B174394954108A6AD24556DAF07C78C1B3DCDCAD6476EA
          7744EFE7394EE7F1703641D8FF2AA21DDF0006EF4428DB741C6B000000004945
          4E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C18000003D64944415478DA
          C5946B4C544714C7CF997BAF9576D7A014AC8922582B5477A1B1D208D1EE261A
          C59806718558B425C41853AB6989AF104D5063AB6DD336952AED17C550ACAFDD
          167CF691B0F485514382BB11306DC1C622A98AF4111076EE1C0FAB5BCAB22B5F
          309D2F3373E6CCF9CDF9CFCC4178C40DFF170095828069B6B9D0A735625163D7
          8802E8D8EC1890DD7E1E4E014545B8D257D16F3F74FDCF3800F17698FB5581D0
          AE089C8383605F1FC9D2D589B19D9133389CD6C45D2A2026E3CB8D6DFDB68337
          7A9234D36C1D70A2DF40E03E3EC412F6CB1C1203A0B470A26567644095BD9CBB
          6C5CE14B0ED98200293DBCB166F24DEF0547D356077B6A958EFA445ECE1B1283
          6847E124EBF66880296098DD987FA523641B9FFB63029288BB91B7269D3D3E63
          75BF06616EA89C7BDEC6E363C3029ECCAD9B30CAD4C610E042BE99182218C7E6
          2CA9C97C43E9CD1C640CEF52F1A3FF2EF21694759D9E793441095A4226EE15A8
          5822BCCDC16E2BC0CE2746EBBFF6F6DCBDB56272EC1D0C05D74DFD1712DA6641
          AA2CEC2C6F312C0F014FCE7BE9A9ABF316C46508A12D47044B705599EFA0D0B6
          84E9FFB3205AFDCA24AB3708189F539F24805A4DC46D1AD1AE30E73D1DD55925
          432EF9FE6A2FC3F72062E943250A02887E42A15CA444254BF4F4C08BC3B51D5F
          66964704F04BE2031C1C163035FBCC630D05DB575AF5BBAD138E7C3287D3DF11
          7244C29CF69ACC9A480002BA880A3E2281651C68EC432F99AAD22AD8EAB53D7E
          F97BA164B2AEEB57FA6420D9AA8C86F3F9D803C3B4AA6B5D63A586F100067F48
          15878ADA5E4DB4FA070087EDDB40C1757B4C83932FB4904FB68A90F613C2E77E
          97511429E8C7DEE6739CC559ECFF9044D5AF3B9FAD0DF7F90F207D0698486931
          972AD89AC10B9B58DFF758078F6F99EE0ADFB8B7B665BE10F40D97892D5C2E16
          B129B0CE91BA202AE0817068F7C8BFD86CE127BF0151BCCF90AFFC2E3D3B7C63
          99B7E95BF67B4133F4A9A6949B3983624D8AC4D7E6A7FC1E1590FE052529C517
          49742780FA0C03CC76067CC700C720696A5B9E23540DFC02B6AE774CDFBDFF87
          A6145302D72FDCB8DE99FA415480CD1D58CCFA9F625DCB59F7B53CFF83E7D77C
          2E3D63F0E99B8FF3C62CC3F2CF336B66CDEA7E60EBFF54D675CED4E7A302EC27
          E426B6BCCBA7CBF22F1D556F73CB3A4E3DDEB7CC981EF2F9B0B635D6C0DE233C
          3CC0C1FEAD41FBEA5A1613A8374DD40ADE7871DACD68195470C7C1F5142EC164
          77073EE5F9429FCB481AEE99466BE1195CE0AE865F4DB05CD8DDB298E52A61B9
          12460810E8149A3EB33117DB82734F6011D79AE30CB08C0CC013C8F12D35AA43
          F334372510C86296A86444008FA2DD03CD90BC281FF90F4B0000000049454E44
          AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C1800000065744558744669
          6C6500443A5C35312E2049636F6E73385F33645F466C75656E63795C7363656E
          65735C466C75656E63795F427573696E6573735C305F466C75656E63795F4275
          73696E6573735F4D656574696E675F526F6F6D5F626C656E645F342E352E626C
          656E64AF0A368C00000018744558744461746500323032362F30322F31302031
          383A33313A3336BD4900C9000000107445587454696D650030303A30303A3030
          3A3035EBAEE2DB00000009744558744672616D6500303035C63CD13B00000011
          7445587443616D6572610043616D6572612E30303112DE597F0000000B744558
          745363656E65005363656E65E5215D96000000137445587452656E6465725469
          6D650030303A34312E3837BBB6804F0000001B744558746379636C65732E5669
          65774C617965722E73616D706C657300363444B687A500000024744558746379
          636C65732E566965774C617965722E746F74616C5F74696D650030303A31312E
          30388E3D062A00000025744558746379636C65732E566965774C617965722E72
          656E6465725F74696D650030303A31302E353255C4D4700000002E7445587463
          79636C65732E566965774C617965722E73796E6368726F6E697A6174696F6E5F
          74696D650030303A30302E3535AFB4B01E000005F44944415478DAAD55695013
          6718FEBEDD244B4208E18AC04838AC2260C5E387572D1E881DEF3A0575BCC751
          EB8C3AE351EBD111D04AB5D5B4D551076A15A13F6A289DA03D741CCB694BAD8E
          B48A2097E10A5702B977377B7CCD868422838E3FFAFED96FF77BBEE7798FEF7D
          178237348410CCCA2AC3CBDCEBB2AC791C8410BDC939E85B6811C22F9601A8EA
          03A8280372A348B8B13ED2E1EBFF4CAB757384BDCC01BDEE4130DCA361EF82E7
          82B7A50F3B434B5BC8AD661B0D9303E86BDB32A6F5BD746E2487D789A108CE36
          52ABEA39B050CEB3B7BF4A94FFEC03F8044EDCA8BFE990842DAF6F7700A5A3FD
          97EB47E62CF562047220907FF9845C5C6B619649ACAEF24B4B427F188A6067B9
          75A5521DA07B800012DB3838B1CF9E763E55793725B354549E3D9F4D5E794DA9
          489A540B7034C66C221161EE3226386B2615EA4E9B7C988DBF5B5322647EA535
          561CF01D7618D3DDB2E6CAFEA95A8F40D2E5EED39298908F1D9CD5CC533265A0
          7EE0F8A3839127533291FB30E0844812965E2A3623D56ADE6101A1747D496DF5
          17AB8408524A015E3E1FB21374D6C352A9F433BAD96066F54E65B0A55FF32077
          CE8141814D37D30630E51DA72404481C165EE1302F68D22D2907990803D99EBC
          A2F499E9C195C690351C476393E3D8EFEFDD2B34793290E94E5336E4A3731A67
          3907D872A6D326960FE84184CCB6FCAFE26D3F416F9A50E2DCAB0B8CAEA0390A
          31AA68AA5A5DEEFBEEC9B3200107EBE1C9ABA798BEFAF9D6EE28DF2D9A6B62C0
          BC607177757DC59EBBC3AEE9C86BF772810B7F6D89EF6750CEFD178E5936070B
          93C3F1EAE4B1D8D175696FD7F930AFE2F0087C5D610D33F8C3C24A0ACC096541
          E9FB3CBB69EBFC20B3B037739B36387DE9946A240B1E5FD5D8CFF7DB19402009
          36C1AFBF79F6989E99EBD7AF300AB8CC6AA38246447E559F6B51909DFE73B188
          DEB03B23B6DB2390F25DEF3E757C98A6C962A7392427A42F7A7694EF08FF46D8
          4B3D56B53D364A95E762499A6490D8626781D1443211044F04A39E0F0B3ECFC8
          1570534A2C9B274628F20D7A13ED328908656BF3E1DBA7A79FF1088C3BD7A209
          8B51ED73D20ED2E9144BD936738EFE44DC31612F31FDC619B92AF290488C5CEE
          A4896C7617B09B2936D03520119B1B340F2A3F3D20E0220BFB8F47C825D97CCF
          00E96C734A89EE8E8BFF5C5DB87B50E04CF3A52075D82E0765A3495A46908DBD
          9A9E73F10756373AF7DB1EE93770343195038877833186E1004B31BC942531BF
          00B6C66F86BB1D26056854DFF6E5442A6547D8CE5E9AEAA0086977FBD5270569
          DB3C02B1A7EA7303C786EF20292BED70CA08AAD670D67865F247D374ED1DB888
          0FC0703480780E136E93AFF57988F33C0382388AB7D6AC8D8B0ABAD0736A4C88
          FF5168E8A669034DC88CEDF94F0BDEDB3A2870B22137302A6C072544E09212E2
          36635ED3D9849D205D8B83A25A37ED331900BDC3C69ACAFB4C74026D12041919
          5C5C6EEF7965A0740FE58D4066EA740BA40D0ABCF549DD053C2C74378F480A57
          10E260959494CB448D5D2EAEC96CE60BDBD706DE1A6DB04DBA6559A224F04D0A
          84C62317379E71B864FA160BC3B439FC82C8DEBC9AEB693B3D0253B694AC3451
          988EA259841304C003FCA148118024B16A88ACB69EC0E21BF18F1E1DB6B89931
          6F73F160438D7F426A749DD8E68A3237B4F19CC38EB1148D78AB1DC9208345F8
          D16BAA8BB66887A669D23BFB97910C4C719712F13C74029A91B966ACD825F657
          80E8E775132AEF6CEC02DE4E16BC8FC8AC0FC5C47813FAFB995852FFDB654010
          3608797F0859CCDF1FAB7852AAB9F99A4E1E34F5A1C7359041C9EA96E7EACA92
          75ED203313035959481088FEFC6938EF147588F5ED0D2DF98B125FF5831A8AC0
          53D0DEDAC1F7F84808F27632D1071FDF4314B7609C411F53FAE307ADC305A65E
          688DEC33D8DB88CEAE3F9A0B52E782E9B96220370C3AA94A42A02863D81F6DA4
          796E4F06A7DE7EFF3AA05C9BA6D9DA4275BACDA6E1832F35B739B0EE61AF91B0
          988A5BB4CBD67A272F3F926A7401C1D3EC6C7E5CDAC5D9AC8B9CD95A7650331A
          4CBDF0FC5E5C041EBFB8B3B7D277E6CD04FE477BBD80E0D533772379F3396A2A
          13DD8D388AE73EFB17B22A2B46A49D06770000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C1800000055744558744669
          6C6500463A5C576F726B5C49636F6E73385C50657465725461726B615F737479
          6C655C33645F466C75656E63795C466C75656E63795F536369656E63655C466C
          75656E63795F536369656E63652E626C656E64607EAFEB000000187445587444
          61746500323032362F30332F31352032303A34353A30322A9487110000001074
          45587454696D650030303A30303A31313A30338711093B000000097445587446
          72616D6500333333063499940000000D7445587443616D6572610043616D6572
          6168FFEFE90000000B744558745363656E65005363656E65E5215D9600000013
          7445587452656E64657254696D650030313A31332E3436A49AB39A0000001D74
          4558746379636C65732E566965774C617965722E73616D706C65730031303234
          B76F38C700000024744558746379636C65732E566965774C617965722E746F74
          616C5F74696D650030313A30392E3036372621C600000025744558746379636C
          65732E566965774C617965722E72656E6465725F74696D650030313A30332E32
          33E420FFCB0000002E744558746379636C65732E566965774C617965722E7379
          6E6368726F6E697A6174696F6E5F74696D650030303A30352E3832B3A0ABC200
          00046D4944415478DAB5955B6C54451880FF3973F6462B50CA96AE0D5804AB52
          7931460D3131B8DC0C31C1876D7C10096FE28BEFBE5413A3095E882F1A35F149
          4DDAD5C4104D2C7B94564C2F40280229686B2A95DA762FDD4B77B77B3933E3FF
          CF9EB3A517F4057677766E67FEEFBFCD7F18DCE30F730791DE5EBE2B1864FF7B
          A2FF4ECB4B1B2D639D2A1AED12CB00F7CC826EA58CB718939F5E198FE40BF988
          2D64510A6508A5404A1B9404B085004573FC0AA1700D47D4704D60AFF76A7389
          DF75E54AB5E78B575EFCB6BBBBDB60E49A685797F8ECDA444C7ABCFB0A0B393C
          A3381D10820E612F510042A41624B450291DA1EEB8F69CF0F8FD3C393BD7F7E5
          F1C821925DB7E0A391DFCE5414EC2F2F16CB688106D8A41D1E164A2C17266B60
          774C1650434B05F77A7D99F9CC8F3D278E3E4FB29700C3972D9B9BE1627E41A0
          502E1C81AEF9E20E00DA2FDBB66E5E66084FC0CF53F144ACF7B5630796014E21
          40183CBC8800740597B701302E00DA92E500DC847CB90AF73706A063D30618FE
          7B56D81E2FCF2412B19E95800F87472D692C59E00A2F9166068352D5D629E75A
          417B854A157636DD072FEDDAA99F797FE8B258508C67E793B19E5757003E1822
          00D70050A05D54AC56A11335DBBBB51506A7E3D8E620601A60DBB5BD275A37C3
          9187DA215D2AC157D7C6612A9D1381860674517CB505EF0D5DB2101E2E15F2A2
          82B1A2E0EE0905E199B616C03918A8FD37BFFF05A37349F030067BB785605F7B
          1BDC48A6A1676C02528B255C3784E9F7F1F9F81A2E3A3978C902B42093CD8946
          0FE7071F08A1F61B61349E82FEA9197861C756D8B2CE0F5F8FFD099DCD1B614F
          DB16F805D74F8F4F4215636422B48A696406020888AF0EF2C9C18B960D3CDCA4
          8438BCBD8D6FF27BE1E79BB3F02BBA85E2100CF8E0E547774013AE53FA9E99BC
          05FD37FFD19651A335292402FCDA82D5807317AD4560E183AD4DE2C10D8DFCBB
          8929B89ECA60F00C600A205FA940FBFA4638B4BD0D0650F3D1D924F8B9E15CBE
          DAADD600BC68F3893500EF0E5CB084C9C346B9447581A74A65F03143A726059C
          529262A14B07DE668A83B82DA3F4BDF82FC0DB03E72D30CD706101D3140164B6
          700F3B1ABA63EA090CFA7A2CDD0B8500EEC420BA0AD07FFE27659ACF5116E119
          BE52A8164473A7EE28674E0519B347AF9531CA86CF4B31B0A2278EEED7805E2C
          485D58ECDE3C3BD227B979A00E50D211B65C731742167074D3B1DD1DB019034F
          A89974467C7E6582A733D9BEEF5F3F5E2B7654B37F88673B6E4C4E9DC662F770
          B552A66A6AAC05581AABFA8D7E3AB81E7C181385B0546E415A5371EE0F04AE3F
          D21C3AF2C6E1A7FE60EFC4469A43DB42574BB608958A052DBC1E3417B0D24534
          77CA069590FA1E361FE7927B3CFCD6F4CCF4B998B59B9D55CAFFC9A98F0712F1
          F893926A0063862283954E1CA0815B8E6B0D34909EA15E3FA193C129ED444519
          C55C6E44B63CFEAC7651636B6BD0D7E07B8C318F3469C134E9E77CCC55AF411B
          2F5EBDD73FFAB3EBFBA88821B2D9ABF97C3E4900469A31C6D4DD7C17A34C14C9
          EA2F7D0691887157DFF6D128F94FFD0B4565133C69AD62700000000049454E44
          AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C18000004D64944415478DA
          A5957B6C145514C6BFB9333B8FEDB27D51689782585B48A912D0188A85023681
          622AF41F82588201830615244090881113422A18A08A12524A288668A8442444
          2496963798185184ACD8505A296D77E93EBACFD99DA7771625265568EB2467EE
          6432E7FBDDF3B867180CF25A3A79749ADDA9D4D858E29275A35BD398939FFF10
          E87E941FF3A80F5657160AAC1E3C9834C4C5635D7984300C344D43381231FA03
          FDEBEB2FF9EAFE17604D454E7DCEA8FC95777B3C28292E425A9A1DB29C4899CF
          1F34BD7DF766345E095E1E16605169BE343E4708A549236C1EAF178220500FEA
          629A50551524F51C3FF1E999C0826101564CCF7C52B4A75D278609470687B7D7
          4FC6C143ED08F8E2B08B0978EE0286AE6A0D97FDB66101164FCD3A6C17981A49
          12F0D9DE02801B453D78444201A8B20FDF1CF7E0E2C5240E5EF133C3022C9B9E
          E3E688515CFB4116DA3AED282CCC40AECB0EB73B048718455E560CED6D3276D6
          EBBB1B2E78D70D19F06A79EEA5DA4DC2739CC4C11F16909D9D86CC2C1B3CBD09
          F4F4C8282E48C2E74D62EB2E3DB1FFA2471A32E0F57257EFDC197A6EE55C110A
          E191914160D82681A86E989A0E254AC5EB34DCF301FBCFF7324302345D6DCB09
          5CF8DA73B3F52BF2C2B42ECC9E25C16459A849400E6948CF6670F5E7041A8F39
          40CC24D2D3EDFB6A8FB5AD1A1460CB16933CBDB0EBC654FE40B1B75B46E3EEA3
          58FE6214E346B3B87C2281C22936648E25D85EAF9BB2CC4214F9FE3DCD7772A8
          AB3E68C09B0B96C539FF05414D18B85D781E4BF65D329BA76C6024D1A4271988
          29BCF9D4CD536EC3E08E509946EC2AEA1A748ACCEB4FCC4EC48C33F1A002357D
          0612850D5879B21F63A24D58E13C822E321EAB3B37231877C04C1A74DF26BD31
          3B5157B4715000F7F7D35A1EE7BA9FBF17128C5323CF924EBF9F0A5DC38ECE59
          F737A09B008D82D30CF034C2986ABD341234572E7CF858F0E1808F6E97BF9475
          FADC66E7C7D8D0F50E4EC7CA51E2F4A25A6CC05E791DCE2D1987310E161C0C70
          2CA153C384A2EAB8D61DC59AE3A1777FD934B1F6A100E6933B271896A9826CC0
          0CD39A090C08CF605B991D6B9F49074B08745D87611829716B9565198AA2A0B7
          2FA029F14865595959CBBF03767764B012E7A57E3CE25420A2C3FD462E26640B
          74C6DDFFD4124C26930F442DB3069FB5C66231FAAC791425593467CE9CE80000
          BBE38F45A6833441A339A611B42FCF427EA6F457DE43D07CDF42732EA422FA03
          F1BF61D168F4FE84A511F23CBFA7B4B474CD000053DBB19D11C946AB9BF38889
          1BCBD3C145BE8362D8A1D2A24AD1A3A0E983EC7C8D06989F120C85420887C388
          C7E3A9E82449B24C9F3973263710B0B5E3103866196D3BAC2A2678BFCC06EED7
          723AF76944FC0864E6BA684B86F15B90C7E4AB8DE04540A4BB1941E92E3D8A4A
          8717931C11389D4ECC9B378F190878EFD64E30641D438BF0630DC1483B017A0E
          43E86B006B539199CDD3F96FE078C7B358DABE03BAC8D0F14125545A6C6A56DD
          3845ED3D35BFFBCB8A8A8AF5038BBCB633AF6474E2D6C202DDFE7289997A65FD
          7FAD1C87FC772007DBF1939FC79E9EF9504C5BCA9B2260A6FE6CD428DCD41923
          513781FDCF366D6E6E56681BDA58967DD035FF348B493BAA99AE6F555555DDC6
          961BB97C947F8542CA4DC1D8AE6D9B78FE9127B9B5B5F50B5AC06914649DCA3E
          2AFC3B153D4BDFB5545757473084EB4F5CBB6537E4FB5ECD0000000049454E44
          AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C18000004544944415478DA
          B5955D4C1C5514C7CFFD989965F683520324A562516C2B2E90540214354B557C
          304D4C6C97D06823DA34B1F1C51A9B181F5C36C6C48FD4F8007D3055D334F101
          6221A68D353176B1A6C1A48836B6341814A15B503ECCAEB0DD9DB973AF677681
          5202B4267492CDEECEDC737EF77FEEFF9C2170972FB2D6C38852349A5D45E4BA
          03E6932B4CAED65D0126E75142C421A5AA4685DC7FA69BBE09CDC45917400893
          F762F223CA7A7C10E8E9199BC52FE85D9500CD0E2845FEAFA24580C2E09AFE7E
          DE5F53631F56A2E50F609F2601CCE454E692B7DDA86B6C03EB3400F3B965C3AB
          08BFBB72BFD72C2399CF4E4218ECEEFC35215EFD8DB2F6A47084A6319E1C4FF7
          5DDC94B773C9FA5B93B9B1318C6D046725D022C07DF88A25DEFA5D63EFFE9BB2
          25FA4631436376CA1AA186FE81C61CD01D496C8C114095144E4211FD4ABEA9AE
          9CA534833968A4AD0DA2D1A85C06C0E440D48139FBE898C95F4F241CC1A4C31C
          CA8872F7A31130BC34BB6FE67EF09640B8258064E61C65D9CE207748C7B325DA
          713486E58296DA3AAB60CFA8D89728615FA4A62C9B2B875B981C77091C24E82A
          A3245069111D01B9384B31E08E0D1941A9606E04A379FFCCF6566E242D278A7D
          1368430AD11C240BA878FB5298D59775E6EF3004B16D6611DC3D21E02A308850
          36331C2C4AEE44319629010E46A605A1E94406D530E9F1999A99163FDD9B4A3D
          DD53973FBD50F645176D3BF8F571BEBBE1807F878910C10526920685C45006EC
          F371F413078695C2F2E3E130601E0EBCD85072B35F398A5276236D1B81805690
          993DF17DADBF75410559EA8CEDAD3D9F6BCF3CD6EA7FC427A4E550619A74FAC2
          B53F33C7BE69975B8A2465D23D1225988EFB53F713C3DBAC3F5852EC0D1628D7
          ACCA92CAD4356532FDD1DE5DDE3E771ACC2B402511042171EBFEEECF7863FD4B
          BE9D456995473D33C3735F0E3FE5DB8B92194A7696BAAE32726E732241CE680F
          6FA9CA2B0948ED464A06FC5E4E2CF9716CF73D87C39D8ADDECE448040BD0062E
          A4FCF9AF3ED16AAB0F16349542323E77EAD726DF1EE8543A5C8E2DB160219620
          686D3BD2B76BAEB0E03B7FA95FE55B190986C9443AFDE3C517EFAB576E0BDEDA
          16379594EF3DF5A1FEC4936F908DB4FB728BFFB9E5F65BB077C3CB3DFEB1E0D6
          5F486171996732211853DCB2E44872365039192D9E5D61D86160B88B4257B353
          FEC2B7475560C3A6E16335FB20DCC9DC7BCB01A1D0393E142E1B20DE40908D4E
          0AA2712E6D310ED20E5E8B06675619D73977854231F657A9C8BF7AB2697AE535
          4485D153E73BC67FA6DC13D447E282EA1401CE842579F0FA7B15D36BBD70B05C
          8A2C34CCAA0054F6435DED0068BE4A6D745C80CE39086BC2645AF0EA6D008BC3
          6C956999B5771810F07E433F4EF96A2DFE771ADBDFA324194740D5D047DBA76E
          0F584B21649B9D94BC3331007C43351F8B0B82872C6D6BC2CB2078B5E34E14DC
          01E48143830D195B3C44D2695B29C7E6945E1F3959DBBBB0E0AE5EEB03086397
          57C408C4E6FF17352AE8CA75FD7FAD4114B64A460E9D0000000049454E44AE42
          6082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C18000004584944415478DA
          B5955D6C145514C7CF9D3B77F6434B6B4A5A81A08912D2682428A8F1898F6014
          25460C8B246A303E80263E889A6082B1D9184DFC263E989448105B78685F3006
          48A069A9480A4DAB54B02905DA824BDB2D96A5BBDB9D8FFB713CBBDD42A15212
          B1279987997BE7FF3BFF73CE9D6130C3C1EEE4E5583DF2861818600C67045008
          4456D061CCFC2F0024410AACF6BC859D5CBCD96E5BDB128CB9B4C009A2EF1850
          8D68C529DB4F10179D00E84CE6D42F77196F7D534949324690869B20D30328DB
          1880353C695F05DD9348F0AE8F8F9E95B2351515219951DDA559BDF6D0BC70F7
          3244BB8531352D209F6517AD35FC8BE509079F7AB8B04DCA53C3AE122A1261DA
          3703E5817EE1D05CA76332640AA0BEBE9EAF8FC50A93416265DD008B535A3FE0
          1A88083DDEC70C08BFCC98F9E8C96D196571945A074E98A3D2A95939B9EEE882
          4813B9B7F28DBF013051C35AC4398795FAE0B2321BB4E354D056D448C9D0304A
          6218BA34790BD21A587E811E60A08DE28E850ABDB0820D6D55E2A73C84DD2CBE
          536656B519A76EC8712A33398DC697B46A99316301D70A0C4DA521F190098804
          DCC510D180D6F24465A48858410653918EAB0F776CAE186493EBFAB12B575EE0
          6C7F52F37090F3A5B134F7ED30DA52A21BF042E694555EB8505B1604B6A705D8
          46829216D8A8B54C73AE5B1357A2DD171F3AB17355924DCCF59E747A76A3153E
          9E34E241E3FADA38828F247D33D63566C9248DB9AFA81C9AB46D309E021EE250
          F6FC7C28D851086810D528823E7601444FCF6B9DBB5FDC43995B6CA2346B8683
          8F725CC421EDAA6804EC4BE73C1C694E323D3070127D771F433D4AAD60DA704B
          673D198DB2F9B3DF79668BE60EA7F48D4E695610EFEBD9F8FBEE75B579718817
          9BDC4C63B5B5CBFD4DA2F588451D0BC60C641B072C6B6470C7AB5F36BD156771
          539C382C7C1AC8F1C63E2C3B73D53BE71951AE875C638E9D073BD1BBB1F3C797
          EA965537DB2DF115D7C7B4AA0B17E606474F53A944280C3AE8551CFEE83F7FFF
          7DE9C52D6FAFC8C2A676017332E31FB4B9250C362F952B1B872A837B4AFFCC26
          64B977B4578A64DFEBA76AD7EE5DB2A94674ECD82C6F38689507DDE5E079CDC6
          F71042611D1D9076A8FFC2AE9E2F1E7F83ACDA64F5DAC99C70F0D4C94C45EE8C
          E9F55AFB84F8FBDCCBA7EBD6EDBB59FC1AE0DE5DC967B51007D1CD22731C1D1E
          6136EB4F6CBFF8ED922D34BF1C1A269DE822A06A77A25CB55F69B93B35BCE564
          DDAAC393CB32155033B09A46F00006391A12C73899B0CD2E26B627BE7B6C2AA0
          18CBC859B2B7ADB4BBF6C911FA31D09EF553F65C03CCFBE6AFD592F103C62780
          704C24CD6D3E78E9EBFE9A27DEBB15A0688741ACC1BA95F8F51E7C9658430E7E
          2607921CE850D60E8BCB435FF57FBFF4FD6901C572C134315EA20FFB9E4374F6
          83F20D3A51130AA2B69DECFFBCEF87455BA77770FB280016BC727CD618AA150C
          4D04B8083B966D84BAFAEBD9BD4FF716CA00D367795BC04C4611906F1658307C
          84C172BA3D42D7F22306E271F3DFA5C7E31F48E392B74489798A000000004945
          4E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C18000000B34944415478DA
          ED52510AC2300C4DBA637806CF236C65DE41043F3DCC7463571144F10C5EA120
          4813D3A5D07D2AE897293C4293F43D787D083F3E6802EF09ECD9C1E35A03D142
          004E002020854B3BF4D4BBF45D9CCFA3CCCB6EEA57C4F77058F542CF2AB0BB78
          24EED202B22C0990726525F9B84FD187A13DAAC0F6EC91B9FB1A79AA919A30AE
          FBFC078C6E73AA997859EC89D91E7D5CEC2AB3C9AE9935935D4A7E0B633B148B
          2C4596224B91A5C852F4EF022F815F0A376CBEF56D0000000049454E44AE4260
          82}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end>
    Left = 302
    Top = 735
  end
  object icolEmailContentLarge: TscGPImageCollection
    Images = <
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C1800000AED4944415478DA
          ED995B8C5D5519C7FF6BEDBDCFFD9C69670A332D15116F50946B8255432B3111
          538389404AA209461385E0FD417DF0A1D427F1054D9417546224126914022D24
          F2A05502764A0B089DDE0B9D1E68E776DA993367CE75AFCF6F5DF639FB9C99A1
          7388A42161A7A7679F7D59FBFBADFFFF5BEB5B7B04DEE39BB8D001BC0F70A103
          78D700B611C9B11D103BB68AB073940468B9BBFF2F7D615B7F8C3C743DF71D00
          8038582168258DBC2BDB3692D82E54DF00C481F346BF27BAFCCF35DAFE7A9D2E
          F73CA8669DAFAD5023B9CA6BD55B10EBF8CE67B2A19F8542281C70BC1B974017
          9E0454E71AA2D0ECF8BE8789890A6D3DEDC9F16C3A999C6AFEE9F8E6F46F57A2
          C462055CCF7FA142BBC605B6CC4D51E879C20B6709AA0E2438F2461358EB01FF
          BC88905121426E467435415DFB1150D8A8831469239AEBA51F20E4F389C0C789
          D7A7F1953712389729505AF92268367E7AEC96D42FB9018FE3095706E082DFF0
          1AE5CE25D5016AC94BA5522D7842A8B906D4420BC14886010823BEC233C35564
          6831401C427F07BEC499520577ED388C2A028650C807020FDFF1510C65131052
          E2E4F80CEE3C1E60365B207FA18E203FE8A71AF51F1DB935FFABCDFF207FF7CD
          A2B56280A1E7289F1C688DC984BF9E6A1CADEF8990014803ACCDA2DE52582B19
          602D03680BF52A10FB4F0324D82227A7E6F1F9BF14D1F092A03044C6233C7BE7
          25585748B21412E3A766B0F588C70A0C2058A872B7084A66066486D4B70FDD9A
          7B68B99C5806602A9F280C8C092F588F46C300A8590BE0AFD50A288C780A4FAF
          AB212B3A005DB6A78E128940E214036C79E404EA326114C8FA849D5FBB1C230C
          2038C94E6980431267D379F8D5BABE8F488192E90243E0AB876ECB3FCA0725C7
          A756069065009F01EA750B10B7102B30AC012ED10084D034B4D480E614083C8C
          4F96B1E5E1A31620648080B0EB1B1FC3BA8114C000C56209771C2094D20556A0
          C677727B213FC84FC964551C5FF3D717AEDEB7F3CB0BB01944E707486B057C06
          A83980260334E13340935D35CC39B0EB0375E46404603B5DB49BB23F74D26A80
          539373D8F2D018EA2202009EBEE72AAC5B9531162A166770C7AB849954DE01F0
          16F2CD9E2FE8ADD9526AF4D5AB4EEED87AA677785F1E205160051C000F43AADC
          405869C69238C45397362C801090CB88AA9824E900BEF4E02B1680472E03F0DD
          EB0C0031C09B6F9EC5EDAF34319DCC23612CA41508B9F30241A7E766B2CF1FD8
          70E2F1DB27570EE0E519C05B4F8D3A8936005B6838CD162263A19D1F7200DA40
          226A5044E631BFC8018C4FCCE29607465147D2E6005BE8EF3FDE88F583593685
          C45B0C70DBFE06A60C4064A10860B6947DE1E0957D010422C716F238896316D2
          0A0CBB240E149EFC700B19CE29D593011A465B48180560004ECF9471E76F4651
          23DF00E492128FFDE0D3181E48F3F512A7CF9CC36D2FD630193040AD6615500C
          E031C099B912FE73F0CA8915033CC100835906900CE092B8CC00F39C03AC4093
          DB5D8D169EF9480317E752E0710A52F434E9080C9A93A7C253B806E2991E1EDF
          904B05E6B254D2C7F8F814BEF85C05B37A188D2BC0006A62AE24F61CEA136075
          DA29C0E1493EC8BE57F32164CE33F1E8A0EF6A16717B9E6B8C44601A1291955C
          E07C1B4F52C2042CF9DBF7ECBDFAB7FE281786CF13DDA3BB8BF8358D205DC881
          2A359740AA0330DA27805F488D490DD0E45085EDC230913423916C85E6CE7ABD
          89C2A909EEB1BA75BC297094198E848E8EC83E402957FC287BCC1642FCADCC7E
          B3A170AEB00A99EB3E88D674D9AAA74B8ED002D0E46C49EC3DD227403639265D
          121B00DD28D72C6136696F24EB8C90E7160AC93DD459879CF95DA00863C714B5
          038C3EBA9D4C5AA2C9C1875C6899B6F565CE4206E0C5A37D026412D642910251
          AFE92F293A894AD11C10051C4D02CBC0F4EEBB8FAA363BD168C5949B077C9E07
          26D942FBFA0548050EA0EEFA3A364D458146412F15FCDB05AD2B54652D251C20
          F54219E59C85A65881FDC7FA04087C3B0AC572A01D7CE7FAA581A240A27351D0
          5A41074351906D6BC5F224B25C340F4CB1022F1DEF13C0F7C684F41603C40307
          162B80256CE302ED00741468E74D6F6E98365C0E688097FB023898F7E5C516A0
          15CB017D83D0A387300B912E45A863271D97A06E008A29D1DDF3F6B7E7EE23E3
          FF1E05A635C089FE003C5A63734003B899484F563CE2A1CEED1602B12C40BBB7
          23559CC745BCA77B72A35C0F91E05D0ED78D6A4E01E9005E7DBD5F802156C06F
          5B485FA8831F4E0BDC7F4D161FCFFB68A91801C557613110D3B39D4029FAE891
          877B5B177B3C10E370A9819FBFB480E92AE9359BBD47B96A74BADC27C0EF1860
          D550D730AA7B7F8E6BA03F6C2C60EB655C4ED442A388969CD0139C8151AE93C9
          5EE3CE29B7AFA803D0E2F27A90BBFF8F876BF8C9FE16B86F4CEC7A1422B610B4
          02AFBDD1274061B07B1E800D66D7E70670ED808F85969E133AFE6E070FB7EFC0
          34887602B9C58D0A95D9D701EA6BF4778BAFE1790CFBDE9AC7B746B9D385B4B6
          E393422B30C30A1C38D927407E750CC0966A3A71776DCAE306EEAE4A531980AE
          A09DB78D63E2BDDE56C6C244AA2807A987FBB407EC299671F728D746BC3E3039
          142D6834C0D81803DCD507403606205D2DC4EDEDDA9CC7F58301E68D3051D070
          81AAD83E2DB24DE4FBDEF3BADD0CDB66CFA979DCBD4717BF16205A9141031C1C
          EF5381CC2A4E629EC85ACD4E31C70FDFC900D7C615701396EA5280DA3940CEE7
          2678B29669E70BC84DB86C214F609401EED116F2AC85DAA50403C84387FA5480
          D7C470F340B4DED2167A6A730ED7AE66805607204AE2C812EDA05D32DB5E8F12
          BB27679C026956C000EC815100F151A8542EE519E0443F0032356015888651BE
          A5C50F7B725396150818C015764AB57B9296B20DB9848DA9839EEBA31C182D56
          70AF564076038001C4E1C3FD2920837CF74CEC72E089CD0EC058A8335C461E8F
          C67D639768168EAB147B63175DAF95D5A3D068711EF76A05A4E76A2267210690
          478EF409E03B80A65B0FC0960F8F6F4A7772402F5B5D11160D8D5190E6787C74
          EAEAF50846B58B4E6DA1BD6CA1EFEC412707A25AE8EC3B01F0784D2CFC582D64
          7BEA6F9B32B8C658C896C2CAADB214F5A811F53E624147908B2C6493786FD102
          74E580640B9D2B9772478FF69903C8D852A255B30B01E19907EDB8891518B216
          C2220BA976C0514DA1DAEF481D40ACB8A3B6026E146280EF3140C06B67FDFE14
          8A13CD4FB20273A5FCB1E37D0284A931914CAD0F47FF4D385D1472E34DA0C161
          3CF6190F9F5C1D9899387A7518FFD87674951CAB4E63234FB72A9D244EB2EDF7
          BF5961009BC46A6C1F68A142F2139F12A2AA4AE2D87EB6D0BD2B04B89F017851
          2F1201038C2A4C4E09FFC6EB511B18C22337123E7B490EA5BA322570578F76DA
          E97ABDBEA8F77B017475CBB5D0BF4E9CC30FF7FA48314CF8DA7E100F7B72C3D5
          52D4D48C78F9A50D13CF9E0FA0F38A13C3F71F7C0123231BA95666EB93A713AB
          A2046E1E58C02FAEF190CBA44CA2B6DF85B6AB4FB483443459A9F6159D912A56
          95EAE373F3556C1F6DE0F972DEBC7A57AD96493091CC499C39FDDF2B1EF8D90D
          BBB1BB158F71290060DB3689EDDBD5F0371FB9391CB8E841A4D323F68DB07D9F
          53656B5E262BB82CAD5F5289D862ADA72961FF2018572552C4D51B7631EF1633
          6F9481F17A06E9847D1D699387771A8D69BF3CFBFD338F7EFDE928B6DE1E5F76
          DB800D89C92BAE1B02B2E69FDED66432185F588385A9DEAB33DD3FA9799E3F5B
          2E74FD4AAF012E4D4FF37A203A5285A8D6295B2D9E3D7972776DB956967F88A6
          BDEF3EBAA07FA98C62DCB64DF4F6FCF901DAE77BE27FB770C4DB9EA0BE6F7BAF
          6CEF035CE8ED7FDB1DD7B83D49706B0000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C180000040E4944415478DA
          ED99CB4F13511487CFE5990844451428880A08E842D434D1049F1B893126AE5C
          697C2462D428A81B97222AF87EBF9FA00B1337C68DC6858989FF81D1C4C78614
          2A451EA53C4A693BC73BD396B6741E77A60791849B3677727B3A73BE7BCEEFCC
          BD330CA6796353EDC00CC0543BF04F00AA5E0C6D4B61F8809B172122F08FD230
          7C10EAF4C7E36D8CCE811DBCABEB3CBCE01D09C0B297830E40562C70611567F5
          41B56C24091DBF8FE697D000BC1844FD19158B861EB49A2D0730F44F2C85DA22
          00669CB49A5E511B42000F8ACFA83927F5A2D175AC8006A0B235026035AFCD6B
          40EE5DF5440015CF3D988C50AD444CEE5DF58534004B9F0D58D080968D787A75
          371002A85F985A03F1E37F8E1301943F7527A981581B8DC80503A163963A6ED3
          73C2460350F6C48DC64E5A4F2FC9EF0308FA01253E90960E909AA18C9301943E
          EE27D4406234A4D161C031FE0DF83900773E331B585A26F49E2CA2033097D7E6
          D20B7D43208D0C807DE772F0B886E1C7672760660EF49F2AA50158F2A88F5003
          2AEB1E1E0169C40D1B0FD995F1EE5F7DF0ED6307B84F57D3002C7ED827A001E3
          68686A607408D03B300E2037D7CF3EC8D8909BFE89B140D2008B1EF4262CE654
          9DE595441124A2A006A29321036C3A6C8FBB2E1F7EE52E84DD7A10C200221A90
          7CB218BD2108508296100D75A050BFF9883DE1DA4610420025F77B507F26C340
          1C20C87379C5F60AC8C9CF1239B5584368ABB6C1BE46C6244B000BEFF5086920
          524D6A0EACA273DE004208A0F8EE1F150DA85713F4BA39C06A7A8050DBFBC6C6
          5A2D010869205C4DD6D54D0E009FFA3D6F6DACCD3440D19D6E14AA26BE612585
          D61FA407E0A76F5D6983FD9652C876BB7BC25242BDB6473450BDA3126617644F
          BAF3C20085B75C621AF08D286514FDA371E531FC2FD03A47E4784BFD9A44E779
          19CD28845DAF190BAAF9260CA05A36273AC36F6418F0855695B1E3A01EB138FD
          70EDD4D6AF35E5BC3040C1CD2E210D1839A9B5D8536E805E0FD43644019CDF7B
          60D1A6BC343DE78501F26F74692EA749766532C068144076FECB8776F036DB69
          16730BAEFF16D280E5C5DED8084F210FD4EC5A01EEAE41F8FAD101989105BEA6
          E57400C93E3E898CABDA7000250A125FEEA4C81B9A5980A9993076BA8C0660FE
          3527B10662C779EF1F0BEF8925BE274E577665B2ADBFB19C0620EFAA5347035A
          4E9A4C2F0C867A96323E4E0630EF8A1301CCAFF14523A655100267965201740A
          6AC0381A6680824D4400B9973B516F1FA03DA3C9448CDF1FCE56D000CCBDD461
          4103DAD110B525039873B1038D9DA4D0C0049B7364000EDDC72A93F6AEEC7C25
          0DC0EC0B0E345DDB93D480D2A800729ADB1D8CB162AAA7CE462918FED101CD55
          342FF9725A1C5B410A3E4490DF549A75D24CE4629C47A88396AAF72400FF739B
          0198EA36ED01FE027B2FAC8B3A78960F0000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C1800000DC44944415478DA
          ED5A095095D7BD3FE77CFBF7DD9DED8A024A5C1250136A9B1ADF5431A9B19AC5
          BA5CAC69FAC4269169DA9AB4D376B24DAFA475D497C9348DBE34E052701FC9B4
          CDB449F3E6A521696C9CE489514434460DE202C87681CBF62DE7BCFFB9702DB8
          22F8E6B5F3DE99E172E17EDFF97EBFFFFFF7DF0E60F44FBEF0FF3680FF2730A4
          AB18C32C7E03BEF4F61F625D97409831520DD79461EC0C24134288942144D1FF
          009970384C10CA25D9D98D2C2F2F8FB2D813E06535605D1D33201D12010EBE90
          DF092061899F20E41510B2A721D48EFB7E8757C3A6858583371C8931437BF792
          B2BC3CE7A66EBADA2F011CE14CBB184B2BAE47AB6A7BD8FD9D264B6518D99A4A
          3E0F10B4E7E7A3D16FE19AEE7018888E9804C3E1709F3176EEFC30D3414D2191
          E0E9AAA2041445740451EE1645890AC8E96D895C7C7AF1E2C5E7B801B921AF20
          10B33C803F1865F3CACE3B3B8E750A8148ABCD1CCBC2822420CD2DB24022C149
          147DFC4000E5CD09E0DA9190E80712FB5EBCB5EC0511993FF3B8354394442689
          2216459169BA8E7455C1F5674F3DFDD09265BF8E83BFC20371F0D56DE6F42D67
          A5BFFCF5B34EDD8E80ED2D47747A11115411297ED1163581266578E434051D7C
          D58766E1141C1DB8E95017D77B6161212D2F67E2F1133B76B97521E4D8261525
          99AAAA82003C52540DABB284DA1ACFE42F589ABF23AE8EEB4AE8A7154EF9FBA7
          CC5CEB629365B5F64AD1139FB7B3B6867D5896DD4AE6A47B02776588824B3053
          D27D72B64CD7FC224B7821B49709657978C8FA8D132E3AC02456B17397A6D025
          8E635B8AA28A201DB0BCC0144D63AA2C938EE6BAFC87428F949697978BB367CF
          B607EE738940DCFA1B8EB12FBF7130F249736307157AA9103D54792EE3ECBB0F
          BCB7EFD54A7EDD1D5FDF9827E6E6EEF264A7122C49181C71FEFB81EEA93326FB
          5A86EA85B86C00BC68FFD78EDDBAE22C668C83D7244506CB4B22D5341D29B284
          BB9AEB56CCBF06F841046685CBC50F0A67DBF76EB9F8588B296D463DEDA6D96A
          C9E4F0DF5655BDB97C030AED95515688A2426C4F293CBCC77DD7A4A5C8E9B414
          2C4B6A5DC37D7F7E72FC7B9045841B659181B239F6D9F6DD9AE42CA1D4B65555
          1314B0BC009A87F75CF3A8F306E0AF4A60D27395ABE484945F13D6650A549495
          DAE30FEEDF38E7AD954507A4DA340F7967FEC4DEAF959CFD250D8E7E9E455B7A
          AD6E5169AAA87EF48B5766EC0492022ABB368181B2B13E2E05CBB3C594C5C08B
          DCF2922C71F04C5324DC13695C3177D1D2EB821F4420040F2F83874FFED1470B
          993FF83B2C3956604C509A9A8C5FDF38D7F53D04D64579E00184D9AA83E67F1C
          6C42F75B4DAD26B5E0D1E72EACDCF77CD6A669454CAA28C0D6756553C444CB2E
          DD0D9A5F8C20B7C564A370F02204AE8E3445C69D11B0FCA2476E087E10015E61
          79D19A15DA186C4CBBBB92242424C95E918ECE4C229353B5F553C7A0529D20A9
          AE073DF1519DF38363275B19EAB521C5692473B47E2A37555A909F818FC663E9
          6AB209836C12ABB7EDD6647B09A38EAD6A9AA02A2AE629535555A46B2A28B76E
          C5DC0543033F9840CC0D7D12C8FACE1B6B70C6D4E7048F682A01554C1E1F241E
          05824C46A4838A42EDE916006F6102B7CB2AA1FE5101E2D570C3DD5E67E10F27
          C8FB079218289BDEFD25BB20609730C6C1EB62CCF292C42060B96C48574BC38A
          794B96950C15FC9504FA7E66CB67CD52F7A7AE7C531CF7A5FB059F6A0BBAE848
          06988960E4D88E43189504810B021A22789524E2F847070403A1F3FF72AA26E7
          A9C72636F2E206AD068BCBA6A7F7B7A079900DA216583B261B59867CAF69201B
          05347F71489ABF11814B241E9CF6A0FE59DABC7F4309630BA4D47122D1554600
          35AFDD4474A8A401035188DDCF2B74A4C3B2F3925AC567E78D7B49F3787EC681
          E4CE9EEDAC2E6742E0C8D63D1C7CCCF2AA2E4091C2DCF250A490A1836C5A8707
          FE5A04387E8CC2AB3102DD4E99F9A3293D8913434CF54EC144C050294D3165EC
          3C2333CD452406794AC4D12E8673A247D00BDF48A6B74DC9215D3DD67AAF5B7B
          A6AA8AC9FFF9DED65D06074FFB64A3A97DB281F70C5225E969AB5F3177E1CDC9
          660804FA3F0B0391813D0E6F7581D4D4BC7F7FA877D4E4DDFAD80CA30BDAA489
          AD15E4F9AF7B7070EC78E85E090D06470916456B366C284E4B0A18FFCA1B2945
          E3B251413652AC48F1DEC6EC6CCC9FF350DEB6E182BF1181BF83AECEEEBB2E2B
          C4505DB1808A0BAC9CBCD7674603996F64FB5A93F2EFB49C8C09B713112AB306
          B280EF349090480E1D3E8C0E7DFA29F579BD846B9E671B4D37C0F232EE8AD40F
          39558E8CC0D556BC608DFA71E2F6F0B84747674E78591015AC4140EABA8E6548
          5710A08EE1F2E0139F9F20A74F9D468661806C78919249775B63FEFC616AFED6
          1088798611B6BA6F427A63F7EE951E9FAF0840334E0224822D9B32EE91949414
          545B5BC3EAEBEB91DFEBC51DAD170AE62F5C567C2BC08F8C408C449814A5A60A
          050505D6B692929549898945001E62869296E63624836CD233D2506252326B69
          69C2278E1C7C6CD123CBB7F2090F888F18FC8809EC85163A0F5A6800242D5F5E
          B0C5E791BE33E7BE3914EA02A9397512D940E5F6AC2928F3B64C6A182E222846
          3831E07A11AEE7F9F796CCD4C326101F2C564285BDFD6F5BA1ABB4171F3F5E45
          4542C8CC99B3507757278B46BBD1C449B7E340829FC9B2C282A346919E5E7B5D
          72B2FF59C6208E50888EF494635804E2AD420563E3DFDFB8ED258F42BF491185
          795911EB2E9C439DED1176E75DD398C7E3415075318C84185A3E285C0AF5F852
          84A8C9D68E4FF73FC73D8162C57CF8248644800346EF23F23EBC3C929B8B0B30
          B64E596CCEA693ECCD9ACA93DAF48B1F3A893E5D20928C0C55669148338A465A
          ACB4F4713CF328B1161948A8F019268A9390922E32E4AC4B4D763F3B52395D97
          40ECE804AE89376671CB3799ECABAFD5D077DE3ED2EE8BB639F638D4242E10AB
          51120CFC2280F5B954D250539DDF61CB34E04FD8162F5EAAA6423D800AEC4E70
          BC7EBF685AE6BA3141EFB37BA1550F858627A7219D0B9D61ECB6DF9F45332316
          4A9509922D137DF7DD631D63DA6A9B1D6CDA02945994AE77A3FCC433748C5724
          6D8DE7BEF740E8D1D7F93E3BB76F7FDC6DB837C9AA4A6372D234ECF5273241D2
          A8C7EB171C4AD7A6261BC39613BE2678B0346C9AF29B2FE8BA030DD6D2664BD6
          4C07F3861477344568FB8556CC4C8A1905EF338AA248B2A70688F82DCFA16796
          2E5DB83ECC9B39D88BE7FA3D4042770109254602E242233E7F021314DD717BC0
          13A6BD2E3D757872BAE6B950136577BC56E5FCB1FCB4735BDDE90B145B8E4508
          34A34080401E478C0AFCC40F010120E1D83D4CB05A9B6BE48E53F75497AEA88F
          F74D5C1E793027EF2ADDF184E1368A154E028A1D10215E4E423662242C90537A
          EACDCB691081F8F001CB78EE13EBC3B70F75E444CF9C376568F91D8B274D0B11
          B0A0A41386083F8D827B1C9BDABD50955B2EB68C8A1EBFBFBCF4C98A38F8F8BE
          F1AACBE5E4D25D9B20AA297C612E296F00E424EAFD7272D68E09BA6F4A4E8308
          C4CF769EF9C8FCC15F8E766D6839F98529212C9BF5F51D62474311B37AAA6010
          B89B0433BEAB8D0EAA085C411D84ED86BA6E57A4F6E103DB97BF1B9FAD2F7FD0
          251225DB1F37DC7D24FAE4C43D0124649093DB2FDA8E15F3444C4E18C566F09B
          90103F192EA45F79F5CC7B6D2DD66CA1ABDDB15B224262DBE907F7973DFED6B4
          9507A48AE22F5B9397EDFC311B9FF3B2E0124D2C19326B38FB76E5FAE90FA070
          B9880AAFDDDFC4E5B4A3B4F409C37017F3BA101BE481841BE4247239B97D30F4
          DBEBC68E199A9C0610E0B3166633D6EF735FEC081C126C2713230191C6BAFDD5
          5BEE9B8142DCAD65BC0B3573166DCEE89E90734CF2BB6022D7306A6F2FAF7C71
          F2BDF18381EB59ACBC3C0C9E28B4B797943C0E2436A9313969909D404EBE4444
          24CD71839C20ACD682276E28A72B083CFCD33FB83F43E98720543345DEDB7777
          7E7CF8A52F4D0770E41BAF7E2EBDF3D4C4DE65AF1C9C50D56D5441F84A986858
          E968F973C52F73E6F30E150DE190372EA7ED5C4EBADE27271ED85027BCBE7860
          FB44DBB4D68D4DF75F373B0D9650BF05B37EF8D77247F3E762C1714665240B0B
          B25D8B9EFE9AE7F70050E427736B3FEEFED59BD5DD4FB79D6F3045A2C94A5BFD
          2F0EAC9FFEF39B391F8DCB897B42D38C982762C78920274FBF9C5C909DA8D547
          E25A721A1CC4FD0138E5893F3E6579D25E6102358D60829C3E2ED03529286D0D
          18E2512804730F9EEDF966D591F30CF780DC3BBBCCE48EF3D3CA5F5B70F4F2EC
          33544F946CDD1A93134C733CB0F919119048C482A43B3C3BF198C8ECF7C4E572
          BA2C88FB64140A3DE9AA74CFDD871333EFC4323395248F18480F124393504747
          176A3CD360B36E0BDA1949529ABF78F9D30D737E72A363C51B91D8B269CB0AB7
          616CF2FAFC0234B43CCD321FA45822198EEEF22890AFD764A627BC70F901F295
          95B8DF8A773DBC26ABD33BF12D2138712C56048A24E23002F9DF7620BD81247B
          6D425A6ACA56B1F0B70B8A2BACFEBD86D590C5E5B479F3E67B0C4D7FC9E5F2CC
          080402B11115522C04B64E7DFE00698D447E9399E67F72007676F55EA89FC457
          E6FF24D8E6BEE3456A242C110C9F1F0932835A80584FF4B46AB7FF6A51CDA6A2
          C20F3EB04702FE92EFFBE70B4E067E9CE601128AA205A183A589C1D4A8698B51
          5583B42BC87B468FF6345DF34F4C8349AC665C5293EF5D9542BD63B34DAC181A
          EB69CCA82DAFFC53C59FBAFA89B291828F2F08520108DC544377FD79806725FE
          E7CDABA4C6FE80A7B70AFC60DB85497676364E4A4A8AE1CBCDCDFDBBE6F1E02C
          37C4890C8884CA48EC6DD651762BAD3ED2F57FE45F0DFE81D73F3D81FF06E6B9
          F78BF6BDFEC50000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C180000060E4944415478DA
          ED9A7B4C53571CC7BF2DB4BCCB734041E678F8186CD0306706CECEB0699621CA
          8CA8C064731197F98ABA07BA05E7638E4C17D46C8B5B16138D7FE87C6D2E3AA3
          280679F81C4AF08155A0BCA514682BB4054ABBDFBDD549A5DD2C6D1DB87D9B9B
          9E7BCEED39E7731EBFDFEFB4E560848BF36F77E07F004B0572B95CC0E3F1B239
          1C8EC86030B8D8D0461BD5715220101C7962000A85C297CBE55EA66484BD1AA2
          3A0F848585CD2318BDC301944AE57A6A68AD5E6F80E45623B49A9E2137200CF1
          4750B02F9BAEADAD3D1C1717379B92068702A8542A66BA675C2DBF83B56B76D9
          D4008FE78CDC0DEF40141FC5DE575555ED9C3871E24247031CA7B737CF955C47
          DEC6BD88C85A049E97C0EACA0DF4BAB16F37DCBA54C8DBFC3EC68E1FC5E65FBB
          762D3F3131F1A3270610FDE917E0FBF80DA98113674FC2EF5C093C7BB5D89CBF
          10E11142905130545454E48AC5E24DC31EE0785921B8BD3D08282B85B7B3015B
          B77FC0EE093DA9BCBC7C795252D2F7C31E80919346037F9A89004F3E0BE1E7E7
          059D4ED7D7D6D6F6AD50283CABD1684E070505750D5B0016A2BB9B66A2042181
          02E46FCB86A7A7DB5F6504534FD66F667878F8D5610BC088A750C0FF7C292222
          8558BF3E137CBE33DC3D5CD932AD56ABBC74E9D21BC9C9C997870D40C18522E8
          FAFB4DF25CE46DF0BD781E1CBDD1A789A7C46255CE6C90F3845AAD9697959589
          67CD9A75F389017853A0217AC67C59AFAE0FBD7D7D83F23BEA9BE1DAD10C99FC
          1E4E1F2AC0EB53E3B17C652AC881328EB4BEB8B838212323A3D9EE006401A1ED
          D1C230E093A3BCB898FBFCD0C2254927F0F38152341ED98FE9335FC1A2C5D38D
          801D1D9282828284ECECEC0EBB02D4DD6DC28D9A5B26CFC7087D90971A3F6480
          D3F540EB99136829F81DF3DF9B8AB4F4D7D832994C768596D3E4ACACAC6EBB01
          F4EBFBA1B8A76267E2819EF576C6BB22EB3DF5400046CDC78F40565C88EC0F93
          91929AC0E63535359556565626CD9933A7D72E00E624F40052A386D47F13001A
          15D4FFB20F1DE517F0714E1ABBB919D5D4D4FC261289526126081C5E002C841E
          D2BDBBA1BA59895C32B32FBD3C96CD3E76ECD827E9E9E9DFD80C20EB6CC74DE9
          6D40FF7030C6070BB0EEAD9821013492EF3D5A6D3AB47AB25CB5BB7E84B6A90E
          DFFDB09442723F268A2DA128762E159B5826AB01BAD4DDB4911B4DF64054803B
          568A9F1DDA1490D43AF2C4A6AE029D2D327CB56413D6E4A623E1D51834343454
          C4C4C42CA2A28B360198932D4BC89214323972166C7C1460291595FCB701D45A
          0D1A5B5BD8C3CA0345FABB62D9A4D0910170B75D86EBE4C8F403F64074B037BE
          4C8933A983B12E1D5A6303D1FE8017DFB8EFAFC8803E0BC7FAF1D4848F8B8301
          CCC9DC123A5547DE55636C600A9D24433C8D1DFFF50EC547660098E71285C073
          DEC304C056390C80319F2A7597C907C3044EC878C1DDA40EC634769B75FEE645
          4128682BB1EF0E0578DC606EBF0468D75837EA62B20331010E06D093AB57A894
          269BD85C30D745A3AFB06206B87405D1243A711D0C604E236A0F3C2E406103D0
          62218A1FE70B4C0832A64B9B00E93D6347268500A3050E00104E9B0E670F0F8B
          00A3C78563FE64A149DEF576406E610F8CF67A682E6F93BF68BE0FFA22AD7F3F
          573B00D099F4009D4D674BAA1A91B3EA27F43F72281FD4A1E831F86CCB52D853
          B6022C2780ED4CBAB7873994EB2C36B475F3417491BD5CF1F50A937CA98A224A
          EDE37798E948A48FD163DB0C40B69E4747B953028140FC4F0D334B4CA1500F02
          385A436707B51543CE319AD1281F3B00304A4B4B73A203C492D0D0D0092E2E2E
          CE03CBE8DE552C16BFFD7700B6CA668001A2500C3E039FCDCCCCF4DDB163C7C5
          9102304864A5187FD9F6D400B4B67462FEB2797605502A94D8B66EA76300985F
          30F97CBE92496FDD7210674E59F585B255DA90B700A2F84848A5D23F62636357
          D805801D21A5B2864C6DB8BA5BCBFE10E808B9B9BB60CCD851E07239282A2A3A
          949292924FD965F60298A1D7EB0F3B911CD2FB01A225DB9A9494F4B9442229A5
          DB2ABB0030DAB367CFB4C0C0C0C5010101C18EE83845007DD5D5D5D2D5AB5717
          D6D5D5B5505601936D3780FB62A29A30BADC6CADC88298B89D2226D4D235E830
          FAF4FE5762A4E84FE6582C6DE37A76580000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C18000008EA4944415478DA
          D59A795094E71DC77FCFBE7B02CA2D72B872DF20A246888235D544B1B6A064A2
          830535255668D2233D9CC91F81999A493BED4C53456B2DB1A06850AACE984CCC
          D84C3A631C89A95750902B5C424070394464CFA7BF77977DF7DD837757641BF2
          CC3CF3DCCFFBFDECF33CBFE79825F01D77E4DB16302701EAEAEA1613427E4229
          4D9BCABA89BE323F3FBF6BCE03D4D6D6EE46E187104066533489F925DBB66D3B
          3667016A6A6A7250F8058C8AA6A96240889C8282824FE624407575F51D0C92D8
          380A6DC0E0DDA9A27D089662CE2F2A2A4A9D7300959595912291A87D2A39CE30
          4C546161E1033671F4E8D120B158DC8651AFA9F2885DBB7675FEDF0168DDDEB5
          00CC0AFC198DED06F41E3E77D5814BD8F8845EE2DBAFF7CA98AA7AA3B8B87819
          BF2D425CC7209D8D2F64C6EB3D18ED301B4F920DDE0E6226464C6A0805D07F49
          F20F7F36AB00F4C86B12F017D7E0075EE6E7F7693DE1C248A4834EE91311238E
          408801F308E875DA4E2022B96DDDCD3E5F4388E4B16DF66918D2EE207BFEAE9D
          1D8033A56558F36DDBFC5E8D079C572D9EA691A18902F93DCE7DE431BC85E213
          1C55CBF5EB8250E9845DFE705C0E8CC4E6E06F6612C97A6AF26D060A65513252
          E33AC0E9D23EAC196C9B7F5FAD80BAC15057BA98D6E507F64298EC895DBE4EEE
          0DDD2FEE3789B78140000306E9913272DB35800F4A0CD8DA5277691E805F38F4
          F40F41EDC79F3F13C02B1B57C3A2850100AA4EDCEECEF14A08B4E71EE484DB41
          00FC3C524AFE6A14D5A1A64B31388089E770794A28E586CBE8A3CF955AFA0DC4
          399F55628C0E8F8CC091CAAA6702D8F36A11F8FAF89812972B00063BB8B2B6BC
          0A0B000F82757A029BA324E443D241A99C68A0130B83A686C74A3CEB63CEF200
          16A1397FAE884B5EBCF429FCF7C6AD19895F9E9E061BD67FDF92710D7F8C9E06
          2ED9BAC506C0E40DB84B1E524AE10D5C5E94B0BFBE88C00D4E30E586884BC75A
          012403ACDC6925E4A14A05A3A3634F25DEDB7B3EF8FBF959677EF14F04B8C325
          5B1000DD28FAFD120A5FA1780D638016A527E935D721BD94066835D08D680A47
          BF3E9B17F72F1E8032C90E60D61C0BD07D974BDEDB5241450C64C449C9B5E99A
          98D7C06E0C0EA15699EDAFCF86DF1640F3968ABBF10A922CD484B32CED947A13
          2DA4513D48F40C44A3F837D147B300F1753600196E02A8B70668CAAFE8489041
          1431EED04E006CDDBD311A0052B88DA3119270C606205318408F9FBBAF21A0A3
          4F79D46AC243EA03CB95A13BFB7578A8A17FB93566F8482CD2B59547283A5D06
          30F637490F224069E2E9124BE6E264A700C706C5D03E2982D975D490E9CB1C89
          F11255E19AF8C255806A5CC43FB60208770EF056970428CCBE4BF766206DBE88
          5DA25B63E4E4BC2040B39AA6E90C701585C8936AF90038859EDF25F8A17D9D62
          37C837012CF36158D1E7F12C94670580170DD2AE863C3D1A1D4C26E03CCE674D
          2B3B9F933FB00158B553F043BFF95AE2160056FC0A5F23C07B08F00B2B80B649
          FA3B5C73EF9ACD273B4E46CF029CB201582D0CF066BB9B46C047A45FE927F958
          26852225212A6B0035BD805A7FE010E0240F20C239C02FDB18B700A0AEF2F792
          1465FC3C0EA07592E662709A3DCC1978C70923400D0F2032110184D7C01B2DEE
          014051E50752A601605DD3631AC28861ADC1809B1881A53305F859B3C584F675
          8F4347EB281A41C775C5620249E90130CF5B0A63236A68BCF910743A930DF3F0
          9240EAF200104BCCFDD1F28A14CFE901CCAE799226E0F71A398013360059C200
          254D16800F6BDB40AB3108D60F517AC1CA352150FF9F3EF8A667DCAA2C75C502
          888A371DB73303C4E82580FBF2633C807EA293C24F1D033CA6A10606EEB3BF83
          D10A1DE703E0CD307BB7A0A03D8D966EEBFF7D1F1E7C3321583F616900C424FB
          416B830A9A6E0D71F9223CE367AE0F05FF200F63FA7914BF3A50C21DAD11E2AC
          1D40E3380DC613E001ACB1D53C0249D57B2D15A2129D02145B4EC43875280C0F
          4D825EEF786B93CA18F0F6B33CE28DAAD4A051EB8D71AFF91250785A4CF22A14
          9FB540CABF1BA848B79AA660F54AEC3F1D7318DB4B0D1B4FACB20158233C8576
          37B8E7CD386B8104B2A70044A64F5C279D1A7A1335A6994D275FB8D912251EE3
          01443B07D879DB129F78A485819E315347E87C0215E03B3525540313303AF864
          DA7E649E620809F7E6566A769014D6A0675718CEAE1E14F843D2A5A6C306023E
          FC7BB011840790F03E1F00D7C0F784A75021EF8679F95C0B4268B834FBCA929D
          170314C3CB675BD81380605FA95961101C615AC4A10AD189E2688F2ACAC08841
          020DB184A849A79AFE19097FE5E83E6C4EC757F200629C0314DCB088BA72B6D9
          0E60F5D63863C79F63993380E4AC45101C6902C0BAE5A732BDCBF8E5843D0375
          AAE14768F7976357C633C0D4082811601BFB9C12F70F1B80B5C200DBAF5BCCE6
          93476AE86F1FC145AC378AF70F9D073E41A627D291817178D8FB685A082F5F05
          2C8CF0E5A610D62AAFB505101282FBC1096C541077940F100FF0C2AB8200AF7C
          296CF767EA588033AB9E02A065929EC446DB639F1220FF9A9E8B1BF406783434
          610C1D39894C0C5EFE1E2E0184294455FBD2E7950613C23DA6DA01E0A9340783
          1414BE04BD710AC51CE101C4B200C253684BBD456CC3C56618EE137E72095F16
          0ACA25214E015E0A95C18630F9005AA1754A19B96307D0A1A67FC09CDFDABDCC
          FD8D0710E71C20F7AA6504AE1EBF0E3AB54EB0BE7FB81F24AE8B710AB061911C
          3686C9594DC723A4A4D00E004DAA0A17B32FFF4985F5518779000101002FFF1A
          5B4E7FE7DD7CC52258D5A582FEC67EE38EECC83152312C5EAE04052E58672E47
          29874D8B14AC91A941801D7600B8A9DD22A6A963F52E1479B804AC8E93B1B178
          2FC091103986D8D4B7D2A99899B84D0890A354F422C1BA0839B96707C03E33A2
          A57B1F55A76289C80C1176B20C24C3FD2E7F6863EA3B6E0108F5642ADFCEF07E
          1D6F63DCF6EDDAF3FA9F5ECB45237ECE95BAAC7B3175BF5B00D8FBC0A5F58165
          FC1C974F5D08B11747E68F08E2E5ACEEBA14F7017CFAD20C018CCD0F9678C1A4
          3615E7A0A0E17E21F59D4BEED10FE59F6D7C0600575DD64783ADB896A2675F3F
          ECB89C1358E376808C8B03D18C9E6CC7CE3D674F3CF9EA4A4EC029B079E8FDCE
          FF5BE57F8FB88740F44058720000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C180000069B4944415478DA
          ED9A696C545514C7FFF7BDE97496B603DD6869B185A688A1145120CA125AB614
          2845E342401448404013097E408C4404138C1108F503B4140D82B8A02610A0AC
          2D1D048506C252156965A9B44D6B5BE836FBBCB99E9981D2D299321B33987892
          99FBDEDC7BCF39BF73CF7DF7DE9761F88F0B0BB503FF03045A614E4E4EB8D96C
          9EC9397F996E87D1278931A6E934C85876494949D96309909595354310847CBA
          4CEBA599B6B4B434EBB103C8CECE5E45D1FDC493B6343A55D476AF24499BB45A
          6D7DC801264E9CB89C8ACD3E74EDA0CF421A911F43063061C284A7296DCE5044
          C37DE94FA321D167465959D991900050EA1C22E773FCD14100B7DADADAD2CE9F
          3F6F092A00453F4314C5CB81080441CC3E71E2C49EA00250F45753F43FF6D7F9
          BB003B086061B0018E11C0E44000909CA3C93C2AA800F4F4B941456A8000AA09
          C06B5DFE02B453111108EF2985F49442EAA002500A592985444FDBC74408C848
          12F04C8A80675365A8AC97F0F971335AF4DC514F23E0B53F7E030C8C13C52943
          6528D29A1FEA70A2A6A739BBF3F9C74C3859290517807F93FEE2823D093F6467
          A8C4F963E5F8EAB419477F9790992C60448AE828133482C7FA1614B6483B6637
          BCC4E654EE0B0EC0B7E975E5B79489F18903901AEBB9A3EEA4BCA21AA30718EA
          D89CAAA46001DCA4EE29E8F3A4DFCE3BA4E5AA7D26DF6473AB060607E0BBF4C9
          E0D802CDE03430A173080AF7FCE9D0BAE495212EFBB9ACB74936B456FD4515CB
          D8DCCAD2A000748214CFBC425A3ABD29B03B48B2F455D700AEEBF91F6CDA81A1
          BED80F0440016959E2A79A2D6CDAFEB7430370382F9B72D7AB61EFA98467B1E9
          07B4210170D82FCE3D065FF7441C47D8F4FD3E6FC703037068562ACDC472BA8C
          F3AE236F868D8F66B907AF8714C00991FB3CA9DBE7054423453F8FA27FC61FBB
          017D2BE1180943FD0D28E37B6F68FC07088B4965B9C5D5FEDA0C0880ACB0668C
          4DD7BE1556CBD0D3AA79D6E7D435E150F70714318070F7A86C3391E3CD80AE0E
          6774C9A6B1BAAF6590CB7E1322A396591725FF1A1200D9B6DAF136C63732B051
          BC8376D6261346CA2AA4B311F37ADDA18ED1EDB29EB564CA10AE008B88A0A980
          7281E15DEBE2A4D3C101D8F8B7528C14B752D2BC617FD566FF895BAD406B8BA3
          7A8D622B3E5414B8ECBACEB8146B8DCB9C371A0D982CCC794D07027267871466
          7E0B0B071A1F1DC0F6EAFE0217F7DAA3FE6015D7EB0083C1719D13760ACBC377
          2353AC74DC5F960623DFF41A0E5BC6391BAB54604A5567DF0FA28A912236E3B2
          35F91AB86166FE9CC557020F50581B2B0AB00FF360B76D0880E93B6073A35A60
          3670251DE2BA386F975B892B9128B639AE8D36196FB2AA560F98B57B7DE00038
          67C2F6BAA3D4E1E10B962421D9741D72B31E2D36E729B18FA08359AE424DF820
          40EC394506898D58A8FE05CB22CBD08719EEFDBC96B6181F05044028AA994F69
          B3C363601FE405E5057C1F530491C6AF4BE43EA58DDE2AFF00F670516CADADA2
          E65EEDD5BD91698A0AFC145B00392417B57C25417CE6338058543B858AA38FCA
          F9D7D567F045DF9D10BA45BE9B98C02D1A36FDB0C937806D35F9F4B87CC77EAD
          A4F44D54304486DDAF6F357334906A83E48936A78E7EB4BE69E40C19C20D6C51
          6E869AF5F6E4E42D50B4C7B16CADD52D003F949747DF8534599574AB35A907ED
          D43DB5DAC0601BA16DC48A2425621294E4B8CCAD11188CED28BD1D899F9B384A
          1B38AEEB9CAF4BD2221826C5338C8B6318AA6148B9FB0012F537117175239864
          80A5EF0808C6068886BA6E5AAD103953262C9265157CE9CA6A1780993554F438
          505B23D2D131E43DCF42DB45249B0D17B5258EF569E4C4A92EDBA8AA7741DEA8
          85257A1474031711889E80361044ADD327DA86E8D396C21C95618B8E4F70B9BA
          7705E0AE1A989583509FF826AC668BC3A97B6293ACF44C6710692595C9E550A8
          D4902B14F7EBA9ED05370066A31106C7A2D78C70FD35B42986808972E7A8D8F4
          88E9380519A5942E7612A07E02B2B0301AFEFE2ED3DD2DC039FD64B44A315E45
          5D260F87263A16B1FD13A18AD47403686FB983E6FA3AB43537C162367BA5D7BE
          59EAB77E03252978E6A54BDDDEE1B80528699FED9D9107A46F5C3FDC696C7018
          EF1B9FE0BCF6557C01B85ED000FD4D93A726BAC9A1C6469CBC7DBBDB6FD9D1D1
          981AE7DD81AD07C743006E5191ECAEB31DC60EE589582962C79B9A70A1CDB9B7
          1911158529B1B110997FC78FDE010EE64EA359B9AD178853B42F19FF302315C3
          87DB3760EFBBA95E37ECD2A5357E513C208FE4AF06159999F67C5C418B9F7DCB
          CDC94839676C53E6C58BC581B6F5FF7F25422DFF029D8A8A4F39284BAF000000
          0049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C180000082C4944415478DA
          ED997B5054D71DC7CFB9F72E88052342A3E0126A07471661B175A209121E0D4E
          9AC44704D6680C28E92BADA069FF48669A7684B6D34EE2744C8AA475C6264884
          363C94878DA6A3E3A205F2720CEC2A8F240E06108C4DA5BAB4C0DE7B4FBFFBF4
          AEEC1B0D3ACD9959F69E7B7FE7777E9FDFEF777EE7DC8592BBBCD19936E02B80
          9936E02B804084D9DB09A164342C9730F2187AFBE91663EB5D01C0AA5322F1F5
          22A4B76248B4ED26EBA75B0C8BDCC9575F1C8D14797EB92FBD82245CE8BB6F56
          FF37874CDFF1C70E8E63970A62E79C0F1CA036691E11852B161D8ADB95F4A9AE
          2277F26F0E5CCF62949EF4A997B13299D2469E90B37ED941D824255C7EA1FA6B
          2D01015807D7A46012BACC79436645F46943E57401F0354A29DDE3AF1D18355E
          A88E080B1CA05ABB07D2CF396F50BA886EEEEC0F1880912F08656FE3AA653274
          FC58C844D8EBB8CEF71F80904275B8D3EE0000929F20943B6C779DC7FC770780
          D05FC0544770D5B27CF4E8A9A5865F3F4C64A2C5BDB6AA8CB61C4460D7ED0770
          5D071EF3DF0A3074ED212673BF83643365525381FA9E5EB67F4904090BD98C19
          7762DA24BB23CA2AB3DAFECA33AEFBB60358E7ABD1BE8C493F2011217FA3EBCE
          FCC7AF316FAE9843B8FFFEC65EC1E6D8EF9A11963F1195544A379EFFD78101D3
          394A49D26D07F0A72DDCF0AE5A945902475802567AEFA5C6F47F901AED3B9869
          B55DE43822F353BAA9CBE8187360E07A692069343D805D8C8BFDA84DCB18CD44
          9EA78E8C4EFC90B4668B0BD6B775E269022574B6D3FB848C23D7370CEB9EED25
          3C7B0B86EFA29B0D47F70DB1D9B3E4B13C4C1E5B1817FE52F5D0B56891292A9C
          8FB6551D71DC33000C5C70B6C3A23C67B839ED4730AC0F462DF6A44C26B4E872
          D3839531EBDB995B01464C8CA32B461A1FECAEFC6C6C05C7C9CF30423741FF3D
          28A3D8EFF8045992CE63F015A4D165EB3723FFB4F5A9B5CFA12F8AE6B6A24591
          A337AB770150AF6D4F10397614062720D7F51393FCFAD010E92A4A26473C3546
          3E1DFEF74462CCDC50B3C2F357A1F83863E4C89A35F34E673C1A87F4917F0C3D
          53BCCCC94C2B73B4CBA7DB19B9CE287B4D90A497B6C4CFBDEA1660FEFA8E2CE4
          AEADFC0140A65C99B3EF4D3793EF87AA6A80B760673D12B52CA2FD851FC46740
          792160F2713FCCE3609ECD2712BDEC13E0461BC51A88F40B007F1BE1B5577C69
          E4382E6EE8F003838E7E003BB114A60E0F1D1F1A130300F0BC88838A0023D270
          E86028A9DB28050A80C1233816C4540D9A986FD9200086BF95F670CCD98E4148
          C578F1E2C048F3AAFB94F7FC8E00619DA828CB6E2D00934F206D1A28E57F71A9
          71655FCCBAF60A48FDC43300691F694E5B150C0006FFBD302EE2915B0660D984
          A828CF1A28F8BE89988554BAA5EB1D97A8B837A276B879D5934146A00A11D87A
          CB00AC4A0FA66CC3DDFDB83C8D035B36D1D5F231930B7110A3DFF560C69EE1A6
          553F0B3202BB1181E70F0C5E4384391DFA0FA1F6F3D304D0E662C76CB0AC012B
          C097D8F67DC854B3A3C7A219C7A2109D2858870F7F2FAC8A82A1D1966F884561
          E13FEE19A02619C75CAED301B07C1F534D464B373C2C93CF0C3AE12FDA06B110
          F93F5F92F9C3E737D24FBE4C50659B0AD0BC7C36B96E36E1AAD502905A37B154
          E678A342446FC813B2931BCC83D8A0165A8E031C63E95DBA90F70299F80FA77A
          9EC0B8ED96EBE24CCDEA727D8F0EDBFDD7A1EE507176F248D0005688EA14CBA6
          F4B10520E59088DC24B54A801015FFF8E4A46842B5B28E97295B7B2E5775C4DF
          49014DF79EEAEDC2E0641B40222D6FED2E854376E1E1952B6C24B62C3BDBAFCD
          CD3D408DF6208C165185B6A534984B097139EAEA992CEDA41CDFE99497C99346
          9D50EB6B32472BD777AF037B93A3EF0260F50879B4383BF158F0006FC4CFB23E
          2CBA389E522FD6424AA70480C7CB39461B9CF2843C63CC13DEF01BA0B5FB348C
          4DB74583F496642526BA003076B0384B53103480B225378846082D55187B029F
          63C8D7DD0AB162AC8B0A7F26DC7BB2271D55EEB4A32F53B2614746626385BE7B
          2D4A6FB3FDF61891C505580BA66901D82A10729DD0102700233F07C5651CB0FF
          7C2364E47943BEB09BF8D1F6EA7B5A30EB1ABB33DE2DCE5892867462B5B58CFF
          FCDEDE0B78663F96B0A7B1B8ABA70530B5023159E6846F10D11C8713689B02AA
          D4982F94F99AAC42DFAB6144363ADE2FE0FD7478DFA9C7258D083B0A80C7A605
          E0A6021D47AAAC4E3DCCE6CAB2E47CA9C0A6F3B2314FF582AFC96060150C2CB0
          7BFF504966629EF2F9AB27FBD41C27F543C6B21BE3256C52FD5C8ED6EBBB8277
          809B2A1084B776E50955D667F5E6117872BE1D61AF214F55E2D5FBAD1FC7C94C
          FA14855765318E32AADD9EB564CACF292E2926B31D25D99AF2E0011415085E1E
          93256101765D93FD991ECF32ED00AF03E07BDEBDDFF32A26DB61D7F55A49A666
          BB5B50C562C67EF15E4996E681E944E09CE347284C7A0069B2ED069CF98F88C0
          B37680B700B0C9939EDFB71BE78598858B982C1CA963A2B2B8D8D36E7BF36266
          545E529291D41730C0940A24B31C834E7542119D9D18FD8A0D8EB4601F58E749
          5785BEE77EBC90E7D9BC4ACFA0EED7798D96BE7703A5F24A7B149A4AB2923A02
          06505620787F482309F1751BA9F3B5515B6F7E04A13E66073801801C3203CD23
          80B202C10BBF35E6AB5E543ED7D4B378814AFDC446D0817D20EDCE02505420C6
          788D319FF6B808201700790D32E1E875A1BCA6DE5900F60A844DEA7D6C522BDD
          C924D78B675016BF0D9A4FB08817931968DE22E0A8401ECF397827B0FC98F514
          52EC12526CE11D0500E33EB7FC7E69A6426C4F2EFDC2BD8CF84BC8FC0A00A300
          882433D0BCAF01EC96589CB95E64F2A1A20E55CA8C3D2284CC40FBFFFA47F79D
          D8EE7A80FF0112FDEA5E367DA3C00000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C1800000065744558744669
          6C6500443A5C35312E2049636F6E73385F33645F466C75656E63795C7363656E
          65735C466C75656E63795F427573696E6573735C305F466C75656E63795F4275
          73696E6573735F4D656574696E675F526F6F6D5F626C656E645F342E352E626C
          656E64AF0A368C00000018744558744461746500323032362F30322F31302031
          383A33313A3336BD4900C9000000107445587454696D650030303A30303A3030
          3A3035EBAEE2DB00000009744558744672616D6500303035C63CD13B00000011
          7445587443616D6572610043616D6572612E30303112DE597F0000000B744558
          745363656E65005363656E65E5215D96000000137445587452656E6465725469
          6D650030303A34312E3837BBB6804F0000001B744558746379636C65732E5669
          65774C617965722E73616D706C657300363444B687A500000024744558746379
          636C65732E566965774C617965722E746F74616C5F74696D650030303A31312E
          30388E3D062A00000025744558746379636C65732E566965774C617965722E72
          656E6465725F74696D650030303A31302E353255C4D4700000002E7445587463
          79636C65732E566965774C617965722E73796E6368726F6E697A6174696F6E5F
          74696D650030303A30302E3535AFB4B01E000010904944415478DAD559097455
          D5B9DEFB4CF7DC39370949481812086132CC8A0521625104798875250E68DFD3
          B7ACF894B64F8A58ED33A45D6AAD6F69FB58FA2AAFFA4444315916A53820A121
          2D862220892486A1481832E7E60EE79E79D8EF3F7780248400767AEEB56EEECD
          19FEF37FFFF7EFFFFFF63E187DC307FE473BF0FF1A0021246E1F634CBE5100C0
          716ADDBA75A8A2A2C24A1EC0E5F0AC0A8CADBF1B807270C2FEBEE287DA518788
          13524E7D52776FE6700AE3E26BC774030B96CDC895B2515E9EF4A302C17D17DE
          7B0180CA4A429795220BA51E040F2DAD42545519362FFDB072CA8EFA9B1F1F5F
          D0A531EBCE84F5C9AA46501A6B1C294CC315F7DF3A69E7E582B0FD28053FCE5F
          0B7E545EE8473F0029E330B8AD5FA9F92E4BB11615FA5BE09891726E28C66CB6
          FEE3B58679F92333AA5B458A3B743A4C2292892C93C1451ECD989D2D2EFED73B
          E754975656D2556565170DC8393F00C4071394D134D1D89B7DBDA77041816233
          5251713E2BF0C09B361C53577420EB275F216A944A10C9B6C8F1C9083DF5C044
          FE7743452F65F881F5873F1899EB5F128C086A9768B282686049D47407C15CA1
          4BD8B5FE89850B536936949DD7BE106E6C35F133272532515109E5D38CB3458C
          F18B471766FDC66623954E7100A580D4A6E6F13A61C5D8D19E371B148B1C1235
          1CB520EF38079E6198A844166FBE7F76DA8ED4B503621637587CCBE68067E2C8
          FACC4CCF289A2296AC98942819489654C2AA32E6858E76BEF7F8D48F3F7EB6BB
          AF1303595CB9273A6F7226FFFB569D66F6B60B242C99D850696B3CA1A9B9A873
          E5EA3B0B5F49F981CF1B2AA7EEDAFDF8FEDC746646A7AEE8DD1666048B2059B7
          0C2FED66C78BCAAEFF59E8B948F41236A69694A79963AE3944797DF9160C649A
          94A1EA489535C28851EC164FB5F98D96A9B5B51B7A860270DB5E6D6BBE9B5D2E
          84425A07B01889994889EA2615D29809B472F4FA40D7B4FBEE5BA0D836307046
          C114B7463D595FE02A1C767858AECB4D318888E0A5641264E81671E814A65BC5
          767F43C794DA0DB37A060561570BA07E76E96B5BC36CCEF29861A8181196683A
          32C498E1567AB85C47F7477BAA9F5B62070BEA4AFFF994B439ACBCD1E39F36BC
          31C3C58E76290A5120FAB12804212813B607820074BAB131B3E6E56F37D9BEE3
          D48D93EEDD392A5698DB8447A47B108B884951D802062C00404B04BB4E06DB0A
          CE1C29FEA4AAAC77D0E82527F9E2656B669D09BB6B3AD5748F62821D4D410E3D
          8AF33C21293F1B2DDCBEFDA5BD83178484CD6BFFFDB4F3CC54E64BECE4F36941
          22564CC7665841A45B20546F18FB89AA0C7390E9B51B971D4900E833AE5A59B3
          27E8CA9CABD3A686290C3030B10CCBA024864B8FF47E70F4EDF94B538C5DA416
          C523BB70CE9DB34E8B694F85256E0A18C0015E691C35DCFC5975F5C63F0D1AFD
          012C16BCD0BA4570B9EF20DD9D2A159458048E934844E74C93CBF392439FDDF6
          CED5B8ACCA9E8718F79DF9F3EF79E3C6F6B0737B507773808058101496E2B01B
          A9A29F55BEDDBC6DF9BED443D045C77976CA57ADF229AA8A9FDBB021D2A7EA5D
          BC07246D5FF5D0C12941CDDA2DCB38A08783044902E20C1967B9153222CDB86D
          D73B0FBD5F5A0AA5B8AACCECC340223237DCBA615E9B94FE4488788B8985491A
          ADD66738B49FEEDD7EFBFE21A397721F9C2843554CD59710A1AAAA44B52A2DA5
          4B2795D295A8D4C01597EAEC8967CCBD69CBD41EE27A2A6CB2B388A130013AD4
          3CC21BFBF9AE6DDFAFBEA08CF649E473E9B1E6FEDF785DBC8F54BC5C161B18D9
          8B0C5C59594995F56950A4BBD91BFF913931065CC7EF4D34B1526B485BF17919
          37499E5FBDC3DD1592A95FBC7A6B2CD183FAFB718194F8DE2B07D8A36D02A9AD
          5860D8FF979413667CEE41BCE1C159FA90714BA6E1BBBB8E4E8DEAEC775B42DA
          DCD3DD4AAE098560A49F691F9BC1D465BAC8A6650B277D3EB09B0E364A6A0863
          7FD72EC04682444207161EA406FAD11F409FF24876D443EA0F2378599E34F0DC
          A00372F2957F9EFE3462D81FF5683CDDD42E92AF7A542CA9164A73506462168F
          473A652BD765FEEABEDB8A1FB3E509BAD89CE8EB47DD69272A60299493232565
          4E3F3570A19468946F6831C99ABD1A1A0F0D98CC62D0E159183DB762A66BEF60
          914B1D7BEA8DC617C7E5E7FE301409992D219D74C42C1C922D2C6B2652358BE8
          8A413842D075E302CC184FF8E595775CFDF060E5F49C946888CD38A9A21FEF8D
          58D365C5A2A730D6F1AB9DC62FEFBF3EEBC3BE00FB498947AA43CB8BF2DC5B9B
          11833E8D68C4EEC4018EC7E31555CB8F466F7A7649566DAA5B26684D5482BB9F
          FEC3DCBC9C8C3D23326853D4116E8B5A54AF6C2141B190665848D74DA4415350
          15DD7213D5FA5601CFA471D20D6B1F5C58D357D8A56CDFF2BB9E6BAE1BE9DD15
          A238CFAEB618098B26E60D9A1413034F373BEE59BB62E2E63E52E27CF4176D0D
          EF1E93ED2C892AA216B4A504746251330D9EF272D982F2DBF7EF4CBBBD1F80A4
          917F7AAAEED59CECC0FD7E5E33041D33926EDB4448D62CA4C43F06B2359105B2
          C20590F2BC34E3C7D1375FFED9F27B5341E86B6FCE0E7963A1DFF15D3A1A547B
          248B8D882692A2BA010E712375F140D593C5D724530F9FEBC4A31EFA22E09992
          D69C37DC9DCDD22681BE87059D40F42C8BD128CA6C8F9E506A8E4EFEF3C74BD4
          44254854896B4B2B9D4C5EE6A1F44CEF78AFD36EDC702DA2100D0C6B066829D5
          4420EA9004A82C55431E0A58402A4529BD27E89EE6E9DBB63D2F0CAC2C056FF7
          D4E7F81C53039A68C9B2450931108421857061097391489444C4C99F6D5E72D6
          F6FD9C16CA5BF3F938679EFF8B61D96E9EB3B5109C130180A69A84D131D63BE4
          6EE1AB9E29DD1B6777C41F580EE907B93AFDEE37475B4E7F933BCDEB763A6882
          6806535402800E0054CD066040FA18C85455E4B614C21A22B6842ECD630AC5BB
          3EAA3866170054591A5F44057E7EC2EFCC75376579B83CBFA61055062D241848
          E995091D8A61A71433584DBF7AFFC645F576E3C3A9EE377A6DFD7426DBFF595A
          06C7702C2612AC852470C000009486B0D6A545D513E2F4AEB7A67C15076D0F00
          5E74D37F4EA002239A58AF9F6238869898C5348D1103571890FF1AA4906E2B52
          C54E211B8048582D8A692588DC383CEDD39A171BE2F6D6AD233680CC175A8633
          19EE2F32789CE9D355A2010011C49C1692410B45915B5331AFCAF3F66D5AB2C7
          4EBFF3001E6BB8961EE6ADF3A5B3986529220303B29E00803582D56E10C527BB
          6704DF9E7BC466E0B9E61ECF6313328D5B7EFCFE94D676BD8E76FB288A61880E
          B1A7699B01006082F3C040FC0320000D721389708680593D844617FAE76F79F1
          A1FDFFB5EF38F7836B8B043BAF03BF6C1DC5A5F1F501D60C780D9DE8322C8812
          0010DD1B216EC3C49C26DD7860D3E2EA7E00C6ACADBF0E65F8FEE849A309CBD2
          088A08566C001ACC649560A94B55CD339199A12DB39B0A3FECF14D1AC1EDA088
          51802C629AA29293AAC856DFD24E129399C4FF240E803C4454E220A25C7C2766
          190A32E5E4BE9DA145BD1545D1AC173AC6583EEA5080B37C3EC3880390A35A1C
          0015162C0FAC319CBAB2E8B337167D920060E71F5481FCB50DF371C05BEBF653
          3600ACC0336C00A60A1EAA168EB52ABAA3233CB3AB6ACEE1F16F9DCA1D362EBD
          91669980A5C3AA1D44D3398793DF71CFCF77A6F8B421E72E489C87394868C857
          39AC859AB61DB94A7EE9BAB6BCE7CE8C93D21C9FA77396C767E9C48803D0911E
          92100E0996D7B228DE9417EFDF78F3C7FD0014AEF9BCC4CC48DBEDF662C20000
          68A0087A0F3281011DF2493F2B1BE95DBD338FBD3BFF8BF45F1DF3A5BBA87729
          531F8D2C43C3C40443563CFEB002E8DF5CFBF55900112FC0347C2864611A2EC6
          0ED3E04E461AC9EDC1D7260A05CF9C2D8AA43107FD0EE2F10F00106700CA386F
          C4961C78E3968FFA0118070C187E77ADCB4B11864900508D440AE930A3D11945
          0F9CE99ADEBCC35E09814EA9781DB44A0F78B21D9C6801874EA1CB1FA393DFF9
          F0590A36324D54F32F0602DD93F5F8A9315A36DBE073134F1AB1019858156C00
          32C211600000B801C0BE8100E20C047CBB9D00800306B42403B028001008E95D
          3ABAD192E66D7A61DA9E0BD60497D249838D81F724CB79D9FA9619BB19575DB6
          DB74B8A10E8BA27E6E0EE0F01000C6AD3E080C786B1D3600680406056A0BDA04
          EFA011763284B8383CDE4B757918FACF61453F1151A806A9573C106A8C7C7EF4
          F989A9667445105079AB6BE618342327DD33CBC71AD37C3C3736A29985924572
          862183744474DC1ED45034A820AD574408E6800F11CA8F85259FFEEFB2248024
          F26B56FD615290731FD4DD0E9E6668C049C1648072C833C8E9E110EF01A69D0E
          F89F4716CB220553D05D25128DA8ADAEA0F6E8E955C3AB2EBD5A43E7565DD9AF
          762DF5F8B9F57E17338AE7798AB308814E8D355146BCAE210A8A5F30A2212104
          CE43FE5BE118C2A24402AC65E5FBF0B7B6FFF792FDE5F1469694B404804C692F
          39D063F1D30D0D8A36B1A0A502CB2C070C3810E36411EB6009ED642DD6C920CE
          4563CCD348A1FD3475BCB37972C5B26955E84BED120B9F548DA5F25E8DEC2B1E
          E99CA576761BE18886D5984E34508286AC5106AC654DA852A6A4201493219765
          44401132886272DDE6B1BB735AA6AD7E71B59CD85641E755E59C7B36AFE88C9A
          6F86A332B14C03274A21B4541AD6F714CC591A58A0E11B1A16ED4F437C5E36FC
          66B1A3AD3338B6EDC0A49D3BD7740D0D20716EFCB2F7BCA139530F7B1CD468F5
          740F51CE74204388206C82B8B48C54BD42F1C917FF3FAEAEAC741F4FE579CC95
          BB2B1F7C65903571C2F8ECC54FDE118E19ABA1F88C8140381208281D4EEA88A4
          4A21E55673A73AA97145906A0CE63BBBC4895D4D933FFCF0915343EE5A24276E
          D1F76A3285FC514D0E0667A9C7DB093A791473C2711544AE90DC67B01FC5C25F
          1035103B6C2A90B5A7329CDCFABA1DCFBCDE87C981B32E01829423AAECCB7FCB
          EA8D619F7DD4C560907344A5699D482088F9605766E3D815EFABA3C615D80AD3
          D11D5226C4CE4EFDE89DBB8E5D0E80C2553523C4E123BEE431F22A2DBDC8DF71
          A4AD18FF6999C8E25646C5719D0525848B690C67FFCEE175E15626D45516DF24
          E8BFB17041D9282D2D056A2A2FBEE886B529AAC266FE8335EF5A79F9DF31A498
          E508468DB1E193B3AAABEE393C2480E4B9A2D5F505B10C77136B18BCDE2A627F
          E7D19DCDEFADB8E9124500836F54556AA7E36200FAB3B1AECFF975094025D046
          6BB151F070DD067358CE03861C331D41018D89755FBD6BCBF243433A910430E1
          D1FA2221D3D34049B2C3EA9471207C6A4B6355E95DB0926750EDF54907073E7B
          F0805EF92B265835215835153D52F7BC12C8FE912E454D1E74FA58BD6376F5A6
          D20343EE3824C18D7BECF044D9CB1F4282C4A21E85CA945A5FA9DFF29D95A99E
          7425EE5C3980728852C50263C2CA9AC7C5B4DC673549305D518914E96DB3776C
          BE73E82D932403531EAF2F0A718E06232C724C44A5B2F58EA70FBC75FB4FFE2E
          004A80E6DADA0546F1CA9D7787F9ACCD8A18337D624C2FA67B67BCB7E9AEE621
          DFE42427F1DCB507469D416CA3128CB979090058DD0FEDDF72C7AF53B6FFC60C
          24D260DEC3D5335A04EA3321A6D399B03E5C94D73EE9A59756052FA70FAC7E7E
          877BEB09EFE1DE6EA1C06729A8D0AFCDFFFDEBA57FECBBC0FFDB01E8330A16FF
          FAB7926CDC96CE1AEB9B77FEF0FB97B3779ABA66C2B2579F0E459527DC8CFEC9
          899D3F588271FCADCFD09BBF7F6D004B972E759D8D7AF3AE11BD2D1B0E6ED0AF
          E4DE929272268A4EE43BF568675DDD36E1EBFAF017BEE84EA5CB25377E07B935
          25A7CFA9D8AFF536FF2F7D530FF797E34BA7CDC5463C9DC8D775FEAF01E01F3E
          BEF100FE0F3A3619FFA844EFA10000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C1800000055744558744669
          6C6500463A5C576F726B5C49636F6E73385C50657465725461726B615F737479
          6C655C33645F466C75656E63795C466C75656E63795F536369656E63655C466C
          75656E63795F536369656E63652E626C656E64607EAFEB000000187445587444
          61746500323032362F30332F31352032303A34353A30322A9487110000001074
          45587454696D650030303A30303A31313A30338711093B000000097445587446
          72616D6500333333063499940000000D7445587443616D6572610043616D6572
          6168FFEFE90000000B744558745363656E65005363656E65E5215D9600000013
          7445587452656E64657254696D650030313A31332E3436A49AB39A0000001D74
          4558746379636C65732E566965774C617965722E73616D706C65730031303234
          B76F38C700000024744558746379636C65732E566965774C617965722E746F74
          616C5F74696D650030313A30392E3036372621C600000025744558746379636C
          65732E566965774C617965722E72656E6465725F74696D650030313A30332E32
          33E420FFCB0000002E744558746379636C65732E566965774C617965722E7379
          6E6368726F6E697A6174696F6E5F74696D650030303A30352E3832B3A0ABC200
          000A344944415478DAED597B6C14C719FFF675BEB30D02F3880D180831940435
          FD0352556DD204850AB569D25681AACA9FAD046AA536511454681D59961B241A
          AAAA519B164AA4B669225144FFA022211182D21412142802C7E1616CF0F9897D
          E73BDFF91EBE9D9DED3733BB7BB3777BF699D2A654DDF3FA6E676667BEDFF7FD
          BEC7EC2A70971FCA272DC0FF017CD202FC5B00B4B5B5A9EBD6ADFB97C01DBAC3
          823ED0D565B7B7B7D31901D8B6ADE061DFE1F5EFD061A3BC7ED9FC00507840E1
          F77FDCB3269BC9B728A64929A221AC8F8821167EBC4BABD821FDE457C57E00DF
          4F42A4FB2D283DBCD989CEBFA966DB4055D5B2B4EE57B63CD6EDCA5806A0CDB6
          D57645A187FB473E379A481D2F105A67DB161A0421B339F0B47D2704B4154FEA
          8C71AFF197341E02EF61873B069C31D4A6480955C96773E989B1D8E37F7AEEDB
          1F328ABB74F2009CB46D7D232AFB8FDDFDBB2609D91D1B1E2E28AAAA790251FC
          063F00DBA63E61A8B82817148240621F2D69838AC02C251C0E0D0F0CEC78EB85
          EFEE7DB4AD4D3FD5DE4EFC163879526FDFB8911CE8BCFAA302682F25C7E30467
          D4DDC56703A0CC021020BC27B45D04320D005B37B4A1E8CD1DC7763E3B3D80D7
          3ABB7F3CA5283F49C6E26C000740A91D20C8CC003C4A0482AF346700000588AD
          19FA60B4EF87EFECFCC14FAB029088C57080A2FB29212F380B00F60C1608682F
          82A70E80903ED07763E7BBBB9EDD3323803CA005E23161810A5AF103A940A10A
          94F003F02B027CEDC2FA1C806EE80337AB0070E0E2D5D62955ED48C6E3250068
          B9E670722AC2AF143D248B5505A0D8C6428F492C8C920A174C00702CA087AA05
          701901E81280F285A91B163D6E4BA69F2D00872E162AA880C237846B20639A30
          85BF3504C2D6C02F42ABB5C07E046032006371822943079028114427A8D05E65
          14620260BA040BCFCDAB96C186C6C5309AC9C29B5DDD909A2A80CA55350B0A31
          000545EB48C6C609F6EA33F1BEE8704C089B2F48A7A54AB15DC1B63C6A3AAC69
          F0F4DA7BE18185F3213D65C2BC7008FE70E90A9C1F1A83B0AE234DED5900B880
          00340620EE00984908E0E66647585361B26082A1294EE8AD7C2FBB2F8B6317D7
          45E09B6B5741637D04D2785D1F3260389D81DF5DBC8AD7C202E058A0BF1A00BF
          B9C028A4754CC41D0A4965436988641ACC14082C88D4C0A6E54DD084C29C880E
          C3F991184450AB56A0F504680674F5FCB9B00585AF452D67B1469A6B1870259E
          80831FF7703FD0990F88B5AAB7C0AB17BA5A2DD5285AA0529CC6336B12588342
          7CF9DEA5506768605A98BA55050E5FBD099D63E3506BE89C56D401E02A8369FE
          A1A685F044CB723E17BBAF0EC79E1E1881A3DD7D7C2C13DE7292E0ACC2E8ABE7
          BB5A89AE774C70004A890F889049D0E198E37DBE69113CBC64315690D866513E
          99A208AF7B03B5D8979A841AA41573501618F97D48B74D2B97C023CD4D9043AD
          B3488398E1EDEB5178AF7F848FE73E85637914BB2D009A2E2CA0320A159D924D
          9DC712B8465561F3CA26B87FFE3C6E7A0D25600B3101D96FF6C963FBEF3FEA86
          58368F8EA841DE14C23EB57A053CB8B8813B6B58572187ED87AFDC808FD062CC
          0A4C705F1294004411C0F19900FC1201589A6B812285D88C8C324BD0D9BE821A
          5C1409C3245E475063CC1A47AEF7233802DF424E9B688D10828CE7F2F07AD775
          0E62516D189E5EB3129AE7D6096745618727B370F0720F8CA4B31C0C2DCBD0B7
          05A0B395A00F30276614529C84C534FD190C738F2F6FE4FCCC13CA353692C9C0
          5F7AFA51981CA7CAFAC605F0E4AA660EAE1635DF9B4CC3DFFA87E1A996153C3C
          664D26BC015D6309F4951B9C462146334BEC167DFE06B703E0C34EE103719107
          88500B7C71E962D870CF029E2D99892318392EC51270ECC6004C21AD98C6597B
          06B5FBA5158CE3F7704D87540DA987F4C23EE6D01104F577E4FAB1DE01CE7D46
          2B06DCCD2781016336005E410096663861146FC3059EC028B36AEE1CD42A0A84
          319ECDF95714E2ECF0180AA0E2093C62B85186E5856FAC6E86071735704B305D
          1A08841D47D159CF0EDDE27E21FB5769E90152D982D3136A883C502500BD233D
          3E4E3284E82CD26C6A6E84F17C01E68434FE7D14B5D73B31C9B56973A703907D
          85656546BB67EEBF0F5A1AE6F008358165C19FAFF5C1B5F1248FFB34B040BC13
          00CE320A691DA9F10429504B679AFF7ACB32CEFB6B89141CBB3988358A89E14E
          13A607FF62E2B0B923B3315FBD6F19E7F13B370621864E1DD1554E25392CFB38
          1F008027B26A01FCFCECC556ACFCB01A1D27C8519D09B214230FCBACD792293E
          A94832CEE2A5F59153DCB9F98250A1699539942AF8EE717D06005E89EE9612BD
          08A0B50A00DC0790428A53CCA125382598A3BAC945AE4201CA0130A11DF9CA36
          39F2A605028477F706EE56765616F8D9FB68014344210E00C4A3A4A2007670C4
          90F90BFEDA294850707E43699BB486BB9F06EE036C43D35B0D800B48A110B700
          F0FD40406C0EA20FC8029497DBFE71452DBB7D20CDED3AB7B72706B1A1892285
          4ECC44A1971180ED0050DC72BA446BB2994B2D504E09BFD0B2D6D91FDB3E96EE
          83E5D3C9117C4B19EDEDAD0E0073E28978826088D72B69174A172CD3A4DF2FE4
          FBC18B5600054C822A2BE878712E0B8EBE8759DA5079DE719CB80A007B4E9F6F
          B54361E103AA5B8D4ADAAE24E8B4562A893ACEC2058C700F6135FB85658D1876
          2D51C9F24A5494E51FF40DC2490CDB35BA2EF6C4D301D877EE9CB17DC306738F
          E703091E467DC29570B918852A38B0341E7CE38583B2A8B6EB91F550CFAA552C
          3B98253C8BE3914AA7A1EDF8FB90555452575FAF0FF547779ED8F5FD3DDBF6ED
          33F66FDF6EFA006C4300FB11C0EEF7CEEDA23591DDC2071C0B489AABE498FEF6
          00EAC811860A6E9BC484673EB5121A0D052631C939EE204A77BCE81E18825F9C
          B904B50B1B48C3C2457AF2D6F08ED36DCFEF5DBF6D9F717EBF03C076DE071CB8
          7C7949C498FB423A9B7F728A982DA669BA113420D5975023A08F56A019570415
          5632B1FCAEC1D1F3303B138B14C183CD7D6264220D29ACA5C2E1B0AD61551636
          42DD3A2847E2BD89975F7BEE6BB780C9EE5AE060CFE089DAF9F3378E0C8F58A4
          50D0C48E977AFE56AEEDE9B82EC7F5D204E7243E50BC674844B69C644D1DA388
          C29F0D6122653B3EC3B00AB6AA8D44A3EFBEFE9D2D9B3D0AED3D7D696D7D7DB8
          339FCBC06436A7E2E4AA2FC34E93886672687FF67562BC734DDD5C10948D1D67
          96E98A77D2542A6D2753199249C7D79D79E9C51E0EE0F9378E2CD4E7D575A673
          F9C6E478A280B05499CF4520FE8403BE6F176970AE907DA35C31250A09489E0E
          483A994E872663B1C14CCEFC74F4CD5F2794AD5BB76A870E1DB21EDBF9E2F792
          A3A3BFCAA6D3DC293CFF56DC8CA9B8D249872771B1598AF1E571BF04A8242CF8
          7E1727B5A5C1AC8FA4D30AC965B78DFEE3EC6F0165F7BD236B5AD3FC702854F7
          594DD3D0CD700BAFB1FFF87136232A863DD1EC3C6E12CFE1B0412D4EC29F7151
          A78F5D5270FE1827C4C35ADEC10A44D1CF37F2EC7D991804DEAB48EAFD7331A8
          9699FB602C3A74C6D1A8AD489DFFC56F274B0EE9459FFF2D259A0446479547FF
          03329CBAED1B4F31937866F9DF7C537F371D773D807F02B47F24A0CCC0858800
          00000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C1800000D2B4944415478DA
          D559099014D519FEFA754FF7CCECCEECECEC2E2C724461D9D5440D105D644104
          05A3490C255E65095E78550CF1C4230565089431A5204645C5A8A0255A204979
          842082623C6081F24045EEE5DC83DD9DBDE6EC33FF7B3D3D2C48AC5D2E4D57FD
          D5AF7B7AFAFDDFFF7FEF3F5E4BF83F3FA4E3F1D2895585C3648BDDE5F3B17324
          C68A6D079A65598DB6E57C453F2F5324E3A517D6B4C77E5400AEA98C86158669
          05A1C07855F39FA2FA34499165488CA6701C58B60DC330914AA79188A75A0DDB
          BCE3E535B1977F1400260E2FECE767EA8A484178605B7B07544541BF7EBDC118
          CB3D6313002EBA6E20994AA3BD238E642279E7FCEAD8133F288087CE8352E794
          7E1C2D8C0C0D04FDD8BBA70E3E45C6A91565603213201CEE01CB12629A1674C3
          403C9E446B4B9B954EA787BF541DABFEC100DC704EF4AE68343ABB209C0F9FE6
          C39E5DB5306D0BFD4FE987D29E25F0F97C59CBEB48A73344234378818FB9B79A
          9B5B569217C6FC5000A4DB46956E8E164607864379C2DAB5750DA4581CC14000
          914808A150087E4D8549D6D77593E89320E575284CA67F3B686C6A712CD3AE98
          5FDDB4F58403B87E68F1C06050DB128D46100C06104F2449A118244986469637
          0C5DD0876E88A91CC7824321C9766C02A581D15A49C413442DFBDE05D5CDB37E
          0000D1F19A5F5B524400145941734B8C38EEE0B2CB4B5039AC2F16BF518B8F3F
          AD452669229C1F40224914B2B9F515047D4C00334D1304F18D056B9AAF38E100
          AE1B5A7C8B2439CF15161490654DC45319689A85A79E1E0CC821927C9A41A530
          AAC33612C4980E4876072CBD1D37DFDE48D70E79C5267A39CE2B6B63EC487438
          3A009545B74B0C4F69AACBF154C6C4CB2F964156C3A47C1EBD3D40A2D09316C5
          D13449828671920E18C9346EBCBD198AE2AA307F4DF311E9725400269E153515
          1F11DE91881AC0637F2940CFD2428091E5E520BDDD4FC244228B772429C4B623
          435EEA599446CF920C321D266E9DD20A466AD4AC89F93E04CC130BE0EC228392
          AD625A36664C0B93AE7E7CB641454BBB84BE7DFC187B61313D45D18658FEFEFB
          4DD8B13D85B2011234D540E5205AE094998DB88EB9F333F86C0B9E5A58DD34F9
          8402B87E6851C61F803A634A00853D546CD9A52094AF226D68080435F4EE1DC8
          79C0A55186C69C4A49B4B79AB490390003B54D0E66CC315A16AC698C9E5000D7
          0D2B4EDC7B8B1A1CD04F822F4F85AC51ED43D1082C001B2A65621F3DC584075A
          6206B66E4B239934B06F9F8DD1C34D9414E8301226F6D4DB7864AE89F9AB1BBB
          ADCF5101B8A1AA47E2BA4B113C7B10291F90F1F9268AEDB284963699929A8CB1
          17685900101EA8AFD3914A19E8DDCB8642D7268D3309036FBD6B63C51A9B0370
          D19E28003756F5B0CEAC70D8ADD76A22A6671C1FEA9A398D40F4E1DC57DC2426
          54A255EE986E32B32899E904206DE093D5065E5FA6D14F692A3BD49DCFAEDA7B
          CA09033069780F874C8E5F8FB271E1B9327C419FA01153DC24C54B699BF58294
          F70B246BDF46308FE320E569D15B1472CD9489479E73D0D01CA0E446DEA0FAE8
          854FF6774BA72306B07EBDE37B7E4A7F9D319BEA1B1BD78ECBA0EA6C771D3095
          AF0596AD20B25388A4E5E4AC6F916CDDA6E3B1F97ECAD27EE4A90A622DCD0886
          82FF7CE2DF35E38F2B80E55FD65F9DE7C7D321BF52B8FCD9FBB1A57A156496C2
          9F7E67215CE803F3B95ED029E8A43B6CC1A0C69D068CB48D8A611A65654B9417
          33E7026DF120F2098022D9686B6BA39244CECCFD60AFFFB80158B466E7A47040
          9D2751B11F0E3894981278EFD1DB50BF6B2B7A97A470E7B512FCF9B2E8053E59
          9CC0BA77532007211490306E72087D06FA601180D7DF36B06ABD0A3FAF342C53
          9414AAAA9A512DDCEFE17737D51D1700440179C18735B1D2022D5C29DF03AB61
          1DD5330AB6E4CFC4E2C71E45ACA1162715EBB8F54AA0A4C4A5510B85C854BB8D
          A23E3254B22BB7FEBBFFB1F0D607B47C688D302AA6FCAABA7AEEAA7D23D0CD08
          D46D001F388E125FBB3331227F866AEE59495461E47A93EAFB12349DF60E9E9D
          7613BE4846912C3E15FF38F76914442CA2962466E165B4A14BB4601554277FEE
          4CDE7EDFD6B8D667312C691942FD3FC574E2D0111CDDF400A4D48661EFA79B6A
          4751B348313C4D7470100817C138AB1A0DC4EBCA176348536DB4B1D708640CDE
          179854B0514B69CAD04D467CB730AFE33AFC75CF24B1A0797485E5ECA0C11348
          743C83796719C70FC0D7037EEB98ECCDF6FD9451A9045088223E6A4A5A7FF230
          E4D271C2DAE72F6CC1162A132E0E7F8859C53311B4E3621A992253332BC61FF7
          DD85A54D234465C1BDC2CF3073CC69A672EE2E3C39F095E302405F376009E938
          9E33D5A158DE569F825130086DE58B10F633EC6CD5F1DEA6667CD414C4CA7D9E
          211D97D99E784A67CF0E2F63ADCE562261D218CC2E5B79CC01643EEEDBE2D852
          8487761EC7637115DB4E5E8148B810F54952FE9B7AF8A8DBDA96ACC792DAB283
          9572B274B10F06E1F010F5DDA5BB118F979D2E9AE6630560CC338B5E79B3ECCE
          09DCED8E6D239E7430B5F67EBC95B8146750D53C506B005F173785FF80175313
          F0CCEE4BDCB7672DEF78D677392FCE17F455B16E5B4ABCBF2D73A866CE25985D
          FECE3101203F5A33CAC7CC0F760C381F412789B82E63935581B1DF2E10E5BEA6
          4A18DD2389F2F8220CCF5F86D1154DA8DAB000DBD37D3BD1C7C1C030C3BD8335
          8CAB0812E5A8EC90E5DC1CD4D863E5370D58F2551A4B364904C85984C7CBAF3A
          2600A4D93B974B0A1B1BA19E767AE16CE89682FB774FA149A9E6A1EA53F42C74
          A6DE0C412989AB030BB1D098807E9102ACBDBA88EA7ECA0992E4961259E1CD7C
          474707DADBDB110CF26C9CCF1399D843DAB1BB0E73AA0D63C30E56BC767A79FB
          D10198B5BB92A9A8168AF268613882024E8A3728744FC902601C8024AAE7B242
          15ABAF88201254C52BB8C25C31B1C592BD169367EB245BEC9BF23E611FF2F2F2
          C45E522C16C3E6DD8D9B239A3DB8AAAA2A75C400A439BB9E97FCEC266141DD76
          4150E7EAC46D778D0900AEF5198D1F18A2E19E2121A859767456DADB1FE5C2B7
          193D6FF06B85C231DF18E31E492412D0344D8CE3F1F896934E3AE9CCF2F2F24C
          F7012C7264D6B0A79600F410D934434AF3E848209C76CBB5BCE25A7EFB2DA5E8
          57E0CB59D53B3C05B985B970C53D008713EFD9743A2DD6081FA752A9D7478D1A
          7575B701C8B36A463B7EE57DC92FB9315B775C0FD0D9895B42F9E77F13C18D83
          0A721CF7A8E16DE876A68FBBB96BE680F0F1A100F83DEF3EDF4FF5891D3EC3CC
          64329504E2F36E019066ED9C23F9E53B249FE4A67DD31511BB330ED6DF548C33
          4B0307595D8CA9EBB2F5FDB0E592832CCB15F3CE87B3BEE7252EFC197EF0FB81
          40807B61E1C89123AFE91600F6D8AED5D0A473F802CD251F0E246163F58408CE
          28D584C25C387F3DCB1BADD5F0EF7F0046D1646482BF24A5711090C329CEADCD
          C553BEB337B95084B276EFDEAD5D79E59556D7003CE43096B7AB0D2ACB174F75
          4A423794F9F0F898504E61CF03DE755B5B0BB4BA075118A883A5F4443A742D52
          F2E0C302E0CA123D04E73DE99C1F3CC3702FF8FDFE9B870C19F2F7AE01F873CD
          694C933622BBF5E701A0BE039F5FE547EF901BDBFDF553E9914618D4FB5AAC88
          1EF393A354987A3BA2F206A83E9D68D78A044E454BF06E626030A7BCFBCD202D
          0070F13CC0C71C188F4C3C47F075C0C7942B3EAAACAC1CD95500BF9214E95F3C
          3C3A9D0A31BE515273A3DFB58C9D01FBF27C98B6F780428D3C4320D203A1E25E
          6217C2DD0FED2069C76BFB86E1FACD5311D024E46B360A541B51494731322825
          887D591A15C138B1163920DCA3E1705880200035C3870FEFDF450A6DBF9CB2EF
          62B1AD6323570E9C592861E965EA01EE6F9C488B7A9BC805BCC3D2A8ED52A84F
          0C4642EE9F6C8ABB0EE5212B85CD6DBDF0D3F5AFB8B943910ECCEEAD2D4A928E
          49AD2579274CA0AAF21B704571BDF84042F44124127971C4881193BA0660DA8E
          F3C8FAAB72055916C4E323A99EAE900F2C30BD09ECABF134CE40526451D05197
          89929E6AAE98131F3574138BF79E8B893533C5EF609D0078051ECFF0D944E965
          7CFE82693F6B78A0AAA863FA45175DF49D66FF7B3C50E3974CBB819E0823DBEC
          8568E22FAE3FB060BD434F3682D5BE8AFCF42A30BB91A6B411CE97B39B5A7445
          568DA7145CBC711E36A60712000E52E29BDAC273DE471C9B3C21594EA7904DD7
          04C4D2EDE7F1B7F25B0EA7E6F767E207B74C82CDE691468C0A4EBC76898D337A
          1C086DC0C199B6B5B5152D4DF560C96F211B74369B90A27CF14EA2129FB40DC1
          CE541F7746E62A6E676B27C77315D5563C48F01D0AC972DFAD90F7280CBC6ACD
          AA98D07D00FCB87BFB88BB87C43F1A3740474893BF532A78B58D9769BD38CEEB
          194A3E22B2F06B5EDB28FE3C4CFDBA3FF676F848471E73C597B31C8B0EEC8149
          E2EB8D88DE74959A7DEAFFFC7AD3A5727AC58A150E8F3A9E7814EA5C8C75FE16
          DCB9703BE468A6DF9EA4983E67ECD8B16DDE4DF5BE1A6A53ED4B18EC41F4A793
          4528B3ED4632C6EFAD274F5FF67DBA7509C0D2A54B6DC7118C3D28C974A6D0A1
          A5B2F733C95E92C5F4CC33E3C68DDBD695F9BA7374B9A55CBE7CF952A2C21852
          44C92A9A8B213436C823691AB790EC2059CB7153DC5E377AF4E8F4B156FA8800
          FC588FFF02790E539AD5EFE5DF0000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C1800000B264944415478DA
          ED59097055E5153EFF72EF7D6BF2B2438261105C485257EAD25A9056AA543BA5
          334D3A4E672A83A00E56DBA99D4E6B3B84583B5A75EAD84547861197766C89C5
          A5A074B4C5683B7505EC48B448C222012488D9DE7BF7DE7FEBF9EF7BC1684113
          C8489CF19297F778F75FCE77CEF79D73FE1B029FF28B1C6F033E0370BC0D38EE
          005A8DA16DD14A447FBA0018435A717EDB7132FC98001834BE0580B613A2161B
          73790FA8E45384AF8CA2F109031A338022650C52C6FCC8989F6C05B8A52F2F1E
          792EE136371BC32CA8090B60D8C31881C462AD57EEA1F4F241FC3EDBAB1EDF54
          CD176068E827AD855103588DDE6D41EF3E634CDD431ADAFB289CFFAED681A6D4
          F3F788F51BEBDCF91316007A9EA3E7E5E3C634AE07F95817F0194A09210CA192
          73E66F0FD76F3CD19B9800868DBF3FCCCDDEC0DC47765256E589501A009E05AA
          C041005B86D6BDDA94BE6CC20118367E95110B9E07FE876E63924428A580320E
          1A840195F710C0A6A1BFBC7E56FA5B450006DF8FB01B3130CED7E101609A9C03
          C03AD0F83B8C59B8D198953B85A14C69A328A1446B88190959E24815E75CBE3A
          78DFC65925578E2A0BB522C8E540E63CFB2CB9F0C20BF570461B3F00687C7331
          C7DF66E475AF01FB4D97AFB4A33420E5A9C4290C0A2C896B21FD549CC3DBC18A
          7FD6C7AEC6ECC4481180AD1523373151000E6FA805DE80438EA6867C0080DD74
          79B1BAB64AB9EC2DC6DAB66595C2C489D4A0C401A47CE4790F289A849F4D4839
          11940C25A9DE2219955423BF701D66EF6B4142EA11C03901E176B310D10D4901
          7BD2CC6C01CE5E9CE3C026DC2F573480E16F3D96889011D6173EE3E49B94BAEB
          554AAFDFD32F2447E6003544E1921600DA677700496C247037FBBDFDE0615C88
          1D83E1433F86F89E40C329EA218FD0B951D1F8415CCEC57143F86283C204E074
          C519AC99EEC28A3FC74997A5582B7A71B4D120878C47C36D046E14F2FED71DFE
          DDDE77031903C51461E80E0296170C241A13031E41885C1551237A2175D22630
          79E0B810104F0B5C9DE25809A1718A34D218336A94C6F8A18E42651875D02D2E
          9050B05C19C87BBFE0656FBE33933938DAAA1E01685E8D835B886A35EAE6CD40
          7FB67BBF122EB1BB6ADC9E4546A0854803660D8D2652AB0134D74470347A5BE0
          FD180834DAEAC441146830DE051051D47086D1E028015C2BC8232B7DBB85945A
          2212898E22A5715AE607DDF58E5ED45E9BE898B36103EF983B577E0C004B1DCB
          3943BEB8237C41A5DC73682E8764B7C430116D28BE06D1383B2CA103D4808B14
          E290363E78DA07413978489703341369C482C3C861A6F271268F9C6053ABBDC3
          B58C5E4348775417B0D0473031604A68DFB83A460DCFB82AAC76CC9227A6A61E
          FCB84814DCD9DA4AA1AD4D9F7A53D79374CE09F333D384A24A33D7A10840441C
          0E70732B4C55F4BF2685FF53EBDFC8381E81B2400C460EA16184C22822361A02
          EF09144C5C05D00731CB3FF06400792C262CCC43C05291A0A8948A6034D2A904
          BA432C7AE6646FD547812850A81907B41375CE0FFED1DA179BBC5C7D654A5873
          92E34A54AEC73504D44151D288329626F6E260A27F1469011497C1311ED2C823
          017A370196690963BDEB4630E3C4C7B12128A44E60108C404A061A0634072E75
          E4000B80E07D4749AD3521A994AB6A8999BFAED1796698E647C842051A35AC7E
          DDE57FDFBAC64FD55FAABE3C4396CE4C724F497011441F1A5EA607301A71F0D1
          9B36329841D028E4F37614F71BEF21E1099A21C0E771F4BAC057083E8D17A4CE
          79F49D49B8E0953A2451812E4DC64086216451C54C4A8C2A8E417D382A04A2B0
          F070976662CEF6EF9B97CE6D396B76EF70B239421D2880B8ACF5DEC48EBD956B
          8264FDC572EE49B2E664C2092E0CD83C58115B412623F11204C321871EEC7B68
          9B713ADF448312403966183496DA2CC828C4742E127EE0A471757420661FED38
          1A32A5263135CD92279582482420F005B8A80D85D1A1F86EA71BA9644526C92B
          4870CFDAB3D34B0F7760FA60252E6AE1B41BFE963403038F86F129F3E4EC9365
          65538CBBB8719AE5611FC9808B9EF451C80C0DEA13188BFBFEADC9DEB777AA58
          2C308E8BC9D7C15C1FE0764E947B247723E3D1790C3367157358B9F55788F5DD
          298FD3923326115355065EAE0F6CB5A098A942D410EA09B32D25AE970AA725D4
          B9EDE7A6367F18C4FFB7122340A881C147B53B695E70FE74597A6686A7705985
          82B6D9C45227A0540DAA18936B3A7FBF7D59E375B35A7BE229D81A2D1E3F988F
          429D2EAF3F14F2EEBD3E3F1813694EFB66E5C0FD1EF16297303FA7834C35293F
          A39CF0B214081FAB8B2D2438CB430AA2A465329DE18E32F73C775162E987B570
          F866AE08624EEBEAD4811E7854B8532E12A7D78AD439939D04F2DCA070F34827
          0F4BD18049B0ECF3EF5ED1736DE58378EA61D0329A236581AED37FD8B1587272
          B72D0FAC2C6E6267D663FEF1C08412240EB1D5BB8CF6632393A08CC477879C9E
          FEC225998323B570E4767A18C45204119235824D9AA71AEB64C579953CA28995
          262A6D00E24CBDB87FE18EAB6B1E80D60D1CDAE67E04005328DB2DED141AAA08
          8E95536F7C6D2126D95558F4B43EA596662A12C0F336E74948D2D0DA8A5E410C
          4E09CD86EED75F6E2E5D3B320A1F7DA0298238FBAA2712792D1E11A466FED0A9
          D364DDF9252CED6882CBAB5E28657AF3FE45DB96D4AC1A7D048A51687D965910
          336E7CF94FD2F1BEED5795A8785D9AD506FDA0B0B1B24DCC908CDBCC264BD271
          BEFB00B9F5ADC5953F9D838EEA682B54E88F3F521EA2D386D83B3D030F132859
          10D6578BF80527F2D294D0599566839B7A97742DAD5E79A45C7DC4AB793583F6
          16F5B9B62D5FEA57EA39C83023EBAA498D9FC7948B0DA12D6C186BD784CA8BC7
          D8DB0389C7BBAFA95E109D29DA0A421EDDA1FE50245E7172A667953125DF1998
          7C829C7C41399054193FF8AF03D774FFB8EADE3103286A61DEED7B93DBB2FBFE
          A3CAD3278AEAB48EBF17D2A40CA3BA8FD5C0F6BE5AF10CF57DFDCACE1BA67C7E
          E40A6378AC8220CCF2E8F474CA92277F474CFADA6C6579E09E3DD3F3DED87775
          E7B2DA15630700873AE169BFECECD0E589D9F98AA4767B058D0D0C42C01D2C6A
          0170E56BE595D240C05B257EAEA9B3AD291C063FB6075B76332B400C7BC395EB
          7E214CD9CF45A60AAADC60E1CBB7363D702C00EA6ED9BA5ED5545CACDDBC720F
          2886E487425F8B858F30FCC1C62CF077E5DF518DBD77370D1D1D80E1B037E3DA
          D83BCDBCE2E9EB65BCECAE6489FBD5CDB79DF6F430A78F0AC01D3B9ED299F825
          F610E2EC978CF5E750BC7950D8E92AEA686CB6B19552BB319B34FCF7F69983C7
          0020BA3083E05C14D2F4AB5E390BF5D6D5BD62563FBC7FFC1D3380DA5FF73CA9
          4B13F32517CA7D27CFBCBE01909C456D85A3431D7825948441CFA4816CC34BBF
          3D6FE0580114AE11D9E0A8AF610077EC4600A9F99AE614DF17B2587F1FA0DB23
          7F506C290875B0EA400F8FD5356C6BAB1C2700118828430D9F2C8F76BEAEBD6D
          D73A1277BF167AC8985E8911C080928206029E30D817D964D4C368A2B1FB57D3
          FBC70FC0313BA010C529B7EE5A8B1DE0A581CB500379C687F2804767EB7D1431
          5634E6112E821EEAA4261A804204A62E7F736D585A7EA9C00688EFF799836994
          10199DA33105210097E0696D0F1EFC1B5FBBEBCCBE0904A01881B65D7F55A9F4
          65D26495D39B676CC88F288419086B41CE681627DA387B66D07C63C744045077
          D3DEC7F06CF48DD061A1B7AF8FD1A100ECB363628FACF8CB108EA7206777C6D3
          A777DED97470C201A85FD6BBC6C492DFF4B952EC004660308BFD503E7A788086
          6AC33C4AC37C8FE3F5376C1BB7343A2E000A1A98BE6813F6E16691729C940A45
          391542E1292E6BEC63473C7EE0BBF620FF74F71FE73EFCFEA3A0CFFE4E3C8E97
          A55267D19E86624DE96C2FDAD75C1CD40E1F6E55260E80A3BC3E0370BCAFFF01
          C08A2D8BAE757DDC0000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          87000000097048597300000B1300000B1301009A9C1800000B434944415478DA
          ED590B8C55D515DDE79CFB79EFCD07111050438B5A542AA0450D1A5B4A2941AB
          100D0EAD8D4D344DDADAC656C57E92C60C93D2D2FAC50A454D6CD3A6362953AB
          58D36AD422A2A5A8FC046660A002C300330CBC79F37EF7BE7BCFA7EBDC9951FE
          30600B24DE0C9999FBCEBD67ADBDD75E7B9F81D1197EB1530DE01302A71AC099
          49C0185647C41B89343166CE3C02FB11493030A6CF0802068071993F98E0A297
          2975E74EA2B94B192BD619231A1953A73D8145003A13409F37F1E4E7C9796D73
          A4DFBEDCE3B72D646CC78992F8BF12E80339C7981BD669FDF7ED8C9391B47358
          18DFB6B8D65B36D118071991A72D81BE0CCC89CDB426875EFC4F51C69ECBDC90
          28ACD2E28E3732ECCF09C97E14F72921F000086C03812D45A98452243967D275
          F8F062E9FEBF0DA97904C522E838499C1209FD383437667D7AE9FD7CAC535A73
          52D294C8D1718D2F06E7C2475E1F9ABE1F2478FD6CA28686A33BD4C74FA0C71A
          0FBB539D81F783C0F78A666A214D2F6FC94BED82404C9CA452461AA654B5E70C
          2DCB675E193CE75B8C669B7A3CD970149B3D2902F5885253EF3BA05B732C3FAF
          5BB44834CE9CA9EAF3E6BA565F2FDB588A8DA3A014902E1A97983626D64CEA5A
          D71D50D2CFFD7128BF7D2463A1DDE74824FA4DC07AF9CC63745173501658EF3A
          DCE7F8593F63CC756F046A595B31A0985C13E3B601BC089970654C452DA45BED
          3A998A7AFDAB95C2ADF78E1C983B92CDF68BC0FE0E61413E407451BB52D7E48C
          B9BC8B3B23855603CB247C7C873F123946190D648A0124F0C7D8CE21928EA211
          95987DCAAB04705187C5A8594F03BED654229FF01045A86D370D12917CF7B3E4
          DCFCDB4FB15D758BB0FFCC03491C178124EA8D8DDCA67FB73155F3896E6D21BA
          534A7575C911696B1971CF3AE24A52083910405401729679E46AAB2F20373DDF
          7945511C4171265906E0F66145C292454D232356565489511619DFA98D65F364
          959DFECBCF0CDD72B09C8E492079A04707FA0963EAD6289A931734AA8CADF301
          EECA58390C5B6B8C0988A7D2F6ED186FB4220E1012D1B59D096AA79489901341
          1506F3379A632D215B49DD2BFC1326C2EF2081B50CB5819220156B19A46A9C0C
          53DB4647A5EB9FBD74C026EB507DF5C68E091E0BB71A73D68B5A2ED8C89DAFB7
          C6D28481D456D621791C326129B220888AD838B2220108616F2003CA78C9EF12
          FA4E69896CC449B4CB94A1B40EA8C8D2649DD466C2465DE00717720AF19C9514
          BEC8B68AD0F59D94A40D5F2AEDBBF6890983F3096B8060C701FED38B297EE103
          72C73517A4E406D8C9065731A8800248A41A1B32002C808049E460124019002C
          53DABA0BA4A3A8027DD7AA22005640D4251F84F6B2B3C83E54A542B2B580A226
          5745E4418A41520F202625E404A7CD798EBBB578EDFAEF0C5A4E703482A4D9D1
          C0BF6ACC881544AFB6181A95ED0E630F265186BE1D0043CC7B373054603E9D65
          02AA401256FF36D21510F01069BB2629D0444E4E22154BCC7A3F333C91162591
          B7D912B69D25D11FA00A146B8F240A474644950E646F6D67A53A5719FFF6BC2B
          3600242734B94309F4A6A6D598F4EF94FAE73A2626045D11A42C9C248EF8D840
          EBB620A17B484591761CAA86A00225001E85AB6BC9FAA20FE0701990C17DC4DC
          C37379538D18C7B6F9E25D9454B58DBC8DB4CD8C25146B87D22A202DD1A4015E
          ED0954BC3A2B6ABBDB9B3E37BAEAAAA7BF7D65190F322B3A76A4E8CFAB147FBD
          DCADBA3BE8CCE3FD29D7462960482F621FE13109A01143CA0B8AC23D8A4A9D60
          D35D32525B19E9C45E1C6B92C8465154532A2E91C6F32688C91B31800D199761
          21005A819B24289C6A658E72544BB6B9B9087B21F649B7979558B543F8F98E9C
          EF9BEB573C327505D5D723FA0D8716711FF8F926FA4253512FDD94675A70BB86
          33EB79B670ADD5E5A1FBB08C683695A8D49CD3724FDE8800DE648B8E5BDB4479
          CB3205A23629609DB8BF24180E89429EE28103CD8859D7E09DB811696426A692
          F193E8A755856C9D3B51990AED4CB1956DC22BEDC965BC78DA8A47BFF216DAB9
          A0C6991FF6027638F9DC5E522FB7057CAA572C2A2D5C9162B647324A61C32E9E
          A28E0E4D85B77652B82DAF852933E130164761085FDCC5B40E1577134DDBE142
          A89862E6D96981441C3213C2E5B93977F87D37D6B23433E590C15225642300BE
          84C86BCAC5F0B5B6B2666B77F254A933C77C356D25C04F9C58EF2C5DDA70C079
          811D1CFD3BCAE6F31F74466F761795A975B0D67199830478005FE1709A8E32B5
          2F2B90686B533CC544AC686B262CCE53C6FF079CAE7D64988F6ACE1E918C0E85
          6C6BF2FEE0EC74F2BD4835FCBD862B83B1F7BC3AB9FA1B135E89521E6701BCCC
          080C40C84E1C512405025356FEDAED4254BABA8527A6AD9AF7E56513EB97384B
          1B261D72D8F99040DFAC31757BBC20AB9DEFB26C878C9C8C13B969CA704329B4
          CB3CACA5FC662BC96D5D8AA5856051F4DC05D9F2375F7B7A4A775F511DA3A527
          19BEEED9DC403E2EB529D67C4829D0C951D989619BD221B1A55DEBF57BB81FE7
          729E27A7BF33EF862382FF8840EF8BEFD6DA7F677DB0161AB898458106442847
          23F29964616E5B85D87B3B1417C8B7A197AEDAB8E9E646AB476C40F486A686D9
          E6F0BDB19757FD6C668BEFA617370ECE5F78E1FA7CC4875229C4BCE030270C49
          B564956CEE14BECA750961A6AD9C3FF5ED8913017EE9A4231E33FB0824ADF9CA
          2DE6B25C477E95AC1857F9699332214B73DB4391FE4850F1FDB249B5B7637088
          BB0771FF8A777E7EF9D6838BEA783270CB2BBBCFC90E1DD414846A90280706CA
          619DCD9174B7EC72D23ABBD7F1CCF4D58F4F597EB4C81F4800531E61CA1BB9DC
          CC8883F02F3AD7A94CA6462455E8FA943621558A9CC4DA76C56D4390952737CF
          19735712F9636C703802D35FE83CB77B785553549103F2DDC2C8F5BB34DFDE29
          1C2A7508E64E5BB3F08BEF1E2BF2076740E0C5EABC25D13D52398F99AEDD180D
          5D917CC66D72D0827391112D9D06DD980BEECDD8D870F15FEB10FDC6E38DFE7E
          04AE7EAE74BE18CE9B4C36ACE9589597DEAE0EC7A3EE561274D3BA0553D61D2F
          F88F082C4124274D92C31717662BEED7D3DE360C848E305ECF1C937482323799
          961DA0A250D4EEF875BF18B7AAAF9DF797C0C4A7779CBF7BD8900D72757B8DBF
          6B1FE3BCD084A162DABA85533EE86F507A08D4A383343039EC4F7BE66AB7FA27
          BADC6DD93B3D9DC74B1A583A8F2EDB1A302E2355A3B2E39AE74DDE70A204BEB6
          B87DE8BF5716D67BFBC4E0B46C7B2BC33A672C7F72C69E7E67F46002E7FC3EFB
          2BE3783FD2010830EEF0288045E3ACEAF8E4E2FCCAB6EFC5FCAF64DA73C76E7E
          704C73BF09F45A2D2CDB5B735FF366B750DC78C179FC96971A30DBF4FB5D0710
          E829C6E10BB73E18570DF921CBEE80F5B88E056F671A2630255650D16D791090
          D2CDB031DBE78EDD78A29BDAEB92EF378F3FDBA7967F3D746961FFD9E6E4083C
          B9F3211C67EFD7613E9110B2412CAA10A5AA30474B63DAAD84E2B8CAB0B12DF3
          4F8E40B22D8037F4F48E13FE13FB01121ABEA0E361A5CD2CA9A564E8C30C9322
          C28FC13E454E80BADEB917673F1D3B6E66CCB6C72FDD7452049267E9A4C01F9A
          8147773C2CB9374B47816471A52703982631AD915BC171637717CC5645C2A91E
          B375C1E8969349FDC7751D48E0C1D647A5C8DC6B8B188772C79E010CC301DBF5
          484468161D79E6C6C568203797AD79EA9ACDA71D816173773D26B97F0F75EF92
          C64D2704EC413BC94084F3D3BE0AE35A5586B8F2B2D5BF19BFE5B42330F4676D
          F314B93F30E54E542EC780C6930C08FBB72C4C464EC73EF4651E0E49C971A725
          81F37E8A1A6035B34C9895C6F6019C69B593821FF9C4310579D9020E2851E03B
          C1E84D4F5DB1EDF421D0DB2147DDB6E492B2E27729656A3072FAF8208D59A80A
          C7C4B4E38A622A8A0B18E956B48C9A30EF64ECF3E32770065F0712B092689ABD
          DFBD46A2D1751FF97453EFFAC613FB1FC5FF3D8133F0FA84C0A9BEFE0BFFE125
          9A000EED1E0000000049454E44AE426082}
        ContentLeftMargin = 0
        ContentRightMargin = 0
        ContentTopMargin = 0
        ContentBottomMargin = 0
        Options.LeftMargin = 0
        Options.TopMargin = 0
        Options.RightMargin = 0
        Options.BottomMargin = 0
        Options.Stretch = True
        Options.StretchBorder = False
        Options.DrawOnlyBorder = False
        Options.DrawOnlyClient = False
        DrawStyle = idsTile
        VirtualWidth = 0
        VirtualHeight = 0
        TileOffsetX = 0
        TileOffsetY = 0
        Proportional = False
        Scaled = True
        PixelOffsetModeHighQuality = True
        InterpolationModeHighQuality = True
      end>
    Left = 92
    Top = 661
  end
  object vimlEmailContentLarge: TscGPVirtualImageList
    ColorDepth = cd32Bit
    DirectDraw = True
    PixelOffsetMode = scgppomHighQuality
    InterpolationMode = scgppimDefault
    Width = 48
    Height = 48
    DefaultWidth = 48
    DefaultHeight = 48
    SourceImageCollection = icolEmailContentLarge
    Left = 91
    Top = 729
  end
  object popMenuTemplate: TCWSPopupMenu
    Images = vimlEmailContentSmall
    OwnerDraw = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 460
    Top = 748
    object File2: TMenuItem
      Caption = '&File'
      object Save1: TMenuItem
        Action = FileSave
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Exit2: TMenuItem
        Action = FileExit
      end
    end
    object Edit2: TMenuItem
      Caption = '&Edit'
      object Undo2: TMenuItem
        Action = EditUndo
        ImageIndex = 10
      end
      object Redo2: TMenuItem
        Action = EditSynEditRedo
        ImageIndex = 11
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Cut2: TMenuItem
        Action = EditCut
      end
      object Copy2: TMenuItem
        Action = EditCopy
      end
      object Paste2: TMenuItem
        Action = EditPaste
      end
    end
    object InsertToken1: TMenuItem
      Caption = 'Insert Token'
      object StudentName2: TMenuItem
        Action = StudentName
      end
      object eacherName1: TMenuItem
        Action = TeacherName
      end
      object RoomNumber2: TMenuItem
        Action = RoomNumber
      end
      object ClassLevel2: TMenuItem
        Action = ClassLevel
      end
      object ChildcareLevel1: TMenuItem
        Action = Childcare
      end
    end
  end
  object aclEmailContent: TActionList
    Left = 602
    Top = 646
    object FileNew: TAction
      Category = 'File'
      Caption = '&New'
      ShortCut = 16462
    end
    object FileOpen: TAction
      Category = 'File'
      Caption = '&Open...'
      ShortCut = 16463
    end
    object FileSave: TAction
      Category = 'File'
      Caption = '&Save'
      Hint = 'Save the message template file'
      ImageIndex = 0
      ShortCut = 16467
      OnExecute = FileSaveExecute
    end
    object FileSaveAs: TAction
      Category = 'File'
      Caption = 'Save &As...'
    end
    object FileExit: TAction
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit this window.'
      ImageIndex = 1
      OnExecute = FileExitExecute
    end
    object EditCut: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut'
      ImageIndex = 2
    end
    object EditCopy: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy'
      ImageIndex = 3
    end
    object EditPaste: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste'
      ImageIndex = 4
    end
    object StudentName: TAction
      Category = 'InsertToken'
      Caption = 'Student Name'
      Hint = 'Insert Student Name token'
      ImageIndex = 5
      OnExecute = StudentNameExecute
    end
    object RoomNumber: TAction
      Category = 'InsertToken'
      Caption = 'Room Number'
      Hint = 'Insert Room Number token'
      ImageIndex = 7
      OnExecute = RoomNumberExecute
    end
    object TeacherName: TAction
      Category = 'InsertToken'
      Caption = 'Teacher Name'
      Hint = 'Insert Teacher Name token'
      ImageIndex = 6
      OnExecute = TeacherNameExecute
    end
    object ClassLevel: TAction
      Category = 'InsertToken'
      Caption = 'Class Level'
      Hint = 'Insert Class Level token'
      ImageIndex = 8
      OnExecute = ClassLevelExecute
    end
    object Childcare: TAction
      Category = 'InsertToken'
      Caption = 'Childcare Level'
      Hint = 'Insert Childcare token'
      ImageIndex = 9
      OnExecute = ChildcareExecute
    end
    object EditUndo: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 3
      ShortCut = 16474
    end
    object EditSynEditRedo: TSynEditRedo
      Category = 'Edit'
      Caption = '&Redo'
      Hint = 'Redo| Redo last action'
      ShortCut = 24666
    end
  end
end
