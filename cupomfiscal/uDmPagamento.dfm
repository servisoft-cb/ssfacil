object dmPagamento: TdmPagamento
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 590
  Top = 120
  Height = 425
  Width = 667
  object sdsDuplicata: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT D.ID, D.DTVENCIMENTO, D.VLR_RESTANTE, D.DTEMISSAO, D.NUMN' +
      'OTA, D.PARCELA, D.ID_CUPOM, ID_PESSOA, ID_CONTA, DTULTPAGAMENTO,' +
      ' VLR_PAGO, VLR_DESCONTO, VLR_JUROSPAGOS, VLR_DESPESAS, P.NOME NO' +
      'ME_CLI, D.TIPO_ES, D.FILIAL, D.DESCRICAO, D.SERIE, D.VLR_PARCELA' +
      ', D.TIPO_LANCAMENTO, D.ID_TERMINAL, D.USUARIO, D.CANCELADA'#13#10'FROM' +
      ' DUPLICATA D'#13#10'INNER JOIN PESSOA P ON (D.ID_PESSOA = P.CODIGO)'#13#10'W' +
      'HERE D.ID = :ID'#13#10'AND COALESCE(D.CANCELADA,'#39'N'#39') <> '#39'S'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
    object sdsDuplicataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsDuplicataDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object sdsDuplicataVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
    end
    object sdsDuplicataDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object sdsDuplicataNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object sdsDuplicataPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object sdsDuplicataID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
    end
    object sdsDuplicataID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsDuplicataID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object sdsDuplicataDTULTPAGAMENTO: TDateField
      FieldName = 'DTULTPAGAMENTO'
    end
    object sdsDuplicataVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
    object sdsDuplicataVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object sdsDuplicataVLR_JUROSPAGOS: TFloatField
      FieldName = 'VLR_JUROSPAGOS'
    end
    object sdsDuplicataVLR_DESPESAS: TFloatField
      FieldName = 'VLR_DESPESAS'
    end
    object sdsDuplicataNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      ProviderFlags = []
      Size = 60
    end
    object sdsDuplicataTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object sdsDuplicataFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsDuplicataDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object sdsDuplicataSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object sdsDuplicataVLR_PARCELA: TFloatField
      FieldName = 'VLR_PARCELA'
    end
    object sdsDuplicataTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Size = 3
    end
    object sdsDuplicataID_TERMINAL: TIntegerField
      FieldName = 'ID_TERMINAL'
    end
    object sdsDuplicataUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object sdsDuplicataCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
  end
  object dspDuplicata: TDataSetProvider
    DataSet = sdsDuplicata
    Left = 80
    Top = 24
  end
  object cdsDuplicata: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDuplicata'
    OnNewRecord = cdsDuplicataNewRecord
    Left = 112
    Top = 24
    object cdsDuplicataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDuplicataDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsDuplicataVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
      DisplayFormat = '0.00'
    end
    object cdsDuplicataDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsDuplicataNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsDuplicataPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object cdsDuplicataID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
    end
    object cdsDuplicataID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsDuplicataID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsDuplicataDTULTPAGAMENTO: TDateField
      FieldName = 'DTULTPAGAMENTO'
    end
    object cdsDuplicataVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
    object cdsDuplicataVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object cdsDuplicataVLR_JUROSPAGOS: TFloatField
      FieldName = 'VLR_JUROSPAGOS'
    end
    object cdsDuplicataVLR_DESPESAS: TFloatField
      FieldName = 'VLR_DESPESAS'
    end
    object cdsDuplicataNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      ProviderFlags = []
      Size = 60
    end
    object cdsDuplicataTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsDuplicataFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsDuplicataDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object cdsDuplicataSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsDuplicataVLR_PARCELA: TFloatField
      FieldName = 'VLR_PARCELA'
    end
    object cdsDuplicataTIPO_LANCAMENTO: TStringField
      FieldName = 'TIPO_LANCAMENTO'
      Size = 3
    end
    object cdsDuplicataID_TERMINAL: TIntegerField
      FieldName = 'ID_TERMINAL'
    end
    object cdsDuplicataUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object cdsDuplicataCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
  end
  object dsDuplicata: TDataSource
    DataSet = cdsDuplicata
    Left = 144
    Top = 24
  end
  object mSelecionadas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NUM_CUPOM'
        DataType = ftInteger
      end
      item
        Name = 'DT_EMISSAO'
        DataType = ftDate
      end
      item
        Name = 'DT_VCTO'
        DataType = ftDate
      end
      item
        Name = 'DIAS_ATRASO'
        DataType = ftSmallint
      end
      item
        Name = 'VLR_VCTO'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_MULTA'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_JUROS'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'CLIENTE_NOME'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CLIENTE_OBS'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PARCELA'
        DataType = ftInteger
      end
      item
        Name = 'VLR_DESC'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_SALDO_PRINC'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_SALDO_JUROS'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_ABATIMENTO'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'VlrTotal'
        Fields = 'VLR_TOTAL'
        Options = [ixDescending]
      end
      item
        Name = 'DtVencimento'
        Fields = 'Dt_VCTO'
      end>
    IndexName = 'DtVencimento'
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 80
    object mSelecionadasID: TIntegerField
      FieldName = 'ID'
    end
    object mSelecionadasNUM_CUPOM: TIntegerField
      FieldName = 'NUM_CUPOM'
    end
    object mSelecionadasDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object mSelecionadasDT_VCTO: TDateField
      FieldName = 'DT_VCTO'
    end
    object mSelecionadasDIAS_ATRASO: TSmallintField
      FieldName = 'DIAS_ATRASO'
    end
    object mSelecionadasVLR_VCTO: TCurrencyField
      FieldName = 'VLR_VCTO'
    end
    object mSelecionadasVLR_MULTA: TCurrencyField
      FieldName = 'VLR_MULTA'
    end
    object mSelecionadasVLR_JUROS: TCurrencyField
      FieldName = 'VLR_JUROS'
    end
    object mSelecionadasVLR_TOTAL: TCurrencyField
      FieldName = 'VLR_TOTAL'
    end
    object mSelecionadasCLIENTE_NOME: TStringField
      FieldName = 'CLIENTE_NOME'
      Size = 40
    end
    object mSelecionadasCLIENTE_OBS: TStringField
      FieldName = 'CLIENTE_OBS'
      Size = 100
    end
    object mSelecionadasPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object mSelecionadasVLR_DESC: TCurrencyField
      FieldName = 'VLR_DESC'
    end
    object mSelecionadasVLR_SALDO_PRINC: TCurrencyField
      FieldName = 'VLR_SALDO_PRINC'
    end
    object mSelecionadasVLR_SALDO_JUROS: TCurrencyField
      FieldName = 'VLR_SALDO_JUROS'
    end
    object mSelecionadasVLR_ABATIMENTO: TCurrencyField
      FieldName = 'VLR_ABATIMENTO'
    end
  end
  object dsmSelecionadas: TDataSource
    DataSet = mSelecionadas
    Left = 82
    Top = 80
  end
  object sdsCupomFiscal: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT C.ID, C.CLIENTE_NOME, C.NUMCUPOM, C.DTEMISSAO, C.CLIENTE_' +
      'OBS, C.FILIAL'#13#10'FROM CUPOMFISCAL C'#13#10'WHERE C.ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 136
  end
  object dspCupomFiscal: TDataSetProvider
    DataSet = sdsCupomFiscal
    Left = 80
    Top = 136
  end
  object cdsCupomFiscal: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CLIENTE_NOME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NUMCUPOM'
        DataType = ftInteger
      end
      item
        Name = 'DTEMISSAO'
        DataType = ftDate
      end
      item
        Name = 'CLIENTE_OBS'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'FILIAL'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspCupomFiscal'
    StoreDefs = True
    Left = 112
    Top = 136
    object cdsCupomFiscalID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCupomFiscalCLIENTE_NOME: TStringField
      FieldName = 'CLIENTE_NOME'
      Size = 30
    end
    object cdsCupomFiscalNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object cdsCupomFiscalDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsCupomFiscalCLIENTE_OBS: TStringField
      FieldName = 'CLIENTE_OBS'
      Size = 120
    end
    object cdsCupomFiscalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dsCupomFiscal: TDataSource
    DataSet = cdsCupomFiscal
    Left = 144
    Top = 136
  end
  object sdsDuplicataCli: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT D.ID, D.DTVENCIMENTO, D.VLR_RESTANTE, D.DTEMISSAO, D.NUMN' +
      'OTA, D.ID_CUPOM, D.PARCELA, CF.NUMCUPOM, P.NOME  CLIENTE_NOME, C' +
      'F.CLIENTE_OBS, D.DESCRICAO'#13#10'FROM DUPLICATA D'#13#10'LEFT JOIN CUPOMFIS' +
      'CAL CF ON (CF.ID = D.ID_CUPOM)'#13#10'INNER JOIN PESSOA P ON (D.ID_PES' +
      'SOA = P.CODIGO)'#13#10'WHERE D.ID_PESSOA = :P1'#13#10' AND VLR_RESTANTE > 0'#13 +
      #10' AND COALESCE(D.CANCELADA,'#39'N'#39') <> '#39'S'#39#13#10'ORDER BY D.DTVENCIMENTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'P1'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 184
  end
  object dspDuplicataCli: TDataSetProvider
    DataSet = sdsDuplicataCli
    Left = 80
    Top = 184
  end
  object cdsDuplicataCli: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDuplicataCli'
    Left = 112
    Top = 184
    object cdsDuplicataCliID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDuplicataCliDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsDuplicataCliVLR_RESTANTE: TFloatField
      FieldName = 'VLR_RESTANTE'
    end
    object cdsDuplicataCliDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsDuplicataCliNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsDuplicataCliID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
    end
    object cdsDuplicataCliPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object cdsDuplicataCliNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object cdsDuplicataCliCLIENTE_NOME: TStringField
      FieldName = 'CLIENTE_NOME'
      Size = 30
    end
    object cdsDuplicataCliCLIENTE_OBS: TStringField
      FieldName = 'CLIENTE_OBS'
      Size = 250
    end
    object cdsDuplicataCliDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
  end
  object dsDuplicataCli: TDataSource
    DataSet = cdsDuplicataCli
    Left = 144
    Top = 184
  end
  object qParametros: TSQLQuery
    NoMetaData = False
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT PERC_JUROS_PADRAO'
      'FROM PARAMETROS')
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 232
    object qParametrosPERC_JUROS_PADRAO: TFloatField
      FieldName = 'PERC_JUROS_PADRAO'
    end
  end
  object sdsTipoCobranca: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT ID, NOME'#13#10'FROM TIPOCOBRANCA'#13#10'WHERE MOSTRARNOCUPOM = '#39'S'#39#13#10 +
      'ORDER BY NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 280
  end
  object dspTipoCobranca: TDataSetProvider
    DataSet = sdsTipoCobranca
    Left = 80
    Top = 280
  end
  object cdsTipoCobranca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoCobranca'
    Left = 112
    Top = 280
  end
  object dsTipoCobranca: TDataSource
    DataSet = cdsTipoCobranca
    Left = 144
    Top = 280
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FILIAL WHERE INATIVO = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 328
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 80
    Top = 328
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial'
    Left = 112
    Top = 328
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
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 144
    Top = 328
  end
  object mPagamentos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_TIPOCOBRANCA'
        DataType = ftInteger
      end
      item
        Name = 'VLR_PAGO'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_TROCO'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_SALDO'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 80
    object mPagamentosID_TIPOCOBRANCA: TIntegerField
      FieldName = 'ID_TIPOCOBRANCA'
    end
    object mPagamentoslkTIPOCOBRANCA: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTIPOCOBRANCA'
      LookupDataSet = cdsTipoCobranca
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'ID_TIPOCOBRANCA'
      Size = 30
      Lookup = True
    end
    object mPagamentosVLR_PAGO: TCurrencyField
      FieldName = 'VLR_PAGO'
    end
    object mPagamentosVLR_TROCO: TCurrencyField
      FieldName = 'VLR_TROCO'
    end
    object mPagamentosVLR_SALDO: TCurrencyField
      FieldName = 'VLR_SALDO'
    end
  end
  object dsmPagamentos: TDataSource
    DataSet = mPagamentos
    Left = 160
    Top = 80
  end
  object mParcelas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Cupom'
        DataType = ftInteger
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'DtVecto'
        DataType = ftDate
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Observacao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 208
    Top = 80
    object mParcelasCupom: TIntegerField
      FieldName = 'Cupom'
    end
    object mParcelasParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mParcelasDtVecto: TDateField
      FieldName = 'DtVecto'
    end
    object mParcelasValor: TCurrencyField
      FieldName = 'Valor'
    end
    object mParcelasCliente: TStringField
      FieldName = 'Cliente'
      Size = 40
    end
    object mParcelasObservacao: TStringField
      FieldName = 'Observacao'
      Size = 120
    end
    object mParcelasId: TIntegerField
      FieldName = 'Id'
    end
  end
  object dsmParcelas: TDataSource
    DataSet = mParcelas
    Left = 240
    Top = 80
  end
  object qCupomParametros: TSQLQuery
    NoMetaData = False
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ALTURA_SALTO_LINHA'
      'FROM CUPOMFISCAL_PARAMETROS')
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 232
    object qCupomParametrosALTURA_SALTO_LINHA: TSmallintField
      FieldName = 'ALTURA_SALTO_LINHA'
    end
  end
  object sdsCarnePagamento: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CP.*, P.NOME'#13#10'FROM CARNE_PAGAMENTO CP'#13#10'INNER JOIN PESSOA ' +
      'P ON (CP.ID_CLIENTE = P.CODIGO)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 24
    object sdsCarnePagamentoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsCarnePagamentoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsCarnePagamentoDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsCarnePagamentoUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object sdsCarnePagamentoTERMINAL_ID: TIntegerField
      FieldName = 'TERMINAL_ID'
    end
    object sdsCarnePagamentoVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object sdsCarnePagamentoVLR_RECEBIDO: TFloatField
      FieldName = 'VLR_RECEBIDO'
    end
    object sdsCarnePagamentoVLR_TROCO: TFloatField
      FieldName = 'VLR_TROCO'
    end
    object sdsCarnePagamentoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 60
    end
  end
  object dspCarnePagamento: TDataSetProvider
    DataSet = sdsCarnePagamento
    Left = 392
    Top = 24
  end
  object cdsCarnePagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCarnePagamento'
    Left = 424
    Top = 24
    object cdsCarnePagamentoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCarnePagamentoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsCarnePagamentoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsCarnePagamentoUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object cdsCarnePagamentoTERMINAL_ID: TIntegerField
      FieldName = 'TERMINAL_ID'
    end
    object cdsCarnePagamentoVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '0.00'
    end
    object cdsCarnePagamentoVLR_RECEBIDO: TFloatField
      FieldName = 'VLR_RECEBIDO'
      DisplayFormat = '0.00'
    end
    object cdsCarnePagamentoVLR_TROCO: TFloatField
      FieldName = 'VLR_TROCO'
      DisplayFormat = '0.00'
    end
    object cdsCarnePagamentosdsCarnePgtoForma: TDataSetField
      FieldName = 'sdsCarnePgtoForma'
    end
    object cdsCarnePagamentosdsCarnePgtoDuplicatas: TDataSetField
      FieldName = 'sdsCarnePgtoDuplicatas'
    end
    object cdsCarnePagamentoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 60
    end
  end
  object dsCarnePagamento: TDataSource
    DataSet = cdsCarnePagamento
    Left = 456
    Top = 24
  end
  object sdsCarnePgtoDuplicatas: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM CARNE_PGTO_DUPLICATAS WHERE ID = :ID'
    DataSource = dsmCarnePagamento
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 72
    object sdsCarnePgtoDuplicatasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsCarnePgtoDuplicatasITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsCarnePgtoDuplicatasCUPOM: TIntegerField
      FieldName = 'CUPOM'
    end
    object sdsCarnePgtoDuplicatasPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object sdsCarnePgtoDuplicatasVLR_JUROS: TFloatField
      FieldName = 'VLR_JUROS'
    end
    object sdsCarnePgtoDuplicatasVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object sdsCarnePgtoDuplicatasDT_VCTO: TDateField
      FieldName = 'DT_VCTO'
    end
  end
  object cdsCarnePgtoDuplicatas: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCarnePagamentosdsCarnePgtoDuplicatas
    Params = <>
    Left = 424
    Top = 72
    object cdsCarnePgtoDuplicatasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCarnePgtoDuplicatasITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsCarnePgtoDuplicatasCUPOM: TIntegerField
      FieldName = 'CUPOM'
    end
    object cdsCarnePgtoDuplicatasPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object cdsCarnePgtoDuplicatasVLR_JUROS: TFloatField
      FieldName = 'VLR_JUROS'
      DisplayFormat = '0.00'
    end
    object cdsCarnePgtoDuplicatasVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '0.00'
    end
    object cdsCarnePgtoDuplicatasDT_VCTO: TDateField
      FieldName = 'DT_VCTO'
    end
  end
  object dsCarnePgtoDuplicatas: TDataSource
    DataSet = cdsCarnePgtoDuplicatas
    Left = 456
    Top = 72
  end
  object sdsCarnePgtoForma: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM CARNE_PGTO_FORMA WHERE ID = :ID'
    DataSource = dsmCarnePagamento
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 120
    object sdsCarnePgtoFormaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsCarnePgtoFormaITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsCarnePgtoFormaID_FORMA: TIntegerField
      FieldName = 'ID_FORMA'
    end
    object sdsCarnePgtoFormaVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
  end
  object cdsCarnePgtoForma: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCarnePagamentosdsCarnePgtoForma
    Params = <>
    Left = 424
    Top = 120
    object cdsCarnePgtoFormaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCarnePgtoFormaITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsCarnePgtoFormaID_FORMA: TIntegerField
      FieldName = 'ID_FORMA'
    end
    object cdsCarnePgtoFormaVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
      DisplayFormat = '0.00'
    end
  end
  object dsCarnePgtoForma: TDataSource
    DataSet = cdsCarnePgtoForma
    Left = 456
    Top = 120
  end
  object dsmCarnePagamento: TDataSource
    DataSet = sdsCarnePagamento
    Left = 488
    Top = 24
  end
  object dsCondPgto: TDataSource
    DataSet = cdsCondPgto
    Left = 456
    Top = 168
  end
  object cdsCondPgto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspCondPgto'
    Left = 424
    Top = 168
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
    object cdsCondPgtoTIPO_CONDICAO: TStringField
      FieldName = 'TIPO_CONDICAO'
      FixedChar = True
      Size = 1
    end
    object cdsCondPgtoQTD_PARCELA: TIntegerField
      FieldName = 'QTD_PARCELA'
    end
    object cdsCondPgtoENTRADA: TStringField
      FieldName = 'ENTRADA'
      FixedChar = True
      Size = 1
    end
    object cdsCondPgtoMOSTRAR_NFCE: TStringField
      FieldName = 'MOSTRAR_NFCE'
      FixedChar = True
      Size = 1
    end
  end
  object dspCondPgto: TDataSetProvider
    DataSet = sdsCondPgto
    Left = 392
    Top = 168
  end
  object sdsCondPgto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM CONDPGTO'#13#10'WHERE ENTRADA = '#39'N'#39#13#10'AND TIPO_CONDICAO ' +
      '= '#39'F'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 168
  end
  object mNegociacao: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'PARCELA'
    Params = <>
    Left = 360
    Top = 328
    Data = {
      590000009619E0BD010000001800000003000000000003000000590007504152
      43454C410400010000000000044441544104000600000000000556414C4F5208
      0004000000010007535542545950450200490006004D6F6E6579000000}
    object mNegociacaoPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object mNegociacaoDATA: TDateField
      FieldName = 'DATA'
    end
    object mNegociacaoVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
  end
  object dsmNegociacao: TDataSource
    DataSet = mNegociacao
    Left = 392
    Top = 328
  end
  object dsRenegociacao: TDataSource
    DataSet = cdsRenegociacao
    Left = 456
    Top = 216
  end
  object cdsRenegociacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRenegociacao'
    AfterScroll = cdsRenegociacaoAfterScroll
    OnNewRecord = cdsRenegociacaoNewRecord
    Left = 424
    Top = 216
    object cdsRenegociacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRenegociacaoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsRenegociacaoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsRenegociacaoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsRenegociacaoID_CONDPGTO: TIntegerField
      FieldName = 'ID_CONDPGTO'
    end
    object cdsRenegociacaoUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object cdsRenegociacaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 60
    end
  end
  object dspRenegociacao: TDataSetProvider
    DataSet = sdsRenegociacao
    UpdateMode = upWhereKeyOnly
    Left = 392
    Top = 216
  end
  object sdsRenegociacao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT R.*, P.NOME'#13#10'FROM RENEGOCIACAO R'#13#10'INNER JOIN PESSOA P ON ' +
      '(R.ID_PESSOA = P.CODIGO)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 216
    object sdsRenegociacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsRenegociacaoDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsRenegociacaoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsRenegociacaoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sdsRenegociacaoID_CONDPGTO: TIntegerField
      FieldName = 'ID_CONDPGTO'
    end
    object sdsRenegociacaoUSUARIO: TStringField
      FieldName = 'USUARIO'
    end
    object sdsRenegociacaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 60
    end
  end
  object dsRenegociacaoParc: TDataSource
    DataSet = cdsRenegociacaoParc
    Left = 456
    Top = 264
  end
  object cdsRenegociacaoParc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRenegociacaoParc'
    Left = 424
    Top = 264
    object cdsRenegociacaoParcID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRenegociacaoParcPARC: TIntegerField
      FieldName = 'PARC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRenegociacaoParcDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsRenegociacaoParcVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsRenegociacaoParcID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
  end
  object dspRenegociacaoParc: TDataSetProvider
    DataSet = sdsRenegociacaoParc
    UpdateMode = upWhereKeyOnly
    Left = 392
    Top = 264
  end
  object sdsRenegociacaoParc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM RENEGOCIACAO_PARC'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 264
    object sdsRenegociacaoParcID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsRenegociacaoParcPARC: TIntegerField
      FieldName = 'PARC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsRenegociacaoParcDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsRenegociacaoParcVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sdsRenegociacaoParcID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
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
    PrintOptions.PrintMode = pmSplit
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42671.419546678200000000
    ReportOptions.LastChange = 43962.749728784720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 448
    Top = 328
    Datasets = <
      item
        DataSet = frxDBDataset3
        DataSetName = 'frxFilial'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxRenegociacaoParc'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxRenegociacao'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 78.000000000000000000
      PaperHeight = 600.000000000000000000
      PaperSize = 256
      LeftMargin = 3.000000000000000000
      RightMargin = 3.000000000000000000
      TopMargin = 3.000000000000000000
      BottomMargin = 5.000000000000000000
      object Header1: TfrxHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Height = 75.590600000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 272.126160000000000000
        object Memo1: TfrxMemoView
          Width = 268.346630000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxFilial."NOME"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 14.118120000000000000
          Width = 268.346630000000000000
          Height = 13.228346460000000000
          Memo.UTF8 = (
            
              '[<frxFilial."ENDERECO">], [<frxFilial."NUM_END">] [<frxFilial."C' +
              'OMPLEMENTO_END">]')
        end
        object Memo26: TfrxMemoView
          Top = 28.236240000000000000
          Width = 268.346630000000000000
          Height = 13.228346460000000000
          Memo.UTF8 = (
            
              '[<frxFilial."CIDADE">] - CEP: [<frxFilial."CEP">] - [<frxFilial.' +
              '"UF">]')
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
        object Memo27: TfrxMemoView
          Top = 42.574830000000000000
          Width = 268.346630000000000000
          Height = 13.228346460000000000
          Memo.UTF8 = (
            'CNPJ: [frxFilial."CNPJ_CPF"]')
        end
        object Memo28: TfrxMemoView
          Top = 55.913420000000000000
          Width = 268.346630000000000000
          Height = 13.228346460000000000
          Memo.UTF8 = (
            'Fone: [<frxFilial."DDD1">] [<frxFilial."FONE">]')
          Formats = <
            item
            end
            item
            end>
        end
        object Line5: TfrxLineView
          Top = 71.811070000000000000
          Width = 268.346630000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 117.165430000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxRenegociacao'
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 83.149660000000000000
          Top = 30.236240000000000000
          Width = 181.417440000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frxRenegociacao."ID"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 83.149660000000000000
          Top = 44.354360000000000000
          Width = 181.417440000000000000
          Height = 13.228346460000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxRenegociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frxRenegociacaoParc."DATA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo22: TfrxMemoView
          Top = 30.236240000000000000
          Width = 83.149660000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'N'#194#186' DA NEG.:')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 44.354360000000000000
          Width = 83.149660000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'DATA/HORA:')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 58.472480000000000000
          Width = 83.149660000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'CLIENTE:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 83.149660000000000000
          Top = 58.472480000000000000
          Width = 181.417440000000000000
          Height = 13.228346460000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxRenegociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frxRenegociacao."NOME"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 66.141775000000000000
          Top = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'NEGOCIA'#195#8225#195#402'O')
          ParentFont = False
        end
      end
      object DetailData2: TfrxDetailData
        FillType = ftBrush
        Height = 143.622140000000000000
        Top = 283.464750000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxRenegociacaoParc'
        RowCount = 0
        object Memo6: TfrxMemoView
          Left = 90.708720000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frxRenegociacaoParc."DATA"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 21.118120000000000000
          Top = 41.574830000000000000
          Width = 68.031540000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Dt.Vcto.:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 36.236240000000000000
          Top = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Parc.:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 90.708720000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 13.228346460000000000
          DataSet = dmCupomFiscal.frxDBDataset3
          DataSetName = 'frxCupomParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frxRenegociacaoParc."PARC"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 90.708720000000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 13.228346460000000000
          DataSet = dmCupomFiscal.frxDBDataset3
          DataSetName = 'frxCupomParcelas'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frxRenegociacaoParc."VALOR"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 32.456710000000000000
          Top = 60.472480000000000000
          Width = 56.692950000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Valor:')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 141.842610000000000000
          Width = 268.346454250000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object BarCode1: TfrxBarCodeView
          Left = 77.004020000000000000
          Top = 83.149660000000000000
          Width = 103.000000000000000000
          Height = 45.354360000000000000
          BarType = bcCodeEAN13
          CalcCheckSum = True
          Expression = '<frxRenegociacaoParc."ID_DUPLICATA">'
          Rotation = 0
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Memo29: TfrxMemoView
          Left = 6.000000000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'N'#194#176' DA NEG.:')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 90.708720000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 13.228346460000000000
          DataSet = dmCupomFiscal.frxDBDataset3
          DataSetName = 'frxCupomParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frxRenegociacaoParc."ID"]')
          ParentFont = False
        end
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 215.433210000000000000
        Width = 272.126160000000000000
        object Memo12: TfrxMemoView
          Left = 45.141775000000000000
          Top = 12.283476770000000000
          Width = 181.842610000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'CARN'#195#352' DE PAGAMENTO')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 41.574830000000000000
          Width = 268.346630000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxRenegociacao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'DATA=DATA'
      'ID_PESSOA=ID_PESSOA'
      'VALOR=VALOR'
      'ID_CONDPGTO=ID_CONDPGTO'
      'USUARIO=USUARIO'
      'NOME=NOME')
    DataSource = dsRenegociacao
    BCDToCurrency = False
    Left = 480
    Top = 328
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxRenegociacaoParc'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'PARC=PARC'
      'DATA=DATA'
      'VALOR=VALOR'
      'ID_DUPLICATA=ID_DUPLICATA')
    DataSource = dsRenegociacaoParc
    BCDToCurrency = False
    Left = 512
    Top = 328
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxFilial'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NOME=NOME'
      'NOME_INTERNO=NOME_INTERNO'
      'ENDERECO=ENDERECO'
      'COMPLEMENTO_END=COMPLEMENTO_END'
      'NUM_END=NUM_END'
      'BAIRRO=BAIRRO'
      'CEP=CEP'
      'ID_CIDADE=ID_CIDADE'
      'CIDADE=CIDADE'
      'UF=UF'
      'DDD1=DDD1'
      'FONE1=FONE1'
      'DDD2=DDD2'
      'FONE=FONE'
      'DDDFAX=DDDFAX'
      'FAX=FAX'
      'PESSOA=PESSOA'
      'CNPJ_CPF=CNPJ_CPF'
      'INSCR_EST=INSCR_EST')
    DataSource = dsFilial
    BCDToCurrency = False
    Left = 544
    Top = 328
  end
end
