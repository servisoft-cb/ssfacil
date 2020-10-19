object frmGerarEstoque_Mov: TfrmGerarEstoque_Mov
  Left = 180
  Top = 46
  Width = 827
  Height = 590
  Caption = 'frmGerarEstoque_Mov'
  Color = 16772313
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzProgressStatus1: TRzProgressStatus
    Left = 20
    Top = 315
    Width = 673
    ParentShowHint = False
    PartsComplete = 0
    Percent = 0
    ShowPercent = True
    TotalParts = 0
  end
  object RzLabel1: TRzLabel
    Left = 27
    Top = 282
    Width = 6
    Height = 18
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 48
    Top = 16
    Width = 56
    Height = 13
    Caption = 'Data Inicial:'
  end
  object Label2: TLabel
    Left = 53
    Top = 38
    Width = 51
    Height = 13
    Caption = 'Data Final:'
  end
  object btnNotaFiscal: TNxButton
    Left = 20
    Top = 107
    Width = 245
    Height = 30
    Caption = 'Carregar Notas Entrada/Sa'#237'da'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    GlyphSpacing = 5
    ParentFont = False
    TabOrder = 0
    Transparent = True
    OnClick = btnNotaFiscalClick
  end
  object DateEdit1: TDateEdit
    Left = 108
    Top = 8
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object DateEdit2: TDateEdit
    Left = 108
    Top = 30
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object btnCupom: TNxButton
    Left = 21
    Top = 140
    Width = 245
    Height = 30
    Caption = 'Carregar Cupom Fiscal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    GlyphSpacing = 5
    ParentFont = False
    TabOrder = 3
    Transparent = True
    OnClick = btnCupomClick
  end
  object btnDocEstoque: TNxButton
    Left = 20
    Top = 172
    Width = 245
    Height = 30
    Caption = 'Carregar Documento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    GlyphSpacing = 5
    ParentFont = False
    TabOrder = 4
    Transparent = True
    OnClick = btnDocEstoqueClick
  end
  object btnInventario: TNxButton
    Left = 21
    Top = 204
    Width = 245
    Height = 30
    Caption = 'Carregar Invent'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    GlyphSpacing = 5
    ParentFont = False
    TabOrder = 5
    Transparent = True
    OnClick = btnInventarioClick
  end
  object sdsCupomFiscal: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select CF.ID, CF.FILIAL, CF.DTEMISSAO, CF.ID_CLIENTE, CF.NUMCUPO' +
      'M, CF.ID_LOCALESTOQUE, SERIE'#13#10'from CUPOMFISCAL CF'#13#10'where CF.CANC' +
      'ELADO = '#39'N'#39' and'#13#10'      CF.NFEDENEGADA = '#39'N'#39'   '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 555
    Top = 22
  end
  object dspCupomFiscal: TDataSetProvider
    DataSet = sdsCupomFiscal
    UpdateMode = upWhereKeyOnly
    Left = 595
    Top = 22
  end
  object cdsCupomFiscal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCupomFiscal'
    Left = 635
    Top = 22
    object cdsCupomFiscalID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCupomFiscalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsCupomFiscalDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsCupomFiscalID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsCupomFiscalNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object cdsCupomFiscalID_LOCALESTOQUE: TIntegerField
      FieldName = 'ID_LOCALESTOQUE'
    end
    object cdsCupomFiscalSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
  end
  object qFilial: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM FILIAL'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 719
    Top = 176
    object qFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qFilialNOME_INTERNO: TStringField
      FieldName = 'NOME_INTERNO'
      Size = 30
    end
    object qFilialENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object qFilialCOMPLEMENTO_END: TStringField
      FieldName = 'COMPLEMENTO_END'
      Size = 60
    end
    object qFilialNUM_END: TStringField
      FieldName = 'NUM_END'
      Size = 15
    end
    object qFilialBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qFilialCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object qFilialID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
    end
    object qFilialCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object qFilialUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qFilialDDD1: TIntegerField
      FieldName = 'DDD1'
    end
    object qFilialFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object qFilialDDD2: TIntegerField
      FieldName = 'DDD2'
    end
    object qFilialFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object qFilialDDDFAX: TIntegerField
      FieldName = 'DDDFAX'
    end
    object qFilialFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object qFilialPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object qFilialCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object qFilialINSCR_EST: TStringField
      FieldName = 'INSCR_EST'
      Size = 18
    end
    object qFilialSIMPLES: TStringField
      FieldName = 'SIMPLES'
      FixedChar = True
      Size = 1
    end
    object qFilialENDLOGO: TStringField
      FieldName = 'ENDLOGO'
      Size = 250
    end
    object qFilialCALCULAR_IPI: TStringField
      FieldName = 'CALCULAR_IPI'
      FixedChar = True
      Size = 1
    end
    object qFilialINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object qFilialINSCMUNICIPAL: TStringField
      FieldName = 'INSCMUNICIPAL'
      Size = 18
    end
    object qFilialCNAE: TStringField
      FieldName = 'CNAE'
      Size = 7
    end
    object qFilialHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 250
    end
    object qFilialID_REGIME_TRIB: TIntegerField
      FieldName = 'ID_REGIME_TRIB'
    end
    object qFilialID_PIS: TIntegerField
      FieldName = 'ID_PIS'
    end
    object qFilialID_COFINS: TIntegerField
      FieldName = 'ID_COFINS'
    end
    object qFilialTIPO_PIS: TStringField
      FieldName = 'TIPO_PIS'
      Size = 2
    end
    object qFilialTIPO_COFINS: TStringField
      FieldName = 'TIPO_COFINS'
      Size = 2
    end
    object qFilialPERC_PIS: TFloatField
      FieldName = 'PERC_PIS'
    end
    object qFilialPERC_COFINS: TFloatField
      FieldName = 'PERC_COFINS'
    end
    object qFilialID_CSTICMS: TIntegerField
      FieldName = 'ID_CSTICMS'
    end
    object qFilialID_CSTIPI: TIntegerField
      FieldName = 'ID_CSTIPI'
    end
    object qFilialEMAIL_NFE: TStringField
      FieldName = 'EMAIL_NFE'
      Size = 200
    end
    object qFilialDTESTOQUE: TDateField
      FieldName = 'DTESTOQUE'
    end
    object qFilialPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      FixedChar = True
      Size = 1
    end
    object qFilialLIBERADO_ATE: TStringField
      FieldName = 'LIBERADO_ATE'
      Size = 18
    end
    object qFilialULTIMO_ACESSO: TStringField
      FieldName = 'ULTIMO_ACESSO'
      Size = 18
    end
    object qFilialUSARICMSSIMPLES: TStringField
      FieldName = 'USARICMSSIMPLES'
      FixedChar = True
      Size = 1
    end
    object qFilialSERIENORMAL: TStringField
      FieldName = 'SERIENORMAL'
      Size = 3
    end
    object qFilialID_REGIME_TRIB_NFSE: TIntegerField
      FieldName = 'ID_REGIME_TRIB_NFSE'
    end
    object qFilialINCENTIVO_CULTURAL: TStringField
      FieldName = 'INCENTIVO_CULTURAL'
      FixedChar = True
      Size = 1
    end
    object qFilialSERIE_NFSE: TStringField
      FieldName = 'SERIE_NFSE'
      Size = 5
    end
    object qFilialID_NATUREZA: TIntegerField
      FieldName = 'ID_NATUREZA'
    end
    object qFilialID_SERVICO_SINT: TIntegerField
      FieldName = 'ID_SERVICO_SINT'
    end
    object qFilialID_SERVICO_PAD: TIntegerField
      FieldName = 'ID_SERVICO_PAD'
    end
    object qFilialPERC_IR: TFloatField
      FieldName = 'PERC_IR'
    end
    object qFilialVLR_IR_MINIMO: TFloatField
      FieldName = 'VLR_IR_MINIMO'
    end
    object qFilialPERC_ISS: TFloatField
      FieldName = 'PERC_ISS'
    end
    object qFilialCOD_TRIBUTACAO_MUNICIPIO: TStringField
      FieldName = 'COD_TRIBUTACAO_MUNICIPIO'
    end
    object qFilialNUMLOTE: TIntegerField
      FieldName = 'NUMLOTE'
    end
    object qFilialENDLOGO_NFSE: TStringField
      FieldName = 'ENDLOGO_NFSE'
      Size = 200
    end
    object qFilialPERC_CSLL: TFloatField
      FieldName = 'PERC_CSLL'
    end
    object qFilialCNAE_NFSE: TStringField
      FieldName = 'CNAE_NFSE'
      Size = 7
    end
    object qFilialPERC_INSS: TFloatField
      FieldName = 'PERC_INSS'
    end
    object qFilialID_ATIVIDADE_CID: TIntegerField
      FieldName = 'ID_ATIVIDADE_CID'
    end
    object qFilialNFSE_HOMOLOGACAO: TStringField
      FieldName = 'NFSE_HOMOLOGACAO'
      FixedChar = True
      Size = 1
    end
    object qFilialPERC_CSRF: TFloatField
      FieldName = 'PERC_CSRF'
    end
    object qFilialVLR_FATURAMENTO_MES_CSRF: TFloatField
      FieldName = 'VLR_FATURAMENTO_MES_CSRF'
    end
    object qFilialPERC_TRIB_SERV: TFloatField
      FieldName = 'PERC_TRIB_SERV'
    end
    object qFilialPERC_TRIB_NTS_IND: TFloatField
      FieldName = 'PERC_TRIB_NTS_IND'
    end
    object qFilialPERC_TRIB_NTS_VEN: TFloatField
      FieldName = 'PERC_TRIB_NTS_VEN'
    end
    object qFilialPERC_TRIB_NTS_IND_EXP: TFloatField
      FieldName = 'PERC_TRIB_NTS_IND_EXP'
    end
    object qFilialPERC_TRIB_NTS_VEN_EXP: TFloatField
      FieldName = 'PERC_TRIB_NTS_VEN_EXP'
    end
    object qFilialPERC_LISTA_CAMEX: TFloatField
      FieldName = 'PERC_LISTA_CAMEX'
    end
    object qFilialIMPRESSAO_MATRICIAL: TStringField
      FieldName = 'IMPRESSAO_MATRICIAL'
      FixedChar = True
      Size = 1
    end
    object qFilialID_CONTABILISTA: TIntegerField
      FieldName = 'ID_CONTABILISTA'
    end
    object qFilialINSCR_SUFRAMA: TStringField
      FieldName = 'INSCR_SUFRAMA'
      Size = 10
    end
    object qFilialSPED_PERFIL: TStringField
      FieldName = 'SPED_PERFIL'
      FixedChar = True
      Size = 1
    end
    object qFilialSPED_ATIVIDADE: TStringField
      FieldName = 'SPED_ATIVIDADE'
      FixedChar = True
      Size = 1
    end
    object qFilialEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object qFilialLICENCA_FEPAM: TStringField
      FieldName = 'LICENCA_FEPAM'
      Size = 15
    end
  end
  object qProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ID, TIPO_REG, NOME, REFERENCIA, UNIDADE'
      'FROM PRODUTO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 720
    Top = 224
    object qProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProdutoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object qProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
  end
  object qParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT USA_CUPOM_FISCAL, ATUALIZAR_PRECO_DOC, USA_LOCAL_ESTOQUE'
      'FROM PARAMETROS')
    SQLConnection = dmDatabase.scoDados
    Left = 720
    Top = 288
    object qParametrosUSA_CUPOM_FISCAL: TStringField
      FieldName = 'USA_CUPOM_FISCAL'
      FixedChar = True
      Size = 1
    end
    object qParametrosATUALIZAR_PRECO_DOC: TStringField
      FieldName = 'ATUALIZAR_PRECO_DOC'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_LOCAL_ESTOQUE: TStringField
      FieldName = 'USA_LOCAL_ESTOQUE'
      FixedChar = True
      Size = 1
    end
  end
  object sdsNota: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM NOTAFISCAL'#13#10'WHERE CANCELADA = '#39'N'#39#13#10'  AND NFEDENEG' +
      'ADA = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 544
    Top = 480
  end
  object dspNota: TDataSetProvider
    DataSet = sdsNota
    Left = 576
    Top = 480
  end
  object cdsNota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNota'
    Left = 616
    Top = 480
    object cdsNotaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNotaTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object cdsNotaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsNotaSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsNotaNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsNotaDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsNotaID_CFOP: TIntegerField
      FieldName = 'ID_CFOP'
    end
    object cdsNotaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsNotaID_CONDPGTO: TIntegerField
      FieldName = 'ID_CONDPGTO'
    end
    object cdsNotaID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsNotaBASE_ICMS: TFloatField
      FieldName = 'BASE_ICMS'
    end
    object cdsNotaVLR_ICMS: TFloatField
      FieldName = 'VLR_ICMS'
    end
    object cdsNotaVLR_IPI: TFloatField
      FieldName = 'VLR_IPI'
    end
    object cdsNotaVLR_NOTA: TFloatField
      FieldName = 'VLR_NOTA'
    end
    object cdsNotaVLR_ITENS: TFloatField
      FieldName = 'VLR_ITENS'
    end
    object cdsNotaVLR_DUPLICATA: TFloatField
      FieldName = 'VLR_DUPLICATA'
    end
    object cdsNotaVLR_ENTRADA: TFloatField
      FieldName = 'VLR_ENTRADA'
    end
    object cdsNotaPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object cdsNotaVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object cdsNotaVLR_FRETE: TFloatField
      FieldName = 'VLR_FRETE'
    end
    object cdsNotaVLR_SEGURO: TFloatField
      FieldName = 'VLR_SEGURO'
    end
    object cdsNotaVLR_OUTRASDESP: TFloatField
      FieldName = 'VLR_OUTRASDESP'
    end
    object cdsNotaBASE_ICMSTRANSF: TFloatField
      FieldName = 'BASE_ICMSTRANSF'
    end
    object cdsNotaPERC_TRANSF: TFloatField
      FieldName = 'PERC_TRANSF'
    end
    object cdsNotaVLR_TRANSF: TFloatField
      FieldName = 'VLR_TRANSF'
    end
    object cdsNotaVLR_PIS: TFloatField
      FieldName = 'VLR_PIS'
    end
    object cdsNotaVLR_COFINS: TFloatField
      FieldName = 'VLR_COFINS'
    end
    object cdsNotaVLR_TAXACISCOMEX: TFloatField
      FieldName = 'VLR_TAXACISCOMEX'
    end
    object cdsNotaVLR_OUTROS: TFloatField
      FieldName = 'VLR_OUTROS'
    end
    object cdsNotaBASE_ICMSSIMPLES: TFloatField
      FieldName = 'BASE_ICMSSIMPLES'
    end
    object cdsNotaVLR_ICMSSIMPLES: TFloatField
      FieldName = 'VLR_ICMSSIMPLES'
    end
    object cdsNotaPERC_ICMSSIMPLES: TFloatField
      FieldName = 'PERC_ICMSSIMPLES'
    end
    object cdsNotaVLR_IMPORTACAO: TFloatField
      FieldName = 'VLR_IMPORTACAO'
    end
    object cdsNotaBASE_ICMSSUBST: TFloatField
      FieldName = 'BASE_ICMSSUBST'
    end
    object cdsNotaVLR_ICMSSUBST: TFloatField
      FieldName = 'VLR_ICMSSUBST'
    end
    object cdsNotaBASE_ICMSOUTROS: TFloatField
      FieldName = 'BASE_ICMSOUTROS'
    end
    object cdsNotaVLR_ICMSOUTROS: TFloatField
      FieldName = 'VLR_ICMSOUTROS'
    end
    object cdsNotaVLR_DUPLICATAOUTROS: TFloatField
      FieldName = 'VLR_DUPLICATAOUTROS'
    end
    object cdsNotaVLR_ADUANEIRA: TFloatField
      FieldName = 'VLR_ADUANEIRA'
    end
    object cdsNotaPERC_ICMS_PISCOFINS: TFloatField
      FieldName = 'PERC_ICMS_PISCOFINS'
    end
    object cdsNotaPERC_ICMS_OUTROSVALORES: TFloatField
      FieldName = 'PERC_ICMS_OUTROSVALORES'
    end
    object cdsNotaPERC_ICMS_FRETE: TFloatField
      FieldName = 'PERC_ICMS_FRETE'
    end
    object cdsNotaPERC_DESCONTOORIG: TFloatField
      FieldName = 'PERC_DESCONTOORIG'
    end
    object cdsNotaQTDVOLUME: TIntegerField
      FieldName = 'QTDVOLUME'
    end
    object cdsNotaESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 30
    end
    object cdsNotaMARCA: TStringField
      FieldName = 'MARCA'
      Size = 30
    end
    object cdsNotaNUMEROVOLUME: TStringField
      FieldName = 'NUMEROVOLUME'
      Size = 30
    end
    object cdsNotaPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object cdsNotaPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object cdsNotaPLACA: TStringField
      FieldName = 'PLACA'
      Size = 8
    end
    object cdsNotaUFPLACA: TStringField
      FieldName = 'UFPLACA'
      Size = 2
    end
    object cdsNotaTIPO_FRETE: TStringField
      FieldName = 'TIPO_FRETE'
      Size = 1
    end
    object cdsNotaID_TRANSPORTADORA: TIntegerField
      FieldName = 'ID_TRANSPORTADORA'
    end
    object cdsNotaID_REDESPACHO: TIntegerField
      FieldName = 'ID_REDESPACHO'
    end
    object cdsNotaTIPO_NOTA: TStringField
      FieldName = 'TIPO_NOTA'
      FixedChar = True
      Size = 1
    end
    object cdsNotaCANCELADA: TStringField
      FieldName = 'CANCELADA'
      FixedChar = True
      Size = 1
    end
    object cdsNotaMOTIVO_CANCELADA: TStringField
      FieldName = 'MOTIVO_CANCELADA'
      Size = 100
    end
    object cdsNotaDTSAIDAENTRADA: TDateField
      FieldName = 'DTSAIDAENTRADA'
    end
    object cdsNotaHRSAIDAENTRADA: TTimeField
      FieldName = 'HRSAIDAENTRADA'
    end
    object cdsNotaID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsNotaLOCALENTREGA: TStringField
      FieldName = 'LOCALENTREGA'
      Size = 1
    end
    object cdsNotaID_EXTCOMISSAO: TIntegerField
      FieldName = 'ID_EXTCOMISSAO'
    end
    object cdsNotaDESCRICAO_DESC: TStringField
      FieldName = 'DESCRICAO_DESC'
      Size = 70
    end
    object cdsNotaID_CLIENTETRIANG: TIntegerField
      FieldName = 'ID_CLIENTETRIANG'
    end
    object cdsNotaQTDTOTAL_ITENS: TIntegerField
      FieldName = 'QTDTOTAL_ITENS'
    end
    object cdsNotaNFERECIBO: TStringField
      FieldName = 'NFERECIBO'
      Size = 45
    end
    object cdsNotaNFEPROTOCOLO: TStringField
      FieldName = 'NFEPROTOCOLO'
      Size = 45
    end
    object cdsNotaNFECHAVEACESSO: TStringField
      FieldName = 'NFECHAVEACESSO'
      Size = 44
    end
    object cdsNotaNFEPROTOCOLO_CANCELADA: TStringField
      FieldName = 'NFEPROTOCOLO_CANCELADA'
      Size = 45
    end
    object cdsNotaTIPO_ENVIONFE: TStringField
      FieldName = 'TIPO_ENVIONFE'
      Size = 25
    end
    object cdsNotaNFECODBARRA_CONTINGENCIA: TStringField
      FieldName = 'NFECODBARRA_CONTINGENCIA'
      Size = 44
    end
    object cdsNotaNFEVERSAO: TStringField
      FieldName = 'NFEVERSAO'
      Size = 10
    end
    object cdsNotaNFEFINALIDADE: TStringField
      FieldName = 'NFEFINALIDADE'
      Size = 1
    end
    object cdsNotaNFEAMBIENTE: TStringField
      FieldName = 'NFEAMBIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsNotaNUMNOTACOPIADA: TIntegerField
      FieldName = 'NUMNOTACOPIADA'
    end
    object cdsNotaSERIECOPIADA: TStringField
      FieldName = 'SERIECOPIADA'
      Size = 3
    end
    object cdsNotaDTCONTINGENCIA: TDateField
      FieldName = 'DTCONTINGENCIA'
    end
    object cdsNotaHRCONTINGENCIA: TTimeField
      FieldName = 'HRCONTINGENCIA'
    end
    object cdsNotaMOTIVO_CONTINGENCIA: TStringField
      FieldName = 'MOTIVO_CONTINGENCIA'
      Size = 250
    end
    object cdsNotaNFEVERSAOEMISSAO: TStringField
      FieldName = 'NFEVERSAOEMISSAO'
    end
    object cdsNotaID_REGIMETRIB: TIntegerField
      FieldName = 'ID_REGIMETRIB'
    end
    object cdsNotaRNTC: TStringField
      FieldName = 'RNTC'
    end
    object cdsNotaVAGAOBALSA_IDENTIF: TStringField
      FieldName = 'VAGAOBALSA_IDENTIF'
    end
    object cdsNotaVAGAOBALSA_TIPOIDENTIF: TStringField
      FieldName = 'VAGAOBALSA_TIPOIDENTIF'
      Size = 1
    end
    object cdsNotaUFEMBEXPORTACAO: TStringField
      FieldName = 'UFEMBEXPORTACAO'
      Size = 2
    end
    object cdsNotaLOCALEMBEXPORTACAO: TStringField
      FieldName = 'LOCALEMBEXPORTACAO'
      Size = 60
    end
    object cdsNotaPISCOFINS_SOMAROUTRASDESP: TStringField
      FieldName = 'PISCOFINS_SOMAROUTRASDESP'
      FixedChar = True
      Size = 1
    end
    object cdsNotaTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Size = 1
    end
    object cdsNotaGERARDUPL_OUTROSVALORES: TStringField
      FieldName = 'GERARDUPL_OUTROSVALORES'
      FixedChar = True
      Size = 1
    end
    object cdsNotaGERARDUPL_FRETE: TStringField
      FieldName = 'GERARDUPL_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsNotaGERARDUPL_SEGURO: TStringField
      FieldName = 'GERARDUPL_SEGURO'
      FixedChar = True
      Size = 1
    end
    object cdsNotaINFORMADO_NUMNOTAMANUAL: TStringField
      FieldName = 'INFORMADO_NUMNOTAMANUAL'
      FixedChar = True
      Size = 1
    end
    object cdsNotaNFEDENEGADA: TStringField
      FieldName = 'NFEDENEGADA'
      FixedChar = True
      Size = 1
    end
    object cdsNotaMOTIVO_DENEGADA: TStringField
      FieldName = 'MOTIVO_DENEGADA'
      Size = 250
    end
    object cdsNotaDADOS_ADICIONAIS: TMemoField
      FieldName = 'DADOS_ADICIONAIS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsNotaDTINICIO_DUPLICATA: TDateField
      FieldName = 'DTINICIO_DUPLICATA'
    end
    object cdsNotaTIPO_PRAZO: TStringField
      FieldName = 'TIPO_PRAZO'
      FixedChar = True
      Size = 1
    end
    object cdsNotaPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object cdsNotaSIMPLES_FILIAL: TStringField
      FieldName = 'SIMPLES_FILIAL'
      FixedChar = True
      Size = 1
    end
    object cdsNotaID_OPERACAO_NOTA: TIntegerField
      FieldName = 'ID_OPERACAO_NOTA'
    end
    object cdsNotaFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      FixedChar = True
      Size = 1
    end
    object cdsNotaID_VARIACAO: TIntegerField
      FieldName = 'ID_VARIACAO'
    end
    object cdsNotaSTATUS_MANIFESTO: TStringField
      FieldName = 'STATUS_MANIFESTO'
      Size = 3
    end
    object cdsNotaID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsNotaID_TIPO_COBRANCA: TIntegerField
      FieldName = 'ID_TIPO_COBRANCA'
    end
    object cdsNotaCALCULAR_IMP_ITEM: TStringField
      FieldName = 'CALCULAR_IMP_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsNotaGRAVOU_DADOSADICIONAIS: TStringField
      FieldName = 'GRAVOU_DADOSADICIONAIS'
      FixedChar = True
      Size = 1
    end
    object cdsNotaVLR_TRIBUTOS: TFloatField
      FieldName = 'VLR_TRIBUTOS'
    end
    object cdsNotaUSA_TRANSFICMS: TStringField
      FieldName = 'USA_TRANSFICMS'
      Size = 1
    end
    object cdsNotaID_NOTACOPIADA: TIntegerField
      FieldName = 'ID_NOTACOPIADA'
    end
    object cdsNotaID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsNotaNOTA_ESTORNO: TStringField
      FieldName = 'NOTA_ESTORNO'
      FixedChar = True
      Size = 1
    end
    object cdsNotaCOD_MODELO: TStringField
      FieldName = 'COD_MODELO'
      Size = 2
    end
    object cdsNotaCOD_CONS_EE: TStringField
      FieldName = 'COD_CONS_EE'
      Size = 2
    end
    object cdsNotaCOD_CONS_AGUA: TStringField
      FieldName = 'COD_CONS_AGUA'
      Size = 2
    end
    object cdsNotaVLR_ICMSSUBST_PROPRIO: TFloatField
      FieldName = 'VLR_ICMSSUBST_PROPRIO'
    end
    object cdsNotaBASE_ICMSSUBST_PROPRIO: TFloatField
      FieldName = 'BASE_ICMSSUBST_PROPRIO'
    end
    object cdsNotaHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsNotaTIPO_DESTINO_OPERACAO: TSmallintField
      FieldName = 'TIPO_DESTINO_OPERACAO'
    end
    object cdsNotaTIPO_CONSUMIDOR: TSmallintField
      FieldName = 'TIPO_CONSUMIDOR'
    end
    object cdsNotaTIPO_ATENDIMENTO: TSmallintField
      FieldName = 'TIPO_ATENDIMENTO'
    end
    object cdsNotaLOCALDESPEXPORTACAO: TStringField
      FieldName = 'LOCALDESPEXPORTACAO'
      Size = 60
    end
    object cdsNotaVLR_ICMSDESONERADO: TFloatField
      FieldName = 'VLR_ICMSDESONERADO'
    end
    object cdsNotaVLR_TRIBUTOS_ESTADUAL: TFloatField
      FieldName = 'VLR_TRIBUTOS_ESTADUAL'
    end
    object cdsNotaVLR_TRIBUTOS_MUNICIPAL: TFloatField
      FieldName = 'VLR_TRIBUTOS_MUNICIPAL'
    end
    object cdsNotaFONTE_TRIBUTOS: TStringField
      FieldName = 'FONTE_TRIBUTOS'
      Size = 30
    end
    object cdsNotaVERSAO_TRIBUTOS: TStringField
      FieldName = 'VERSAO_TRIBUTOS'
      Size = 15
    end
    object cdsNotaVLR_TRIBUTOS_FEDERAL: TFloatField
      FieldName = 'VLR_TRIBUTOS_FEDERAL'
    end
    object cdsNotaPERC_COMISSAO_PAGAR_NOTA: TFloatField
      FieldName = 'PERC_COMISSAO_PAGAR_NOTA'
    end
    object cdsNotaNFEENVIADA: TStringField
      FieldName = 'NFEENVIADA'
      FixedChar = True
      Size = 1
    end
    object cdsNotaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cdsNotaID_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'ID_LOCAL_ESTOQUE'
    end
    object cdsNotaVLR_ADIANTAMENTO: TFloatField
      FieldName = 'VLR_ADIANTAMENTO'
    end
    object cdsNotaVLR_ICMS_FCP: TFloatField
      FieldName = 'VLR_ICMS_FCP'
    end
    object cdsNotaVLR_ICMS_UF_DEST: TFloatField
      FieldName = 'VLR_ICMS_UF_DEST'
    end
    object cdsNotaVLR_ICMS_UF_REMET: TFloatField
      FieldName = 'VLR_ICMS_UF_REMET'
    end
    object cdsNotaVLR_BASE_COMISSAO: TFloatField
      FieldName = 'VLR_BASE_COMISSAO'
    end
    object cdsNotaNOTIFICACAO: TIntegerField
      FieldName = 'NOTIFICACAO'
    end
    object cdsNotaVLR_PIS_COFINS_SUFRAMA: TFloatField
      FieldName = 'VLR_PIS_COFINS_SUFRAMA'
    end
    object cdsNotaVLR_DESC_SUFRAMA: TFloatField
      FieldName = 'VLR_DESC_SUFRAMA'
    end
    object cdsNotaIBPT_CHAVE: TStringField
      FieldName = 'IBPT_CHAVE'
    end
    object cdsNotaVLR_AFRMM: TFloatField
      FieldName = 'VLR_AFRMM'
    end
    object cdsNotaGEROU_MDFE: TStringField
      FieldName = 'GEROU_MDFE'
      FixedChar = True
      Size = 1
    end
    object cdsNotaQTD_TOTAL_PRODUTOS: TFloatField
      FieldName = 'QTD_TOTAL_PRODUTOS'
    end
  end
  object dsNota: TDataSource
    DataSet = cdsNota
    Left = 656
    Top = 480
  end
  object sdsCupomFiscal_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CUPOMFISCAL_ITENS'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 555
    Top = 63
    object sdsCupomFiscal_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCupomFiscal_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCupomFiscal_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsCupomFiscal_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsCupomFiscal_ItensPERC_ICMS: TFloatField
      FieldName = 'PERC_ICMS'
    end
    object sdsCupomFiscal_ItensVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object sdsCupomFiscal_ItensPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object sdsCupomFiscal_ItensVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object sdsCupomFiscal_ItensBASE_ICMS: TFloatField
      FieldName = 'BASE_ICMS'
    end
    object sdsCupomFiscal_ItensVLR_ICMS: TFloatField
      FieldName = 'VLR_ICMS'
    end
    object sdsCupomFiscal_ItensVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object sdsCupomFiscal_ItensID_CFOP: TIntegerField
      FieldName = 'ID_CFOP'
    end
    object sdsCupomFiscal_ItensID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object sdsCupomFiscal_ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object sdsCupomFiscal_ItensCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscal_ItensSITTRIB: TStringField
      FieldName = 'SITTRIB'
      Size = 5
    end
    object sdsCupomFiscal_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object sdsCupomFiscal_ItensID_MOVIMENTO: TIntegerField
      FieldName = 'ID_MOVIMENTO'
    end
    object sdsCupomFiscal_ItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsCupomFiscal_ItensPERC_TRIBUTO: TFloatField
      FieldName = 'PERC_TRIBUTO'
    end
    object sdsCupomFiscal_ItensVLR_TRIBUTO: TFloatField
      FieldName = 'VLR_TRIBUTO'
    end
    object sdsCupomFiscal_ItensID_NCM: TIntegerField
      FieldName = 'ID_NCM'
    end
    object sdsCupomFiscal_ItensORIGEM_PROD: TStringField
      FieldName = 'ORIGEM_PROD'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscal_ItensPERC_TRIBUTO_ESTADUAL: TFloatField
      FieldName = 'PERC_TRIBUTO_ESTADUAL'
    end
    object sdsCupomFiscal_ItensPERC_TRIBUTO_MUNICIPAL: TFloatField
      FieldName = 'PERC_TRIBUTO_MUNICIPAL'
    end
    object sdsCupomFiscal_ItensPERC_TRIBUTO_FEDERAL: TFloatField
      FieldName = 'PERC_TRIBUTO_FEDERAL'
    end
    object sdsCupomFiscal_ItensFONTE_TRIBUTO: TStringField
      FieldName = 'FONTE_TRIBUTO'
      Size = 30
    end
    object sdsCupomFiscal_ItensVERSAO_TRIBUTO: TStringField
      FieldName = 'VERSAO_TRIBUTO'
      Size = 15
    end
    object sdsCupomFiscal_ItensVLR_TRIBUTO_FEDERAL: TFloatField
      FieldName = 'VLR_TRIBUTO_FEDERAL'
    end
    object sdsCupomFiscal_ItensVLR_TRIBUTO_ESTADUAL: TFloatField
      FieldName = 'VLR_TRIBUTO_ESTADUAL'
    end
    object sdsCupomFiscal_ItensVLR_TRIBUTO_MUNICIPAL: TFloatField
      FieldName = 'VLR_TRIBUTO_MUNICIPAL'
    end
    object sdsCupomFiscal_ItensID_CSTICMS: TIntegerField
      FieldName = 'ID_CSTICMS'
    end
    object sdsCupomFiscal_ItensID_CSTIPI: TIntegerField
      FieldName = 'ID_CSTIPI'
    end
    object sdsCupomFiscal_ItensID_COFINS: TIntegerField
      FieldName = 'ID_COFINS'
    end
    object sdsCupomFiscal_ItensID_PIS: TIntegerField
      FieldName = 'ID_PIS'
    end
    object sdsCupomFiscal_ItensPERC_TRIBICMS: TFloatField
      FieldName = 'PERC_TRIBICMS'
    end
    object sdsCupomFiscal_ItensID_VARIACAO: TIntegerField
      FieldName = 'ID_VARIACAO'
    end
    object sdsCupomFiscal_ItensPERC_PIS: TFloatField
      FieldName = 'PERC_PIS'
    end
    object sdsCupomFiscal_ItensPERC_COFINS: TFloatField
      FieldName = 'PERC_COFINS'
    end
    object sdsCupomFiscal_ItensPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object sdsCupomFiscal_ItensTIPO_PIS: TStringField
      FieldName = 'TIPO_PIS'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscal_ItensTIPO_COFINS: TStringField
      FieldName = 'TIPO_COFINS'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscal_ItensVLR_PIS: TFloatField
      FieldName = 'VLR_PIS'
    end
    object sdsCupomFiscal_ItensVLR_COFINS: TFloatField
      FieldName = 'VLR_COFINS'
    end
    object sdsCupomFiscal_ItensVLR_IPI: TFloatField
      FieldName = 'VLR_IPI'
    end
    object sdsCupomFiscal_ItensVLR_DESCONTORATEIO: TFloatField
      FieldName = 'VLR_DESCONTORATEIO'
    end
    object sdsCupomFiscal_ItensNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object sdsCupomFiscal_ItensITEM_ORIGINAL: TIntegerField
      FieldName = 'ITEM_ORIGINAL'
    end
    object sdsCupomFiscal_ItensID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsCupomFiscal_ItensITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsCupomFiscal_ItensNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object sdsCupomFiscal_ItensITEM_CLIENTE: TIntegerField
      FieldName = 'ITEM_CLIENTE'
    end
    object sdsCupomFiscal_ItensNUMERO_OC: TStringField
      FieldName = 'NUMERO_OC'
      Size = 30
    end
    object sdsCupomFiscal_ItensNUMERO_OS: TStringField
      FieldName = 'NUMERO_OS'
      Size = 30
    end
    object sdsCupomFiscal_ItensID_ENQIPI: TIntegerField
      FieldName = 'ID_ENQIPI'
    end
    object sdsCupomFiscal_ItensQTD_DEVOLVIDA: TFloatField
      FieldName = 'QTD_DEVOLVIDA'
    end
    object sdsCupomFiscal_ItensID_COR_COMBINACO: TIntegerField
      FieldName = 'ID_COR_COMBINACO'
    end
    object sdsCupomFiscal_ItensVLR_ACRESCIMO: TFloatField
      FieldName = 'VLR_ACRESCIMO'
    end
    object sdsCupomFiscal_ItensVLR_UNIT_ORIGINAL: TFloatField
      FieldName = 'VLR_UNIT_ORIGINAL'
    end
    object sdsCupomFiscal_ItensBASE_ICMSSUBST_RET: TFloatField
      FieldName = 'BASE_ICMSSUBST_RET'
    end
    object sdsCupomFiscal_ItensVLR_ICMSSUBST_RET: TFloatField
      FieldName = 'VLR_ICMSSUBST_RET'
    end
    object sdsCupomFiscal_ItensVLR_BASE_EFET: TFloatField
      FieldName = 'VLR_BASE_EFET'
    end
    object sdsCupomFiscal_ItensVLR_ICMS_EFE: TFloatField
      FieldName = 'VLR_ICMS_EFE'
    end
    object sdsCupomFiscal_ItensPERC_ST: TFloatField
      FieldName = 'PERC_ST'
    end
    object sdsCupomFiscal_ItensPERC_ICMS_EFET: TFloatField
      FieldName = 'PERC_ICMS_EFET'
    end
    object sdsCupomFiscal_ItensPERC_BASE_RED_EFET: TFloatField
      FieldName = 'PERC_BASE_RED_EFET'
    end
    object sdsCupomFiscal_ItensVLR_JUROS: TFloatField
      FieldName = 'VLR_JUROS'
    end
    object sdsCupomFiscal_ItensVLR_ICMS_SUBSTITUTO: TFloatField
      FieldName = 'VLR_ICMS_SUBSTITUTO'
    end
    object sdsCupomFiscal_ItensCOD_CBENEF: TStringField
      FieldName = 'COD_CBENEF'
      Size = 8
    end
    object sdsCupomFiscal_ItensQTD_TROCA: TFloatField
      FieldName = 'QTD_TROCA'
    end
    object sdsCupomFiscal_ItensOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 300
    end
    object sdsCupomFiscal_ItensID_COMANDA: TIntegerField
      FieldName = 'ID_COMANDA'
    end
    object sdsCupomFiscal_ItensITEM_COMANDA: TIntegerField
      FieldName = 'ITEM_COMANDA'
    end
    object sdsCupomFiscal_ItensSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscal_ItensDATA_HORA_PEDIDO: TSQLTimeStampField
      FieldName = 'DATA_HORA_PEDIDO'
    end
    object sdsCupomFiscal_ItensITEM_PRINCIPAL: TIntegerField
      FieldName = 'ITEM_PRINCIPAL'
    end
    object sdsCupomFiscal_ItensVALOR_RATEIO_RECIBO: TFloatField
      FieldName = 'VALOR_RATEIO_RECIBO'
    end
    object sdsCupomFiscal_ItensVALOR_RATEIO_TROCA: TFloatField
      FieldName = 'VALOR_RATEIO_TROCA'
    end
    object sdsCupomFiscal_ItensVALOR_RATEIO_RECIBO_TROCA: TFloatField
      FieldName = 'VALOR_RATEIO_RECIBO_TROCA'
    end
  end
  object dspCupomFiscal_Itens: TDataSetProvider
    DataSet = sdsCupomFiscal_Itens
    UpdateMode = upWhereKeyOnly
    Left = 594
    Top = 62
  end
  object cdsCupomFiscal_Itens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCupomFiscal_Itens'
    Left = 633
    Top = 62
    object cdsCupomFiscal_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCupomFiscal_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCupomFiscal_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsCupomFiscal_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsCupomFiscal_ItensPERC_ICMS: TFloatField
      FieldName = 'PERC_ICMS'
    end
    object cdsCupomFiscal_ItensVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object cdsCupomFiscal_ItensPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
    end
    object cdsCupomFiscal_ItensVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object cdsCupomFiscal_ItensBASE_ICMS: TFloatField
      FieldName = 'BASE_ICMS'
    end
    object cdsCupomFiscal_ItensVLR_ICMS: TFloatField
      FieldName = 'VLR_ICMS'
    end
    object cdsCupomFiscal_ItensVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsCupomFiscal_ItensID_CFOP: TIntegerField
      FieldName = 'ID_CFOP'
    end
    object cdsCupomFiscal_ItensID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsCupomFiscal_ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsCupomFiscal_ItensCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscal_ItensSITTRIB: TStringField
      FieldName = 'SITTRIB'
      Size = 5
    end
    object cdsCupomFiscal_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsCupomFiscal_ItensID_MOVIMENTO: TIntegerField
      FieldName = 'ID_MOVIMENTO'
    end
    object cdsCupomFiscal_ItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsCupomFiscal_ItensPERC_TRIBUTO: TFloatField
      FieldName = 'PERC_TRIBUTO'
    end
    object cdsCupomFiscal_ItensVLR_TRIBUTO: TFloatField
      FieldName = 'VLR_TRIBUTO'
    end
    object cdsCupomFiscal_ItensID_NCM: TIntegerField
      FieldName = 'ID_NCM'
    end
    object cdsCupomFiscal_ItensORIGEM_PROD: TStringField
      FieldName = 'ORIGEM_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscal_ItensPERC_TRIBUTO_ESTADUAL: TFloatField
      FieldName = 'PERC_TRIBUTO_ESTADUAL'
    end
    object cdsCupomFiscal_ItensPERC_TRIBUTO_MUNICIPAL: TFloatField
      FieldName = 'PERC_TRIBUTO_MUNICIPAL'
    end
    object cdsCupomFiscal_ItensPERC_TRIBUTO_FEDERAL: TFloatField
      FieldName = 'PERC_TRIBUTO_FEDERAL'
    end
    object cdsCupomFiscal_ItensFONTE_TRIBUTO: TStringField
      FieldName = 'FONTE_TRIBUTO'
      Size = 30
    end
    object cdsCupomFiscal_ItensVERSAO_TRIBUTO: TStringField
      FieldName = 'VERSAO_TRIBUTO'
      Size = 15
    end
    object cdsCupomFiscal_ItensVLR_TRIBUTO_FEDERAL: TFloatField
      FieldName = 'VLR_TRIBUTO_FEDERAL'
    end
    object cdsCupomFiscal_ItensVLR_TRIBUTO_ESTADUAL: TFloatField
      FieldName = 'VLR_TRIBUTO_ESTADUAL'
    end
    object cdsCupomFiscal_ItensVLR_TRIBUTO_MUNICIPAL: TFloatField
      FieldName = 'VLR_TRIBUTO_MUNICIPAL'
    end
    object cdsCupomFiscal_ItensID_CSTICMS: TIntegerField
      FieldName = 'ID_CSTICMS'
    end
    object cdsCupomFiscal_ItensID_CSTIPI: TIntegerField
      FieldName = 'ID_CSTIPI'
    end
    object cdsCupomFiscal_ItensID_COFINS: TIntegerField
      FieldName = 'ID_COFINS'
    end
    object cdsCupomFiscal_ItensID_PIS: TIntegerField
      FieldName = 'ID_PIS'
    end
    object cdsCupomFiscal_ItensPERC_TRIBICMS: TFloatField
      FieldName = 'PERC_TRIBICMS'
    end
    object cdsCupomFiscal_ItensID_VARIACAO: TIntegerField
      FieldName = 'ID_VARIACAO'
    end
    object cdsCupomFiscal_ItensPERC_PIS: TFloatField
      FieldName = 'PERC_PIS'
    end
    object cdsCupomFiscal_ItensPERC_COFINS: TFloatField
      FieldName = 'PERC_COFINS'
    end
    object cdsCupomFiscal_ItensPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object cdsCupomFiscal_ItensTIPO_PIS: TStringField
      FieldName = 'TIPO_PIS'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscal_ItensTIPO_COFINS: TStringField
      FieldName = 'TIPO_COFINS'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscal_ItensVLR_PIS: TFloatField
      FieldName = 'VLR_PIS'
    end
    object cdsCupomFiscal_ItensVLR_COFINS: TFloatField
      FieldName = 'VLR_COFINS'
    end
    object cdsCupomFiscal_ItensVLR_IPI: TFloatField
      FieldName = 'VLR_IPI'
    end
    object cdsCupomFiscal_ItensVLR_DESCONTORATEIO: TFloatField
      FieldName = 'VLR_DESCONTORATEIO'
    end
    object cdsCupomFiscal_ItensNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsCupomFiscal_ItensITEM_ORIGINAL: TIntegerField
      FieldName = 'ITEM_ORIGINAL'
    end
    object cdsCupomFiscal_ItensID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsCupomFiscal_ItensITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsCupomFiscal_ItensNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsCupomFiscal_ItensITEM_CLIENTE: TIntegerField
      FieldName = 'ITEM_CLIENTE'
    end
    object cdsCupomFiscal_ItensNUMERO_OC: TStringField
      FieldName = 'NUMERO_OC'
      Size = 30
    end
    object cdsCupomFiscal_ItensNUMERO_OS: TStringField
      FieldName = 'NUMERO_OS'
      Size = 30
    end
    object cdsCupomFiscal_ItensID_ENQIPI: TIntegerField
      FieldName = 'ID_ENQIPI'
    end
    object cdsCupomFiscal_ItensQTD_DEVOLVIDA: TFloatField
      FieldName = 'QTD_DEVOLVIDA'
    end
    object cdsCupomFiscal_ItensID_COR_COMBINACO: TIntegerField
      FieldName = 'ID_COR_COMBINACO'
    end
    object cdsCupomFiscal_ItensVLR_ACRESCIMO: TFloatField
      FieldName = 'VLR_ACRESCIMO'
    end
    object cdsCupomFiscal_ItensVLR_UNIT_ORIGINAL: TFloatField
      FieldName = 'VLR_UNIT_ORIGINAL'
    end
    object cdsCupomFiscal_ItensBASE_ICMSSUBST_RET: TFloatField
      FieldName = 'BASE_ICMSSUBST_RET'
    end
    object cdsCupomFiscal_ItensVLR_ICMSSUBST_RET: TFloatField
      FieldName = 'VLR_ICMSSUBST_RET'
    end
    object cdsCupomFiscal_ItensVLR_BASE_EFET: TFloatField
      FieldName = 'VLR_BASE_EFET'
    end
    object cdsCupomFiscal_ItensVLR_ICMS_EFE: TFloatField
      FieldName = 'VLR_ICMS_EFE'
    end
    object cdsCupomFiscal_ItensPERC_ST: TFloatField
      FieldName = 'PERC_ST'
    end
    object cdsCupomFiscal_ItensPERC_ICMS_EFET: TFloatField
      FieldName = 'PERC_ICMS_EFET'
    end
    object cdsCupomFiscal_ItensPERC_BASE_RED_EFET: TFloatField
      FieldName = 'PERC_BASE_RED_EFET'
    end
    object cdsCupomFiscal_ItensVLR_JUROS: TFloatField
      FieldName = 'VLR_JUROS'
    end
    object cdsCupomFiscal_ItensVLR_ICMS_SUBSTITUTO: TFloatField
      FieldName = 'VLR_ICMS_SUBSTITUTO'
    end
    object cdsCupomFiscal_ItensCOD_CBENEF: TStringField
      FieldName = 'COD_CBENEF'
      Size = 8
    end
    object cdsCupomFiscal_ItensQTD_TROCA: TFloatField
      FieldName = 'QTD_TROCA'
    end
    object cdsCupomFiscal_ItensOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 300
    end
    object cdsCupomFiscal_ItensID_COMANDA: TIntegerField
      FieldName = 'ID_COMANDA'
    end
    object cdsCupomFiscal_ItensITEM_COMANDA: TIntegerField
      FieldName = 'ITEM_COMANDA'
    end
    object cdsCupomFiscal_ItensSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscal_ItensDATA_HORA_PEDIDO: TSQLTimeStampField
      FieldName = 'DATA_HORA_PEDIDO'
    end
    object cdsCupomFiscal_ItensITEM_PRINCIPAL: TIntegerField
      FieldName = 'ITEM_PRINCIPAL'
    end
    object cdsCupomFiscal_ItensVALOR_RATEIO_RECIBO: TFloatField
      FieldName = 'VALOR_RATEIO_RECIBO'
    end
    object cdsCupomFiscal_ItensVALOR_RATEIO_TROCA: TFloatField
      FieldName = 'VALOR_RATEIO_TROCA'
    end
    object cdsCupomFiscal_ItensVALOR_RATEIO_RECIBO_TROCA: TFloatField
      FieldName = 'VALOR_RATEIO_RECIBO_TROCA'
    end
  end
  object sdsDocEstoque: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT D.*'#13#10'FROM docestoque D'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 560
    Top = 116
  end
  object dspDocEstoque: TDataSetProvider
    DataSet = sdsDocEstoque
    UpdateMode = upWhereKeyOnly
    Left = 602
    Top = 116
  end
  object cdsDocEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDocEstoque'
    Left = 642
    Top = 115
    object cdsDocEstoqueID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDocEstoqueDTMOVIMENTO: TDateField
      FieldName = 'DTMOVIMENTO'
    end
    object cdsDocEstoqueFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsDocEstoqueVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsDocEstoqueTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
    object cdsDocEstoqueID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsDocEstoqueOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsDocEstoqueID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsDocEstoqueTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object cdsDocEstoqueID_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'ID_LOCAL_ESTOQUE'
    end
    object cdsDocEstoqueID_LOCAL_DESTINO: TIntegerField
      FieldName = 'ID_LOCAL_DESTINO'
    end
    object cdsDocEstoqueINF_CODBARRA: TStringField
      FieldName = 'INF_CODBARRA'
      FixedChar = True
      Size = 1
    end
    object cdsDocEstoqueNUM_REQUISICAO: TIntegerField
      FieldName = 'NUM_REQUISICAO'
    end
    object cdsDocEstoqueID_FUNCIONARIO_ENTR: TIntegerField
      FieldName = 'ID_FUNCIONARIO_ENTR'
    end
    object cdsDocEstoqueNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsDocEstoqueNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsDocEstoqueCOD_ANT: TIntegerField
      FieldName = 'COD_ANT'
    end
    object cdsDocEstoqueFILIAL_DESTINO: TIntegerField
      FieldName = 'FILIAL_DESTINO'
    end
    object cdsDocEstoqueUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsDocEstoqueDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsDocEstoqueHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
  end
  object sdsDocEstoque_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT I.*'#13#10'FROM docestoque_itens I'#13#10'WHERE I.ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 562
    Top = 157
    object sdsDocEstoque_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDocEstoque_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDocEstoque_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsDocEstoque_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsDocEstoque_ItensVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object sdsDocEstoque_ItensVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object sdsDocEstoque_ItensPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object sdsDocEstoque_ItensID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object sdsDocEstoque_ItensMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 100
    end
    object sdsDocEstoque_ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object sdsDocEstoque_ItensID_CENTROCUSTO: TIntegerField
      FieldName = 'ID_CENTROCUSTO'
    end
    object sdsDocEstoque_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object sdsDocEstoque_ItensID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object sdsDocEstoque_ItensID_MOVESTOQUE_DESTINO: TIntegerField
      FieldName = 'ID_MOVESTOQUE_DESTINO'
    end
    object sdsDocEstoque_ItensNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
    object sdsDocEstoque_ItensGERAR_CUSTO: TStringField
      FieldName = 'GERAR_CUSTO'
      FixedChar = True
      Size = 1
    end
    object sdsDocEstoque_ItensPRECO_CUSTO_TOTAL: TFloatField
      FieldName = 'PRECO_CUSTO_TOTAL'
    end
    object sdsDocEstoque_ItensLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Size = 30
    end
    object sdsDocEstoque_ItensLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object sdsDocEstoque_ItensCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object sdsDocEstoque_ItensESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object sdsDocEstoque_ItensTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
  end
  object dspDocEstoque_Itens: TDataSetProvider
    DataSet = sdsDocEstoque_Itens
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspDocEstoque_ItensGetTableName
    Left = 601
    Top = 156
  end
  object cdsDocEstoque_Itens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDocEstoque_Itens'
    Left = 641
    Top = 156
    object cdsDocEstoque_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDocEstoque_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDocEstoque_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsDocEstoque_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsDocEstoque_ItensVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object cdsDocEstoque_ItensVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsDocEstoque_ItensPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object cdsDocEstoque_ItensID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsDocEstoque_ItensMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 100
    end
    object cdsDocEstoque_ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsDocEstoque_ItensID_CENTROCUSTO: TIntegerField
      FieldName = 'ID_CENTROCUSTO'
    end
    object cdsDocEstoque_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsDocEstoque_ItensID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsDocEstoque_ItensID_MOVESTOQUE_DESTINO: TIntegerField
      FieldName = 'ID_MOVESTOQUE_DESTINO'
    end
    object cdsDocEstoque_ItensNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
    object cdsDocEstoque_ItensGERAR_CUSTO: TStringField
      FieldName = 'GERAR_CUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsDocEstoque_ItensPRECO_CUSTO_TOTAL: TFloatField
      FieldName = 'PRECO_CUSTO_TOTAL'
    end
    object cdsDocEstoque_ItensLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Size = 30
    end
    object cdsDocEstoque_ItensLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object cdsDocEstoque_ItensCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object cdsDocEstoque_ItensESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object cdsDocEstoque_ItensTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
  end
  object sdsInventario: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT I.*'#13#10'FROM INVENTARIO I'#13#10'WHERE I.gerado_estoque = '#39'S'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 559
    Top = 205
  end
  object dspInventario: TDataSetProvider
    DataSet = sdsInventario
    UpdateMode = upWhereKeyOnly
    Left = 602
    Top = 204
  end
  object cdsInventario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInventario'
    Left = 642
    Top = 203
    object cdsInventarioID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsInventarioDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsInventarioGERADO_ESTOQUE: TStringField
      FieldName = 'GERADO_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioNUM_INVENTARIO: TIntegerField
      FieldName = 'NUM_INVENTARIO'
    end
    object cdsInventarioDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsInventarioHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsInventarioFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsInventarioTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioID_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'ID_LOCAL_ESTOQUE'
    end
  end
  object sdsInventario_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT I.*'#13#10'FROM INVENTARIO_ITENS I'#13#10'WHERE I.ID = :ID'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 563
    Top = 245
    object sdsInventario_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsInventario_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsInventario_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsInventario_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object sdsInventario_ItensQTD_ESTOQUE: TFloatField
      FieldName = 'QTD_ESTOQUE'
    end
    object sdsInventario_ItensQTD_INVENTARIO: TFloatField
      FieldName = 'QTD_INVENTARIO'
    end
    object sdsInventario_ItensQTD_AJUSTE: TFloatField
      FieldName = 'QTD_AJUSTE'
    end
    object sdsInventario_ItensTIPO_AJUSTE: TStringField
      FieldName = 'TIPO_AJUSTE'
      FixedChar = True
      Size = 1
    end
    object sdsInventario_ItensVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object sdsInventario_ItensPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object sdsInventario_ItensPERC_ICMS: TFloatField
      FieldName = 'PERC_ICMS'
    end
    object sdsInventario_ItensID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object sdsInventario_ItensID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object sdsInventario_ItensNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
  end
  object dspInventario_Itens: TDataSetProvider
    DataSet = sdsInventario_Itens
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspInventario_ItensGetTableName
    Left = 601
    Top = 244
  end
  object cdsInventario_Itens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInventario_Itens'
    Left = 641
    Top = 244
    object cdsInventario_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsInventario_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsInventario_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsInventario_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsInventario_ItensQTD_ESTOQUE: TFloatField
      FieldName = 'QTD_ESTOQUE'
    end
    object cdsInventario_ItensQTD_INVENTARIO: TFloatField
      FieldName = 'QTD_INVENTARIO'
    end
    object cdsInventario_ItensQTD_AJUSTE: TFloatField
      FieldName = 'QTD_AJUSTE'
    end
    object cdsInventario_ItensTIPO_AJUSTE: TStringField
      FieldName = 'TIPO_AJUSTE'
      FixedChar = True
      Size = 1
    end
    object cdsInventario_ItensVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object cdsInventario_ItensPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object cdsInventario_ItensPERC_ICMS: TFloatField
      FieldName = 'PERC_ICMS'
    end
    object cdsInventario_ItensID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsInventario_ItensID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsInventario_ItensNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
  end
end
