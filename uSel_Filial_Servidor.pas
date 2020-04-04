unit uSel_Filial_Servidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  NxCollection, ExtCtrls, RxLookup, StdCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr, rsDBUtils,
  Grids, DBGrids, SMDBGrid, UDMCadFilial;

type
  TfrmSel_Filial_Servidor = class(TForm)
    SMDBGrid1: TSMDBGrid;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
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
    cdsFilialINSCR_EST: TStringField;
    cdsFilialSIMPLES: TStringField;
    cdsFilialENDLOGO: TStringField;
    cdsFilialCALCULAR_IPI: TStringField;
    cdsFilialINATIVO: TStringField;
    cdsFilialINSCMUNICIPAL: TStringField;
    cdsFilialCNAE: TStringField;
    cdsFilialHOMEPAGE: TStringField;
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
    cdsFilialPRINCIPAL: TStringField;
    cdsFilialLIBERADO_ATE: TStringField;
    cdsFilialULTIMO_ACESSO: TStringField;
    cdsFilialUSARICMSSIMPLES: TStringField;
    cdsFilialSERIENORMAL: TStringField;
    cdsFilialID_REGIME_TRIB_NFSE: TIntegerField;
    cdsFilialINCENTIVO_CULTURAL: TStringField;
    cdsFilialSERIE_NFSE: TStringField;
    cdsFilialID_NATUREZA: TIntegerField;
    cdsFilialID_SERVICO_SINT: TIntegerField;
    cdsFilialID_SERVICO_PAD: TIntegerField;
    cdsFilialPERC_IR: TFloatField;
    cdsFilialVLR_IR_MINIMO: TFloatField;
    cdsFilialPERC_ISS: TFloatField;
    cdsFilialCOD_TRIBUTACAO_MUNICIPIO: TStringField;
    cdsFilialNUMLOTE: TIntegerField;
    cdsFilialENDLOGO_NFSE: TStringField;
    cdsFilialPERC_CSLL: TFloatField;
    cdsFilialCNAE_NFSE: TStringField;
    cdsFilialPERC_INSS: TFloatField;
    cdsFilialID_ATIVIDADE_CID: TIntegerField;
    cdsFilialNFSE_HOMOLOGACAO: TStringField;
    cdsFilialPERC_CSRF: TFloatField;
    cdsFilialVLR_FATURAMENTO_MES_CSRF: TFloatField;
    cdsFilialPERC_TRIB_SERV: TFloatField;
    cdsFilialPERC_TRIB_NTS_IND: TFloatField;
    cdsFilialPERC_TRIB_NTS_VEN: TFloatField;
    cdsFilialPERC_TRIB_NTS_IND_EXP: TFloatField;
    cdsFilialPERC_TRIB_NTS_VEN_EXP: TFloatField;
    cdsFilialPERC_LISTA_CAMEX: TFloatField;
    cdsFilialIMPRESSAO_MATRICIAL: TStringField;
    cdsFilialID_CONTABILISTA: TIntegerField;
    cdsFilialINSCR_SUFRAMA: TStringField;
    cdsFilialSPED_PERFIL: TStringField;
    cdsFilialSPED_ATIVIDADE: TStringField;
    cdsFilialEMAIL: TStringField;
    cdsFilialLICENCA_FEPAM: TStringField;
    cdsFilialID_CFOP_NFCE_PADRAO: TIntegerField;
    cdsFilialUSA_NFCE: TStringField;
    cdsFilialNFCEPRODUCAO: TStringField;
    cdsFilialSERIE_NFCE: TStringField;
    cdsFilialVLR_CSRF_MINIMO: TFloatField;
    cdsFilialID_ENQIPI: TIntegerField;
    cdsFilialCALCULAR_DIFAL: TStringField;
    cdsFilialNUM_PEDIDO_ULT: TIntegerField;
    cdsFilialNUM_ORCAMENTO_ULT: TIntegerField;
    cdsFilialNUM_OC_ULT: TIntegerField;
    cdsFilialEMAIL_FINANCEIRO: TStringField;
    cdsFilialENDLOGO_ROTULO: TStringField;
    cdsFilialLOCALSERVIDORNFE: TStringField;
    cdsFilialUSA_CUPOM: TStringField;
    cdsFilialDIFAL_GERAR_VALORES: TStringField;
    cdsFilialOBS_DIFAL: TStringField;
    cdsFilialINCENTIVO_FISCAL: TStringField;
    cdsFilialNOME_ETIQUETA: TStringField;
    cdsFilialPERC_ISS_SIMPLES: TFloatField;
    cdsFilialNUM_NOTA_RAMIRO: TIntegerField;
    cdsFilialIND_NAT_PJ: TSmallintField;
    cdsFilialIND_ATIV_PISCOFINS: TSmallintField;
    cdsFilialFINALIDADE_PADRAO: TStringField;
    cdsFilialSERIE_CPF: TStringField;
    cdsFilialTIPO_EMP: TStringField;
    cdsFilialSPED_PERIODO_IPI: TStringField;
    cdsFilialUSA_ENVIO_ST_RET: TStringField;
    cdsFilialCALCULAR_ICMS_EFET: TStringField;
    cdsFilialENVIO_NFSE: TStringField;
    cdsFilialSPED_SOMA_IPI_CUSTO: TStringField;
    cdsFilialARQ_MODELO_CONTRATO: TStringField;
    cdsFilialTOKEN_CEDENTE: TStringField;
    cdsFilialID_CEDENTE: TIntegerField;
    cdsFilialDESC_ICMS_PIS_COFINS: TStringField;
    cdsFilialFORMA_TRABALHO: TStringField;
    cdsFilialPERGUNTA_MESA: TStringField;
    cdsFilialPEDIDO_PRECO_IPI: TStringField;
    sdsFilial_Relatorios: TSQLDataSet;
    dspFilial_Relatorios: TDataSetProvider;
    cdsFilial_Relatorios: TClientDataSet;
    cdsFilial_RelatoriosID: TIntegerField;
    cdsFilial_RelatoriosITEM: TIntegerField;
    cdsFilial_RelatoriosTIPO: TSmallintField;
    cdsFilial_RelatoriosCAMINHO: TStringField;
    cdsFilial_RelatoriosPOSICAO: TSmallintField;
    cdsFilial_RelatoriosDESCRICAO: TStringField;
    cdsFilial_RelatoriosGERAR_TAMANHO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Copiar_Filial;
    
  public
    { Public declarations }
    fDMCadFilial: TDMCadFilial;
    
  end;

