object DMCadAdto_Mov: TDMCadAdto_Mov
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 350
  Top = 154
  Height = 436
  Width = 670
  object sdsAdto_Mov: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM ADTO_MOV'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 129
    Top = 6
    object sdsAdto_MovID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsAdto_MovID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsAdto_MovDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsAdto_MovVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sdsAdto_MovTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object sdsAdto_MovTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Size = 3
    end
    object sdsAdto_MovID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object sdsAdto_MovID_NOTAFISCAL: TIntegerField
      FieldName = 'ID_NOTAFISCAL'
    end
    object sdsAdto_MovID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsAdto_MovOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object dspAdto_Mov: TDataSetProvider
    DataSet = sdsAdto_Mov
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspAdto_MovUpdateError
    Left = 200
    Top = 6
  end
  object cdsAdto_Mov: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspAdto_Mov'
    Left = 259
    Top = 8
    object cdsAdto_MovID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAdto_MovID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsAdto_MovDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsAdto_MovVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsAdto_MovTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsAdto_MovTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Size = 3
    end
    object cdsAdto_MovID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object cdsAdto_MovID_NOTAFISCAL: TIntegerField
      FieldName = 'ID_NOTAFISCAL'
    end
    object cdsAdto_MovID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsAdto_MovOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object dsAdto_Mov: TDataSource
    DataSet = cdsAdto_Mov
    Left = 336
    Top = 5
  end
  object sdsConsulta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select a.*, p.nome nome_pessoa, DUP.numduplicata, N.numnota, N.s' +
      'erie,'#13#10'CASE'#13#10'  WHEN A.TIPO_ES = '#39'E'#39' THEN '#39'Entrada'#39#13#10'  WHEN A.TIP' +
      'O_ES = '#39'S'#39' THEN '#39'Sa'#237'da'#39#13#10'  else '#39#39#13#10'  end DESC_TIPO_ES,'#13#10'case'#13#10' ' +
      ' when a.tipo_mov = '#39'DUP'#39' then '#39'T'#237'tulo'#39#13#10'  when a.tipo_mov = '#39'NTS' +
      #39' then '#39'Nota Fiscal'#39#13#10'  when a.tipo_mov = '#39'MAN'#39' then '#39'Manual'#39#13#10' ' +
      ' else a.tipo_mov'#13#10'  end DESC_TIPO_MOV'#13#10'from adto_mov a'#13#10'inner jo' +
      'in pessoa p'#13#10'on a.id_pessoa = p.codigo'#13#10'LEFT JOIN DUPLICATA DUP'#13 +
      #10'ON A.id_duplicata = DUP.ID'#13#10'LEFT JOIN NOTAFISCAL N'#13#10'ON A.id_not' +
      'afiscal = N.ID'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 470
    Top = 9
  end
  object dspConsulta: TDataSetProvider
    DataSet = sdsConsulta
    Left = 504
    Top = 8
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 545
    Top = 8
    object cdsConsultaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsultaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsConsultaDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsConsultaVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsConsultaTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsConsultaTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Size = 3
    end
    object cdsConsultaID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object cdsConsultaID_NOTAFISCAL: TIntegerField
      FieldName = 'ID_NOTAFISCAL'
    end
    object cdsConsultaID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConsultaOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object cdsConsultaNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Size = 60
    end
    object cdsConsultaNUMDUPLICATA: TStringField
      FieldName = 'NUMDUPLICATA'
    end
    object cdsConsultaNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsConsultaSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsConsultaDESC_TIPO_ES: TStringField
      FieldName = 'DESC_TIPO_ES'
      Required = True
      FixedChar = True
      Size = 7
    end
    object cdsConsultaDESC_TIPO_MOV: TStringField
      FieldName = 'DESC_TIPO_MOV'
      Size = 11
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 584
    Top = 8
  end
  object sdsPessoa: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CODIGO, NOME, CNPJ_CPF, CIDADE, TP_CLIENTE, TP_FORNECEDOR' +
      ', FANTASIA'#13#10'FROM PESSOA'#13#10'WHERE INATIVO = '#39'N'#39#13#10'  AND TP_CLIENTE =' +
      ' '#39'S'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 98
    Top = 151
  end
  object dspPessoa: TDataSetProvider
    DataSet = sdsPessoa
    Left = 130
    Top = 151
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspPessoa'
    Left = 170
    Top = 151
    object cdsPessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPessoaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
    object cdsPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object cdsPessoaTP_CLIENTE: TStringField
      FieldName = 'TP_CLIENTE'
      Size = 1
    end
    object cdsPessoaTP_FORNECEDOR: TStringField
      FieldName = 'TP_FORNECEDOR'
      Size = 1
    end
    object cdsPessoaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 210
    Top = 151
  end
  object dsmEtiquetas: TDataSource
    Left = 64
    Top = 336
  end
  object frxReport1: TfrxReport
    Tag = 1
    Version = '5.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41928.578144409700000000
    ReportOptions.LastChange = 43942.715009004630000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 96
    Top = 336
  end
end
