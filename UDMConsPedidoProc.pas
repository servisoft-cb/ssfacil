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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConsPedidoProc: TDMConsPedidoProc;

implementation

uses DmdDatabase;

{$R *.dfm}

end.
