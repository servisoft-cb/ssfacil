object DMCadDuplicata: TDMCadDuplicata
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 107
  Top = 10
  Height = 687
  Width = 1209
  object sdsDuplicata: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM DUPLICATA '#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 74
    Top = 10
    object sdsDuplicataID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDuplicataTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object sdsDuplicataFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsDuplicataID_NOTA: TIntegerField
      FieldName = 'ID_NOTA'
    end
    object sdsDuplicataPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object sdsDuplicataNUMDUPLICATA: TStringField
      FieldName = 'NUMDUPLICATA'
    end
    object sdsDuplicataNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object sdsDuplicataSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object sdsDuplicataDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object sdsDuplicataVLR_PARCELA: TFloatField
      FieldName = 'VLR_PARCELA'
    end
    object sdsDuplicataVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
    end
    object sdsDuplicataVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
    object sdsDuplicataVLR_DEVOLUCAO: TFloatField
      FieldName = 'VLR_DEVOLUCAO'
    end
    object sdsDuplicataVLR_DESPESAS: TFloatField
      FieldName = 'VLR_DESPESAS'
    end
    object sdsDuplicataVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object sdsDuplicataVLR_JUROSPAGOS: TFloatField
      FieldName = 'VLR_JUROSPAGOS'
    end
    object sdsDuplicataVLR_COMISSAO: TFloatField
      FieldName = 'VLR_COMISSAO'
    end
    object sdsDuplicataPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object sdsDuplicataDTULTPAGAMENTO: TDateField
      FieldName = 'DTULTPAGAMENTO'
    end
    object sdsDuplicataID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsDuplicataID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object sdsDuplicataID_TIPOCOBRANCA: TIntegerField
      FieldName = 'ID_TIPOCOBRANCA'
    end
    object sdsDuplicataID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object sdsDuplicataID_CONTA_BOLETO: TIntegerField
      FieldName = 'ID_CONTA_BOLETO'
    end
    object sdsDuplicataID_COMISSAO: TIntegerField
      FieldName = 'ID_COMISSAO'
    end
    object sdsDuplicataQTD_DIASATRASO: TIntegerField
      FieldName = 'QTD_DIASATRASO'
    end
    object sdsDuplicataDTRECEBIMENTO_TITULO: TDateField
      FieldName = 'DTRECEBIMENTO_TITULO'
    end
    object sdsDuplicataDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object sdsDuplicataPAGO_CARTORIO: TStringField
      FieldName = 'PAGO_CARTORIO'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataPROTESTADO: TStringField
      FieldName = 'PROTESTADO'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Size = 3
    end
    object sdsDuplicataARQUIVO_GERADO: TStringField
      FieldName = 'ARQUIVO_GERADO'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataTRANSFERENCIA_ICMS: TStringField
      FieldName = 'TRANSFERENCIA_ICMS'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object sdsDuplicataDTFINANCEIRO: TDateField
      FieldName = 'DTFINANCEIRO'
    end
    object sdsDuplicataNUMCHEQUE: TIntegerField
      FieldName = 'NUMCHEQUE'
    end
    object sdsDuplicataACEITE: TStringField
      FieldName = 'ACEITE'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataID_COB_ELETRONICA: TIntegerField
      FieldName = 'ID_COB_ELETRONICA'
    end
    object sdsDuplicataBOLETO_IMP: TStringField
      FieldName = 'BOLETO_IMP'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataID_CARTEIRA: TIntegerField
      FieldName = 'ID_CARTEIRA'
    end
    object sdsDuplicataID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object sdsDuplicataIMP_BOLETO: TStringField
      FieldName = 'IMP_BOLETO'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataNUM_REMESSA: TIntegerField
      FieldName = 'NUM_REMESSA'
    end
    object sdsDuplicataID_NOTA_SERVICO: TIntegerField
      FieldName = 'ID_NOTA_SERVICO'
    end
    object sdsDuplicataDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object sdsDuplicataNUMRPS: TIntegerField
      FieldName = 'NUMRPS'
    end
    object sdsDuplicataID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object sdsDuplicataID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
    end
    object sdsDuplicataTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataVLR_TAXA_BANCARIA: TFloatField
      FieldName = 'VLR_TAXA_BANCARIA'
    end
    object sdsDuplicataNUMDUPLICATA_SEQ: TIntegerField
      FieldName = 'NUMDUPLICATA_SEQ'
    end
    object sdsDuplicataPERC_COMISSAO_PAGAR_NOTA: TFloatField
      FieldName = 'PERC_COMISSAO_PAGAR_NOTA'
    end
    object sdsDuplicataANO_REF: TIntegerField
      FieldName = 'ANO_REF'
    end
    object sdsDuplicataMES_REF: TIntegerField
      FieldName = 'MES_REF'
    end
    object sdsDuplicataTITULO_CARTORIO: TStringField
      FieldName = 'TITULO_CARTORIO'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataID_DESCONTADA: TIntegerField
      FieldName = 'ID_DESCONTADA'
    end
    object sdsDuplicataCONFIRMA_PGTO: TStringField
      FieldName = 'CONFIRMA_PGTO'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataPERC_BASE_COMISSAO: TFloatField
      FieldName = 'PERC_BASE_COMISSAO'
    end
    object sdsDuplicataDESCRICAO2: TStringField
      FieldName = 'DESCRICAO2'
      Size = 100
    end
    object sdsDuplicataID_TERMINAL: TIntegerField
      FieldName = 'ID_TERMINAL'
    end
    object sdsDuplicataVLR_MULTA: TFloatField
      FieldName = 'VLR_MULTA'
    end
    object sdsDuplicataID_CONTABIL_OPE_LACTO: TIntegerField
      FieldName = 'ID_CONTABIL_OPE_LACTO'
    end
    object sdsDuplicataID_CONTABIL_OPE_BAIXA: TIntegerField
      FieldName = 'ID_CONTABIL_OPE_BAIXA'
    end
    object sdsDuplicataREGIME_CAIXA: TStringField
      FieldName = 'REGIME_CAIXA'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataPERDIDO: TStringField
      FieldName = 'PERDIDO'
      Size = 1
    end
    object sdsDuplicataINSTRUCAO_PROTESTO: TStringField
      FieldName = 'INSTRUCAO_PROTESTO'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataNGR: TStringField
      FieldName = 'NGR'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataAPROVADO: TStringField
      FieldName = 'APROVADO'
      FixedChar = True
      Size = 1
    end
    object sdsDuplicataDTAPROVADO: TDateField
      FieldName = 'DTAPROVADO'
    end
    object sdsDuplicataCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
    object sdsDuplicataDTVENCIMENTO_INI: TDateField
      FieldName = 'DTVENCIMENTO_INI'
    end
    object sdsDuplicataUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object sdsDuplicataID_VENDEDOR_INT: TIntegerField
      FieldName = 'ID_VENDEDOR_INT'
    end
    object sdsDuplicataPERC_COMISSAO_INT: TFloatField
      FieldName = 'PERC_COMISSAO_INT'
    end
    object sdsDuplicataVLR_ADTO_USADO: TFloatField
      FieldName = 'VLR_ADTO_USADO'
    end
  end
  object dspDuplicata: TDataSetProvider
    DataSet = sdsDuplicata
    Options = [poCascadeDeletes]
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspDuplicataUpdateError
    Left = 106
    Top = 9
  end
  object cdsDuplicata: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspDuplicata'
    BeforePost = cdsDuplicataBeforePost
    OnNewRecord = cdsDuplicataNewRecord
    Left = 139
    Top = 8
    object cdsDuplicataID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDuplicataTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsDuplicataFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsDuplicataID_NOTA: TIntegerField
      FieldName = 'ID_NOTA'
    end
    object cdsDuplicataPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object cdsDuplicataNUMDUPLICATA: TStringField
      FieldName = 'NUMDUPLICATA'
    end
    object cdsDuplicataNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsDuplicataSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsDuplicataDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsDuplicataVLR_PARCELA: TFloatField
      FieldName = 'VLR_PARCELA'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataVLR_DEVOLUCAO: TFloatField
      FieldName = 'VLR_DEVOLUCAO'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataVLR_DESPESAS: TFloatField
      FieldName = 'VLR_DESPESAS'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataVLR_JUROSPAGOS: TFloatField
      FieldName = 'VLR_JUROSPAGOS'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataVLR_COMISSAO: TFloatField
      FieldName = 'VLR_COMISSAO'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object cdsDuplicataDTULTPAGAMENTO: TDateField
      FieldName = 'DTULTPAGAMENTO'
    end
    object cdsDuplicataID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsDuplicataID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsDuplicataID_TIPOCOBRANCA: TIntegerField
      FieldName = 'ID_TIPOCOBRANCA'
    end
    object cdsDuplicataID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsDuplicataID_CONTA_BOLETO: TIntegerField
      FieldName = 'ID_CONTA_BOLETO'
    end
    object cdsDuplicataID_COMISSAO: TIntegerField
      FieldName = 'ID_COMISSAO'
    end
    object cdsDuplicataQTD_DIASATRASO: TIntegerField
      FieldName = 'QTD_DIASATRASO'
    end
    object cdsDuplicataDTRECEBIMENTO_TITULO: TDateField
      FieldName = 'DTRECEBIMENTO_TITULO'
    end
    object cdsDuplicataDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsDuplicataPAGO_CARTORIO: TStringField
      FieldName = 'PAGO_CARTORIO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataPROTESTADO: TStringField
      FieldName = 'PROTESTADO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Size = 3
    end
    object cdsDuplicataARQUIVO_GERADO: TStringField
      FieldName = 'ARQUIVO_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataTRANSFERENCIA_ICMS: TStringField
      FieldName = 'TRANSFERENCIA_ICMS'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object cdsDuplicataDTFINANCEIRO: TDateField
      FieldName = 'DTFINANCEIRO'
    end
    object cdsDuplicataNUMCHEQUE: TIntegerField
      FieldName = 'NUMCHEQUE'
    end
    object cdsDuplicataACEITE: TStringField
      FieldName = 'ACEITE'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicatasdsDuplicata_Hist: TDataSetField
      FieldName = 'sdsDuplicata_Hist'
    end
    object cdsDuplicataID_COB_ELETRONICA: TIntegerField
      FieldName = 'ID_COB_ELETRONICA'
    end
    object cdsDuplicataBOLETO_IMP: TStringField
      FieldName = 'BOLETO_IMP'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataID_CARTEIRA: TIntegerField
      FieldName = 'ID_CARTEIRA'
    end
    object cdsDuplicataID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsDuplicataIMP_BOLETO: TStringField
      FieldName = 'IMP_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataNUM_REMESSA: TIntegerField
      FieldName = 'NUM_REMESSA'
    end
    object cdsDuplicataID_NOTA_SERVICO: TIntegerField
      FieldName = 'ID_NOTA_SERVICO'
    end
    object cdsDuplicataDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object cdsDuplicataNUMRPS: TIntegerField
      FieldName = 'NUMRPS'
    end
    object cdsDuplicataID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsDuplicataID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
    end
    object cdsDuplicataTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataVLR_TAXA_BANCARIA: TFloatField
      FieldName = 'VLR_TAXA_BANCARIA'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataNUMDUPLICATA_SEQ: TIntegerField
      FieldName = 'NUMDUPLICATA_SEQ'
    end
    object cdsDuplicataPERC_COMISSAO_PAGAR_NOTA: TFloatField
      FieldName = 'PERC_COMISSAO_PAGAR_NOTA'
    end
    object cdsDuplicataANO_REF: TIntegerField
      FieldName = 'ANO_REF'
    end
    object cdsDuplicataMES_REF: TIntegerField
      FieldName = 'MES_REF'
    end
    object cdsDuplicataTITULO_CARTORIO: TStringField
      FieldName = 'TITULO_CARTORIO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataID_DESCONTADA: TIntegerField
      FieldName = 'ID_DESCONTADA'
    end
    object cdsDuplicataCONFIRMA_PGTO: TStringField
      FieldName = 'CONFIRMA_PGTO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataPERC_BASE_COMISSAO: TFloatField
      FieldName = 'PERC_BASE_COMISSAO'
    end
    object cdsDuplicataDESCRICAO2: TStringField
      FieldName = 'DESCRICAO2'
      Size = 100
    end
    object cdsDuplicataID_TERMINAL: TIntegerField
      FieldName = 'ID_TERMINAL'
    end
    object cdsDuplicataVLR_MULTA: TFloatField
      FieldName = 'VLR_MULTA'
    end
    object cdsDuplicataID_CONTABIL_OPE_LACTO: TIntegerField
      FieldName = 'ID_CONTABIL_OPE_LACTO'
    end
    object cdsDuplicataID_CONTABIL_OPE_BAIXA: TIntegerField
      FieldName = 'ID_CONTABIL_OPE_BAIXA'
    end
    object cdsDuplicataREGIME_CAIXA: TStringField
      FieldName = 'REGIME_CAIXA'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataPERDIDO: TStringField
      FieldName = 'PERDIDO'
      Size = 1
    end
    object cdsDuplicataINSTRUCAO_PROTESTO: TStringField
      FieldName = 'INSTRUCAO_PROTESTO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataNGR: TStringField
      FieldName = 'NGR'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataAPROVADO: TStringField
      FieldName = 'APROVADO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicataDTAPROVADO: TDateField
      FieldName = 'DTAPROVADO'
    end
    object cdsDuplicataCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
    object cdsDuplicatasdsDuplicata_Cob: TDataSetField
      FieldName = 'sdsDuplicata_Cob'
    end
    object cdsDuplicataDTVENCIMENTO_INI: TDateField
      FieldName = 'DTVENCIMENTO_INI'
    end
    object cdsDuplicatasdsDuplicata_CCusto: TDataSetField
      FieldName = 'sdsDuplicata_CCusto'
    end
    object cdsDuplicataUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object cdsDuplicataID_VENDEDOR_INT: TIntegerField
      FieldName = 'ID_VENDEDOR_INT'
    end
    object cdsDuplicataPERC_COMISSAO_INT: TFloatField
      FieldName = 'PERC_COMISSAO_INT'
    end
    object cdsDuplicataVLR_ADTO_USADO: TFloatField
      FieldName = 'VLR_ADTO_USADO'
    end
  end
  object dsDuplicata: TDataSource
    DataSet = cdsDuplicata
    Left = 170
    Top = 9
  end
  object dsDuplicata_Mestre: TDataSource
    DataSet = sdsDuplicata
    Left = 42
    Top = 57
  end
  object sdsDuplicata_Hist: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM DUPLICATA_HIST'#13#10'WHERE ID = :ID'#13#10
    DataSource = dsDuplicata_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 66
    Top = 106
    object sdsDuplicata_HistID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDuplicata_HistITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDuplicata_HistTIPO_HISTORICO: TStringField
      FieldName = 'TIPO_HISTORICO'
      Size = 3
    end
    object sdsDuplicata_HistID_HISTORICO: TIntegerField
      FieldName = 'ID_HISTORICO'
    end
    object sdsDuplicata_HistCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 250
    end
    object sdsDuplicata_HistVLR_PAGAMENTO: TFloatField
      FieldName = 'VLR_PAGAMENTO'
    end
    object sdsDuplicata_HistVLR_JUROSPAGOS: TFloatField
      FieldName = 'VLR_JUROSPAGOS'
    end
    object sdsDuplicata_HistVLR_DESCONTOS: TFloatField
      FieldName = 'VLR_DESCONTOS'
    end
    object sdsDuplicata_HistVLR_DESPESAS: TFloatField
      FieldName = 'VLR_DESPESAS'
    end
    object sdsDuplicata_HistVLR_DEVOLUCAO: TFloatField
      FieldName = 'VLR_DEVOLUCAO'
    end
    object sdsDuplicata_HistVLR_JUROSCALCULADO: TFloatField
      FieldName = 'VLR_JUROSCALCULADO'
    end
    object sdsDuplicata_HistNUMCHEQUE: TIntegerField
      FieldName = 'NUMCHEQUE'
    end
    object sdsDuplicata_HistDTPREVISAO_CHEQUE: TDateField
      FieldName = 'DTPREVISAO_CHEQUE'
    end
    object sdsDuplicata_HistID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object sdsDuplicata_HistID_COMISSAO: TIntegerField
      FieldName = 'ID_COMISSAO'
    end
    object sdsDuplicata_HistTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object sdsDuplicata_HistDTHISTORICO: TDateField
      FieldName = 'DTHISTORICO'
    end
    object sdsDuplicata_HistDTLANCAMENTO: TDateField
      FieldName = 'DTLANCAMENTO'
    end
    object sdsDuplicata_HistVLR_LANCAMENTO: TFloatField
      FieldName = 'VLR_LANCAMENTO'
    end
    object sdsDuplicata_HistID_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_PAGAMENTO'
    end
    object sdsDuplicata_HistVLR_TAXA_BANCARIA: TFloatField
      FieldName = 'VLR_TAXA_BANCARIA'
    end
    object sdsDuplicata_HistID_DESCONTADA: TIntegerField
      FieldName = 'ID_DESCONTADA'
    end
    object sdsDuplicata_HistVLR_MULTA: TFloatField
      FieldName = 'VLR_MULTA'
    end
    object sdsDuplicata_HistVLR_ADTO_USADO: TFloatField
      FieldName = 'VLR_ADTO_USADO'
    end
    object sdsDuplicata_HistID_ADTO_USADO: TIntegerField
      FieldName = 'ID_ADTO_USADO'
    end
    object sdsDuplicata_HistID_COMISSAO_INT: TIntegerField
      FieldName = 'ID_COMISSAO_INT'
    end
    object sdsDuplicata_HistOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
  end
  object cdsDuplicata_Hist: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDuplicatasdsDuplicata_Hist
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    OnCalcFields = cdsDuplicata_HistCalcFields
    OnNewRecord = cdsDuplicata_HistNewRecord
    Left = 98
    Top = 105
    object cdsDuplicata_HistID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDuplicata_HistITEM: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDuplicata_HistTIPO_HISTORICO: TStringField
      DisplayLabel = 'Tipo Hist'#243'rico'
      FieldName = 'TIPO_HISTORICO'
      Size = 3
    end
    object cdsDuplicata_HistID_HISTORICO: TIntegerField
      FieldName = 'ID_HISTORICO'
    end
    object cdsDuplicata_HistCOMPLEMENTO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'COMPLEMENTO'
      Size = 250
    end
    object cdsDuplicata_HistVLR_PAGAMENTO: TFloatField
      DisplayLabel = 'Vlr. Pagamento'
      FieldName = 'VLR_PAGAMENTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_HistVLR_JUROSPAGOS: TFloatField
      DisplayLabel = 'Vlr. Juros Pagos'
      FieldName = 'VLR_JUROSPAGOS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_HistVLR_DESCONTOS: TFloatField
      DisplayLabel = 'Vlr. Descontos'
      FieldName = 'VLR_DESCONTOS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_HistVLR_DESPESAS: TFloatField
      DisplayLabel = 'Vlr. Despesas'
      FieldName = 'VLR_DESPESAS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_HistVLR_DEVOLUCAO: TFloatField
      DisplayLabel = 'Vlr. Devolu'#231#227'o'
      FieldName = 'VLR_DEVOLUCAO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_HistVLR_JUROSCALCULADO: TFloatField
      DisplayLabel = 'Vlr. Juros Calculados'
      FieldName = 'VLR_JUROSCALCULADO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_HistNUMCHEQUE: TIntegerField
      DisplayLabel = 'N'#186' Cheque'
      FieldName = 'NUMCHEQUE'
    end
    object cdsDuplicata_HistDTPREVISAO_CHEQUE: TDateField
      DisplayLabel = 'Data Previs'#227'o Cheque'
      FieldName = 'DTPREVISAO_CHEQUE'
    end
    object cdsDuplicata_HistID_CONTA: TIntegerField
      DisplayLabel = 'ID Conta'
      FieldName = 'ID_CONTA'
    end
    object cdsDuplicata_HistID_COMISSAO: TIntegerField
      DisplayLabel = 'ID Comissao'
      FieldName = 'ID_COMISSAO'
    end
    object cdsDuplicata_HistTIPO_ES: TStringField
      DisplayLabel = 'Tipo ES'
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsDuplicata_HistDTHISTORICO: TDateField
      DisplayLabel = 'Data Hist'#243'rico'
      FieldName = 'DTHISTORICO'
    end
    object cdsDuplicata_HistDTLANCAMENTO: TDateField
      DisplayLabel = 'Data Lan'#231'amento'
      FieldName = 'DTLANCAMENTO'
    end
    object cdsDuplicata_HistVLR_LANCAMENTO: TFloatField
      DisplayLabel = 'Vlr. Lan'#231'amento'
      FieldName = 'VLR_LANCAMENTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_HistID_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_PAGAMENTO'
    end
    object cdsDuplicata_HistVLR_TAXA_BANCARIA: TFloatField
      DisplayLabel = 'Vlr. Taxa Banc'#225'ria'
      FieldName = 'VLR_TAXA_BANCARIA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_HistID_DESCONTADA: TIntegerField
      FieldName = 'ID_DESCONTADA'
    end
    object cdsDuplicata_HistVLR_MULTA: TFloatField
      FieldName = 'VLR_MULTA'
    end
    object cdsDuplicata_HistclCheque: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCheque'
      ProviderFlags = []
      Size = 1
      Calculated = True
    end
    object cdsDuplicata_HistclFormaPgto: TStringField
      FieldKind = fkCalculated
      FieldName = 'clFormaPgto'
      ProviderFlags = []
      Size = 50
      Calculated = True
    end
    object cdsDuplicata_HistclNomeConta: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNomeConta'
      ProviderFlags = []
      Size = 40
      Calculated = True
    end
    object cdsDuplicata_HistVLR_ADTO_USADO: TFloatField
      FieldName = 'VLR_ADTO_USADO'
    end
    object cdsDuplicata_HistID_ADTO_USADO: TIntegerField
      FieldName = 'ID_ADTO_USADO'
    end
    object cdsDuplicata_HistID_COMISSAO_INT: TIntegerField
      FieldName = 'ID_COMISSAO_INT'
    end
    object cdsDuplicata_HistOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
  end
  object dsDuplicata_Hist: TDataSource
    DataSet = cdsDuplicata_Hist
    Left = 130
    Top = 105
  end
  object sdsPessoa: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PES.CODIGO, PES.NOME, PES.FANTASIA, PES.ID_VENDEDOR, PES.' +
      'PERC_COMISSAO, PES.ID_CONDPGTO,'#13#10'PES.ID_CONTABOLETO, PES.ID_TIPO' +
      'COBRANCA, PES.ID_REGIME_TRIB, PES.CLIENTE_CONTA_ID, PES.FORNECED' +
      'OR_CONTA_ID,'#13#10'PES.ENDERECO, PES.NUM_END, PES.COMPLEMENTO_END, PE' +
      'S.BAIRRO, PES.CIDADE, PES.UF, PES.CEP, PES.DDDFONE1,'#13#10'PES.TELEFO' +
      'NE1, PES.CNPJ_CPF, PES.EMAIL_PGTO, PES.NOME_CONTATO, PES.INSCR_E' +
      'ST, PES.TP_CLIENTE,'#13#10'PES.TP_FORNECEDOR, PES.TP_VENDEDOR, PES.TP_' +
      'TRANSPORTADORA, PES.VENDEDOR_CONTA_ID,'#13#10'PES.TRANSPORTADORA_CONTA' +
      '_ID, PES.FUNCIONARIO_CONTA_ID, PES.TP_FUNCIONARIO'#13#10'FROM PESSOA P' +
      'ES'#13#10'WHERE PES.INATIVO = '#39'N'#39#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 296
  end
  object dspPessoa: TDataSetProvider
    DataSet = sdsPessoa
    Left = 296
    Top = 296
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspPessoa'
    Left = 328
    Top = 296
    object cdsPessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPessoaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object cdsPessoaID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsPessoaPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = '0.00'
    end
    object cdsPessoaID_CONDPGTO: TIntegerField
      FieldName = 'ID_CONDPGTO'
    end
    object cdsPessoaID_CONTABOLETO: TIntegerField
      FieldName = 'ID_CONTABOLETO'
    end
    object cdsPessoaID_TIPOCOBRANCA: TIntegerField
      FieldName = 'ID_TIPOCOBRANCA'
    end
    object cdsPessoaID_REGIME_TRIB: TIntegerField
      FieldName = 'ID_REGIME_TRIB'
    end
    object cdsPessoaCLIENTE_CONTA_ID: TIntegerField
      FieldName = 'CLIENTE_CONTA_ID'
    end
    object cdsPessoaFORNECEDOR_CONTA_ID: TIntegerField
      FieldName = 'FORNECEDOR_CONTA_ID'
    end
    object cdsPessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsPessoaNUM_END: TStringField
      FieldName = 'NUM_END'
    end
    object cdsPessoaCOMPLEMENTO_END: TStringField
      FieldName = 'COMPLEMENTO_END'
      Size = 60
    end
    object cdsPessoaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object cdsPessoaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsPessoaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsPessoaDDDFONE1: TIntegerField
      FieldName = 'DDDFONE1'
    end
    object cdsPessoaTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Size = 15
    end
    object cdsPessoaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
    object cdsPessoaEMAIL_PGTO: TStringField
      FieldName = 'EMAIL_PGTO'
      Size = 150
    end
    object cdsPessoaINSCR_EST: TStringField
      FieldName = 'INSCR_EST'
      Size = 18
    end
    object cdsPessoaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
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
    object cdsPessoaTP_VENDEDOR: TStringField
      FieldName = 'TP_VENDEDOR'
      Size = 1
    end
    object cdsPessoaTP_TRANSPORTADORA: TStringField
      FieldName = 'TP_TRANSPORTADORA'
      Size = 1
    end
    object cdsPessoaVENDEDOR_CONTA_ID: TIntegerField
      FieldName = 'VENDEDOR_CONTA_ID'
    end
    object cdsPessoaTRANSPORTADORA_CONTA_ID: TIntegerField
      FieldName = 'TRANSPORTADORA_CONTA_ID'
    end
    object cdsPessoaFUNCIONARIO_CONTA_ID: TIntegerField
      FieldName = 'FUNCIONARIO_CONTA_ID'
    end
    object cdsPessoaTP_FUNCIONARIO: TStringField
      FieldName = 'TP_FUNCIONARIO'
      FixedChar = True
      Size = 1
    end
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 360
    Top = 296
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
    Top = 352
  end
  object dspVendedor: TDataSetProvider
    DataSet = sdsVendedor
    Left = 296
    Top = 352
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspVendedor'
    Left = 328
    Top = 352
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
    Top = 352
  end
  object sdsTipoCobranca: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM TIPOCOBRANCA'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 408
  end
  object dspTipoCobranca: TDataSetProvider
    DataSet = sdsTipoCobranca
    Left = 296
    Top = 408
  end
  object cdsTipoCobranca: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspTipoCobranca'
    Left = 328
    Top = 408
    object cdsTipoCobrancaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTipoCobrancaNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsTipoCobrancaDESCONTADO: TStringField
      FieldName = 'DESCONTADO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoCobrancaDEPOSITO: TStringField
      FieldName = 'DEPOSITO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoCobrancaGERARBOLETO: TStringField
      FieldName = 'GERARBOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoCobrancaQTDDIAS: TIntegerField
      FieldName = 'QTDDIAS'
    end
    object cdsTipoCobrancaCARTAOCREDITO: TStringField
      FieldName = 'CARTAOCREDITO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoCobrancaCHEQUE: TStringField
      FieldName = 'CHEQUE'
      FixedChar = True
      Size = 1
    end
    object cdsTipoCobrancaDINHEIRO: TStringField
      FieldName = 'DINHEIRO'
      FixedChar = True
      Size = 1
    end
    object cdsTipoCobrancaMOSTRARNOCUPOM: TStringField
      FieldName = 'MOSTRARNOCUPOM'
      FixedChar = True
      Size = 1
    end
  end
  object dsTipoCobranca: TDataSource
    DataSet = cdsTipoCobranca
    Left = 360
    Top = 408
  end
  object sdsContas: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT ID, NOME, TIPO_CONTA, ID_BANCO, FILIAL, NUMCONTA, AGENCIA' +
      ', INATIVO'#13#10'FROM CONTAS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 456
  end
  object dspContas: TDataSetProvider
    DataSet = sdsContas
    Left = 296
    Top = 456
  end
  object cdsContas: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspContas'
    Left = 328
    Top = 456
    object cdsContasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContasNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsContasTIPO_CONTA: TStringField
      FieldName = 'TIPO_CONTA'
      FixedChar = True
      Size = 1
    end
    object cdsContasID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsContasFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsContasNUMCONTA: TStringField
      FieldName = 'NUMCONTA'
      Size = 12
    end
    object cdsContasAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 5
    end
    object cdsContasINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dsContas: TDataSource
    DataSet = cdsContas
    Left = 360
    Top = 456
  end
  object sdsDuplicata_Consulta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select DUP.*, VEN.NOME NOME_VENDEDOR, BCO.NOME NOME_BANCO, CTA.N' +
      'OME NOME_CONTA,'#13#10'       TC.NOME NOME_TIPOCOBRANCA, PES.ENDERECO,' +
      ' PES.COMPLEMENTO_END, PES.NUM_END, PES.BAIRRO, PES.CIDADE, PES.U' +
      'F,'#13#10'       PES.CEP, PES.CNPJ_CPF, PES.INSCR_EST, PES.ENDERECO_PG' +
      'TO, PES.COMPLEMENTO_END_PGTO, PES.NUM_END_PGTO,'#13#10'       PES.BAIR' +
      'RO_PGTO, PES.CIDADE_PGTO, PES.UF_PGTO, PES.CEP_PGTO, PES.PESSOA,' +
      ' PF.INF_SPC, BCAD.CODIGO COD_BANCO,'#13#10'       ORC.DESCRICAO NOME_O' +
      'RCAMENTO, TC.GERARBOLETO,'#13#10'       (DUP.VLR_PAGO + coalesce(DUP.V' +
      'LR_JUROSPAGOS, 0)) VLR_TOTALPAGO, PES.TELEFONE1,'#13#10'  case'#13#10'    wh' +
      'en dup.vlr_parcela > 0 then (DUP.VLR_PARCELA / coalesce((select ' +
      'N.VLR_DUPLICATA'#13#10'                                    from NOTAFI' +
      'SCAL N'#13#10'                                    where N.ID = DUP.ID_' +
      'NOTA), 1) * 100)'#13#10'    else 0'#13#10'    end PERC_TOTAL_NOTA,'#13#10'       (' +
      'select sum(N1.VLR_DUPLICATA)'#13#10'        from NOTAFISCAL N1'#13#10'      ' +
      '  where N1.ID = DUP.ID_NOTA) VLR_TOTAL_NOTA,'#13#10'  case'#13#10'    WHEN D' +
      'UP.tipo_mov = '#39'H'#39' AND coalesce(DUP.id_pessoa,0) = 0 then dup.des' +
      'cricao'#13#10'    else PES.NOME'#13#10'    END NOME_PESSOA'#13#10#13#10'from DUPLICATA' +
      ' DUP'#13#10'left join PESSOA PES on DUP.ID_PESSOA = PES.CODIGO'#13#10'left j' +
      'oin PESSOA VEN on DUP.ID_VENDEDOR = VEN.CODIGO'#13#10'left join CONTAS' +
      ' BCO on DUP.ID_CONTA_BOLETO = BCO.ID'#13#10'left join CONTAS CTA on DU' +
      'P.ID_CONTA = CTA.ID'#13#10'left join TIPOCOBRANCA TC on DUP.ID_TIPOCOB' +
      'RANCA = TC.ID'#13#10'left join BANCO BCAD on BCO.ID = BCAD.ID'#13#10'left jo' +
      'in CONTA_ORCAMENTO ORC on DUP.ID_CONTA_ORCAMENTO = ORC.ID'#13#10'left ' +
      'join PESSOA_FISICA PF on (PES.CODIGO = PF.CODIGO)'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 263
    Top = 8
  end
  object dspDuplicata_Consulta: TDataSetProvider
    DataSet = sdsDuplicata_Consulta
    Left = 296
    Top = 8
  end
  object cdsDuplicata_Consulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDuplicata_Consulta'
    OnCalcFields = cdsDuplicata_ConsultaCalcFields
    Left = 328
    Top = 9
    object cdsDuplicata_ConsultaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDuplicata_ConsultaTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsDuplicata_ConsultaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsDuplicata_ConsultaID_NOTA: TIntegerField
      FieldName = 'ID_NOTA'
    end
    object cdsDuplicata_ConsultaNUMDUPLICATA: TStringField
      DisplayLabel = 'N'#186' Duplicata'
      FieldName = 'NUMDUPLICATA'
    end
    object cdsDuplicata_ConsultaPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
    end
    object cdsDuplicata_ConsultaNUMNOTA: TIntegerField
      DisplayLabel = 'N'#186' Nota'
      FieldName = 'NUMNOTA'
    end
    object cdsDuplicata_ConsultaSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsDuplicata_ConsultaDTVENCIMENTO: TDateField
      DisplayLabel = 'Dt. Vencimento'
      FieldName = 'DTVENCIMENTO'
    end
    object cdsDuplicata_ConsultaVLR_PARCELA: TFloatField
      DisplayLabel = 'Vlr. Parcela'
      FieldName = 'VLR_PARCELA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_ConsultaVLR_RESTANTE: TFloatField
      DisplayLabel = 'Vlr. Pendente'
      FieldName = 'VLR_RESTANTE'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_ConsultaVLR_PAGO: TFloatField
      DisplayLabel = 'Vlr. Pago'
      FieldName = 'VLR_PAGO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_ConsultaVLR_DEVOLUCAO: TFloatField
      DisplayLabel = 'Vlr. Devolu'#231#227'o'
      FieldName = 'VLR_DEVOLUCAO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_ConsultaVLR_DESPESAS: TFloatField
      DisplayLabel = 'Vlr. Despesas'
      FieldName = 'VLR_DESPESAS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_ConsultaVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_ConsultaVLR_JUROSPAGOS: TFloatField
      FieldName = 'VLR_JUROSPAGOS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_ConsultaVLR_COMISSAO: TFloatField
      FieldName = 'VLR_COMISSAO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_ConsultaPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = '0.00'
    end
    object cdsDuplicata_ConsultaDTULTPAGAMENTO: TDateField
      DisplayLabel = 'Dt. Pagamento'
      FieldName = 'DTULTPAGAMENTO'
    end
    object cdsDuplicata_ConsultaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsDuplicata_ConsultaID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsDuplicata_ConsultaID_TIPOCOBRANCA: TIntegerField
      FieldName = 'ID_TIPOCOBRANCA'
    end
    object cdsDuplicata_ConsultaID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsDuplicata_ConsultaID_CONTA_BOLETO: TIntegerField
      FieldName = 'ID_CONTA_BOLETO'
    end
    object cdsDuplicata_ConsultaID_COMISSAO: TIntegerField
      FieldName = 'ID_COMISSAO'
    end
    object cdsDuplicata_ConsultaQTD_DIASATRASO: TIntegerField
      FieldName = 'QTD_DIASATRASO'
    end
    object cdsDuplicata_ConsultaDTRECEBIMENTO_TITULO: TDateField
      FieldName = 'DTRECEBIMENTO_TITULO'
    end
    object cdsDuplicata_ConsultaDTEMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'DTEMISSAO'
    end
    object cdsDuplicata_ConsultaPAGO_CARTORIO: TStringField
      FieldName = 'PAGO_CARTORIO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaPROTESTADO: TStringField
      FieldName = 'PROTESTADO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Size = 3
    end
    object cdsDuplicata_ConsultaARQUIVO_GERADO: TStringField
      FieldName = 'ARQUIVO_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaTRANSFERENCIA_ICMS: TStringField
      FieldName = 'TRANSFERENCIA_ICMS'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object cdsDuplicata_ConsultaDTFINANCEIRO: TDateField
      FieldName = 'DTFINANCEIRO'
    end
    object cdsDuplicata_ConsultaNUMCHEQUE: TIntegerField
      FieldName = 'NUMCHEQUE'
    end
    object cdsDuplicata_ConsultaACEITE: TStringField
      FieldName = 'ACEITE'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaNOME_PESSOA: TStringField
      DisplayLabel = 'Nome Pessoa'
      FieldName = 'NOME_PESSOA'
      Size = 60
    end
    object cdsDuplicata_ConsultaNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 60
    end
    object cdsDuplicata_ConsultaNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 30
    end
    object cdsDuplicata_ConsultaNOME_CONTA: TStringField
      FieldName = 'NOME_CONTA'
      Size = 30
    end
    object cdsDuplicata_ConsultaNOME_TIPOCOBRANCA: TStringField
      FieldName = 'NOME_TIPOCOBRANCA'
      Size = 30
    end
    object cdsDuplicata_ConsultaclTipo_Registro: TStringField
      FieldKind = fkCalculated
      FieldName = 'clTipo_Registro'
      Calculated = True
    end
    object cdsDuplicata_ConsultaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsDuplicata_ConsultaCOMPLEMENTO_END: TStringField
      FieldName = 'COMPLEMENTO_END'
      Size = 60
    end
    object cdsDuplicata_ConsultaNUM_END: TStringField
      FieldName = 'NUM_END'
    end
    object cdsDuplicata_ConsultaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsDuplicata_ConsultaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object cdsDuplicata_ConsultaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsDuplicata_ConsultaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsDuplicata_ConsultaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object cdsDuplicata_ConsultaINSCR_EST: TStringField
      FieldName = 'INSCR_EST'
      Size = 18
    end
    object cdsDuplicata_ConsultaENDERECO_PGTO: TStringField
      FieldName = 'ENDERECO_PGTO'
      Size = 40
    end
    object cdsDuplicata_ConsultaCOMPLEMENTO_END_PGTO: TStringField
      FieldName = 'COMPLEMENTO_END_PGTO'
      Size = 60
    end
    object cdsDuplicata_ConsultaNUM_END_PGTO: TStringField
      FieldName = 'NUM_END_PGTO'
    end
    object cdsDuplicata_ConsultaBAIRRO_PGTO: TStringField
      FieldName = 'BAIRRO_PGTO'
      Size = 26
    end
    object cdsDuplicata_ConsultaCIDADE_PGTO: TStringField
      FieldName = 'CIDADE_PGTO'
      Size = 40
    end
    object cdsDuplicata_ConsultaUF_PGTO: TStringField
      FieldName = 'UF_PGTO'
      FixedChar = True
      Size = 2
    end
    object cdsDuplicata_ConsultaCEP_PGTO: TStringField
      FieldName = 'CEP_PGTO'
      Size = 10
    end
    object cdsDuplicata_ConsultaPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaID_COB_ELETRONICA: TIntegerField
      FieldName = 'ID_COB_ELETRONICA'
    end
    object cdsDuplicata_ConsultaBOLETO_IMP: TStringField
      FieldName = 'BOLETO_IMP'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaID_CARTEIRA: TIntegerField
      FieldName = 'ID_CARTEIRA'
    end
    object cdsDuplicata_ConsultaID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsDuplicata_ConsultaIMP_BOLETO: TStringField
      FieldName = 'IMP_BOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaNUM_REMESSA: TIntegerField
      FieldName = 'NUM_REMESSA'
    end
    object cdsDuplicata_ConsultaID_NOTA_SERVICO: TIntegerField
      FieldName = 'ID_NOTA_SERVICO'
    end
    object cdsDuplicata_ConsultaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object cdsDuplicata_ConsultaNUMRPS: TIntegerField
      FieldName = 'NUMRPS'
    end
    object cdsDuplicata_ConsultaCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      Size = 3
    end
    object cdsDuplicata_ConsultaNOME_ORCAMENTO: TStringField
      FieldName = 'NOME_ORCAMENTO'
      Size = 50
    end
    object cdsDuplicata_ConsultaclVlr_Juros_Calculado: TFloatField
      FieldKind = fkCalculated
      FieldName = 'clVlr_Juros_Calculado'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object cdsDuplicata_ConsultaclDias_Atraso: TIntegerField
      DisplayLabel = 'Dias Atraso'
      FieldKind = fkCalculated
      FieldName = 'clDias_Atraso'
      Calculated = True
    end
    object cdsDuplicata_ConsultaTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaANO_REF: TIntegerField
      FieldName = 'ANO_REF'
    end
    object cdsDuplicata_ConsultaMES_REF: TIntegerField
      FieldName = 'MES_REF'
    end
    object cdsDuplicata_ConsultaVLR_TOTALPAGO: TFloatField
      FieldName = 'VLR_TOTALPAGO'
      DisplayFormat = '0.00'
    end
    object cdsDuplicata_ConsultaTITULO_CARTORIO: TStringField
      FieldName = 'TITULO_CARTORIO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaID_DESCONTADA: TIntegerField
      FieldName = 'ID_DESCONTADA'
    end
    object cdsDuplicata_ConsultaCONFIRMA_PGTO: TStringField
      FieldName = 'CONFIRMA_PGTO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaGERARBOLETO: TStringField
      FieldName = 'GERARBOLETO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaPERC_BASE_COMISSAO: TFloatField
      FieldName = 'PERC_BASE_COMISSAO'
    end
    object cdsDuplicata_ConsultaDESCRICAO2: TStringField
      FieldName = 'DESCRICAO2'
      Size = 100
    end
    object cdsDuplicata_ConsultaID_TERMINAL: TIntegerField
      FieldName = 'ID_TERMINAL'
    end
    object cdsDuplicata_ConsultaNGR: TStringField
      FieldName = 'NGR'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaAPROVADO: TStringField
      FieldName = 'APROVADO'
      FixedChar = True
      Size = 1
    end
    object cdsDuplicata_ConsultaCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
    object cdsDuplicata_ConsultaINF_SPC: TStringField
      FieldName = 'INF_SPC'
      Size = 70
    end
    object cdsDuplicata_ConsultaTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Size = 15
    end
    object cdsDuplicata_ConsultaPERC_TOTAL_NOTA: TFloatField
      FieldName = 'PERC_TOTAL_NOTA'
    end
    object cdsDuplicata_ConsultaVLR_TOTAL_NOTA: TFloatField
      FieldName = 'VLR_TOTAL_NOTA'
    end
    object cdsDuplicata_ConsultaVLR_ADTO_USADO: TFloatField
      DisplayLabel = 'Vlr. Cr'#233'dito Usado'
      FieldName = 'VLR_ADTO_USADO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsDuplicata_ConsultaID_VENDEDOR_INT: TIntegerField
      FieldName = 'ID_VENDEDOR_INT'
    end
    object cdsDuplicata_ConsultaPERC_COMISSAO_INT: TFloatField
      FieldName = 'PERC_COMISSAO_INT'
      DisplayFormat = '0.0000'
    end
  end
  object dsDuplicata_Consulta: TDataSource
    DataSet = cdsDuplicata_Consulta
    Left = 360
    Top = 8
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FILIAL'#13#10'WHERE INATIVO = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 260
    Top = 501
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 296
    Top = 504
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspFilial'
    Left = 328
    Top = 504
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
    object cdsFilialCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
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
    object cdsFilialUSARICMSSIMPLES: TStringField
      FieldName = 'USARICMSSIMPLES'
      FixedChar = True
      Size = 10
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
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 360
    Top = 504
  end
  object qParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS')
    SQLConnection = dmDatabase.scoDados
    Left = 952
    Top = 72
    object qParametrosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qParametrosENDXMLNFE: TStringField
      FieldName = 'ENDXMLNFE'
      Size = 250
    end
    object qParametrosENDPDFNFE: TStringField
      FieldName = 'ENDPDFNFE'
      Size = 250
    end
    object qParametrosSERIENORMAL: TStringField
      FieldName = 'SERIENORMAL'
      Size = 3
    end
    object qParametrosSERIECONTINGENCIA: TStringField
      FieldName = 'SERIECONTINGENCIA'
      Size = 3
    end
    object qParametrosLOCALSERVIDORNFE: TStringField
      FieldName = 'LOCALSERVIDORNFE'
      Size = 100
    end
    object qParametrosEMAILRESPONSAVELSISTEMA: TStringField
      FieldName = 'EMAILRESPONSAVELSISTEMA'
      Size = 200
    end
    object qParametrosNFEPRODUCAO: TStringField
      FieldName = 'NFEPRODUCAO'
      FixedChar = True
      Size = 1
    end
    object qParametrosANEXARDANFE: TStringField
      FieldName = 'ANEXARDANFE'
      FixedChar = True
      Size = 1
    end
    object qParametrosVERSAONFE: TStringField
      FieldName = 'VERSAONFE'
      Size = 10
    end
    object qParametrosVERSAOEMISSAONFE: TStringField
      FieldName = 'VERSAOEMISSAONFE'
      Size = 10
    end
    object qParametrosTIPOLOGONFE: TStringField
      FieldName = 'TIPOLOGONFE'
      FixedChar = True
      Size = 1
    end
    object qParametrosAPLICARDESCONTONOICMS: TStringField
      FieldName = 'APLICARDESCONTONOICMS'
      FixedChar = True
      Size = 1
    end
    object qParametrosAPLICARDESCONTONOIPI: TStringField
      FieldName = 'APLICARDESCONTONOIPI'
      FixedChar = True
      Size = 1
    end
    object qParametrosSOMARNOPROD_FRETE: TStringField
      FieldName = 'SOMARNOPROD_FRETE'
      FixedChar = True
      Size = 1
    end
    object qParametrosSOMARNOPROD_OUTRASDESP: TStringField
      FieldName = 'SOMARNOPROD_OUTRASDESP'
      FixedChar = True
      Size = 1
    end
    object qParametrosSOMARNOPROD_SEGURO: TStringField
      FieldName = 'SOMARNOPROD_SEGURO'
      FixedChar = True
      Size = 1
    end
    object qParametrosAJUSTELOGONFEAUTOMATICO: TStringField
      FieldName = 'AJUSTELOGONFEAUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object qParametrosINFNUMNOTAMANUAL: TStringField
      FieldName = 'INFNUMNOTAMANUAL'
      FixedChar = True
      Size = 1
    end
    object qParametrosOPCAO_DTENTREGAPEDIDO: TStringField
      FieldName = 'OPCAO_DTENTREGAPEDIDO'
      FixedChar = True
      Size = 1
    end
    object qParametrosOBS_SIMPLES: TStringField
      FieldName = 'OBS_SIMPLES'
      Size = 250
    end
    object qParametrosIMP_OBSSIMPLES: TStringField
      FieldName = 'IMP_OBSSIMPLES'
      FixedChar = True
      Size = 1
    end
    object qParametrosIMP_REFERENCIANANOTA: TStringField
      FieldName = 'IMP_REFERENCIANANOTA'
      FixedChar = True
      Size = 1
    end
    object qParametrosENVIARNOTABENEF_NANFE: TStringField
      FieldName = 'ENVIARNOTABENEF_NANFE'
      FixedChar = True
      Size = 1
    end
    object qParametrosESPECIE_NOTA: TStringField
      FieldName = 'ESPECIE_NOTA'
    end
    object qParametrosMARCA_NOTA: TStringField
      FieldName = 'MARCA_NOTA'
    end
    object qParametrosVERSAO_BANCO: TIntegerField
      FieldName = 'VERSAO_BANCO'
    end
    object qParametrosUSA_QTDPACOTE_NTE: TStringField
      FieldName = 'USA_QTDPACOTE_NTE'
      FixedChar = True
      Size = 1
    end
    object qParametrosATUALIZAR_PRECO: TStringField
      FieldName = 'ATUALIZAR_PRECO'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_VENDEDOR: TStringField
      FieldName = 'USA_VENDEDOR'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_CONTA_ORCAMENTO: TStringField
      FieldName = 'USA_CONTA_ORCAMENTO'
      FixedChar = True
      Size = 1
    end
    object qParametrosPERC_JUROS_PADRAO: TFloatField
      FieldName = 'PERC_JUROS_PADRAO'
    end
    object qParametrosID_CONTA_ORC_JUROS_REC: TIntegerField
      FieldName = 'ID_CONTA_ORC_JUROS_REC'
    end
    object qParametrosID_CONTA_ORC_TAXA_BANCARIA_REC: TIntegerField
      FieldName = 'ID_CONTA_ORC_TAXA_BANCARIA_REC'
    end
    object qParametrosID_CONTA_ORC_DESPESA_REC: TIntegerField
      FieldName = 'ID_CONTA_ORC_DESPESA_REC'
    end
    object qParametrosID_CONTA_ORC_JUROS_PAG: TIntegerField
      FieldName = 'ID_CONTA_ORC_JUROS_PAG'
    end
    object qParametrosID_CONTA_ORC_DESPESA_PAG: TIntegerField
      FieldName = 'ID_CONTA_ORC_DESPESA_PAG'
    end
    object qParametrosUSA_BOLETO_ACBR: TStringField
      FieldName = 'USA_BOLETO_ACBR'
      FixedChar = True
      Size = 1
    end
    object qParametrosMOSTRAR_TOTAL_ACUMULADO_DUP: TStringField
      FieldName = 'MOSTRAR_TOTAL_ACUMULADO_DUP'
      FixedChar = True
      Size = 1
    end
    object qParametrosID_CONTA_ORC_DESCONTADA: TIntegerField
      FieldName = 'ID_CONTA_ORC_DESCONTADA'
    end
    object qParametrosID_CONTA_PADRAO: TIntegerField
      FieldName = 'ID_CONTA_PADRAO'
    end
    object qParametrosID_TIPO_COBRANCA_PADRAO: TIntegerField
      FieldName = 'ID_TIPO_COBRANCA_PADRAO'
    end
  end
  object mImpDuplicata: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID_Duplicata'
    Params = <>
    Left = 632
    Top = 24
    Data = {
      2F0000009619E0BD0100000018000000010000000000030000002F000C49445F
      4475706C696361746104000100000000000000}
    object mImpDuplicataID_Duplicata: TIntegerField
      FieldName = 'ID_Duplicata'
    end
  end
  object dsmImpDuplicata: TDataSource
    DataSet = mImpDuplicata
    Left = 664
    Top = 24
  end
  object sdsFinanceiro: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FINANCEIRO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 256
    object sdsFinanceiroID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsFinanceiroTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
    object sdsFinanceiroID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object sdsFinanceiroDTMOVIMENTO: TDateField
      FieldName = 'DTMOVIMENTO'
    end
    object sdsFinanceiroID_MOVDUPLICATA: TIntegerField
      FieldName = 'ID_MOVDUPLICATA'
    end
    object sdsFinanceiroITEM_MOVDUPLICATA: TIntegerField
      FieldName = 'ITEM_MOVDUPLICATA'
    end
    object sdsFinanceiroVLR_MOVIMENTO: TFloatField
      FieldName = 'VLR_MOVIMENTO'
    end
    object sdsFinanceiroID_HISTORICO: TIntegerField
      FieldName = 'ID_HISTORICO'
    end
    object sdsFinanceiroHISTORICO_COMPL: TStringField
      FieldName = 'HISTORICO_COMPL'
      Size = 100
    end
    object sdsFinanceiroID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsFinanceiroFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsFinanceiroUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsFinanceiroDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object sdsFinanceiroHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object sdsFinanceiroID_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_PAGAMENTO'
    end
    object sdsFinanceiroID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object sdsFinanceiroID_DESCONTADA: TIntegerField
      FieldName = 'ID_DESCONTADA'
    end
    object sdsFinanceiroITEM_DESCONTADA: TIntegerField
      FieldName = 'ITEM_DESCONTADA'
    end
    object sdsFinanceiroID_TERMINAL: TIntegerField
      FieldName = 'ID_TERMINAL'
    end
  end
  object dspFinanceiro: TDataSetProvider
    DataSet = sdsFinanceiro
    Left = 88
    Top = 256
  end
  object cdsFinanceiro: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspFinanceiro'
    OnReconcileError = cdsFinanceiroReconcileError
    Left = 120
    Top = 256
    object cdsFinanceiroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFinanceiroTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
    object cdsFinanceiroID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsFinanceiroDTMOVIMENTO: TDateField
      FieldName = 'DTMOVIMENTO'
    end
    object cdsFinanceiroID_MOVDUPLICATA: TIntegerField
      FieldName = 'ID_MOVDUPLICATA'
    end
    object cdsFinanceiroITEM_MOVDUPLICATA: TIntegerField
      FieldName = 'ITEM_MOVDUPLICATA'
    end
    object cdsFinanceiroVLR_MOVIMENTO: TFloatField
      FieldName = 'VLR_MOVIMENTO'
    end
    object cdsFinanceiroID_HISTORICO: TIntegerField
      FieldName = 'ID_HISTORICO'
    end
    object cdsFinanceiroHISTORICO_COMPL: TStringField
      FieldName = 'HISTORICO_COMPL'
      Size = 100
    end
    object cdsFinanceiroID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsFinanceiroFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsFinanceiroUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsFinanceiroDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsFinanceiroHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsFinanceiroID_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_PAGAMENTO'
    end
    object cdsFinanceiroID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsFinanceiroID_DESCONTADA: TIntegerField
      FieldName = 'ID_DESCONTADA'
    end
    object cdsFinanceiroITEM_DESCONTADA: TIntegerField
      FieldName = 'ITEM_DESCONTADA'
    end
    object cdsFinanceiroID_TERMINAL: TIntegerField
      FieldName = 'ID_TERMINAL'
    end
  end
  object dsFinanceiro: TDataSource
    DataSet = cdsFinanceiro
    Left = 152
    Top = 256
  end
  object sdsCondPgto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CONDPGTO'#13#10'WHERE  coalesce(INATIVO,'#39'N'#39') = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 266
    Top = 60
    object sdsCondPgtoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsCondPgtoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsCondPgtoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dspCondPgto: TDataSetProvider
    DataSet = sdsCondPgto
    Left = 298
    Top = 60
  end
  object cdsCondPgto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspCondPgto'
    Left = 330
    Top = 60
    object cdsCondPgtoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCondPgtoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCondPgtoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsCondPgtosdsCondPgto_Dia: TDataSetField
      FieldName = 'sdsCondPgto_Dia'
    end
  end
  object dsCondPgto: TDataSource
    DataSet = cdsCondPgto
    Left = 362
    Top = 60
  end
  object dsCondPgto_Mestre: TDataSource
    DataSet = sdsCondPgto
    Left = 264
    Top = 112
  end
  object sdsCondPgto_Dia: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CONDPGTO_DIA'#13#10'WHERE ID = :ID'#13#10
    DataSource = dsCondPgto_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 160
    object sdsCondPgto_DiaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsCondPgto_DiaITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsCondPgto_DiaQTDDIAS: TIntegerField
      FieldName = 'QTDDIAS'
    end
  end
  object cdsCondPgto_Dia: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCondPgtosdsCondPgto_Dia
    Params = <>
    Left = 296
    Top = 160
    object cdsCondPgto_DiaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCondPgto_DiaITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsCondPgto_DiaQTDDIAS: TIntegerField
      FieldName = 'QTDDIAS'
    end
  end
  object qTotalAtraso: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DTVENCIMENTO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT SUM(DUP.VLR_RESTANTE) VLR_RESTANTE, DUP.TIPO_ES, DUP.FILI' +
        'AL, DUP.tipo_mov'
      'FROM DUPLICATA DUP'
      'WHERE DUP.DTVENCIMENTO < :DTVENCIMENTO'
      'and dup.transferencia_icms = '#39'N'#39
      'GROUP BY DUP.TIPO_ES, DUP.TIPO_MOV,  DUP.FILIAL')
    SQLConnection = dmDatabase.scoDados
    Left = 1016
    Top = 72
    object qTotalAtrasoTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object qTotalAtrasoFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object qTotalAtrasoVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
    end
    object qTotalAtrasoTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      FixedChar = True
      Size = 1
    end
  end
  object sdsPendente: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT SUM(DUP.VLR_RESTANTE) VLR_RESTANTE, DUP.TIPO_ES'#13#10'FROM DUP' +
      'LICATA DUP'#13#10'WHERE DUP.DTVENCIMENTO < :DTVENCIMENTO'#13#10'GROUP BY DUP' +
      '.TIPO_ES'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DTVENCIMENTO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 552
    object sdsPendenteVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
    end
    object sdsPendenteTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
  end
  object dspPendente: TDataSetProvider
    DataSet = sdsPendente
    Left = 296
    Top = 552
  end
  object cdsPendente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPendente'
    Left = 328
    Top = 552
    object cdsPendenteVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
    end
    object cdsPendenteTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
  end
  object mCheque: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Num_Cheque'
        DataType = ftInteger
      end
      item
        Name = 'ID_Banco'
        DataType = ftInteger
      end
      item
        Name = 'ID_Conta'
        DataType = ftInteger
      end
      item
        Name = 'Vlr_Cheque'
        DataType = ftFloat
      end
      item
        Name = 'DtBomPara'
        DataType = ftDate
      end
      item
        Name = 'Titular'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Fone_Titular'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Recebido_De'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Recebido'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Emitido_Por'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ID_Cheque'
        DataType = ftInteger
      end
      item
        Name = 'Agencia'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'CodCompensacao'
        DataType = ftInteger
      end
      item
        Name = 'NumConta'
        DataType = ftString
        Size = 12
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 744
    Top = 25
    Data = {
      690100009619E0BD01000000180000000E00000000000300000069010A4E756D
      5F43686571756504000100000000000849445F42616E636F0400010000000000
      0849445F436F6E746104000100000000000A566C725F43686571756508000400
      00000000094474426F6D50617261040006000000000007546974756C61720100
      4900000001000557494454480200020028000C466F6E655F546974756C617201
      004900000001000557494454480200020014000B526563656269646F5F446504
      000100000000000D4E6F6D655F526563656269646F0100490000000100055749
      4454480200020028000B456D697469646F5F506F720100490000000100055749
      4454480200020001000949445F4368657175650400010000000000074167656E
      63696101004900000001000557494454480200020005000E436F64436F6D7065
      6E736163616F0400010000000000084E756D436F6E7461010049000000010005
      5749445448020002000C000000}
    object mChequeNum_Cheque: TIntegerField
      FieldName = 'Num_Cheque'
    end
    object mChequeID_Banco: TIntegerField
      FieldName = 'ID_Banco'
    end
    object mChequeID_Conta: TIntegerField
      FieldName = 'ID_Conta'
    end
    object mChequeVlr_Cheque: TFloatField
      FieldName = 'Vlr_Cheque'
    end
    object mChequeDtBomPara: TDateField
      FieldName = 'DtBomPara'
    end
    object mChequeTitular: TStringField
      FieldName = 'Titular'
      Size = 40
    end
    object mChequeFone_Titular: TStringField
      FieldName = 'Fone_Titular'
    end
    object mChequeRecebido_De: TIntegerField
      FieldName = 'Recebido_De'
    end
    object mChequeNome_Recebido: TStringField
      FieldName = 'Nome_Recebido'
      Size = 40
    end
    object mChequelkNomeBanco: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeBanco'
      LookupDataSet = cdsBanco
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'ID_Banco'
      Size = 30
      Lookup = True
    end
    object mChequeEmitido_Por: TStringField
      FieldName = 'Emitido_Por'
      Size = 1
    end
    object mChequeID_Cheque: TIntegerField
      FieldName = 'ID_Cheque'
    end
    object mChequeAgencia: TStringField
      FieldName = 'Agencia'
      Size = 5
    end
    object mChequeCodCompensacao: TIntegerField
      FieldName = 'CodCompensacao'
    end
    object mChequeNumConta: TStringField
      FieldName = 'NumConta'
      Size = 12
    end
  end
  object dsmCheque: TDataSource
    DataSet = mCheque
    Left = 776
    Top = 24
  end
  object sdsBanco: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM BANCO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 112
  end
  object dspBanco: TDataSetProvider
    DataSet = sdsBanco
    Left = 496
    Top = 112
  end
  object cdsBanco: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspBanco'
    Left = 528
    Top = 112
    object cdsBancoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsBancoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object cdsBancoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsBancoOPCAO_GERAR_NOSSNUMERO: TStringField
      FieldName = 'OPCAO_GERAR_NOSSNUMERO'
      FixedChar = True
      Size = 1
    end
  end
  object dsBanco: TDataSource
    DataSet = cdsBanco
    Left = 560
    Top = 112
  end
  object sdsCheque: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM CHEQUE'#13#10'WHERE ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 304
    object sdsChequeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsChequeEMITIDO_POR: TStringField
      FieldName = 'EMITIDO_POR'
      FixedChar = True
      Size = 1
    end
    object sdsChequeRECEBIDO_DE: TIntegerField
      FieldName = 'RECEBIDO_DE'
    end
    object sdsChequeTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 40
    end
    object sdsChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 5
    end
    object sdsChequeCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object sdsChequeNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 10
    end
    object sdsChequeDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object sdsChequeDTBOM_PARA: TDateField
      FieldName = 'DTBOM_PARA'
    end
    object sdsChequeVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sdsChequeFONE_CONTATO: TStringField
      FieldName = 'FONE_CONTATO'
      Size = 15
    end
    object sdsChequeEMITIDO_PARA: TIntegerField
      FieldName = 'EMITIDO_PARA'
    end
    object sdsChequeFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsChequeID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object sdsChequeID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object sdsChequeNOMINAL: TStringField
      FieldName = 'NOMINAL'
      Size = 60
    end
    object sdsChequeDTCOMPENSADO: TDateField
      FieldName = 'DTCOMPENSADO'
    end
    object sdsChequeUTILIZADO_PARA: TMemoField
      FieldName = 'UTILIZADO_PARA'
      BlobType = ftMemo
      Size = 1
    end
    object sdsChequeID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object sdsChequeSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object sdsChequeCODCOMPENSACAO: TIntegerField
      FieldName = 'CODCOMPENSACAO'
    end
  end
  object dspCheque: TDataSetProvider
    DataSet = sdsCheque
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 304
  end
  object cdsCheque: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspCheque'
    BeforePost = cdsChequeBeforePost
    Left = 120
    Top = 304
    object cdsChequeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsChequeEMITIDO_POR: TStringField
      FieldName = 'EMITIDO_POR'
      FixedChar = True
      Size = 1
    end
    object cdsChequeRECEBIDO_DE: TIntegerField
      FieldName = 'RECEBIDO_DE'
    end
    object cdsChequeTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 40
    end
    object cdsChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 5
    end
    object cdsChequeCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsChequeNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 10
    end
    object cdsChequeDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsChequeDTBOM_PARA: TDateField
      FieldName = 'DTBOM_PARA'
    end
    object cdsChequeVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsChequeFONE_CONTATO: TStringField
      FieldName = 'FONE_CONTATO'
      Size = 15
    end
    object cdsChequeEMITIDO_PARA: TIntegerField
      FieldName = 'EMITIDO_PARA'
    end
    object cdsChequeFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsChequeID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsChequeID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsChequeNOMINAL: TStringField
      FieldName = 'NOMINAL'
      Size = 60
    end
    object cdsChequeDTCOMPENSADO: TDateField
      FieldName = 'DTCOMPENSADO'
    end
    object cdsChequesdsCheque_Tit: TDataSetField
      FieldName = 'sdsCheque_Tit'
    end
    object cdsChequeUTILIZADO_PARA: TMemoField
      FieldName = 'UTILIZADO_PARA'
      BlobType = ftMemo
      Size = 1
    end
    object cdsChequeID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsChequeSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsChequesdsCheque_Hist: TDataSetField
      FieldName = 'sdsCheque_Hist'
    end
    object cdsChequeCODCOMPENSACAO: TIntegerField
      FieldName = 'CODCOMPENSACAO'
    end
  end
  object dsCheque: TDataSource
    DataSet = cdsCheque
    Left = 152
    Top = 304
  end
  object dsCheque_Mestre: TDataSource
    DataSet = sdsCheque
    Left = 32
    Top = 352
  end
  object sdsCheque_Tit: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CHEQUE_TIT'#13#10'WHERE ID = :ID'
    DataSource = dsCheque_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 400
    object sdsCheque_TitID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCheque_TitITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCheque_TitID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object sdsCheque_TitITEM_HIST: TIntegerField
      FieldName = 'ITEM_HIST'
    end
    object sdsCheque_TitTIPO_MOV: TIntegerField
      FieldName = 'TIPO_MOV'
    end
    object sdsCheque_TitDEVOLVIDO: TStringField
      FieldName = 'DEVOLVIDO'
      FixedChar = True
      Size = 1
    end
    object sdsCheque_TitDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object cdsCheque_Tit: TClientDataSet
    Aggregates = <>
    DataSetField = cdsChequesdsCheque_Tit
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    Left = 88
    Top = 400
    object cdsCheque_TitID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCheque_TitITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCheque_TitID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object cdsCheque_TitITEM_HIST: TIntegerField
      FieldName = 'ITEM_HIST'
    end
    object cdsCheque_TitTIPO_MOV: TIntegerField
      FieldName = 'TIPO_MOV'
    end
    object cdsCheque_TitDEVOLVIDO: TStringField
      FieldName = 'DEVOLVIDO'
      FixedChar = True
      Size = 1
    end
    object cdsCheque_TitDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object dsCheque_Tit: TDataSource
    DataSet = cdsCheque_Tit
    Left = 120
    Top = 400
  end
  object sdsPagto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT DUP.id, DUP.dtemissao, DUP.dtvencimento, DUP.id_pessoa, D' +
      'UP.vlr_parcela, DUP.numnota, DUP.numduplicata,DUP.num_contrato,'#13 +
      #10'DUP.serie, DUP.parcela, HIST.dthistorico, HIST.dtlancamento, HI' +
      'ST.vlr_pagamento, HIST.vlr_jurospagos, HIST.vlr_descontos,'#13#10'HIST' +
      '.vlr_despesas, HIST.vlr_devolucao , PES.NOME NOME_PESSOA,VEN.NOM' +
      'E NOME_VENDEDOR,'#13#10'CTA.NOME NOME_CONTA, TC.NOME NOME_TIPOCOBRANCA' +
      ', HIST.tipo_historico, DUP.FILIAL, '#13#10'HIST.id_conta, BCAD.CODIGO ' +
      'COD_BANCO, DUP.TRANSFERENCIA_ICMS, DUP.TIPO_ES,'#13#10'CO.DESCRICAO NO' +
      'ME_CONTA_ORCAMENTO, HIST.vlr_multa, DUP.id_conta_boleto,'#13#10'CBOL.n' +
      'ome NOME_CONTA_BOLETO, PES.cnpj_cpf'#13#10'FROM DUPLICATA DUP'#13#10'INNER J' +
      'OIN DUPLICATA_HIST HIST'#13#10'ON DUP.ID = HIST.ID'#13#10'INNER JOIN PESSOA ' +
      'PES'#13#10'ON DUP.ID_PESSOA = PES.CODIGO'#13#10'LEFT JOIN PESSOA VEN'#13#10'ON DUP' +
      '.ID_VENDEDOR = VEN.CODIGO'#13#10'LEFT JOIN CONTAS CTA'#13#10'ON HIST.ID_CONT' +
      'A = CTA.ID'#13#10'LEFT JOIN TIPOCOBRANCA TC'#13#10'ON HIST.ID_FORMA_PAGAMENT' +
      'O = TC.ID'#13#10'LEFT JOIN BANCO BCAD'#13#10'ON CTA.ID_BANCO = BCAD.ID'#13#10'LEFT' +
      ' JOIN CONTA_ORCAMENTO CO'#13#10'ON DUP.ID_CONTA_ORCAMENTO = CO.ID'#13#10'LEF' +
      'T JOIN CONTAS CBOL'#13#10'ON DUP.id_conta_boleto = CBOL.ID'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 466
    Top = 168
  end
  object dspPagto: TDataSetProvider
    DataSet = sdsPagto
    Left = 496
    Top = 168
  end
  object cdsPagto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPagto'
    Left = 528
    Top = 168
    object cdsPagtoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPagtoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsPagtoDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsPagtoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsPagtoVLR_PARCELA: TFloatField
      FieldName = 'VLR_PARCELA'
    end
    object cdsPagtoNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsPagtoNUMDUPLICATA: TStringField
      FieldName = 'NUMDUPLICATA'
    end
    object cdsPagtoNUM_CONTRATO: TIntegerField
      FieldName = 'NUM_CONTRATO'
    end
    object cdsPagtoSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsPagtoPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object cdsPagtoDTHISTORICO: TDateField
      FieldName = 'DTHISTORICO'
    end
    object cdsPagtoDTLANCAMENTO: TDateField
      FieldName = 'DTLANCAMENTO'
    end
    object cdsPagtoVLR_PAGAMENTO: TFloatField
      FieldName = 'VLR_PAGAMENTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsPagtoVLR_JUROSPAGOS: TFloatField
      FieldName = 'VLR_JUROSPAGOS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsPagtoVLR_DESCONTOS: TFloatField
      FieldName = 'VLR_DESCONTOS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsPagtoVLR_DESPESAS: TFloatField
      FieldName = 'VLR_DESPESAS'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsPagtoVLR_DEVOLUCAO: TFloatField
      FieldName = 'VLR_DEVOLUCAO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsPagtoNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Size = 60
    end
    object cdsPagtoNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 60
    end
    object cdsPagtoNOME_CONTA: TStringField
      FieldName = 'NOME_CONTA'
      Size = 30
    end
    object cdsPagtoNOME_TIPOCOBRANCA: TStringField
      FieldName = 'NOME_TIPOCOBRANCA'
      Size = 30
    end
    object cdsPagtoTIPO_HISTORICO: TStringField
      FieldName = 'TIPO_HISTORICO'
      Size = 3
    end
    object cdsPagtoID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsPagtoCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      Size = 3
    end
    object cdsPagtoFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsPagtoTRANSFERENCIA_ICMS: TStringField
      FieldName = 'TRANSFERENCIA_ICMS'
      FixedChar = True
      Size = 1
    end
    object cdsPagtoTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsPagtoNOME_CONTA_ORCAMENTO: TStringField
      FieldName = 'NOME_CONTA_ORCAMENTO'
      Size = 50
    end
    object cdsPagtoVLR_MULTA: TFloatField
      FieldName = 'VLR_MULTA'
    end
    object cdsPagtoID_CONTA_BOLETO: TIntegerField
      FieldName = 'ID_CONTA_BOLETO'
    end
    object cdsPagtoNOME_CONTA_BOLETO: TStringField
      FieldName = 'NOME_CONTA_BOLETO'
      Size = 30
    end
    object cdsPagtoCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
  object dsPagto: TDataSource
    DataSet = cdsPagto
    Left = 560
    Top = 168
  end
  object sdsContaOrcamento: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT C.ID, C.DESCRICAO, C.TIPO, C.CODIGO, c.superior, CASE NIV' +
      'EL'#13#10'           WHEN 5 THEN '#39'          '#39' ||  DESCRICAO'#13#10'         ' +
      '  WHEN 4 THEN '#39'        '#39' ||  DESCRICAO'#13#10'           WHEN 3 THEN '#39 +
      '      '#39' ||  DESCRICAO'#13#10'           WHEN 2 THEN '#39'    '#39' ||  DESCRIC' +
      'AO'#13#10'           WHEN 1 THEN DESCRICAO'#13#10'           ELSE DESCRICAO'#13 +
      #10'           END AS NOME_AUX'#13#10'FROM CONTA_ORCAMENTO C '#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 265
    Top = 208
  end
  object dspContaOrcamento: TDataSetProvider
    DataSet = sdsContaOrcamento
    Left = 297
    Top = 208
  end
  object cdsContaOrcamento: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRICAO'
    Params = <>
    ProviderName = 'dspContaOrcamento'
    Left = 329
    Top = 208
    object cdsContaOrcamentoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContaOrcamentoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsContaOrcamentoCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object cdsContaOrcamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsContaOrcamentoNOME_AUX: TStringField
      FieldName = 'NOME_AUX'
      Size = 60
    end
    object cdsContaOrcamentoSUPERIOR: TStringField
      FieldName = 'SUPERIOR'
    end
  end
  object dsContaOrcamento: TDataSource
    DataSet = cdsContaOrcamento
    Left = 361
    Top = 208
  end
  object qPessoa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CODIGO, NOME, ID_VENDEDOR_INT, PERC_COMISSAO_INT'
      'FROM PESSOA'
      'WHERE CODIGO = :CODIGO')
    SQLConnection = dmDatabase.scoDados
    Left = 888
    Top = 72
    object qPessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qPessoaID_VENDEDOR_INT: TIntegerField
      FieldName = 'ID_VENDEDOR_INT'
    end
    object qPessoaPERC_COMISSAO_INT: TFloatField
      FieldName = 'PERC_COMISSAO_INT'
    end
  end
  object qFeriado: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM FERIADO'
      'WHERE DATA = :DATA')
    SQLConnection = dmDatabase.scoDados
    Left = 888
    Top = 120
    object qFeriadoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qFeriadoDATA: TDateField
      FieldName = 'DATA'
    end
    object qFeriadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object qFeriadoFIXOS: TStringField
      FieldName = 'FIXOS'
      FixedChar = True
      Size = 1
    end
  end
  object qProximaDup: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'TIPO_ES'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT MAX(NUMDUPLICATA_SEQ) NUMDUPLICATA_SEQ'
      'FROM DUPLICATA'
      'WHERE TIPO_ES = :TIPO_ES')
    SQLConnection = dmDatabase.scoDados
    Left = 888
    Top = 24
    object qProximaDupNUMDUPLICATA_SEQ: TIntegerField
      FieldName = 'NUMDUPLICATA_SEQ'
    end
  end
  object mGerarDup: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'Parcela'
    Params = <>
    Left = 632
    Top = 72
    Data = {
      520000009619E0BD01000000180000000300000000000300000052000C447456
      656E63696D656E746F04000600000000000A566C7250617263656C6108000400
      000000000750617263656C6104000100000000000000}
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
  end
  object dsmGerarDup: TDataSource
    DataSet = mGerarDup
    Left = 664
    Top = 72
  end
  object sdsDescontada: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM DESCONTADA'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 496
    object sdsDescontadaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDescontadaDTDESCONTADA: TDateField
      FieldName = 'DTDESCONTADA'
    end
    object sdsDescontadaID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object sdsDescontadaID_CONTA_DESC: TIntegerField
      FieldName = 'ID_CONTA_DESC'
    end
    object sdsDescontadaVLR_DESPESA_OPE: TFloatField
      FieldName = 'VLR_DESPESA_OPE'
    end
    object sdsDescontadaPERC_JUROS: TFloatField
      FieldName = 'PERC_JUROS'
    end
    object sdsDescontadaVLR_JUROS: TFloatField
      FieldName = 'VLR_JUROS'
    end
    object sdsDescontadaVLR_IOF: TFloatField
      FieldName = 'VLR_IOF'
    end
    object sdsDescontadaPERC_IOF: TFloatField
      FieldName = 'PERC_IOF'
    end
    object sdsDescontadaVLR_TOTAL_TIT: TFloatField
      FieldName = 'VLR_TOTAL_TIT'
    end
    object sdsDescontadaVLR_LIBERADO: TFloatField
      FieldName = 'VLR_LIBERADO'
    end
    object sdsDescontadaQTD_TITULOS: TIntegerField
      FieldName = 'QTD_TITULOS'
    end
    object sdsDescontadaDTFINAL_VECTO: TDateField
      FieldName = 'DTFINAL_VECTO'
    end
    object sdsDescontadaDTPRIMEIRO_VECTO: TDateField
      FieldName = 'DTPRIMEIRO_VECTO'
    end
    object sdsDescontadaID_TIPO_COBRANCA: TIntegerField
      FieldName = 'ID_TIPO_COBRANCA'
    end
    object sdsDescontadaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsDescontadaVLR_ANTERIOR: TFloatField
      FieldName = 'VLR_ANTERIOR'
    end
    object sdsDescontadaNUM_DESCONTADA: TIntegerField
      FieldName = 'NUM_DESCONTADA'
    end
  end
  object dspDescontada: TDataSetProvider
    DataSet = sdsDescontada
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 496
  end
  object cdsDescontada: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspDescontada'
    Left = 112
    Top = 496
    object cdsDescontadaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDescontadaDTDESCONTADA: TDateField
      FieldName = 'DTDESCONTADA'
    end
    object cdsDescontadaID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsDescontadaID_CONTA_DESC: TIntegerField
      FieldName = 'ID_CONTA_DESC'
    end
    object cdsDescontadaVLR_DESPESA_OPE: TFloatField
      FieldName = 'VLR_DESPESA_OPE'
    end
    object cdsDescontadaPERC_JUROS: TFloatField
      FieldName = 'PERC_JUROS'
    end
    object cdsDescontadaVLR_JUROS: TFloatField
      FieldName = 'VLR_JUROS'
    end
    object cdsDescontadaVLR_IOF: TFloatField
      FieldName = 'VLR_IOF'
    end
    object cdsDescontadaPERC_IOF: TFloatField
      FieldName = 'PERC_IOF'
    end
    object cdsDescontadaVLR_TOTAL_TIT: TFloatField
      FieldName = 'VLR_TOTAL_TIT'
    end
    object cdsDescontadaVLR_LIBERADO: TFloatField
      FieldName = 'VLR_LIBERADO'
    end
    object cdsDescontadaQTD_TITULOS: TIntegerField
      FieldName = 'QTD_TITULOS'
    end
    object cdsDescontadaDTFINAL_VECTO: TDateField
      FieldName = 'DTFINAL_VECTO'
    end
    object cdsDescontadaDTPRIMEIRO_VECTO: TDateField
      FieldName = 'DTPRIMEIRO_VECTO'
    end
    object cdsDescontadaID_TIPO_COBRANCA: TIntegerField
      FieldName = 'ID_TIPO_COBRANCA'
    end
    object cdsDescontadaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsDescontadaVLR_ANTERIOR: TFloatField
      FieldName = 'VLR_ANTERIOR'
    end
    object cdsDescontadaNUM_DESCONTADA: TIntegerField
      FieldName = 'NUM_DESCONTADA'
    end
    object cdsDescontadasdsDescontada_Valores: TDataSetField
      FieldName = 'sdsDescontada_Valores'
    end
  end
  object dsDescontada: TDataSource
    DataSet = cdsDescontada
    Left = 144
    Top = 496
  end
  object mTitulos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Cliente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Vlr_Parcela'
        DataType = ftFloat
      end
      item
        Name = 'Dt_Vencimento'
        DataType = ftDate
      end
      item
        Name = 'Num_Duplicata'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'CNPJ_Cliente'
        DataType = ftString
        Size = 18
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID'
    Params = <>
    StoreDefs = True
    Left = 744
    Top = 72
    Data = {
      FB0000009619E0BD010000001800000009000000000003000000FB0002494404
      000100000000000A49445F436C69656E746504000100000000000C4E6F6D655F
      436C69656E74650100490000000100055749445448020002003C000B566C725F
      50617263656C6108000400000000000D44745F56656E63696D656E746F040006
      00000000000D4E756D5F4475706C696361746101004900000001000557494454
      480200020014000750617263656C6104000100000000000646696C69616C0400
      0100000000000C434E504A5F436C69656E746501004900000001000557494454
      4802000200120001000D44454641554C545F4F524445520200820000000000}
    object mTitulosID: TIntegerField
      FieldName = 'ID'
    end
    object mTitulosID_Cliente: TIntegerField
      FieldName = 'ID_Cliente'
    end
    object mTitulosNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 60
    end
    object mTitulosVlr_Parcela: TFloatField
      FieldName = 'Vlr_Parcela'
      DisplayFormat = '0.00'
    end
    object mTitulosDt_Vencimento: TDateField
      FieldName = 'Dt_Vencimento'
    end
    object mTitulosNum_Duplicata: TStringField
      FieldName = 'Num_Duplicata'
    end
    object mTitulosParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mTitulosFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mTitulosCNPJ_Cliente: TStringField
      FieldName = 'CNPJ_Cliente'
      Size = 18
    end
  end
  object dsmTitulos: TDataSource
    DataSet = mTitulos
    Left = 776
    Top = 72
  end
  object sdsDescontada_Consulta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT D.*, AGE.nome NOME_CREDOR, C.nome NOME_CONTA_CREDITO,'#13#10'TC' +
      '.nome NOME_TIPOCOBRANCA'#13#10'FROM DESCONTADA D'#13#10'LEFT JOIN CONTAS AGE' +
      #13#10'ON D.id_conta_desc = AGE.id'#13#10'LEFT JOIN CONTAS c'#13#10'ON D.id_conta' +
      ' = C.ID'#13#10'LEFT JOIN tipocobranca TC'#13#10'ON D.id_tipo_cobranca = TC.i' +
      'd'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 216
  end
  object dspDescontada_Consulta: TDataSetProvider
    DataSet = sdsDescontada_Consulta
    UpdateMode = upWhereKeyOnly
    Left = 496
    Top = 216
  end
  object cdsDescontada_Consulta: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspDescontada_Consulta'
    Left = 528
    Top = 216
    object cdsDescontada_ConsultaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDescontada_ConsultaDTDESCONTADA: TDateField
      FieldName = 'DTDESCONTADA'
    end
    object cdsDescontada_ConsultaID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsDescontada_ConsultaID_CONTA_DESC: TIntegerField
      FieldName = 'ID_CONTA_DESC'
    end
    object cdsDescontada_ConsultaVLR_DESPESA_OPE: TFloatField
      FieldName = 'VLR_DESPESA_OPE'
    end
    object cdsDescontada_ConsultaPERC_JUROS: TFloatField
      FieldName = 'PERC_JUROS'
    end
    object cdsDescontada_ConsultaVLR_JUROS: TFloatField
      FieldName = 'VLR_JUROS'
    end
    object cdsDescontada_ConsultaVLR_IOF: TFloatField
      FieldName = 'VLR_IOF'
    end
    object cdsDescontada_ConsultaPERC_IOF: TFloatField
      FieldName = 'PERC_IOF'
    end
    object cdsDescontada_ConsultaVLR_TOTAL_TIT: TFloatField
      FieldName = 'VLR_TOTAL_TIT'
    end
    object cdsDescontada_ConsultaVLR_LIBERADO: TFloatField
      FieldName = 'VLR_LIBERADO'
    end
    object cdsDescontada_ConsultaQTD_TITULOS: TIntegerField
      FieldName = 'QTD_TITULOS'
    end
    object cdsDescontada_ConsultaDTFINAL_VECTO: TDateField
      FieldName = 'DTFINAL_VECTO'
    end
    object cdsDescontada_ConsultaDTPRIMEIRO_VECTO: TDateField
      FieldName = 'DTPRIMEIRO_VECTO'
    end
    object cdsDescontada_ConsultaID_TIPO_COBRANCA: TIntegerField
      FieldName = 'ID_TIPO_COBRANCA'
    end
    object cdsDescontada_ConsultaNOME_CREDOR: TStringField
      FieldName = 'NOME_CREDOR'
      Size = 30
    end
    object cdsDescontada_ConsultaNOME_CONTA_CREDITO: TStringField
      FieldName = 'NOME_CONTA_CREDITO'
      Size = 30
    end
    object cdsDescontada_ConsultaNOME_TIPOCOBRANCA: TStringField
      FieldName = 'NOME_TIPOCOBRANCA'
      Size = 30
    end
    object cdsDescontada_ConsultaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsDescontada_ConsultaVLR_ANTERIOR: TFloatField
      FieldName = 'VLR_ANTERIOR'
    end
    object cdsDescontada_ConsultaNUM_DESCONTADA: TIntegerField
      FieldName = 'NUM_DESCONTADA'
    end
  end
  object dsDescontada_Consulta: TDataSource
    DataSet = cdsDescontada_Consulta
    Left = 560
    Top = 216
  end
  object mExcluir_Dup: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 745
    Top = 186
    Data = {
      2F0000009619E0BD0100000018000000010000000000030000002F000C49445F
      4475706C696361746104000100000000000000}
    object mExcluir_DupID_Duplicata: TIntegerField
      FieldName = 'ID_Duplicata'
    end
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
    ReportOptions.CreateDate = 43399.644061967600000000
    ReportOptions.LastChange = 43691.734835370370000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnBeforePrint = frxReport1BeforePrint
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 952
    Top = 471
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
    Left = 984
    Top = 472
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
    Left = 1016
    Top = 472
  end
  object frxRichObject1: TfrxRichObject
    Left = 1048
    Top = 472
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxmTitulos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ID_Cliente=ID_Cliente'
      'Nome_Cliente=Nome_Cliente'
      'Vlr_Parcela=Vlr_Parcela'
      'Dt_Vencimento=Dt_Vencimento'
      'Num_Duplicata=Num_Duplicata'
      'Parcela=Parcela'
      'Filial=Filial'
      'CNPJ_Cliente=CNPJ_Cliente')
    DataSource = dsmTitulos
    BCDToCurrency = False
    Left = 984
    Top = 520
  end
  object sdsDescontada_Imp: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT D.*, AGE.nome NOME_CREDOR, C.nome NOME_CONTA_CREDITO,'#13#10'TC' +
      '.nome NOME_TIPOCOBRANCA, FIL.nome NOME_FILIAL,'#13#10'FIL.cnpj_cpf, FI' +
      'L.ddd1, FIL.fone'#13#10'FROM DESCONTADA D'#13#10'INNER JOIN FILIAL FIL'#13#10'ON D' +
      '.filial = FIL.id'#13#10'LEFT JOIN CONTAS AGE'#13#10'ON D.id_conta_desc = AGE' +
      '.id'#13#10'LEFT JOIN CONTAS c'#13#10'ON D.id_conta = C.ID'#13#10'LEFT JOIN tipocob' +
      'ranca TC'#13#10#13#10'ON D.id_tipo_cobranca = TC.id'#13#10'WHERE D.ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 264
  end
  object dspDescontada_Imp: TDataSetProvider
    DataSet = sdsDescontada_Imp
    Left = 496
    Top = 264
  end
  object cdsDescontada_Imp: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspDescontada_Imp'
    Left = 528
    Top = 264
    object cdsDescontada_ImpID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDescontada_ImpDTDESCONTADA: TDateField
      FieldName = 'DTDESCONTADA'
    end
    object cdsDescontada_ImpID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsDescontada_ImpID_CONTA_DESC: TIntegerField
      FieldName = 'ID_CONTA_DESC'
    end
    object cdsDescontada_ImpVLR_DESPESA_OPE: TFloatField
      FieldName = 'VLR_DESPESA_OPE'
    end
    object cdsDescontada_ImpPERC_JUROS: TFloatField
      FieldName = 'PERC_JUROS'
    end
    object cdsDescontada_ImpVLR_JUROS: TFloatField
      FieldName = 'VLR_JUROS'
    end
    object cdsDescontada_ImpVLR_IOF: TFloatField
      FieldName = 'VLR_IOF'
    end
    object cdsDescontada_ImpPERC_IOF: TFloatField
      FieldName = 'PERC_IOF'
    end
    object cdsDescontada_ImpVLR_TOTAL_TIT: TFloatField
      FieldName = 'VLR_TOTAL_TIT'
    end
    object cdsDescontada_ImpVLR_LIBERADO: TFloatField
      FieldName = 'VLR_LIBERADO'
    end
    object cdsDescontada_ImpQTD_TITULOS: TIntegerField
      FieldName = 'QTD_TITULOS'
    end
    object cdsDescontada_ImpDTFINAL_VECTO: TDateField
      FieldName = 'DTFINAL_VECTO'
    end
    object cdsDescontada_ImpDTPRIMEIRO_VECTO: TDateField
      FieldName = 'DTPRIMEIRO_VECTO'
    end
    object cdsDescontada_ImpID_TIPO_COBRANCA: TIntegerField
      FieldName = 'ID_TIPO_COBRANCA'
    end
    object cdsDescontada_ImpFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsDescontada_ImpVLR_ANTERIOR: TFloatField
      FieldName = 'VLR_ANTERIOR'
    end
    object cdsDescontada_ImpNOME_CREDOR: TStringField
      FieldName = 'NOME_CREDOR'
      Size = 30
    end
    object cdsDescontada_ImpNOME_CONTA_CREDITO: TStringField
      FieldName = 'NOME_CONTA_CREDITO'
      Size = 30
    end
    object cdsDescontada_ImpNOME_TIPOCOBRANCA: TStringField
      FieldName = 'NOME_TIPOCOBRANCA'
      Size = 30
    end
    object cdsDescontada_ImpNUM_DESCONTADA: TIntegerField
      FieldName = 'NUM_DESCONTADA'
    end
    object cdsDescontada_ImpNOME_FILIAL: TStringField
      FieldName = 'NOME_FILIAL'
      Size = 60
    end
    object cdsDescontada_ImpCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object cdsDescontada_ImpDDD1: TIntegerField
      FieldName = 'DDD1'
    end
    object cdsDescontada_ImpFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
  end
  object dsDescontada_Imp: TDataSource
    DataSet = cdsDescontada_Imp
    Left = 560
    Top = 264
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDescontada_Imp'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'DTDESCONTADA=DTDESCONTADA'
      'ID_CONTA=ID_CONTA'
      'ID_CONTA_DESC=ID_CONTA_DESC'
      'VLR_DESPESA_OPE=VLR_DESPESA_OPE'
      'PERC_JUROS=PERC_JUROS'
      'VLR_JUROS=VLR_JUROS'
      'VLR_IOF=VLR_IOF'
      'PERC_IOF=PERC_IOF'
      'VLR_TOTAL_TIT=VLR_TOTAL_TIT'
      'VLR_LIBERADO=VLR_LIBERADO'
      'QTD_TITULOS=QTD_TITULOS'
      'DTFINAL_VECTO=DTFINAL_VECTO'
      'DTPRIMEIRO_VECTO=DTPRIMEIRO_VECTO'
      'ID_TIPO_COBRANCA=ID_TIPO_COBRANCA'
      'FILIAL=FILIAL'
      'VLR_ANTERIOR=VLR_ANTERIOR'
      'NOME_CREDOR=NOME_CREDOR'
      'NOME_CONTA_CREDITO=NOME_CONTA_CREDITO'
      'NOME_TIPOCOBRANCA=NOME_TIPOCOBRANCA'
      'NUM_DESCONTADA=NUM_DESCONTADA'
      'NOME_FILIAL=NOME_FILIAL'
      'CNPJ_CPF=CNPJ_CPF'
      'DDD1=DDD1'
      'FONE=FONE')
    DataSource = dsDescontada_Imp
    BCDToCurrency = False
    Left = 952
    Top = 520
  end
  object dsDescontada_Mestre: TDataSource
    DataSet = sdsDescontada
    Left = 48
    Top = 544
  end
  object sdsDescontada_Valores: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM DESCONTADA_VALORES'#13#10'WHERE ID = :ID'
    DataSource = dsDescontada_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 592
    object sdsDescontada_ValoresID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDescontada_ValoresITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDescontada_ValoresID_VALORES: TIntegerField
      FieldName = 'ID_VALORES'
    end
    object sdsDescontada_ValoresNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsDescontada_ValoresID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object sdsDescontada_ValoresVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object cdsDescontada_Valores: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDescontadasdsDescontada_Valores
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    Left = 80
    Top = 592
    object cdsDescontada_ValoresID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDescontada_ValoresITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDescontada_ValoresID_VALORES: TIntegerField
      FieldName = 'ID_VALORES'
    end
    object cdsDescontada_ValoresNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsDescontada_ValoresID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsDescontada_ValoresVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object dsDescontada_Valores: TDataSource
    DataSet = cdsDescontada_Valores
    Left = 112
    Top = 592
  end
  object sdsCadastro_Valores: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CADASTRO_VALORES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 360
  end
  object dspCadastro_Valores: TDataSetProvider
    DataSet = sdsCadastro_Valores
    Left = 496
    Top = 360
  end
  object cdsCadastro_Valores: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM'
    Params = <>
    ProviderName = 'dspCadastro_Valores'
    Left = 528
    Top = 360
    object cdsCadastro_ValoresID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCadastro_ValoresNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsCadastro_ValoresID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsCadastro_ValoresORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object dsCadastro_Valores: TDataSource
    DataSet = cdsCadastro_Valores
    Left = 560
    Top = 360
  end
  object qConta_Orcamento: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ID, TIPO, CODIGO, DESCRICAO'
      'FROM CONTA_ORCAMENTO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 952
    Top = 120
    object qConta_OrcamentoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qConta_OrcamentoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qConta_OrcamentoCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object qConta_OrcamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object mCadastro: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'ID_Valores'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_Conta_Orcamento'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Conta_Orcamento'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'Item'
    Params = <>
    StoreDefs = True
    Left = 632
    Top = 128
    Data = {
      B00000009619E0BD010000001800000007000000000003000000B00002494404
      00010000000000044974656D04000100000000000A49445F56616C6F72657304
      00010000000000044E6F6D650100490000000100055749445448020002003200
      1249445F436F6E74615F4F7263616D656E746F0400010000000000144E6F6D65
      5F436F6E74615F4F7263616D656E746F01004900000001000557494454480200
      020032000556616C6F7208000400000000000000}
    object mCadastroID: TIntegerField
      FieldName = 'ID'
    end
    object mCadastroItem: TIntegerField
      FieldName = 'Item'
    end
    object mCadastroID_Valores: TIntegerField
      FieldName = 'ID_Valores'
    end
    object mCadastroNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mCadastroID_Conta_Orcamento: TIntegerField
      FieldName = 'ID_Conta_Orcamento'
    end
    object mCadastroNome_Conta_Orcamento: TStringField
      FieldName = 'Nome_Conta_Orcamento'
      Size = 50
    end
    object mCadastroValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '0.00'
    end
  end
  object dsmCadastro: TDataSource
    DataSet = mCadastro
    Left = 664
    Top = 128
  end
  object sdsDescontada_Imp_Valores: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM DESCONTADA_VALORES'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 456
  end
  object dspDescontada_Imp_Valores: TDataSetProvider
    DataSet = sdsDescontada_Imp_Valores
    UpdateMode = upWhereKeyOnly
    Left = 496
    Top = 456
  end
  object cdsDescontada_Imp_Valores: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspDescontada_Imp_Valores'
    Left = 528
    Top = 456
    object cdsDescontada_Imp_ValoresID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDescontada_Imp_ValoresITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsDescontada_Imp_ValoresID_VALORES: TIntegerField
      FieldName = 'ID_VALORES'
    end
    object cdsDescontada_Imp_ValoresNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsDescontada_Imp_ValoresID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsDescontada_Imp_ValoresVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '0.00'
    end
  end
  object dsDescontada_Imp_Valores: TDataSource
    DataSet = cdsDescontada_Imp_Valores
    Left = 560
    Top = 456
  end
  object qParametros_Fin: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_FIN'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 952
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
    object qParametros_FinUSA_ADTO: TStringField
      FieldName = 'USA_ADTO'
      FixedChar = True
      Size = 1
    end
    object qParametros_FinINF_VLR_PAGO_SEL: TStringField
      FieldName = 'INF_VLR_PAGO_SEL'
      FixedChar = True
      Size = 1
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
    Left = 984
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
  object qParametros_Geral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_GERAL'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 1048
    Top = 24
    object qParametros_GeralID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qParametros_GeralENDGRIDS: TStringField
      FieldName = 'ENDGRIDS'
      Size = 250
    end
    object qParametros_GeralMOSTRAR_COD_CONTABIL: TStringField
      FieldName = 'MOSTRAR_COD_CONTABIL'
      FixedChar = True
      Size = 1
    end
    object qParametros_GeralUSA_VENDEDOR_INT: TStringField
      FieldName = 'USA_VENDEDOR_INT'
      FixedChar = True
      Size = 1
    end
  end
  object qParametros_Com: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT P.ID, P.comissao_descontar, P.comissao_descontar_pis, coa' +
        'lesce(P.usa_config_ind,'#39'N'#39') usa_config_ind'
      'FROM PARAMETROS_COM P'
      'WHERE ID = 1')
    SQLConnection = dmDatabase.scoDados
    Left = 1018
    Top = 24
    object qParametros_ComID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qParametros_ComCOMISSAO_DESCONTAR: TStringField
      FieldName = 'COMISSAO_DESCONTAR'
      FixedChar = True
      Size = 1
    end
    object qParametros_ComCOMISSAO_DESCONTAR_PIS: TStringField
      FieldName = 'COMISSAO_DESCONTAR_PIS'
      FixedChar = True
      Size = 1
    end
    object qParametros_ComUSA_CONFIG_IND: TStringField
      FieldName = 'USA_CONFIG_IND'
      FixedChar = True
      Size = 1
    end
  end
  object qItauHist: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT D.ID, (SELECT COUNT(1) CONTADOR_BOL'
      'FROM  Duplicata_hist H'
      'WHERE H.complemento LIKE '#39'BOLETO IMPRESSO%'#39
      '  AND H.id = D.ID), (SELECT COUNT(1) CONTADOR_REM'
      '                        FROM  Duplicata_hist H2'
      
        '                         WHERE (H2.complemento LIKE '#39'REMESSA ITA' +
        '%'#39')'
      '                           AND H2.id = D.ID)'
      'FROM duplicata D'
      'WHERE D.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 1048
    Top = 72
    object qItauHistID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qItauHistCONTADOR_BOL: TIntegerField
      FieldName = 'CONTADOR_BOL'
    end
    object qItauHistCONTADOR_REM: TIntegerField
      FieldName = 'CONTADOR_REM'
    end
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxmDuplicata_Consulta'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'TIPO_ES=TIPO_ES'
      'FILIAL=FILIAL'
      'ID_NOTA=ID_NOTA'
      'NUMDUPLICATA=NUMDUPLICATA'
      'PARCELA=PARCELA'
      'NUMNOTA=NUMNOTA'
      'SERIE=SERIE'
      'DTVENCIMENTO=DTVENCIMENTO'
      'VLR_PARCELA=VLR_PARCELA'
      'VLR_RESTANTE=VLR_RESTANTE'
      'VLR_PAGO=VLR_PAGO'
      'VLR_DEVOLUCAO=VLR_DEVOLUCAO'
      'VLR_DESPESAS=VLR_DESPESAS'
      'VLR_DESCONTO=VLR_DESCONTO'
      'VLR_JUROSPAGOS=VLR_JUROSPAGOS'
      'VLR_COMISSAO=VLR_COMISSAO'
      'PERC_COMISSAO=PERC_COMISSAO'
      'DTULTPAGAMENTO=DTULTPAGAMENTO'
      'ID_PESSOA=ID_PESSOA'
      'ID_CONTA=ID_CONTA'
      'ID_TIPOCOBRANCA=ID_TIPOCOBRANCA'
      'ID_VENDEDOR=ID_VENDEDOR'
      'ID_CONTA_BOLETO=ID_CONTA_BOLETO'
      'ID_COMISSAO=ID_COMISSAO'
      'QTD_DIASATRASO=QTD_DIASATRASO'
      'DTRECEBIMENTO_TITULO=DTRECEBIMENTO_TITULO'
      'DTEMISSAO=DTEMISSAO'
      'PAGO_CARTORIO=PAGO_CARTORIO'
      'PROTESTADO=PROTESTADO'
      'TIPO_LANCAMENTO=TIPO_LANCAMENTO'
      'ARQUIVO_GERADO=ARQUIVO_GERADO'
      'TRANSFERENCIA_ICMS=TRANSFERENCIA_ICMS'
      'NOSSONUMERO=NOSSONUMERO'
      'DTFINANCEIRO=DTFINANCEIRO'
      'NUMCHEQUE=NUMCHEQUE'
      'ACEITE=ACEITE'
      'NOME_PESSOA=NOME_PESSOA'
      'NOME_VENDEDOR=NOME_VENDEDOR'
      'NOME_BANCO=NOME_BANCO'
      'NOME_CONTA=NOME_CONTA'
      'NOME_TIPOCOBRANCA=NOME_TIPOCOBRANCA'
      'clTipo_Registro=clTipo_Registro'
      'ENDERECO=ENDERECO'
      'COMPLEMENTO_END=COMPLEMENTO_END'
      'NUM_END=NUM_END'
      'BAIRRO=BAIRRO'
      'CIDADE=CIDADE'
      'UF=UF'
      'CEP=CEP'
      'CNPJ_CPF=CNPJ_CPF'
      'INSCR_EST=INSCR_EST'
      'ENDERECO_PGTO=ENDERECO_PGTO'
      'COMPLEMENTO_END_PGTO=COMPLEMENTO_END_PGTO'
      'NUM_END_PGTO=NUM_END_PGTO'
      'BAIRRO_PGTO=BAIRRO_PGTO'
      'CIDADE_PGTO=CIDADE_PGTO'
      'UF_PGTO=UF_PGTO'
      'CEP_PGTO=CEP_PGTO'
      'PESSOA=PESSOA'
      'ID_COB_ELETRONICA=ID_COB_ELETRONICA'
      'BOLETO_IMP=BOLETO_IMP'
      'ID_CARTEIRA=ID_CARTEIRA'
      'ID_BANCO=ID_BANCO'
      'IMP_BOLETO=IMP_BOLETO'
      'NUM_REMESSA=NUM_REMESSA'
      'ID_NOTA_SERVICO=ID_NOTA_SERVICO'
      'DESCRICAO=DESCRICAO'
      'NUMRPS=NUMRPS'
      'COD_BANCO=COD_BANCO'
      'NOME_ORCAMENTO=NOME_ORCAMENTO'
      'clVlr_Juros_Calculado=clVlr_Juros_Calculado'
      'clDias_Atraso=clDias_Atraso'
      'TIPO_MOV=TIPO_MOV'
      'ANO_REF=ANO_REF'
      'MES_REF=MES_REF'
      'VLR_TOTALPAGO=VLR_TOTALPAGO'
      'TITULO_CARTORIO=TITULO_CARTORIO'
      'ID_DESCONTADA=ID_DESCONTADA'
      'CONFIRMA_PGTO=CONFIRMA_PGTO'
      'GERARBOLETO=GERARBOLETO'
      'PERC_BASE_COMISSAO=PERC_BASE_COMISSAO'
      'DESCRICAO2=DESCRICAO2'
      'ID_TERMINAL=ID_TERMINAL'
      'NGR=NGR'
      'APROVADO=APROVADO'
      'CANCELADA=CANCELADA'
      'INF_SPC=INF_SPC'
      'TELEFONE1=TELEFONE1'
      'PERC_TOTAL_NOTA=PERC_TOTAL_NOTA'
      'VLR_TOTAL_NOTA=VLR_TOTAL_NOTA')
    DataSource = dsDuplicata_Consulta
    BCDToCurrency = False
    Left = 1016
    Top = 520
  end
  object sdsContabil_Ope: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CONTABIL_OPE'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 410
  end
  object dspContabil_Ope: TDataSetProvider
    DataSet = sdsContabil_Ope
    Left = 496
    Top = 410
  end
  object cdsContabil_Ope: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspContabil_Ope'
    Left = 528
    Top = 410
    object cdsContabil_OpeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContabil_OpeNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object dsContabil_Ope: TDataSource
    DataSet = cdsContabil_Ope
    Left = 560
    Top = 410
  end
  object qParametros_Cta_Orc: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_CTA_ORC')
    SQLConnection = dmDatabase.scoDados
    Left = 920
    Top = 24
    object qParametros_Cta_OrcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qParametros_Cta_OrcID_CONTA_ORC_MULTA_PAG: TIntegerField
      FieldName = 'ID_CONTA_ORC_MULTA_PAG'
    end
    object qParametros_Cta_OrcID_CONTA_ORC_MULTA_REC: TIntegerField
      FieldName = 'ID_CONTA_ORC_MULTA_REC'
    end
  end
  object sdsCarteira: TSQLDataSet
    CommandText = 'SELECT * FROM COB_CARTEIRA WHERE ID_BANCO = :ID_BANCO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_BANCO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 512
    object sdsCarteiraID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsCarteiraCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object sdsCarteiraCODIGO_IMP: TStringField
      FieldName = 'CODIGO_IMP'
      Size = 7
    end
    object sdsCarteiraNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object sdsCarteiraGERAR_NOSSONUMERO: TStringField
      FieldName = 'GERAR_NOSSONUMERO'
      FixedChar = True
      Size = 1
    end
    object sdsCarteiraGERAR_REMESSA: TStringField
      FieldName = 'GERAR_REMESSA'
      FixedChar = True
      Size = 1
    end
    object sdsCarteiraID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object sdsCarteiraCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      FixedChar = True
      Size = 3
    end
  end
  object dspCarteira: TDataSetProvider
    DataSet = sdsCarteira
    Left = 496
    Top = 512
  end
  object cdsCarteira: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCarteira'
    Left = 528
    Top = 512
    object cdsCarteiraID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCarteiraCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object cdsCarteiraCODIGO_IMP: TStringField
      FieldName = 'CODIGO_IMP'
      Size = 7
    end
    object cdsCarteiraNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsCarteiraGERAR_NOSSONUMERO: TStringField
      FieldName = 'GERAR_NOSSONUMERO'
      FixedChar = True
      Size = 1
    end
    object cdsCarteiraGERAR_REMESSA: TStringField
      FieldName = 'GERAR_REMESSA'
      FixedChar = True
      Size = 1
    end
    object cdsCarteiraID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsCarteiraCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      FixedChar = True
      Size = 3
    end
  end
  object dsCarteira: TDataSource
    DataSet = cdsCarteira
    Left = 560
    Top = 512
  end
  object qFormaPgto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT T.ID, T.NOME, T.CHEQUE'
      'FROM TIPOCOBRANCA T'
      'WHERE T.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 920
    Top = 72
    object qFormaPgtoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qFormaPgtoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qFormaPgtoCHEQUE: TStringField
      FieldName = 'CHEQUE'
      FixedChar = True
      Size = 1
    end
  end
  object sdsChequePend: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT C.*, P.NOME NOME_CLIENTE,'#13#10'CASE'#13#10'  WHEN C.EMITIDO_POR = '#39 +
      '2'#39' THEN '#39'Cliente'#39#13#10'  WHEN C.EMITIDO_POR = '#39'3'#39' THEN '#39'Terceiro'#39#13#10' ' +
      ' end DESC_EMITENTE'#13#10'FROM CHEQUE C'#13#10'LEFT JOIN PESSOA P'#13#10'ON C.RECE' +
      'BIDO_DE = P.CODIGO'#13#10'WHERE C.STATUS = '#39'0'#39#13#10'  AND ((C.EMITIDO_POR ' +
      '= '#39'2'#39') or (C.EMITIDO_POR = '#39'3'#39'))'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 568
  end
  object dspChequePend: TDataSetProvider
    DataSet = sdsChequePend
    Left = 496
    Top = 568
  end
  object cdsChequePend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChequePend'
    Left = 528
    Top = 568
    object cdsChequePendID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsChequePendEMITIDO_POR: TStringField
      FieldName = 'EMITIDO_POR'
      FixedChar = True
      Size = 1
    end
    object cdsChequePendRECEBIDO_DE: TIntegerField
      FieldName = 'RECEBIDO_DE'
    end
    object cdsChequePendTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 40
    end
    object cdsChequePendAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 5
    end
    object cdsChequePendCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object cdsChequePendNUM_CHEQUE: TStringField
      FieldName = 'NUM_CHEQUE'
      Size = 10
    end
    object cdsChequePendDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsChequePendDTBOM_PARA: TDateField
      FieldName = 'DTBOM_PARA'
    end
    object cdsChequePendVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsChequePendFONE_CONTATO: TStringField
      FieldName = 'FONE_CONTATO'
      Size = 15
    end
    object cdsChequePendEMITIDO_PARA: TIntegerField
      FieldName = 'EMITIDO_PARA'
    end
    object cdsChequePendFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsChequePendID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsChequePendID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsChequePendNOMINAL: TStringField
      FieldName = 'NOMINAL'
      Size = 60
    end
    object cdsChequePendDTCOMPENSADO: TDateField
      FieldName = 'DTCOMPENSADO'
    end
    object cdsChequePendUTILIZADO_PARA: TMemoField
      FieldName = 'UTILIZADO_PARA'
      BlobType = ftMemo
      Size = 1
    end
    object cdsChequePendID_CONTA_ORCAMENTO: TIntegerField
      FieldName = 'ID_CONTA_ORCAMENTO'
    end
    object cdsChequePendSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsChequePendNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsChequePendSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object cdsChequePendDESC_EMITENTE: TStringField
      FieldName = 'DESC_EMITENTE'
      FixedChar = True
      Size = 8
    end
  end
  object dsChequePend: TDataSource
    DataSet = cdsChequePend
    Left = 560
    Top = 568
  end
  object qChequeTit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_DUPLICATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM_HIST'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT T.*'
      'FROM CHEQUE_TIT T'
      'INNER JOIN CHEQUE C'
      'ON T.ID = C.ID'
      'WHERE ((C.EMITIDO_POR = '#39'2'#39') or (C.EMITIDO_POR = '#39'3'#39'))'
      '  AND T.DEVOLVIDO = '#39'N'#39
      '  AND T.ID_DUPLICATA = :ID_DUPLICATA'
      '  AND T.ITEM_HIST = :ITEM_HIST')
    SQLConnection = dmDatabase.scoDados
    Left = 984
    Top = 72
    object qChequeTitID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qChequeTitITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qChequeTitID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object qChequeTitITEM_HIST: TIntegerField
      FieldName = 'ITEM_HIST'
    end
    object qChequeTitTIPO_MOV: TIntegerField
      FieldName = 'TIPO_MOV'
    end
  end
  object sdsCheque_Hist: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CHEQUE_HIST'#13#10'WHERE ID = :ID'
    DataSource = dsCheque_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 448
    object sdsCheque_HistID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCheque_HistITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsCheque_HistDTMOVIMENTO: TDateField
      FieldName = 'DTMOVIMENTO'
    end
    object sdsCheque_HistTIPO_HIST: TStringField
      FieldName = 'TIPO_HIST'
      FixedChar = True
      Size = 1
    end
  end
  object cdsCheque_Hist: TClientDataSet
    Aggregates = <>
    DataSetField = cdsChequesdsCheque_Hist
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    Left = 88
    Top = 448
    object cdsCheque_HistID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCheque_HistITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCheque_HistDTMOVIMENTO: TDateField
      FieldName = 'DTMOVIMENTO'
    end
    object cdsCheque_HistTIPO_HIST: TStringField
      FieldName = 'TIPO_HIST'
      FixedChar = True
      Size = 1
    end
  end
  object dsCheque_Hist: TDataSource
    DataSet = cdsCheque_Hist
    Left = 120
    Top = 448
  end
  object sdsDuplicata_Cob: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM DUPLICATA_COB'#13#10'WHERE ID = :ID'
    DataSource = dsDuplicata_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 66
    Top = 153
    object sdsDuplicata_CobID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDuplicata_CobITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDuplicata_CobID_OCORRENCIA: TIntegerField
      FieldName = 'ID_OCORRENCIA'
    end
    object sdsDuplicata_CobDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsDuplicata_CobDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object sdsDuplicata_CobUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsDuplicata_CobDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object sdsDuplicata_CobHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object sdsDuplicata_CobDTREMESSA: TDateField
      FieldName = 'DTREMESSA'
    end
    object sdsDuplicata_CobID_DUPLICATA_HIST: TIntegerField
      FieldName = 'ID_DUPLICATA_HIST'
    end
    object sdsDuplicata_CobID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
  end
  object cdsDuplicata_Cob: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDuplicatasdsDuplicata_Cob
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    Left = 98
    Top = 153
    object cdsDuplicata_CobID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDuplicata_CobITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDuplicata_CobID_OCORRENCIA: TIntegerField
      FieldName = 'ID_OCORRENCIA'
    end
    object cdsDuplicata_CobDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsDuplicata_CobDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object cdsDuplicata_CobUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsDuplicata_CobDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsDuplicata_CobHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsDuplicata_CobDTREMESSA: TDateField
      FieldName = 'DTREMESSA'
    end
    object cdsDuplicata_CobID_DUPLICATA_HIST: TIntegerField
      FieldName = 'ID_DUPLICATA_HIST'
    end
    object cdsDuplicata_CobID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
  end
  object dsDuplicata_Cob: TDataSource
    DataSet = cdsDuplicata_Cob
    Left = 130
    Top = 153
  end
  object sdsOcorrencia: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM COB_TIPO_CADASTRO'#13#10'WHERE TIPO_REG = '#39'OCO'#39#13#10'   AND' +
      ' ID_BANCO = :ID_BANCO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_BANCO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 312
  end
  object dspOcorrencia: TDataSetProvider
    DataSet = sdsOcorrencia
    Left = 496
    Top = 312
  end
  object cdsOcorrencia: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODIGO'
    Params = <>
    ProviderName = 'dspOcorrencia'
    Left = 528
    Top = 312
    object cdsOcorrenciaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsOcorrenciaCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object cdsOcorrenciaNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsOcorrenciaTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object cdsOcorrenciaID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsOcorrenciaTIPO_OCO: TStringField
      FieldName = 'TIPO_OCO'
      Size = 3
    end
  end
  object dsOcorrencia: TDataSource
    DataSet = cdsOcorrencia
    Left = 560
    Top = 312
  end
  object sdsDuplicata_CCusto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM DUPLICATA_CCUSTO'#13#10'WHERE ID = :ID'
    DataSource = dsDuplicata_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 200
    object sdsDuplicata_CCustoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDuplicata_CCustoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsDuplicata_CCustoID_CENTROCUSTO: TIntegerField
      FieldName = 'ID_CENTROCUSTO'
    end
    object sdsDuplicata_CCustoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object sdsDuplicata_CCustoVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object cdsDuplicata_CCusto: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDuplicatasdsDuplicata_CCusto
    Params = <>
    OnCalcFields = cdsDuplicata_CCustoCalcFields
    Left = 96
    Top = 200
    object cdsDuplicata_CCustoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDuplicata_CCustoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDuplicata_CCustoID_CENTROCUSTO: TIntegerField
      FieldName = 'ID_CENTROCUSTO'
    end
    object cdsDuplicata_CCustoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object cdsDuplicata_CCustoclNome_CCusto: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_CCusto'
      ProviderFlags = []
      Size = 40
      Calculated = True
    end
    object cdsDuplicata_CCustoVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object dsDuplicata_CCusto: TDataSource
    DataSet = cdsDuplicata_CCusto
    Left = 128
    Top = 200
  end
  object qCCusto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT C.ID, C.DESCRICAO'
      'FROM CENTROCUSTO C'
      'WHERE C.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 920
    Top = 120
    object qCCustoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qCCustoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object qOrcCCusto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CENTROCUSTO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select co.percentual from conta_orcamento_ccusto CO'
      'WHERE CO.ID = :ID'
      '  and co.id_centrocusto = :ID_CENTROCUSTO')
    SQLConnection = dmDatabase.scoDados
    Left = 1014
    Top = 124
    object qOrcCCustoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
  end
  object frxPagto: TfrxDBDataset
    UserName = 'frxPagto'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'DTEMISSAO=DTEMISSAO'
      'DTVENCIMENTO=DTVENCIMENTO'
      'ID_PESSOA=ID_PESSOA'
      'VLR_PARCELA=VLR_PARCELA'
      'NUMNOTA=NUMNOTA'
      'NUMDUPLICATA=NUMDUPLICATA'
      'NUM_CONTRATO=NUM_CONTRATO'
      'SERIE=SERIE'
      'PARCELA=PARCELA'
      'DTHISTORICO=DTHISTORICO'
      'DTLANCAMENTO=DTLANCAMENTO'
      'VLR_PAGAMENTO=VLR_PAGAMENTO'
      'VLR_JUROSPAGOS=VLR_JUROSPAGOS'
      'VLR_DESCONTOS=VLR_DESCONTOS'
      'VLR_DESPESAS=VLR_DESPESAS'
      'VLR_DEVOLUCAO=VLR_DEVOLUCAO'
      'NOME_PESSOA=NOME_PESSOA'
      'NOME_VENDEDOR=NOME_VENDEDOR'
      'NOME_CONTA=NOME_CONTA'
      'NOME_TIPOCOBRANCA=NOME_TIPOCOBRANCA'
      'TIPO_HISTORICO=TIPO_HISTORICO'
      'ID_CONTA=ID_CONTA'
      'COD_BANCO=COD_BANCO'
      'FILIAL=FILIAL'
      'TRANSFERENCIA_ICMS=TRANSFERENCIA_ICMS'
      'TIPO_ES=TIPO_ES'
      'NOME_CONTA_ORCAMENTO=NOME_CONTA_ORCAMENTO'
      'VLR_MULTA=VLR_MULTA'
      'ID_CONTA_BOLETO=ID_CONTA_BOLETO'
      'NOME_CONTA_BOLETO=NOME_CONTA_BOLETO')
    DataSource = dsPagto
    BCDToCurrency = False
    Left = 1051
    Top = 520
  end
  object dsmRecibo: TDataSource
    DataSet = mRecibo
    Left = 728
    Top = 272
  end
  object mRecibo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Filial'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Filial_End'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Filial_Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Filial_UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Filial_CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Pessoa_Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Pessoa_Doc'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Financeiro_Forma'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Financeiro_Data'
        DataType = ftDate
      end
      item
        Name = 'Financeiro_Descr'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Filial_Fone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Filial_Email'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Financeiro_VlrExtenso'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Filial_CNPJ'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Financeiro_Valor'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 696
    Top = 272
    Data = {
      F80100009619E0BD01000000180000000F000000000003000000F8010646696C
      69616C0100490000000100055749445448020002001E000A46696C69616C5F45
      6E6401004900000001000557494454480200020028000D46696C69616C5F4369
      646164650100490000000100055749445448020002001E000946696C69616C5F
      554601004900000001000557494454480200020002000A46696C69616C5F4345
      5001004900000001000557494454480200020009000B506573736F615F4E6F6D
      6501004900000001000557494454480200020028000A506573736F615F446F63
      01004900000001000557494454480200020012001046696E616E636569726F5F
      466F726D6101004900000001000557494454480200020019000F46696E616E63
      6569726F5F4461746104000600000000001046696E616E636569726F5F446573
      6372010049000000010005574944544802000200C8000B46696C69616C5F466F
      6E6501004900000001000557494454480200020014000C46696C69616C5F456D
      61696C01004900000001000557494454480200020028001546696E616E636569
      726F5F566C72457874656E736F01004900000001000557494454480200020096
      000B46696C69616C5F434E504A01004900000001000557494454480200020012
      001046696E616E636569726F5F56616C6F7208000400000000000000}
    object mReciboFilial: TStringField
      FieldName = 'Filial'
      Size = 30
    end
    object mReciboFilial_End: TStringField
      FieldName = 'Filial_End'
      Size = 40
    end
    object mReciboFilial_Cidade: TStringField
      FieldName = 'Filial_Cidade'
      Size = 30
    end
    object mReciboFilial_UF: TStringField
      FieldName = 'Filial_UF'
      Size = 2
    end
    object mReciboFilial_CEP: TStringField
      FieldName = 'Filial_CEP'
      Size = 9
    end
    object mReciboPessoa_Nome: TStringField
      FieldName = 'Pessoa_Nome'
      Size = 40
    end
    object mReciboPessoa_Doc: TStringField
      FieldName = 'Pessoa_Doc'
      Size = 18
    end
    object mReciboFinanceiro_Forma: TStringField
      FieldName = 'Financeiro_Forma'
      Size = 25
    end
    object mReciboFinanceiro_Data: TDateField
      FieldName = 'Financeiro_Data'
    end
    object mReciboFinanceiro_Descr: TStringField
      FieldName = 'Financeiro_Descr'
      Size = 200
    end
    object mReciboFilial_Fone: TStringField
      FieldName = 'Filial_Fone'
    end
    object mReciboFilial_Email: TStringField
      FieldName = 'Filial_Email'
      Size = 40
    end
    object mReciboFinanceiro_VlrExtenso: TStringField
      FieldName = 'Financeiro_VlrExtenso'
      Size = 150
    end
    object mReciboFilial_CNPJ: TStringField
      FieldName = 'Filial_CNPJ'
      Size = 18
    end
    object mReciboFinanceiro_Valor: TFloatField
      FieldName = 'Financeiro_Valor'
    end
  end
  object frxRecibo: TfrxDBDataset
    UserName = 'frxRecibo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Filial=Filial'
      'Filial_End=Filial_End'
      'Filial_Cidade=Filial_Cidade'
      'Filial_UF=Filial_UF'
      'Filial_CEP=Filial_CEP'
      'Pessoa_Nome=Pessoa_Nome'
      'Pessoa_Doc=Pessoa_Doc'
      'Financeiro_Forma=Financeiro_Forma'
      'Financeiro_Data=Financeiro_Data'
      'Financeiro_Descr=Financeiro_Descr'
      'Filial_Fone=Filial_Fone'
      'Filial_Email=Filial_Email'
      'Financeiro_VlrExtenso=Financeiro_VlrExtenso'
      'Filial_CNPJ=Filial_CNPJ'
      'Financeiro_Valor=Financeiro_Valor')
    DataSet = mRecibo
    BCDToCurrency = False
    Left = 760
    Top = 272
  end
  object sdsDupCCusto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT DC.id_centrocusto, DC.percentual, DC.valor, C.descricao N' +
      'OME_CCUSTO'#13#10'FROM duplicata_ccusto dc'#13#10'INNER JOIN centrocusto C'#13#10 +
      'ON DC.id_centrocusto = C.ID'#13#10'WHERE coalesce(DC.percentual,0) > 0' +
      #13#10'  AND DC.ID = :ID'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 689
    Top = 395
  end
  object dspDupCCusto: TDataSetProvider
    DataSet = sdsDupCCusto
    Left = 721
    Top = 395
  end
  object cdsDupCCusto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDupCCusto'
    Left = 753
    Top = 394
    object cdsDupCCustoID_CENTROCUSTO: TIntegerField
      FieldName = 'ID_CENTROCUSTO'
    end
    object cdsDupCCustoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '%0.00'
    end
    object cdsDupCCustoVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = 'R$###,###,##0.00'
    end
    object cdsDupCCustoNOME_CCUSTO: TStringField
      FieldName = 'NOME_CCUSTO'
      Size = 50
    end
  end
  object dsDupCCusto: TDataSource
    DataSet = cdsDupCCusto
    Left = 784
    Top = 395
  end
  object sdsPagtoAdto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PAGTOADTO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 687
    Top = 481
    object sdsPagtoAdtoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPagtoAdtoDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsPagtoAdtoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsPagtoAdtoVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object sdsPagtoAdtoID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
  end
  object dspPagtoAdto: TDataSetProvider
    DataSet = sdsPagtoAdto
    UpdateMode = upWhereKeyOnly
    Left = 719
    Top = 480
  end
  object cdsPagtoAdto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPagtoAdto'
    Left = 750
    Top = 479
    object cdsPagtoAdtoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPagtoAdtoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsPagtoAdtoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsPagtoAdtoVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsPagtoAdtoID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsPagtoAdtosdsPagtoAdto_Itens: TDataSetField
      FieldName = 'sdsPagtoAdto_Itens'
    end
  end
  object dsPagtoAdto: TDataSource
    DataSet = cdsPagtoAdto
    Left = 783
    Top = 479
  end
  object dsPagtoAdto_Mestre: TDataSource
    DataSet = sdsPagtoAdto
    Left = 673
    Top = 531
  end
  object sdsPagtoAdto_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PAGTOADTO_ITENS'#13#10'WHERE ID = :ID'
    DataSource = dsPagtoAdto_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 711
    Top = 582
    object sdsPagtoAdto_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPagtoAdto_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPagtoAdto_ItensID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object sdsPagtoAdto_ItensVLR_DUPLICATA: TFloatField
      FieldName = 'VLR_DUPLICATA'
    end
    object sdsPagtoAdto_ItensVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
  end
  object cdsPagtoAdto_Itens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPagtoAdtosdsPagtoAdto_Itens
    Params = <>
    Left = 759
    Top = 586
    object cdsPagtoAdto_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPagtoAdto_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPagtoAdto_ItensID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object cdsPagtoAdto_ItensVLR_DUPLICATA: TFloatField
      FieldName = 'VLR_DUPLICATA'
    end
    object cdsPagtoAdto_ItensVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
  end
  object dsPagtoAdto_Itens: TDataSource
    DataSet = cdsPagtoAdto_Itens
    Left = 806
    Top = 584
  end
  object qContas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select C.ID, C.NOME, C.TIPO_CONTA'
      'from CONTAS C'
      'where C.ID = :ID   ')
    SQLConnection = dmDatabase.scoDados
    Left = 861
    Top = 248
    object qContasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qContasNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qContasTIPO_CONTA: TStringField
      FieldName = 'TIPO_CONTA'
      FixedChar = True
      Size = 1
    end
  end
end
