unit UDMComissaoProd;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TDMComissaoProd = class(TDataModule)
    sdsProduto: TSQLDataSet;
    sdsProdutoID: TIntegerField;
    sdsProdutoREFERENCIA: TStringField;
    sdsProdutoTIPO_REG: TStringField;
    sdsProdutoNOME: TStringField;
    sdsProdutoPERC_COMISSAO: TFloatField;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    cdsProdutoID: TIntegerField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoTIPO_REG: TStringField;
    cdsProdutoNOME: TStringField;
    cdsProdutoPERC_COMISSAO: TFloatField;
    dsProduto: TDataSource;
    sdsProduto_Comissao: TSQLDataSet;
    sdsProduto_ComissaoID: TIntegerField;
    sdsProduto_ComissaoITEM: TIntegerField;
    sdsProduto_ComissaoID_CLIENTE: TIntegerField;
    sdsProduto_ComissaoPERC_COMISSAO: TFloatField;
    sdsProduto_ComissaoNOME: TStringField;
    dspProduto_Comissao: TDataSetProvider;
    cdsProduto_Comissao: TClientDataSet;
    cdsProduto_ComissaoID: TIntegerField;
    cdsProduto_ComissaoITEM: TIntegerField;
    cdsProduto_ComissaoID_CLIENTE: TIntegerField;
    cdsProduto_ComissaoPERC_COMISSAO: TFloatField;
    cdsProduto_ComissaoNOME: TStringField;
    dsProduto_Comissao: TDataSource;
    cdsProduto_Comissao_Vend: TClientDataSet;
    cdsProduto_Comissao_VendID: TIntegerField;
    cdsProduto_Comissao_VendITEM: TIntegerField;
    cdsProduto_Comissao_VendID_VENDEDOR: TIntegerField;
    cdsProduto_Comissao_VendPERC_COMISSAO: TFloatField;
    cdsProduto_Comissao_VendNOME: TStringField;
    dsProduto_Comissao_Vend: TDataSource;
    dspProduto_Comissao_Vend: TDataSetProvider;
    sdsProduto_Comissao_Vend: TSQLDataSet;
    sdsProduto_Comissao_VendID: TIntegerField;
    sdsProduto_Comissao_VendITEM: TIntegerField;
    sdsProduto_Comissao_VendID_VENDEDOR: TIntegerField;
    sdsProduto_Comissao_VendPERC_COMISSAO: TFloatField;
    sdsProduto_Comissao_VendNOME: TStringField;
    sdsprc_Produto_Comissao: TSQLDataSet;
    sdsprc_Produto_Comissao_Dir: TSQLDataSet;
    sdsprc_Produto_Comissao_Vend: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMComissaoProd: TDMComissaoProd;

implementation

uses DmdDatabase;

{$R *.dfm}

end.
