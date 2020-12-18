unit UDMCadCondPgto;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes;

type
  TDMCadCondPgto = class(TDataModule)
    sdsCondPgto: TSQLDataSet;
    dspCondPgto: TDataSetProvider;
    cdsCondPgto: TClientDataSet;
    dsCondPgto: TDataSource;
    sdsCondPgtoID: TIntegerField;
    sdsCondPgtoNOME: TStringField;
    sdsCondPgtoTIPO: TStringField;
    cdsCondPgtoID: TIntegerField;
    cdsCondPgtoNOME: TStringField;
    cdsCondPgtoTIPO: TStringField;
    dsCondPgto_Mestre: TDataSource;
    sdsCondPgto_Dia: TSQLDataSet;
    sdsCondPgto_DiaID: TIntegerField;
    sdsCondPgto_DiaITEM: TIntegerField;
    sdsCondPgto_DiaQTDDIAS: TIntegerField;
    cdsCondPgto_Dia: TClientDataSet;
    cdsCondPgtosdsCondPgto_Dia: TDataSetField;
    cdsCondPgto_DiaID: TIntegerField;
    cdsCondPgto_DiaITEM: TIntegerField;
    cdsCondPgto_DiaQTDDIAS: TIntegerField;
    dsCondPgto_Dia: TDataSource;
    sdsCondPgtoIMPRIMIR_NFSE: TStringField;
    cdsCondPgtoIMPRIMIR_NFSE: TStringField;
    sdsCondPgtoENTRADA: TStringField;
    cdsCondPgtoENTRADA: TStringField;
    sdsCondPgtoTIPO_CONDICAO: TStringField;
    cdsCondPgtoTIPO_CONDICAO: TStringField;
    sdsCondPgtoQTD_PARCELA: TIntegerField;
    cdsCondPgtoQTD_PARCELA: TIntegerField;
    sdsCondPgtoMOSTRAR_NFCE: TStringField;
    cdsCondPgtoMOSTRAR_NFCE: TStringField;
    sdsCondPgtoPERC_ENTRADA: TFloatField;
    cdsCondPgtoPERC_ENTRADA: TFloatField;
    sdsCondPgto_DiaPERC_PARCELA: TFloatField;
    cdsCondPgto_DiaPERC_PARCELA: TFloatField;
    qParametros_Fin: TSQLQuery;
    qParametros_FinUSA_PERC_CONDPGTO: TStringField;
    qParametros_FinCONDPGTO_FRETE_IMP: TStringField;
    sdsCondPgtoIMPOSTOS: TStringField;
    sdsCondPgtoFRETE: TStringField;
    cdsCondPgtoIMPOSTOS: TStringField;
    cdsCondPgtoFRETE: TStringField;
    sdsCondPgtoINATIVO: TStringField;
    cdsCondPgtoINATIVO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspCondPgtoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsCondPgtoNewRecord(DataSet: TDataSet);
    procedure cdsCondPgtoBeforePost(DataSet: TDataSet);
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
  DMCadCondPgto: TDMCadCondPgto;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMCadPais }

procedure TDMCadCondPgto.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsCondPgto.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('CONDPGTO',0);

  cdsCondPgto.Insert;
  cdsCondPgtoID.AsInteger := vAux;
end;

procedure TDMCadCondPgto.prc_Excluir;
begin
  if not(cdsCondPgto.Active) or (cdsCondPgto.IsEmpty) then
    exit;

  cdsCondPgto_Dia.First;
  while not cdsCondPgto_Dia.Eof do
    cdsCondPgto_Dia.Delete;

  cdsCondPgto.Delete;
  cdsCondPgto.ApplyUpdates(0);
end;

procedure TDMCadCondPgto.prc_Gravar;
var
  vAux : Real;
