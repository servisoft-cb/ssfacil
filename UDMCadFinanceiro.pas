unit UDMCadFinanceiro;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, dbXPress, LogTypes, frxClass, frxExportPDF, frxDBSet, Forms;

type
  TDMCadFinanceiro = class(TDataModule)
    sdsContas: TSQLDataSet;
    dspContas: TDataSetProvider;
    cdsContas: TClientDataSet;
    cdsContasID: TIntegerField;
    cdsContasNOME: TStringField;
    dsContas: TDataSource;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialENDERECO: TStringField;
    cdsFilialCOMPLEMENTO_END: TStringField;
    cdsFilialNUM_END: TStringField;
    cdsFilialBAIRRO: TStringField;
    cdsFilialCEP: TStringField;
    cdsFilialID_CIDADE: TIntegerField;
    cdsFilialCIDADE: TStringField;
    cdsFilialUF: TStringField;
    cdsFilialDDD1: TIntegerField;
    cdsFilialFONE1: TStringField;
    cdsFilialDDD2: TIntegerField;
    cdsFilialFONE: TStringField;
    cdsFilialDDDFAX: TIntegerField;
    cdsFilialFAX: TStringField;
    cdsFilialPESSOA: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
    cdsFilialINSCR_EST: TStringField;
    cdsFilialSIMPLES: TStringField;
    cdsFilialENDLOGO: TStringField;
    cdsFilialCALCULAR_IPI: TStringField;
    cdsFilialINATIVO: TStringField;
    cdsFilialINSCMUNICIPAL: TStringField;
    cdsFilialCNAE: TStringField;
    cdsFilialHOMEPAGE: TStringField;
    cdsFilialUSARICMSSIMPLES: TStringField;
    cdsFilialID_REGIME_TRIB: TIntegerField;
    cdsFilialID_PIS: TIntegerField;
    cdsFilialID_COFINS: TIntegerField;
    cdsFilialTIPO_PIS: TStringField;
    cdsFilialTIPO_COFINS: TStringField;
    cdsFilialPERC_PIS: TFloatField;
    cdsFilialPERC_COFINS: TFloatField;
    cdsFilialID_CSTICMS: TIntegerField;
    cdsFilialID_CSTIPI: TIntegerField;
    cdsFilialEMAIL_NFE: TStringField;
    cdsFilialDTESTOQUE: TDateField;
    dsFilial: TDataSource;
    qParametros: TSQLQuery;
    qParametrosID: TIntegerField;
    qParametrosSOMARNOPROD_FRETE: TStringField;
    qParametrosSOMARNOPROD_OUTRASDESP: TStringField;
    qParametrosSOMARNOPROD_SEGURO: TStringField;
    qParametrosAJUSTELOGONFEAUTOMATICO: TStringField;
    qParametrosINFNUMNOTAMANUAL: TStringField;
    qParametrosOPCAO_DTENTREGAPEDIDO: TStringField;
    qParametrosOBS_SIMPLES: TStringField;
    qParametrosIMP_OBSSIMPLES: TStringField;
    qParametrosIMP_REFERENCIANANOTA: TStringField;
    qParametrosENVIARNOTABENEF_NANFE: TStringField;
    qParametrosESPECIE_NOTA: TStringField;
    qParametrosMARCA_NOTA: TStringField;
    qParametrosVERSAO_BANCO: TIntegerField;
    qParametrosUSA_QTDPACOTE_NTE: TStringField;
    qParametrosATUALIZAR_PRECO: TStringField;
    qParametrosUSA_VENDEDOR: TStringField;
    sdsFinanceiro: TSQLDataSet;
    dspFinanceiro: TDataSetProvider;
    cdsFinanceiro: TClientDataSet;
    dsFinanceiro: TDataSource;
    sdsFinanceiroID: TIntegerField;
    sdsFinanceiroTIPO_ES: TStringField;
    sdsFinanceiroID_CONTA: TIntegerField;
    sdsFinanceiroDTMOVIMENTO: TDateField;
    sdsFinanceiroID_MOVDUPLICATA: TIntegerField;
    sdsFinanceiroITEM_MOVDUPLICATA: TIntegerField;
    sdsFinanceiroVLR_MOVIMENTO: TFloatField;
    sdsFinanceiroID_HISTORICO: TIntegerField;
    sdsFinanceiroHISTORICO_COMPL: TStringField;
    sdsFinanceiroID_PESSOA: TIntegerField;
    sdsFinanceiroFILIAL: TIntegerField;
    sdsFinanceiroUSUARIO: TStringField;
    sdsFinanceiroDTUSUARIO: TDateField;
    sdsFinanceiroHRUSUARIO: TTimeField;
    cdsFinanceiroID: TIntegerField;
    cdsFinanceiroTIPO_ES: TStringField;
    cdsFinanceiroID_CONTA: TIntegerField;
    cdsFinanceiroDTMOVIMENTO: TDateField;
    cdsFinanceiroID_MOVDUPLICATA: TIntegerField;
    cdsFinanceiroITEM_MOVDUPLICATA: TIntegerField;
    cdsFinanceiroVLR_MOVIMENTO: TFloatField;
    cdsFinanceiroID_HISTORICO: TIntegerField;
    cdsFinanceiroHISTORICO_COMPL: TStringField;
    cdsFinanceiroID_PESSOA: TIntegerField;
    cdsFinanceiroFILIAL: TIntegerField;
    cdsFinanceiroUSUARIO: TStringField;
    cdsFinanceiroDTUSUARIO: TDateField;
    cdsFinanceiroHRUSUARIO: TTimeField;
    sdsSaldo: TSQLDataSet;
    dspSaldo: TDataSetProvider;
    cdsSaldo: TClientDataSet;
    dsSaldo: TDataSource;
    cdsSaldoID: TIntegerField;
    cdsSaldoNOME_CONTA: TStringField;
    cdsSaldoVLR_ENTRADA: TFloatField;
    cdsSaldoVLR_SAIDA: TFloatField;
    cdsSaldoVLR_SALDO: TFloatField;
    sdsFinanceiroID_FORMA_PAGAMENTO: TIntegerField;
    cdsFinanceiroID_FORMA_PAGAMENTO: TIntegerField;
    sdsTipoCobranca: TSQLDataSet;
    dspTipoCobranca: TDataSetProvider;
    cdsTipoCobranca: TClientDataSet;
    cdsTipoCobrancaID: TIntegerField;
    cdsTipoCobrancaNOME: TStringField;
    cdsTipoCobrancaDESCONTADO: TStringField;
    cdsTipoCobrancaDEPOSITO: TStringField;
    cdsTipoCobrancaGERARBOLETO: TStringField;
    cdsTipoCobrancaQTDDIAS: TIntegerField;
    cdsTipoCobrancaCARTAOCREDITO: TStringField;
    cdsTipoCobrancaCHEQUE: TStringField;
    cdsTipoCobrancaDINHEIRO: TStringField;
    cdsTipoCobrancaMOSTRARNOCUPOM: TStringField;
    dsTipoCobranca: TDataSource;
    qSaldoMov: TSQLQuery;
    sdsFinanceiro_Consulta: TSQLDataSet;
    dspFinanceiro_Consulta: TDataSetProvider;
    cdsFinanceiro_Consulta: TClientDataSet;
    dsFinanceiro_Consulta: TDataSource;
    cdsFinanceiro_ConsultaID: TIntegerField;
    cdsFinanceiro_ConsultaTIPO_ES: TStringField;
    cdsFinanceiro_ConsultaID_CONTA: TIntegerField;
    cdsFinanceiro_ConsultaDTMOVIMENTO: TDateField;
    cdsFinanceiro_ConsultaID_MOVDUPLICATA: TIntegerField;
    cdsFinanceiro_ConsultaITEM_MOVDUPLICATA: TIntegerField;
    cdsFinanceiro_ConsultaVLR_MOVIMENTO: TFloatField;
    cdsFinanceiro_ConsultaID_HISTORICO: TIntegerField;
    cdsFinanceiro_ConsultaHISTORICO_COMPL: TStringField;
    cdsFinanceiro_ConsultaID_PESSOA: TIntegerField;
    cdsFinanceiro_ConsultaFILIAL: TIntegerField;
    cdsFinanceiro_ConsultaUSUARIO: TStringField;
    cdsFinanceiro_ConsultaDTUSUARIO: TDateField;
    cdsFinanceiro_ConsultaHRUSUARIO: TTimeField;
    cdsFinanceiro_ConsultaID_FORMA_PAGAMENTO: TIntegerField;
    cdsFinanceiro_ConsultaNOME_CONTA: TStringField;
    cdsFinanceiro_ConsultaNOME_FORMAPGTO: TStringField;
    sdsFinanceiroVLR_SAIDA: TFloatField;
    sdsFinanceiroVLR_ENTRADA: TFloatField;
    cdsFinanceiroVLR_SAIDA: TFloatField;
    cdsFinanceiroVLR_ENTRADA: TFloatField;
    cdsFinanceiro_ConsultaVLR_SAIDA: TFloatField;
    cdsFinanceiro_ConsultaVLR_ENTRADA: TFloatField;
    qSaldoMovID_CONTA: TIntegerField;
    qSaldoMovVLR_SALDO: TFloatField;
    qSaldoMovVLR_ENTRADA: TFloatField;
    qSaldoMovVLR_SAIDA: TFloatField;
    sdsSaldo_FPgto: TSQLDataSet;
    dspSaldo_FPgto: TDataSetProvider;
    cdsSaldo_FPgto: TClientDataSet;
    dsSaldo_FPgto: TDataSource;
    cdsSaldo_FPgtoVLR_ENTRADA: TFloatField;
    cdsSaldo_FPgtoVLR_SAIDA: TFloatField;
    cdsSaldo_FPgtoNOME_FORMAPGTO: TStringField;
    cdsSaldo_FPgtoID_FORMA_PAGAMENTO: TIntegerField;
    cdsSaldo_FPgtoVLR_SALDO: TFloatField;
    sdsFinanceiroID_EXTCOMISSAO: TIntegerField;
    cdsFinanceiroID_EXTCOMISSAO: TIntegerField;
    mSaldo_Conta: TClientDataSet;
    dsmSaldo_Conta: TDataSource;
    mSaldo_ContaID_Conta: TIntegerField;
    mSaldo_ContaNome_Conta: TStringField;
    mSaldo_ContaVlr_Entrada: TFloatField;
    mSaldo_ContaVlr_Saida: TFloatField;
    mSaldo_ContaVlr_Saldo: TFloatField;
    mSaldo_FPgto: TClientDataSet;
    dsmSaldo_FPagto: TDataSource;
    mSaldo_FPgtoID_FormaPagamento: TIntegerField;
    mSaldo_FPgtoNome_FormaPagamento: TStringField;
    mSaldo_FPgtoVlr_Entrada: TFloatField;
    mSaldo_FPgtoVlr_Saida: TFloatField;
    mSaldo_FPgtoVlr_Saldo: TFloatField;
    sdsFechamento: TSQLDataSet;
    dspFechamento: TDataSetProvider;
    cdsFechamento: TClientDataSet;
    cdsFechamentoID_CONTA: TIntegerField;
    cdsFechamentoID_FORMA_PAGAMENTO: TIntegerField;
    cdsFechamentoVLR_SAIDA: TFloatField;
    cdsFechamentoVLR_ENTRADA: TFloatField;
    cdsFechamentoNOME_CONTA: TStringField;
    cdsFechamentoNOME_FORMAPAGAMENTO: TStringField;
    dsFechamento: TDataSource;
    mFaturamento: TClientDataSet;
    dsmFaturamento: TDataSource;
    mFaturamentoNome: TStringField;
    sdsMovimento: TSQLDataSet;
    dspMovimento: TDataSetProvider;
    cdsMovimento: TClientDataSet;
    dsMovimento: TDataSource;
    cdsMovimentoTIPO_ES: TStringField;
    cdsMovimentoTIPO_CONDICAO: TStringField;
    cdsMovimentoVLR_DUPLICATA: TFloatField;
    qUltFechamento: TSQLQuery;
    qUltFechamentoDATA: TDateField;
    qParametrosID_CONTA_FECHAMENTO: TIntegerField;
    cdsFinanceiro_ConsultaID_CHEQUE: TIntegerField;
    qCheques: TSQLQuery;
    qChequesVLR_VENCIDO: TFloatField;
    qChequesVLR_AVENCER: TFloatField;
    sdsFinanceiroID_CONTA_ORCAMENTO: TIntegerField;
    cdsFinanceiroID_CONTA_ORCAMENTO: TIntegerField;
    qParametrosUSA_CONTA_ORCAMENTO: TStringField;
    sdsContaOrcamento: TSQLDataSet;
    dspContaOrcamento: TDataSetProvider;
    cdsContaOrcamento: TClientDataSet;
    cdsContaOrcamentoID: TIntegerField;
    cdsContaOrcamentoTIPO: TStringField;
    cdsContaOrcamentoCODIGO: TStringField;
    cdsContaOrcamentoDESCRICAO: TStringField;
    dsContaOrcamento: TDataSource;
    cdsContaOrcamentoNOME_AUX: TStringField;
    mFaturamentoCodigo: TStringField;
    mFaturamentoVlrMovimento: TFloatField;
    sdsPedido_Emi: TSQLDataSet;
    dspPedido_Emi: TDataSetProvider;
    cdsPedido_Emi: TClientDataSet;
    dsPedido_Emi: TDataSource;
    cdsPedido_EmiVLR_TOTAL: TFloatField;
    sdsPedido_Pend: TSQLDataSet;
    dspPedido_Pend: TDataSetProvider;
    cdsPedido_Pend: TClientDataSet;
    dsPedido_Pend: TDataSource;
    cdsPedido_PendVLR_RESTANTE: TFloatField;
    cdsPedido_PendVLR_RESTANTE_ATRAZADO: TFloatField;
    sdsOrcamento: TSQLDataSet;
    dspOrcamento: TDataSetProvider;
    cdsOrcamento: TClientDataSet;
    dsOrcamento: TDataSource;
    sdsVale: TSQLDataSet;
    dspVale: TDataSetProvider;
    cdsVale: TClientDataSet;
    dsVale: TDataSource;
    cdsValeVLR_TOTAL: TFloatField;
    cdsValeVLR_PENDENTE: TFloatField;
    qParametrosUSA_VALE: TStringField;
    cdsMovimentoTIPO_REG: TStringField;
    sdsDuplicata: TSQLDataSet;
    dspDuplicata: TDataSetProvider;
    cdsDuplicata: TClientDataSet;
    dsDuplicata: TDataSource;
    cdsDuplicataVLR_RESTANTE: TFloatField;
    cdsDuplicataTIPO_ES: TStringField;
    cdsDuplicataTIPO_MOV: TStringField;
    cdsDuplicataNome: TStringField;
    qNotaFiscal_Canc: TSQLQuery;
    qNotaFiscal_CancCONTADOR: TIntegerField;
    qNotaFiscal_CCE: TSQLQuery;
    qNotaFiscal_CCECONTADOR: TIntegerField;
    sdsFinanceiroID_TRANSFERENCIA: TIntegerField;
    cdsFinanceiroID_TRANSFERENCIA: TIntegerField;
    cdsFinanceiro_ConsultaID_TRANSFERENCIA: TIntegerField;
    mImp: TClientDataSet;
    mImpID: TIntegerField;
    dsmImp: TDataSource;
    qParametrosCONTROLAR_FAT_SEPARADO: TStringField;
    qNotaFiscal_Ped: TSQLQuery;
    qNotaFiscal_PedDTEMISSAO: TDateField;
    cdsMovimentoID_NOTAFISCAL: TIntegerField;
    qNotaFiscal_PedVLR_TOTAL: TFloatField;
    qNotaFiscal_Vale: TSQLQuery;
    qNotaFiscal_ValeVLR_TOTAL: TFloatField;
    sdsPessoa: TSQLDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    dsPessoa: TDataSource;
    cdsPessoaCODIGO: TIntegerField;
    cdsPessoaNOME: TStringField;
    sdsFinAgrupado: TSQLDataSet;
    dspFinAgrupado: TDataSetProvider;
    cdsFinAgrupado: TClientDataSet;
    dsFinAgrupado: TDataSource;
    cdsFinAgrupadoDTMOVIMENTO: TDateField;
    cdsFinAgrupadoSAIDA: TFloatField;
    cdsFinAgrupadoENTRADA: TFloatField;
    cdsFinAgrupadoNOME: TStringField;
    cdsFinAgrupadoFLAG: TIntegerField;
    cdsFinAgrupadoclSALDO: TCurrencyField;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBDataset1: TfrxDBDataset;
    mDupAuxiliar: TClientDataSet;
    dsmDupAuxiliar: TDataSource;
    mDupAuxiliarTipo_ES: TStringField;
    mDupAuxiliarNome: TStringField;
    mDupAuxiliarValor: TFloatField;
    mDupAuxiliarTipo_Mov: TStringField;
    sdsOC_Emi: TSQLDataSet;
    dspOC_Emi: TDataSetProvider;
    cdsOC_Emi: TClientDataSet;
    dsOC_Emi: TDataSource;
    cdsOC_EmiVLR_TOTAL: TFloatField;
    sdsFinanceiroID_TERMINAL: TIntegerField;
    cdsFinanceiroID_TERMINAL: TIntegerField;
    cdsFinanceiro_ConsultaID_TERMINAL: TIntegerField;
    qParametros_Geral: TSQLQuery;
    qParametros_GeralEMPRESA_VAREJO: TStringField;
    qConsulta_Data: TSQLQuery;
    qConsulta_DataDTMOVIMENTO: TDateField;
    qConsulta_DataID: TIntegerField;
    qConsulta_DataSAIDA: TFloatField;
    qConsulta_DataENTRADA: TFloatField;
    qConsulta_DataNOME: TStringField;
    frxMovimentoData: TfrxDBDataset;
    sdsMovimentoData: TSQLDataSet;
    dspMovimentoData: TDataSetProvider;
    cdsMovimentoData: TClientDataSet;
    dsMovimentoData: TDataSource;
    sdsMovimentoDataDTMOVIMENTO: TDateField;
    sdsMovimentoDataID: TIntegerField;
    sdsMovimentoDataSAIDA: TFloatField;
    sdsMovimentoDataENTRADA: TFloatField;
    sdsMovimentoDataNOME: TStringField;
    cdsMovimentoDataDTMOVIMENTO: TDateField;
    cdsMovimentoDataID: TIntegerField;
    cdsMovimentoDataSAIDA: TFloatField;
    cdsMovimentoDataENTRADA: TFloatField;
    cdsMovimentoDataNOME: TStringField;
    sdsMovimentoDataHISTORICO_COMPL: TStringField;
    sdsMovimentoDataNOME_CONTA: TStringField;
    cdsMovimentoDataHISTORICO_COMPL: TStringField;
    cdsMovimentoDataNOME_CONTA: TStringField;
    sdsMovimentoDataSALDO: TFloatField;
    cdsMovimentoDataSALDO: TFloatField;
    frxSaldoMov: TfrxDBDataset;
    qSaldoMovData: TSQLQuery;
    qSaldoMovDataVLR_ENTRADA: TFloatField;
    qSaldoMovDataVLR_SAIDA: TFloatField;
    qSaldoMovDataSALDO_INICIAL: TFloatField;
    qParametros_Fin: TSQLQuery;
    qParametros_FinEXIGIR_CONTA_ORC_DUP: TStringField;
    mRecibo: TClientDataSet;
    mReciboFilial: TStringField;
    mReciboFilial_End: TStringField;
    mReciboFilial_Cidade: TStringField;
    mReciboFilial_UF: TStringField;
    mReciboFilial_CEP: TStringField;
    mReciboPessoa_Nome: TStringField;
    mReciboPessoa_Doc: TStringField;
    mReciboFinanceiro_Valor: TCurrencyField;
    mReciboFinanceiro_Forma: TStringField;
    mReciboFinanceiro_Data: TDateField;
    mReciboFinanceiro_Descr: TStringField;
    dsmRecibo: TDataSource;
    cdsPessoaCNPJ_CPF: TStringField;
    frxRecibo: TfrxDBDataset;
    mReciboFilial_Fone: TStringField;
    mReciboFilial_Email: TStringField;
    mReciboFinanceiro_VlrExtenso: TStringField;
    mReciboFilial_CNPJ: TStringField;
    qParametros_FinCONTROLA_CONTRATO_CCUSTO: TStringField;
    qParametros_FinCAIXA_VIRA_NOITE: TStringField;
    qCaixaAberto: TSQLQuery;
    qCaixaAbertoTIPO_FECHAMENTO: TStringField;
    sdsFinanceiroID_FECHAMENTO: TIntegerField;
    cdsFinanceiroID_FECHAMENTO: TIntegerField;
    cdsFinanceiro_ConsultaID_FECHAMENTO: TIntegerField;
    sdsOrc_Emi: TSQLDataSet;
    dspOrc_Emi: TDataSetProvider;
    cdsOrc_Emi: TClientDataSet;
    dsOrc_Emi: TDataSource;
    cdsOrc_EmiVLR_TOTAL: TFloatField;
    cdsOrc_EmiVLR_APROVADO: TFloatField;
    cdsOrc_EmiVLR_NAO_APROVADO: TFloatField;
    cdsOrc_EmiVLR_PENDENTE: TFloatField;
    mPedOrc: TClientDataSet;
    mPedOrcCodigo: TStringField;
    mPedOrcNome: TStringField;
    mPedOrcVlrMovimento: TFloatField;
    dsmPedOrc: TDataSource;
    mPedOrcQtd: TIntegerField;
    mFaturamentoQtd: TIntegerField;
    cdsPedido_EmiQTD: TIntegerField;
    cdsPedido_EmiID_VENDEDOR: TIntegerField;
    cdsPedido_EmiNOME_VENDEDOR: TStringField;
    cdsOrcamentoQTD_ORCAMENTO: TIntegerField;
    cdsOrcamentoVLR_TOTAL: TFloatField;
    cdsOrcamentoAPROVADO_ORC: TStringField;
    cdsOrcamentoID_VENDEDOR: TIntegerField;
    cdsOrcamentoNOME_VENDEDOR: TStringField;
    sdsFinanceiroID_CONTA_VINCULADA: TIntegerField;
    cdsFinanceiroID_CONTA_VINCULADA: TIntegerField;
    sdsFinanceiroID_FINANCEIRO_VINC: TIntegerField;
    cdsFinanceiroID_FINANCEIRO_VINC: TIntegerField;
    cdsContasTIPO_CONTA: TStringField;
    cdsFinanceiro_ConsultaNOME_PESSOA: TStringField;
    cdsFinanceiro_ConsultaCONTA_ORCAMENTO: TStringField;
    cdsFinanceiro_ConsultaNOME_ORCAMENTO: TStringField;
    frxFinanceiro_Consulta: TfrxDBDataset;
    sdsSaldo_Data: TSQLDataSet;
    dspSaldo_Data: TDataSetProvider;
    cdsSaldo_Data: TClientDataSet;
    dsSaldo_Data: TDataSource;
    cdsSaldo_DataID: TIntegerField;
    cdsSaldo_DataNOME_CONTA: TStringField;
    cdsSaldo_DataVLR_ENTRADA: TFloatField;
    cdsSaldo_DataVLR_SAIDA: TFloatField;
    cdsSaldo_DataclSaldo: TFloatField;
    cdsSaldo_DataagTotal_Entrada: TAggregateField;
    cdsSaldo_DataagTotal_Saida: TAggregateField;
    cdsSaldo_DataagSaldo: TAggregateField;
    mSaldo_ContaVlr_Cheque_Aberto: TFloatField;
    mSaldo_ContaagTotal_Entrada: TAggregateField;
    mSaldo_ContaagTotal_Saida: TAggregateField;
    mSaldo_ContaagSaldo: TAggregateField;
    mSaldo_ContaagTotal_Cheque: TAggregateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspFinanceiroUpdateError(Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsFinanceiroBeforePost(DataSet: TDataSet);
    procedure cdsDuplicataCalcFields(DataSet: TDataSet);
    procedure cdsFinAgrupadoCalcFields(DataSet: TDataSet);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure frxMovimentoDataFirst(Sender: TObject);
    procedure frxMovimentoDataNext(Sender: TObject);
    procedure mFaturamentoNewRecord(DataSet: TDataSet);
    procedure cdsSaldo_DataCalcFields(DataSet: TDataSet);
  private
    vSaldo: Real;
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

    procedure prc_Gravar_Financeiro_Vinculado(ID, ID_Conta : Integer);

  public
    { Public declarations }
    vMsgErro: string;
    ctCommand: string;
    ctFinanceiro_Consulta: string;
    ctSaldo_Data: String;
    vDataIni, vDataFim: string;
    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
  end;

var
  DMCadFinanceiro: TDMCadFinanceiro;

implementation

uses
  DmdDatabase, StdConvs, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMCadFinanceiro}

