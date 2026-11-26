object dmMain: TdmMain
  Height = 720
  Width = 960
  PixelsPerInch = 144
  object conMain: TFDConnection
    Left = 36
    Top = 221
  end
  object lnkMain: TFDPhysFBDriverLink
    Left = 36
    Top = 24
  end
  object txMain: TFDTransaction
    Connection = conMain
    Left = 38
    Top = 125
  end
  object qryStudents: TFDQuery
    Connection = conMain
    Transaction = txMain
    Left = 32
    Top = 323
  end
  object curMain: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 137
    Top = 26
  end
  object qryCountries: TFDQuery
    Connection = conMain
    Transaction = txMain
    Left = 158
    Top = 122
  end
  object mtCountries: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'CountryName'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'Selected'
        DataType = ftBoolean
      end
      item
        Name = 'CountryId'
        DataType = ftLargeint
      end
      item
        Name = 'LanguageName'
        DataType = ftString
        Size = 32
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 158
    Top = 222
    object mtCountriesCountryName: TStringField
      DisplayLabel = 'Country Name'
      DisplayWidth = 32
      FieldName = 'CountryName'
      Size = 32
    end
    object mtCountriesSelected: TBooleanField
      DisplayWidth = 8
      FieldName = 'Selected'
    end
    object mtCountriesCountryId: TLargeintField
      DisplayWidth = 15
      FieldName = 'CountryId'
      Visible = False
    end
    object mtCountriesLanguageName: TStringField
      DisplayLabel = 'Language Name'
      DisplayWidth = 35
      FieldName = 'LanguageName'
      Visible = False
      Size = 32
    end
  end
  object dsCountries: TDataSource
    DataSet = mtCountries
    Left = 158
    Top = 330
  end
  object mtClassLevels: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 305
    Top = 224
    object mtClassLevelsCLASSLEVELNAME: TStringField
      DisplayLabel = 'Class Level'
      DisplayWidth = 32
      FieldName = 'CLASSLEVELNAME'
      Size = 32
    end
    object mtClassLevelsSELECTED: TBooleanField
      DisplayLabel = 'Selected'
      DisplayWidth = 8
      FieldName = 'SELECTED'
    end
  end
  object qryClassLevels: TFDQuery
    Connection = conMain
    Left = 308
    Top = 120
  end
  object dsClassLevels: TDataSource
    DataSet = mtClassLevels
    Left = 300
    Top = 332
  end
  object qryStudentCount: TFDQuery
    Connection = conMain
    Transaction = txMain
    Left = 32
    Top = 422
  end
end
