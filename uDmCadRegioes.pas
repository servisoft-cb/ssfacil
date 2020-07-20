unit UDmCadRegioes;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes;

type
  TdmCadRegioes = class(TDataModule)
    sdsRegiao_Venda: TSQLDataSet;
    dspRegiao_Venda: TDataSetProvider;
    cdsRegiao_Venda: TClientDataSet;
    dsRegiao_Venda: TDataSource;
    sdsRegiao_VendaID: TIntegerField;
    sdsRegiao_VendaNOME: TStringField;
    cdsRegiao_VendaID: TIntegerField;
    cdsRegiao_VendaNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspRegiao_VendaUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMsgCNAE: String;
    ctCommand: String;

    procedure prc_Localizar(ID: Integer); //-1 = Inclus�o
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
  end;

var
  dmCadRegioes: TdmCadRegioes;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMCadPais }

procedure TdmCadRegioes.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsCNAE.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('CNAE',0);

  cdsCNAE.Insert;
  cdsCNAEID.AsInteger := vAux;
end;

procedure TdmCadRegioes.prc_Excluir;
begin
  if not(cdsCNAE.Active) or (cdsCNAE.IsEmpty) then
    exit;
  cdsCNAE.Delete;
  cdsCNAE.ApplyUpdates(0);
end;

procedure TdmCadRegioes.prc_Gravar;
begin
  vMsgCNAE := '';
  if trim(cdsCNAENOME.AsString) = '' then
    vMsgCNAE := 'Nome n�o informado!';
  if (trim(cdsCNAECODIGO.AsString) = '') then
    vMsgCNAE := vMsgCNAE + #13 + 'C�digo do CNAE n�o informado!';
  if vMsgCNAE <> '' then
    exit;
    
  cdsCNAE.Post;
  cdsCNAE.ApplyUpdates(0);
end;

procedure TdmCadRegioes.prc_Localizar(ID: Integer);
begin
  cdsCNAE.Close;
  sdsCNAE.CommandText := ctCommand;
  if ID <> 0 then
    sdsCNAE.CommandText := sdsCNAE.CommandText +
                            ' WHERE ID = ' + IntToStr(ID);
  cdsCNAE.Open;
end;

procedure TdmCadRegioes.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand := sdsCNAE.CommandText;
  //*** Logs Implantado na vers�o .353
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

procedure TdmCadRegioes.dspRegiao_VendaUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TdmCadRegioes.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

end.