var
  frmSel_Filial_Servidor: TfrmSel_Filial_Servidor;

implementation

uses uUtilPadrao, DmdDatabase;

{$R *.dfm}

procedure TfrmSel_Filial_Servidor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSel_Filial_Servidor.FormShow(Sender: TObject);
var
  sds: TSQLDataSet;
  vIDAux : Integer;
begin
  cdsFilial.Close;
  sdsFilial.SQLConnection := dmDatabase.scoDados;
  vIDAux := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT USA_NFCE_LOCAL from PARAMETROS_GERAL';
    sds.Open;
    if sds.FieldByName('USA_NFCE_LOCAL').AsString = 'S' then
    begin
      sdsFilial.SQLConnection := dmDatabase.scoServidor;
    end;
  finally
    FreeAndNil(sds);
  end;
  cdsFilial.Open;
end;

procedure TfrmSel_Filial_Servidor.prc_Copiar_Filial;
var
  x: Integer;
begin
  for x := 0 to (cdsFilial.FieldCount - 1) do
    fDMCadFilial.cdsFilial.FieldByName(cdsFilial.Fields[x].FieldName).AsVariant := cdsFilial.Fields[x].Value;
  cdsFilial_Relatorios.Close;
  sdsFilial_Relatorios.ParamByName('ID').AsInteger := cdsFilialID.AsInteger;
  cdsFilial_Relatorios.Open;
  if not cdsFilial_Relatorios.IsEmpty then
  begin
    fDMCadFilial.cdsFilialRelatorios.Insert;
    for x := 0 to (cdsFilial_Relatorios.FieldCount - 1) do
      fDMCadFilial.cdsFilialRelatorios.FieldByName(cdsFilial_Relatorios.Fields[x].FieldName).AsVariant := cdsFilial_Relatorios.Fields[x].Value;
    fDMCadFilial.cdsFilialRelatorios.Post;
  end;
end;

procedure TfrmSel_Filial_Servidor.SMDBGrid1DblClick(Sender: TObject);
begin
  if cdsFilialID.AsInteger > 0 then
    prc_Copiar_Filial;
  Close;
end;

end.
