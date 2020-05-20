unit uDmPagamento;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Graphics, Printers, Dialogs, frxClass, frxDBSet, Forms;

type
  TdmPagamento = class(TDataModule)
    sdsDuplicata: TSQLDataSet;
    dspDuplicata: TDataSetProvider;
    cdsDuplicata: TClientDataSet;
    dsDuplicata: TDataSource;
    cdsDuplicataID: TIntegerField;
    cdsDuplicataDTVENCIMENTO: TDateField;
    cdsDuplicataVLR_RESTANTE: TFloatField;
    mSelecionadas: TClientDataSet;
    dsmSelecionadas: TDataSource;
    mSelecionadasNUM_CUPOM: TIntegerField;
    mSelecionadasDT_VCTO: TDateField;
    mSelecionadasDIAS_ATRASO: TSmallintField;
    mSelecionadasVLR_VCTO: TCurrencyField;
    mSelecionadasVLR_MULTA: TCurrencyField;
    mSelecionadasVLR_JUROS: TCurrencyField;
    mSelecionadasVLR_TOTAL: TCurrencyField;
    mSelecionadasID: TIntegerField;
    mSelecionadasDT_EMISSAO: TDateField;
    cdsDuplicataDTEMISSAO: TDateField;
    cdsDuplicataNUMNOTA: TIntegerField;
    cdsDuplicataID_CUPOM: TIntegerField;
    sdsCupomFiscal: TSQLDataSet;
    dspCupomFiscal: TDataSetProvider;
    cdsCupomFiscal: TClientDataSet;
    dsCupomFiscal: TDataSource;
    cdsCupomFiscalID: TIntegerField;
    cdsCupomFiscalCLIENTE_NOME: TStringField;
    cdsCupomFiscalNUMCUPOM: TIntegerField;
    cdsCupomFiscalDTEMISSAO: TDateField;
    cdsCupomFiscalCLIENTE_OBS: TStringField;
    mSelecionadasCLIENTE_NOME: TStringField;
    mSelecionadasCLIENTE_OBS: TStringField;
    sdsDuplicataCli: TSQLDataSet;
    dspDuplicataCli: TDataSetProvider;
    cdsDuplicataCli: TClientDataSet;
    dsDuplicataCli: TDataSource;
    cdsDuplicataID_PESSOA: TIntegerField;
    cdsDuplicataPARCELA: TIntegerField;
    mSelecionadasPARCELA: TIntegerField;
    qParametros: TSQLQuery;
    qParametrosPERC_JUROS_PADRAO: TFloatField;
    sdsDuplicataID: TIntegerField;
    sdsDuplicataDTVENCIMENTO: TDateField;
    sdsDuplicataVLR_RESTANTE: TFloatField;
    sdsDuplicataDTEMISSAO: TDateField;
    sdsDuplicataNUMNOTA: TIntegerField;
    sdsDuplicataPARCELA: TIntegerField;
    sdsDuplicataID_CUPOM: TIntegerField;
    sdsDuplicataID_PESSOA: TIntegerField;
    sdsDuplicataID_CONTA: TIntegerField;
    cdsDuplicataID_CONTA: TIntegerField;
    sdsDuplicataDTULTPAGAMENTO: TDateField;
    sdsDuplicataVLR_PAGO: TFloatField;
    sdsDuplicataVLR_DESCONTO: TFloatField;
    sdsDuplicataVLR_JUROSPAGOS: TFloatField;
    cdsDuplicataDTULTPAGAMENTO: TDateField;
    cdsDuplicataVLR_PAGO: TFloatField;
    cdsDuplicataVLR_DESCONTO: TFloatField;
    cdsDuplicataVLR_JUROSPAGOS: TFloatField;
    sdsDuplicataVLR_DESPESAS: TFloatField;
    cdsDuplicataVLR_DESPESAS: TFloatField;
    sdsTipoCobranca: TSQLDataSet;
    dspTipoCobranca: TDataSetProvider;
    cdsTipoCobranca: TClientDataSet;
    dsTipoCobranca: TDataSource;
    mSelecionadasVLR_DESC: TCurrencyField;
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
    dsFilial: TDataSource;
    mPagamentos: TClientDataSet;
    dsmPagamentos: TDataSource;
    mPagamentosID_TIPOCOBRANCA: TIntegerField;
    mPagamentoslkTIPOCOBRANCA: TStringField;
    mPagamentosVLR_PAGO: TCurrencyField;
    mPagamentosVLR_TROCO: TCurrencyField;
    mParcelas: TClientDataSet;
    dsmParcelas: TDataSource;
    mParcelasCupom: TIntegerField;
    mParcelasParcela: TIntegerField;
    mParcelasDtVecto: TDateField;
    mParcelasValor: TCurrencyField;
    mParcelasCliente: TStringField;
    mParcelasObservacao: TStringField;
    mParcelasId: TIntegerField;
    cdsDuplicataCliID: TIntegerField;
    cdsDuplicataCliDTVENCIMENTO: TDateField;
    cdsDuplicataCliVLR_RESTANTE: TFloatField;
    cdsDuplicataCliDTEMISSAO: TDateField;
    cdsDuplicataCliNUMNOTA: TIntegerField;
    cdsDuplicataCliID_CUPOM: TIntegerField;
    cdsDuplicataCliPARCELA: TIntegerField;
    cdsDuplicataCliNUMCUPOM: TIntegerField;
    cdsDuplicataCliCLIENTE_NOME: TStringField;
    cdsDuplicataCliCLIENTE_OBS: TStringField;
    mPagamentosVLR_SALDO: TCurrencyField;
    mSelecionadasVLR_SALDO_PRINC: TCurrencyField;
    mSelecionadasVLR_SALDO_JUROS: TCurrencyField;
    qCupomParametros: TSQLQuery;
    qCupomParametrosALTURA_SALTO_LINHA: TSmallintField;
    sdsDuplicataNOME_CLI: TStringField;
    cdsDuplicataNOME_CLI: TStringField;
    sdsCarnePagamento: TSQLDataSet;
    dspCarnePagamento: TDataSetProvider;
    cdsCarnePagamento: TClientDataSet;
    dsCarnePagamento: TDataSource;
    cdsCarnePagamentoID: TIntegerField;
    cdsCarnePagamentoID_CLIENTE: TIntegerField;
    cdsCarnePagamentoDATA: TDateField;
    cdsCarnePagamentoUSUARIO: TStringField;
    cdsCarnePagamentoTERMINAL_ID: TIntegerField;
    cdsCarnePagamentoVLR_TOTAL: TFloatField;
    cdsCarnePagamentoVLR_RECEBIDO: TFloatField;
    cdsCarnePagamentoVLR_TROCO: TFloatField;
    sdsCarnePgtoDuplicatas: TSQLDataSet;
    cdsCarnePgtoDuplicatas: TClientDataSet;
    dsCarnePgtoDuplicatas: TDataSource;
    sdsCarnePgtoForma: TSQLDataSet;
    cdsCarnePgtoForma: TClientDataSet;
    dsCarnePgtoForma: TDataSource;
    dsmCarnePagamento: TDataSource;
    cdsCarnePagamentosdsCarnePgtoForma: TDataSetField;
    cdsCarnePagamentosdsCarnePgtoDuplicatas: TDataSetField;
    sdsCarnePgtoDuplicatasID: TIntegerField;
    sdsCarnePgtoDuplicatasITEM: TIntegerField;
    sdsCarnePgtoDuplicatasCUPOM: TIntegerField;
    sdsCarnePgtoDuplicatasPARCELA: TIntegerField;
    sdsCarnePgtoDuplicatasVLR_JUROS: TFloatField;
    sdsCarnePgtoDuplicatasVLR_TOTAL: TFloatField;
    sdsCarnePgtoFormaID: TIntegerField;
    sdsCarnePgtoFormaITEM: TIntegerField;
    sdsCarnePgtoFormaID_FORMA: TIntegerField;
    sdsCarnePgtoFormaVLR_PAGO: TFloatField;
    sdsCarnePagamentoID: TIntegerField;
    sdsCarnePagamentoID_CLIENTE: TIntegerField;
    sdsCarnePagamentoDATA: TDateField;
    sdsCarnePagamentoUSUARIO: TStringField;
    sdsCarnePagamentoTERMINAL_ID: TIntegerField;
    sdsCarnePagamentoVLR_TOTAL: TFloatField;
    sdsCarnePagamentoVLR_RECEBIDO: TFloatField;
    sdsCarnePagamentoVLR_TROCO: TFloatField;
    cdsCarnePgtoDuplicatasID: TIntegerField;
    cdsCarnePgtoDuplicatasITEM: TIntegerField;
    cdsCarnePgtoDuplicatasCUPOM: TIntegerField;
    cdsCarnePgtoDuplicatasPARCELA: TIntegerField;
    cdsCarnePgtoDuplicatasVLR_JUROS: TFloatField;
    cdsCarnePgtoDuplicatasVLR_TOTAL: TFloatField;
    cdsCarnePgtoFormaID: TIntegerField;
    cdsCarnePgtoFormaITEM: TIntegerField;
    cdsCarnePgtoFormaID_FORMA: TIntegerField;
    cdsCarnePgtoFormaVLR_PAGO: TFloatField;
    sdsCarnePagamentoNOME: TStringField;
    cdsCarnePagamentoNOME: TStringField;
    sdsCarnePgtoDuplicatasDT_VCTO: TDateField;
    cdsCarnePgtoDuplicatasDT_VCTO: TDateField;
    mSelecionadasVLR_ABATIMENTO: TCurrencyField;
    sdsDuplicataTIPO_ES: TStringField;
    cdsDuplicataTIPO_ES: TStringField;
    sdsDuplicataFILIAL: TIntegerField;
    cdsDuplicataFILIAL: TIntegerField;
    cdsCupomFiscalFILIAL: TIntegerField;
    sdsDuplicataDESCRICAO: TStringField;
    cdsDuplicataDESCRICAO: TStringField;
    sdsDuplicataSERIE: TStringField;
    cdsDuplicataSERIE: TStringField;
    sdsDuplicataVLR_PARCELA: TFloatField;
    cdsDuplicataVLR_PARCELA: TFloatField;
    sdsDuplicataTIPO_LANCAMENTO: TStringField;
    cdsDuplicataTIPO_LANCAMENTO: TStringField;
    sdsDuplicataID_TERMINAL: TIntegerField;
    sdsDuplicataUSUARIO: TStringField;
    cdsDuplicataID_TERMINAL: TIntegerField;
    cdsDuplicataUSUARIO: TStringField;
    cdsDuplicataCliDESCRICAO: TStringField;
    dsCondPgto: TDataSource;
    cdsCondPgto: TClientDataSet;
    cdsCondPgtoID: TIntegerField;
    cdsCondPgtoNOME: TStringField;
    cdsCondPgtoTIPO: TStringField;
    cdsCondPgtoTIPO_CONDICAO: TStringField;
    cdsCondPgtoQTD_PARCELA: TIntegerField;
    cdsCondPgtoENTRADA: TStringField;
    cdsCondPgtoMOSTRAR_NFCE: TStringField;
    dspCondPgto: TDataSetProvider;
    sdsCondPgto: TSQLDataSet;
    mNegociacao: TClientDataSet;
    dsmNegociacao: TDataSource;
    mNegociacaoPARCELA: TIntegerField;
    mNegociacaoDATA: TDateField;
    mNegociacaoVALOR: TCurrencyField;
    sdsDuplicataCANCELADA: TStringField;
    cdsDuplicataCANCELADA: TStringField;
    dsRenegociacao: TDataSource;
    cdsRenegociacao: TClientDataSet;
    dspRenegociacao: TDataSetProvider;
    sdsRenegociacao: TSQLDataSet;
    dsRenegociacaoParc: TDataSource;
    cdsRenegociacaoParc: TClientDataSet;
    dspRenegociacaoParc: TDataSetProvider;
    sdsRenegociacaoParc: TSQLDataSet;
    sdsRenegociacaoID: TIntegerField;
    sdsRenegociacaoDATA: TDateField;
    sdsRenegociacaoID_PESSOA: TIntegerField;
    sdsRenegociacaoVALOR: TFloatField;
    sdsRenegociacaoID_CONDPGTO: TIntegerField;
    cdsRenegociacaoID: TIntegerField;
    cdsRenegociacaoDATA: TDateField;
    cdsRenegociacaoID_PESSOA: TIntegerField;
    cdsRenegociacaoVALOR: TFloatField;
    cdsRenegociacaoID_CONDPGTO: TIntegerField;
    sdsRenegociacaoUSUARIO: TStringField;
    cdsRenegociacaoUSUARIO: TStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    cdsRenegociacaoParcID: TIntegerField;
    cdsRenegociacaoParcPARC: TIntegerField;
    cdsRenegociacaoParcDATA: TDateField;
    cdsRenegociacaoParcVALOR: TFloatField;
    sdsRenegociacaoParcID: TIntegerField;
    sdsRenegociacaoParcPARC: TIntegerField;
    sdsRenegociacaoParcDATA: TDateField;
    sdsRenegociacaoParcVALOR: TFloatField;
    sdsRenegociacaoParcID_DUPLICATA: TIntegerField;
    cdsRenegociacaoParcID_DUPLICATA: TIntegerField;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    sdsRenegociacaoNOME: TStringField;
    cdsRenegociacaoNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsDuplicataNewRecord(DataSet: TDataSet);
    procedure cdsRenegociacaoAfterScroll(DataSet: TDataSet);
    procedure cdsRenegociacaoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ctCarnePgto: String;
    vGerou: Boolean;
    ctRenegociacao: String;
    procedure prc_PosicionaCupom(vID: Integer);
    procedure prc_ImprimirRecibo(vVlrRec, vVlrTot, vVlrTroco: Currency; vCliente: String; vDtPgto: TDateTime);
    procedure prc_InsereDuplicata(vDtVcto: TDateTime; vIdCliente, vParcela: Integer; vNomeCliente: String; vVlrParc: Currency);
    function fncCalculaTotal: Currency;
    procedure prc_ImprimirRenegocicao(vId: Integer);
  end;