procedure TDMCadFinanceiro.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsFinanceiro.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('FINANCEIRO', 0);

  cdsFinanceiro.Insert;
  cdsFinanceiroID.AsInteger := vAux;
  cdsFinanceiroDTUSUARIO.AsDateTime := Date;
  cdsFinanceiroHRUSUARIO.AsDateTime := Now;
  cdsFinanceiroID_MOVDUPLICATA.AsInteger := 0;
  cdsFinanceiroITEM_MOVDUPLICATA.AsInteger := 0;
  cdsFinanceiroVLR_MOVIMENTO.AsFloat := 0;
  if vTerminal <= 0 then
    cdsFinanceiroID_TERMINAL.Clear
  else
    cdsFinanceiroID_TERMINAL.AsInteger := vTerminal;
  cdsFinanceiroUSUARIO.AsString := vUsuario;
end;

procedure TDMCadFinanceiro.prc_Excluir;
var
  sds: TSQLDataSet;
  vIDAux, vIDVinc : Integer;
  ID: TTransactionDesc;
begin
  if not (cdsFinanceiro.Active) or (cdsFinanceiro.IsEmpty) then
    exit;

  cdsContas.Locate('ID',cdsFinanceiroID_CONTA.AsInteger,[loCaseInsensitive]);

  sds  := TSQLDataSet.Create(nil);
  ID.TransactionID  := 3;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vIDAux  := cdsFinanceiroID.AsInteger;
    vIDVinc := cdsFinanceiroID_FINANCEIRO_VINC.AsInteger;
    cdsFinanceiro.Delete;
    cdsFinanceiro.ApplyUpdates(0);

    if (cdsContasTIPO_CONTA.AsString = 'A') or (vIDVinc > 0) then
    begin
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata  := True;
      sds.GetMetadata := False;
      if vIDVinc > 0 then
        sds.CommandText := 'SELECT COUNT(1) CONTADOR FROM FINANCEIRO WHERE ID = ' + IntToStr(vIDVinc)
      else
        sds.CommandText := 'SELECT COUNT(1) CONTADOR FROM FINANCEIRO WHERE ID_FINANCEIRO_VINC = ' + IntToStr(vIDAux);
      sds.Open;
      if sds.FieldByName('CONTADOR').AsInteger > 0 then
      begin
        sds.Close;
        if vIDVinc > 0 then
          sds.CommandText := 'DELETE FROM FINANCEIRO WHERE ID = ' + IntToStr(vIDVinc)
        else
          sds.CommandText := 'DELETE FROM FINANCEIRO WHERE ID_FINANCEIRO_VINC = ' + IntToStr(vIDAux);
        SDS.ExecSQL;
      end;
    end;

    dmDatabase.scoDados.Commit(ID);
  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao excluir o Financeiro (conta vinculada): ' + #13 + e.Message);
      end;
  end;
  FreeAndNil(sds);
