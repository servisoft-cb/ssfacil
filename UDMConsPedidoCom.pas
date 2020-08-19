unit UDMConsPedidoCom;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, frxClass,
  frxDBSet, frxExportPDF;

type
  TDMConsPedidoCom = class(TDataModule)
    sdsConsPedido: TSQLDataSet;
    dspConsPedido: TDataSetProvider;
    cdsConsPedido: TClientDataSet;
    dsConsPedido: TDataSource;
    cdsConsPedidoID_PEDIDO: TIntegerField;
    cdsConsPedidoID_CLIENTE: TIntegerField;
    cdsConsPedidoDTEMISSAO: TDateField;
    cdsConsPedidoDTENTREGA: TDateField;
    cdsConsPedidoID_CONDPGTO: TIntegerField;
    cdsConsPedidoID_TIPO_COBRANCA: TIntegerField;
    cdsConsPedidoNOME_CLIENTE: TStringField;
    cdsConsPedidoFANTASIA: TStringField;
    cdsConsPedidoFILIAL: TIntegerField;
    cdsConsPedidoNOME_CONDPAGTO: TStringField;
    cdsConsPedidoNOME_TIPO_COBRANCA: TStringField;
    cdsConsPedidoNUM_PEDIDO: TIntegerField;
    cdsConsPedidoTIPO_PRAZO: TStringField;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxConsPedido: TfrxDBDataset;
    cdsConsPedidoDESC_PRAZO: TStringField;
    cdsConsPedidoQTD: TFloatField;
    cdsConsPedidoVLR_ITENS: TFloatField;
    cdsConsPedidoVLR_DESCONTO: TFloatField;
    cdsConsPedidoVLR_TOTAL: TFloatField;
    cdsConsPedidoAMOSTRA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctConsPedido : String;

  end;

var
  DMConsPedidoCom: TDMConsPedidoCom;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsPedidoCom.DataModuleCreate(Sender: TObject);
begin
  ctConsPedido := sdsConsPedido.CommandText;
end;

end.
