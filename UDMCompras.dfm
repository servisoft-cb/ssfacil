object DMCompras: TDMCompras
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 465
  Top = 188
  Height = 387
  Width = 499
  object sdsEstoque_Compras: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select aux.*, (coalesce(aux.qtd_estoque,0) + coalesce(QTD_OC,0) ' +
      '- coalesce(QTD_PEDIDO,0)) SALDO,'#13#10'(coalesce(aux.qtd_estoque,0) +' +
      ' coalesce(QTD_OC,0) - coalesce(QTD_PEDIDO,0) - coalesce(AUX.QTD_' +
      'ESTOQUE_MIN,0) ) SALDO_MIN'#13#10'from ('#13#10'SELECT VP.*,'#13#10'(SELECT SUM(EA' +
      '.qtd) QTD_ESTOQUE FROM ESTOQUE_ATUAL EA'#13#10'  WHERE (EA.FILIAL = :F' +
      'ILIAL or :FILIAL = 0)'#13#10'    AND (EA.ID_PRODUTO = VP.ID)'#13#10'    AND ' +
      '(EA.id_cor = VP.ID_COR)'#13#10'    AND (EA.tamanho = VP.tamanho)'#13#10'    ' +
      ') QTD_ESTOQUE,'#13#10'(SELECT SUM(OCI.qtd_restante) QTD_OC'#13#10'   FROM PE' +
      'DIDO_ITEM OCI'#13#10'   INNER JOIN PEDIDO OC ON OC.ID = OCI.ID'#13#10'  WHER' +
      'E (OC.FILIAL = :FILIAL or :FILIAL = 0)'#13#10'    AND (OC.TIPO_REG = '#39 +
      'C'#39')'#13#10'    AND (OC.cancelado = '#39'N'#39')'#13#10'    AND (OCI.TIPO_REG = '#39'C'#39')'#13 +
      #10' AND (OCI.qtd_restante > 0) AND'#13#10'    (OCI.id_produto = VP.ID'#13#10' ' +
      '         AND OCI.ID_COR = VP.ID_COR'#13#10'          AND OCI.TAMANHO =' +
      ' VP.TAMANHO)'#13#10'          ) QTD_OC,'#13#10'(SELECT SUM(PITE.qtd_restante' +
      ') QTD_PEDIDO'#13#10'   FROM PEDIDO_ITEM PITE'#13#10'   INNER JOIN PEDIDO PED' +
      ' ON PED.ID = PITE.ID'#13#10'  WHERE (PED.FILIAL = :FILIAL or :FILIAL =' +
      ' 0)'#13#10'    AND (PED.TIPO_REG = '#39'P'#39')'#13#10'    AND (PED.cancelado = '#39'N'#39')' +
      #13#10'    AND (PITE.TIPO_REG = '#39'P'#39')'#13#10' AND (PITE.qtd_restante > 0) AN' +
      'D'#13#10'    (PITE.id_produto = VP.ID'#13#10'          AND PITE.ID_COR = VP.' +
      'ID_COR'#13#10'          AND PITE.TAMANHO = VP.TAMANHO)'#13#10'          ) QT' +
      'D_PEDIDO'#13#10'FROM vproduto VP) aux'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 83
    Top = 8
  end
  object dspEstoque_Compras: TDataSetProvider
    DataSet = sdsEstoque_Compras
    Left = 112
    Top = 8
  end
  object cdsEstoque_Compras: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoque_Compras'
    Left = 144
    Top = 8
    object cdsEstoque_ComprasID: TIntegerField
      FieldName = 'ID'
    end
    object cdsEstoque_ComprasREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsEstoque_ComprasNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsEstoque_ComprasUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsEstoque_ComprasESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsEstoque_ComprasUSA_PRECO_COR: TStringField
      FieldName = 'USA_PRECO_COR'
      FixedChar = True
      Size = 1
    end
    object cdsEstoque_ComprasUSA_GRADE: TStringField
      FieldName = 'USA_GRADE'
      FixedChar = True
      Size = 1
    end
    object cdsEstoque_ComprasID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsEstoque_ComprasNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
    object cdsEstoque_ComprasTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object cdsEstoque_ComprasID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsEstoque_ComprasID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object cdsEstoque_ComprasFILIAL_CAD_PROD: TIntegerField
      FieldName = 'FILIAL_CAD_PROD'
    end
    object cdsEstoque_ComprasID_NCM: TIntegerField
      FieldName = 'ID_NCM'
    end
    object cdsEstoque_ComprasQTD_ESTOQUE_MIN: TFloatField
      FieldName = 'QTD_ESTOQUE_MIN'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsEstoque_ComprasTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsEstoque_ComprasQTD_OC: TFloatField
      FieldName = 'QTD_OC'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsEstoque_ComprasQTD_PEDIDO: TFloatField
      FieldName = 'QTD_PEDIDO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsEstoque_ComprasQTD_ESTOQUE: TFMTBCDField
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '###,###,##0.000#'
      Precision = 15
      Size = 6
    end
    object cdsEstoque_ComprasSALDO: TFloatField
      FieldName = 'SALDO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsEstoque_ComprasNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object cdsEstoque_ComprasNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 60
    end
    object cdsEstoque_ComprasSALDO_MIN: TFloatField
      FieldName = 'SALDO_MIN'
      DisplayFormat = '###,###,##0.000#'
    end
  end
  object dsEstoque_Compras: TDataSource
    DataSet = cdsEstoque_Compras
    Left = 176
    Top = 8
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME, NOME_INTERNO'#13#10'FROM FILIAL'#13#10'WHERE INATIVO = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 82
    Top = 84
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 114
    Top = 84
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspFilial'
    Left = 146
    Top = 84
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
    Left = 178
    Top = 84
  end
end