end;

procedure TDMCadFinanceiro.prc_Gravar;
var
  vIDAux : Integer;
  vIDConta : Integer;
begin
  vMsgErro := '';
  if cdsFinanceiroID_CONTA.AsInteger > 0 then
    cdsContas.Locate('ID',cdsFinanceiroID_CONTA.AsInteger,[loCaseInsensitive]);
  if cdsFinanceiroID_CONTA.AsInteger < 1 then
    vMsgErro := vMsgErro + #13 + '*** Conta n�o informada!';
  if cdsFinanceiroFILIAL.AsInteger < 1 then
    vMsgErro := vMsgErro + #13 + '*** Filial n�o informada!';
  if cdsFinanceiroDTMOVIMENTO.AsDateTime < 10 then
    vMsgErro := vMsgErro + #13 + '*** Data n�o informada!';
  if trim(cdsFinanceiroHISTORICO_COMPL.AsString) = '' then
    vMsgErro := vMsgErro + #13 + '*** Hist�rico n�o informado!';
  if (qParametros_FinEXIGIR_CONTA_ORC_DUP.AsString = 'S') and (cdsFinanceiroID_CONTA_ORCAMENTO.AsInteger <= 0) then
    vMsgErro := vMsgErro + #13 + '*** Conta de Or�amento n�o informada!';
  if (cdsContasTIPO_CONTA.AsString = 'A') and (cdsFinanceiroID_CONTA_VINCULADA.AsInteger <= 0) then
    vMsgErro := vMsgErro + #13 + '*** Conta Banco/Caixa n�o foi informada!';
  if (cdsContasTIPO_CONTA.AsString = 'A') and (cdsFinanceiroID_PESSOA.AsInteger <= 0) then
    vMsgErro := vMsgErro + #13 + '*** Pessoa n�o foi informada!';
  if trim(vMsgErro) <> '' then
    exit;
  vIDAux   := cdsFinanceiroID.AsInteger;
  vIDConta := cdsFinanceiroID_CONTA_VINCULADA.AsInteger; 
  cdsFinanceiro.Post;
  cdsFinanceiro.ApplyUpdates(0);

  if cdsContasTIPO_CONTA.AsString = 'A' then
    prc_Gravar_Financeiro_Vinculado(vIDAux,vIDConta);
