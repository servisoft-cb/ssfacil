object DMConfig_Balanca: TDMConfig_Balanca
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 499
  Top = 224
  Height = 291
  Width = 398
  object sdsConfigBalancaLay: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select ID, ORDEM, trim(CAMPO) CAMPO, POSICAO, TAMANHO, PENDENTE'#13 +
      #10'from CONFIG_BALANCA_LAYOUT'
    DataSource = cdsMestre
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 88
    object sdsConfigBalancaLayID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsConfigBalancaLayORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
    object sdsConfigBalancaLayCAMPO: TStringField
      FieldName = 'CAMPO'
      FixedChar = True
      Size = 25
    end
    object sdsConfigBalancaLayPOSICAO: TIntegerField
      FieldName = 'POSICAO'
    end
    object sdsConfigBalancaLayTAMANHO: TIntegerField
      FieldName = 'TAMANHO'
    end
    object sdsConfigBalancaLayPENDENTE: TStringField
      FieldName = 'PENDENTE'
      FixedChar = True
      Size = 1
    end
  end
  object dsConfigBalancaLay: TDataSource
    DataSet = cdsConfigBalancaLay
    Left = 144
    Top = 88
  end
  object cdsConfigBalancaLay: TClientDataSet
    Aggregates = <>
    DataSetField = cdsConfigBalancasdsConfigBalancaLay
    Params = <>
    Left = 112
    Top = 88
    object cdsConfigBalancaLayID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConfigBalancaLayORDEM: TIntegerField
      DisplayLabel = 'Ordem'
      FieldName = 'ORDEM'
      Required = True
    end
    object cdsConfigBalancaLayCAMPO: TStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      FixedChar = True
      Size = 25
    end
    object cdsConfigBalancaLayPOSICAO: TIntegerField
      DisplayLabel = 'Posi'#231#227'o'
      FieldName = 'POSICAO'
    end
    object cdsConfigBalancaLayTAMANHO: TIntegerField
      DisplayLabel = 'Tamanho'
      FieldName = 'TAMANHO'
    end
    object cdsConfigBalancaLayPENDENTE: TStringField
      DisplayLabel = 'Pendente'
      FieldName = 'PENDENTE'
      FixedChar = True
      Size = 1
    end
  end
  object sdsConfigBalanca: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CONFIG_BALANCA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 16
    object sdsConfigBalancaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsConfigBalancaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object sdsConfigBalancaDECIMAIS: TIntegerField
      FieldName = 'DECIMAIS'
    end
    object sdsConfigBalancaUSA_SEPARADOR: TStringField
      FieldName = 'USA_SEPARADOR'
      FixedChar = True
      Size = 1
    end
    object sdsConfigBalancaTIPO_SEPARADOR: TStringField
      FieldName = 'TIPO_SEPARADOR'
      FixedChar = True
      Size = 1
    end
    object sdsConfigBalancaNOMEARQ_TXT: TStringField
      FieldName = 'NOMEARQ_TXT'
      FixedChar = True
      Size = 254
    end
    object sdsConfigBalancaID_TEXT: TStringField
      FieldName = 'ID_TEXT'
      FixedChar = True
      Size = 10
    end
    object sdsConfigBalancaID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object sdsConfigBalancaID_TAMANHO: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object sdsConfigBalancaCOD_POSICAO: TIntegerField
      FieldName = 'COD_POSICAO'
    end
    object sdsConfigBalancaCOD_TAMANHO: TIntegerField
      FieldName = 'COD_TAMANHO'
    end
    object sdsConfigBalancaVLR_POSICAO: TIntegerField
      FieldName = 'VLR_POSICAO'
    end
    object sdsConfigBalancaVLR_TAMANHO: TIntegerField
      FieldName = 'VLR_TAMANHO'
    end
    object sdsConfigBalancaTIPO_PRECO: TStringField
      FieldName = 'TIPO_PRECO'
      FixedChar = True
      Size = 1
    end
  end
  object dsConfigBalanca: TDataSource
    DataSet = cdsConfigBalanca
    Left = 144
    Top = 16
  end
  object cdsConfigBalanca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigBalanca'
    Left = 112
    Top = 16
    object cdsConfigBalancaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConfigBalancaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object cdsConfigBalancaDECIMAIS: TIntegerField
      DisplayLabel = 'Decimais'
      FieldName = 'DECIMAIS'
    end
    object cdsConfigBalancaUSA_SEPARADOR: TStringField
      DisplayLabel = 'Usa Separador'
      FieldName = 'USA_SEPARADOR'
      FixedChar = True
      Size = 1
    end
    object cdsConfigBalancaTIPO_SEPARADOR: TStringField
      DisplayLabel = 'Tipo Separador'
      FieldName = 'TIPO_SEPARADOR'
      FixedChar = True
      Size = 1
    end
    object cdsConfigBalancaNOMEARQ_TXT: TStringField
      DisplayLabel = 'Nome Arq.TXT'
      FieldName = 'NOMEARQ_TXT'
      FixedChar = True
      Size = 254
    end
    object cdsConfigBalancaID_TEXT: TStringField
      DisplayLabel = 'Texto'
      FieldName = 'ID_TEXT'
      FixedChar = True
      Size = 10
    end
    object cdsConfigBalancaID_POSICAO: TIntegerField
      DisplayLabel = 'Ident. Posi'#231#227'o'
      FieldName = 'ID_POSICAO'
    end
    object cdsConfigBalancaID_TAMANHO: TIntegerField
      DisplayLabel = 'Ident.Tamanho'
      FieldName = 'ID_TAMANHO'
    end
    object cdsConfigBalancaCOD_POSICAO: TIntegerField
      DisplayLabel = 'Cod. Posi'#231#227'o'
      FieldName = 'COD_POSICAO'
    end
    object cdsConfigBalancaCOD_TAMANHO: TIntegerField
      DisplayLabel = 'Cod. Tamanho'
      FieldName = 'COD_TAMANHO'
    end
    object cdsConfigBalancaVLR_POSICAO: TIntegerField
      DisplayLabel = 'Vlr Posi'#231#227'o'
      FieldName = 'VLR_POSICAO'
    end
    object cdsConfigBalancaVLR_TAMANHO: TIntegerField
      DisplayLabel = 'Vlr Tamanho'
      FieldName = 'VLR_TAMANHO'
    end
    object cdsConfigBalancaTIPO_PRECO: TStringField
      DisplayLabel = 'Tipo Pre'#231'o'
      FieldName = 'TIPO_PRECO'
      FixedChar = True
      Size = 1
    end
    object cdsConfigBalancasdsConfigBalancaLay: TDataSetField
      FieldName = 'sdsConfigBalancaLay'
    end
  end
  object dspConfigBalanca: TDataSetProvider
    DataSet = sdsConfigBalanca
    Options = [poAllowCommandText]
    Left = 80
    Top = 16
  end
  object sdsTabelaProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select RDB$FIELD_NAME NOME_CAMPO'#13#10'from RDB$RELATION_FIELDS'#13#10'wher' +
      'e RDB$RELATION_NAME = '#39'PRODUTO'#39' '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 24
    Top = 144
  end
  object dsTabelaProduto: TDataSource
    DataSet = cdsTabelaProduto
    Left = 120
    Top = 144
  end
  object cdsTabelaProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabelaProduto'
    Left = 88
    Top = 144
    object cdsTabelaProdutoNOME_CAMPO: TStringField
      FieldName = 'NOME_CAMPO'
      FixedChar = True
      Size = 93
    end
  end
  object cdsMestre: TDataSource
    DataSet = sdsConfigBalanca
    Left = 16
    Top = 64
  end
  object dspTabelaProduto: TDataSetProvider
    DataSet = sdsTabelaProduto
    Options = [poAllowCommandText]
    Left = 56
    Top = 144
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'Select * from Produto Where CODIGO_BALANCA is not null'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 16
    Top = 200
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 112
    Top = 200
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 80
    Top = 200
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsProdutoPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object cdsProdutoPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object cdsProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoID_CSTIPI: TIntegerField
      FieldName = 'ID_CSTIPI'
    end
    object cdsProdutoPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object cdsProdutoPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object cdsProdutoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object cdsProdutoTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPOSSE_MATERIAL: TStringField
      FieldName = 'POSSE_MATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoMATERIAL_OUTROS: TStringField
      FieldName = 'MATERIAL_OUTROS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsProdutoDTCAD: TDateField
      FieldName = 'DTCAD'
    end
    object cdsProdutoHRCAD: TTimeField
      FieldName = 'HRCAD'
    end
    object cdsProdutoCA: TStringField
      FieldName = 'CA'
    end
    object cdsProdutoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object cdsProdutoID_NCM: TIntegerField
      FieldName = 'ID_NCM'
    end
    object cdsProdutoORIGEM_PROD: TStringField
      FieldName = 'ORIGEM_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutoCODSITCF: TStringField
      FieldName = 'CODSITCF'
      Size = 5
    end
    object cdsProdutoPERC_REDUCAOICMS: TFloatField
      FieldName = 'PERC_REDUCAOICMS'
    end
    object cdsProdutoTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPERC_MARGEMLUCRO: TFloatField
      FieldName = 'PERC_MARGEMLUCRO'
    end
    object cdsProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProdutoDT_ALTPRECO: TDateField
      FieldName = 'DT_ALTPRECO'
    end
    object cdsProdutoLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Size = 30
    end
    object cdsProdutoID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
    object cdsProdutoID_SUBGRUPO: TIntegerField
      FieldName = 'ID_SUBGRUPO'
    end
    object cdsProdutoID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
    end
    object cdsProdutoID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object cdsProdutoCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 14
    end
    object cdsProdutoPERC_IMPORTACAO: TFloatField
      FieldName = 'PERC_IMPORTACAO'
    end
    object cdsProdutoCOD_ANT: TStringField
      FieldName = 'COD_ANT'
      Size = 10
    end
    object cdsProdutoPERC_REDUCAOICMSSUBST: TFloatField
      FieldName = 'PERC_REDUCAOICMSSUBST'
    end
    object cdsProdutoUSA_GRADE: TStringField
      FieldName = 'USA_GRADE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoID_GRADE: TIntegerField
      FieldName = 'ID_GRADE'
    end
    object cdsProdutoUSA_PERC_IMP_INTERESTADUAL: TStringField
      FieldName = 'USA_PERC_IMP_INTERESTADUAL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoIMPRIMIR_ETIQUETA_NAV: TStringField
      FieldName = 'IMPRIMIR_ETIQUETA_NAV'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object cdsProdutoPERC_QUEBRAMAT: TFloatField
      FieldName = 'PERC_QUEBRAMAT'
    end
    object cdsProdutoSPED_TIPO_ITEM: TStringField
      FieldName = 'SPED_TIPO_ITEM'
      Size = 2
    end
    object cdsProdutoQTD_ESTOQUE_MIN: TFloatField
      FieldName = 'QTD_ESTOQUE_MIN'
    end
    object cdsProdutoPERC_PIS: TFloatField
      FieldName = 'PERC_PIS'
    end
    object cdsProdutoPERC_COFINS: TFloatField
      FieldName = 'PERC_COFINS'
    end
    object cdsProdutoPERC_ICMS_IMP: TFloatField
      FieldName = 'PERC_ICMS_IMP'
    end
    object cdsProdutoPERC_IPI_IMP: TFloatField
      FieldName = 'PERC_IPI_IMP'
    end
    object cdsProdutoREFERENCIA_PADRAO: TStringField
      FieldName = 'REFERENCIA_PADRAO'
    end
    object cdsProdutoNUM_FCI: TStringField
      FieldName = 'NUM_FCI'
      Size = 40
    end
    object cdsProdutoPERC_USADO_FCI: TFloatField
      FieldName = 'PERC_USADO_FCI'
    end
    object cdsProdutoNCM_EX: TStringField
      FieldName = 'NCM_EX'
      Size = 2
    end
    object cdsProdutoID_SITTRIB_CF: TIntegerField
      FieldName = 'ID_SITTRIB_CF'
    end
    object cdsProdutoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsProdutoPRECO_REVENDA: TFMTBCDField
      FieldName = 'PRECO_REVENDA'
      Precision = 15
      Size = 10
    end
    object cdsProdutoPRECO_INDUSTRIALIZACAO: TFMTBCDField
      FieldName = 'PRECO_INDUSTRIALIZACAO'
      Precision = 15
      Size = 10
    end
    object cdsProdutoPRECO_CONSUMO: TFMTBCDField
      FieldName = 'PRECO_CONSUMO'
      Precision = 15
      Size = 10
    end
    object cdsProdutoFOTO: TStringField
      FieldName = 'FOTO'
      Size = 150
    end
    object cdsProdutoREFERENCIA_SEQ: TIntegerField
      FieldName = 'REFERENCIA_SEQ'
    end
    object cdsProdutoID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsProdutoCALCULAR_2_LADOS: TStringField
      FieldName = 'CALCULAR_2_LADOS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPERC_VIDRO: TFloatField
      FieldName = 'PERC_VIDRO'
    end
    object cdsProdutoID_LINHA: TIntegerField
      FieldName = 'ID_LINHA'
    end
    object cdsProdutoID_CFOP_NFCE: TIntegerField
      FieldName = 'ID_CFOP_NFCE'
    end
    object cdsProdutoUSA_PRECO_COR: TStringField
      FieldName = 'USA_PRECO_COR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoUSA_COR: TStringField
      FieldName = 'USA_COR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoTRANSFER: TStringField
      FieldName = 'TRANSFER'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPRECO_CUSTO_TOTAL: TFloatField
      FieldName = 'PRECO_CUSTO_TOTAL'
    end
    object cdsProdutoID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsProdutoID_LOCAL_ESTOQUE_PROD: TIntegerField
      FieldName = 'ID_LOCAL_ESTOQUE_PROD'
    end
    object cdsProdutoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object cdsProdutoID_ENQIPI: TIntegerField
      FieldName = 'ID_ENQIPI'
    end
    object cdsProdutoLANCA_LOTE_CONTROLE: TStringField
      FieldName = 'LANCA_LOTE_CONTROLE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCOD_CEST: TStringField
      FieldName = 'COD_CEST'
      Size = 7
    end
    object cdsProdutoPICTOGRAMA: TStringField
      FieldName = 'PICTOGRAMA'
      Size = 150
    end
    object cdsProdutoPICTO_CABEDAL: TStringField
      FieldName = 'PICTO_CABEDAL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPICTO_INTERIOR: TStringField
      FieldName = 'PICTO_INTERIOR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPICTO_SOLA: TStringField
      FieldName = 'PICTO_SOLA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCOD_PRODUTO_CLI: TStringField
      FieldName = 'COD_PRODUTO_CLI'
      Size = 15
    end
    object cdsProdutoFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsProdutoBAIXA_ESTOQUE_MAT: TStringField
      FieldName = 'BAIXA_ESTOQUE_MAT'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCOD_JUSTNEW: TIntegerField
      FieldName = 'COD_JUSTNEW'
    end
    object cdsProdutoNOME_ORIGINAL: TStringField
      FieldName = 'NOME_ORIGINAL'
      Size = 100
    end
    object cdsProdutoIMP_ROTULO: TStringField
      FieldName = 'IMP_ROTULO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoNUM_MS: TStringField
      FieldName = 'NUM_MS'
    end
    object cdsProdutoIMP_CONSUMO_NFE: TStringField
      FieldName = 'IMP_CONSUMO_NFE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoGERAR_FCI: TStringField
      FieldName = 'GERAR_FCI'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoMEDIDA: TStringField
      FieldName = 'MEDIDA'
    end
    object cdsProdutoQTD_EMBALAGEM: TFloatField
      FieldName = 'QTD_EMBALAGEM'
    end
    object cdsProdutoDT_ALT_PRECOCUSTO: TDateField
      FieldName = 'DT_ALT_PRECOCUSTO'
    end
    object cdsProdutoUSA_CARIMBO_OC: TStringField
      FieldName = 'USA_CARIMBO_OC'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoUSA_NA_BALANCA: TStringField
      FieldName = 'USA_NA_BALANCA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 250
    end
    object cdsProdutoPERC_DESC_MAX: TFloatField
      FieldName = 'PERC_DESC_MAX'
    end
    object cdsProdutoID_CSTICMS_BRED: TIntegerField
      FieldName = 'ID_CSTICMS_BRED'
    end
    object cdsProdutoTIPO_MAT: TStringField
      FieldName = 'TIPO_MAT'
      Size = 1
    end
    object cdsProdutoID_PROCESSO_GRUPO: TIntegerField
      FieldName = 'ID_PROCESSO_GRUPO'
    end
    object cdsProdutoTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Size = 1
    end
    object cdsProdutoCRIADO_OS: TStringField
      FieldName = 'CRIADO_OS'
      Size = 1
    end
    object cdsProdutoID_MATERIAL_CRU: TIntegerField
      FieldName = 'ID_MATERIAL_CRU'
    end
    object cdsProdutoID_FORMA: TIntegerField
      FieldName = 'ID_FORMA'
    end
    object cdsProdutoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsProdutoTESTE: TStringField
      FieldName = 'TESTE'
      Size = 15
    end
    object cdsProdutoPRECO_LIQ: TFloatField
      FieldName = 'PRECO_LIQ'
    end
    object cdsProdutoUSA_CLIQ: TStringField
      FieldName = 'USA_CLIQ'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoQTD_PECA_EMB: TIntegerField
      FieldName = 'QTD_PECA_EMB'
    end
    object cdsProdutoLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object cdsProdutoALTURA: TFloatField
      FieldName = 'ALTURA'
    end
    object cdsProdutoESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object cdsProdutoMULTIPLICADOR: TFloatField
      FieldName = 'MULTIPLICADOR'
    end
    object cdsProdutoREF2: TStringField
      FieldName = 'REF2'
    end
    object cdsProdutoFATOR_CALCULO: TFloatField
      FieldName = 'FATOR_CALCULO'
    end
    object cdsProdutoREF_ORD: TStringField
      FieldName = 'REF_ORD'
    end
    object cdsProdutoGERAR_WEB: TStringField
      FieldName = 'GERAR_WEB'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoTAM_CALC: TFloatField
      FieldName = 'TAM_CALC'
    end
    object cdsProdutoCOD_BARRA2: TStringField
      FieldName = 'COD_BARRA2'
      Size = 14
    end
    object cdsProdutoPOSSUE_LADO: TStringField
      FieldName = 'POSSUE_LADO'
      Size = 1
    end
    object cdsProdutoUNIDADE2: TStringField
      FieldName = 'UNIDADE2'
      Size = 6
    end
    object cdsProdutoCAIXINHA: TStringField
      FieldName = 'CAIXINHA'
      Size = 30
    end
    object cdsProdutoSEPARA_COR: TStringField
      FieldName = 'SEPARA_COR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoVALIDADE: TSmallintField
      FieldName = 'VALIDADE'
    end
    object cdsProdutoID_CSTICMS: TIntegerField
      FieldName = 'ID_CSTICMS'
    end
    object cdsProdutoNOME_MODELO: TStringField
      FieldName = 'NOME_MODELO'
      Size = 100
    end
    object cdsProdutoDESC_MAXIMO: TFloatField
      FieldName = 'DESC_MAXIMO'
    end
    object cdsProdutoQTD_POR_ROTULO: TFloatField
      FieldName = 'QTD_POR_ROTULO'
    end
    object cdsProdutoPERC_ICMS_NFCE: TFloatField
      FieldName = 'PERC_ICMS_NFCE'
    end
    object cdsProdutoTIPO_ALGODAO: TStringField
      FieldName = 'TIPO_ALGODAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCALCULAR_ST: TStringField
      FieldName = 'CALCULAR_ST'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPRECO_CUSTO_ANT: TFloatField
      FieldName = 'PRECO_CUSTO_ANT'
    end
    object cdsProdutoCOD_BENEF: TStringField
      FieldName = 'COD_BENEF'
      Size = 8
    end
    object cdsProdutoTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Size = 4
    end
    object cdsProdutoID_PRODUTO_EST: TIntegerField
      FieldName = 'ID_PRODUTO_EST'
    end
    object cdsProdutoINDEXADOR_PRECO: TFloatField
      FieldName = 'INDEXADOR_PRECO'
    end
    object cdsProdutoANP_ID: TIntegerField
      FieldName = 'ANP_ID'
    end
    object cdsProdutoPRECO_VAREJO: TFloatField
      FieldName = 'PRECO_VAREJO'
    end
    object cdsProdutoTIPO_BALANCA: TStringField
      FieldName = 'TIPO_BALANCA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCODIGO_BALANCA: TIntegerField
      FieldName = 'CODIGO_BALANCA'
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Options = [poAllowCommandText]
    Left = 48
    Top = 200
  end
end
