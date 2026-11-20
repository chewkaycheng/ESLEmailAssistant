object frmGridTest: TfrmGridTest
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'GRID TEST'
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
  object grid1: TwwDBGrid
    Left = 24
    Top = 20
    Width = 509
    Height = 189
    Selected.Strings = (
      'PERSONID'#9'20'#9'PERSONID'
      'FIRSTNAME'#9'40'#9'FIRSTNAME'
      'LASTNAME'#9'40'#9'LASTNAME'
      'EMAIL'#9'64'#9'EMAIL'
      'HOMEPHONE'#9'20'#9'HOMEPHONE'
      'HANDPHONE'#9'20'#9'HANDPHONE'
      'COUNTRYID'#9'20'#9'COUNTRYID'
      'INITUSER'#9'20'#9'INITUSER'
      'INITDATE'#9'34'#9'INITDATE'
      'USERCODE'#9'20'#9'USERCODE'
      'USERSTAMP'#9'34'#9'USERSTAMP'
      'GUID'#9'38'#9'GUID')
    IniAttributes.Delimiter = ';;'
    IniAttributes.UnicodeIniFile = False
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DataSource1
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    LineColors.DataColor = clBtnFace
  end
  object CWSDBGrid1: TCWSDBGrid
    Left = 92
    Top = 220
    Width = 489
    Height = 220
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    TabOrder = 1
    CornerRadiusF = 6.00000000000000000
  end
  object FDTableAdapter1: TFDTableAdapter
    UpdateTableName = 'PEOPLE'
    DatSTableName = 'FDMemTable1'
    SelectCommand = FDCommand1
    Left = 480
    Top = 404
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = FDTableAdapter1
    Left = 288
    Top = 404
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 200
    Top = 408
  end
  object FDCommand1: TFDCommand
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    CommandText.Strings = (
      'SELECT * FROM PEOPLE')
    Left = 384
    Top = 404
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=ConnectionDef1')
    Connected = True
    LoginPrompt = False
    Left = 488
    Top = 348
  end
end