end;

procedure TDMCadFinanceiro.prc_Localizar(ID: Integer); //-1 � para inclus�o
begin
  cdsFinanceiro.Close;
  sdsFinanceiro.CommandText := ctCommand;
  if ID <> 0 then
    sdsFinanceiro.CommandText := sdsFinanceiro.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsFinanceiro.Open;
end;

procedure TDMCadFinanceiro.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand := sdsFinanceiro.CommandText;
  ctFinanceiro_Consulta := sdsFinanceiro_Consulta.CommandText;
  ctSaldo_Data          := sdsSaldo_Data.CommandText;

  cdsContas.Open;
  cdsFilial.Close;
  cdsFilial.Open;
  cdsTipoCobranca.Open;
  cdsContaOrcamento.Open;
  qParametros.Close;
  qParametros.Open;
  qParametros_Geral.Open;
  qParametros_Fin.Open;
  //*** Logs Implantado na vers�o .353
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
  //***********************
end;

procedure TDMCadFinanceiro.dspFinanceiroUpdateError(Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind; var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name, UpdateKind, E);
end;

procedure TDMCadFinanceiro.DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadFinanceiro.cdsFinanceiroBeforePost(DataSet: TDataSet);
begin
  if cdsFinanceiroID_CONTA_ORCAMENTO.AsInteger <= 0 then
    cdsFinanceiroID_CONTA_ORCAMENTO.Clear;