var
  dmPagamento: TdmPagamento;

implementation

uses DmdDatabase, uUtilPadrao;

{$R *.dfm}

{ TdmPagamento }

procedure TdmPagamento.prc_PosicionaCupom(vID: Integer);
begin
  cdsCupomFiscal.Close;
  sdsCupomFiscal.ParamByName('ID').AsInteger := vID;
  cdsCupomFiscal.Open;
end;

procedure TdmPagamento.DataModuleCreate(Sender: TObject);
begin
  cdsTipoCobranca.Open;
  mSelecionadas.CreateDataSet;
  mPagamentos.CreateDataSet;
  mParcelas.CreateDataSet;
  qCupomParametros.Open;
  
  ctCarnePgto    := sdsCarnePagamento.CommandText;
  ctRenegociacao := sdsRenegociacao.CommandText;
end;

function TdmPagamento.fncCalculaTotal: Currency;
var
  vTotal, vDesc, vJuros: Currency;
begin
  vTotal := 0;
  vDesc  := 0;
  vJuros := 0;
//  mSelecionadas.IndexDefs.Add('Decrescente','VLR_SALDO_PRINC',[ixDescending]) ;
//  mSelecionadas.IndexName := 'Decrescente';

  mSelecionadas.First;
  while not mSelecionadas.Eof do
  begin
    mSelecionadas.Edit;
    mSelecionadasVLR_TOTAL.AsCurrency := mSelecionadasVLR_VCTO.AsCurrency +
                                         mSelecionadasVLR_JUROS.AsCurrency -
                                         mSelecionadasVLR_DESC.AsCurrency;
    mSelecionadasVLR_SALDO_PRINC.AsCurrency := mSelecionadasVLR_VCTO.AsCurrency;
    mSelecionadasVLR_SALDO_JUROS.AsCurrency := mSelecionadasVLR_JUROS.AsCurrency;

    vTotal := vTotal + mSelecionadasVLR_TOTAL.AsCurrency;
    vDesc  := vDesc  + mSelecionadasVLR_DESC.AsCurrency;
    mSelecionadas.Post;
    mSelecionadas.Next;
  end;
  Result := vTotal;// - vDesc;
