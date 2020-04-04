object dmCupomTerminal: TdmCupomTerminal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 544
  Top = 251
  Height = 316
  Width = 528
  object sdsCupomTerminal: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM CUPOMFISCAL_TERMINAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 40
    object sdsCupomTerminalID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object sdsCupomTerminalNOME: TStringField
      FieldName = 'NOME'
    end
    object sdsCupomTerminalSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object sdsCupomTerminalINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object sdsCupomTerminalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dspCupomTerminal: TDataSetProvider
    DataSet = sdsCupomTerminal
    Left = 104
    Top = 40
  end
  object cdsCupomTerminal: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspCupomTerminal'
    OnNewRecord = cdsCupomTerminalNewRecord
    Left = 160
    Top = 40
    object cdsCupomTerminalID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object cdsCupomTerminalNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsCupomTerminalSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsCupomTerminalINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsCupomTerminalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dsCupomTerminal: TDataSource
    DataSet = cdsCupomTerminal
    Left = 216
    Top = 40
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'select F.ID, F.NOME, F.NOME_INTERNO, F.CNPJ_CPF'#13#10'from FILIAL F  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 120
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 104
    Top = 120
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial'
    OnNewRecord = cdsCupomTerminalNewRecord
    Left = 160
    Top = 120
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
    object cdsFilialCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 216
    Top = 120
  end
end
