object DMConsDuplicata: TDMConsDuplicata
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 325
  Top = 222
  Height = 334
  Width = 909
  object sdsSaldo_Pessoa: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select sum(d.vlr_restante) VLR_RESTANTE, d.id_pessoa, p.nome nom' +
      'e_pessoa,'#13#10'SUM(D.vlr_parcela) VLR_PARCELA, SUM(D.vlr_pago) VLR_P' +
      'AGO'#13#10'from duplicata d'#13#10'inner join pessoa p'#13#10'on d.id_pessoa = p.c' +
      'odigo'#13#10'GROUP BY d.id_pessoa, p.nome'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 100
    Top = 37
  end
  object dspSaldo_Pessoa: TDataSetProvider
    DataSet = sdsSaldo_Pessoa
    Left = 140
    Top = 36
  end
  object cdsSaldo_Pessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSaldo_Pessoa'
    Left = 182
    Top = 36
    object cdsSaldo_PessoaVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
    end
    object cdsSaldo_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsSaldo_PessoaNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Size = 60
    end
    object cdsSaldo_PessoaVLR_PARCELA: TFloatField
      FieldName = 'VLR_PARCELA'
    end
    object cdsSaldo_PessoaVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
  end
  object dsSaldo_Pessoa: TDataSource
    DataSet = cdsSaldo_Pessoa
    Left = 227
    Top = 36
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME, NOME_INTERNO'#13#10'FROM FILIAL'#13#10'WHERE INATIVO = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 136
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 296
    Top = 136
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspFilial'
    Left = 328
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
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 360
    Top = 136
  end
  object sdsVendedor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CODIGO, NOME, PERC_COMISSAO, TIPO_COMISSAO, PERC_COMISSAO' +
      '_VEND'#13#10'FROM PESSOA'#13#10'WHERE INATIVO = '#39'N'#39#13#10'      AND TP_VENDEDOR =' +
      ' '#39'S'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 193
  end
  object dspVendedor: TDataSetProvider
    DataSet = sdsVendedor
    Left = 296
    Top = 192
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspVendedor'
    Left = 328
    Top = 192
    object cdsVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsVendedorPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object cdsVendedorTIPO_COMISSAO: TStringField
      FieldName = 'TIPO_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object cdsVendedorPERC_COMISSAO_VEND: TFloatField
      FieldName = 'PERC_COMISSAO_VEND'
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 360
    Top = 192
  end
  object qParametros_Fin: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_FIN'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 576
    Top = 24
    object qParametros_FinID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qParametros_FinCONTROLAR_DUP_USUARIO: TStringField
      FieldName = 'CONTROLAR_DUP_USUARIO'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinMOSTRAR_VLR_ROD_DUP: TStringField
      FieldName = 'MOSTRAR_VLR_ROD_DUP'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinSEPARADOR_NUM_DA_PARC: TStringField
      FieldName = 'SEPARADOR_NUM_DA_PARC'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinMOSTRAR_VLR_MULTA_DUP: TStringField
      FieldName = 'MOSTRAR_VLR_MULTA_DUP'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinUSA_REGIME_CAIXA_DUP: TStringField
      FieldName = 'USA_REGIME_CAIXA_DUP'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinIMP_NOSSO_NUMERO: TStringField
      FieldName = 'IMP_NOSSO_NUMERO'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinDUP_DIA_FIN_VECTO: TStringField
      FieldName = 'DUP_DIA_FIN_VECTO'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinEXIGIR_CONTA_ORC_DUP: TStringField
      FieldName = 'EXIGIR_CONTA_ORC_DUP'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinUSA_NGR: TStringField
      FieldName = 'USA_NGR'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinUSA_APROVA_DUP: TStringField
      FieldName = 'USA_APROVA_DUP'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinMANTER_DUP_CANC: TStringField
      FieldName = 'MANTER_DUP_CANC'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinUSA_CCUSTO_DUP: TStringField
      FieldName = 'USA_CCUSTO_DUP'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinID_CONTABIL_OPE_BAIXA: TIntegerField
      FieldName = 'ID_CONTABIL_OPE_BAIXA'
    end
  end
  object qParametros_Usuario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_USUARIO'
      'WHERE USUARIO = :USUARIO')
    SQLConnection = dmDatabase.scoDados
    Left = 608
    Top = 24
    object qParametros_UsuarioID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qParametros_UsuarioUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
      Size = 30
    end
    object qParametros_UsuarioTIPO_REG_PRODUTO_PADRAO: TStringField
      FieldName = 'TIPO_REG_PRODUTO_PADRAO'
      FixedChar = True
      Size = 1
    end
    object qParametros_UsuarioTIPO_CONSULTA_PRODUTO_PADRAO: TStringField
      FieldName = 'TIPO_CONSULTA_PRODUTO_PADRAO'
      FixedChar = True
      Size = 1
    end
    object qParametros_UsuarioMOSTRAR_CODIGO_PROD_ANT: TStringField
      FieldName = 'MOSTRAR_CODIGO_PROD_ANT'
      FixedChar = True
      Size = 1
    end
    object qParametros_UsuarioMOSTRAR_TOTAL_PEDIDO: TStringField
      FieldName = 'MOSTRAR_TOTAL_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qParametros_UsuarioMOSTRAR_DUP_REC_PAG: TStringField
      FieldName = 'MOSTRAR_DUP_REC_PAG'
      FixedChar = True
      Size = 1
    end
    object qParametros_UsuarioPERMITE_APROVAR_DUP: TStringField
      FieldName = 'PERMITE_APROVAR_DUP'
      FixedChar = True
      Size = 1
    end
  end
  object sdsReceberContas: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select D.ID, D.NUMDUPLICATA, D.PARCELA, D.ID_CONTA_BOLETO, D.VLR' +
      '_PARCELA, D.DTEMISSAO, D.DTVENCIMENTO, D.TIPO_ES,'#13#10'       D.NOSS' +
      'ONUMERO, D.ID_PESSOA, D.DTULTPAGAMENTO, D.VLR_RESTANTE, D.VLR_PA' +
      'GO, P.FANTASIA,'#13#10'       D.FILIAL,'#13#10'       (select first 1 H.DTHI' +
      'STORICO'#13#10'        from DUPLICATA_HIST H'#13#10'        where H.ID = D.I' +
      'D and'#13#10'              coalesce(H.NUM_REMESSA, 0) <> 0'#13#10'        or' +
      'der by H.ITEM desc) DTREMESSA, C.NOME NOME_CONTA,'#13#10'CASE'#13#10'  WHEN ' +
      'coalesce(P.fantasia,'#39#39') <> '#39#39' THEN P.fantasia'#13#10'  ELSE P.nome'#13#10'  ' +
      'END NOME_PESSOA'#13#10'from DUPLICATA D'#13#10'inner join PESSOA P on D.ID_P' +
      'ESSOA = P.CODIGO'#13#10'left join CONTAS C on D.ID_CONTA_BOLETO = C.ID' +
      #13#10'where D.TIPO_ES = '#39'E'#39' and'#13#10'      coalesce(D.CANCELADA, '#39'N'#39') = ' +
      #39'N'#39#13#10#13#10'  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 497
    Top = 163
  end
  object dspReceberContas: TDataSetProvider
    DataSet = sdsReceberContas
    Left = 529
    Top = 162
  end
  object cdsReceberContas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReceberContas'
    Left = 560
    Top = 165
    object cdsReceberContasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsReceberContasNUMDUPLICATA: TStringField
      FieldName = 'NUMDUPLICATA'
    end
    object cdsReceberContasPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object cdsReceberContasID_CONTA_BOLETO: TIntegerField
      FieldName = 'ID_CONTA_BOLETO'
    end
    object cdsReceberContasVLR_PARCELA: TFloatField
      FieldName = 'VLR_PARCELA'
    end
    object cdsReceberContasDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsReceberContasDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsReceberContasTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsReceberContasNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object cdsReceberContasID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsReceberContasDTULTPAGAMENTO: TDateField
      FieldName = 'DTULTPAGAMENTO'
    end
    object cdsReceberContasVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
    end
    object cdsReceberContasVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
    object cdsReceberContasNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Size = 60
    end
    object cdsReceberContasFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object cdsReceberContasFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsReceberContasDTREMESSA: TDateField
      FieldName = 'DTREMESSA'
    end
    object cdsReceberContasNOME_CONTA: TStringField
      FieldName = 'NOME_CONTA'
      Size = 30
    end
  end
  object dsReceberContas: TDataSource
    DataSet = cdsReceberContas
    Left = 593
    Top = 162
  end
  object frxReport1: TfrxReport
    Tag = 1
    Version = '5.6.8'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42052.436473541700000000
    ReportOptions.LastChange = 44201.968778275460000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 735
    Top = 150
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 765
    Top = 146
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
    Left = 805
    Top = 145
  end
  object frxReceberContas: TfrxDBDataset
    UserName = 'frxReceberContas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NUMDUPLICATA=NUMDUPLICATA'
      'PARCELA=PARCELA'
      'ID_CONTA_BOLETO=ID_CONTA_BOLETO'
      'VLR_PARCELA=VLR_PARCELA'
      'DTEMISSAO=DTEMISSAO'
      'DTVENCIMENTO=DTVENCIMENTO'
      'TIPO_ES=TIPO_ES'
      'NOSSONUMERO=NOSSONUMERO'
      'ID_PESSOA=ID_PESSOA'
      'DTULTPAGAMENTO=DTULTPAGAMENTO'
      'VLR_RESTANTE=VLR_RESTANTE'
      'VLR_PAGO=VLR_PAGO'
      'NOME_PESSOA=NOME_PESSOA'
      'FANTASIA=FANTASIA'
      'FILIAL=FILIAL'
      'DTREMESSA=DTREMESSA'
      'NOME_CONTA=NOME_CONTA')
    DataSource = dsReceberContas
    BCDToCurrency = False
    Left = 638
    Top = 161
  end
end
