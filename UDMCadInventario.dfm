object DMCadInventario: TDMCadInventario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 234
  Top = 29
  Height = 591
  Width = 960
  object sdsInventario: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM INVENTARIO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 88
    Top = 32
    object sdsInventarioID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsInventarioDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsInventarioGERADO_ESTOQUE: TStringField
      FieldName = 'GERADO_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sdsInventarioDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object sdsInventarioHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object sdsInventarioFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsInventarioTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object sdsInventarioNUM_INVENTARIO: TIntegerField
      FieldName = 'NUM_INVENTARIO'
    end
    object sdsInventarioID_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'ID_LOCAL_ESTOQUE'
    end
  end
  object dspInventario: TDataSetProvider
    DataSet = sdsInventario
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspInventarioUpdateError
    Left = 160
    Top = 32
  end
  object cdsInventario: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspInventario'
    OnNewRecord = cdsInventarioNewRecord
    OnReconcileError = cdsInventarioReconcileError
    Left = 224
    Top = 32
    object cdsInventarioID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsInventarioDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsInventarioGERADO_ESTOQUE: TStringField
      FieldName = 'GERADO_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsInventarioHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsInventarioFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsInventarioTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioNUM_INVENTARIO: TIntegerField
      FieldName = 'NUM_INVENTARIO'
    end
    object cdsInventarioID_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'ID_LOCAL_ESTOQUE'
    end
    object cdsInventariosdsInventario_Itens: TDataSetField
      FieldName = 'sdsInventario_Itens'
    end
  end
  object dsInventario: TDataSource
    DataSet = cdsInventario
    Left = 296
    Top = 32
  end
  object dsInventario_Mestre: TDataSource
    DataSet = sdsInventario
    Left = 56
    Top = 104
  end
  object sdsInventario_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT IT.*'#13#10'FROM INVENTARIO_ITENS IT'#13#10'WHERE IT.ID = :ID'
    DataSource = dsInventario_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 96
    Top = 168
    object sdsInventario_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsInventario_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsInventario_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsInventario_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object sdsInventario_ItensQTD_ESTOQUE: TFloatField
      FieldName = 'QTD_ESTOQUE'
    end
    object sdsInventario_ItensQTD_INVENTARIO: TFloatField
      FieldName = 'QTD_INVENTARIO'
    end
    object sdsInventario_ItensQTD_AJUSTE: TFloatField
      FieldName = 'QTD_AJUSTE'
    end
    object sdsInventario_ItensTIPO_AJUSTE: TStringField
      FieldName = 'TIPO_AJUSTE'
      FixedChar = True
      Size = 1
    end
    object sdsInventario_ItensVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object sdsInventario_ItensPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object sdsInventario_ItensPERC_ICMS: TFloatField
      FieldName = 'PERC_ICMS'
    end
    object sdsInventario_ItensID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object sdsInventario_ItensID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object sdsInventario_ItensNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
  end
  object cdsInventario_Itens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsInventariosdsInventario_Itens
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    OnCalcFields = cdsInventario_ItensCalcFields
    OnNewRecord = cdsInventario_ItensNewRecord
    OnReconcileError = cdsInventario_ItensReconcileError
    Left = 192
    Top = 169
    object cdsInventario_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsInventario_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsInventario_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsInventario_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsInventario_ItensQTD_ESTOQUE: TFloatField
      FieldName = 'QTD_ESTOQUE'
    end
    object cdsInventario_ItensQTD_INVENTARIO: TFloatField
      FieldName = 'QTD_INVENTARIO'
    end
    object cdsInventario_ItensQTD_AJUSTE: TFloatField
      FieldName = 'QTD_AJUSTE'
    end
    object cdsInventario_ItensTIPO_AJUSTE: TStringField
      FieldName = 'TIPO_AJUSTE'
      FixedChar = True
      Size = 1
    end
    object cdsInventario_ItensVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object cdsInventario_ItensPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object cdsInventario_ItensPERC_ICMS: TFloatField
      FieldName = 'PERC_ICMS'
    end
    object cdsInventario_ItensID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsInventario_ItensID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsInventario_ItensUNIDADE: TStringField
      FieldKind = fkCalculated
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 6
      Calculated = True
    end
    object cdsInventario_ItensNOME_COR_COMBINACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOME_COR_COMBINACAO'
      ProviderFlags = []
      Size = 60
      Calculated = True
    end
    object cdsInventario_ItensREFERENCIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'REFERENCIA'
      ProviderFlags = []
      Calculated = True
    end
    object cdsInventario_ItensNOME: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
      Calculated = True
    end
    object cdsInventario_ItensNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
  end
  object dsInventario_Itens: TDataSource
    DataSet = cdsInventario_Itens
    Left = 264
    Top = 168
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select AUX.*,'#13#10'       CAST( (select sum(E.QTD)'#13#10'        from EST' +
      'OQUE_ATUAL E'#13#10'        where E.FILIAL = :FILIAL and'#13#10'            ' +
      '  E.ID_LOCAL_ESTOQUE = :ID_LOCAL_ESTOQUE and'#13#10'              E.ID' +
      '_PRODUTO = AUX.ID and'#13#10'              E.ID_COR = AUX.ID_COR_COMBI' +
      'NACAO and'#13#10'              E.TAMANHO = AUX.TAMANHO) AS DOUBLE prec' +
      'ision) QTD,'#13#10'       CAST( (select sum(QTD) QTD_GERAL'#13#10'        fr' +
      'om ESTOQUE_ATUAL E2'#13#10'        where E2.ID_PRODUTO = AUX.ID and'#13#10' ' +
      '             E2.ID_COR = AUX.ID_COR_COMBINACAO and'#13#10'            ' +
      '  E2.TAMANHO = AUX.TAMANHO) AS DOUBLE precision) QTD_GERAL'#13#10'from' +
      ' (select coalesce(PT.TAMANHO, '#39#39') TAMANHO, PRO.ID, PRO.REFERENCI' +
      'A, PRO.NOME, PRO.PERC_IPI, PRO.PRECO_CUSTO,'#13#10'             PRO.PR' +
      'ECO_VENDA, GR.NOME NOME_GRUPO, pro.inativo, PRO.UNIDADE, PC.NOME' +
      ' NOME_COR,'#13#10'             coalesce(PC.ID_COR_COMBINACAO, 0) ID_CO' +
      'R_COMBINACAO'#13#10'      from PRODUTO PRO'#13#10'      left join PRODUTO_TA' +
      'M PT on PRO.ID = PT.ID'#13#10'      left join PRODUTO_COMB PC on PRO.I' +
      'D = PC.ID'#13#10'      left join GRUPO GR on PRO.ID_GRUPO = GR.ID'#13#10'   ' +
      '   where PRO.INATIVO = '#39'N'#39' and'#13#10'            PRO.ESTOQUE = '#39'S'#39') A' +
      'UX'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_LOCAL_ESTOQUE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 554
    Top = 127
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 584
    Top = 128
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspProduto'
    OnCalcFields = cdsProdutoCalcFields
    Left = 625
    Top = 128
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object cdsProdutoPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object cdsProdutoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object cdsProdutoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsProdutoNOME_GRUPO: TStringField
      FieldName = 'NOME_GRUPO'
      Size = 40
    end
    object cdsProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsProdutoNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 50
    end
    object cdsProdutoID_COR_COMBINACAO: TIntegerField
      FieldName = 'ID_COR_COMBINACAO'
    end
    object cdsProdutoQTD: TFloatField
      FieldName = 'QTD'
      DisplayFormat = '0.000##'
    end
    object cdsProdutoQTD_GERAL: TFloatField
      FieldName = 'QTD_GERAL'
      DisplayFormat = '0.000##'
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 664
    Top = 128
  end
  object sdsInventario_Consulta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT I.*, LEST.COD_LOCAL, LEST.NOME NOME_LOCAL'#13#10'FROM INVENTARI' +
      'O I'#13#10'LEFT JOIN LOCAL_ESTOQUE LEST'#13#10'ON I.ID_LOCAL_ESTOQUE = LEST.' +
      'ID'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 480
    Top = 8
  end
  object dspInventario_Consulta: TDataSetProvider
    DataSet = sdsInventario_Consulta
    OnUpdateError = dspInventarioUpdateError
    Left = 552
    Top = 8
  end
  object cdsInventario_Consulta: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspInventario_Consulta'
    OnNewRecord = cdsInventarioNewRecord
    Left = 616
    Top = 8
    object cdsInventario_ConsultaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsInventario_ConsultaDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsInventario_ConsultaGERADO_ESTOQUE: TStringField
      FieldName = 'GERADO_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsInventario_ConsultaDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsInventario_ConsultaHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsInventario_ConsultaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsInventario_ConsultaTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object cdsInventario_ConsultaNUM_INVENTARIO: TIntegerField
      FieldName = 'NUM_INVENTARIO'
    end
    object cdsInventario_ConsultaID_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'ID_LOCAL_ESTOQUE'
    end
    object cdsInventario_ConsultaCOD_LOCAL: TIntegerField
      FieldName = 'COD_LOCAL'
    end
    object cdsInventario_ConsultaNOME_LOCAL: TStringField
      FieldName = 'NOME_LOCAL'
      Size = 60
    end
  end
  object dsInventario_Consulta: TDataSource
    DataSet = cdsInventario_Consulta
    Left = 688
    Top = 8
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FILIAL'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 504
    Top = 72
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 536
    Top = 72
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspFilial'
    Left = 576
    Top = 72
    object cdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsFilialNOME_INTERNO: TStringField
      FieldName = 'NOME_INTERNO'
      Size = 30
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 616
    Top = 72
  end
  object qProximo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(NUM_INVENTARIO) NUM_INVENTARIO'
      'FROM INVENTARIO')
    SQLConnection = dmDatabase.scoDados
    Left = 496
    Top = 336
    object qProximoNUM_INVENTARIO: TIntegerField
      FieldName = 'NUM_INVENTARIO'
    end
  end
  object sdsEstoque_Atual: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT E.filial, E.id_produto, E.id_cor, E.tamanho, E.id_local_e' +
      'stoque, E.qtd,'#13#10' (SELECT SUM(QTD) QTD_GERAL FROM ESTOQUE_ATUAL E' +
      '2'#13#10'      WHERE E2.id_produto = E.id_produto'#13#10'        AND E2.id_c' +
      'or = E.id_cor'#13#10'        AND E2.tamanho = E.tamanho),'#13#10' (SELECT SU' +
      'M(coalesce(R.QTD,0)) QTD_RESERVA FROM ESTOQUE_RES R'#13#10'      WHERE' +
      ' R.FILIAL = E.FILIAL'#13#10'        AND R.id_produto = E.id_produto'#13#10' ' +
      '       AND R.id_cor = E.id_cor'#13#10'        AND R.tamanho = E.tamanh' +
      'o) QTD_RESERVA'#13#10'FROM ESTOQUE_ATUAL E'#13#10'WHERE E.FILIAL = :FILIAL'#13#10 +
      '  AND E.ID_LOCAL_ESTOQUE = :ID_LOCAL_ESTOQUE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_LOCAL_ESTOQUE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 472
    Top = 400
  end
  object dspEstoque_Atual: TDataSetProvider
    DataSet = sdsEstoque_Atual
    Left = 504
    Top = 400
  end
  object cdsEstoque_Atual: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PRODUTO;TAMANHO;ID_COR'
    Params = <>
    ProviderName = 'dspEstoque_Atual'
    Left = 544
    Top = 400
    object cdsEstoque_AtualFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdsEstoque_AtualID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsEstoque_AtualID_COR: TIntegerField
      FieldName = 'ID_COR'
      Required = True
    end
    object cdsEstoque_AtualTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Required = True
      Size = 10
    end
    object cdsEstoque_AtualQTD: TFMTBCDField
      FieldName = 'QTD'
      Precision = 15
      Size = 6
    end
    object cdsEstoque_AtualID_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'ID_LOCAL_ESTOQUE'
      Required = True
    end
    object cdsEstoque_AtualQTD_GERAL: TFMTBCDField
      FieldName = 'QTD_GERAL'
      Precision = 15
      Size = 6
    end
    object cdsEstoque_AtualQTD_RESERVA: TFloatField
      FieldName = 'QTD_RESERVA'
    end
  end
  object dsEstoque_Atual: TDataSource
    DataSet = cdsEstoque_Atual
    Left = 584
    Top = 400
  end
  object mExcluir: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 264
    Data = {
      270000009619E0BD010000001800000001000000000003000000270004497465
      6D04000100000000000000}
    object mExcluirItem: TIntegerField
      FieldName = 'Item'
    end
  end
  object qParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT INFORMAR_COR_MATERIAL, INFORMAR_COR_PROD, INV_TRAZER_QTD_' +
        'ZERADA, '
      'USA_LOCAL_ESTOQUE, USA_LOTE_CONTROLE'
      'FROM PARAMETROS')
    SQLConnection = dmDatabase.scoDados
    Left = 384
    Top = 176
    object qParametrosINFORMAR_COR_MATERIAL: TStringField
      FieldName = 'INFORMAR_COR_MATERIAL'
      FixedChar = True
      Size = 1
    end
    object qParametrosINFORMAR_COR_PROD: TStringField
      FieldName = 'INFORMAR_COR_PROD'
      FixedChar = True
      Size = 1
    end
    object qParametrosINV_TRAZER_QTD_ZERADA: TStringField
      FieldName = 'INV_TRAZER_QTD_ZERADA'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_LOCAL_ESTOQUE: TStringField
      FieldName = 'USA_LOCAL_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_LOTE_CONTROLE: TStringField
      FieldName = 'USA_LOTE_CONTROLE'
      FixedChar = True
      Size = 1
    end
  end
  object sdsLocal_Estoque: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM LOCAL_ESTOQUE'#13#10'WHERE INATIVO = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 488
    Top = 256
  end
  object dspLocal_Estoque: TDataSetProvider
    DataSet = sdsLocal_Estoque
    Left = 528
    Top = 256
  end
  object cdsLocal_Estoque: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspLocal_Estoque'
    Left = 568
    Top = 256
    object cdsLocal_EstoqueID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLocal_EstoqueCOD_LOCAL: TIntegerField
      FieldName = 'COD_LOCAL'
    end
    object cdsLocal_EstoqueNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsLocal_EstoqueENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsLocal_EstoqueNUM_ENDERECO: TStringField
      FieldName = 'NUM_ENDERECO'
      Size = 15
    end
    object cdsLocal_EstoqueID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
    end
    object cdsLocal_EstoqueUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsLocal_EstoqueBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsLocal_EstoqueCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsLocal_EstoquePRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      FixedChar = True
      Size = 1
    end
    object cdsLocal_EstoqueINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dsLocal_Estoque: TDataSource
    DataSet = cdsLocal_Estoque
    Left = 608
    Top = 256
  end
  object qProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT NOME, REFERENCIA, UNIDADE, ID, PRECO_CUSTO, TIPO_REG'
      'FROM PRODUTO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 298
    Top = 312
    object qProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object qProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProdutoPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object qProdutoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
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
      'SELECT NOME'
      'FROM COMBINACAO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 296
    Top = 368
    object qCombinacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object sdsEstMov: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT SUM(E.qtd2) QTD , E.ID_PRODUTO,'#13#10'CASE'#13#10'  WHEN E.ID_COR IS' +
      ' NULL THEN 0'#13#10'  ELSE E.ID_COR'#13#10'  END ID_COR,'#13#10'CASE'#13#10'  WHEN E.TAM' +
      'ANHO IS NULL THEN '#39#39#13#10'  ELSE E.TAMANHO'#13#10'  END TAMANHO'#13#10'FROM esto' +
      'que_mov  E'#13#10'WHERE E.filial = :FILIAL'#13#10'  AND E.id_local_estoque =' +
      ' :ID_LOCAL_ESTOQUE'#13#10'  AND E.dtmovimento <= :DATA'#13#10'GROUP BY E.ID_' +
      'PRODUTO, id_cor, tamanho'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_LOCAL_ESTOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 480
    Top = 456
  end
  object dspEstMov: TDataSetProvider
    DataSet = sdsEstMov
    Left = 512
    Top = 456
  end
  object cdsEstMov: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PRODUTO;TAMANHO;ID_COR'
    Params = <>
    ProviderName = 'dspEstMov'
    Left = 552
    Top = 456
    object cdsEstMovQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsEstMovID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsEstMovID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsEstMovTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object dsEstMov: TDataSource
    DataSet = cdsEstMov
    Left = 592
    Top = 456
  end
  object qParametros_Est: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT INVENTARIO_ESTMOV'
      'FROM PARAMETROS_EST')
    SQLConnection = dmDatabase.scoDados
    Left = 384
    Top = 224
    object qParametros_EstINVENTARIO_ESTMOV: TStringField
      FieldName = 'INVENTARIO_ESTMOV'
      FixedChar = True
      Size = 1
    end
  end
  object qProd2: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT NOME, REFERENCIA, UNIDADE, ID, PRECO_CUSTO, TIPO_REG'
      'FROM PRODUTO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 335
    Top = 312
    object qProd2NOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qProd2REFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qProd2UNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object qProd2ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProd2PRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object qProd2TIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
  end
  object SPBuscarProdInventario: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_LOCAL_ESTOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COR_COMBINACAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    StoredProcName = 'PRC_BUSCA_PRODUTO_INVETARIO'
    Left = 644
    Top = 336
  end
  object sdsEstoque_Lote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT E.filial, E.id_produto, E.id_cor, E.num_lote_controle, E.' +
      'qtd,'#13#10'P.NOME NOME_PRODUTO, P.REFERENCIA, p.preco_custo, p.preco_' +
      'venda, p.UNIDADE,'#13#10'P.perc_ipi'#13#10'FROM estoque_lote e'#13#10'INNER JOIN P' +
      'RODUTO P'#13#10'ON E.ID_PRODUTO = P.ID'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 552
    Top = 176
  end
  object dspEstoque_Lote: TDataSetProvider
    DataSet = sdsEstoque_Lote
    Left = 584
    Top = 176
  end
  object cdsEstoque_Lote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoque_Lote'
    OnCalcFields = cdsProdutoCalcFields
    Left = 623
    Top = 176
    object cdsEstoque_LoteFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdsEstoque_LoteID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsEstoque_LoteID_COR: TIntegerField
      FieldName = 'ID_COR'
      Required = True
    end
    object cdsEstoque_LoteNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
      Required = True
    end
    object cdsEstoque_LoteQTD: TFMTBCDField
      FieldName = 'QTD'
      DisplayFormat = '0.0000'
      Precision = 15
      Size = 8
    end
    object cdsEstoque_LoteNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsEstoque_LoteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsEstoque_LotePRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object cdsEstoque_LotePRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object cdsEstoque_LoteUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsEstoque_LotePERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
  end
  object dsEstoque_Lote: TDataSource
    DataSet = cdsEstoque_Lote
    Left = 664
    Top = 176
  end
  object qProd3: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ID FROM PRODUTO')
    SQLConnection = dmDatabase.scoDados
    Left = 375
    Top = 312
    object qProd3ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
  object mNaoGravados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'ID_Cor'
        DataType = ftInteger
      end
      item
        Name = 'Tamanho'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'Num_Inventario'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 749
    Top = 454
    Data = {
      7C0000009619E0BD0100000018000000050000000000030000007C000A49445F
      50726F6475746F04000100000000000649445F436F7204000100000000000754
      616D616E686F0100490000000100055749445448020002000A00044461746104
      000600000000000E4E756D5F496E76656E746172696F04000100000000000000}
    object mNaoGravadosID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mNaoGravadosID_Cor: TIntegerField
      FieldName = 'ID_Cor'
    end
    object mNaoGravadosTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mNaoGravadosData: TDateField
      FieldName = 'Data'
    end
    object mNaoGravadosNum_Inventario: TIntegerField
      FieldName = 'Num_Inventario'
    end
  end
  object dsmNaoGravados: TDataSource
    DataSet = mNaoGravados
    Left = 794
    Top = 453
  end
  object mAuxInventario: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 103
    Top = 450
    Data = {
      B60000009619E0BD010000001800000007000000000003000000B60002494404
      0001000000000008436F64426172726101004900000001000557494454480200
      02000E000A5265666572656E6369610100490000000100055749445448020002
      0014000351746408000400000000000B507265636F5F437573746F0800040000
      0000000B507265636F5F56656E646108000400000000000C4E6F6D655F50726F
      6475746F0100490000000100055749445448020002003C000000}
    object mAuxInventarioID: TIntegerField
      FieldName = 'ID'
    end
    object mAuxInventarioCodBarra: TStringField
      FieldName = 'CodBarra'
      Size = 14
    end
    object mAuxInventarioReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mAuxInventarioQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mAuxInventarioPreco_Custo: TFloatField
      FieldName = 'Preco_Custo'
    end
    object mAuxInventarioPreco_Venda: TFloatField
      FieldName = 'Preco_Venda'
    end
    object mAuxInventarioNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 60
    end
  end
  object dsmAuxInventario: TDataSource
    DataSet = mAuxInventario
    Left = 152
    Top = 451
  end
  object mAuxErro: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Obs'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Cod_Barra'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 99
    Top = 319
    Data = {
      960000009619E0BD010000001800000005000000000003000000960006436F64
      69676F0100490000000100055749445448020002002800034F62730100490000
      00010005574944544802000200C80009436F645F426172726101004900000001
      000557494454480200020014000351746408000400000000000A526566657265
      6E63696101004900000001000557494454480200020014000000}
    object mAuxErroCodigo: TStringField
      FieldName = 'Codigo'
      Size = 40
    end
    object mAuxErroObs: TStringField
      FieldName = 'Obs'
      Size = 200
    end
    object mAuxErroCod_Barra: TStringField
      FieldName = 'Cod_Barra'
    end
    object mAuxErroQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mAuxErroReferencia: TStringField
      FieldName = 'Referencia'
    end
  end
  object dsmAuxErro: TDataSource
    DataSet = mAuxErro
    Left = 136
    Top = 320
  end
  object mAuxErroLinha: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Linha'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Numero_Linha'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 101
    Top = 368
    Data = {
      490000009619E0BD0100000018000000020000000000030000004900054C696E
      6861010049000000010005574944544802000200FA000C4E756D65726F5F4C69
      6E686104000100000000000000}
    object mAuxErroLinhaLinha: TStringField
      FieldName = 'Linha'
      Size = 250
    end
    object mAuxErroLinhaNumero_Linha: TIntegerField
      FieldName = 'Numero_Linha'
    end
  end
  object dsmAuxErroLinha: TDataSource
    DataSet = mAuxErroLinha
    Left = 144
    Top = 370
  end
end
