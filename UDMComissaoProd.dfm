object DMComissaoProd: TDMComissaoProd
  OldCreateOrder = False
  Left = 373
  Top = 236
  Height = 372
  Width = 661
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.ID, P.REFERENCIA, P.TIPO_REG, P.NOME, P.perc_comissao'#13#10 +
      'FROM PRODUTO P'#13#10'WHERE P.inativo = '#39'N'#39#13#10'  AND P.tipo_reg = '#39'S'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 78
    Top = 20
    object sdsProdutoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsProdutoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object sdsProdutoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    UpdateMode = upWhereKeyOnly
    Left = 118
    Top = 20
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 155
    Top = 20
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProdutoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsProdutoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 192
    Top = 20
  end
  object sdsProduto_Comissao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT C.*, CLI.NOME'#13#10'FROM PRODUTO_COMISSAO C'#13#10'INNER JOIN PESSOA' +
      ' CLI'#13#10'ON C.ID_CLIENTE = CLI.CODIGO'#13#10'WHERE C.ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 208
    Top = 120
    object sdsProduto_ComissaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProduto_ComissaoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProduto_ComissaoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsProduto_ComissaoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object sdsProduto_ComissaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 60
    end
  end
  object dspProduto_Comissao: TDataSetProvider
    DataSet = sdsProduto_Comissao
    UpdateMode = upWhereKeyOnly
    Left = 242
    Top = 115
  end
  object cdsProduto_Comissao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspProduto_Comissao'
    Left = 273
    Top = 115
    object cdsProduto_ComissaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProduto_ComissaoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProduto_ComissaoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsProduto_ComissaoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = '0.00'
    end
    object cdsProduto_ComissaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 60
    end
  end
  object dsProduto_Comissao: TDataSource
    DataSet = cdsProduto_Comissao
    Left = 304
    Top = 115
  end
  object cdsProduto_Comissao_Vend: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspProduto_Comissao_Vend'
    Left = 275
    Top = 172
    object cdsProduto_Comissao_VendID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProduto_Comissao_VendITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProduto_Comissao_VendID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsProduto_Comissao_VendPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object cdsProduto_Comissao_VendNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 60
    end
  end
  object dsProduto_Comissao_Vend: TDataSource
    DataSet = cdsProduto_Comissao_Vend
    Left = 304
    Top = 173
  end
  object dspProduto_Comissao_Vend: TDataSetProvider
    DataSet = sdsProduto_Comissao_Vend
    UpdateMode = upWhereKeyOnly
    Left = 242
    Top = 173
  end
  object sdsProduto_Comissao_Vend: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT C.*, V.NOME'#13#10'FROM PRODUTO_COMISSAO_VEND C'#13#10'INNER JOIN PES' +
      'SOA V'#13#10'ON C.ID_VENDEDOR = V.CODIGO'#13#10'WHERE C.ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 208
    Top = 173
    object sdsProduto_Comissao_VendID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProduto_Comissao_VendITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProduto_Comissao_VendID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object sdsProduto_Comissao_VendPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object sdsProduto_Comissao_VendNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 60
    end
  end
  object sdsprc_Produto_Comissao: TSQLDataSet
    CommandText = 'PRC_PRODUTO_COMISSAO'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 505
    Top = 146
  end
  object sdsprc_Produto_Comissao_Dir: TSQLDataSet
    CommandText = 'PRC_PRODUTO_COMISSAO_DIR'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 507
    Top = 214
  end
  object sdsprc_Produto_Comissao_Vend: TSQLDataSet
    CommandText = 'PRC_PRODUTO_COMISSAO_VEND'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 514
    Top = 54
  end
end
