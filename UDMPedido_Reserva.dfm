object DMPedido_Reserva: TDMPedido_Reserva
  OldCreateOrder = False
  Left = 539
  Top = 224
  Height = 338
  Width = 349
  object sdsPedido_Reserva: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PEDIDO_RESERVA'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 88
    Top = 34
    object sdsPedido_ReservaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_ReservaID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsPedido_ReservaITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsPedido_ReservaID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsPedido_ReservaID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object sdsPedido_ReservaQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsPedido_ReservaID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object sdsPedido_ReservaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsPedido_ReservaTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
    object sdsPedido_ReservaDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsPedido_ReservaQTD2: TFloatField
      FieldName = 'QTD2'
    end
  end
  object dspPedido_Reserva: TDataSetProvider
    DataSet = sdsPedido_Reserva
    UpdateMode = upWhereKeyOnly
    Left = 128
    Top = 34
  end
  object cdsPedido_Reserva: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspPedido_Reserva'
    Left = 169
    Top = 34
    object cdsPedido_ReservaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_ReservaID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsPedido_ReservaITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsPedido_ReservaID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsPedido_ReservaID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsPedido_ReservaQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_ReservaID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsPedido_ReservaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsPedido_ReservaTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
    object cdsPedido_ReservaDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsPedido_ReservaQTD2: TFloatField
      FieldName = 'QTD2'
    end
  end
  object dsPedido_Reserva: TDataSource
    DataSet = cdsPedido_Reserva
    Left = 215
    Top = 34
  end
  object sdsPessoa: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CODIGO '#13#10'FROM PESSOA'#13#10'WHERE ID_REGIAO_VENDA = :RV1'#13#10'AND I' +
      'NATIVO = '#39'N'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RV1'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 89
    Top = 97
  end
  object dspPessoa: TDataSetProvider
    DataSet = sdsPessoa
    UpdateMode = upWhereKeyOnly
    Left = 129
    Top = 97
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspPessoa'
    Left = 170
    Top = 97
    object cdsPessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 217
    Top = 98
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID FROM PRODUTO WHERE INATIVO = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 89
    Top = 149
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    UpdateMode = upWhereKeyOnly
    Left = 129
    Top = 149
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspProduto'
    Left = 170
    Top = 149
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 217
    Top = 150
  end
end
