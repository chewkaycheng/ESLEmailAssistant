object dmMain: TdmMain
  Height = 480
  Width = 640
  object conMain: TFDConnection
    Left = 24
    Top = 147
  end
  object lnkMain: TFDPhysFBDriverLink
    Left = 24
    Top = 16
  end
  object txMain: TFDTransaction
    Connection = conMain
    Left = 25
    Top = 83
  end
  object qryStudents: TFDQuery
    Connection = conMain
    Transaction = txMain
    Left = 21
    Top = 215
  end
  object curMain: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 91
    Top = 17
  end
  object qryCountries: TFDQuery
    Connection = conMain
    Transaction = txMain
    Left = 105
    Top = 81
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
    Left = 105
    Top = 148
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
    Left = 105
    Top = 220
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
    Left = 203
    Top = 149
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
    Left = 205
    Top = 80
  end
  object dsClassLevels: TDataSource
    DataSet = mtClassLevels
    Left = 200
    Top = 221
  end
  object qryStudentCount: TFDQuery
    Connection = conMain
    Transaction = txMain
    Left = 21
    Top = 281
  end
end
