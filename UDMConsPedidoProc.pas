unit UDMConsPedidoProc;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TDMConsPedidoProc = class(TDataModule)
    sdsConsPedidoProc: TSQLDataSet;
    dspConsPedidoProc: TDataSetProvider;
    cdsConsPedidoProc: TClientDataSet;
    dsConsPedidoProc: TDataSource;
    cdsConsPedidoProcID: TIntegerField;
    cdsConsPedidoProcITEM: TIntegerField;
    cdsConsPedidoProcITEM_PROCESSO: TIntegerField;
    cdsConsPedidoProcID_PROCESSO: TIntegerField;
    cdsConsPedidoProcID_PRODUTO: TIntegerField;
    cdsConsPedidoProcREFERENCIA: TStringField;
    cdsConsPedidoProcNOMEPRODUTO: TStringField;
    cdsConsPedidoProcQTD: TFloatField;
    cdsConsPedidoProcQTD_RESTANTE: TFloatField;
    cdsConsPedidoProcQTD_FATURADO: TFloatField;
    cdsConsPedidoProcCOMPRIMENTO: TFloatField;
    cdsConsPedidoProcLARGURA: TFloatField;
    cdsConsPedidoProcESPESSURA: TFloatField;
    cdsConsPedidoProcALTURA: TFloatField;
    cdsConsPedidoProcDIAMETRO: TFloatField;
    cdsConsPedidoProcCOMPLEMENTO_NOME: TStringField;
    cdsConsPedidoProcTIPO_MAT: TStringField;
    cdsConsPedidoProcTIPO_ORCAMENTO: TStringField;
    cdsConsPedidoProcNUM_PEDIDO: TIntegerField;
    cdsConsPedidoProcID_CLIENTE: TIntegerField;
    cdsConsPedidoProcDTEMISSAO: TDateField;
    cdsConsPedidoProcVLR_UNITARIO: TFloatField;
    cdsConsPedidoProcVLR_TOTAL: TFloatField;
    cdsConsPedidoProcNOME_CLIENTE: TStringField;
    cdsConsPedidoProcNOME_PROCESSO: TStringField;
    sdsConsPedido: TSQLDataSet;
    dspConsPedido: TDataSetProvider;
    cdsConsPedido: TClientDataSet;
    dsConsPedido: TDataSource;
    cdsConsPedidoID: TIntegerField;
    cdsConsPedidoNUM_PEDIDO: TIntegerField;
    cdsConsPedidoDTEMISSAO: TDateField;
    cdsConsPedidoID_CLIENTE: TIntegerField;
    cdsConsPedidoNOME_CLIENTE: TStringField;
    cdsConsPedidoDTENTREGA: TDateField;
    cdsConsPedidoUSUARIO: TStringField;
    cdsConsPedidoID_VENDEDOR: TIntegerField;
    cdsConsPedidoNOME_VENDEDOR: TStringField;
    cdsConsPedidoCONTADOR_ITENS: TIntegerField;
    cdsConsPedidoCONTADOR_INICIADO: TIntegerField;
    cdsConsPedidoCONTADOR_ENCERRADO: TIntegerField;
    sdsVendedor: TSQLDataSet;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    dsVendedor: TDataSource;
    cdsVendedorCODIGO: TIntegerField;
    cdsVendedorNOME: TStringField;
    cdsVendedorCNPJ_CPF: TStringField;
    qPedido_Item_Proc: TSQLQuery;
    qPedido_Item_ProcCONTADOR_PROC: TIntegerField;
    cdsConsPedidoPROCESSO_01: TIntegerField;
    cdsConsPedidoPROCESSO_02: TIntegerField;
    cdsConsPedidoPROCESSO_03: TIntegerField;
    cdsConsPedidoPROCESSO_04: TIntegerField;
    cdsConsPedidoPROCESSO_05: TIntegerField;
    cdsConsPedidoPROCESSO_06: TIntegerField;
    cdsConsPedidoPROCESSO_07: TIntegerField;
    cdsConsPedidoPROCESSO_08: TIntegerField;
    cdsConsPedidoPROCESSO_09: TIntegerField;
    cdsConsPedidoPROCESSO_10: TIntegerField;
    sdsConsItens: TSQLDataSet;
    dspConsItens: TDataSetProvider;
    cdsConsItens: TClientDataSet;
    dsConsItens: TDataSource;
    cdsConsItensID: TIntegerField;
    cdsConsItensITEM: TIntegerField;
    cdsConsItensID_PRODUTO: TIntegerField;
    cdsConsItensREFERENCIA: TStringField;
    cdsConsItensNOMEPRODUTO: TStringField;
    cdsConsItensCOMPLEMENTO_NOME: TStringField;
    cdsConsItensQTD: TFloatField;
    cdsConsItensQTD_RESTANTE: TFloatField;
    cdsConsItensQTD_FATURADO: TFloatField;
    cdsConsItensCOMPRIMENTO: TFloatField;
    cdsConsItensLARGURA: TFloatField;
    cdsConsItensALTURA: TFloatField;
    cdsConsItensVLR_KG: TFloatField;
    cdsConsItensESPESSURA: TFloatField;
    cdsConsItensTIPO_MAT: TStringField;
    cdsConsItensID_CHAPA: TIntegerField;
    cdsConsItensVLR_DOBRA: TFloatField;
    cdsConsItensPROCESSO_01: TIntegerField;
    cdsConsItensPROCESSO_02: TIntegerField;
    cdsConsItensPROCESSO_03: TIntegerField;
    cdsConsItensPROCESSO_04: TIntegerField;
    cdsConsItensPROCESSO_05: TIntegerField;
    cdsConsItensPROCESSO_06: TIntegerField;
    cdsConsItensPROCESSO_07: TIntegerField;
    cdsConsItensPROCESSO_08: TIntegerField;
    cdsConsItensPROCESSO_09: TIntegerField;
    cdsConsItensPROCESSO_10: TIntegerField;
    SQLDataSet1: TSQLDataSet;
    cdsConsPedidoPROCESSO_01_A: TIntegerField;
    cdsConsPedidoPROCESSO_02_A: TIntegerField;
    cdsConsPedidoPROCESSO_03_A: TIntegerField;
    cdsConsPedidoPROCESSO_04_A: TIntegerField;
    cdsConsPedidoPROCESSO_05_A: TIntegerField;
    cdsConsPedidoPROCESSO_06_A: TIntegerField;
    cdsConsPedidoPROCESSO_07_A: TIntegerField;
    cdsConsPedidoPROCESSO_08_A: TIntegerField;
    cdsConsPedidoPROCESSO_09_A: TIntegerField;
    cdsConsPedidoPROCESSO_10_A: TIntegerField;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsConsItensOBS_REDUZIDA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctConsPedido: String;

  end;

var
  DMConsPedidoProc: TDMConsPedidoProc;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsPedidoProc.DataModuleCreate(Sender: TObject);
begin
  ctConsPedido := sdsConsPedido.CommandText;
end;

end.
