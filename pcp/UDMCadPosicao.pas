unit UDMCadPosicao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes;

type
  TDMCadPosicao = class(TDataModule)
    sdsPosicao: TSQLDataSet;
    dspPosicao: TDataSetProvider;
    cdsPosicao: TClientDataSet;
    dsPosicao: TDataSource;
    sdsPosicaoID: TIntegerField;
    sdsPosicaoNOME: TStringField;
    sdsPosicaoIMP_TALAO: TStringField;
    cdsPosicaoID: TIntegerField;
    cdsPosicaoNOME: TStringField;
    cdsPosicaoIMP_TALAO: TStringField;
    sdsPosicaoIMP_MATERIAL: TStringField;
    sdsPosicaoIMP_AGRUPADO_MATERIAL: TStringField;
    cdsPosicaoIMP_MATERIAL: TStringField;
    cdsPosicaoIMP_AGRUPADO_MATERIAL: TStringField;
    sdsPosicaoGERAR_TALAO: TStringField;
    sdsPosicaoTALAO_LIMITE_QTD: TStringField;
    sdsPosicaoQTD_LIMITE: TIntegerField;
    cdsPosicaoGERAR_TALAO: TStringField;
    cdsPosicaoTALAO_LIMITE_QTD: TStringField;
    cdsPosicaoQTD_LIMITE: TIntegerField;
    sdsPosicaoPRIMEIRO_MAT: TStringField;
    cdsPosicaoPRIMEIRO_MAT: TStringField;
    sdsPosicaoID_SETOR: TIntegerField;
    cdsPosicaoID_SETOR: TIntegerField;
    sdsSetor: TSQLDataSet;
    dspSetor: TDataSetProvider;
    cdsSetor: TClientDataSet;
    dsSetor: TDataSource;
    cdsSetorID: TIntegerField;
    cdsSetorNOME: TStringField;
    sdsPosicaoUSA_PROCESSO: TStringField;
    cdsPosicaoUSA_PROCESSO: TStringField;
    dsPosicao_Mestre: TDataSource;
    sdsPosicao_Proc: TSQLDataSet;
    sdsPosicao_ProcID: TIntegerField;
    sdsPosicao_ProcITEM: TIntegerField;
    sdsPosicao_ProcID_PROCESSO: TIntegerField;
    cdsPosicaosdsPosicao_Proc: TDataSetField;
    cdsPosicao_Proc: TClientDataSet;
    cdsPosicao_ProcID: TIntegerField;
    cdsPosicao_ProcITEM: TIntegerField;
    cdsPosicao_ProcID_PROCESSO: TIntegerField;
    dsPosicao_Proc: TDataSource;
    sdsProcesso: TSQLDataSet;
    dspProcesso: TDataSetProvider;
    cdsProcesso: TClientDataSet;
    dsProcesso: TDataSource;
    cdsProcessoID: TIntegerField;
    cdsProcessoNOME: TStringField;
    sdsPosicao_ProcNOME_PROCESSO: TStringField;
    cdsPosicao_ProcNOME_PROCESSO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspPosicaoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsPosicaoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }
    vMsgErro: String;
    ctCommand: String;

    procedure prc_Localizar(ID: Integer); //-1 = Inclus�o
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;

  end;

var
  DMCadPosicao: TDMCadPosicao;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMCadPais }

procedure TDMCadPosicao.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsPosicao.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('POSICAO',0);

  cdsPosicao.Insert;
  cdsPosicaoID.AsInteger := vAux;
end;

procedure TDMCadPosicao.prc_Excluir;
begin
  if not(cdsPosicao.Active) or (cdsPosicao.IsEmpty) then
    exit;
  cdsPosicao_Proc.First;
  while not cdsPosicao_Proc.Eof do
    cdsPosicao_Proc.Delete;
  cdsPosicao.Delete;
  cdsPosicao.ApplyUpdates(0);
end;

procedure TDMCadPosicao.prc_Gravar;
begin
  vMsgErro := '';
  if trim(cdsPosicaoNOME.AsString) = '' then
    vMsgErro := '*** Nome n�o informado!';
  if vMsgErro <> '' then
    exit;
    
  cdsPosicao.Post;
  cdsPosicao.ApplyUpdates(0);
end;

procedure TDMCadPosicao.prc_Localizar(ID: Integer);
begin
  cdsPosicao.Close;
  sdsPosicao.CommandText := ctCommand;
  if ID <> 0 then
    sdsPosicao.CommandText := sdsPosicao.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsPosicao.Open;
end;

procedure TDMCadPosicao.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand := sdsPosicao.CommandText;

  cdsSetor.Open;
  cdsProcesso.Open;

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

procedure TDMCadPosicao.dspPosicaoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadPosicao.cdsPosicaoNewRecord(DataSet: TDataSet);
begin
  cdsPosicaoIMP_TALAO.AsString    := 'N';
  cdsPosicaoUSA_PROCESSO.AsString := 'N';
  cdsPosicaoGERAR_TALAO.AsString  := 'N';
  cdsPosicaoIMP_AGRUPADO_MATERIAL.AsString := 'N';
  cdsPosicaoIMP_MATERIAL.AsString          := 'N';
  cdsPosicaoPRIMEIRO_MAT.AsString          := 'N';
end;

procedure TDMCadPosicao.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

end.
