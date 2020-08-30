unit UDMCompras;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TDMCompras = class(TDataModule)
    sdsEstoque_Compras: TSQLDataSet;
    dspEstoque_Compras: TDataSetProvider;
    cdsEstoque_Compras: TClientDataSet;
    dsEstoque_Compras: TDataSource;
    cdsEstoque_ComprasID: TIntegerField;
    cdsEstoque_ComprasREFERENCIA: TStringField;
    cdsEstoque_ComprasNOME_PRODUTO: TStringField;
    cdsEstoque_ComprasUNIDADE: TStringField;
    cdsEstoque_ComprasESTOQUE: TStringField;
    cdsEstoque_ComprasUSA_PRECO_COR: TStringField;
    cdsEstoque_ComprasUSA_GRADE: TStringField;
    cdsEstoque_ComprasID_COR: TIntegerField;
    cdsEstoque_ComprasNOME_COR: TStringField;
    cdsEstoque_ComprasTIPO_REG: TStringField;
    cdsEstoque_ComprasID_CLIENTE: TIntegerField;
    cdsEstoque_ComprasID_FORNECEDOR: TIntegerField;
    cdsEstoque_ComprasFILIAL_CAD_PROD: TIntegerField;
    cdsEstoque_ComprasID_NCM: TIntegerField;
    cdsEstoque_ComprasQTD_ESTOQUE_MIN: TFloatField;
    cdsEstoque_ComprasTAMANHO: TStringField;
    cdsEstoque_ComprasQTD_OC: TFloatField;
    cdsEstoque_ComprasQTD_PEDIDO: TFloatField;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    dsFilial: TDataSource;
    cdsEstoque_ComprasQTD_ESTOQUE: TFMTBCDField;
    cdsEstoque_ComprasSALDO: TFloatField;
    cdsEstoque_ComprasNCM: TStringField;
    cdsEstoque_ComprasNOME_FORNECEDOR: TStringField;
    cdsEstoque_ComprasSALDO_MIN: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctEstoque_Compras : String;

  end;

var
  DMCompras: TDMCompras;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMCompras.DataModuleCreate(Sender: TObject);
begin
  ctEstoque_Compras := sdsEstoque_Compras.CommandText;
end;

end.