end;

procedure TDMCadFinanceiro.cdsDuplicataCalcFields(DataSet: TDataSet);
begin
  if (cdsDuplicataTIPO_MOV.AsString = 'H') then
    cdsDuplicataNome.AsString := 'Cheques a Pagar Em Aberto'
  else if (cdsDuplicataTIPO_ES.AsString = 'E') then
    cdsDuplicataNome.AsString := 'Contas a Receber Em Aberto'
  else if (cdsDuplicataTIPO_ES.AsString = 'S') then
    cdsDuplicataNome.AsString := 'Contas a Pagar Em Aberto';
end;

procedure TDMCadFinanceiro.cdsFinAgrupadoCalcFields(DataSet: TDataSet);
begin
  cdsFinAgrupadoclSALDO.AsCurrency := cdsFinAgrupadoENTRADA.AsCurrency - cdsFinAgrupadoSAIDA.AsCurrency;
end;

procedure TDMCadFinanceiro.frxReport1BeforePrint(Sender: TfrxReportComponent);
var
  vArq: string;
begin
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Recibo_Financeiro.fr3';
  if frxReport1.Report.FileName <> vArq then
  begin
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Recibo_Financeiro_Pag.fr3';
    if frxReport1.Report.FileName <> vArq then
      TfrxMemoView(frxReport1.FindComponent('Memo2')).Text := 'Relat�rio Financeiro de Caixa' + #13 + 'Per�odo de: ' + vDataIni + ' at�: ' + vDataFim;
  end;
