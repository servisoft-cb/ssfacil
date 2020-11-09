object DMConferencia: TDMConferencia
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 134
  Top = 49
  Height = 573
  Width = 974
  object sdsPedido_Item: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select ITE.ID, ITE.ITEM, ITE.ID_PRODUTO, ITE.REFERENCIA, ITE.NOM' +
      'EPRODUTO, ITE.QTD, ITE.QTD_FATURADO, ITE.QTD_RESTANTE,'#13#10'       I' +
      'TE.QTD_LIBERADA, QTD_CONFERIDO, DTCONFERENCIA, HRCONFERENCIA, US' +
      'UARIO_CONF, ITE.ID_COR, UNIDADE, TAMANHO,'#13#10'       VLR_UNITARIO, ' +
      'ID_PROCESSO'#13#10'from PEDIDO_ITEM ITE'#13#10'where ITE.ID = :ID and'#13#10'     ' +
      ' ITE.CANCELADO = '#39'N'#39'   '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 232
    object sdsPedido_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsPedido_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsPedido_ItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsPedido_ItemREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsPedido_ItemNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object sdsPedido_ItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsPedido_ItemQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
    object sdsPedido_ItemQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object sdsPedido_ItemQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object sdsPedido_ItemQTD_CONFERIDO: TFloatField
      FieldName = 'QTD_CONFERIDO'
    end
    object sdsPedido_ItemDTCONFERENCIA: TDateField
      FieldName = 'DTCONFERENCIA'
    end
    object sdsPedido_ItemHRCONFERENCIA: TTimeField
      FieldName = 'HRCONFERENCIA'
    end
    object sdsPedido_ItemUSUARIO_CONF: TStringField
      FieldName = 'USUARIO_CONF'
      Size = 15
    end
    object sdsPedido_ItemID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object sdsPedido_ItemUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object sdsPedido_ItemTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object sdsPedido_ItemVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object sdsPedido_ItemID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
  end
  object dspPedido_Item: TDataSetProvider
    DataSet = sdsPedido_Item
    Left = 104
    Top = 232
  end
  object cdsPedido_Item: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspPedido_Item'
    OnCalcFields = cdsPedido_ItemCalcFields
    Left = 144
    Top = 233
    object cdsPedido_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedido_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsPedido_ItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsPedido_ItemREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPedido_ItemNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsPedido_ItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_ItemQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
    object cdsPedido_ItemQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object cdsPedido_ItemQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object cdsPedido_ItemQTD_CONFERIDO: TFloatField
      FieldName = 'QTD_CONFERIDO'
    end
    object cdsPedido_ItemDTCONFERENCIA: TDateField
      FieldName = 'DTCONFERENCIA'
    end
    object cdsPedido_ItemHRCONFERENCIA: TTimeField
      FieldName = 'HRCONFERENCIA'
    end
    object cdsPedido_ItemUSUARIO_CONF: TStringField
      FieldName = 'USUARIO_CONF'
      Size = 15
    end
    object cdsPedido_ItemID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsPedido_ItemUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsPedido_ItemTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsPedido_ItemVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object cdsPedido_ItemclNome_Cor: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Cor'
      ProviderFlags = []
      Size = 60
      Calculated = True
    end
    object cdsPedido_ItemID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
  end
  object dsPedido_Item: TDataSource
    DataSet = cdsPedido_Item
    Left = 184
    Top = 232
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME'#13#10'FROM FILIAL'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 352
    object sdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 104
    Top = 352
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspFilial'
    Left = 144
    Top = 352
    object cdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 184
    Top = 352
  end
  object sdsPrc_Atualiza_Status_Ped: TSQLDataSet
    CommandText = 'PRC_ATUALIZA_STATUS_PED'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 800
    Top = 168
  end
  object mPedidoAux: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID_Pedido'
    Params = <>
    Left = 560
    Top = 112
    Data = {
      2C0000009619E0BD0100000018000000010000000000030000002C000949445F
      50656469646F04000100000000000000}
    object mPedidoAuxID_Pedido: TIntegerField
      FieldName = 'ID_Pedido'
    end
  end
  object sdsPedido: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.ID, P.num_pedido, P.pedido_cliente, P.dtemissao, P.conf' +
      'erido,'#13#10'P.id_cliente, P.faturado, CLI.nome NOME_CLIENTE, P.FILIA' +
      'L, P.CANCELADO, P.TIPO_REG, P.EMAIL_COMPRAS'#13#10'FROM PEDIDO P'#13#10'INNE' +
      'R JOIN PESSOA CLI'#13#10'ON P.id_cliente = CLI.codigo'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 184
    object sdsPedidoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object sdsPedidoPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object sdsPedidoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object sdsPedidoCONFERIDO: TStringField
      FieldName = 'CONFERIDO'
      Size = 1
    end
    object sdsPedidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsPedidoFATURADO: TStringField
      FieldName = 'FATURADO'
      FixedChar = True
      Size = 1
    end
    object sdsPedidoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object sdsPedidoFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsPedidoCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object sdsPedidoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object sdsPedidoEMAIL_COMPRAS: TStringField
      FieldName = 'EMAIL_COMPRAS'
      Size = 100
    end
  end
  object dspPedido: TDataSetProvider
    DataSet = sdsPedido
    Left = 104
    Top = 184
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido'
    Left = 144
    Top = 184
    object cdsPedidoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPedidoPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsPedidoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsPedidoCONFERIDO: TStringField
      FieldName = 'CONFERIDO'
      Size = 1
    end
    object cdsPedidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsPedidoFATURADO: TStringField
      FieldName = 'FATURADO'
      FixedChar = True
      Size = 1
    end
    object cdsPedidoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsPedidoFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsPedidoCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsPedidoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object cdsPedidoEMAIL_COMPRAS: TStringField
      FieldName = 'EMAIL_COMPRAS'
      Size = 100
    end
  end
  object dsPedido: TDataSource
    DataSet = cdsPedido
    Left = 184
    Top = 184
  end
  object sdsConferencia: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CONFERENCIA'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 72
    Top = 8
    object sdsConferenciaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsConferenciaDTINICIO: TDateField
      FieldName = 'DTINICIO'
    end
    object sdsConferenciaHRINICIO: TTimeField
      FieldName = 'HRINICIO'
    end
    object sdsConferenciaTOTAL_ITENS: TIntegerField
      FieldName = 'TOTAL_ITENS'
    end
    object sdsConferenciaTOTAL_PRODUTO_DIF: TIntegerField
      FieldName = 'TOTAL_PRODUTO_DIF'
    end
    object sdsConferenciaQTD_PRODUITO: TIntegerField
      FieldName = 'QTD_PRODUITO'
    end
    object sdsConferenciaPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object sdsConferenciaPESO_BRU: TFloatField
      FieldName = 'PESO_BRU'
    end
    object sdsConferenciaENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Size = 1
    end
    object sdsConferenciaDTENCERRADO: TDateField
      FieldName = 'DTENCERRADO'
    end
    object sdsConferenciaHRENCERRADO: TTimeField
      FieldName = 'HRENCERRADO'
    end
    object sdsConferenciaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsConferenciaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dspConferencia: TDataSetProvider
    DataSet = sdsConferencia
    UpdateMode = upWhereKeyOnly
    Left = 112
    Top = 8
  end
  object cdsConferencia: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspConferencia'
    Left = 152
    Top = 8
    object cdsConferenciaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConferenciaDTINICIO: TDateField
      FieldName = 'DTINICIO'
    end
    object cdsConferenciaHRINICIO: TTimeField
      FieldName = 'HRINICIO'
    end
    object cdsConferenciaTOTAL_ITENS: TIntegerField
      FieldName = 'TOTAL_ITENS'
    end
    object cdsConferenciaTOTAL_PRODUTO_DIF: TIntegerField
      FieldName = 'TOTAL_PRODUTO_DIF'
    end
    object cdsConferenciaQTD_PRODUITO: TIntegerField
      FieldName = 'QTD_PRODUITO'
    end
    object cdsConferenciaPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object cdsConferenciaPESO_BRU: TFloatField
      FieldName = 'PESO_BRU'
    end
    object cdsConferenciaENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Size = 1
    end
    object cdsConferenciaDTENCERRADO: TDateField
      FieldName = 'DTENCERRADO'
    end
    object cdsConferenciaHRENCERRADO: TTimeField
      FieldName = 'HRENCERRADO'
    end
    object cdsConferenciaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsConferenciaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConferenciasdsConferencia_Itens: TDataSetField
      FieldName = 'sdsConferencia_Itens'
    end
  end
  object dsConferencia: TDataSource
    DataSet = cdsConferencia
    Left = 192
    Top = 8
  end
  object dsConferencia_Mestre: TDataSource
    DataSet = sdsConferencia
    Left = 232
    Top = 32
  end
  object qConferencia: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT C.ID, C.dtinicio, C.usuario, C.encerrado'
      'FROM CONFERENCIA C'
      'WHERE C.encerrado = '#39'N'#39
      '  AND C.usuario = :USUARIO')
    SQLConnection = dmDatabase.scoDados
    Left = 720
    Top = 16
    object qConferenciaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qConferenciaDTINICIO: TDateField
      FieldName = 'DTINICIO'
    end
    object qConferenciaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object qConferenciaENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Size = 1
    end
  end
  object sdsConferencia_Itens: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM CONFERENCIA_ITENS'#13#10'WHERE ID = :ID'
    DataSource = dsConferencia_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 72
    Top = 64
    object sdsConferencia_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsConferencia_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsConferencia_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsConferencia_ItensPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object sdsConferencia_ItensPESO_BRU: TFloatField
      FieldName = 'PESO_BRU'
    end
    object sdsConferencia_ItensENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      FixedChar = True
      Size = 1
    end
    object sdsConferencia_ItensETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      FixedChar = True
      Size = 1
    end
    object sdsConferencia_ItensQTD_TIPO_PRODUTO: TIntegerField
      FieldName = 'QTD_TIPO_PRODUTO'
    end
  end
  object cdsConferencia_Itens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsConferenciasdsConferencia_Itens
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    Left = 112
    Top = 64
    object cdsConferencia_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConferencia_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConferencia_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConferencia_ItensPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object cdsConferencia_ItensPESO_BRU: TFloatField
      FieldName = 'PESO_BRU'
    end
    object cdsConferencia_ItensENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      FixedChar = True
      Size = 1
    end
    object cdsConferencia_ItensETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      FixedChar = True
      Size = 1
    end
    object cdsConferencia_ItensQTD_TIPO_PRODUTO: TIntegerField
      FieldName = 'QTD_TIPO_PRODUTO'
    end
    object cdsConferencia_ItenssdsConferencia_Ped: TDataSetField
      FieldName = 'sdsConferencia_Ped'
    end
  end
  object dsConferencia_Itens: TDataSource
    DataSet = cdsConferencia_Itens
    Left = 152
    Top = 64
  end
  object dsConferencia_Itens_Mestre: TDataSource
    DataSet = sdsConferencia_Itens
    Left = 224
    Top = 88
  end
  object cdsConferencia_Ped: TClientDataSet
    Aggregates = <>
    DataSetField = cdsConferencia_ItenssdsConferencia_Ped
    IndexFieldNames = 'ID;ITEM;ITEM_REG'
    Params = <>
    OnCalcFields = cdsConferencia_PedCalcFields
    Left = 112
    Top = 120
    object cdsConferencia_PedID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConferencia_PedITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConferencia_PedITEM_REG: TIntegerField
      FieldName = 'ITEM_REG'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConferencia_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConferencia_PedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsConferencia_PedID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConferencia_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConferencia_PedPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object cdsConferencia_PedPESO_BRU: TFloatField
      FieldName = 'PESO_BRU'
    end
    object cdsConferencia_PedENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Size = 1
    end
    object cdsConferencia_PedclNum_Pedido: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'clNum_Pedido'
      ProviderFlags = []
      Calculated = True
    end
    object cdsConferencia_PedclCodBarra: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCodBarra'
      ProviderFlags = []
      Size = 14
      Calculated = True
    end
    object cdsConferencia_PedclReferencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'clReferencia'
      Calculated = True
    end
  end
  object dsConferencia_Ped: TDataSource
    DataSet = cdsConferencia_Ped
    Left = 152
    Top = 120
  end
  object qCBarra: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'COD_BARRA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.id, P.pesoliquido, P.pesobruto, P.cod_barra'
      'FROM PRODUTO P'
      'WHERE P.cod_barra = :COD_BARRA')
    SQLConnection = dmDatabase.scoDados
    Left = 848
    Top = 15
    object qCBarraID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qCBarraPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object qCBarraPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object qCBarraCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 14
    end
  end
  object sdsConferencia_Ped: TSQLDataSet
    CommandText = 
      'SELECT CP.*'#13#10'FROM CONFERENCIA_PED CP'#13#10'WHERE CP.ID = :ID'#13#10'  AND C' +
      'P.ITEM = :ITEM'
    DataSource = dsConferencia_Itens_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 72
    Top = 120
    object sdsConferencia_PedID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsConferencia_PedITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsConferencia_PedITEM_REG: TIntegerField
      FieldName = 'ITEM_REG'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsConferencia_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsConferencia_PedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsConferencia_PedID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsConferencia_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsConferencia_PedPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object sdsConferencia_PedPESO_BRU: TFloatField
      FieldName = 'PESO_BRU'
    end
    object sdsConferencia_PedENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Size = 1
    end
  end
  object qPedido_Ver: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.num_pedido, I.referencia, I.nomeproduto, PROD.cod_barra'
      'FROM PEDIDO P'
      'INNER JOIN PEDIDO_ITEM I'
      'ON P.ID = I.id'
      'AND I.ITEM = :ITEM'
      'INNER JOIN PRODUTO PROD'
      'ON I.ID_PRODUTO = PROD.ID'
      'WHERE P.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 784
    Top = 16
    object qPedido_VerNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object qPedido_VerREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qPedido_VerNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object qPedido_VerCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 14
    end
  end
  object frxReport1: TfrxReport
    Version = '5.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42759.854971979200000000
    ReportOptions.LastChange = 42759.885930636580000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 737
    Top = 255
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 768
    Top = 255
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = SMTP
    MAPISendFlag = 0
    Left = 800
    Top = 255
  end
  object frxRichObject1: TfrxRichObject
    Left = 832
    Top = 255
  end
  object frxEtiqueta: TfrxDBDataset
    UserName = 'frxEtiqueta'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ITEM=ITEM'
      'QTD=QTD'
      'PESO_LIQ=PESO_LIQ'
      'PESO_BRU=PESO_BRU'
      'ENCERRADO=ENCERRADO'
      'ETIQUETA=ETIQUETA'
      'QTD_TIPO_PRODUTO=QTD_TIPO_PRODUTO'
      'DTINICIO=DTINICIO'
      'HRINICIO=HRINICIO'
      'USUARIO=USUARIO')
    DataSource = dsEtiqueta
    BCDToCurrency = False
    Left = 736
    Top = 304
  end
  object qQtdProd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(P.id_produto) CONTADOR'
      'FROM CONFERENCIA_PED P'
      'WHERE P.ID = :ID'
      '  AND P.ITEM = :ITEM')
    SQLConnection = dmDatabase.scoDados
    Left = 752
    Top = 16
    object qQtdProdCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object sdsEtiqueta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT I.*, C.dtinicio, C.hrinicio, C.usuario'#13#10'FROM conferencia_' +
      'itens I'#13#10'INNER JOIN conferencia C'#13#10'ON I.ID = C.ID'#13#10'WHERE I.ID = ' +
      ':ID'#13#10'  AND I.ITEM = :ITEM'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 344
    Top = 220
  end
  object dspEtiqueta: TDataSetProvider
    DataSet = sdsEtiqueta
    Left = 384
    Top = 220
  end
  object cdsEtiqueta: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEtiqueta'
    Left = 422
    Top = 220
    object cdsEtiquetaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsEtiquetaITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsEtiquetaQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsEtiquetaPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object cdsEtiquetaPESO_BRU: TFloatField
      FieldName = 'PESO_BRU'
    end
    object cdsEtiquetaENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      FixedChar = True
      Size = 1
    end
    object cdsEtiquetaETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      FixedChar = True
      Size = 1
    end
    object cdsEtiquetaQTD_TIPO_PRODUTO: TIntegerField
      FieldName = 'QTD_TIPO_PRODUTO'
    end
    object cdsEtiquetaDTINICIO: TDateField
      FieldName = 'DTINICIO'
    end
    object cdsEtiquetaHRINICIO: TTimeField
      FieldName = 'HRINICIO'
    end
    object cdsEtiquetaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
  end
  object dsEtiqueta: TDataSource
    DataSet = cdsEtiqueta
    Left = 462
    Top = 220
  end
  object sdsQtdPed: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT SUM(CP.qtd) QTD, CP.id_pedido, CP.item_pedido'#13#10'FROM confe' +
      'rencia_ped CP'#13#10'WHERE CP.ID = :ID'#13#10'GROUP BY CP.id_pedido, CP.item' +
      '_pedido'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 344
    Top = 16
  end
  object dspQtdPed: TDataSetProvider
    DataSet = sdsQtdPed
    Left = 384
    Top = 16
  end
  object cdsQtdPed: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PEDIDO;ITEM_PEDIDO'
    Params = <>
    ProviderName = 'dspQtdPed'
    Left = 422
    Top = 16
    object cdsQtdPedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsQtdPedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsQtdPedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
  end
  object dsQtdPed: TDataSource
    DataSet = cdsQtdPed
    Left = 462
    Top = 16
  end
  object sdsConsulta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT C.*'#13#10'FROM CONFERENCIA C'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 344
    Top = 64
  end
  object dspConsulta: TDataSetProvider
    DataSet = sdsConsulta
    Left = 384
    Top = 64
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 422
    Top = 64
    object cdsConsultaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsConsultaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsultaDTINICIO: TDateField
      FieldName = 'DTINICIO'
    end
    object cdsConsultaHRINICIO: TTimeField
      FieldName = 'HRINICIO'
    end
    object cdsConsultaTOTAL_ITENS: TIntegerField
      FieldName = 'TOTAL_ITENS'
    end
    object cdsConsultaTOTAL_PRODUTO_DIF: TIntegerField
      FieldName = 'TOTAL_PRODUTO_DIF'
    end
    object cdsConsultaQTD_PRODUITO: TIntegerField
      FieldName = 'QTD_PRODUITO'
    end
    object cdsConsultaPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object cdsConsultaPESO_BRU: TFloatField
      FieldName = 'PESO_BRU'
    end
    object cdsConsultaENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Size = 1
    end
    object cdsConsultaDTENCERRADO: TDateField
      FieldName = 'DTENCERRADO'
    end
    object cdsConsultaHRENCERRADO: TTimeField
      FieldName = 'HRENCERRADO'
    end
    object cdsConsultaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 462
    Top = 64
  end
  object sdsConsulta_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT I.*'#13#10'FROM CONFERENCIA_ITENS I'#13#10'WHERE I.ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 344
    Top = 112
  end
  object dspConsulta_Itens: TDataSetProvider
    DataSet = sdsConsulta_Itens
    Left = 384
    Top = 112
  end
  object cdsConsulta_Itens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Itens'
    Left = 422
    Top = 112
    object cdsConsulta_ItensID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsulta_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_ItensPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object cdsConsulta_ItensPESO_BRU: TFloatField
      FieldName = 'PESO_BRU'
    end
    object cdsConsulta_ItensENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_ItensETIQUETA: TStringField
      FieldName = 'ETIQUETA'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_ItensQTD_TIPO_PRODUTO: TIntegerField
      FieldName = 'QTD_TIPO_PRODUTO'
    end
  end
  object dsConsulta_Itens: TDataSource
    DataSet = cdsConsulta_Itens
    Left = 462
    Top = 112
  end
  object sdsConsulta_Ped: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CP.QTD, CP.item, CP.id_pedido, CP.item_pedido,'#13#10'CP.id_pro' +
      'duto, PROD.referencia, PROD.nome, PROD.cod_barra, PED.num_pedido' +
      #13#10'FROM conferencia_ped CP'#13#10'INNER JOIN PRODUTO PROD'#13#10'ON CP.id_pro' +
      'duto = PROD.ID'#13#10'INNER JOIN PEDIDO PED'#13#10'ON CP.id_pedido = PED.ID'#13 +
      #10'WHERE CP.ID = :ID'#13#10'  and cp.item = :ITEM'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 344
    Top = 163
  end
  object dspConsulta_Ped: TDataSetProvider
    DataSet = sdsConsulta_Ped
    Left = 384
    Top = 163
  end
  object cdsConsulta_Ped: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Ped'
    Left = 422
    Top = 163
    object cdsConsulta_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_PedITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsulta_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConsulta_PedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsConsulta_PedID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsulta_PedREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_PedNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsConsulta_PedCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 14
    end
    object cdsConsulta_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
  end
  object dsConsulta_Ped: TDataSource
    DataSet = cdsConsulta_Ped
    Left = 462
    Top = 163
  end
  object mImpConferencia: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Conferencia'
        DataType = ftInteger
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Qtd_Total'
        DataType = ftFloat
      end
      item
        Name = 'Total_Etiqueta'
        DataType = ftInteger
      end
      item
        Name = 'Total_Prod_Dif'
        DataType = ftInteger
      end
      item
        Name = 'Item_Etiqueta'
        DataType = ftInteger
      end
      item
        Name = 'Qtd_Total_Etiq'
        DataType = ftFloat
      end
      item
        Name = 'Total_Prod_Dif_Etiq'
        DataType = ftInteger
      end
      item
        Name = 'Num_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Item_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome_Prod'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Cod_Barra'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Qtd_Ped'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID_Conferencia;Item_Etiqueta'
    Params = <>
    StoreDefs = True
    Left = 560
    Top = 63
    Data = {
      7B0100009619E0BD01000000180000000F0000000000030000007B010E49445F
      436F6E666572656E6369610400010000000000075573756172696F0100490000
      000100055749445448020002001400095174645F546F74616C08000400000000
      000E546F74616C5F457469717565746104000100000000000E546F74616C5F50
      726F645F44696604000100000000000D4974656D5F4574697175657461040001
      00000000000E5174645F546F74616C5F45746971080004000000000013546F74
      616C5F50726F645F4469665F4574697104000100000000000A4E756D5F506564
      69646F04000100000000000B4974656D5F50656469646F04000100000000000A
      49445F50726F6475746F04000100000000000A5265666572656E636961010049
      0000000100055749445448020002001400094E6F6D655F50726F640100490000
      000100055749445448020002003C0009436F645F426172726101004900000001
      00055749445448020002001400075174645F50656404000100000000000000}
    object mImpConferenciaID_Conferencia: TIntegerField
      FieldName = 'ID_Conferencia'
    end
    object mImpConferenciaUsuario: TStringField
      FieldName = 'Usuario'
    end
    object mImpConferenciaQtd_Total: TFloatField
      FieldName = 'Qtd_Total'
    end
    object mImpConferenciaTotal_Etiqueta: TIntegerField
      FieldName = 'Total_Etiqueta'
    end
    object mImpConferenciaTotal_Prod_Dif: TIntegerField
      FieldName = 'Total_Prod_Dif'
    end
    object mImpConferenciaItem_Etiqueta: TIntegerField
      FieldName = 'Item_Etiqueta'
    end
    object mImpConferenciaQtd_Total_Etiq: TFloatField
      FieldName = 'Qtd_Total_Etiq'
    end
    object mImpConferenciaTotal_Prod_Dif_Etiq: TIntegerField
      FieldName = 'Total_Prod_Dif_Etiq'
    end
    object mImpConferenciaNum_Pedido: TIntegerField
      FieldName = 'Num_Pedido'
    end
    object mImpConferenciaItem_Pedido: TIntegerField
      FieldName = 'Item_Pedido'
    end
    object mImpConferenciaID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mImpConferenciaReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mImpConferenciaNome_Prod: TStringField
      FieldName = 'Nome_Prod'
      Size = 60
    end
    object mImpConferenciaCod_Barra: TStringField
      FieldName = 'Cod_Barra'
    end
    object mImpConferenciaQtd_Ped: TIntegerField
      FieldName = 'Qtd_Ped'
    end
  end
  object dsmImpConferencia: TDataSource
    DataSet = mImpConferencia
    Left = 592
    Top = 63
  end
  object frxImpConferencia: TfrxDBDataset
    UserName = 'frxImpConferencia'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_Conferencia=ID_Conferencia'
      'Usuario=Usuario'
      'Qtd_Total=Qtd_Total'
      'Total_Etiqueta=Total_Etiqueta'
      'Total_Prod_Dif=Total_Prod_Dif'
      'Item_Etiqueta=Item_Etiqueta'
      'Qtd_Total_Etiq=Qtd_Total_Etiq'
      'Total_Prod_Dif_Etiq=Total_Prod_Dif_Etiq'
      'Num_Pedido=Num_Pedido'
      'Item_Pedido=Item_Pedido'
      'ID_Produto=ID_Produto'
      'Referencia=Referencia'
      'Nome_Prod=Nome_Prod'
      'Cod_Barra=Cod_Barra'
      'Qtd_Ped=Qtd_Ped')
    DataSource = dsmImpConferencia
    BCDToCurrency = False
    Left = 768
    Top = 303
  end
  object qParametros_Ped: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CONFERENCIA_SIMPLES, ID_PROCESSO_FINAL'
      'FROM PARAMETROS_PED')
    SQLConnection = dmDatabase.scoDados
    Left = 816
    Top = 16
    object qParametros_PedCONFERENCIA_SIMPLES: TStringField
      FieldName = 'CONFERENCIA_SIMPLES'
      FixedChar = True
      Size = 1
    end
    object qParametros_PedID_PROCESSO_FINAL: TIntegerField
      FieldName = 'ID_PROCESSO_FINAL'
    end
  end
  object sdsPedido_Item_Tipo: TSQLDataSet
    CommandText = 
      'SELECT *'#13#10'FROM PEDIDO_ITEM_TIPO '#13#10'WHERE ID = :ID'#13#10'   AND ITEM = ' +
      ':ITEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 413
  end
  object cdsPedido_Item_Tipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido_Item_Tipo'
    Left = 147
    Top = 413
    object cdsPedido_Item_TipoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_Item_TipoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_Item_TipoCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object cdsPedido_Item_TipoLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object cdsPedido_Item_TipoALTURA: TFloatField
      FieldName = 'ALTURA'
    end
    object cdsPedido_Item_TipoVLR_KG: TFloatField
      FieldName = 'VLR_KG'
    end
    object cdsPedido_Item_TipoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_Item_TipoVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object cdsPedido_Item_TipoVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsPedido_Item_TipoDIAMETRO: TFloatField
      FieldName = 'DIAMETRO'
    end
    object cdsPedido_Item_TipoDIAMETRO_EXT: TFloatField
      FieldName = 'DIAMETRO_EXT'
    end
    object cdsPedido_Item_TipoDIAMETRO_INT: TFloatField
      FieldName = 'DIAMETRO_INT'
    end
    object cdsPedido_Item_TipoPAREDE: TFloatField
      FieldName = 'PAREDE'
    end
    object cdsPedido_Item_TipoPESO: TFloatField
      FieldName = 'PESO'
      DisplayFormat = '0.0000###'
    end
    object cdsPedido_Item_TipoCOMPLEMENTO_NOME: TStringField
      FieldName = 'COMPLEMENTO_NOME'
      Size = 50
    end
    object cdsPedido_Item_TipoTIPO_ORCAMENTO: TStringField
      FieldName = 'TIPO_ORCAMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsPedido_Item_TipoDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      Size = 12
    end
    object cdsPedido_Item_TipoID_ACABAMENTO: TIntegerField
      FieldName = 'ID_ACABAMENTO'
    end
    object cdsPedido_Item_TipoID_REDONDO_MOD: TIntegerField
      FieldName = 'ID_REDONDO_MOD'
    end
    object cdsPedido_Item_TipoID_CMOEDA: TIntegerField
      FieldName = 'ID_CMOEDA'
    end
    object cdsPedido_Item_TipoID_FUROS: TIntegerField
      FieldName = 'ID_FUROS'
    end
    object cdsPedido_Item_TipoID_FURACAO: TIntegerField
      FieldName = 'ID_FURACAO'
    end
    object cdsPedido_Item_TipoID_PERFIL: TIntegerField
      FieldName = 'ID_PERFIL'
    end
    object cdsPedido_Item_TipoID_VIDRO: TIntegerField
      FieldName = 'ID_VIDRO'
    end
    object cdsPedido_Item_TipoclNome_Acabamento: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Acabamento'
      ProviderFlags = []
      Size = 30
      Calculated = True
    end
    object cdsPedido_Item_TipoclNome_Redondo_Mod: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Redondo_Mod'
      ProviderFlags = []
      Size = 30
      Calculated = True
    end
    object cdsPedido_Item_TipoclNome_CMoeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_CMoeda'
      ProviderFlags = []
      Size = 30
      Calculated = True
    end
    object cdsPedido_Item_TipoclNome_Furos: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Furos'
      ProviderFlags = []
      Size = 30
      Calculated = True
    end
    object cdsPedido_Item_TipoclNome_Furacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Furacao'
      ProviderFlags = []
      Size = 30
      Calculated = True
    end
    object cdsPedido_Item_TipoclNome_Perfil: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Perfil'
      ProviderFlags = []
      Size = 60
      Calculated = True
    end
    object cdsPedido_Item_TipoclNome_Vidro: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Vidro'
      ProviderFlags = []
      Size = 60
      Calculated = True
    end
    object cdsPedido_Item_TipoQTD_FUROS: TIntegerField
      FieldName = 'QTD_FUROS'
    end
    object cdsPedido_Item_TipoVLR_DOBRA: TFloatField
      FieldName = 'VLR_DOBRA'
    end
    object cdsPedido_Item_TipoID_CHAPA: TIntegerField
      FieldName = 'ID_CHAPA'
    end
    object cdsPedido_Item_TipoESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
  end
  object dsPedido_Item_Tipo: TDataSource
    DataSet = cdsPedido_Item_Tipo
    Left = 186
    Top = 413
  end
  object dspPedido_Item_Tipo: TDataSetProvider
    DataSet = sdsPedido_Item_Tipo
    Left = 104
    Top = 413
  end
  object mAuxConf: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'ID_Cor'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Produto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Nome_Cor'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Qtd'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Tamanho'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 560
    Top = 15
    Data = {
      E00000009619E0BD010000001800000009000000000003000000E0000949445F
      50656469646F0400010000000000044974656D04000100000000000A49445F50
      726F6475746F04000100000000000649445F436F7204000100000000000C4E6F
      6D655F50726F6475746F0100490000000100055749445448020002006400084E
      6F6D655F436F720100490000000100055749445448020002003C000351746404
      000100000000000A5265666572656E6369610100490000000100055749445448
      0200020014000754616D616E686F010049000000010005574944544802000200
      0A000000}
    object mAuxConfID_Pedido: TIntegerField
      FieldName = 'ID_Pedido'
    end
    object mAuxConfItem: TIntegerField
      FieldName = 'Item'
    end
    object mAuxConfID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mAuxConfID_Cor: TIntegerField
      FieldName = 'ID_Cor'
    end
    object mAuxConfNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 100
    end
    object mAuxConfNome_Cor: TStringField
      FieldName = 'Nome_Cor'
      Size = 60
    end
    object mAuxConfQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object mAuxConfReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mAuxConfTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
  end
  object dsmAuxConf: TDataSource
    DataSet = mAuxConf
    Left = 592
    Top = 15
  end
  object qCombinacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ID, NOME'
      'FROM COMBINACAO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 880
    Top = 15
    object qCombinacaoID: TFMTBCDField
      FieldName = 'ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object qCombinacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object sdsPedido_Conf: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM PEDIDO_CONF'#13#10'WHERE ID = :ID'#13#10'   AND ITEM = :ITEM'#13 +
      #10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 288
    object sdsPedido_ConfID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsPedido_ConfITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsPedido_ConfITEM_CONF: TIntegerField
      FieldName = 'ITEM_CONF'
    end
    object sdsPedido_ConfQTD: TIntegerField
      FieldName = 'QTD'
    end
    object sdsPedido_ConfID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object sdsPedido_ConfDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object dspPedido_Conf: TDataSetProvider
    DataSet = sdsPedido_Conf
    Left = 104
    Top = 288
  end
  object cdsPedido_Conf: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM;ITEM_CONF'
    Params = <>
    ProviderName = 'dspPedido_Conf'
    Left = 144
    Top = 288
    object cdsPedido_ConfID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedido_ConfITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsPedido_ConfITEM_CONF: TIntegerField
      FieldName = 'ITEM_CONF'
    end
    object cdsPedido_ConfQTD: TIntegerField
      FieldName = 'QTD'
    end
    object cdsPedido_ConfID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsPedido_ConfDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object dsPedido_Conf: TDataSource
    DataSet = cdsPedido_Conf
    Left = 184
    Top = 288
  end
  object qPedidoConf: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT MAX(ITEM_CONF) ITEM_CONF'
      'FROM PEDIDO_CONF'
      'WHERE ID = :ID'
      '  AND ITEM = :ITEM')
    SQLConnection = dmDatabase.scoDados
    Left = 702
    Top = 72
    object qPedidoConfITEM_CONF: TIntegerField
      FieldName = 'ITEM_CONF'
    end
  end
  object qCBarraCor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'COD_BARRA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.id_produto , P.cod_barra, P.id_cor, P.tamanho'
      'FROM CBARRA P'
      'WHERE P.cod_barra = :COD_BARRA')
    SQLConnection = dmDatabase.scoDados
    Left = 752
    Top = 72
    object qCBarraCorCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 13
    end
    object qCBarraCorID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object qCBarraCorID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object qCBarraCorTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object sdsConsPedido_Item_Proc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT '#39'2'#39' || lpad(p.num_pedido,6,0) || lpad(i.item,3,0) COD_BAR' +
      'RA ,  p.dtemissao, p.num_pedido, i.item,'#13#10'iproc.id_processo, ipr' +
      'oc.item_processo,'#13#10'iproc.dtentrada, iproc.dtbaixa, iproc.hrentra' +
      'da, iproc.hrsaida, i.qtd, i.qtd_faturado, i.qtd_restante,'#13#10'i.dtb' +
      'aixa DTBAIXA_ITEM, i.dtconferencia, P.ID ID_PEDIDO,'#13#10'case'#13#10'  whe' +
      'n proc.usar_qtd_dobra = '#39'S'#39' then proc.nome || '#39'  Qtd: '#39' || round' +
      '(coalesce(iproc.qtd_dobra,1),0)'#13#10'  else proc.nome'#13#10'  end NOME_PR' +
      'OCESSO, PROC.ler_talao'#13#10'from pedido p'#13#10'inner join pedido_item i'#13 +
      #10'on p.id = i.id'#13#10'inner join pedido_item_processo iproc'#13#10'on i.id ' +
      '= iproc.id'#13#10'and i.item = iproc.item'#13#10'inner join processo proc'#13#10'o' +
      'n iproc.id_processo = proc.id'#13#10'where p.tipo_reg = '#39'P'#39#13#10'  AND P.N' +
      'UM_PEDIDO = :NUM_PEDIDO'#13#10'  AND I.ITEM = :ITEM'#13#10'ORDER BY IPROC.IT' +
      'EM_PROCESSO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 386
    Top = 319
  end
  object dspConsPedido_Item_Proc: TDataSetProvider
    DataSet = sdsConsPedido_Item_Proc
    Left = 429
    Top = 319
  end
  object cdsConsPedido_Item_Proc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPedido_Item_Proc'
    Left = 470
    Top = 317
    object cdsConsPedido_Item_ProcCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 10
    end
    object cdsConsPedido_Item_ProcDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsPedido_Item_ProcNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsPedido_Item_ProcITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsPedido_Item_ProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsPedido_Item_ProcITEM_PROCESSO: TIntegerField
      FieldName = 'ITEM_PROCESSO'
      Required = True
    end
    object cdsConsPedido_Item_ProcNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsPedido_Item_ProcDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsPedido_Item_ProcDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsPedido_Item_ProcHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
      DisplayFormat = 'HH:MM'
    end
    object cdsConsPedido_Item_ProcHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
      DisplayFormat = 'HH:MM'
    end
    object cdsConsPedido_Item_ProcQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsPedido_Item_ProcQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
    object cdsConsPedido_Item_ProcQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object cdsConsPedido_Item_ProcDTBAIXA_ITEM: TDateField
      FieldName = 'DTBAIXA_ITEM'
    end
    object cdsConsPedido_Item_ProcDTCONFERENCIA: TDateField
      FieldName = 'DTCONFERENCIA'
    end
    object cdsConsPedido_Item_ProcID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsConsPedido_Item_ProcLER_TALAO: TStringField
      FieldName = 'LER_TALAO'
      FixedChar = True
      Size = 1
    end
  end
  object dsConsPedido_Item_Proc: TDataSource
    DataSet = cdsConsPedido_Item_Proc
    Left = 509
    Top = 319
  end
  object sdsPedido_Item_Processo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.*'#13#10'FROM pedido_item_processo P'#13#10'where P.ID = :ID'#13#10'  AND' +
      ' P.ITEM = :ITEM'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 394
    Top = 388
    object sdsPedido_Item_ProcessoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_Item_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_Item_ProcessoITEM_PROCESSO: TIntegerField
      FieldName = 'ITEM_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_Item_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object sdsPedido_Item_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsPedido_Item_ProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsPedido_Item_ProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object sdsPedido_Item_ProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object sdsPedido_Item_ProcessoHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
  end
  object dspPedido_Item_Processo: TDataSetProvider
    DataSet = sdsPedido_Item_Processo
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspPedido_Item_ProcessoGetTableName
    Left = 435
    Top = 387
  end
  object cdsPedido_Item_Processo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM;ITEM_PROCESSO'
    Params = <>
    ProviderName = 'dspPedido_Item_Processo'
    Left = 469
    Top = 384
    object cdsPedido_Item_ProcessoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_Item_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_Item_ProcessoITEM_PROCESSO: TIntegerField
      FieldName = 'ITEM_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_Item_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsPedido_Item_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_Item_ProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsPedido_Item_ProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsPedido_Item_ProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsPedido_Item_ProcessoHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
  end
  object dsPedido_Item_Processo: TDataSource
    DataSet = cdsPedido_Item_Processo
    Left = 514
    Top = 387
  end
  object qFuncionario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_CARTAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'USUARIO_LOG'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT F.CODIGO, F.nome, F.num_cartao, f.usuario_log'
      'FROM FUNCIONARIO F'
      'WHERE F.NUM_CARTAO = :NUM_CARTAO'
      '  or (F.USUARIO_LOG = :USUARIO_LOG)'
      ''
      ''
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 819
    Top = 72
    object qFuncionarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qFuncionarioNUM_CARTAO: TIntegerField
      FieldName = 'NUM_CARTAO'
    end
    object qFuncionarioUSUARIO_LOG: TStringField
      FieldName = 'USUARIO_LOG'
      Size = 15
    end
  end
  object sdsFuncionario_Proc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select f.codigo, f.id_processo, p.nome nome_processo'#13#10'from funci' +
      'onario_proc f'#13#10'inner join processo p'#13#10'  on f.id_processo = p.id'#13 +
      #10'WHERE F.CODIGO = :CODIGO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 369
    Top = 478
  end
  object dspFuncionario_Proc: TDataSetProvider
    DataSet = sdsFuncionario_Proc
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspPedido_Item_ProcessoGetTableName
    Left = 410
    Top = 477
  end
  object cdsFuncionario_Proc: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODIGO;ID_PROCESSO'
    Params = <>
    ProviderName = 'dspFuncionario_Proc'
    Left = 448
    Top = 477
    object cdsFuncionario_ProcCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsFuncionario_ProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
      Required = True
    end
    object cdsFuncionario_ProcNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
  end
  object dsFuncionario_Proc: TDataSource
    DataSet = cdsFuncionario_Proc
    Left = 489
    Top = 477
  end
  object qPedido_Item: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select I.ID, I.ITEM, I.QTD_RESTANTE, I.QTD_FATURADO, I.DTCONFERE' +
        'NCIA, I.QTD_CANCELADO, I.QTD, TIP.COMPLEMENTO_NOME,'
      
        '       TIP.CAMINHO_ARQUIVO_PDF, TIP.COMPRIMENTO, TIP.LARGURA, TI' +
        'P.ALTURA, TIP.PESO, TIP.ESPESSURA, I.NOMEPRODUTO,'
      '       I.REFERENCIA, I.ID_PRODUTO, P.NUM_PEDIDO, P.EMAIL_COMPRAS'
      'from PEDIDO_ITEM I'
      'inner join PEDIDO P on I.ID = P.ID'
      
        'left join PEDIDO_ITEM_TIPO TIP on I.ID = TIP.ID and I.ITEM = TIP' +
        '.ITEM'
      'where P.NUM_PEDIDO = :NUM_PEDIDO and'
      '      I.ITEM = :ITEM   ')
    SQLConnection = dmDatabase.scoDados
    Left = 781
    Top = 72
    object qPedido_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qPedido_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qPedido_ItemQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object qPedido_ItemQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
    object qPedido_ItemDTCONFERENCIA: TDateField
      FieldName = 'DTCONFERENCIA'
    end
    object qPedido_ItemQTD_CANCELADO: TFloatField
      FieldName = 'QTD_CANCELADO'
    end
    object qPedido_ItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object qPedido_ItemCOMPLEMENTO_NOME: TStringField
      FieldName = 'COMPLEMENTO_NOME'
      Size = 50
    end
    object qPedido_ItemCAMINHO_ARQUIVO_PDF: TStringField
      FieldName = 'CAMINHO_ARQUIVO_PDF'
      Size = 150
    end
    object qPedido_ItemCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object qPedido_ItemLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object qPedido_ItemALTURA: TFloatField
      FieldName = 'ALTURA'
    end
    object qPedido_ItemPESO: TFloatField
      FieldName = 'PESO'
    end
    object qPedido_ItemESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object qPedido_ItemNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object qPedido_ItemREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qPedido_ItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object qPedido_ItemNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object qPedido_ItemEMAIL_COMPRAS: TStringField
      FieldName = 'EMAIL_COMPRAS'
      Size = 100
    end
  end
  object sqlProcBaixaPedidoProc: TSQLStoredProc
    NoMetadata = True
    GetMetadata = False
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P_NUM_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'R_NOME_PROCESSO'
        ParamType = ptOutput
        Size = 40
      end
      item
        DataType = ftString
        Name = 'R_CONFERIDO'
        ParamType = ptOutput
        Size = 1
      end>
    SQLConnection = dmDatabase.scoDados
    StoredProcName = 'PRC_BAIXA_PEDIDO_PROC'
    Left = 745
    Top = 425
  end
end
