unit UDMComissaoVend;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes,
  frxClass, frxDBSet, frxExportPDF, frxExportMail;

type
  TDMComissaoVend = class(TDataModule)
    sdsProduto_Comissao_Vend: TSQLDataSet;
    dspProduto_Comissao_Vend: TDataSetProvider;
    cdsProduto_Comissao_Vend: TClientDataSet;
    dsProduto_Comissao_Vend: TDataSource;
    sdsProduto_Comissao_VendID: TIntegerField;
    sdsProduto_Comissao_VendITEM: TIntegerField;
    sdsProduto_Comissao_VendID_VENDEDOR: TIntegerField;
    sdsProduto_Comissao_VendPERC_COMISSAO: TFloatField;
    cdsProduto_Comissao_VendID: TIntegerField;
    cdsProduto_Comissao_VendITEM: TIntegerField;
    cdsProduto_Comissao_VendID_VENDEDOR: TIntegerField;
    cdsProduto_Comissao_VendPERC_COMISSAO: TFloatField;
    sdsVendedor: TSQLDataSet;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    dsVendedor: TDataSource;
    cdsVendedorCODIGO: TIntegerField;
    cdsVendedorNOME: TStringField;
    cdsVendedorPERC_COMISSAO: TFloatField;
    dspConsProduto: TDataSetProvider;
    cdsConsProduto: TClientDataSet;
    dsConsProduto: TDataSource;
    cdsConsProdutoID: TIntegerField;
    cdsConsProdutoNOME: TStringField;
    cdsConsProdutoREFERENCIA: TStringField;
    cdsConsProdutoTIPO_PRODUTO: TStringField;
    qProximoItem: TSQLQuery;
    cdsConsProdutoPERC_COMISSAO: TFloatField;
    sdsConsProduto: TSQLDataSet;
    sdsVendCons: TSQLDataSet;
    dspVendCons: TDataSetProvider;
    cdsVendCons: TClientDataSet;
    dsVendCons: TDataSource;
    sdsProdCons: TSQLDataSet;
    dspProdCons: TDataSetProvider;
    cdsProdCons: TClientDataSet;
    dsProdCons: TDataSource;
    cdsVendConsCODIGO: TIntegerField;
    cdsVendConsNOME: TStringField;
    cdsVendConsPERC_COMISSAO: TFloatField;
    cdsProdConsID: TIntegerField;
    cdsProdConsNOME: TStringField;
    cdsProdConsREFERENCIA: TStringField;
    cdsProdConsTIPO_PRODUTO: TStringField;
    cdsProdConsPERC_COMISSAO: TFloatField;
    cdsProdConsID_VENDEDOR: TIntegerField;
    frxReport1: TfrxReport;
    frxMailExport1: TfrxMailExport;
    frxPDFExport1: TfrxPDFExport;
    frxVendCons: TfrxDBDataset;
    frxProdCons: TfrxDBDataset;
    qProximoItemITEM: TIntegerField;
    sdsConsProdFat: TSQLDataSet;
    dspConsProdFat: TDataSetProvider;
    cdsConsProdFat: TClientDataSet;
    dsConsProdFat: TDataSource;
    cdsConsProdFatFILIAL: TIntegerField;
    cdsConsProdFatNUMNOTA: TIntegerField;
    cdsConsProdFatDTEMISSAO: TDateField;
    cdsConsProdFatID_VENDEDOR: TIntegerField;
    cdsConsProdFatID_CLIENTE: TIntegerField;
    cdsConsProdFatPERC_NOTA: TFloatField;
    cdsConsProdFatID_PRODUTO: TIntegerField;
    cdsConsProdFatREFERENCIA: TStringField;
    cdsConsProdFatNOME_PRODUTO: TStringField;
    cdsConsProdFatPERC_ITEM_NOTA: TFloatField;
    cdsConsProdFatNOME_CLIENTE: TStringField;
    cdsConsProdFatNOME_VENDEDOR: TStringField;
    cdsConsProdFatPERC_CADASTRADO: TFloatField;
    cdsConsProdFatNOME_FILIAL: TStringField;
    cdsConsProdFatSERIE: TStringField;
    cdsConsProdFatTIPO_REG: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure frxVendConsNext(Sender: TObject);
    procedure frxVendConsOpen(Sender: TObject);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
    procedure prc_Abrir_ProdCons;

  public
    { Public declarations }
    ctConsProduto : String;
    ctVendCons : String;
    ctConsProdFat : String;
    vTipo_Reg_Cons : String;
  end;

var
  DMComissaoVend: TDMComissaoVend;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

procedure TDMComissaoVend.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  ctConsProduto := sdsConsProduto.CommandText;
  ctVendCons    := sdsVendCons.CommandText;
  ctConsProdFat := sdsConsProdFat.CommandText;
  cdsVendedor.Open;
  //*** Logs Implantado na versão .353
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
  //***********************
end;

procedure TDMComissaoVend.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMComissaoVend.frxVendConsNext(Sender: TObject);
begin
  prc_Abrir_ProdCons;
end;

procedure TDMComissaoVend.prc_Abrir_ProdCons;
begin
  cdsProdCons.Close;
  sdsProdCons.ParamByName('ID_VENDEDOR').AsInteger := cdsVendConsCODIGO.AsInteger;
  if vTipo_Reg_Cons = 'T' then
  begin
    sdsProdCons.ParamByName('TIPO_REG').AsString := 'P';
    sdsProdCons.ParamByName('TIPO_REG2').AsString := 'S';
  end
  else
  if vTipo_Reg_Cons = 'P' then
  begin
    sdsProdCons.ParamByName('TIPO_REG').AsString  := 'P';
    sdsProdCons.ParamByName('TIPO_REG2').AsString := 'P';
  end
  else
  if vTipo_Reg_Cons = 'S' then
  begin
    sdsProdCons.ParamByName('TIPO_REG').AsString  := 'S';
    sdsProdCons.ParamByName('TIPO_REG2').AsString := 'S';
  end;
  cdsProdCons.Open;
end;

procedure TDMComissaoVend.frxVendConsOpen(Sender: TObject);
begin
  prc_Abrir_ProdCons;
end;

end.
