object DMConsFat: TDMConsFat
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 234
  Top = 184
  Height = 445
  Width = 949
  object sdsFatAcum: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select V.*,'#13#10'       (V.VLR_TOTAL + V.VLR_IPI) VLR_TOTAL_BRU,'#13#10'  ' +
      '     (V.VLR_TOTAL) VLR_TOTAL_LIQ,'#13#10'       case'#13#10'         when V.' +
      'TIPO_MOV = '#39'TRO'#39' then '#39'TROCA'#39#13#10'         when V.devolucao = '#39'S'#39' t' +
      'hen '#39'DEV'#39#13#10'         else '#39#39#13#10'       end DEV_TROCA'#13#10'from VFAT_ACU' +
      'M V'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 89
    Top = 48
  end
  object dspFatAcum: TDataSetProvider
    DataSet = sdsFatAcum
    Left = 128
    Top = 48
  end
  object cdsFatAcum: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NUM_NOTA;CODCFOP'
    Params = <>
    ProviderName = 'dspFatAcum'
    Left = 160
    Top = 49
    object cdsFatAcumTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Size = 3
    end
    object cdsFatAcumVLR_DUPLICATA: TFloatField
      FieldName = 'VLR_DUPLICATA'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_LIQUIDO_NFSE: TFloatField
      FieldName = 'VLR_LIQUIDO_NFSE'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_ICMSSUBST: TFloatField
      FieldName = 'VLR_ICMSSUBST'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_IPI: TFloatField
      FieldName = 'VLR_IPI'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsFatAcumNOME_CLIFORN: TStringField
      FieldName = 'NOME_CLIFORN'
      Size = 60
    end
    object cdsFatAcumNUM_NOTA: TIntegerField
      FieldName = 'NUM_NOTA'
    end
    object cdsFatAcumDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsFatAcumDTENTRADASAIDA: TDateField
      FieldName = 'DTENTRADASAIDA'
    end
    object cdsFatAcumTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object cdsFatAcumFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsFatAcumUF_CLI: TStringField
      FieldName = 'UF_CLI'
      FixedChar = True
      Size = 2
    end
    object cdsFatAcumID_CFOP: TIntegerField
      FieldName = 'ID_CFOP'
    end
    object cdsFatAcumVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_PIS: TFloatField
      FieldName = 'VLR_PIS'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_COFINS: TFloatField
      FieldName = 'VLR_COFINS'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_ICMS: TFloatField
      FieldName = 'VLR_ICMS'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_TOTAL_LIQ: TFloatField
      FieldName = 'VLR_TOTAL_LIQ'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumCODCFOP: TStringField
      FieldName = 'CODCFOP'
      Size = 5
    end
    object cdsFatAcumVLR_TOTAL_BRU: TFloatField
      FieldName = 'VLR_TOTAL_BRU'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_FRETE: TFloatField
      FieldName = 'VLR_FRETE'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsFatAcumVLR_ICMS_UF_REMET: TFloatField
      FieldName = 'VLR_ICMS_UF_REMET'
    end
    object cdsFatAcumVLR_ICMS_UF_DEST: TFloatField
      FieldName = 'VLR_ICMS_UF_DEST'
    end
    object cdsFatAcumVLR_CUSTO: TFloatField
      FieldName = 'VLR_CUSTO'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_IR_VENDA: TFloatField
      FieldName = 'VLR_IR_VENDA'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_CSLL_VENDA: TFloatField
      FieldName = 'VLR_CSLL_VENDA'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumBASE_FCP_ST: TFloatField
      FieldName = 'BASE_FCP_ST'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumBASE_ICMS_FCP: TFloatField
      FieldName = 'BASE_ICMS_FCP'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumBASE_ICMS_FCP_DEST: TFloatField
      FieldName = 'BASE_ICMS_FCP_DEST'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_ICMS_FCP_DEST: TFloatField
      FieldName = 'VLR_ICMS_FCP_DEST'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_ICMS_FCP: TFloatField
      FieldName = 'VLR_ICMS_FCP'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_FCP_ST: TFloatField
      FieldName = 'VLR_FCP_ST'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_ISSQN: TFloatField
      FieldName = 'VLR_ISSQN'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumVLR_ISSQN_RETIDO: TFloatField
      FieldName = 'VLR_ISSQN_RETIDO'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumTERMINAL: TIntegerField
      FieldName = 'TERMINAL'
    end
    object cdsFatAcumSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsFatAcumVLR_TROCA: TFloatField
      FieldName = 'VLR_TROCA'
      DisplayFormat = '0.00'
    end
    object cdsFatAcumDEV_TROCA: TStringField
      FieldName = 'DEV_TROCA'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object dsFatAcum: TDataSource
    DataSet = cdsFatAcum
    Left = 200
    Top = 48
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT F.ID, F.NOME, F.NOME_INTERNO, F.CNPJ_CPF, F.PERC_IR, F.PE' +
      'RC_CSLL'#13#10'FROM FILIAL F'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 296
    Top = 136
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 336
    Top = 136
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspFilial'
    Left = 375
    Top = 135
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
    object cdsFilialPERC_IR: TFloatField
      FieldName = 'PERC_IR'
    end
    object cdsFilialPERC_CSLL: TFloatField
      FieldName = 'PERC_CSLL'
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 416
    Top = 136
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
    ReportOptions.CreateDate = 42222.414492245400000000
    ReportOptions.LastChange = 44050.387768796300000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnBeforePrint = frxReport1BeforePrint
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 88
    Top = 176
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TIPO_MOV=TIPO_MOV'
      'VLR_DUPLICATA=VLR_DUPLICATA'
      'VLR_LIQUIDO_NFSE=VLR_LIQUIDO_NFSE'
      'VLR_TOTAL=VLR_TOTAL'
      'VLR_ICMSSUBST=VLR_ICMSSUBST'
      'VLR_IPI=VLR_IPI'
      'ID_PESSOA=ID_PESSOA'
      'NOME_CLIFORN=NOME_CLIFORN'
      'NUM_NOTA=NUM_NOTA'
      'DTEMISSAO=DTEMISSAO'
      'DTENTRADASAIDA=DTENTRADASAIDA'
      'TIPO_REG=TIPO_REG'
      'FILIAL=FILIAL'
      'UF_CLI=UF_CLI'
      'ID_CFOP=ID_CFOP'
      'VLR_DESCONTO=VLR_DESCONTO'
      'VLR_PIS=VLR_PIS'
      'VLR_COFINS=VLR_COFINS'
      'VLR_ICMS=VLR_ICMS'
      'VLR_TOTAL_LIQ=VLR_TOTAL_LIQ'
      'CODCFOP=CODCFOP'
      'VLR_TOTAL_BRU=VLR_TOTAL_BRU'
      'VLR_FRETE=VLR_FRETE'
      'DEVOLUCAO=DEVOLUCAO'
      'VLR_ICMS_UF_REMET=VLR_ICMS_UF_REMET'
      'VLR_ICMS_UF_DEST=VLR_ICMS_UF_DEST'
      'VLR_CUSTO=VLR_CUSTO'
      'VLR_IR_VENDA=VLR_IR_VENDA'
      'VLR_CSLL_VENDA=VLR_CSLL_VENDA'
      'BASE_FCP_ST=BASE_FCP_ST'
      'BASE_ICMS_FCP=BASE_ICMS_FCP'
      'BASE_ICMS_FCP_DEST=BASE_ICMS_FCP_DEST'
      'VLR_ICMS_FCP_DEST=VLR_ICMS_FCP_DEST'
      'VLR_ICMS_FCP=VLR_ICMS_FCP'
      'VLR_FCP_ST=VLR_FCP_ST'
      'VLR_ISSQN=VLR_ISSQN'
      'VLR_ISSQN_RETIDO=VLR_ISSQN_RETIDO')
    DataSet = cdsFatAcum
    BCDToCurrency = False
    Left = 91
    Top = 233
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
    Left = 128
    Top = 177
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = SMTP
    MAPISendFlag = 0
    Left = 168
    Top = 177
  end
  object frxRichObject1: TfrxRichObject
    Left = 200
    Top = 177
  end
  object sdsCupomTerminal: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM CUPOMFISCAL_TERMINAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 296
    Top = 48
  end
  object dspCupomTerminal: TDataSetProvider
    DataSet = sdsCupomTerminal
    Left = 336
    Top = 48
  end
  object cdsCupomTerminal: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspCupomTerminal'
    Left = 376
    Top = 48
    object cdsCupomTerminalID: TSmallintField
      FieldName = 'ID'
      Required = True
    end
    object cdsCupomTerminalNOME: TStringField
      FieldName = 'NOME'
    end
  end
  object dsCupomTerminar: TDataSource
    DataSet = cdsCupomTerminal
    Left = 416
    Top = 48
  end
  object sdsComprasServicos: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select coalesce(PC.CODIGO, '#39#39') CONTA, coalesce(PC.NOME, '#39#39') NOME' +
      '_CONTA, NF.DTEMISSAO, P.CODIGO, P.FANTASIA NOME_CLI,'#13#10'       NF.' +
      'SERIE, NF.NUMNOTA, TC.CODCFOP, NF.ESPECIE, NF.VLR_NOTA - NF.VLR_' +
      'DESCONTO as VALOR_LIQUIDO, NF.VLR_ICMS,'#13#10'       NF.VLR_IPI, NF.V' +
      'LR_PIS, NF.VLR_COFINS, NF.VLR_NOTA, ID_CONTA_ORCAMENTO, '#39'NTE'#39' TI' +
      'PO_REGISTRO, NF.ID,'#13#10'       case'#13#10'         when CP.TIPO_CONDICAO' +
      ' = '#39'V'#39' then (select sum(coalesce(CD.QTDDIAS, 1))'#13#10'              ' +
      '                             from CONDPGTO_DIA CD'#13#10'             ' +
      '                              where NF.ID_CONDPGTO = CD.ID) / (s' +
      'elect count(coalesce(CD1.QTDDIAS, 1))'#13#10'                         ' +
      '                                                   from CONDPGTO' +
      '_DIA CD1'#13#10'                                                      ' +
      '                      where NF.ID_CONDPGTO = CD1.ID)'#13#10'         w' +
      'hen CP.TIPO_CONDICAO = '#39'F'#39' then (select first (1) datediff(day, ' +
      'NFS.DTEMISSAO,'#13#10'                                                ' +
      '            (select first (1) NFSP1.DTVENCIMENTO'#13#10'              ' +
      '                                               from NOTASERVICO_' +
      'PARC NFSP1'#13#10'                                                    ' +
      '         where NFSP1.ID = NFS.ID'#13#10'                              ' +
      '                               order by NFSP1.DTVENCIMENTO desc)' +
      ') as DIFERENCA'#13#10'                                           from ' +
      'NOTASERVICO NFS'#13#10'                                           left' +
      ' join NOTASERVICO_PARC NFSP on NFSP.ID = NFS.ID) / CP.QTD_PARCEL' +
      'A'#13#10'         else 0'#13#10'       end MEDIA_DIAS'#13#10'from NOTAFISCAL NF'#13#10'l' +
      'eft join CONTA_ORCAMENTO CO on CO.ID = NF.ID_CONTA_ORCAMENTO'#13#10'le' +
      'ft join PLANO_CONTABIL PC on PC.ID = CO.COD_CONTABIL'#13#10'left join ' +
      'PESSOA P on P.CODIGO = NF.ID_CLIENTE'#13#10'left join TAB_CFOP TC on T' +
      'C.ID = NF.ID_CFOP'#13#10'left join FILIAL FL on FL.ID = NF.FILIAL'#13#10'lef' +
      't join CONDPGTO CP on CP.ID = NF.ID_CONDPGTO'#13#10'where NF.TIPO_REG ' +
      '= '#39'NTE'#39' and'#13#10'      NF.DTEMISSAO between cast(:DATA_INICIAL as da' +
      'te) and cast(:DATA_FINAL as date) and'#13#10'      NF.FILIAL = :FILIAL' +
      ' and'#13#10'      NF.CANCELADA <> '#39'S'#39#13#10#13#10'union all'#13#10'select coalesce(PC' +
      '1.CODIGO, '#39#39') CONTA, coalesce(PC1.NOME, '#39#39') NOME_CONTA, cast(NFS' +
      '.DTEMISSAO as date), P1.CODIGO,'#13#10'       P1.FANTASIA NOME_CLI, NF' +
      'S.SERIE, NFS.NUMNOTA, '#39'9999'#39' CODCFOP, '#39'ESP'#39' ESPECIE,'#13#10'       NFS' +
      '.VLR_SERVICOS - NFS.VLR_DESCONTO_INC as VALOR_LIQUIDO1, NFS.VLR_' +
      'ICMS, cast('#39'0.00'#39' as numeric(15,2)) VALOR_IPI,'#13#10'       NFS.VLR_P' +
      'IS_CALC, NFS.VLR_COFINS_CALC, NFS.VLR_SERVICOS, ID_CONTA_ORCAMEN' +
      'TO, '#39'NS'#39' TIPO_REGISTRO,NFS.ID,'#13#10'       case'#13#10'         when CP1.T' +
      'IPO_CONDICAO = '#39'V'#39' then (select sum(coalesce(CD.QTDDIAS, 1))'#13#10'  ' +
      '                                          from CONDPGTO_DIA CD'#13#10 +
      '                                            where NFS.ID_CONDPGT' +
      'O = CD.ID) / (select count(coalesce(CD1.QTDDIAS, 1))'#13#10'          ' +
      '                                                                ' +
      '    from CONDPGTO_DIA CD1'#13#10'                                     ' +
      '                                         where NFS.ID_CONDPGTO =' +
      ' CD1.ID)'#13#10'         when CP1.TIPO_CONDICAO = '#39'F'#39' then (select fir' +
      'st (1) datediff(day, NFS.DTEMISSAO,'#13#10'                           ' +
      '                                  (select first (1) NFSP1.DTVENC' +
      'IMENTO'#13#10'                                                        ' +
      '      from NOTASERVICO_PARC NFSP1'#13#10'                             ' +
      '                                 where NFSP1.ID = NFS.ID'#13#10'      ' +
      '                                                        order by' +
      ' NFSP1.DTVENCIMENTO desc)) as DIFERENCA'#13#10'                       ' +
      '                     from NOTASERVICO NFS'#13#10'                     ' +
      '                       left join NOTASERVICO_PARC NFSP on NFSP.I' +
      'D = NFS.ID) / CP1.QTD_PARCELA'#13#10'         else 0'#13#10'       end MEDIA' +
      '_DIAS'#13#10'from NOTASERVICO NFS'#13#10'left join CONTA_ORCAMENTO CO1 on CO' +
      '1.ID = NFS.ID_CONTA_ORCAMENTO'#13#10'left join PLANO_CONTABIL PC1 on P' +
      'C1.ID = CO1.COD_CONTABIL'#13#10'left join PESSOA P1 on P1.CODIGO = NFS' +
      '.ID_CLIENTE'#13#10'left join FILIAL FL1 on FL1.ID = NFS.FILIAL'#13#10'left j' +
      'oin CONDPGTO CP1 on CP1.ID = NFS.ID_CONDPGTO'#13#10'where NFS.DTEMISSA' +
      'O between cast(:DATA_INICIAL as date) and cast(:DATA_FINAL as da' +
      'te) and'#13#10'      NFS.FILIAL = :FILIAL AND'#13#10'      NFS.STATUS_RPS <>' +
      ' '#39'2'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'DATA_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DATA_FINAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DATA_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DATA_FINAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 301
    Top = 190
  end
  object dspComprasServicos: TDataSetProvider
    DataSet = sdsComprasServicos
    Left = 333
    Top = 190
  end
  object cdsComprasServicos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CONTA'
    Params = <>
    ProviderName = 'dspComprasServicos'
    OnCalcFields = cdsComprasServicosCalcFields
    Left = 372
    Top = 190
    object cdsComprasServicosCONTA: TStringField
      FieldName = 'CONTA'
      Size = 60
    end
    object cdsComprasServicosNOME_CONTA: TStringField
      FieldName = 'NOME_CONTA'
      Size = 100
    end
    object cdsComprasServicosDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsComprasServicosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsComprasServicosNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Size = 30
    end
    object cdsComprasServicosSERIE: TStringField
      FieldName = 'SERIE'
      Size = 5
    end
    object cdsComprasServicosNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsComprasServicosCODCFOP: TStringField
      FieldName = 'CODCFOP'
      Size = 5
    end
    object cdsComprasServicosESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 30
    end
    object cdsComprasServicosVALOR_LIQUIDO: TFloatField
      FieldName = 'VALOR_LIQUIDO'
    end
    object cdsComprasServicosVLR_ICMS: TFloatField
      FieldName = 'VLR_ICMS'
    end
    object cdsComprasServicosVLR_IPI: TFloatField
      FieldName = 'VLR_IPI'
    end
    object cdsComprasServicosVLR_PIS: TFloatField
      FieldName = 'VLR_PIS'
    end
    object cdsComprasServicosVLR_COFINS: TFloatField
      FieldName = 'VLR_COFINS'
    end
    object cdsComprasServicosVLR_NOTA: TFloatField
      FieldName = 'VLR_NOTA'
    end
    object cdsComprasServicosID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsComprasServicosMEDIA_DIAS: TFMTBCDField
      FieldName = 'MEDIA_DIAS'
      Precision = 15
      Size = 0
    end
    object cdsComprasServicosCTA_CONTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTA_CONTA'
      Size = 100
      Calculated = True
    end
    object cdsComprasServicosTIPO_REGISTRO: TStringField
      FieldName = 'TIPO_REGISTRO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsComprasServicosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
  object dsComprasServico: TDataSource
    DataSet = cdsComprasServicos
    Left = 418
    Top = 190
  end
  object sdsConsComprasServico: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT A.ID, A.CODIGO ||'#39' - '#39'|| A.DESCRICAO CONTA_ORCAMENTO'#13#10'FRO' +
      'M CONTA_ORCAMENTO A'#13#10'WHERE TIPO = '#39'A'#39'  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 94
    Top = 109
  end
  object dspConsComprasServico: TDataSetProvider
    DataSet = sdsConsComprasServico
    Left = 132
    Top = 106
  end
  object cdsConsComprasServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsComprasServico'
    Left = 166
    Top = 106
    object cdsConsComprasServicoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsComprasServicoCONTA_ORCAMENTO: TStringField
      FieldName = 'CONTA_ORCAMENTO'
      Size = 73
    end
  end
  object dsConsComprasServico: TDataSource
    DataSet = cdsConsComprasServico
    Left = 197
    Top = 106
  end
  object frxComprasServicos: TfrxDBDataset
    UserName = 'frxComprasServicos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CONTA=CONTA'
      'NOME_CONTA=NOME_CONTA'
      'DTEMISSAO=DTEMISSAO'
      'CODIGO=CODIGO'
      'NOME_CLI=NOME_CLI'
      'SERIE=SERIE'
      'NUMNOTA=NUMNOTA'
      'CODCFOP=CODCFOP'
      'ESPECIE=ESPECIE'
      'VALOR_LIQUIDO=VALOR_LIQUIDO'
      'VLR_ICMS=VLR_ICMS'
      'VLR_IPI=VLR_IPI'
      'VLR_PIS=VLR_PIS'
      'VLR_COFINS=VLR_COFINS'
      'VLR_NOTA=VLR_NOTA'
      'MEDIA_DIAS=MEDIA_DIAS'
      'CTA_CONTA=CTA_CONTA')
    DataSource = dsComprasServico
    BCDToCurrency = False
    Left = 174
    Top = 232
  end
  object sdsConsCliente: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT  DEVOLUCAO, ID_PESSOA, NOME_CLIFORN, SUM(VLR_DUPLICATA) V' +
      'LR_DUPLICATA, SUM(VLR_ICMS) VLR_ICMS, SUM(VLR_TOTAL) VLR_TOTAL,'#13 +
      #10'       SUM(VLR_ICMSSUBST) VLR_ICMSSUBST, SUM(VLR_IPI) VLR_IPI, ' +
      'SUM(VLR_FRETE) VLR_FRETE,'#13#10'       SUM(VLR_ICMS_UF_REMET) VLR_ICM' +
      'S_UF_REMET, SUM(VLR_ICMS_UF_DEST) VLR_ICMS_UF_DEST, SUM(VLR_DESC' +
      'ONTO) VLR_DESCONTO,'#13#10'       SUM(VLR_COFINS) VLR_COFINS, SUM(VLR_' +
      'PIS) VLR_PIS, SUM(VLR_CUSTO) VLR_CUSTO, SUM(VLR_IR_VENDA) VLR_IR' +
      '_VENDA,'#13#10'       SUM(VLR_CSLL_VENDA) VLR_CSLL_VENDA,'#13#10'       (SUM' +
      '(V.VLR_TOTAL) + SUM(V.VLR_IPI) + SUM(V.VLR_FRETE)) VLR_TOTAL_BRU' +
      ', SUM(V.VLR_DUPLICATA) VLR_TOTAL_LIQ,'#13#10'       sum(coalesce(v.bas' +
      'e_fcp_st,0)) BASE_FCP_ST,'#13#10'       sum(coalesce(v.base_icms_fcp,0' +
      ')) base_icms_fcp,'#13#10'       sum(coalesce(v.base_icms_fcp_dest,0)) ' +
      'base_icms_fcp_dest,'#13#10'       sum(coalesce(v.vlr_icms_fcp_dest,0))' +
      ' vlr_icms_fcp_dest,'#13#10'       sum(coalesce(v.vlr_icms_fcp,0)) vlr_' +
      'icms_fcp,'#13#10'       sum(coalesce(v.vlr_fcp_st,0)) vlr_fcp_st,'#13#10'   ' +
      '    sum(coalesce(v.vlr_issqn,0)) vlr_issqn,'#13#10'       sum(coalesce' +
      '(v.vlr_issqn_retido,0)) vlr_issqn_retido,'#13#10'  CASE'#13#10'    WHEN V.ti' +
      'po_mov = '#39'TRO'#39' then '#39'TROCA'#39#13#10'    WHEN v.devolucao = '#39'S'#39' then '#39'DE' +
      'V'#39#13#10'    ELSE '#39#39#13#10'    END DEV_TROCA'#13#10#13#10'FROM VFAT_ACUM V'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 302
    Top = 292
  end
  object dspConsCliente: TDataSetProvider
    DataSet = sdsConsCliente
    Left = 333
    Top = 293
  end
  object cdsConsCliente: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PESSOA'
    Params = <>
    ProviderName = 'dspConsCliente'
    Left = 366
    Top = 291
    object cdsConsClienteID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsConsClienteNOME_CLIFORN: TStringField
      FieldName = 'NOME_CLIFORN'
      Size = 60
    end
    object cdsConsClienteVLR_DUPLICATA: TFloatField
      FieldName = 'VLR_DUPLICATA'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_ICMS: TFloatField
      FieldName = 'VLR_ICMS'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_ICMSSUBST: TFloatField
      FieldName = 'VLR_ICMSSUBST'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_IPI: TFloatField
      FieldName = 'VLR_IPI'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_FRETE: TFloatField
      FieldName = 'VLR_FRETE'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_ICMS_UF_REMET: TFloatField
      FieldName = 'VLR_ICMS_UF_REMET'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_ICMS_UF_DEST: TFloatField
      FieldName = 'VLR_ICMS_UF_DEST'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_COFINS: TFloatField
      FieldName = 'VLR_COFINS'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_PIS: TFloatField
      FieldName = 'VLR_PIS'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_CUSTO: TFloatField
      FieldName = 'VLR_CUSTO'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_IR_VENDA: TFloatField
      FieldName = 'VLR_IR_VENDA'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_CSLL_VENDA: TFloatField
      FieldName = 'VLR_CSLL_VENDA'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_TOTAL_BRU: TFloatField
      FieldName = 'VLR_TOTAL_BRU'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_TOTAL_LIQ: TFloatField
      FieldName = 'VLR_TOTAL_LIQ'
    end
    object cdsConsClienteBASE_FCP_ST: TFloatField
      FieldName = 'BASE_FCP_ST'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteBASE_ICMS_FCP: TFloatField
      FieldName = 'BASE_ICMS_FCP'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteBASE_ICMS_FCP_DEST: TFloatField
      FieldName = 'BASE_ICMS_FCP_DEST'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_ICMS_FCP_DEST: TFloatField
      FieldName = 'VLR_ICMS_FCP_DEST'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_ICMS_FCP: TFloatField
      FieldName = 'VLR_ICMS_FCP'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_FCP_ST: TFloatField
      FieldName = 'VLR_FCP_ST'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsClienteVLR_ISSQN: TFloatField
      FieldName = 'VLR_ISSQN'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteVLR_ISSQN_RETIDO: TFloatField
      FieldName = 'VLR_ISSQN_RETIDO'
      DisplayFormat = '##0.00'
    end
    object cdsConsClienteDEV_TROCA: TStringField
      FieldName = 'DEV_TROCA'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object dsConsCliente: TDataSource
    DataSet = cdsConsCliente
    Left = 397
    Top = 293
  end
  object frxConsCliente: TfrxDBDataset
    UserName = 'frxConsCliente'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PESSOA=ID_PESSOA'
      'NOME_CLIFORN=NOME_CLIFORN'
      'VLR_DUPLICATA=VLR_DUPLICATA'
      'VLR_ICMS=VLR_ICMS'
      'VLR_TOTAL=VLR_TOTAL'
      'VLR_ICMSSUBST=VLR_ICMSSUBST'
      'VLR_IPI=VLR_IPI'
      'VLR_FRETE=VLR_FRETE'
      'VLR_ICMS_UF_REMET=VLR_ICMS_UF_REMET'
      'VLR_ICMS_UF_DEST=VLR_ICMS_UF_DEST'
      'VLR_DESCONTO=VLR_DESCONTO'
      'VLR_COFINS=VLR_COFINS'
      'VLR_PIS=VLR_PIS'
      'VLR_CUSTO=VLR_CUSTO'
      'VLR_IR_VENDA=VLR_IR_VENDA'
      'VLR_CSLL_VENDA=VLR_CSLL_VENDA'
      'VLR_TOTAL_BRU=VLR_TOTAL_BRU'
      'VLR_TOTAL_LIQ=VLR_TOTAL_LIQ'
      'BASE_FCP_ST=BASE_FCP_ST'
      'BASE_ICMS_FCP=BASE_ICMS_FCP'
      'BASE_ICMS_FCP_DEST=BASE_ICMS_FCP_DEST'
      'VLR_ICMS_FCP_DEST=VLR_ICMS_FCP_DEST'
      'VLR_ICMS_FCP=VLR_ICMS_FCP'
      'VLR_FCP_ST=VLR_FCP_ST'
      'DEVOLUCAO=DEVOLUCAO'
      'VLR_ISSQN=VLR_ISSQN'
      'VLR_ISSQN_RETIDO=VLR_ISSQN_RETIDO')
    DataSource = dsConsCliente
    BCDToCurrency = False
    Left = 89
    Top = 285
  end
  object sdsConsData: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select devolucao, DTEMISSAO, sum(VLR_DUPLICATA) VLR_DUPLICATA, s' +
      'um(VLR_ICMS) VLR_ICMS, sum(VLR_TOTAL) VLR_TOTAL,'#13#10'       sum(VLR' +
      '_ICMSSUBST) VLR_ICMSSUBST, sum(VLR_IPI) VLR_IPI, sum(VLR_FRETE) ' +
      'VLR_FRETE,'#13#10'       sum(VLR_ICMS_UF_REMET) VLR_ICMS_UF_REMET, sum' +
      '(VLR_ICMS_UF_DEST) VLR_ICMS_UF_DEST, sum(VLR_DESCONTO) VLR_DESCO' +
      'NTO,'#13#10'       sum(VLR_COFINS) VLR_COFINS, sum(VLR_PIS) VLR_PIS, s' +
      'um(VLR_CUSTO) VLR_CUSTO, sum(VLR_IR_VENDA) VLR_IR_VENDA,'#13#10'      ' +
      ' sum(VLR_CSLL_VENDA) VLR_CSLL_VENDA,'#13#10'       (sum(V.VLR_TOTAL) +' +
      ' sum(V.VLR_IPI) + sum(V.VLR_FRETE)) VLR_TOTAL_BRU, sum(V.VLR_TOT' +
      'AL) VLR_TOTAL_LIQ,'#13#10'       sum(coalesce(V.BASE_FCP_ST, 0)) BASE_' +
      'FCP_ST, sum(coalesce(V.BASE_ICMS_FCP, 0)) BASE_ICMS_FCP,'#13#10'      ' +
      ' sum(coalesce(V.BASE_ICMS_FCP_DEST, 0)) BASE_ICMS_FCP_DEST,'#13#10'   ' +
      '    sum(coalesce(V.VLR_ICMS_FCP_DEST, 0)) VLR_ICMS_FCP_DEST, sum' +
      '(coalesce(V.VLR_ICMS_FCP, 0)) VLR_ICMS_FCP,'#13#10'       sum(coalesce' +
      '(V.VLR_FCP_ST, 0)) VLR_FCP_ST, sum(coalesce(V.VLR_ISSQN, 0)) VLR' +
      '_ISSQN,'#13#10'       sum(coalesce(V.VLR_ISSQN_RETIDO, 0)) VLR_ISSQN_R' +
      'ETIDO,'#13#10'  CASE'#13#10'    WHEN V.tipo_mov = '#39'TRO'#39' then '#39'TROCA'#39#13#10'    WH' +
      'EN v.devolucao = '#39'S'#39' then '#39'DEV'#39#13#10'    ELSE '#39#39#13#10'    END DEV_TROCA'#13 +
      #10'FROM VFAT_ACUM V'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 303
    Top = 344
  end
  object dspConsData: TDataSetProvider
    DataSet = sdsConsData
    Left = 335
    Top = 344
  end
  object cdsConsData: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DTEMISSAO'
    Params = <>
    ProviderName = 'dspConsData'
    Left = 367
    Top = 346
    object cdsConsDataDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsDataVLR_DUPLICATA: TFloatField
      FieldName = 'VLR_DUPLICATA'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_ICMS: TFloatField
      FieldName = 'VLR_ICMS'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_ICMSSUBST: TFloatField
      FieldName = 'VLR_ICMSSUBST'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_IPI: TFloatField
      FieldName = 'VLR_IPI'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_FRETE: TFloatField
      FieldName = 'VLR_FRETE'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_ICMS_UF_REMET: TFloatField
      FieldName = 'VLR_ICMS_UF_REMET'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_ICMS_UF_DEST: TFloatField
      FieldName = 'VLR_ICMS_UF_DEST'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_COFINS: TFloatField
      FieldName = 'VLR_COFINS'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_PIS: TFloatField
      FieldName = 'VLR_PIS'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_CUSTO: TFloatField
      FieldName = 'VLR_CUSTO'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_IR_VENDA: TFloatField
      FieldName = 'VLR_IR_VENDA'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_CSLL_VENDA: TFloatField
      FieldName = 'VLR_CSLL_VENDA'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_TOTAL_BRU: TFloatField
      FieldName = 'VLR_TOTAL_BRU'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_TOTAL_LIQ: TFloatField
      FieldName = 'VLR_TOTAL_LIQ'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataBASE_FCP_ST: TFloatField
      FieldName = 'BASE_FCP_ST'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataBASE_ICMS_FCP: TFloatField
      FieldName = 'BASE_ICMS_FCP'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataBASE_ICMS_FCP_DEST: TFloatField
      FieldName = 'BASE_ICMS_FCP_DEST'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_ICMS_FCP_DEST: TFloatField
      FieldName = 'VLR_ICMS_FCP_DEST'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_ICMS_FCP: TFloatField
      FieldName = 'VLR_ICMS_FCP'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_FCP_ST: TFloatField
      FieldName = 'VLR_FCP_ST'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsDataVLR_ISSQN: TFloatField
      FieldName = 'VLR_ISSQN'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataVLR_ISSQN_RETIDO: TFloatField
      FieldName = 'VLR_ISSQN_RETIDO'
      DisplayFormat = '##0.00'
    end
    object cdsConsDataDEV_TROCA: TStringField
      FieldName = 'DEV_TROCA'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object dsConsData: TDataSource
    DataSet = cdsConsData
    Left = 399
    Top = 344
  end
  object frxConsData: TfrxDBDataset
    UserName = 'frxConsData'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DTEMISSAO=DTEMISSAO'
      'VLR_DUPLICATA=VLR_DUPLICATA'
      'VLR_ICMS=VLR_ICMS'
      'VLR_TOTAL=VLR_TOTAL'
      'VLR_ICMSSUBST=VLR_ICMSSUBST'
      'VLR_IPI=VLR_IPI'
      'VLR_FRETE=VLR_FRETE'
      'VLR_ICMS_UF_REMET=VLR_ICMS_UF_REMET'
      'VLR_ICMS_UF_DEST=VLR_ICMS_UF_DEST'
      'VLR_DESCONTO=VLR_DESCONTO'
      'VLR_COFINS=VLR_COFINS'
      'VLR_PIS=VLR_PIS'
      'VLR_CUSTO=VLR_CUSTO'
      'VLR_IR_VENDA=VLR_IR_VENDA'
      'VLR_CSLL_VENDA=VLR_CSLL_VENDA'
      'VLR_TOTAL_BRU=VLR_TOTAL_BRU'
      'VLR_TOTAL_LIQ=VLR_TOTAL_LIQ'
      'BASE_FCP_ST=BASE_FCP_ST'
      'BASE_ICMS_FCP=BASE_ICMS_FCP'
      'BASE_ICMS_FCP_DEST=BASE_ICMS_FCP_DEST'
      'VLR_ICMS_FCP_DEST=VLR_ICMS_FCP_DEST'
      'VLR_ICMS_FCP=VLR_ICMS_FCP'
      'VLR_FCP_ST=VLR_FCP_ST'
      'DEVOLUCAO=DEVOLUCAO'
      'VLR_ISSQN=VLR_ISSQN'
      'VLR_ISSQN_RETIDO=VLR_ISSQN_RETIDO')
    DataSource = dsConsData
    BCDToCurrency = False
    Left = 173
    Top = 284
  end
  object sdsComprasServico_Item: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'with ITEM'#13#10'as (select NI.ID, NI.ITEM, NI.ID_PRODUTO, P.REFERENCI' +
      'A, P.NOME, NI.UNIDADE, NI.QTD, NI.VLR_UNITARIO, NI.VLR_TOTAL,'#13#10' ' +
      '          '#39'NTE'#39' TIPO_REGISTRO'#13#10'    from NOTAFISCAL_ITENS NI'#13#10'   ' +
      ' inner join PRODUTO P on NI.ID_PRODUTO = P.ID'#13#10'    union all'#13#10'  ' +
      '  select NSI.ID, NSI.ITEM, NSI.ID_SERVICO_INT, '#39#39', SI.NOME, '#39'UN'#39 +
      ', NSI.QTD, NSI.VLR_UNITARIO, NSI.VLR_TOTAL,'#13#10'           '#39'NS'#39' TIP' +
      'O_REGISTRO'#13#10'    from NOTASERVICO_ITENS NSI'#13#10'    left join SERVIC' +
      'O_INT SI on SI.ID = NSI.ID_SERVICO_INT)'#13#10'select ITEM.*'#13#10'from ITE' +
      'M'#13#10'where 0=0 and ITEM.ID = :ID AND ITEM.TIPO_REGISTRO = :TREG'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TREG'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 296
    Top = 248
  end
  object dspComprasServico_Item: TDataSetProvider
    DataSet = sdsComprasServico_Item
    Left = 336
    Top = 248
  end
  object cdsComprasServico_Item: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComprasServico_Item'
    Left = 376
    Top = 248
    object cdsComprasServico_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsComprasServico_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsComprasServico_ItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsComprasServico_ItemREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsComprasServico_ItemNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsComprasServico_ItemUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsComprasServico_ItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsComprasServico_ItemVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object cdsComprasServico_ItemVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsComprasServico_ItemTIPO_REGISTRO: TStringField
      FieldName = 'TIPO_REGISTRO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dsComprasServico_Item: TDataSource
    DataSet = cdsComprasServico_Item
    Left = 424
    Top = 248
  end
  object frxComprasServicoItem: TfrxDBDataset
    UserName = 'frxComprasServicoItem'
    OnFirst = frxComprasServicoItemFirst
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ITEM=ITEM'
      'ID_PRODUTO=ID_PRODUTO'
      'REFERENCIA=REFERENCIA'
      'NOME=NOME'
      'UNIDADE=UNIDADE'
      'QTD=QTD'
      'VLR_UNITARIO=VLR_UNITARIO'
      'VLR_TOTAL=VLR_TOTAL'
      'TIPO_REGISTRO=TIPO_REGISTRO')
    DataSource = dsComprasServico_Item
    BCDToCurrency = False
    Left = 96
    Top = 336
  end
  object sdsCSTICMS_CFOP: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT distinct icms.cod_cst, i.perc_diferimento, i.perc_base_ic' +
      'ms_red, i.perc_tribicms,'#13#10'cfop.codcfop, ICMS.historico'#13#10'from not' +
      'afiscal n'#13#10'inner join notafiscal_itens i'#13#10'on n.id = i.id'#13#10'inner ' +
      'join tab_csticms icms'#13#10'on i.id_csticms = icms.id'#13#10'inner join tab' +
      '_cfop cfop'#13#10'on i.id_cfop = cfop.id'#13#10'where n.tipo_reg = '#39'NTS'#39#13#10'  ' +
      'and n.cancelada = '#39'N'#39#13#10'  and n.nfedenegada = '#39'N'#39#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 612
    Top = 34
  end
  object dspCSTICMS_CFOP: TDataSetProvider
    DataSet = sdsCSTICMS_CFOP
    Left = 644
    Top = 35
  end
  object cdsCSTICMS_CFOP: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODCFOP;COD_CST'
    Params = <>
    ProviderName = 'dspCSTICMS_CFOP'
    Left = 676
    Top = 37
    object cdsCSTICMS_CFOPCOD_CST: TStringField
      FieldName = 'COD_CST'
      Size = 3
    end
    object cdsCSTICMS_CFOPPERC_DIFERIMENTO: TFloatField
      FieldName = 'PERC_DIFERIMENTO'
      DisplayFormat = '##0.000##'
    end
    object cdsCSTICMS_CFOPPERC_BASE_ICMS_RED: TFloatField
      FieldName = 'PERC_BASE_ICMS_RED'
      DisplayFormat = '##0.000##'
    end
    object cdsCSTICMS_CFOPPERC_TRIBICMS: TFloatField
      FieldName = 'PERC_TRIBICMS'
      DisplayFormat = '##0.000##'
    end
    object cdsCSTICMS_CFOPCODCFOP: TStringField
      FieldName = 'CODCFOP'
      Size = 5
    end
    object cdsCSTICMS_CFOPHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsCSTICMS_CFOP: TDataSource
    DataSet = cdsCSTICMS_CFOP
    Left = 708
    Top = 36
  end
  object frxCSTICMS_CFOP: TfrxDBDataset
    UserName = 'frxCSTICMS_CFOP'
    OnFirst = frxComprasServicoItemFirst
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CST=COD_CST'
      'PERC_DIFERIMENTO=PERC_DIFERIMENTO'
      'PERC_BASE_ICMS_RED=PERC_BASE_ICMS_RED'
      'PERC_TRIBICMS=PERC_TRIBICMS'
      'CODCFOP=CODCFOP'
      'HISTORICO=HISTORICO')
    DataSource = dsCSTICMS_CFOP
    BCDToCurrency = False
    Left = 732
    Top = 61
  end
  object mAuxiliarICMS: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ID_Tipo'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID_CFOP'
        DataType = ftInteger
      end
      item
        Name = 'Cod_CFOP'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Cod_CSTICMS'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ID_Lei'
        DataType = ftInteger
      end
      item
        Name = 'ID_CSTICMS'
        DataType = ftInteger
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Produto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Lei_CST'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Lei'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Lei_Cadastro'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Perc_Trib'
        DataType = ftFloat
      end
      item
        Name = 'Perc_Diferimento'
        DataType = ftFloat
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnNewRecord = mAuxiliarICMSNewRecord
    Left = 700
    Top = 203
    Data = {
      B50100009619E0BD010000001800000011000000000003000000B50104546970
      6F01004900000001000557494454480200020023000749445F5469706F040001
      0000000000044E6F6D6501004900000001000557494454480200020064000749
      445F43464F50040001000000000008436F645F43464F50010049000000010005
      57494454480200020005000B436F645F43535449434D53010049000000010005
      57494454480200020003000649445F4C656904000100000000000A49445F4353
      5449434D5304000100000000000A49445F50726F6475746F0400010000000000
      0C4E6F6D655F50726F6475746F01004900000001000557494454480200020064
      000A5265666572656E6369610100490000000100055749445448020002001400
      074C65695F435354010049000000010005574944544802000200FA00034C6569
      010049000000010005574944544802000200FA000C4C65695F43616461737472
      6F010049000000010005574944544802000200FA0009506572635F5472696208
      0004000000000010506572635F4469666572696D656E746F0800040000000000
      02554601004900000001000557494454480200020002000000}
    object mAuxiliarICMSTipo: TStringField
      FieldName = 'Tipo'
      Size = 35
    end
    object mAuxiliarICMSID_Tipo: TIntegerField
      FieldName = 'ID_Tipo'
    end
    object mAuxiliarICMSNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object mAuxiliarICMSID_CFOP: TIntegerField
      FieldName = 'ID_CFOP'
    end
    object mAuxiliarICMSCod_CFOP: TStringField
      FieldName = 'Cod_CFOP'
      Size = 5
    end
    object mAuxiliarICMSCod_CSTICMS: TStringField
      FieldName = 'Cod_CSTICMS'
      Size = 3
    end
    object mAuxiliarICMSID_Lei: TIntegerField
      FieldName = 'ID_Lei'
    end
    object mAuxiliarICMSID_CSTICMS: TIntegerField
      FieldName = 'ID_CSTICMS'
    end
    object mAuxiliarICMSID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mAuxiliarICMSNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 100
    end
    object mAuxiliarICMSReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mAuxiliarICMSLei_CST: TStringField
      FieldName = 'Lei_CST'
      Size = 250
    end
    object mAuxiliarICMSLei: TStringField
      FieldName = 'Lei'
      Size = 250
    end
    object mAuxiliarICMSLei_Cadastro: TStringField
      FieldName = 'Lei_Cadastro'
      Size = 250
    end
    object mAuxiliarICMSPerc_Trib: TFloatField
      FieldName = 'Perc_Trib'
    end
    object mAuxiliarICMSPerc_Diferimento: TFloatField
      FieldName = 'Perc_Diferimento'
    end
    object mAuxiliarICMSUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object dsmAuxiliarICMS: TDataSource
    DataSet = mAuxiliarICMS
    Left = 728
    Top = 209
  end
  object frxmAuxiliarICMS: TfrxDBDataset
    UserName = 'frxmAuxiliarICMS'
    OnFirst = frxComprasServicoItemFirst
    CloseDataSource = False
    FieldAliases.Strings = (
      'Tipo=Tipo'
      'ID_Tipo=ID_Tipo'
      'Nome=Nome'
      'ID_CFOP=ID_CFOP'
      'Cod_CFOP=Cod_CFOP'
      'Cod_CSTICMS=Cod_CSTICMS'
      'ID_Lei=ID_Lei'
      'ID_CSTICMS=ID_CSTICMS'
      'ID_Produto=ID_Produto'
      'Nome_Produto=Nome_Produto'
      'Referencia=Referencia'
      'Lei_CST=Lei_CST'
      'Lei=Lei'
      'Lei_Cadastro=Lei_Cadastro'
      'Perc_Trib=Perc_Trib'
      'Perc_Diferimento=Perc_Diferimento'
      'UF=UF')
    DataSource = dsmAuxiliarICMS
    BCDToCurrency = False
    Left = 751
    Top = 228
  end
  object sdsConsFatConsumo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT N.numnota, N.dtemissao, i.id_produto, pcm.id_material, pc' +
      'm.id_cor, pcm.qtd_consumo, i.qtd,'#13#10'mat.nome nome_material, i.uni' +
      'dade UNIDADE_NOTA, mat.tipo_reg, PCM.unidade UNIDADE_MAT,'#13#10'PROD.' +
      'UNIDADE UNIDADE_PROD'#13#10'FROM NOTAFISCAL N'#13#10'INNER JOIN NOTAFISCAL_I' +
      'TENS I ON N.ID = I.ID'#13#10'inner join produto PROD on i.id_produto =' +
      ' prod.id'#13#10'inner join tab_cfop cf on cf.id = i.id_cfop'#13#10'iNNER JOI' +
      'N PRODUTO_COMB PCOMB ON (I.id_produto = PCOMB.ID AND I.id_cor = ' +
      'PCOMB.id_cor_combinacao)'#13#10'INNER JOIN PRODUTO_COMB_MAT PCM ON (I.' +
      'ID_produto = PCM.ID AND PCOMB.ITEM = PCM.ITEM)'#13#10'inner join produ' +
      'to mat on mat.id = pcm.id_material'#13#10'where n.tipo_reg = '#39'NTS'#39#13#10'  ' +
      'and n.cancelada = '#39'N'#39#13#10'  and n.nfedenegada = '#39'N'#39#13#10'  and cf.fatur' +
      'amento = '#39'S'#39#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 635
    Top = 324
  end
  object dspConsFatConsumo: TDataSetProvider
    DataSet = sdsConsFatConsumo
    Left = 697
    Top = 320
  end
  object cdsConsFatConsumo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsFatConsumo'
    Left = 763
    Top = 322
    object cdsConsFatConsumoNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsConsFatConsumoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsFatConsumoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsFatConsumoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsConsFatConsumoID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsConsFatConsumoQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsConsFatConsumoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsFatConsumoNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsFatConsumoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object cdsConsFatConsumoUNIDADE_MAT: TStringField
      FieldName = 'UNIDADE_MAT'
      Size = 6
    end
    object cdsConsFatConsumoUNIDADE_NOTA: TStringField
      FieldName = 'UNIDADE_NOTA'
      Size = 6
    end
    object cdsConsFatConsumoUNIDADE_PROD: TStringField
      FieldName = 'UNIDADE_PROD'
      Size = 6
    end
  end
  object mConsumo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Material'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Material'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'Semi'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 610
    Top = 283
    Data = {
      910000009619E0BD01000000180000000500000000000300000091000B49445F
      4D6174657269616C04000100000000000D4E6F6D655F4D6174657269616C0100
      49000000010005574944544802000200640007556E6964616465010049000000
      01000557494454480200020006000351746408000400000000000453656D6901
      004900000001000557494454480200020001000000}
    object mConsumoID_Material: TIntegerField
      FieldName = 'ID_Material'
    end
    object mConsumoNome_Material: TStringField
      FieldName = 'Nome_Material'
      Size = 100
    end
    object mConsumoUnidade: TStringField
      FieldName = 'Unidade'
      Size = 6
    end
    object mConsumoQtd: TFloatField
      FieldName = 'Qtd'
      DisplayFormat = '0.0000#'
    end
    object mConsumoSemi: TStringField
      FieldName = 'Semi'
      Size = 1
    end
  end
  object dsmConsumo: TDataSource
    DataSet = mConsumo
    Left = 649
    Top = 284
  end
  object frxmConsumo: TfrxDBDataset
    UserName = 'frxmConsumo'
    OnFirst = frxComprasServicoItemFirst
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_Material=ID_Material'
      'Nome_Material=Nome_Material'
      'Unidade=Unidade'
      'Qtd=Qtd'
      'Semi=Semi')
    DataSource = dsmConsumo
    BCDToCurrency = False
    Left = 684
    Top = 282
  end
end
