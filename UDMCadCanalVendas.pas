unit UDMCadCanalVendas;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes;

type
  TDMCadCanalVendas = class(TDataModule)
    sdsCanalVendas: TSQLDataSet;
    dspCanalVendas: TDataSetProvider;
    cdsCanalVendas: TClientDataSet;
    dsCanalVendas: TDataSource;
    sdsCanalVendasID: TIntegerField;
    sdsCanalVendasNOME: TStringField;
    sdsCanalVendasINATIVO: TStringField;
    cdsCanalVendasID: TIntegerField;
    cdsCanalVendasNOME: TStringField;
    cdsCanalVendasINATIVO: TStringField;
    sdsCanalVendasID_TABPRECO: TIntegerField;
    cdsCanalVendasID_TABPRECO: TIntegerField;
    sdsTabPreco: TSQLDataSet;
    dspTabPreco: TDataSetProvider;
    cdsTabPreco: TClientDataSet;
    dsTabPreco: TDataSource;
    cdsTabPrecoID: TIntegerField;
    cdsTabPrecoNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspCanalVendasUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsCanalVendasNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMsg: String;
    ctCommand: String;

    procedure prc_Localizar(ID: Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
  end;

var
  DMCadCanalVendas: TDMCadCanalVendas;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMCadPais }

procedure TDMCadCanalVendas.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsCanalVendas.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('CANAL_VENDAS',0);

  cdsCanalVendas.Insert;
  cdsCanalVendasID.AsInteger := vAux;
end;

procedure TDMCadCanalVendas.prc_Excluir;
begin
  if not(cdsCanalVendas.Active) or (cdsCanalVendas.IsEmpty) then
    exit;
  cdsCanalVendas.Delete;
  cdsCanalVendas.ApplyUpdates(0);
end;

procedure TDMCadCanalVendas.prc_Gravar;
var
  sds: TSQLDataSet;
begin
  vMsg := '';
  if trim(cdsCanalVendasNOME.AsString) = '' then
    vMsg := 'Nome não informado!';
  if vMsg <> '' then
    exit;
  cdsCanalVendas.Post;
  cdsCanalVendas.ApplyUpdates(0);
end;

procedure TDMCadCanalVendas.prc_Localizar(ID: Integer);
begin
  cdsCanalVendas.Close;
  sdsCanalVendas.CommandText := ctCommand;
  if ID <> 0 then
    sdsCanalVendas.CommandText := sdsCanalVendas.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsCanalVendas.Open;
end;

procedure TDMCadCanalVendas.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand := sdsCanalVendas.CommandText;
  cdsTabPreco.Open;
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

procedure TDMCadCanalVendas.dspCanalVendasUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadCanalVendas.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadCanalVendas.cdsCanalVendasNewRecord(DataSet: TDataSet);
begin
  cdsCanalVendasINATIVO.AsString := 'N';
end;

end.
