unit UDMConsFat;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr, frxClass, frxDBSet, frxRich, frxExportMail, frxExportPDF;

type
  TDMConsFat = class(TDataModule)
    sdsFatAcum: TSQLDataSet;
    dspFatAcum: TDataSetProvider;
    cdsFatAcum: TClientDataSet;
    dsFatAcum: TDataSource;
    cdsFatAcumTIPO_MOV: TStringField;
    cdsFatAcumVLR_DUPLICATA: TFloatField;
    cdsFatAcumVLR_LIQUIDO_NFSE: TFloatField;
    cdsFatAcumVLR_TOTAL: TFloatField;
    cdsFatAcumVLR_ICMSSUBST: TFloatField;
    cdsFatAcumVLR_IPI: TFloatField;
    cdsFatAcumID_PESSOA: TIntegerField;
    cdsFatAcumNOME_CLIFORN: TStringField;
    cdsFatAcumNUM_NOTA: TIntegerField;
    cdsFatAcumDTEMISSAO: TDateField;
    cdsFatAcumDTENTRADASAIDA: TDateField;
    cdsFatAcumTIPO_REG: TStringField;
    cdsFatAcumFILIAL: TIntegerField;
    cdsFatAcumUF_CLI: TStringField;
    cdsFatAcumID_CFOP: TIntegerField;
    cdsFatAcumVLR_DESCONTO: TFloatField;
    cdsFatAcumVLR_PIS: TFloatField;
    cdsFatAcumVLR_COFINS: TFloatField;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    dsFilial: TDataSource;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
    cdsFatAcumVLR_ICMS: TFloatField;
    cdsFatAcumVLR_TOTAL_LIQ: TFloatField;
    cdsFatAcumCODCFOP: TStringField;
    cdsFatAcumVLR_TOTAL_BRU: TFloatField;
    cdsFatAcumVLR_FRETE: TFloatField;
    cdsFatAcumDEVOLUCAO: TStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    cdsFatAcumVLR_ICMS_UF_REMET: TFloatField;
    cdsFatAcumVLR_ICMS_UF_DEST: TFloatField;
    cdsFilialPERC_IR: TFloatField;
    cdsFilialPERC_CSLL: TFloatField;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    cdsFatAcumVLR_CUSTO: TFloatField;
    cdsFatAcumVLR_IR_VENDA: TFloatField;
    cdsFatAcumVLR_CSLL_VENDA: TFloatField;
    sdsCupomTerminal: TSQLDataSet;
    dspCupomTerminal: TDataSetProvider;
    cdsCupomTerminal: TClientDataSet;
    dsCupomTerminar: TDataSource;
    cdsCupomTerminalID: TSmallintField;
    cdsCupomTerminalNOME: TStringField;
    sdsComprasServicos: TSQLDataSet;
    dspComprasServicos: TDataSetProvider;
    cdsComprasServicos: TClientDataSet;
    dsComprasServico: TDataSource;
    sdsConsComprasServico: TSQLDataSet;
    dspConsComprasServico: TDataSetProvider;
    cdsConsComprasServico: TClientDataSet;
    dsConsComprasServico: TDataSource;
    cdsConsComprasServicoID: TIntegerField;
    cdsConsComprasServicoCONTA_ORCAMENTO: TStringField;
    frxComprasServicos: TfrxDBDataset;
    cdsComprasServicosCONTA: TStringField;
    cdsComprasServicosNOME_CONTA: TStringField;
    cdsComprasServicosDTEMISSAO: TDateField;
    cdsComprasServicosCODIGO: TIntegerField;
    cdsComprasServicosNOME_CLI: TStringField;
    cdsComprasServicosSERIE: TStringField;
    cdsComprasServicosNUMNOTA: TIntegerField;
    cdsComprasServicosCODCFOP: TStringField;
    cdsComprasServicosESPECIE: TStringField;
    cdsComprasServicosVALOR_LIQUIDO: TFloatField;
    cdsComprasServicosVLR_ICMS: TFloatField;
    cdsComprasServicosVLR_IPI: TFloatField;
    cdsComprasServicosVLR_PIS: TFloatField;
    cdsComprasServicosVLR_COFINS: TFloatField;
    cdsComprasServicosVLR_NOTA: TFloatField;
    cdsComprasServicosID_CONTA_ORCAMENTO: TIntegerField;
    cdsComprasServicosMEDIA_DIAS: TFMTBCDField;
    cdsComprasServicosCTA_CONTA: TStringField;
    sdsConsCliente: TSQLDataSet;
    dspConsCliente: TDataSetProvider;
    cdsConsCliente: TClientDataSet;
    dsConsCliente: TDataSource;
    cdsConsClienteID_PESSOA: TIntegerField;
    cdsConsClienteNOME_CLIFORN: TStringField;
    cdsConsClienteVLR_DUPLICATA: TFloatField;
    cdsConsClienteVLR_ICMS: TFloatField;
    cdsConsClienteVLR_TOTAL: TFloatField;
    cdsConsClienteVLR_ICMSSUBST: TFloatField;
    cdsConsClienteVLR_IPI: TFloatField;
    cdsConsClienteVLR_FRETE: TFloatField;
    cdsConsClienteVLR_ICMS_UF_REMET: TFloatField;
    cdsConsClienteVLR_ICMS_UF_DEST: TFloatField;
    cdsConsClienteVLR_DESCONTO: TFloatField;
    cdsConsClienteVLR_COFINS: TFloatField;
    cdsConsClienteVLR_PIS: TFloatField;
    cdsConsClienteVLR_CUSTO: TFloatField;
    cdsConsClienteVLR_IR_VENDA: TFloatField;
    cdsConsClienteVLR_CSLL_VENDA: TFloatField;
    cdsConsClienteVLR_TOTAL_BRU: TFloatField;
    cdsConsClienteVLR_TOTAL_LIQ: TFloatField;
    frxConsCliente: TfrxDBDataset;
    sdsConsData: TSQLDataSet;
    dspConsData: TDataSetProvider;
    cdsConsData: TClientDataSet;
    dsConsData: TDataSource;
    cdsConsDataDTEMISSAO: TDateField;
    cdsConsDataVLR_DUPLICATA: TFloatField;
    cdsConsDataVLR_ICMS: TFloatField;
    cdsConsDataVLR_TOTAL: TFloatField;
    cdsConsDataVLR_ICMSSUBST: TFloatField;
    cdsConsDataVLR_IPI: TFloatField;
    cdsConsDataVLR_FRETE: TFloatField;
    cdsConsDataVLR_ICMS_UF_REMET: TFloatField;
    cdsConsDataVLR_ICMS_UF_DEST: TFloatField;
    cdsConsDataVLR_DESCONTO: TFloatField;
    cdsConsDataVLR_COFINS: TFloatField;
    cdsConsDataVLR_PIS: TFloatField;
    cdsConsDataVLR_CUSTO: TFloatField;
    cdsConsDataVLR_IR_VENDA: TFloatField;
    cdsConsDataVLR_CSLL_VENDA: TFloatField;
    cdsConsDataVLR_TOTAL_BRU: TFloatField;
    frxConsData: TfrxDBDataset;
    cdsConsDataVLR_TOTAL_LIQ: TFloatField;
    sdsComprasServico_Item: TSQLDataSet;
    dspComprasServico_Item: TDataSetProvider;
    cdsComprasServico_Item: TClientDataSet;
    dsComprasServico_Item: TDataSource;
    cdsComprasServico_ItemID: TIntegerField;
    cdsComprasServico_ItemITEM: TIntegerField;
    cdsComprasServico_ItemID_PRODUTO: TIntegerField;
    cdsComprasServico_ItemREFERENCIA: TStringField;
    cdsComprasServico_ItemNOME: TStringField;
    cdsComprasServico_ItemUNIDADE: TStringField;
    cdsComprasServico_ItemQTD: TFloatField;
    cdsComprasServico_ItemVLR_UNITARIO: TFloatField;
    cdsComprasServico_ItemVLR_TOTAL: TFloatField;
    cdsComprasServico_ItemTIPO_REGISTRO: TStringField;
    cdsComprasServicosTIPO_REGISTRO: TStringField;
    frxComprasServicoItem: TfrxDBDataset;
    cdsComprasServicosID: TIntegerField;
    cdsFatAcumBASE_FCP_ST: TFloatField;
    cdsFatAcumBASE_ICMS_FCP: TFloatField;
    cdsFatAcumBASE_ICMS_FCP_DEST: TFloatField;
    cdsFatAcumVLR_ICMS_FCP_DEST: TFloatField;
    cdsFatAcumVLR_ICMS_FCP: TFloatField;
    cdsFatAcumVLR_FCP_ST: TFloatField;
    cdsConsClienteBASE_FCP_ST: TFloatField;
    cdsConsClienteBASE_ICMS_FCP: TFloatField;
    cdsConsClienteBASE_ICMS_FCP_DEST: TFloatField;
    cdsConsClienteVLR_ICMS_FCP_DEST: TFloatField;
    cdsConsClienteVLR_ICMS_FCP: TFloatField;
    cdsConsClienteVLR_FCP_ST: TFloatField;
    cdsConsDataBASE_FCP_ST: TFloatField;
    cdsConsDataBASE_ICMS_FCP: TFloatField;
    cdsConsDataBASE_ICMS_FCP_DEST: TFloatField;
    cdsConsDataVLR_ICMS_FCP_DEST: TFloatField;
    cdsConsDataVLR_ICMS_FCP: TFloatField;
    cdsConsDataVLR_FCP_ST: TFloatField;
    cdsConsClienteDEVOLUCAO: TStringField;
    cdsConsDataDEVOLUCAO: TStringField;
    cdsFatAcumVLR_ISSQN: TFloatField;
    cdsFatAcumVLR_ISSQN_RETIDO: TFloatField;
    cdsConsClienteVLR_ISSQN: TFloatField;
    cdsConsClienteVLR_ISSQN_RETIDO: TFloatField;
    cdsConsDataVLR_ISSQN: TFloatField;
    cdsConsDataVLR_ISSQN_RETIDO: TFloatField;
    cdsFatAcumTERMINAL: TIntegerField;
    cdsFatAcumSERIE: TStringField;
    sdsCSTICMS_CFOP: TSQLDataSet;
    dspCSTICMS_CFOP: TDataSetProvider;
    cdsCSTICMS_CFOP: TClientDataSet;
    dsCSTICMS_CFOP: TDataSource;
    cdsCSTICMS_CFOPCOD_CST: TStringField;
    cdsCSTICMS_CFOPPERC_DIFERIMENTO: TFloatField;
    cdsCSTICMS_CFOPPERC_BASE_ICMS_RED: TFloatField;
    cdsCSTICMS_CFOPPERC_TRIBICMS: TFloatField;
    cdsCSTICMS_CFOPCODCFOP: TStringField;
    frxCSTICMS_CFOP: TfrxDBDataset;
    mAuxiliarICMS: TClientDataSet;
    mAuxiliarICMSTipo: TStringField;
    mAuxiliarICMSID_Tipo: TIntegerField;
    mAuxiliarICMSNome: TStringField;
    mAuxiliarICMSID_CFOP: TIntegerField;
    mAuxiliarICMSCod_CFOP: TStringField;
    mAuxiliarICMSCod_CSTICMS: TStringField;
    mAuxiliarICMSID_Lei: TIntegerField;
    mAuxiliarICMSID_CSTICMS: TIntegerField;
    dsmAuxiliarICMS: TDataSource;
    mAuxiliarICMSID_Produto: TIntegerField;
    mAuxiliarICMSNome_Produto: TStringField;
    mAuxiliarICMSReferencia: TStringField;
    mAuxiliarICMSLei_CST: TStringField;
    mAuxiliarICMSLei: TStringField;
    mAuxiliarICMSLei_Cadastro: TStringField;
    frxmAuxiliarICMS: TfrxDBDataset;
    mAuxiliarICMSPerc_Trib: TFloatField;
    mAuxiliarICMSPerc_Diferimento: TFloatField;
    cdsCSTICMS_CFOPHISTORICO: TMemoField;
    mAuxiliarICMSUF: TStringField;
    sdsConsFatConsumo: TSQLDataSet;
    dspConsFatConsumo: TDataSetProvider;
    cdsConsFatConsumo: TClientDataSet;
    frxConsFatConsumo: TfrxDBDataset;
    cdsFatAcumDEV_TROCA: TStringField;
    cdsConsClienteDEV_TROCA: TStringField;
    cdsConsDataDEV_TROCA: TStringField;
    cdsFatAcumVLR_TROCA: TFloatField;
    cdsFatAcumVLR_RATEIO_RECIBO: TFloatField;
    cdsFatAcumVLR_RATEIO_TROCA: TFloatField;
    cdsConsFatConsumoQTD_MATERIAL: TFloatField;
    cdsConsFatConsumoID_MATERIAL: TIntegerField;
    cdsConsFatConsumoID_COR: TIntegerField;
    cdsConsFatConsumoNOME_MATERIAL: TStringField;
    cdsConsFatConsumoNOME_COR_MAT: TStringField;
    cdsConsFatConsumoTIPO_REG: TStringField;
    cdsConsFatConsumoUNIDADE_MAT: TStringField;
    dsConsFatConsumo: TDataSource;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteLOTE_TEXTIL: TStringField;
    sdsConsPedConsumo: TSQLDataSet;
    dspConsPedConsumo: TDataSetProvider;
    cdsConsPedConsumo: TClientDataSet;
    dsConsPedConsumo: TDataSource;
    cdsConsPedConsumoID_MATERIAL: TIntegerField;
    cdsConsPedConsumoNOME_MATERIAL: TStringField;
    cdsConsPedConsumoID_COR: TIntegerField;
    cdsConsPedConsumoNOME_COR_MAT: TStringField;
    cdsConsPedConsumoTOTAL_CONSUMO: TFloatField;
    cdsConsPedConsumoTOTAL_CONSUMO_REST: TFloatField;
    cdsConsPedConsumoTOTAL_CONSUMO_FAT: TFloatField;
    cdsConsPedConsumoTIPO_REG: TStringField;
    cdsConsPedConsumoUNIDADE_MAT: TStringField;
    frxConsPedConsumo: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure cdsComprasServicosCalcFields(DataSet: TDataSet);
    procedure frxComprasServicoItemFirst(Sender: TObject);
    procedure mAuxiliarICMSNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ctFatAcum, ctComprasServico, ctConsCliente, ctCSTICMS_CFOP: String;
    ctConsFatConsumo: String;
    vDataIni, vDataFim: String;
  end;

