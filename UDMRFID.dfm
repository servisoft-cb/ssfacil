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
    object sdsNotaFiscal_RFIDCNPJ_FILIAL: TStringField
      FieldName = 'CNPJ_FILIAL'
      Size = 14
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
    Left = 200
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
    object cdsNotaFiscal_RFIDCNPJ_FILIAL: TStringField
      FieldName = 'CNPJ_FILIAL'
      Size = 14
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
  end
end
