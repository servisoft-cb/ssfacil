object DMConsPedidoProc: TDMConsPedidoProc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 402
  Top = 171
  Height = 419
  Width = 576
  object sdsConsPedidoProc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select PC.ID, PC.ITEM, PC.ITEM_PROCESSO, PC.ID_PROCESSO, I.ID_PR' +
      'ODUTO, I.REFERENCIA, I.NOMEPRODUTO, I.QTD,'#13#10'       I.QTD_RESTANT' +
      'E, I.QTD_FATURADO, PT.COMPRIMENTO, PT.LARGURA, PT.ESPESSURA, PT.' +
      'ALTURA, PT.DIAMETRO,'#13#10'       PT.COMPLEMENTO_NOME, PT.TIPO_MAT, P' +
      'T.TIPO_ORCAMENTO, P.NUM_PEDIDO, P.ID_CLIENTE, P.DTEMISSAO, I.VLR' +
      '_UNITARIO,'#13#10'       I.VLR_TOTAL, CLI.NOME NOME_CLIENTE,'#13#10'       c' +
      'ase'#13#10'         when PR.USAR_QTD_DOBRA = '#39'S'#39' then PR.NOME || '#39' Qtd' +
      '.: '#39' || round(coalesce(PC.QTD_DOBRA, 1), 0)'#13#10'         else PR.NO' +
      'ME'#13#10'       end NOME_PROCESSO'#13#10'from PEDIDO_ITEM_PROCESSO PC'#13#10'inne' +
      'r join PEDIDO_ITEM I on PC.ID = I.ID and PC.ITEM = I.ITEM'#13#10'inner' +
      ' join PEDIDO_ITEM_TIPO PT on PC.ID = PT.ID and PC.ITEM = PT.ITEM' +
      #13#10'inner join PEDIDO P on PC.ID = P.ID'#13#10'inner join PROCESSO PR on' +
      ' PC.ID_PROCESSO = PR.ID'#13#10'left join PESSOA CLI on P.ID_CLIENTE = ' +
      'CLI.CODIGO'#13#10'WHERE P.cancelado = '#39'N'#39#13#10'  AND I.cancelado = '#39'N'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 74
    Top = 49
  end
  object dspConsPedidoProc: TDataSetProvider
    DataSet = sdsConsPedidoProc
    Left = 118
    Top = 49
  end
  object cdsConsPedidoProc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPedidoProc'
    Left = 160
    Top = 49
    object cdsConsPedidoProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsPedidoProcITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsPedidoProcITEM_PROCESSO: TIntegerField
      FieldName = 'ITEM_PROCESSO'
      Required = True
    end
    object cdsConsPedidoProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsPedidoProcID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsPedidoProcREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsPedidoProcNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsConsPedidoProcQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsPedidoProcQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object cdsConsPedidoProcQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
    object cdsConsPedidoProcCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object cdsConsPedidoProcLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object cdsConsPedidoProcESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object cdsConsPedidoProcALTURA: TFloatField
      FieldName = 'ALTURA'
    end
    object cdsConsPedidoProcDIAMETRO: TFloatField
      FieldName = 'DIAMETRO'
    end
    object cdsConsPedidoProcCOMPLEMENTO_NOME: TStringField
      FieldName = 'COMPLEMENTO_NOME'
      Size = 50
    end
    object cdsConsPedidoProcTIPO_MAT: TStringField
      FieldName = 'TIPO_MAT'
      FixedChar = True
      Size = 1
    end
    object cdsConsPedidoProcTIPO_ORCAMENTO: TStringField
      FieldName = 'TIPO_ORCAMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsConsPedidoProcNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsPedidoProcID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsConsPedidoProcDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsPedidoProcVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object cdsConsPedidoProcVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsConsPedidoProcNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsPedidoProcNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 48
    end
  end
  object dsConsPedidoProc: TDataSource
    DataSet = cdsConsPedidoProc
    Left = 200
    Top = 49
  end
  object sdsConsPedido: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PED.ID, PED.num_pedido, PED.dtemissao, PED.id_cliente,'#13#10'C' +
      'LI.NOME NOME_CLIENTE, PED.dtentrega, PED.faturado, '#13#10'PED.usuario' +
      ', PED.id_vendedor, VEND.NOME NOME_VENDEDOR,'#13#10'(select count(1) fr' +
      'om pedido_item where id = ped.id and cancelado = '#39'N'#39')  contador_' +
      'itens,'#13#10#13#10'(select count(1) from pedido_item i2 where id = ped.id' +
      #13#10'   and i2.status_producao = '#39'1'#39' and cancelado = '#39'N'#39') contador_' +
      'iniciado,'#13#10'(select count(1) from pedido_item i2 where id = ped.i' +
      'd'#13#10'   and i2.status_producao = '#39'2'#39' and cancelado = '#39'N'#39') contador' +
      '_encerrado,'#13#10#13#10' cast((select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO' +
      ' IPROC'#13#10'inner join processo pp on iproc.id_processo = pp.id'#13#10'inn' +
      'er join pedido_item i2 on iproc.id = i2.id and iproc.item = i2.i' +
      'tem'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.ordem_mapa = 1 and i2' +
      '.cancelado = '#39'N'#39') AS INTEGER) PROCESSO_01,'#13#10' cast((select count(' +
      '1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join processo pp on i' +
      'proc.id_processo = pp.id'#13#10'inner join pedido_item i2 on iproc.id ' +
      '= i2.id and iproc.item = i2.item'#13#10'where IPROC.ID = PED.ID and'#13#10' ' +
      '     pp.ordem_mapa = 1 and i2.cancelado = '#39'N'#39#13#10'      and iproc.d' +
      'tbaixa is not null) AS INTEGER) PROCESSO_01_A,'#13#10#13#10' cast((select ' +
      'count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join processo p' +
      'p on iproc.id_processo = pp.id'#13#10'inner join pedido_item i2 on ipr' +
      'oc.id = i2.id and iproc.item = i2.item'#13#10'where IPROC.ID = PED.ID ' +
      'and'#13#10'      pp.ordem_mapa = 2 and i2.cancelado = '#39'N'#39') AS INTEGER)' +
      ' PROCESSO_02,'#13#10' cast((select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO' +
      ' IPROC'#13#10'inner join processo pp on iproc.id_processo = pp.id'#13#10'inn' +
      'er join pedido_item i2 on iproc.id = i2.id and iproc.item = i2.i' +
      'tem'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.ordem_mapa = 2 and i2' +
      '.cancelado = '#39'N'#39#13#10'      and iproc.dtbaixa is not null) AS INTEGE' +
      'R)PROCESSO_02_A,'#13#10#13#10' cast((select count(1)'#13#10'from PEDIDO_ITEM_PRO' +
      'CESSO IPROC'#13#10'inner join processo pp on iproc.id_processo = pp.id' +
      #13#10'inner join pedido_item i2 on iproc.id = i2.id and iproc.item =' +
      ' i2.item'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.ordem_mapa = 3 a' +
      'nd i2.cancelado = '#39'N'#39') AS INTEGER) PROCESSO_03,'#13#10' cast((select c' +
      'ount(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join processo pp' +
      ' on iproc.id_processo = pp.id'#13#10'inner join pedido_item i2 on ipro' +
      'c.id = i2.id and iproc.item = i2.item'#13#10'where IPROC.ID = PED.ID a' +
      'nd'#13#10'      pp.ordem_mapa = 3 and i2.cancelado = '#39'N'#39#13#10'      and ip' +
      'roc.dtbaixa is not null) AS INTEGER)PROCESSO_03_A,'#13#10#13#10' cast((sel' +
      'ect count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join proces' +
      'so pp on iproc.id_processo = pp.id'#13#10'inner join pedido_item i2 on' +
      ' iproc.id = i2.id and iproc.item = i2.item'#13#10'where IPROC.ID = PED' +
      '.ID and'#13#10'      pp.ordem_mapa = 4 and i2.cancelado = '#39'N'#39') AS INTE' +
      'GER) PROCESSO_04,'#13#10' cast((select count(1)'#13#10'from PEDIDO_ITEM_PROC' +
      'ESSO IPROC'#13#10'inner join processo pp on iproc.id_processo = pp.id'#13 +
      #10'inner join pedido_item i2 on iproc.id = i2.id and iproc.item = ' +
      'i2.item'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.ordem_mapa = 4 an' +
      'd i2.cancelado = '#39'N'#39#13#10'      and iproc.dtbaixa is not null) AS IN' +
      'TEGER)PROCESSO_04_A,'#13#10#13#10' cast((select count(1)'#13#10'from PEDIDO_ITEM' +
      '_PROCESSO IPROC'#13#10'inner join processo pp on iproc.id_processo = p' +
      'p.id'#13#10'inner join pedido_item i2 on iproc.id = i2.id and iproc.it' +
      'em = i2.item'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.ordem_mapa =' +
      ' 5 and i2.cancelado = '#39'N'#39') AS INTEGER) PROCESSO_05,'#13#10' cast((sele' +
      'ct count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join process' +
      'o pp on iproc.id_processo = pp.id'#13#10'inner join pedido_item i2 on ' +
      'iproc.id = i2.id and iproc.item = i2.item'#13#10'where IPROC.ID = PED.' +
      'ID and'#13#10'      pp.ordem_mapa = 5 and i2.cancelado = '#39'N'#39#13#10'      an' +
      'd iproc.dtbaixa is not null) AS INTEGER)PROCESSO_05_A,'#13#10#13#10' cast(' +
      '(select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join pr' +
      'ocesso pp on iproc.id_processo = pp.id'#13#10'inner join pedido_item i' +
      '2 on iproc.id = i2.id and iproc.item = i2.item'#13#10'where IPROC.ID =' +
      ' PED.ID and'#13#10'      pp.ordem_mapa = 6 and i2.cancelado = '#39'N'#39') AS ' +
      'INTEGER) PROCESSO_06,'#13#10' cast((select count(1)'#13#10'from PEDIDO_ITEM_' +
      'PROCESSO IPROC'#13#10'inner join processo pp on iproc.id_processo = pp' +
      '.id'#13#10'inner join pedido_item i2 on iproc.id = i2.id and iproc.ite' +
      'm = i2.item'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.ordem_mapa = ' +
      '6 and i2.cancelado = '#39'N'#39#13#10'      and iproc.dtbaixa is not null) A' +
      'S INTEGER)PROCESSO_06_A,'#13#10#13#10' cast((select count(1)'#13#10'from PEDIDO_' +
      'ITEM_PROCESSO IPROC'#13#10'inner join processo pp on iproc.id_processo' +
      ' = pp.id'#13#10'inner join pedido_item i2 on iproc.id = i2.id and ipro' +
      'c.item = i2.item'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.ordem_ma' +
      'pa = 7 and i2.cancelado = '#39'N'#39') AS INTEGER) PROCESSO_07,'#13#10' cast((' +
      'select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join pro' +
      'cesso pp on iproc.id_processo = pp.id'#13#10'inner join pedido_item i2' +
      ' on iproc.id = i2.id and iproc.item = i2.item'#13#10'where IPROC.ID = ' +
      'PED.ID and'#13#10'      pp.ordem_mapa = 7 and i2.cancelado = '#39'N'#39#13#10'    ' +
      '  and iproc.dtbaixa is not null) AS INTEGER)PROCESSO_07_A,'#13#10#13#10' c' +
      'ast((select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner joi' +
      'n processo pp on iproc.id_processo = pp.id'#13#10'inner join pedido_it' +
      'em i2 on iproc.id = i2.id and iproc.item = i2.item'#13#10'where IPROC.' +
      'ID = PED.ID and'#13#10'      pp.ordem_mapa = 8 and i2.cancelado = '#39'N'#39')' +
      ' AS INTEGER) PROCESSO_08,'#13#10' cast((select count(1)'#13#10'from PEDIDO_I' +
      'TEM_PROCESSO IPROC'#13#10'inner join processo pp on iproc.id_processo ' +
      '= pp.id'#13#10'inner join pedido_item i2 on iproc.id = i2.id and iproc' +
      '.item = i2.item'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.ordem_map' +
      'a = 8 and i2.cancelado = '#39'N'#39#13#10'      and iproc.dtbaixa is not nul' +
      'l) AS INTEGER)PROCESSO_08_A,'#13#10#13#10' cast((select count(1)'#13#10'from PED' +
      'IDO_ITEM_PROCESSO IPROC'#13#10'inner join processo pp on iproc.id_proc' +
      'esso = pp.id'#13#10'inner join pedido_item i2 on iproc.id = i2.id and ' +
      'iproc.item = i2.item'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.orde' +
      'm_mapa = 9 and i2.cancelado = '#39'N'#39') AS INTEGER) PROCESSO_09,'#13#10' ca' +
      'st((select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join' +
      ' processo pp on iproc.id_processo = pp.id'#13#10'inner join pedido_ite' +
      'm i2 on iproc.id = i2.id and iproc.item = i2.item'#13#10'where IPROC.I' +
      'D = PED.ID and'#13#10'      pp.ordem_mapa = 9 and i2.cancelado = '#39'N'#39#13#10 +
      '      and iproc.dtbaixa is not null) AS INTEGER)PROCESSO_09_A,'#13#10 +
      #13#10' cast((select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner' +
      ' join processo pp on iproc.id_processo = pp.id'#13#10'inner join pedid' +
      'o_item i2 on iproc.id = i2.id and iproc.item = i2.item'#13#10'where IP' +
      'ROC.ID = PED.ID and'#13#10'      pp.ordem_mapa = 10 and i2.cancelado =' +
      ' '#39'N'#39') AS INTEGER) PROCESSO_10,'#13#10' cast((select count(1)'#13#10'from PED' +
      'IDO_ITEM_PROCESSO IPROC'#13#10'inner join processo pp on iproc.id_proc' +
      'esso = pp.id'#13#10'inner join pedido_item i2 on iproc.id = i2.id and ' +
      'iproc.item = i2.item'#13#10'where IPROC.ID = PED.ID and'#13#10'      pp.orde' +
      'm_mapa = 10 and i2.cancelado = '#39'N'#39#13#10'      and iproc.dtbaixa is n' +
      'ot null) AS INTEGER)PROCESSO_10_A'#13#10#13#10'FROM pedido PED'#13#10'INNER JOIN' +
      ' PESSOA CLI'#13#10'ON PED.ID_CLIENTE = CLI.CODIGO'#13#10'LEFT JOIN PESSOA VE' +
      'ND'#13#10'ON PED.id_vendedor = VEND.CODIGO'#13#10'WHERE ped.tipo_reg = '#39'P'#39#13#10 +
      '  AND PED.cancelado = '#39'N'#39#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 76
    Top = 121
  end
  object dspConsPedido: TDataSetProvider
    DataSet = sdsConsPedido
    Left = 120
    Top = 121
  end
  object cdsConsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPedido'
    Left = 162
    Top = 122
    object cdsConsPedidoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsPedidoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsPedidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsConsPedidoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsPedidoDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsPedidoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsConsPedidoID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsConsPedidoNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 60
    end
    object cdsConsPedidoCONTADOR_ITENS: TIntegerField
      FieldName = 'CONTADOR_ITENS'
    end
    object cdsConsPedidoCONTADOR_INICIADO: TIntegerField
      FieldName = 'CONTADOR_INICIADO'
    end
    object cdsConsPedidoCONTADOR_ENCERRADO: TIntegerField
      FieldName = 'CONTADOR_ENCERRADO'
    end
    object cdsConsPedidoPROCESSO_01: TIntegerField
      FieldName = 'PROCESSO_01'
    end
    object cdsConsPedidoPROCESSO_02: TIntegerField
      FieldName = 'PROCESSO_02'
    end
    object cdsConsPedidoPROCESSO_03: TIntegerField
      FieldName = 'PROCESSO_03'
    end
    object cdsConsPedidoPROCESSO_04: TIntegerField
      FieldName = 'PROCESSO_04'
    end
    object cdsConsPedidoPROCESSO_05: TIntegerField
      FieldName = 'PROCESSO_05'
    end
    object cdsConsPedidoPROCESSO_06: TIntegerField
      FieldName = 'PROCESSO_06'
    end
    object cdsConsPedidoPROCESSO_07: TIntegerField
      FieldName = 'PROCESSO_07'
    end
    object cdsConsPedidoPROCESSO_08: TIntegerField
      FieldName = 'PROCESSO_08'
    end
    object cdsConsPedidoPROCESSO_09: TIntegerField
      FieldName = 'PROCESSO_09'
    end
    object cdsConsPedidoPROCESSO_10: TIntegerField
      FieldName = 'PROCESSO_10'
    end
    object cdsConsPedidoPROCESSO_01_A: TIntegerField
      FieldName = 'PROCESSO_01_A'
    end
    object cdsConsPedidoPROCESSO_02_A: TIntegerField
      FieldName = 'PROCESSO_02_A'
    end
    object cdsConsPedidoPROCESSO_03_A: TIntegerField
      FieldName = 'PROCESSO_03_A'
    end
    object cdsConsPedidoPROCESSO_04_A: TIntegerField
      FieldName = 'PROCESSO_04_A'
    end
    object cdsConsPedidoPROCESSO_05_A: TIntegerField
      FieldName = 'PROCESSO_05_A'
    end
    object cdsConsPedidoPROCESSO_06_A: TIntegerField
      FieldName = 'PROCESSO_06_A'
    end
    object cdsConsPedidoPROCESSO_07_A: TIntegerField
      FieldName = 'PROCESSO_07_A'
    end
    object cdsConsPedidoPROCESSO_08_A: TIntegerField
      FieldName = 'PROCESSO_08_A'
    end
    object cdsConsPedidoPROCESSO_09_A: TIntegerField
      FieldName = 'PROCESSO_09_A'
    end
    object cdsConsPedidoPROCESSO_10_A: TIntegerField
      FieldName = 'PROCESSO_10_A'
    end
    object cdsConsPedidoFATURADO: TStringField
      FieldName = 'FATURADO'
      FixedChar = True
      Size = 1
    end
  end
  object dsConsPedido: TDataSource
    DataSet = cdsConsPedido
    Left = 202
    Top = 121
  end
  object sdsVendedor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select vend.codigo, vend.nome, vend.cnpj_cpf'#13#10'from pessoa vend'#13#10 +
      'where vend.tp_vendedor = '#39'S'#39#13#10'  and vend.inativo = '#39'N'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 349
    Top = 114
  end
  object dspVendedor: TDataSetProvider
    DataSet = sdsVendedor
    Left = 392
    Top = 114
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspVendedor'
    Left = 435
    Top = 115
    object cdsVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsVendedorCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 475
    Top = 113
  end
  object qPedido_Item_ProcA: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM_PROCESSO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select count(1) CONTADOR_PROC'
      'from PEDIDO_ITEM_PROCESSO IPROC'
      
        'inner join pedido_item i on iproc.id = i.id and iproc.item = i.i' +
        'tem'
      'where IPROC.ID = :ID and'
      '      IPROC.ITEM_PROCESSO = :ITEM_PROCESSO   '
      '      and i.cancelado = '#39'N'#39)
    SQLConnection = dmDatabase.scoDados
    Left = 485
    Top = 28
    object qPedido_Item_ProcACONTADOR_PROC: TIntegerField
      FieldName = 'CONTADOR_PROC'
      Required = True
    end
  end
  object sdsConsItens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select IT.ID, IT.ITEM, IT.ID_PRODUTO, IT.REFERENCIA, IT.NOMEPROD' +
      'UTO, TIP.COMPLEMENTO_NOME, IT.QTD, IT.QTD_RESTANTE,'#13#10'       IT.Q' +
      'TD_FATURADO, TIP.COMPRIMENTO, TIP.LARGURA, TIP.ALTURA, TIP.VLR_K' +
      'G, TIP.ESPESSURA, TIP.TIPO_MAT, TIP.ID_CHAPA,'#13#10'       TIP.VLR_DO' +
      'BRA, IT.OBS_REDUZIDA, TIP.CAMINHO_ARQUIVO_PDF,'#13#10'cast((select'#13#10'  ' +
      '                                 case'#13#10'                         ' +
      '            when IPROC.DTENTRADA is not null and IPROC.DTBAIXA i' +
      's not null then 2'#13#10'                                     when IPR' +
      'OC.DTENTRADA is not null and IPROC.DTBAIXA is null then 1'#13#10'     ' +
      '                                when IPROC.DTENTRADA is null and' +
      ' IPROC.DTBAIXA is null and IPROC.ID > 0 then 0'#13#10'                ' +
      '                     else null'#13#10'                                ' +
      '   end STATUS'#13#10'                            from PEDIDO_ITEM_PROC' +
      'ESSO IPROC'#13#10'                            inner join PROCESSO PP o' +
      'n IPROC.ID_PROCESSO = PP.ID'#13#10'                            where I' +
      'PROC.ID = IT.ID and'#13#10'                                  PP.ORDEM_' +
      'MAPA = 1 and'#13#10'                                  IPROC.ITEM = IT.' +
      'ITEM) as integer) PROCESSO_01,'#13#10#13#10'       cast((select'#13#10'         ' +
      '           case'#13#10'                      when IPROC.DTENTRADA is n' +
      'ot null and IPROC.DTBAIXA is not null then 2'#13#10'                  ' +
      '    when IPROC.DTENTRADA is not null and IPROC.DTBAIXA is null t' +
      'hen 1'#13#10'                      when IPROC.DTENTRADA is null and IP' +
      'ROC.DTBAIXA is null and IPROC.ID > 0 then 0'#13#10'                   ' +
      '   else null'#13#10'                    end STATUS'#13#10'             from ' +
      'PEDIDO_ITEM_PROCESSO IPROC'#13#10'             inner join PROCESSO PP ' +
      'on IPROC.ID_PROCESSO = PP.ID'#13#10'             where IPROC.ID = IT.I' +
      'D and'#13#10'                   PP.ORDEM_MAPA = 2 and'#13#10'               ' +
      '    IPROC.ITEM = IT.ITEM) as integer) PROCESSO_02,'#13#10#13#10'       cas' +
      't((select'#13#10'                    case'#13#10'                      when ' +
      'IPROC.DTENTRADA is not null and IPROC.DTBAIXA is not null then 2' +
      #13#10'                      when IPROC.DTENTRADA is not null and IPR' +
      'OC.DTBAIXA is null then 1'#13#10'                      when IPROC.DTEN' +
      'TRADA is null and IPROC.DTBAIXA is null and IPROC.ID > 0 then 0'#13 +
      #10'                      else null'#13#10'                    end STATUS' +
      #13#10'             from PEDIDO_ITEM_PROCESSO IPROC'#13#10'             inn' +
      'er join PROCESSO PP on IPROC.ID_PROCESSO = PP.ID'#13#10'             w' +
      'here IPROC.ID = IT.ID and'#13#10'                   PP.ORDEM_MAPA = 3 ' +
      'and'#13#10'                   IPROC.ITEM = IT.ITEM) as integer) PROCES' +
      'SO_03,'#13#10#13#10'       cast((select'#13#10'                    case'#13#10'       ' +
      '               when IPROC.DTENTRADA is not null and IPROC.DTBAIX' +
      'A is not null then 2'#13#10'                      when IPROC.DTENTRADA' +
      ' is not null and IPROC.DTBAIXA is null then 1'#13#10'                 ' +
      '     when IPROC.DTENTRADA is null and IPROC.DTBAIXA is null and ' +
      'IPROC.ID > 0 then 0'#13#10'                      else null'#13#10'          ' +
      '          end STATUS'#13#10'             from PEDIDO_ITEM_PROCESSO IPR' +
      'OC'#13#10'             inner join PROCESSO PP on IPROC.ID_PROCESSO = P' +
      'P.ID'#13#10'             where IPROC.ID = IT.ID and'#13#10'                 ' +
      '  PP.ORDEM_MAPA = 4 and'#13#10'                   IPROC.ITEM = IT.ITEM' +
      ') as integer) PROCESSO_04,'#13#10#13#10'       cast((select'#13#10'             ' +
      '       case'#13#10'                      when IPROC.DTENTRADA is not n' +
      'ull and IPROC.DTBAIXA is not null then 2'#13#10'                      ' +
      'when IPROC.DTENTRADA is not null and IPROC.DTBAIXA is null then ' +
      '1'#13#10'                      when IPROC.DTENTRADA is null and IPROC.' +
      'DTBAIXA is null and IPROC.ID > 0 then 0'#13#10'                      e' +
      'lse null'#13#10'                    end STATUS'#13#10'             from PEDI' +
      'DO_ITEM_PROCESSO IPROC'#13#10'             inner join PROCESSO PP on I' +
      'PROC.ID_PROCESSO = PP.ID'#13#10'             where IPROC.ID = IT.ID an' +
      'd'#13#10'                   PP.ORDEM_MAPA = 5 and'#13#10'                   ' +
      'IPROC.ITEM = IT.ITEM) as integer) PROCESSO_05,'#13#10#13#10'       cast((s' +
      'elect'#13#10'                    case'#13#10'                      when IPRO' +
      'C.DTENTRADA is not null and IPROC.DTBAIXA is not null then 2'#13#10'  ' +
      '                    when IPROC.DTENTRADA is not null and IPROC.D' +
      'TBAIXA is null then 1'#13#10'                      when IPROC.DTENTRAD' +
      'A is null and IPROC.DTBAIXA is null and IPROC.ID > 0 then 0'#13#10'   ' +
      '                   else null'#13#10'                    end STATUS'#13#10'  ' +
      '           from PEDIDO_ITEM_PROCESSO IPROC'#13#10'             inner j' +
      'oin PROCESSO PP on IPROC.ID_PROCESSO = PP.ID'#13#10'             where' +
      ' IPROC.ID = IT.ID and'#13#10'                   PP.ORDEM_MAPA = 6 and'#13 +
      #10'                   IPROC.ITEM = IT.ITEM) as integer) PROCESSO_0' +
      '6,'#13#10#13#10'       cast((select'#13#10'                    case'#13#10'           ' +
      '           when IPROC.DTENTRADA is not null and IPROC.DTBAIXA is' +
      ' not null then 2'#13#10'                      when IPROC.DTENTRADA is ' +
      'not null and IPROC.DTBAIXA is null then 1'#13#10'                     ' +
      ' when IPROC.DTENTRADA is null and IPROC.DTBAIXA is null and IPRO' +
      'C.ID > 0 then 0'#13#10'                      else null'#13#10'              ' +
      '      end STATUS'#13#10'             from PEDIDO_ITEM_PROCESSO IPROC'#13#10 +
      '             inner join PROCESSO PP on IPROC.ID_PROCESSO = PP.ID' +
      #13#10'             where IPROC.ID = IT.ID and'#13#10'                   PP' +
      '.ORDEM_MAPA = 7 and'#13#10'                   IPROC.ITEM = IT.ITEM) as' +
      ' integer) PROCESSO_07,'#13#10#13#10'       cast((select'#13#10'                 ' +
      '   case'#13#10'                      when IPROC.DTENTRADA is not null ' +
      'and IPROC.DTBAIXA is not null then 2'#13#10'                      when' +
      ' IPROC.DTENTRADA is not null and IPROC.DTBAIXA is null then 1'#13#10' ' +
      '                     when IPROC.DTENTRADA is null and IPROC.DTBA' +
      'IXA is null and IPROC.ID > 0 then 0'#13#10'                      else ' +
      'null'#13#10'                    end STATUS'#13#10'             from PEDIDO_I' +
      'TEM_PROCESSO IPROC'#13#10'             inner join PROCESSO PP on IPROC' +
      '.ID_PROCESSO = PP.ID'#13#10'             where IPROC.ID = IT.ID and'#13#10' ' +
      '                  PP.ORDEM_MAPA = 8 and'#13#10'                   IPRO' +
      'C.ITEM = IT.ITEM) as integer) PROCESSO_08,'#13#10#13#10'       cast((selec' +
      't'#13#10'                    case'#13#10'                      when IPROC.DT' +
      'ENTRADA is not null and IPROC.DTBAIXA is not null then 2'#13#10'      ' +
      '                when IPROC.DTENTRADA is not null and IPROC.DTBAI' +
      'XA is null then 1'#13#10'                      when IPROC.DTENTRADA is' +
      ' null and IPROC.DTBAIXA is null and IPROC.ID > 0 then 0'#13#10'       ' +
      '               else null'#13#10'                    end STATUS'#13#10'      ' +
      '       from PEDIDO_ITEM_PROCESSO IPROC'#13#10'             inner join ' +
      'PROCESSO PP on IPROC.ID_PROCESSO = PP.ID'#13#10'             where IPR' +
      'OC.ID = IT.ID and'#13#10'                   PP.ORDEM_MAPA = 9 and'#13#10'   ' +
      '                IPROC.ITEM = IT.ITEM) as integer) PROCESSO_09,'#13#10 +
      #13#10'       cast((select'#13#10'                    case'#13#10'               ' +
      '       when IPROC.DTENTRADA is not null and IPROC.DTBAIXA is not' +
      ' null then 2'#13#10'                      when IPROC.DTENTRADA is not ' +
      'null and IPROC.DTBAIXA is null then 1'#13#10'                      whe' +
      'n IPROC.DTENTRADA is null and IPROC.DTBAIXA is null and IPROC.ID' +
      ' > 0 then 0'#13#10'                      else null'#13#10'                  ' +
      '  end STATUS'#13#10'             from PEDIDO_ITEM_PROCESSO IPROC'#13#10'    ' +
      '         inner join PROCESSO PP on IPROC.ID_PROCESSO = PP.ID'#13#10'  ' +
      '           where IPROC.ID = IT.ID and'#13#10'                   PP.ORD' +
      'EM_MAPA = 10 and'#13#10'                   IPROC.ITEM = IT.ITEM) as in' +
      'teger) PROCESSO_10'#13#10#13#10'from PEDIDO_ITEM IT'#13#10'left join PEDIDO_ITEM' +
      '_TIPO TIP on IT.ID = TIP.ID and IT.ITEM = TIP.ITEM'#13#10'where IT.ID ' +
      '= :ID   '#13#10'  AND IT.cancelado = '#39'N'#39#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 74
    Top = 189
  end
  object dspConsItens: TDataSetProvider
    DataSet = sdsConsItens
    Left = 118
    Top = 189
  end
  object cdsConsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsItens'
    Left = 161
    Top = 191
    object cdsConsItensID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsItensITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsItensNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsConsItensCOMPLEMENTO_NOME: TStringField
      FieldName = 'COMPLEMENTO_NOME'
      Size = 90
    end
    object cdsConsItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsItensQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object cdsConsItensQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
    object cdsConsItensCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object cdsConsItensLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object cdsConsItensALTURA: TFloatField
      FieldName = 'ALTURA'
    end
    object cdsConsItensVLR_KG: TFloatField
      FieldName = 'VLR_KG'
    end
    object cdsConsItensESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object cdsConsItensTIPO_MAT: TStringField
      FieldName = 'TIPO_MAT'
      FixedChar = True
      Size = 1
    end
    object cdsConsItensID_CHAPA: TIntegerField
      FieldName = 'ID_CHAPA'
    end
    object cdsConsItensVLR_DOBRA: TFloatField
      FieldName = 'VLR_DOBRA'
    end
    object cdsConsItensPROCESSO_01: TIntegerField
      FieldName = 'PROCESSO_01'
    end
    object cdsConsItensPROCESSO_02: TIntegerField
      FieldName = 'PROCESSO_02'
    end
    object cdsConsItensPROCESSO_03: TIntegerField
      FieldName = 'PROCESSO_03'
    end
    object cdsConsItensPROCESSO_04: TIntegerField
      FieldName = 'PROCESSO_04'
    end
    object cdsConsItensPROCESSO_05: TIntegerField
      FieldName = 'PROCESSO_05'
    end
    object cdsConsItensPROCESSO_06: TIntegerField
      FieldName = 'PROCESSO_06'
    end
    object cdsConsItensPROCESSO_07: TIntegerField
      FieldName = 'PROCESSO_07'
    end
    object cdsConsItensPROCESSO_08: TIntegerField
      FieldName = 'PROCESSO_08'
    end
    object cdsConsItensPROCESSO_09: TIntegerField
      FieldName = 'PROCESSO_09'
    end
    object cdsConsItensPROCESSO_10: TIntegerField
      FieldName = 'PROCESSO_10'
    end
    object cdsConsItensOBS_REDUZIDA: TStringField
      FieldName = 'OBS_REDUZIDA'
      Size = 250
    end
    object cdsConsItensCAMINHO_ARQUIVO_PDF: TStringField
      FieldName = 'CAMINHO_ARQUIVO_PDF'
      Size = 150
    end
  end
  object dsConsItens: TDataSource
    DataSet = cdsConsItens
    Left = 200
    Top = 189
  end
  object SQLDataSet1: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PED.ID, PED.num_pedido, PED.dtemissao, PED.id_cliente,'#13#10'C' +
      'LI.NOME NOME_CLIENTE, PED.dtentrega,'#13#10'PED.usuario, PED.id_vended' +
      'or, VEND.NOME NOME_VENDEDOR,'#13#10'(select count(1) from pedido_item ' +
      'where id = ped.id) contador_itens,'#13#10'(select count(1) from pedido' +
      '_item i2 where id = ped.id'#13#10'   and i2.status_producao = '#39'1'#39') con' +
      'tador_iniciado,'#13#10'(select count(1) from pedido_item i2 where id =' +
      ' ped.id'#13#10'   and i2.status_producao = '#39'2'#39') contador_encerrado,'#13#10' ' +
      'cast((select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner jo' +
      'in processo pp on iproc.id_processo = pp.id'#13#10'where IPROC.ID = PE' +
      'D.ID and'#13#10'      pp.ordem_mapa = 1) AS INTEGER) PROCESSO_01 ,'#13#10' c' +
      'ast((select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner joi' +
      'n processo pp on iproc.id_processo = pp.id'#13#10'where IPROC.ID = PED' +
      '.ID and'#13#10'      pp.ordem_mapa = 2) AS INTEGER) PROCESSO_02,'#13#10' cas' +
      't((select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join ' +
      'processo pp on iproc.id_processo = pp.id'#13#10'where IPROC.ID = PED.I' +
      'D and'#13#10'      pp.ordem_mapa = 3) AS INTEGER) PROCESSO_03,'#13#10' cast(' +
      '(select count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join pr' +
      'ocesso pp on iproc.id_processo = pp.id'#13#10'where IPROC.ID = PED.ID ' +
      'and'#13#10'      pp.ordem_mapa = 4) AS INTEGER) PROCESSO_04,'#13#10' cast((s' +
      'elect count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join proc' +
      'esso pp on iproc.id_processo = pp.id'#13#10'where IPROC.ID = PED.ID an' +
      'd'#13#10'      pp.ordem_mapa = 5) AS INTEGER) PROCESSO_05,'#13#10' cast((sel' +
      'ect count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join proces' +
      'so pp on iproc.id_processo = pp.id'#13#10'where IPROC.ID = PED.ID and'#13 +
      #10'      pp.ordem_mapa = 6) AS INTEGER) PROCESSO_06,'#13#10' cast((selec' +
      't count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join processo' +
      ' pp on iproc.id_processo = pp.id'#13#10'where IPROC.ID = PED.ID and'#13#10' ' +
      '     pp.ordem_mapa = 7) AS INTEGER) PROCESSO_07,'#13#10' cast((select ' +
      'count(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join processo p' +
      'p on iproc.id_processo = pp.id'#13#10'where IPROC.ID = PED.ID and'#13#10'   ' +
      '   pp.ordem_mapa = 8) AS INTEGER) PROCESSO_08,'#13#10' cast((select co' +
      'unt(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join processo pp ' +
      'on iproc.id_processo = pp.id'#13#10'where IPROC.ID = PED.ID and'#13#10'     ' +
      ' pp.ordem_mapa = 9) AS INTEGER) PROCESSO_09,'#13#10' cast((select coun' +
      't(1)'#13#10'from PEDIDO_ITEM_PROCESSO IPROC'#13#10'inner join processo pp on' +
      ' iproc.id_processo = pp.id'#13#10'where IPROC.ID = PED.ID and'#13#10'      p' +
      'p.ordem_mapa = 10) AS INTEGER) PROCESSO_10'#13#10'FROM pedido PED'#13#10'INN' +
      'ER JOIN PESSOA CLI'#13#10'ON PED.ID_CLIENTE = CLI.CODIGO'#13#10'LEFT JOIN PE' +
      'SSOA VEND'#13#10'ON PED.id_vendedor = VEND.CODIGO'#13#10'WHERE ped.tipo_reg ' +
      '= '#39'P'#39#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 352
    Top = 53
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'select F.ID, F.NOME'#13#10'from FILIAL F'#13#10'where F.INATIVO = '#39'N'#39' '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 351
    Top = 168
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 393
    Top = 167
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspFilial'
    Left = 436
    Top = 168
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
    Left = 477
    Top = 167
  end
  object qParametros_Ped: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ID_PROCESSO_FINAL'
      'FROM PARAMETROS_PED')
    SQLConnection = dmDatabase.scoDados
    Left = 414
    Top = 279
    object qParametros_PedID_PROCESSO_FINAL: TIntegerField
      FieldName = 'ID_PROCESSO_FINAL'
    end
  end
end
