object DMRFID: TDMRFID
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 404
  Top = 196
  Height = 396
  Width = 400
  object sdsNotaFiscal_RFID: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM NOTAFISCAL_RFID'#13#10'WHERE ID = :ID'#13#10' AND ITEM_NOTA =' +
      ' :ITEM_NOTA'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM_NOTA'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 120
    Top = 73
    object sdsNotaFiscal_RFIDID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNotaFiscal_RFIDITEM_NOTA: TIntegerField
      FieldName = 'ITEM_NOTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNotaFiscal_RFIDITEM_RFID: TIntegerField
      FieldName = 'ITEM_RFID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsNotaFiscal_RFIDFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsNotaFiscal_RFIDSEQUENCIA: TFMTBCDField
      FieldName = 'SEQUENCIA'
      Precision = 15
      Size = 0
    end
    object sdsNotaFiscal_RFIDQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsNotaFiscal_RFIDUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object sdsNotaFiscal_RFIDNUM_RFID: TStringField
      FieldName = 'NUM_RFID'
      Size = 24
    end
    object sdsNotaFiscal_RFIDCNPJ_FILIAL: TStringField
      FieldName = 'CNPJ_FILIAL'
      Size = 18
    end
  end
  object dspNotaFiscal_RFID: TDataSetProvider
    DataSet = sdsNotaFiscal_RFID
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 73
  end
  object cdsNotaFiscal_RFID: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM_NOTA;ITEM_RFID'
    Params = <>
    ProviderName = 'dspNotaFiscal_RFID'
    Left = 201
    Top = 73
    object cdsNotaFiscal_RFIDID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNotaFiscal_RFIDITEM_NOTA: TIntegerField
      FieldName = 'ITEM_NOTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNotaFiscal_RFIDITEM_RFID: TIntegerField
      FieldName = 'ITEM_RFID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNotaFiscal_RFIDFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsNotaFiscal_RFIDSEQUENCIA: TFMTBCDField
      FieldName = 'SEQUENCIA'
      Precision = 15
      Size = 0
    end
    object cdsNotaFiscal_RFIDQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsNotaFiscal_RFIDUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsNotaFiscal_RFIDNUM_RFID: TStringField
      FieldName = 'NUM_RFID'
      Size = 24
    end
    object cdsNotaFiscal_RFIDCNPJ_FILIAL: TStringField
      FieldName = 'CNPJ_FILIAL'
      Size = 18
    end
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select P.ID, P.QTD_POR_ROTULO'#13#10'from PRODUTO P'#13#10'where P.ID = :ID'#13 +
      #10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 118
    Top = 143
    object sdsProdutoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProdutoQTD_POR_ROTULO: TFloatField
      FieldName = 'QTD_POR_ROTULO'
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    UpdateMode = upWhereKeyOnly
    Left = 158
    Top = 143
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspProduto'
    Left = 196
    Top = 143
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutoQTD_POR_ROTULO: TFloatField
      FieldName = 'QTD_POR_ROTULO'
    end
  end
  object sdsProduto_Forn: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select PF.ID, PF.ITEM, PF.ID_FORNECEDOR, PF.ID_COR, PF.NOME_MATE' +
      'RIAL_FORN, PF.COD_MATERIAL_FORN, PF.COD_COR_FORN,'#13#10'       PF.TAM' +
      'ANHO_CLIENTE, PF.TAMANHO'#13#10'from PRODUTO_FORN PF'#13#10'where PF.ID = :I' +
      'D and'#13#10'      PF.ID_FORNECEDOR = :ID_FORNECEDOR and'#13#10'      PF.ID_' +
      'COR = :ID_COR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_FORNECEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COR'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 119
    Top = 219
    object sdsProduto_FornID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProduto_FornITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProduto_FornID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object sdsProduto_FornID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object sdsProduto_FornNOME_MATERIAL_FORN: TStringField
      FieldName = 'NOME_MATERIAL_FORN'
      Size = 100
    end
    object sdsProduto_FornCOD_MATERIAL_FORN: TStringField
      FieldName = 'COD_MATERIAL_FORN'
      Size = 60
    end
    object sdsProduto_FornCOD_COR_FORN: TStringField
      FieldName = 'COD_COR_FORN'
      Size = 10
    end
    object sdsProduto_FornTAMANHO_CLIENTE: TStringField
      FieldName = 'TAMANHO_CLIENTE'
      Size = 10
    end
    object sdsProduto_FornTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object dspProduto_Forn: TDataSetProvider
    DataSet = sdsProduto_Forn
    UpdateMode = upWhereKeyOnly
    Left = 159
    Top = 219
  end
  object cdsProduto_Forn: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspProduto_Forn'
    BeforePost = cdsProduto_FornBeforePost
    Left = 197
    Top = 219
    object cdsProduto_FornID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProduto_FornITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProduto_FornID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object cdsProduto_FornID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsProduto_FornNOME_MATERIAL_FORN: TStringField
      FieldName = 'NOME_MATERIAL_FORN'
      Size = 100
    end
    object cdsProduto_FornCOD_MATERIAL_FORN: TStringField
      FieldName = 'COD_MATERIAL_FORN'
      Size = 60
    end
    object cdsProduto_FornCOD_COR_FORN: TStringField
      FieldName = 'COD_COR_FORN'
      Size = 10
    end
    object cdsProduto_FornTAMANHO_CLIENTE: TStringField
      FieldName = 'TAMANHO_CLIENTE'
      Size = 10
    end
    object cdsProduto_FornTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object dsProduto_Forn: TDataSource
    DataSet = cdsProduto_Forn
    Left = 236
    Top = 220
  end
end