begin
  vMsgErro := '';
  if (cdsCondPgtoTIPO.AsString = 'V') or (cdsCondPgtoTIPO_CONDICAO.AsString = 'F') then
  begin
    if (cdsCondPgtoTIPO.AsString = 'V') then
      cdsCondPgtoTIPO_CONDICAO.AsString := '';
    cdsCondPgto_Dia.First;
    while not cdsCondPgto_Dia.Eof do
      cdsCondPgto_Dia.Delete;
  end
  else
  if qParametros_FinUSA_PERC_CONDPGTO.AsString = 'S' then
  begin
    vAux := StrToFloat(FormatFloat('0.00',cdsCondPgtoPERC_ENTRADA.AsFloat));
    cdsCondPgto_Dia.First;
    while not cdsCondPgto_Dia.Eof do
    begin
      vAux := StrToFloat(FormatFloat('0.00',vAux + cdsCondPgto_DiaPERC_PARCELA.AsFloat));
      cdsCondPgto_Dia.Next;
    end;
    //if (StrToFloat(FormatFloat('0.00',vAux)) > 0) and (StrToFloat(FormatFloat('0.00',vAux)) <> StrToFloat(FormatFloat('0.00',100))) then
    //  vMsgErro := vMsgErro + #13 + '*** % Diferente de 100!';
  end;
  if trim(cdsCondPgtoNOME.AsString) = '' then
    vMsgErro := vMsgErro + #13 + '*** Nome n�o informado!';
  if trim(cdsCondPgtoTIPO.AsString) = '' then
    vMsgErro := vMsgErro + #13 + '*** Tipo n�o informado!';
  if (cdsCondPgtoTIPO.AsString = 'P') and (cdsCondPgto_Dia.RecordCount < 1) and (cdsCondPgtoTIPO_CONDICAO.AsString = 'V') then
    vMsgErro := vMsgErro + #13 + '*** Dias n�o informados!';
  if (cdsCondPgtoTIPO.AsString = 'P') and (cdsCondPgtoTIPO_CONDICAO.AsString = 'F') and (cdsCondPgtoQTD_PARCELA.AsInteger < 1) then
    vMsgErro := vMsgErro + #13 + '*** Qtd. de parcelas n�o informada!';
  if (cdsCondPgtoTIPO.AsString = 'V') and (cdsCondPgto_Dia.RecordCount > 0) then
    vMsgErro := vMsgErro + #13 + '*** Quando for A Vista n�o podem ser informados Dias!';
  if (cdsCondPgtoTIPO.AsString = 'P') and (trim(cdsCondPgtoTIPO_CONDICAO.AsString) = '') then
    vMsgErro := vMsgErro + #13 + '*** Tipo da condi��o n�o foi informada!';
  if vMsgErro <> '' then
    exit;
    
  cdsCondPgto.Post;
  cdsCondPgto.ApplyUpdates(0);
end;

procedure TDMCadCondPgto.prc_Localizar(ID: Integer);
begin
  cdsCondPgto.Close;
  sdsCondPgto.CommandText := ctCommand;
  if ID <> 0 then
    sdsCondPgto.CommandText := sdsCondPgto.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsCondPgto.Open;
end;

procedure TDMCadCondPgto.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand := sdsCondPgto.CommandText;
  qParametros_Fin.Open;
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

procedure TDMCadCondPgto.dspCondPgtoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadCondPgto.cdsCondPgtoNewRecord(DataSet: TDataSet);
begin
  cdsCondPgtoENTRADA.AsString       := 'N';
  cdsCondPgtoIMPRIMIR_NFSE.AsString := 'N';
  cdsCondPgtoMOSTRAR_NFCE.AsString  := 'N';
  cdsCondPgtoIMPOSTOS.AsString      := 'N';
  cdsCondPgtoFRETE.AsString         := 'N';
  cdsCondPgtoINATIVO.AsString       := 'N';
end;

procedure TDMCadCondPgto.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadCondPgto.cdsCondPgtoBeforePost(DataSet: TDataSet);
begin
  if cdsCondPgtoQTD_PARCELA.IsNull then
    cdsCondPgtoQTD_PARCELA.AsInteger := 0;
  if cdsCondPgtoPERC_ENTRADA.IsNull then
    cdsCondPgtoPERC_ENTRADA.AsInteger := 0;
end;

end.