var
  DMConsFat: TDMConsFat;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsFat.DataModuleCreate(Sender: TObject);
begin
  ctFatAcum        := sdsFatAcum.CommandText;
  ctComprasServico := sdsComprasServicos.CommandText;
  ctConsCliente    := sdsConsCliente.CommandText;
  ctCSTICMS_CFOP   := sdsCSTICMS_CFOP.CommandText;
  ctConsFatConsumo := sdsConsFatConsumo.CommandText;
  cdsFilial.Open;
  cdsCupomTerminal.Open;
end;

procedure TDMConsFat.frxReport1BeforePrint(Sender: TfrxReportComponent);
begin
  TfrxMemoView(frxReport1.FindComponent('Memo2')).Text := 'Per�odo de ' + vDataIni + ' at� ' + vDataFim;
end;

procedure TDMConsFat.cdsComprasServicosCalcFields(DataSet: TDataSet);
begin
  if (cdsComprasServicosCONTA.AsString <> '') and (cdsComprasServicosNOME_CONTA.AsString <> '') then
    cdsComprasServicosCTA_CONTA.AsString := cdsComprasServicosCONTA.AsString + ' - ' + cdsComprasServicosNOME_CONTA.AsString;
end;

procedure TDMConsFat.frxComprasServicoItemFirst(Sender: TObject);
begin
  cdsComprasServico_Item.Close;
  sdsComprasServico_Item.ParamByName('ID').asInteger := cdsComprasServicosID.asinteger;
  sdsComprasServico_Item.ParamByName('TREG').AsString := cdsComprasServicosTIPO_REGISTRO.AsString;
  cdsComprasServico_Item.Open;
end;

procedure TDMConsFat.mAuxiliarICMSNewRecord(DataSet: TDataSet);
begin
  mAuxiliarICMSLei.AsString := '';
  mAuxiliarICMSLei_Cadastro.AsString := '';
  mAuxiliarICMSLei_CST.AsString      := '';
end;

end.