end;

procedure TdmPagamento.prc_ImprimirRecibo(vVlrRec, vVlrTot, vVlrTroco: Currency; vCliente: String; vDtPgto: TDateTime);
var
  vLinha, vPosicao: Word;
  vTxt1, vTxt2: String;
  cAvanco, i: Word; //25
begin
  cAvanco := qCupomParametrosALTURA_SALTO_LINHA.AsInteger;
  cdsFilial.Open;

  Printer.BeginDoc;
  Printer.Canvas.Font.Name := 'Lucida Console';
  Printer.Canvas.Font.Size := 7;

  vLinha := 0;
  Printer.Canvas.Font.Style := [fsBold]; //Declarar Graphics

  vTxt1 := cdsFilialNOME_INTERNO.AsString;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  vTxt1 := cdsFilialNOME.AsString;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  Printer.Canvas.Font.Style := [];
  vLinha := vLinha + cAvanco;

  vTxt1 := cdsFilialENDERECO.AsString + ', ' + cdsFilialNUM_END.AsString + ' - ' + cdsFilialCOMPLEMENTO_END.AsString;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;
  vTxt1 := 'FONE: ' + cdsFilialFONE.AsString;
  for i := 1 to 20 - Length(vTxt1) do
   vTxt1 := vTxt1 + ' ';
  vTxt1 := vTxt1 + cdsFilialCIDADE.AsString + ' ' + cdsFilialUF.AsString;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;
  vTxt1 := cdsFilialCNPJ_CPF.AsString;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;
  vTxt1 := '==========================================';
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  Printer.Canvas.Font.Style := [fsBold]; //Declarar Graphics
  vTxt1 := 'RECIBO DE PRESTAÇÕES';
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;
  Printer.Canvas.Font.Style := [];

  Printer.Canvas.TextOut(0,vLinha,'');
  vLinha := vLinha + cAvanco;

  vTxt1 := '    Data: ' + FormatDateTime('DD/MM/YYYY - HH:NN',vDtPgto);
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  vTxt1 := '  Usário: ' + vUsuario;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  vTxt1 := 'Terminal: ' + IntToStr(vTerminal);
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  Printer.Canvas.TextOut(0,vLinha,'');
  vLinha := vLinha + cAvanco;

  vTxt1 := ' Cliente: ' + vCliente;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  vTxt1 := '------------------------------------------';
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;
  vTxt1 := 'CUPOM/PARC.   DT. VCTO.  JUROS  VLR. TOTAL';
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;
  vTxt1 := '------------------------------------------';
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  mSelecionadas.First;
  while not mSelecionadas.Eof do
  begin
    vTxt1 := mSelecionadasNUM_CUPOM.AsString;
    for i := 1 to 5 - Length(vTxt1) do
      vTxt1 := ' ' + vTxt1;

    vTxt1 := vTxt1 + '/' + mSelecionadasPARCELA.AsString;
    for i := 1 to 14 - Length(vTxt1) do
      vTxt1 := vTxt1 + ' ';

    vTxt2 := FormatDateTime('DD/MM/YYYY',mSelecionadasDT_VCTO.AsDateTime);
    for i := 1 to 11 - Length(vTxt2) do
      vTxt2 := vTxt2 + ' ';
    vTxt1 := vTxt1 + vTxt2;

    vTxt2 := FormatFloat('0.00',mSelecionadasVLR_JUROS.AsCurrency);
    for i := 1 to 6 - Length(vTxt2) do
      vTxt2 := ' ' + vTxt2;
    vTxt1 := vTxt1 + vTxt2;

    vTxt2 := FormatFloat('0.00',mSelecionadasVLR_TOTAL.AsCurrency);
    for i := 1 to 11 - Length(vTxt2) do
      vTxt2 := ' ' + vTxt2;
    Printer.Canvas.TextOut(0,vLinha,vTxt1 + vTxt2);
    vLinha := vLinha + cAvanco;
    mSelecionadas.Next;
  end;

  vTxt1 := '==========================================';
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  vTxt2 := FormatFloat('0.00',vVlrTot);
  for i := 1 to 11 - Length(vTxt2) do
    vTxt2 := ' ' + vTxt2;
  vTxt1 := '         Total das Prestações: ' + vTxt2;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  vTxt2 := FormatFloat('0.00',vVlrRec);
  for i := 1 to 11 - Length(vTxt2) do
    vTxt2 := ' ' + vTxt2;
  vTxt1 := '                     Recebido: ' + vTxt2;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  vTxt2 := FormatFloat('0.00',vVlrTroco);
  for i := 1 to 11 - Length(vTxt2) do
    vTxt2 := ' ' + vTxt2;
  vTxt1 := '                        Troco: ' + vTxt2;
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;


  vTxt1 := '==========================================';
  Printer.Canvas.TextOut(0,vLinha,vTxt1);
  vLinha := vLinha + cAvanco;

  mPagamentos.First;
  while not mPagamentos.Eof do
  begin
    vTxt1 := 'Forma: ' + mPagamentoslkTIPOCOBRANCA.AsString;
    for i := 1 to 27 - Length(vTxt1) do
      vTxt1 := vTxt1 + ' ';
    vTxt2 := FormatFloat('#,##0.00',mPagamentosVLR_PAGO.AsCurrency);
    for i := 1 to 10 do
      vTxt2 := ' ' + vTxt2;
    Printer.Canvas.TextOut(0,vLinha,vTxt1 + vTxt2);
    vLinha := vLinha + cAvanco;
    mPagamentos.Next;
  end;

  Printer.Canvas.TextOut(0,vLinha,'');
  vLinha := vLinha + cAvanco;

  Printer.EndDoc;
