object DMConfig_Balanca: TDMConfig_Balanca
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 499
  Top = 224
  Height = 291
  Width = 398
  object sdsConfigBalancaLay: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CONFIG_BALANCA_LAYOUT'
    DataSource = cdsMestre
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 88
    object sdsConfigBalancaLayID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsConfigBalancaLayORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
    object sdsConfigBalancaLayCAMPO: TStringField
      FieldName = 'CAMPO'
      FixedChar = True
      Size = 25
    end
    object sdsConfigBalancaLayPOSICAO: TIntegerField
      FieldName = 'POSICAO'
    end
    object sdsConfigBalancaLayTAMANHO: TIntegerField
      FieldName = 'TAMANHO'
    end
    object sdsConfigBalancaLayPENDENTE: TStringField
      FieldName = 'PENDENTE'
      FixedChar = True
      Size = 1
    end
  end
  object dsConfigBalancaLay: TDataSource
    DataSet = cdsConfigBalancaLay
    Left = 144
    Top = 88
  end
  object cdsConfigBalancaLay: TClientDataSet
    Aggregates = <>
    DataSetField = cdsConfigBalancasdsConfigBalancaLay
    Params = <>
    Left = 112
    Top = 88
    object cdsConfigBalancaLayID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConfigBalancaLayORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
      Required = True
    end
    object cdsConfigBalancaLayCAMPO: TStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      FixedChar = True
      Size = 25
    end
    object cdsConfigBalancaLayPOSICAO: TIntegerField
      DisplayLabel = 'Posi'#231#227'o'
      FieldName = 'POSICAO'
    end
    object cdsConfigBalancaLayTAMANHO: TIntegerField
      DisplayLabel = 'Tamanho'
      FieldName = 'TAMANHO'
    end
    object cdsConfigBalancaLayPENDENTE: TStringField
      DisplayLabel = 'Pendente'
      FieldName = 'PENDENTE'
      FixedChar = True
      Size = 1
    end
  end
  object sdsConfigBalanca: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CONFIG_BALANCA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 16
    object sdsConfigBalancaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsConfigBalancaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object sdsConfigBalancaDECIMAIS: TIntegerField
      FieldName = 'DECIMAIS'
    end
    object sdsConfigBalancaUSA_SEPARADOR: TStringField
      FieldName = 'USA_SEPARADOR'
      FixedChar = True
      Size = 1
    end
    object sdsConfigBalancaTIPO_SEPARADOR: TStringField
      FieldName = 'TIPO_SEPARADOR'
      FixedChar = True
      Size = 1
    end
    object sdsConfigBalancaNOMEARQ_TXT: TStringField
      FieldName = 'NOMEARQ_TXT'
      FixedChar = True
      Size = 254
    end
    object sdsConfigBalancaID_TEXT: TStringField
      FieldName = 'ID_TEXT'
      FixedChar = True
      Size = 10
    end
    object sdsConfigBalancaID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object sdsConfigBalancaID_TAMANHO: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object sdsConfigBalancaCOD_POSICAO: TIntegerField
      FieldName = 'COD_POSICAO'
    end
    object sdsConfigBalancaCOD_TAMANHO: TIntegerField
      FieldName = 'COD_TAMANHO'
    end
    object sdsConfigBalancaVLR_POSICAO: TIntegerField
      FieldName = 'VLR_POSICAO'
    end
    object sdsConfigBalancaVLR_TAMANHO: TIntegerField
      FieldName = 'VLR_TAMANHO'
    end
    object sdsConfigBalancaTIPO_PRECO: TStringField
      FieldName = 'TIPO_PRECO'
      FixedChar = True
      Size = 1
    end
  end
  object dsConfigBalanca: TDataSource
    DataSet = cdsConfigBalanca
    Left = 144
    Top = 16
  end
  object cdsConfigBalanca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigBalanca'
    Left = 112
    Top = 16
    object cdsConfigBalancaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConfigBalancaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object cdsConfigBalancaDECIMAIS: TIntegerField
      DisplayLabel = 'Decimais'
      FieldName = 'DECIMAIS'
    end
    object cdsConfigBalancaUSA_SEPARADOR: TStringField
      DisplayLabel = 'Usa Separador'
      FieldName = 'USA_SEPARADOR'
      FixedChar = True
      Size = 1
    end
    object cdsConfigBalancaTIPO_SEPARADOR: TStringField
      DisplayLabel = 'Tipo Separador'
      FieldName = 'TIPO_SEPARADOR'
      FixedChar = True
      Size = 1
    end
    object cdsConfigBalancaNOMEARQ_TXT: TStringField
      DisplayLabel = 'Nome Arq.TXT'
      FieldName = 'NOMEARQ_TXT'
      FixedChar = True
      Size = 254
    end
    object cdsConfigBalancaID_TEXT: TStringField
      DisplayLabel = 'Texto'
      FieldName = 'ID_TEXT'
      FixedChar = True
      Size = 10
    end
    object cdsConfigBalancaID_POSICAO: TIntegerField
      DisplayLabel = 'Ident. Posi'#231#227'o'
      FieldName = 'ID_POSICAO'
    end
    object cdsConfigBalancaID_TAMANHO: TIntegerField
      DisplayLabel = 'Ident.Tamanho'
      FieldName = 'ID_TAMANHO'
    end
    object cdsConfigBalancaCOD_POSICAO: TIntegerField
      DisplayLabel = 'Cod. Posi'#231#227'o'
      FieldName = 'COD_POSICAO'
    end
    object cdsConfigBalancaCOD_TAMANHO: TIntegerField
      DisplayLabel = 'Cod. Tamanho'
      FieldName = 'COD_TAMANHO'
    end
    object cdsConfigBalancaVLR_POSICAO: TIntegerField
      DisplayLabel = 'Vlr Posi'#231#227'o'
      FieldName = 'VLR_POSICAO'
    end
    object cdsConfigBalancaVLR_TAMANHO: TIntegerField
      DisplayLabel = 'Vlr Tamanho'
      FieldName = 'VLR_TAMANHO'
    end
    object cdsConfigBalancaTIPO_PRECO: TStringField
      DisplayLabel = 'Tipo Pre'#231'o'
      FieldName = 'TIPO_PRECO'
      FixedChar = True
      Size = 1
    end
    object cdsConfigBalancasdsConfigBalancaLay: TDataSetField
      FieldName = 'sdsConfigBalancaLay'
    end
  end
  object dspConfigBalanca: TDataSetProvider
    DataSet = sdsConfigBalanca
    Options = [poAllowCommandText]
    Left = 80
    Top = 16
  end
  object sdsTabelaProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select RDB$FIELD_NAME NOME_CAMPO'#13#10'from RDB$RELATION_FIELDS'#13#10'wher' +
      'e RDB$RELATION_NAME = '#39'PRODUTO'#39' '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 24
    Top = 144
  end
  object dsTabelaProduto: TDataSource
    DataSet = cdsTabelaProduto
    Left = 120
    Top = 144
  end
  object cdsTabelaProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabelaProduto'
    Left = 88
    Top = 144
    object cdsTabelaProdutoNOME_CAMPO: TStringField
      FieldName = 'NOME_CAMPO'
      FixedChar = True
      Size = 93
    end
  end
  object cdsMestre: TDataSource
    DataSet = sdsConfigBalanca
    Left = 16
    Top = 64
  end
  object dspTabelaProduto: TDataSetProvider
    DataSet = sdsTabelaProduto
    Options = [poAllowCommandText]
    Left = 56
    Top = 144
  end
end
