object DMANP_Produto: TDMANP_Produto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 389
  Top = 187
  Height = 400
  Width = 395
  object sdsTab_CProd_ANP: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT CODIGO, DESCRICAO'#13#10'FROM tab_cprod_anp'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 105
    Top = 75
    object sdsTab_CProd_ANPCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object sdsTab_CProd_ANPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dspTab_CProd_ANP: TDataSetProvider
    DataSet = sdsTab_CProd_ANP
    UpdateMode = upWhereKeyOnly
    Left = 141
    Top = 73
  end
  object cdsTab_CProd_ANP: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODIGO'
    Params = <>
    ProviderName = 'dspTab_CProd_ANP'
    Left = 183
    Top = 77
    object cdsTab_CProd_ANPCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object cdsTab_CProd_ANPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dsTab_CProd_ANP: TDataSource
    DataSet = cdsTab_CProd_ANP
    Left = 222
    Top = 75
  end
end
