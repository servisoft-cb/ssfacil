object frmSel_Filial_Servidor: TfrmSel_Filial_Servidor
  Left = 369
  Top = 166
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Selecionar a Filial'
  ClientHeight = 462
  ClientWidth = 699
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 0
    Width = 699
    Height = 462
    Align = alClient
    Ctl3D = False
    DataSource = dsFilial
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Color = 8454016
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Title.Color = 8454016
        Width = 246
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NOME_INTERNO'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Interno'
        Title.Color = 8454016
        Width = 207
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CNPJ_CPF'
        Title.Alignment = taCenter
        Title.Caption = 'CNPJ/CPF'
        Title.Color = 8454016
        Width = 144
        Visible = True
      end>
  end
  object sdsFilial: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM filial'#13#10'WHERE INATIVO = '#39'N'#39#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoServidor
    Left = 72
    Top = 105
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 104
    Top = 104
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial'
    Left = 136
    Top = 104
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
    object cdsFilialENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsFilialCOMPLEMENTO_END: TStringField
      FieldName = 'COMPLEMENTO_END'
      Size = 60
    end
    object cdsFilialNUM_END: TStringField
      FieldName = 'NUM_END'
      Size = 15
    end
    object cdsFilialBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsFilialCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsFilialID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
    end
    object cdsFilialCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object cdsFilialUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsFilialDDD1: TIntegerField
      FieldName = 'DDD1'
    end
    object cdsFilialFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object cdsFilialDDD2: TIntegerField
      FieldName = 'DDD2'
    end
    object cdsFilialFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object cdsFilialDDDFAX: TIntegerField
      FieldName = 'DDDFAX'
    end
    object cdsFilialFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object cdsFilialPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsFilialINSCR_EST: TStringField
      FieldName = 'INSCR_EST'
      Size = 18
    end
    object cdsFilialSIMPLES: TStringField
      FieldName = 'SIMPLES'
      FixedChar = True
      Size = 1
    end
    object cdsFilialENDLOGO: TStringField
      FieldName = 'ENDLOGO'
      Size = 250
    end
    object cdsFilialCALCULAR_IPI: TStringField
      FieldName = 'CALCULAR_IPI'
      FixedChar = True
      Size = 1
    end
    object cdsFilialINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsFilialINSCMUNICIPAL: TStringField
      FieldName = 'INSCMUNICIPAL'
      Size = 18
    end
    object cdsFilialCNAE: TStringField
      FieldName = 'CNAE'
      Size = 7
    end
    object cdsFilialHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 250
    end
    object cdsFilialID_REGIME_TRIB: TIntegerField
      FieldName = 'ID_REGIME_TRIB'
    end
    object cdsFilialID_PIS: TIntegerField
      FieldName = 'ID_PIS'
    end
    object cdsFilialID_COFINS: TIntegerField
      FieldName = 'ID_COFINS'
    end
    object cdsFilialTIPO_PIS: TStringField
      FieldName = 'TIPO_PIS'
      Size = 2
    end
    object cdsFilialTIPO_COFINS: TStringField
      FieldName = 'TIPO_COFINS'
      Size = 2
    end
    object cdsFilialPERC_PIS: TFloatField
      FieldName = 'PERC_PIS'
    end
    object cdsFilialPERC_COFINS: TFloatField
      FieldName = 'PERC_COFINS'
    end
    object cdsFilialID_CSTICMS: TIntegerField
      FieldName = 'ID_CSTICMS'
    end
    object cdsFilialID_CSTIPI: TIntegerField
      FieldName = 'ID_CSTIPI'
    end
    object cdsFilialEMAIL_NFE: TStringField
      FieldName = 'EMAIL_NFE'
      Size = 200
    end
    object cdsFilialDTESTOQUE: TDateField
      FieldName = 'DTESTOQUE'
    end
    object cdsFilialPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      FixedChar = True
      Size = 1
    end
    object cdsFilialLIBERADO_ATE: TStringField
      FieldName = 'LIBERADO_ATE'
      Size = 18
    end
    object cdsFilialULTIMO_ACESSO: TStringField
      FieldName = 'ULTIMO_ACESSO'
      Size = 18
    end
    object cdsFilialUSARICMSSIMPLES: TStringField
      FieldName = 'USARICMSSIMPLES'
      FixedChar = True
      Size = 1
    end
    object cdsFilialSERIENORMAL: TStringField
      FieldName = 'SERIENORMAL'
      Size = 3
    end
    object cdsFilialID_REGIME_TRIB_NFSE: TIntegerField
      FieldName = 'ID_REGIME_TRIB_NFSE'
    end
    object cdsFilialINCENTIVO_CULTURAL: TStringField
      FieldName = 'INCENTIVO_CULTURAL'
      FixedChar = True
      Size = 1
    end
    object cdsFilialSERIE_NFSE: TStringField
      FieldName = 'SERIE_NFSE'
      Size = 5
    end
    object cdsFilialID_NATUREZA: TIntegerField
      FieldName = 'ID_NATUREZA'
    end
    object cdsFilialID_SERVICO_SINT: TIntegerField
      FieldName = 'ID_SERVICO_SINT'
    end
    object cdsFilialID_SERVICO_PAD: TIntegerField
      FieldName = 'ID_SERVICO_PAD'
    end
    object cdsFilialPERC_IR: TFloatField
      FieldName = 'PERC_IR'
    end
    object cdsFilialVLR_IR_MINIMO: TFloatField
      FieldName = 'VLR_IR_MINIMO'
    end
    object cdsFilialPERC_ISS: TFloatField
      FieldName = 'PERC_ISS'
    end
    object cdsFilialCOD_TRIBUTACAO_MUNICIPIO: TStringField
      FieldName = 'COD_TRIBUTACAO_MUNICIPIO'
    end
    object cdsFilialNUMLOTE: TIntegerField
      FieldName = 'NUMLOTE'
    end
    object cdsFilialENDLOGO_NFSE: TStringField
      FieldName = 'ENDLOGO_NFSE'
      Size = 200
    end
    object cdsFilialPERC_CSLL: TFloatField
      FieldName = 'PERC_CSLL'
    end
    object cdsFilialCNAE_NFSE: TStringField
      FieldName = 'CNAE_NFSE'
      Size = 7
    end
    object cdsFilialPERC_INSS: TFloatField
      FieldName = 'PERC_INSS'
    end
    object cdsFilialID_ATIVIDADE_CID: TIntegerField
      FieldName = 'ID_ATIVIDADE_CID'
    end
    object cdsFilialNFSE_HOMOLOGACAO: TStringField
      FieldName = 'NFSE_HOMOLOGACAO'
      FixedChar = True
      Size = 1
    end
    object cdsFilialPERC_CSRF: TFloatField
      FieldName = 'PERC_CSRF'
    end
    object cdsFilialVLR_FATURAMENTO_MES_CSRF: TFloatField
      FieldName = 'VLR_FATURAMENTO_MES_CSRF'
    end
    object cdsFilialPERC_TRIB_SERV: TFloatField
      FieldName = 'PERC_TRIB_SERV'
    end
    object cdsFilialPERC_TRIB_NTS_IND: TFloatField
      FieldName = 'PERC_TRIB_NTS_IND'
    end
    object cdsFilialPERC_TRIB_NTS_VEN: TFloatField
      FieldName = 'PERC_TRIB_NTS_VEN'
    end
    object cdsFilialPERC_TRIB_NTS_IND_EXP: TFloatField
      FieldName = 'PERC_TRIB_NTS_IND_EXP'
    end
    object cdsFilialPERC_TRIB_NTS_VEN_EXP: TFloatField
      FieldName = 'PERC_TRIB_NTS_VEN_EXP'
    end
    object cdsFilialPERC_LISTA_CAMEX: TFloatField
      FieldName = 'PERC_LISTA_CAMEX'
    end
    object cdsFilialIMPRESSAO_MATRICIAL: TStringField
      FieldName = 'IMPRESSAO_MATRICIAL'
      FixedChar = True
      Size = 1
    end
    object cdsFilialID_CONTABILISTA: TIntegerField
      FieldName = 'ID_CONTABILISTA'
    end
    object cdsFilialINSCR_SUFRAMA: TStringField
      FieldName = 'INSCR_SUFRAMA'
      Size = 10
    end
    object cdsFilialSPED_PERFIL: TStringField
      FieldName = 'SPED_PERFIL'
      FixedChar = True
      Size = 1
    end
    object cdsFilialSPED_ATIVIDADE: TStringField
      FieldName = 'SPED_ATIVIDADE'
      FixedChar = True
      Size = 1
    end
    object cdsFilialEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object cdsFilialLICENCA_FEPAM: TStringField
      FieldName = 'LICENCA_FEPAM'
      Size = 15
    end
    object cdsFilialID_CFOP_NFCE_PADRAO: TIntegerField
      FieldName = 'ID_CFOP_NFCE_PADRAO'
    end
    object cdsFilialUSA_NFCE: TStringField
      FieldName = 'USA_NFCE'
      FixedChar = True
      Size = 1
    end
    object cdsFilialNFCEPRODUCAO: TStringField
      FieldName = 'NFCEPRODUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsFilialSERIE_NFCE: TStringField
      FieldName = 'SERIE_NFCE'
      Size = 3
    end
    object cdsFilialVLR_CSRF_MINIMO: TFloatField
      FieldName = 'VLR_CSRF_MINIMO'
    end
    object cdsFilialID_ENQIPI: TIntegerField
      FieldName = 'ID_ENQIPI'
    end
    object cdsFilialCALCULAR_DIFAL: TStringField
      FieldName = 'CALCULAR_DIFAL'
      FixedChar = True
      Size = 1
    end
    object cdsFilialNUM_PEDIDO_ULT: TIntegerField
      FieldName = 'NUM_PEDIDO_ULT'
    end
    object cdsFilialNUM_ORCAMENTO_ULT: TIntegerField
      FieldName = 'NUM_ORCAMENTO_ULT'
    end
    object cdsFilialNUM_OC_ULT: TIntegerField
      FieldName = 'NUM_OC_ULT'
    end
    object cdsFilialEMAIL_FINANCEIRO: TStringField
      FieldName = 'EMAIL_FINANCEIRO'
      Size = 200
    end
    object cdsFilialENDLOGO_ROTULO: TStringField
      FieldName = 'ENDLOGO_ROTULO'
      Size = 200
    end
    object cdsFilialLOCALSERVIDORNFE: TStringField
      FieldName = 'LOCALSERVIDORNFE'
      Size = 100
    end
    object cdsFilialUSA_CUPOM: TStringField
      FieldName = 'USA_CUPOM'
      Size = 1
    end
    object cdsFilialDIFAL_GERAR_VALORES: TStringField
      FieldName = 'DIFAL_GERAR_VALORES'
      FixedChar = True
      Size = 1
    end
    object cdsFilialOBS_DIFAL: TStringField
      FieldName = 'OBS_DIFAL'
      Size = 250
    end
    object cdsFilialINCENTIVO_FISCAL: TStringField
      FieldName = 'INCENTIVO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object cdsFilialNOME_ETIQUETA: TStringField
      FieldName = 'NOME_ETIQUETA'
      Size = 15
    end
    object cdsFilialPERC_ISS_SIMPLES: TFloatField
      FieldName = 'PERC_ISS_SIMPLES'
    end
    object cdsFilialNUM_NOTA_RAMIRO: TIntegerField
      FieldName = 'NUM_NOTA_RAMIRO'
    end
    object cdsFilialIND_NAT_PJ: TSmallintField
      FieldName = 'IND_NAT_PJ'
    end
    object cdsFilialIND_ATIV_PISCOFINS: TSmallintField
      FieldName = 'IND_ATIV_PISCOFINS'
    end
    object cdsFilialFINALIDADE_PADRAO: TStringField
      FieldName = 'FINALIDADE_PADRAO'
      FixedChar = True
      Size = 1
    end
    object cdsFilialSERIE_CPF: TStringField
      FieldName = 'SERIE_CPF'
      Size = 3
    end
    object cdsFilialTIPO_EMP: TStringField
      FieldName = 'TIPO_EMP'
      FixedChar = True
      Size = 1
    end
    object cdsFilialSPED_PERIODO_IPI: TStringField
      FieldName = 'SPED_PERIODO_IPI'
      FixedChar = True
      Size = 1
    end
    object cdsFilialUSA_ENVIO_ST_RET: TStringField
      FieldName = 'USA_ENVIO_ST_RET'
      FixedChar = True
      Size = 1
    end
    object cdsFilialCALCULAR_ICMS_EFET: TStringField
      FieldName = 'CALCULAR_ICMS_EFET'
      FixedChar = True
      Size = 1
    end
    object cdsFilialENVIO_NFSE: TStringField
      FieldName = 'ENVIO_NFSE'
      FixedChar = True
      Size = 1
    end
    object cdsFilialSPED_SOMA_IPI_CUSTO: TStringField
      FieldName = 'SPED_SOMA_IPI_CUSTO'
      FixedChar = True
      Size = 1
    end
    object cdsFilialARQ_MODELO_CONTRATO: TStringField
      FieldName = 'ARQ_MODELO_CONTRATO'
      Size = 200
    end
    object cdsFilialTOKEN_CEDENTE: TStringField
      FieldName = 'TOKEN_CEDENTE'
      Size = 40
    end
    object cdsFilialID_CEDENTE: TIntegerField
      FieldName = 'ID_CEDENTE'
    end
    object cdsFilialDESC_ICMS_PIS_COFINS: TStringField
      FieldName = 'DESC_ICMS_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object cdsFilialFORMA_TRABALHO: TStringField
      FieldName = 'FORMA_TRABALHO'
      FixedChar = True
      Size = 1
    end
    object cdsFilialPERGUNTA_MESA: TStringField
      FieldName = 'PERGUNTA_MESA'
      FixedChar = True
      Size = 1
    end
    object cdsFilialPEDIDO_PRECO_IPI: TStringField
      FieldName = 'PEDIDO_PRECO_IPI'
      FixedChar = True
      Size = 1
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 168
    Top = 104
  end
  object sdsFilial_Relatorios: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM FILIAL_RELATORIOS'#13#10'WHERE ID = :ID'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoServidor
    Left = 77
    Top = 160
  end
  object dspFilial_Relatorios: TDataSetProvider
    DataSet = sdsFilial_Relatorios
    Left = 109
    Top = 159
  end
  object cdsFilial_Relatorios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial_Relatorios'
    Left = 141
    Top = 159
    object cdsFilial_RelatoriosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFilial_RelatoriosITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsFilial_RelatoriosTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdsFilial_RelatoriosCAMINHO: TStringField
      FieldName = 'CAMINHO'
      Size = 150
    end
    object cdsFilial_RelatoriosPOSICAO: TSmallintField
      FieldName = 'POSICAO'
    end
    object cdsFilial_RelatoriosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object cdsFilial_RelatoriosGERAR_TAMANHO: TStringField
      FieldName = 'GERAR_TAMANHO'
      FixedChar = True
      Size = 1
    end
  end
end
