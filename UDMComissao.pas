unit UDMComissao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, frxClass,
  frxDBSet;

type
  TDMComissao = class(TDataModule)
    sdsComissao: TSQLDataSet;
    dspComissao: TDataSetProvider;
    cdsComissao: TClientDataSet;
    dsComissao: TDataSource;
    cdsComissaoID_VENDEDOR: TIntegerField;
    cdsComissaoVLR_TOTAL: TFloatField;
    cdsComissaoNOME_VENDEDOR: TStringField;
    cdsComissaoPERC_COMISSAO: TFloatField;
    cdsComissaoclVlr_Comissao: TFloatField;
    sdsVendedor: TSQLDataSet;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    dsVendedor: TDataSource;
    cdsVendedorCODIGO: TIntegerField;
    cdsVendedorNOME: TStringField;
    sdsComissao_Det: TSQLDataSet;
    dspComissao_Det: TDataSetProvider;
    cdsComissao_Det: TClientDataSet;
    dsComissao_Det: TDataSource;
    cdsComissao_DetID_VENDEDOR: TIntegerField;
    cdsComissao_DetVLR_TOTAL: TFloatField;
    cdsComissao_DetNOME_VENDEDOR: TStringField;
    cdsComissao_DetNUMCUPOM: TIntegerField;
    cdsComissao_DetDTEMISSAO: TDateField;
    cdsComissao_DetTIPO: TStringField;
    cdsComissao_DetNOME_CLIENTE: TStringField;
    cdsComissao_DetID: TIntegerField;
    cdsComissao_DetSERIE: TStringField;
    cdsComissao_DetTERMINAL_ID: TSmallintField;
    frxReport1: TfrxReport;
    frxComissao: TfrxDBDataset;
    frxComissao_Det: TfrxDBDataset;
    procedure cdsComissaoCalcFields(DataSet: TDataSet);
    procedure frxComissaoFirst(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vImp_Cupom : Boolean;
    vDtInicial, vDtFinal : TDateTime;

  end;

var
  DMComissao: TDMComissao;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMComissao.cdsComissaoCalcFields(DataSet: TDataSet);
begin
  cdsComissaoclVlr_Comissao.AsFloat := 0;
  if (StrToFloat(FormatFloat('0.00',cdsComissaoVLR_TOTAL.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',cdsComissaoPERC_COMISSAO.AsFloat)) > 0) then
    cdsComissaoclVlr_Comissao.AsFloat := StrToFloat(FormatFloat('0.00',(cdsComissaoVLR_TOTAL.AsFloat * cdsComissaoPERC_COMISSAO.AsFloat) / 100));
end;

procedure TDMComissao.frxComissaoFirst(Sender: TObject);
begin
  if vImp_Cupom then
  begin
    cdsComissao_Det.Close;
    sdsComissao_Det.ParamByName('DATA1').AsDate := vDtInicial;
    sdsComissao_Det.ParamByName('DATA2').AsDate := vDtFinal;
    sdsComissao_Det.ParamByName('ID_VENDEDOR').AsInteger := cdsComissaoID_VENDEDOR.AsInteger;
    cdsComissao_Det.Open;
  end;

end;

end.
