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
