unit UDMCadConfig_Balanca;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, DBClient, DB, SqlExpr, DmdDatabase;

type
  TDMConfig_Balanca = class(TDataModule)
    sdsConfigBalancaLay: TSQLDataSet;
    dsConfigBalancaLay: TDataSource;
    cdsConfigBalancaLay: TClientDataSet;
    sdsConfigBalanca: TSQLDataSet;
    dsConfigBalanca: TDataSource;
    cdsConfigBalanca: TClientDataSet;
    dspConfigBalanca: TDataSetProvider;
    sdsConfigBalancaLayID: TIntegerField;
    sdsConfigBalancaLayORDEM: TIntegerField;
    sdsConfigBalancaLayCAMPO: TStringField;
    sdsConfigBalancaLayPOSICAO: TIntegerField;
    sdsConfigBalancaLayTAMANHO: TIntegerField;
    sdsConfigBalancaLayPENDENTE: TStringField;
    cdsConfigBalancaLayID: TIntegerField;
    cdsConfigBalancaLayORDEM: TIntegerField;
    cdsConfigBalancaLayCAMPO: TStringField;
    cdsConfigBalancaLayPOSICAO: TIntegerField;
    cdsConfigBalancaLayTAMANHO: TIntegerField;
    cdsConfigBalancaLayPENDENTE: TStringField;
    sdsConfigBalancaID: TIntegerField;
    sdsConfigBalancaDESCRICAO: TStringField;
    sdsConfigBalancaDECIMAIS: TIntegerField;
    sdsConfigBalancaUSA_SEPARADOR: TStringField;
    sdsConfigBalancaTIPO_SEPARADOR: TStringField;
    sdsConfigBalancaNOMEARQ_TXT: TStringField;
    sdsConfigBalancaID_TEXT: TStringField;
    sdsConfigBalancaID_POSICAO: TIntegerField;
    sdsConfigBalancaID_TAMANHO: TIntegerField;
    sdsConfigBalancaCOD_POSICAO: TIntegerField;
    sdsConfigBalancaCOD_TAMANHO: TIntegerField;
    sdsConfigBalancaVLR_POSICAO: TIntegerField;
    sdsConfigBalancaVLR_TAMANHO: TIntegerField;
    sdsConfigBalancaTIPO_PRECO: TStringField;
    cdsConfigBalancaID: TIntegerField;
    cdsConfigBalancaDESCRICAO: TStringField;
    cdsConfigBalancaDECIMAIS: TIntegerField;
    cdsConfigBalancaUSA_SEPARADOR: TStringField;
    cdsConfigBalancaTIPO_SEPARADOR: TStringField;
    cdsConfigBalancaNOMEARQ_TXT: TStringField;
    cdsConfigBalancaID_TEXT: TStringField;
    cdsConfigBalancaID_POSICAO: TIntegerField;
    cdsConfigBalancaID_TAMANHO: TIntegerField;
    cdsConfigBalancaCOD_POSICAO: TIntegerField;
    cdsConfigBalancaCOD_TAMANHO: TIntegerField;
    cdsConfigBalancaVLR_POSICAO: TIntegerField;
    cdsConfigBalancaVLR_TAMANHO: TIntegerField;
    cdsConfigBalancaTIPO_PRECO: TStringField;
    sdsTabelaProduto: TSQLDataSet;
    dsTabelaProduto: TDataSource;
    cdsTabelaProduto: TClientDataSet;
    cdsTabelaProdutoNOME_CAMPO: TStringField;
    cdsMestre: TDataSource;
    dspTabelaProduto: TDataSetProvider;
    cdsConfigBalancasdsConfigBalancaLay: TDataSetField;
    sdsProduto: TSQLDataSet;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    dspProduto: TDataSetProvider;
    cdsProdutoID: TIntegerField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoNOME: TStringField;
    cdsProdutoPESOLIQUIDO: TFloatField;
    cdsProdutoPESOBRUTO: TFloatField;
    cdsProdutoINATIVO: TStringField;
    cdsProdutoID_CSTIPI: TIntegerField;
    cdsProdutoPERC_IPI: TFloatField;
    cdsProdutoPRECO_CUSTO: TFloatField;
    cdsProdutoPRECO_VENDA: TFloatField;
    cdsProdutoTIPO_REG: TStringField;
    cdsProdutoPOSSE_MATERIAL: TStringField;
    cdsProdutoESTOQUE: TStringField;
    cdsProdutoMATERIAL_OUTROS: TStringField;
    cdsProdutoUSUARIO: TStringField;
    cdsProdutoDTCAD: TDateField;
    cdsProdutoHRCAD: TTimeField;
    cdsProdutoCA: TStringField;
    cdsProdutoCOMPLEMENTO: TStringField;
    cdsProdutoID_NCM: TIntegerField;
    cdsProdutoORIGEM_PROD: TStringField;
    cdsProdutoOBS: TMemoField;
    cdsProdutoCODSITCF: TStringField;
    cdsProdutoPERC_REDUCAOICMS: TFloatField;
    cdsProdutoTIPO_VENDA: TStringField;
    cdsProdutoPERC_MARGEMLUCRO: TFloatField;
    cdsProdutoUNIDADE: TStringField;
    cdsProdutoDT_ALTPRECO: TDateField;
    cdsProdutoLOCALIZACAO: TStringField;
    cdsProdutoID_GRUPO: TIntegerField;
    cdsProdutoID_SUBGRUPO: TIntegerField;
    cdsProdutoID_MARCA: TIntegerField;
    cdsProdutoID_FORNECEDOR: TIntegerField;
    cdsProdutoCOD_BARRA: TStringField;
    cdsProdutoPERC_IMPORTACAO: TFloatField;
    cdsProdutoCOD_ANT: TStringField;
    cdsProdutoPERC_REDUCAOICMSSUBST: TFloatField;
    cdsProdutoUSA_GRADE: TStringField;
    cdsProdutoID_GRADE: TIntegerField;
    cdsProdutoUSA_PERC_IMP_INTERESTADUAL: TStringField;
    cdsProdutoIMPRIMIR_ETIQUETA_NAV: TStringField;
    cdsProdutoCARIMBO: TStringField;
    cdsProdutoPERC_QUEBRAMAT: TFloatField;
    cdsProdutoSPED_TIPO_ITEM: TStringField;
    cdsProdutoQTD_ESTOQUE_MIN: TFloatField;
    cdsProdutoPERC_PIS: TFloatField;
    cdsProdutoPERC_COFINS: TFloatField;
    cdsProdutoPERC_ICMS_IMP: TFloatField;
    cdsProdutoPERC_IPI_IMP: TFloatField;
    cdsProdutoREFERENCIA_PADRAO: TStringField;
    cdsProdutoNUM_FCI: TStringField;
    cdsProdutoPERC_USADO_FCI: TFloatField;
    cdsProdutoNCM_EX: TStringField;
    cdsProdutoID_SITTRIB_CF: TIntegerField;
    cdsProdutoID_CLIENTE: TIntegerField;
    cdsProdutoPRECO_REVENDA: TFMTBCDField;
    cdsProdutoPRECO_INDUSTRIALIZACAO: TFMTBCDField;
    cdsProdutoPRECO_CONSUMO: TFMTBCDField;
    cdsProdutoFOTO: TStringField;
    cdsProdutoREFERENCIA_SEQ: TIntegerField;
    cdsProdutoID_COR: TIntegerField;
    cdsProdutoCALCULAR_2_LADOS: TStringField;
    cdsProdutoPERC_VIDRO: TFloatField;
    cdsProdutoID_LINHA: TIntegerField;
    cdsProdutoID_CFOP_NFCE: TIntegerField;
    cdsProdutoUSA_PRECO_COR: TStringField;
    cdsProdutoUSA_COR: TStringField;
    cdsProdutoTRANSFER: TStringField;
    cdsProdutoPRECO_CUSTO_TOTAL: TFloatField;
    cdsProdutoID_CONTA_ORCAMENTO: TIntegerField;
    cdsProdutoID_LOCAL_ESTOQUE_PROD: TIntegerField;
    cdsProdutoPERC_COMISSAO: TFloatField;
    cdsProdutoID_ENQIPI: TIntegerField;
    cdsProdutoLANCA_LOTE_CONTROLE: TStringField;
    cdsProdutoCOD_CEST: TStringField;
    cdsProdutoPICTOGRAMA: TStringField;
    cdsProdutoPICTO_CABEDAL: TStringField;
    cdsProdutoPICTO_INTERIOR: TStringField;
    cdsProdutoPICTO_SOLA: TStringField;
    cdsProdutoCOD_PRODUTO_CLI: TStringField;
    cdsProdutoFILIAL: TIntegerField;
    cdsProdutoBAIXA_ESTOQUE_MAT: TStringField;
    cdsProdutoCOD_JUSTNEW: TIntegerField;
    cdsProdutoNOME_ORIGINAL: TStringField;
    cdsProdutoIMP_ROTULO: TStringField;
    cdsProdutoNUM_MS: TStringField;
    cdsProdutoIMP_CONSUMO_NFE: TStringField;
    cdsProdutoGERAR_FCI: TStringField;
    cdsProdutoMEDIDA: TStringField;
    cdsProdutoQTD_EMBALAGEM: TFloatField;
    cdsProdutoDT_ALT_PRECOCUSTO: TDateField;
    cdsProdutoUSA_CARIMBO_OC: TStringField;
    cdsProdutoUSA_NA_BALANCA: TStringField;
    cdsProdutoMENSAGEM: TStringField;
    cdsProdutoPERC_DESC_MAX: TFloatField;
    cdsProdutoID_CSTICMS_BRED: TIntegerField;
    cdsProdutoTIPO_MAT: TStringField;
    cdsProdutoID_PROCESSO_GRUPO: TIntegerField;
    cdsProdutoTIPO_PRODUCAO: TStringField;
    cdsProdutoCRIADO_OS: TStringField;
    cdsProdutoID_MATERIAL_CRU: TIntegerField;
    cdsProdutoID_FORMA: TIntegerField;
    cdsProdutoTAMANHO: TStringField;
    cdsProdutoTESTE: TStringField;
    cdsProdutoPRECO_LIQ: TFloatField;
    cdsProdutoUSA_CLIQ: TStringField;
    cdsProdutoQTD_PECA_EMB: TIntegerField;
    cdsProdutoLARGURA: TFloatField;
    cdsProdutoALTURA: TFloatField;
    cdsProdutoESPESSURA: TFloatField;
    cdsProdutoMULTIPLICADOR: TFloatField;
    cdsProdutoREF2: TStringField;
    cdsProdutoFATOR_CALCULO: TFloatField;
    cdsProdutoREF_ORD: TStringField;
    cdsProdutoGERAR_WEB: TStringField;
    cdsProdutoTAM_CALC: TFloatField;
    cdsProdutoCOD_BARRA2: TStringField;
    cdsProdutoPOSSUE_LADO: TStringField;
    cdsProdutoUNIDADE2: TStringField;
    cdsProdutoCAIXINHA: TStringField;
    cdsProdutoSEPARA_COR: TStringField;
    cdsProdutoVALIDADE: TSmallintField;
    cdsProdutoID_CSTICMS: TIntegerField;
    cdsProdutoNOME_MODELO: TStringField;
    cdsProdutoDESC_MAXIMO: TFloatField;
    cdsProdutoQTD_POR_ROTULO: TFloatField;
    cdsProdutoPERC_ICMS_NFCE: TFloatField;
    cdsProdutoTIPO_ALGODAO: TStringField;
    cdsProdutoCALCULAR_ST: TStringField;
    cdsProdutoPRECO_CUSTO_ANT: TFloatField;
    cdsProdutoCOD_BENEF: TStringField;
    cdsProdutoTIPO_PRODUTO: TStringField;
    cdsProdutoID_PRODUTO_EST: TIntegerField;
    cdsProdutoINDEXADOR_PRECO: TFloatField;
    cdsProdutoANP_ID: TIntegerField;
    cdsProdutoPRECO_VAREJO: TFloatField;
    cdsProdutoTIPO_BALANCA: TStringField;
    cdsProdutoCODIGO_BALANCA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    vMsgConfig : String;
    ctCommand : String;
    { Public declarations }
    procedure prc_Localizar(ID : Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;

    procedure prc_inserirLayout;
  end;

var
  DMConfig_Balanca: TDMConfig_Balanca;

implementation

{$R *.dfm}

procedure TDMConfig_Balanca.DataModuleCreate(Sender: TObject);
begin
  ctCommand := sdsConfigBalanca.CommandText;
end;

procedure TDMConfig_Balanca.prc_Excluir;
begin
  if not(cdsConfigBalanca.Active) or (cdsConfigBalanca.IsEmpty) then
    exit;
  cdsConfigBalanca.Delete;
  cdsConfigBalanca.ApplyUpdates(0);
end;

procedure TDMConfig_Balanca.prc_Gravar;
begin
  vMsgConfig := '';
  if trim(cdsConfigBalancaDESCRICAO.AsString) = '' then
    vMsgConfig := '*** Descrição não informada!';
  if vMsgConfig <> '' then
    exit;
  cdsConfigBalanca.Post;
  cdsConfigBalanca.ApplyUpdates(0);

end;

procedure TDMConfig_Balanca.prc_Inserir;
var
  vAux : Integer;
begin
  if not cdsConfigBalanca.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('CONFIG_BALANCA',0);

  cdsConfigBalanca.Insert;
  cdsConfigBalancaID.AsInteger := vAux;

end;

procedure TDMConfig_Balanca.prc_inserirLayout;
var
  vItemAux: Integer;
begin
  cdsConfigBalancaLay.Last;
  vItemAux := cdsConfigBalancaLayORDEM.AsInteger;

  cdsConfigBalancaLay.Insert;
  cdsConfigBalancaLayID.AsInteger   := cdsConfigBalancaID.AsInteger;
  cdsConfigBalancaLayORDEM.AsInteger := vItemAux + 1;
end;

procedure TDMConfig_Balanca.prc_Localizar(ID: Integer);
begin
  cdsConfigBalanca.Close;
  sdsConfigBalanca.CommandText := ctCommand;
  if ID <> 0 then
    sdsConfigBalanca.CommandText := sdsConfigBalanca.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsConfigBalanca.Open;
end;

end.
