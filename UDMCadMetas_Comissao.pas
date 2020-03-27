unit UDMCadMetas_Comissao;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, DB, Provider, SqlExpr, LogTypes;

type
  TDMCadMetas_Comissao = class(TDataModule)
    sdsMetas_Comissao: TSQLDataSet;
    dspMetas_Comissao: TDataSetProvider;
    sdsMetas_ComissaoVALOR: TFloatField;
    cdsMetas_Comissao: TClientDataSet;
    cdsMetas_ComissaoVALOR: TFloatField;
    dsMetas_Comissao: TDataSource;
    sdsMetas_ComissaoPERC_COMISSAO: TFloatField;
    cdsMetas_ComissaoPERC_COMISSAO: TFloatField;
    procedure cdsMetas_ComissaoBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
    
  public
    { Public declarations }
  end;

var
  DMCadMetas_Comissao: TDMCadMetas_Comissao;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider;

{$R *.dfm}

procedure TDMCadMetas_Comissao.cdsMetas_ComissaoBeforePost(
  DataSet: TDataSet);
begin
  if StrToFloat(FormatFloat('0.00',cdsMetas_ComissaoVALOR.AsFloat)) <= 0 then
    cdsMetas_Comissao.CancelUpdates;
end;

procedure TDMCadMetas_Comissao.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadMetas_Comissao.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
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

end.
