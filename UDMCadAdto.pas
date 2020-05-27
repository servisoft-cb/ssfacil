unit UDMCadAdto;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, LogTypes, frxClass, frxDBSet,
  SqlExpr;

type
  TDMCadAdto = class(TDataModule)
    sdsAdto_Mov: TSQLDataSet;
    dspAdto_Mov: TDataSetProvider;
    cdsAdto_Mov: TClientDataSet;
    dsAdto_Mov: TDataSource;
    sdsConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    sdsPessoa: TSQLDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    dsPessoa: TDataSource;
    dsmEtiquetas: TDataSource;
    frxReport1: TfrxReport;
    sdsAdto_MovID: TIntegerField;
    sdsAdto_MovID_PESSOA: TIntegerField;
    sdsAdto_MovDATA: TDateField;
    sdsAdto_MovVALOR: TFloatField;
    sdsAdto_MovTIPO_ES: TStringField;
    sdsAdto_MovTIPO_MOV: TStringField;
    sdsAdto_MovID_DUPLICATA: TIntegerField;
    sdsAdto_MovID_NOTAFISCAL: TIntegerField;
    sdsAdto_MovID_PEDIDO: TIntegerField;
    sdsAdto_MovOBS: TStringField;
    cdsAdto_MovID: TIntegerField;
    cdsAdto_MovID_PESSOA: TIntegerField;
    cdsAdto_MovDATA: TDateField;
    cdsAdto_MovVALOR: TFloatField;
    cdsAdto_MovTIPO_ES: TStringField;
    cdsAdto_MovTIPO_MOV: TStringField;
    cdsAdto_MovID_DUPLICATA: TIntegerField;
    cdsAdto_MovID_NOTAFISCAL: TIntegerField;
    cdsAdto_MovID_PEDIDO: TIntegerField;
    cdsAdto_MovOBS: TStringField;
    cdsConsultaID: TIntegerField;
    cdsConsultaID_PESSOA: TIntegerField;
    cdsConsultaDATA: TDateField;
    cdsConsultaVALOR: TFloatField;
    cdsConsultaTIPO_ES: TStringField;
    cdsConsultaTIPO_MOV: TStringField;
    cdsConsultaID_DUPLICATA: TIntegerField;
    cdsConsultaID_NOTAFISCAL: TIntegerField;
    cdsConsultaID_PEDIDO: TIntegerField;
    cdsConsultaOBS: TStringField;
    cdsConsultaNOME_PESSOA: TStringField;
    cdsConsultaNUMDUPLICATA: TStringField;
    cdsConsultaNUMNOTA: TIntegerField;
    cdsConsultaSERIE: TStringField;
    cdsPessoaCODIGO: TIntegerField;
    cdsPessoaNOME: TStringField;
    cdsPessoaCNPJ_CPF: TStringField;
    cdsPessoaCIDADE: TStringField;
    cdsPessoaTP_CLIENTE: TStringField;
    cdsPessoaTP_FORNECEDOR: TStringField;
    cdsPessoaFANTASIA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspAdto_MovUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMSGErro: String;
    ctCommand, ctConsulta : String;

    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
    procedure prc_Excluir_Item;
    procedure prc_Inserir_Itens;
  end;

var
  DMCadAdto: TDMCadAdto;

implementation

uses DmdDatabase, Math, uUtilPadrao, LogProvider;

{$R *.dfm}

{ TDMCadCFOP}

procedure TDMCadAdto.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsAdto_Mov.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('ADTO_MOV',0);

  cdsAdto_Mov.Insert;
  cdsAdto_MovID.AsInteger           := vAux;
  cdsAdto_MovDTMOVIMENTO.AsDateTime := Date;
end;

procedure TDMCadAdto.prc_Excluir;
begin
  if not(cdsAdto_Mov.Active) or (cdsAdto_Mov.IsEmpty) then
    exit;
  cdsAdto_Mov.Delete;
  cdsAdto_Mov.ApplyUpdates(0);
end;

procedure TDMCadAdto.prc_Gravar;
begin
  vMsgErro := '';
  if (cdsAdto_MovTIPO_ES.AsString <> 'E') and (cdsAdto_MovTIPO_ES.AsString <> 'S') then
    vMsgErro := vMsgErro + #13 + '*** Tipo Entrada ou Saída não informado!';
  if cdsAdto_MovID_PESSOA.AsInteger <= 0 then
    vMsgErro := vMsgErro + #13 + '*** Pessoa não informada!';
  if cdsAdto_MovDATA.AsDateTime <= 10
    vMsgErro := vMsgErro + #13 + '*** Data não informada!';
  if StrToFloat(FormatFloat('0.00',cdsAdto_MovVALOR.AsFloat)) <= 0 then
    vMsgErro := vMsgErro + #13 + '*** Valor não informado!';
  if trim(vMsgErro) <> '' then
    exit;
  cdsAdto_Mov.Post;
  cdsAdto_Mov.ApplyUpdates(0);
end;

procedure TDMCadAdto.prc_Localizar(ID: Integer); //-1 é para inclusão
begin
  cdsAdto_Mov.Close;
  sdsAdto_Mov.CommandText := ctCommand;
  if ID <> 0 then
    sdsAdto_Mov.CommandText := sdsAdto_Mov.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsAdto_Mov.Open;
end;

procedure TDMCadAdto.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand  := sdsAdto_Mov.CommandText;
  ctConsulta := sdsConsulta.CommandText;
  cdsPessoa.Open;
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

procedure TDMCadAdto.dspAdto_MovUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadAdto.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

end.
