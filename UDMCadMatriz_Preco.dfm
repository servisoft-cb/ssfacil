object DMCadMatriz_Preco: TDMCadMatriz_Preco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 523
  Top = 147
  Height = 296
  Width = 473
  object sdsMatriz_Preco: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select M.*,'#13#10'       case TIPO_REG'#13#10'         when '#39'ACB'#39' then '#39'Aca' +
      'bamento'#39#13#10'         when '#39'RMO'#39' then '#39'Redondo/Modelado'#39#13#10'         ' +
      'when '#39'CMO'#39' then '#39'Canto Moeda'#39#13#10'         when '#39'FRS'#39' then '#39'Furos'#39#13 +
      #10'         when '#39'FRC'#39' then '#39'Furacao'#39#13#10'         else '#39#39#13#10'       en' +
      'd as DESCRICAO_TIPO,'#13#10'       case TIPO_PRECO'#13#10'         when '#39'P'#39' ' +
      'then '#39'Com Produto'#39#13#10'         when '#39'D'#39' then '#39'Direto'#39#13#10'         el' +
      'se '#39#39#13#10'       end as DESCRICAO_TIPO_PRECO,'#13#10'       case TIPO_VP'#13 +
      #10'         when '#39'V'#39' then '#39'Valor'#39#13#10'         when '#39'P'#39' then '#39'Percent' +
      'ual'#39#13#10'         else '#39#39#13#10'       end as DESCRICAO_TIPO_VP,'#13#10'      ' +
      ' case TIPO_CALCULO'#13#10'         when '#39'2'#39' then '#39'Metro Quadrado'#39#13#10'   ' +
      '      when '#39'L'#39' then '#39'Metro Linear'#39#13#10'         else '#39#39#13#10'       end' +
      ' as DESCRICAO_TIPO_CALCULO'#13#10'from MATRIZ_PRECO M  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 32
    object sdsMatriz_PrecoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsMatriz_PrecoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object sdsMatriz_PrecoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object sdsMatriz_PrecoVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object sdsMatriz_PrecoTIPO_PRECO: TStringField
      FieldName = 'TIPO_PRECO'
      FixedChar = True
      Size = 1
    end
    object sdsMatriz_PrecoTIPO_VP: TStringField
      FieldName = 'TIPO_VP'
      FixedChar = True
      Size = 1
    end
    object sdsMatriz_PrecoCALCULA_MEDIDAS: TStringField
      FieldName = 'CALCULA_MEDIDAS'
      FixedChar = True
      Size = 1
    end
    object sdsMatriz_PrecoDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 16
    end
    object sdsMatriz_PrecoDESCRICAO_TIPO_PRECO: TStringField
      FieldName = 'DESCRICAO_TIPO_PRECO'
      ProviderFlags = []
      FixedChar = True
      Size = 11
    end
    object sdsMatriz_PrecoDESCRICAO_TIPO_VP: TStringField
      FieldName = 'DESCRICAO_TIPO_VP'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object sdsMatriz_PrecoTIPO_CALCULO: TStringField
      FieldName = 'TIPO_CALCULO'
      FixedChar = True
      Size = 1
    end
    object sdsMatriz_PrecoDESCRICAO_TIPO_CALCULO: TStringField
      FieldName = 'DESCRICAO_TIPO_CALCULO'
      ProviderFlags = []
      FixedChar = True
      Size = 14
    end
  end
  object dspMatriz_Preco: TDataSetProvider
    DataSet = sdsMatriz_Preco
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspMatriz_PrecoUpdateError
    Left = 128
    Top = 32
  end
  object cdsMatriz_Preco: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspMatriz_Preco'
    Left = 192
    Top = 33
    object cdsMatriz_PrecoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMatriz_PrecoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsMatriz_PrecoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object cdsMatriz_PrecoVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
      DisplayFormat = '0.00'
    end
    object cdsMatriz_PrecoTIPO_PRECO: TStringField
      FieldName = 'TIPO_PRECO'
      FixedChar = True
      Size = 1
    end
    object cdsMatriz_PrecoTIPO_VP: TStringField
      FieldName = 'TIPO_VP'
      FixedChar = True
      Size = 1
    end
    object cdsMatriz_PrecoDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 16
    end
    object cdsMatriz_PrecoDESCRICAO_TIPO_PRECO: TStringField
      FieldName = 'DESCRICAO_TIPO_PRECO'
      ProviderFlags = []
      FixedChar = True
      Size = 11
    end
    object cdsMatriz_PrecoDESCRICAO_TIPO_VP: TStringField
      FieldName = 'DESCRICAO_TIPO_VP'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object cdsMatriz_PrecoCALCULA_MEDIDAS: TStringField
      FieldName = 'CALCULA_MEDIDAS'
      FixedChar = True
      Size = 1
    end
    object cdsMatriz_PrecoTIPO_CALCULO: TStringField
      FieldName = 'TIPO_CALCULO'
      FixedChar = True
      Size = 1
    end
    object cdsMatriz_PrecoDESCRICAO_TIPO_CALCULO: TStringField
      FieldName = 'DESCRICAO_TIPO_CALCULO'
      ProviderFlags = []
      FixedChar = True
      Size = 14
    end
  end
  object dsMatriz_Preco: TDataSource
    DataSet = cdsMatriz_Preco
    Left = 264
    Top = 32
  end
end
