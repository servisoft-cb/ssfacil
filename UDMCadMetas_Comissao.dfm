object DMCadMetas_Comissao: TDMCadMetas_Comissao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 536
  Top = 223
  Height = 249
  Width = 329
  object sdsMetas_Comissao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM METAS_COMISSAO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 61
    Top = 37
    object sdsMetas_ComissaoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object sdsMetas_ComissaoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      Required = True
      DisplayFormat = '0.00'
    end
  end
  object dspMetas_Comissao: TDataSetProvider
    DataSet = sdsMetas_Comissao
    Left = 97
    Top = 34
  end
  object cdsMetas_Comissao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'VALOR'
    Params = <>
    ProviderName = 'dspMetas_Comissao'
    BeforePost = cdsMetas_ComissaoBeforePost
    Left = 135
    Top = 35
    object cdsMetas_ComissaoVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '0.00'
    end
    object cdsMetas_ComissaoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      Required = True
    end
  end
  object dsMetas_Comissao: TDataSource
    DataSet = cdsMetas_Comissao
    Left = 176
    Top = 34
  end
end
