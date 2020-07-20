object dmCadRegioes: TdmCadRegioes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 392
  Top = 222
  Height = 296
  Width = 478
  object sdsRegiao_Venda: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM REGIAO_VENDA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 32
    object sdsRegiao_VendaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsRegiao_VendaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dspRegiao_Venda: TDataSetProvider
    DataSet = sdsRegiao_Venda
    OnUpdateError = dspRegiao_VendaUpdateError
    Left = 128
    Top = 32
  end
  object cdsRegiao_Venda: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspRegiao_Venda'
    Left = 192
    Top = 32
    object cdsRegiao_VendaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRegiao_VendaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsRegiao_Venda: TDataSource
    DataSet = cdsRegiao_Venda
    Left = 264
    Top = 32
  end
end
