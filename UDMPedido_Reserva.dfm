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
    Left = 36
    Top = 46
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
    Left = 76
    Top = 46
  end
  object cdsPedido_Reserva: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspPedido_Reserva'
    Left = 117
    Top = 46
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
    Left = 163
    Top = 46
  end
end
