object DMConsPedidoProc: TDMConsPedidoProc
  OldCreateOrder = False
  Left = 426
  Top = 179
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
      'CLI.CODIGO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 60
    Top = 97
  end
  object dspConsPedidoProc: TDataSetProvider
    DataSet = sdsConsPedidoProc
    Left = 104
    Top = 97
  end
  object cdsConsPedidoProc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPedidoProc'
    Left = 147
    Top = 97
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
    Left = 186
    Top = 97
  end
end
