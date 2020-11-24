object DMCadCanalVendas: TDMCadCanalVendas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 523
  Top = 147
  Height = 296
  Width = 473
  object sdsCanalVendas: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CANAL_VENDAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 55
    Top = 32
    object sdsCanalVendasID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCanalVendasNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsCanalVendasINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object sdsCanalVendasID_TABPRECO: TIntegerField
      FieldName = 'ID_TABPRECO'
    end
  end
  object dspCanalVendas: TDataSetProvider
    DataSet = sdsCanalVendas
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspCanalVendasUpdateError
    Left = 128
    Top = 32
  end
  object cdsCanalVendas: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspCanalVendas'
    OnNewRecord = cdsCanalVendasNewRecord
    Left = 193
    Top = 32
    object cdsCanalVendasID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCanalVendasNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCanalVendasINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsCanalVendasID_TABPRECO: TIntegerField
      FieldName = 'ID_TABPRECO'
    end
  end
  object dsCanalVendas: TDataSource
    DataSet = cdsCanalVendas
    Left = 264
    Top = 32
  end
  object sdsTabPreco: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT P.ID, P.NOME'#13#10'FROM TAB_PRECO P'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 106
    Top = 114
  end
  object dspTabPreco: TDataSetProvider
    DataSet = sdsTabPreco
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspCanalVendasUpdateError
    Left = 179
    Top = 114
  end
  object cdsTabPreco: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspTabPreco'
    OnNewRecord = cdsCanalVendasNewRecord
    Left = 244
    Top = 114
    object cdsTabPrecoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTabPrecoNOME: TStringField
      FieldName = 'NOME'
      Size = 70
    end
  end
  object dsTabPreco: TDataSource
    DataSet = cdsTabPreco
    Left = 315
    Top = 114
  end
end
