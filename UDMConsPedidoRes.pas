unit UDMConsPedidoRes;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TDMConsPedidoRes = class(TDataModule)
    sdsConsPedido_Det: TSQLDataSet;
    dspConsPedido_Det: TDataSetProvider;
    cdsConsPedido_Det: TClientDataSet;
    dsConsPedido_Det: TDataSource;
    cdsConsPedido_DetID: TIntegerField;
    cdsConsPedido_DetID_PEDIDO: TIntegerField;
    cdsConsPedido_DetITEM_PEDIDO: TIntegerField;
    cdsConsPedido_DetID_PRODUTO: TIntegerField;
    cdsConsPedido_DetID_COR: TIntegerField;
    cdsConsPedido_DetQTD: TFloatField;
    cdsConsPedido_DetID_LOTE: TIntegerField;
    cdsConsPedido_DetFILIAL: TIntegerField;
    cdsConsPedido_DetTIPO_ES: TStringField;
    cdsConsPedido_DetDATA: TDateField;
    cdsConsPedido_DetQTD2: TFloatField;
    cdsConsPedido_DetDTEMISSAO: TDateField;
    cdsConsPedido_DetID_CLIENTE: TIntegerField;
    cdsConsPedido_DetNOME_CLIENTE: TStringField;
    cdsConsPedido_DetNOME_PRODUTO: TStringField;
    sdsConsProduto_Ped: TSQLDataSet;
    dspConsProduto_Ped: TDataSetProvider;
    cdsConsProduto_Ped: TClientDataSet;
    dsConsProduto_Ped: TDataSource;
    cdsConsProduto_PedQTD: TFloatField;
    cdsConsProduto_PedFILIAL: TIntegerField;
    cdsConsProduto_PedID_PRODUTO: TIntegerField;
    cdsConsProduto_PedID_COR: TIntegerField;
    cdsConsProduto_PedID_PEDIDO: TIntegerField;
    cdsConsProduto_PedITEM_PEDIDO: TIntegerField;
    cdsConsProduto_PedNOME_PRODUTO: TStringField;
    cdsConsProduto_PedREFERENCIA: TStringField;
    cdsConsProduto_PedNOME_CLIENTE: TStringField;
    cdsConsProduto_PedNUM_PEDIDO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctConsProduto_Ped : String;

  end;

var
  DMConsPedidoRes: TDMConsPedidoRes;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsPedidoRes.DataModuleCreate(Sender: TObject);
begin
  ctConsProduto_Ped := sdsConsProduto_Ped.CommandText;
end;

end.
