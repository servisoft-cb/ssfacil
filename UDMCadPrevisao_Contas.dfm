object DMCadPrevisao_Contas: TDMCadPrevisao_Contas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 281
  Top = 222
  Height = 344
  Width = 897
  object sdsPrevisao_Contas: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'select *'#13#10'FROM PREVISAO_CONTAS'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 32
    object sdsPrevisao_ContasID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPrevisao_ContasNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object sdsPrevisao_ContasPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Required = True
    end
    object sdsPrevisao_ContasID_CONTAORCAMENTO: TIntegerField
      FieldName = 'ID_CONTAORCAMENTO'
    end
    object sdsPrevisao_ContasVLR_PREVISAO: TFloatField
      FieldName = 'VLR_PREVISAO'
    end
    object sdsPrevisao_ContasTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sdsPrevisao_ContasDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object sdsPrevisao_ContasMES_COMPETENCIA: TIntegerField
      FieldName = 'MES_COMPETENCIA'
    end
    object sdsPrevisao_ContasANO_COMPETENCIA: TIntegerField
      FieldName = 'ANO_COMPETENCIA'
    end
    object sdsPrevisao_ContasDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object sdsPrevisao_ContasUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsPrevisao_ContasHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object sdsPrevisao_ContasFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dspPrevisao_Contas: TDataSetProvider
    DataSet = sdsPrevisao_Contas
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspPrevisao_ContasUpdateError
    Left = 128
    Top = 32
  end
  object cdsPrevisao_Contas: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspPrevisao_Contas'
    Left = 199
    Top = 32
    object cdsPrevisao_ContasID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPrevisao_ContasNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPrevisao_ContasPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Required = True
    end
    object cdsPrevisao_ContasID_CONTAORCAMENTO: TIntegerField
      FieldName = 'ID_CONTAORCAMENTO'
    end
    object cdsPrevisao_ContasVLR_PREVISAO: TFloatField
      FieldName = 'VLR_PREVISAO'
    end
    object cdsPrevisao_ContasTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsPrevisao_ContasDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsPrevisao_ContasMES_COMPETENCIA: TIntegerField
      FieldName = 'MES_COMPETENCIA'
    end
    object cdsPrevisao_ContasANO_COMPETENCIA: TIntegerField
      FieldName = 'ANO_COMPETENCIA'
    end
    object cdsPrevisao_ContasDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsPrevisao_ContasUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsPrevisao_ContasHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsPrevisao_ContasFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dsPrevisao_Contas: TDataSource
    DataSet = cdsPrevisao_Contas
    Left = 264
    Top = 32
  end
  object sdsConsulta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select p.*, C.descricao NOME_CONTAORCAMENTO'#13#10'FROM PREVISAO_CONTA' +
      'S P'#13#10'left join conta_orcamento c'#13#10'on p.id_contaorcamento = c.id'#13 +
      #10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 447
    Top = 44
  end
  object dspConsulta: TDataSetProvider
    DataSet = sdsConsulta
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspPrevisao_ContasUpdateError
    Left = 519
    Top = 44
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 591
    Top = 44
    object cdsConsultaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsConsultaPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Required = True
    end
    object cdsConsultaID_CONTAORCAMENTO: TIntegerField
      FieldName = 'ID_CONTAORCAMENTO'
    end
    object cdsConsultaVLR_PREVISAO: TFloatField
      FieldName = 'VLR_PREVISAO'
    end
    object cdsConsultaTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsConsultaMES_COMPETENCIA: TIntegerField
      FieldName = 'MES_COMPETENCIA'
    end
    object cdsConsultaANO_COMPETENCIA: TIntegerField
      FieldName = 'ANO_COMPETENCIA'
    end
    object cdsConsultaDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsConsultaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsConsultaHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsConsultaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsultaNOME_CONTAORCAMENTO: TStringField
      FieldName = 'NOME_CONTAORCAMENTO'
      Size = 50
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 655
    Top = 44
  end
  object mGerarDup: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DtVencimento'
        DataType = ftDate
      end
      item
        Name = 'VlrParcela'
        DataType = ftFloat
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'Ano'
        DataType = ftInteger
      end
      item
        Name = 'Mes'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'Parcela'
    Params = <>
    StoreDefs = True
    Left = 623
    Top = 104
    Data = {
      6A0000009619E0BD0100000018000000050000000000030000006A000C447456
      656E63696D656E746F04000600000000000A566C7250617263656C6108000400
      000000000750617263656C61040001000000000003416E6F0400010000000000
      034D657304000100000000000000}
    object mGerarDupDtVencimento: TDateField
      FieldName = 'DtVencimento'
      EditMask = '99/99/9999'
    end
    object mGerarDupVlrParcela: TFloatField
      FieldName = 'VlrParcela'
      DisplayFormat = '0.00'
    end
    object mGerarDupParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mGerarDupAno: TIntegerField
      FieldName = 'Ano'
    end
    object mGerarDupMes: TIntegerField
      FieldName = 'Mes'
    end
  end
  object dsmGerarDup: TDataSource
    DataSet = mGerarDup
    Left = 656
    Top = 104
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select F.ID, F.NOME, F.NOME_INTERNO, F.CNPJ_CPF'#13#10'from FILIAL F'#13#10 +
      'where F.INATIVO = '#39'N'#39'   '#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 255
    Top = 136
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 286
    Top = 134
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial'
    Left = 320
    Top = 136
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
    Left = 362
    Top = 138
  end
end
