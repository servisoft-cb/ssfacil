unit UDMCadPrevisao_Contas;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes;

type
  TDMCadPrevisao_Contas = class(TDataModule)
    sdsPrevisao_Contas: TSQLDataSet;
    dspPrevisao_Contas: TDataSetProvider;
    cdsPrevisao_Contas: TClientDataSet;
    dsPrevisao_Contas: TDataSource;
    sdsPrevisao_ContasID: TIntegerField;
    sdsPrevisao_ContasNOME: TStringField;
    sdsPrevisao_ContasPARCELA: TIntegerField;
    sdsPrevisao_ContasID_CONTAORCAMENTO: TIntegerField;
    sdsPrevisao_ContasVLR_PREVISAO: TFloatField;
    sdsPrevisao_ContasTIPO: TStringField;
    sdsPrevisao_ContasDTVENCIMENTO: TDateField;
    sdsPrevisao_ContasMES_COMPETENCIA: TIntegerField;
    sdsPrevisao_ContasANO_COMPETENCIA: TIntegerField;
    sdsPrevisao_ContasDTUSUARIO: TDateField;
    sdsPrevisao_ContasUSUARIO: TStringField;
    sdsPrevisao_ContasHRUSUARIO: TTimeField;
    cdsPrevisao_ContasID: TIntegerField;
    cdsPrevisao_ContasNOME: TStringField;
    cdsPrevisao_ContasPARCELA: TIntegerField;
    cdsPrevisao_ContasID_CONTAORCAMENTO: TIntegerField;
    cdsPrevisao_ContasVLR_PREVISAO: TFloatField;
    cdsPrevisao_ContasTIPO: TStringField;
    cdsPrevisao_ContasDTVENCIMENTO: TDateField;
    cdsPrevisao_ContasMES_COMPETENCIA: TIntegerField;
    cdsPrevisao_ContasANO_COMPETENCIA: TIntegerField;
    cdsPrevisao_ContasDTUSUARIO: TDateField;
    cdsPrevisao_ContasUSUARIO: TStringField;
    cdsPrevisao_ContasHRUSUARIO: TTimeField;
    sdsConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    mGerarDup: TClientDataSet;
    mGerarDupDtVencimento: TDateField;
    mGerarDupVlrParcela: TFloatField;
    mGerarDupParcela: TIntegerField;
    dsmGerarDup: TDataSource;
    sdsPrevisao_ContasFILIAL: TIntegerField;
    cdsPrevisao_ContasFILIAL: TIntegerField;
    cdsConsultaID: TIntegerField;
    cdsConsultaNOME: TStringField;
    cdsConsultaPARCELA: TIntegerField;
    cdsConsultaID_CONTAORCAMENTO: TIntegerField;
    cdsConsultaVLR_PREVISAO: TFloatField;
    cdsConsultaTIPO: TStringField;
    cdsConsultaDTVENCIMENTO: TDateField;
    cdsConsultaMES_COMPETENCIA: TIntegerField;
    cdsConsultaANO_COMPETENCIA: TIntegerField;
    cdsConsultaDTUSUARIO: TDateField;
    cdsConsultaUSUARIO: TStringField;
    cdsConsultaHRUSUARIO: TTimeField;
    cdsConsultaFILIAL: TIntegerField;
    cdsConsultaNOME_CONTAORCAMENTO: TStringField;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
    mGerarDupAno: TIntegerField;
    mGerarDupMes: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspPrevisao_ContasUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }
    vMsgPrevisao : String;
    ctCommand : String;
    ctConsulta : String;
    vIDPrevisao_Ini, vIDPrevisao_Fin: Integer;

    procedure prc_Localizar(ID : Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;

    procedure prc_Controle;

  end;

var
  DMCadPrevisao_Contas: TDMCadPrevisao_Contas;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMCadPais }

procedure TDMCadPrevisao_Contas.prc_Inserir;
var
  vAux : Integer;
begin
  if not cdsPrevisao_Contas.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('PREVISAO_CONTAS',0);

  cdsPrevisao_Contas.Insert;
  cdsPrevisao_ContasID.AsInteger := vAux;
  cdsPrevisao_ContasDTUSUARIO.AsDateTime := Date;
  cdsPrevisao_ContasHRUSUARIO.AsDateTime := Now;
  cdsPrevisao_ContasUSUARIO.AsString     := vUsuario;
end;

procedure TDMCadPrevisao_Contas.prc_Excluir;
begin
  if not(cdsPrevisao_Contas.Active) or (cdsPrevisao_Contas.IsEmpty) then
    exit;
  cdsPrevisao_Contas.Delete;
  cdsPrevisao_Contas.ApplyUpdates(0);
end;