end;

procedure TdmPagamento.cdsDuplicataNewRecord(DataSet: TDataSet);
begin
  cdsDuplicataVLR_DESCONTO.AsFloat     := 0;
  cdsDuplicataVLR_DESPESAS.AsFloat     := 0;
  cdsDuplicataVLR_JUROSPAGOS.AsFloat   := 0;
  cdsDuplicataVLR_PAGO.AsFloat         := 0;
  cdsDuplicataVLR_PARCELA.AsFloat       := 0;
  cdsDuplicataVLR_RESTANTE.AsFloat     := 0;
  cdsDuplicataNUMNOTA.AsInteger        := 0;
  cdsDuplicataSERIE.AsString           := '';
  cdsDuplicataCANCELADA.AsString       := 'N';
end;

procedure TdmPagamento.prc_InsereDuplicata(vDtVcto: TDateTime; vIdCliente, vParcela: Integer; vNomeCliente: String; vVlrParc: Currency);
var
  vAux: Integer;
begin
  vAux := dmDatabase.ProximaSequencia('DUPLICATA',0);
  cdsDuplicata.Insert;
  cdsDuplicataCANCELADA.AsString       := 'N';
  cdsDuplicataDESCRICAO.AsString       := 'RENEGOCIAÇÃO DE VENCIMENTOS';
  cdsDuplicataDTEMISSAO.AsDateTime     := Date;
  cdsDuplicataDTVENCIMENTO.AsDateTime  := vDtVcto;
  cdsDuplicataFILIAL.AsInteger         := vFilial;
  cdsDuplicataID.AsInteger             := vAux;
  cdsDuplicataID_PESSOA.AsInteger      := vIdCliente;
  cdsDuplicataID_TERMINAL.AsInteger    := vTerminal;
  cdsDuplicataNOME_CLI.AsString        := vNomeCliente;
  cdsDuplicataPARCELA.AsInteger        := vParcela;
  cdsDuplicataTIPO_ES.AsString         := 'E';
  cdsDuplicataTIPO_LANCAMENTO.AsString := 'RNG';
  cdsDuplicataSERIE.AsString           := 'RNG';
  cdsDuplicataUSUARIO.AsString         := vUsuario;
  cdsDuplicataVLR_PARCELA.AsString     := FormatFloat('0.00',vVlrParc);
  cdsDuplicataVLR_RESTANTE.AsString    := FormatFloat('0.00',vVlrParc);
  cdsDuplicataCANCELADA.AsString       := 'N';
  cdsDuplicataNUMNOTA.AsInteger        := 0;

  cdsDuplicata.Post;
  cdsDuplicata.ApplyUpdates(0);
