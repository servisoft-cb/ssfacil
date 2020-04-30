object DMConsPedidoRes: TDMConsPedidoRes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 558
  Top = 234
  Height = 260
  Width = 505
  object sdsConsPedido_Det: TSQLDataSet
    CommandText = 
      'select PR.*, PED.DTEMISSAO, PED.ID_CLIENTE, CLI.NOME NOME_CLIENT' +
      'E, PROD.NOME NOME_PRODUTO'#13#10'from PEDIDO_RESERVA PR'#13#10'inner join PR' +
      'ODUTO PROD on PR.ID_PRODUTO = PROD.ID'#13#10'left join PEDIDO PED on P' +
      'R.ID_PEDIDO = PED.ID'#13#10'left join PESSOA CLI on PED.ID_CLIENTE = C' +
      'LI.CODIGO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 51
    Top = 22
  end
  object dspConsPedido_Det: TDataSetProvider
    DataSet = sdsConsPedido_Det
    Left = 86
    Top = 25
  end
  object cdsConsPedido_Det: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPedido_Det'
    Left = 128
    Top = 21
    object cdsConsPedido_DetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsPedido_DetID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConsPedido_DetITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsConsPedido_DetID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsPedido_DetID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsConsPedido_DetQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsPedido_DetID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsConsPedido_DetFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsPedido_DetTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
    object cdsConsPedido_DetDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsConsPedido_DetQTD2: TFloatField
      FieldName = 'QTD2'
    end
    object cdsConsPedido_DetDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsPedido_DetID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsConsPedido_DetNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsPedido_DetNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
  end
  object dsConsPedido_Det: TDataSource
    DataSet = cdsConsPedido_Det
    Left = 162
    Top = 23
  end
  object sdsConsProduto_Ped: TSQLDataSet
    CommandText = 'select *'#13#10'from vpedido_reserva'#13#10'where qtd > 0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 304
    Top = 25
  end
  object dspConsProduto_Ped: TDataSetProvider
    DataSet = sdsConsProduto_Ped
    Left = 339
    Top = 27
  end
  object cdsConsProduto_Ped: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsProduto_Ped'
    Left = 382
    Top = 23
    object cdsConsProduto_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsProduto_PedFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsProduto_PedID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsProduto_PedID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsConsProduto_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConsProduto_PedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsConsProduto_PedNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsProduto_PedREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsProduto_PedNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsProduto_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
  end
  object dsConsProduto_Ped: TDataSource
    DataSet = cdsConsProduto_Ped
    Left = 415
    Top = 25
  end
end
