unit UDMANP_Produto;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient, LogTypes;

type
  TDMANP_Produto = class(TDataModule)
    sdsTab_CProd_ANP: TSQLDataSet;
    dspTab_CProd_ANP: TDataSetProvider;
    cdsTab_CProd_ANP: TClientDataSet;
    sdsTab_CProd_ANPCODIGO: TStringField;
    sdsTab_CProd_ANPDESCRICAO: TStringField;
    cdsTab_CProd_ANPCODIGO: TStringField;
    cdsTab_CProd_ANPDESCRICAO: TStringField;
    dsTab_CProd_ANP: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspTab_CProd_ANPGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
  end;

var
  DMANP_Produto: TDMANP_Produto;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider;

{$R *.dfm}

{ TDMANP_Produto }

procedure TDMANP_Produto.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMANP_Produto.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
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

procedure TDMANP_Produto.dspTab_CProd_ANPGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'TAB_CPROD_ANP';
end;

end.