end;

procedure TDMCadFinanceiro.frxMovimentoDataFirst(Sender: TObject);
begin
  vSaldo := 0;
  vSaldo := qSaldoMovDataSALDO_INICIAL.AsFloat + cdsMovimentoDataENTRADA.AsFloat - cdsMovimentoDataSAIDA.AsFloat;
  frxReport1.Variables['SaldoFin'] := vSaldo;
end;

procedure TDMCadFinanceiro.frxMovimentoDataNext(Sender: TObject);
begin
  vSaldo := vSaldo + cdsMovimentoDataENTRADA.AsFloat - cdsMovimentoDataSAIDA.AsFloat;
  frxReport1.Variables['SaldoFin'] := vSaldo;
end;

procedure TDMCadFinanceiro.mFaturamentoNewRecord(DataSet: TDataSet);
begin
  mFaturamentoVlrMovimento.AsFloat := 0;
  mFaturamentoQtd.AsInteger        := 0;
end;

procedure TDMCadFinanceiro.prc_Gravar_Financeiro_Vinculado(ID, ID_Conta: Integer);
var
  sds: TSQLDataSet;
  x: Integer;
  vIDAux : Integer;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata  := True;
    sds.GetMetadata := False;

    sds.CommandText := 'SELECT ID FROM FINANCEIRO '
                     + 'WHERE ID_FINANCEIRO_VINC = ' + IntToStr(ID);
    sds.Open;

    vIDAux := sds.FieldByName('ID').AsInteger;

    sds.Close;
    sds.CommandText := 'SELECT TIPO_ES, DTMOVIMENTO, VLR_MOVIMENTO, ID_HISTORICO, HISTORICO_COMPL, ID_PESSOA, FILIAL, '
                     + 'USUARIO, DTUSUARIO, HRUSUARIO, ID_FORMA_PAGAMENTO, VLR_SAIDA, VLR_ENTRADA, ID_CONTA_ORCAMENTO '
                     + 'FROM FINANCEIRO '
                     + 'WHERE ID = ' + IntToStr(ID);
    sds.Open;


    if vIDAux > 0 then
    begin
      prc_Localizar(vIDAux);
      if cdsFinanceiroID.AsInteger > 0 then
        cdsFinanceiro.Edit;
    end;
    if not (cdsFinanceiro.State in [dsEdit]) then
      prc_Inserir;
    for x := 0 to (sds.FieldCount - 1) do
      cdsFinanceiro.FieldByName(sds.Fields[x].FieldName).AsVariant := sds.Fields[x].Value;
    cdsFinanceiroID_CONTA.AsInteger := ID_Conta;
    cdsFinanceiroID_FINANCEIRO_VINC.AsInteger := ID;

    cdsFinanceiro.Post;
    cdsFinanceiro.ApplyUpdates(0);

  finally
    FreeAndNil(sds);
  end;

end;

procedure TDMCadFinanceiro.cdsSaldo_DataCalcFields(DataSet: TDataSet);
begin
  cdsSaldo_DataclSaldo.AsFloat := StrToFloat(FormatFloat('0.00',cdsSaldo_DataVLR_ENTRADA.AsFloat - cdsSaldo_DataVLR_SAIDA.AsFloat));
end;

end.