end;

procedure TdmPagamento.cdsRenegociacaoAfterScroll(DataSet: TDataSet);
begin
  cdsRenegociacaoParc.Close;
  sdsRenegociacaoParc.ParamByName('ID').AsInteger := cdsRenegociacaoID.AsInteger;
  cdsRenegociacaoParc.Open;
end;

procedure TdmPagamento.cdsRenegociacaoNewRecord(DataSet: TDataSet);
var
  vAux: Integer;
begin
  vAux := dmDatabase.ProximaSequencia('RENEGOCIACAO',0);
  cdsRenegociacaoID.AsInteger := vAux;
end;

procedure TdmPagamento.prc_ImprimirRenegocicao(vId: Integer);
var
  vArq: String;
begin
  cdsRenegociacao.Close;
  sdsRenegociacao.CommandText := ctRenegociacao + ' WHERE 0 = 0 ';
  if vID > 0 then
    sdsRenegociacao.CommandText := sdsRenegociacao.CommandText + ' AND ID = ' + IntToStr(vID);
  cdsRenegociacao.Open;

  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CarneNegociacao.fr3';

  if FileExists(vArq) then
  begin
    frxReport1.Report.LoadFromFile(vArq);
    frxReport1.ShowReport
  end
  else
    ShowMessage('Relatório não localizado! ' + vArq);
end;

end.