procedure TDMCadPrevisao_Contas.prc_Gravar;
begin
  vMsgPrevisao := '';
  if trim(cdsPrevisao_ContasNOME.AsString) = '' then
    vMsgPrevisao := vMsgPrevisao + '*** Nome não foi informado!';
  if cdsPrevisao_ContasDTVENCIMENTO.AsDateTime <= 10 then
    vMsgPrevisao := vMsgPrevisao + '*** Data Vencimento não foi informada!';
  if StrToFloat(FormatFloat('0.00',cdsPrevisao_ContasVLR_PREVISAO.AsFloat)) <= 0 then
    vMsgPrevisao := vMsgPrevisao + '*** Valor não foi informado!';
  if cdsPrevisao_ContasANO_COMPETENCIA.AsInteger <= 0 then
    vMsgPrevisao := vMsgPrevisao + '*** Ano de competência não foi informado!';
  if cdsPrevisao_ContasMES_COMPETENCIA.AsInteger <= 0 then
    vMsgPrevisao := vMsgPrevisao + '*** Mês de competência não foi informado!';
  if vMsgPrevisao <> '' then
    exit;
  cdsPrevisao_Contas.Post;
  cdsPrevisao_Contas.ApplyUpdates(0);
end;

procedure TDMCadPrevisao_Contas.prc_Localizar(ID : Integer);
begin
  cdsPrevisao_Contas.Close;
  sdsPrevisao_Contas.CommandText := ctCommand;
  sdsPrevisao_Contas.CommandText := sdsPrevisao_Contas.CommandText;
  sdsPrevisao_Contas.ParamByName('ID').AsInteger := ID;
  cdsPrevisao_Contas.Open;
end;

procedure TDMCadPrevisao_Contas.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand  := sdsPrevisao_Contas.CommandText;
  ctConsulta := sdsConsulta.CommandText;
  cdsFilial.Open;
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

procedure TDMCadPrevisao_Contas.dspPrevisao_ContasUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadPrevisao_Contas.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadPrevisao_Contas.prc_Controle;
var
  vNome: String;
  vParcelaAux_Fin: Integer;
  vID_ContaOrcamento : Integer;
  vAno_Competencia: Integer;
  vMes_Competencia: Integer;
  vTipo: String;
  vFilialAux: Integer;
begin

  vNome := cdsPrevisao_ContasNOME.AsString;
  vID_ContaOrcamento := cdsPrevisao_ContasID_CONTAORCAMENTO.AsInteger;
  vAno_Competencia := cdsPrevisao_ContasANO_COMPETENCIA.AsInteger;
  vMes_Competencia := cdsPrevisao_ContasMES_COMPETENCIA.AsInteger;
  vTipo            := cdsPrevisao_ContasTIPO.AsString;
  vFilialAux       := cdsPrevisao_ContasFILIAL.AsInteger;
  vIDPrevisao_Ini  := cdsPrevisao_ContasID.AsInteger;
  vIDPrevisao_Fin  := 0;
  
  mGerarDup.Last;
  vParcelaAux_Fin    := mGerarDupParcela.AsInteger;

  mGerarDup.First;
  mGerarDup.Delete;
  while not mGerarDup.Eof do
  begin
    prc_Inserir;
    cdsPrevisao_ContasNOME.AsString := vNome;
    cdsPrevisao_ContasPARCELA.AsInteger := mGerarDupParcela.AsInteger;
    if vID_ContaOrcamento > 0 then
      cdsPrevisao_ContasID_CONTAORCAMENTO.AsInteger := vID_ContaOrcamento;
    cdsPrevisao_ContasVLR_PREVISAO.AsFloat        := StrToFloat(FormatFloat('0.00',mGerarDupVlrParcela.AsFloat));
    cdsPrevisao_ContasTIPO.AsString               := vTipo;
    cdsPrevisao_ContasDTVENCIMENTO.AsDateTime     := mGerarDupDtVencimento.AsDateTime;
    cdsPrevisao_ContasANO_COMPETENCIA.AsInteger   := mGerarDupAno.AsInteger;
    cdsPrevisao_ContasMES_COMPETENCIA.AsInteger   := mGerarDupMes.AsInteger;
    cdsPrevisao_ContasDTUSUARIO.AsDateTime        := Date;
    cdsPrevisao_ContasUSUARIO.AsString            := vUsuario;
    cdsPrevisao_ContasHRUSUARIO.AsDateTime         := now;
    cdsPrevisao_ContasFILIAL.AsInteger            := vFilialAux;
    vIDPrevisao_Fin  := cdsPrevisao_ContasID.AsInteger;

    prc_Gravar;
    mGerarDup.Next;
  end;
end;

end.
