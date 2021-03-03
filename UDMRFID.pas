unit UDMRFID;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr, LogTypes;

type
  TDMRFID = class(TDataModule)
    sdsNotaFiscal_RFID: TSQLDataSet;
    sdsNotaFiscal_RFIDID: TIntegerField;
    sdsNotaFiscal_RFIDITEM_NOTA: TIntegerField;
    sdsNotaFiscal_RFIDITEM_RFID: TIntegerField;
    sdsNotaFiscal_RFIDFILIAL: TIntegerField;
    sdsNotaFiscal_RFIDSEQUENCIA: TFMTBCDField;
    sdsNotaFiscal_RFIDQTD: TFloatField;
    sdsNotaFiscal_RFIDUNIDADE: TStringField;
    sdsNotaFiscal_RFIDNUM_RFID: TStringField;
    dspNotaFiscal_RFID: TDataSetProvider;
    cdsNotaFiscal_RFID: TClientDataSet;
    cdsNotaFiscal_RFIDID: TIntegerField;
    cdsNotaFiscal_RFIDITEM_NOTA: TIntegerField;
    cdsNotaFiscal_RFIDITEM_RFID: TIntegerField;
    cdsNotaFiscal_RFIDFILIAL: TIntegerField;
    cdsNotaFiscal_RFIDSEQUENCIA: TFMTBCDField;
    cdsNotaFiscal_RFIDQTD: TFloatField;
    cdsNotaFiscal_RFIDUNIDADE: TStringField;
    cdsNotaFiscal_RFIDNUM_RFID: TStringField;
    sdsNotaFiscal_RFIDCNPJ_FILIAL: TStringField;
    cdsNotaFiscal_RFIDCNPJ_FILIAL: TStringField;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    sdsProdutoID: TIntegerField;
    sdsProdutoQTD_POR_ROTULO: TFloatField;
    cdsProdutoID: TIntegerField;
    cdsProdutoQTD_POR_ROTULO: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }
  end;

var
  DMRFID: TDMRFID;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMRFID }

procedure TDMRFID.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMRFID.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
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
end;

end.
