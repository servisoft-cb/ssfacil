unit UDMCadTipoCobranca;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes;

type
  TDMCadTipoCobranca = class(TDataModule)
    sdsTipoCobranca: TSQLDataSet;
    dspTipoCobranca: TDataSetProvider;
    cdsTipoCobranca: TClientDataSet;
    dsTipoCobranca: TDataSource;
    sdsTipoCobrancaID: TIntegerField;
    sdsTipoCobrancaNOME: TStringField;
    sdsTipoCobrancaDESCONTADO: TStringField;
    sdsTipoCobrancaDEPOSITO: TStringField;
    sdsTipoCobrancaGERARBOLETO: TStringField;
    sdsTipoCobrancaQTDDIAS: TIntegerField;
    sdsTipoCobrancaCARTAOCREDITO: TStringField;
    sdsTipoCobrancaCHEQUE: TStringField;
    sdsTipoCobrancaDINHEIRO: TStringField;
    sdsTipoCobrancaMOSTRARNOCUPOM: TStringField;
    cdsTipoCobrancaID: TIntegerField;
    cdsTipoCobrancaNOME: TStringField;
    cdsTipoCobrancaDESCONTADO: TStringField;
    cdsTipoCobrancaDEPOSITO: TStringField;
    cdsTipoCobrancaGERARBOLETO: TStringField;
    cdsTipoCobrancaQTDDIAS: TIntegerField;
    cdsTipoCobrancaCARTAOCREDITO: TStringField;
    cdsTipoCobrancaCHEQUE: TStringField;
    cdsTipoCobrancaDINHEIRO: TStringField;
    cdsTipoCobrancaMOSTRARNOCUPOM: TStringField;
    sdsTipoCobrancaCARTAODEBITO: TStringField;
    cdsTipoCobrancaCARTAODEBITO: TStringField;
    sdsTipoCobrancaCOD_IMP_FISCAL: TStringField;
    cdsTipoCobrancaCOD_IMP_FISCAL: TStringField;
    sdsTipoCobrancaGERAR_NFCE: TStringField;
    cdsTipoCobrancaGERAR_NFCE: TStringField;
    qParametros: TSQLQuery;
    qParametrosIMPRESSORA_FISCAL: TStringField;
    sdsTipoCobrancaABRE_GAVETA: TStringField;
    sdsTipoCobrancaEXIGE_CLIENTE: TStringField;
    cdsTipoCobrancaABRE_GAVETA: TStringField;
    cdsTipoCobrancaEXIGE_CLIENTE: TStringField;
    sdsTipoCobrancaIMPRIME_CARNE: TStringField;
    cdsTipoCobrancaIMPRIME_CARNE: TStringField;
    sdsTipoCobrancaCREDITO_LOJA: TStringField;
    cdsTipoCobrancaCREDITO_LOJA: TStringField;
    sdsTipoCobrancaPRECO_AVISTA: TStringField;
    cdsTipoCobrancaPRECO_AVISTA: TStringField;
    sdsTipoCobrancaENVIAR_APLICATIVO: TStringField;
    cdsTipoCobrancaENVIAR_APLICATIVO: TStringField;
    sdsTipoCobrancaVALE_ALIMENTACAO: TStringField;
    sdsTipoCobrancaVALE_REFEICAO: TStringField;
    sdsTipoCobrancaVALE_PRESENTE: TStringField;
    sdsTipoCobrancaVALE_COMBUSTIVEL: TStringField;
    sdsTipoCobrancaOUTROS: TStringField;
    cdsTipoCobrancaVALE_ALIMENTACAO: TStringField;
    cdsTipoCobrancaVALE_REFEICAO: TStringField;
    cdsTipoCobrancaVALE_PRESENTE: TStringField;
    cdsTipoCobrancaVALE_COMBUSTIVEL: TStringField;
    cdsTipoCobrancaOUTROS: TStringField;
    sdsTipoCobrancaFATURAMENTO_LIQUIDO: TStringField;
    sdsTipoCobrancaFATURAMENTO_BRUTO: TStringField;
    cdsTipoCobrancaFATURAMENTO_LIQUIDO: TStringField;
    cdsTipoCobrancaFATURAMENTO_BRUTO: TStringField;
    sdsTipoCobrancaFECHAMENTO_AUTOMATICO: TStringField;
    cdsTipoCobrancaFECHAMENTO_AUTOMATICO: TStringField;
    sdsTipoCobrancaPERC_JUROS: TFloatField;
    cdsTipoCobrancaPERC_JUROS: TFloatField;
    sdsTipoCobrancaTAXA: TFloatField;
    sdsTipoCobrancaTAXA_TIPO: TStringField;
    cdsTipoCobrancaTAXA: TFloatField;
    cdsTipoCobrancaTAXA_TIPO: TStringField;
    dsMestre: TDataSource;
    sdsTipoCobranca_Itens: TSQLDataSet;
    cdsTipoCobranca_Itens: TClientDataSet;
    dsTipoCobranca_Itens: TDataSource;
    sdsTipoCobranca_ItensID: TIntegerField;
    sdsTipoCobranca_ItensITEM: TIntegerField;
    sdsTipoCobranca_ItensID_CONDPAGTO: TIntegerField;
    cdsTipoCobrancasdsTipoCobranca_Itens: TDataSetField;
    cdsTipoCobranca_ItensID: TIntegerField;
    cdsTipoCobranca_ItensITEM: TIntegerField;
    cdsTipoCobranca_ItensID_CONDPAGTO: TIntegerField;
    sdsCondPagto: TSQLDataSet;
    dspCondPagto: TDataSetProvider;
    cdsCondPagto: TClientDataSet;
    dsCondPagto: TDataSource;
    sdsCondPagtoID: TIntegerField;
    sdsCondPagtoNOME: TStringField;
    cdsCondPagtoID: TIntegerField;
    cdsCondPagtoNOME: TStringField;
    cdsTipoCobranca_ItensNome_CondPagto: TStringField;
    sdsTipoCobrancaJUROS_TIPO: TStringField;
    cdsTipoCobrancaJUROS_TIPO: TStringField;
    sdsTipoCobrancaFORMA_PGTO: TStringField;
    cdsTipoCobrancaFORMA_PGTO: TStringField;
    sdsTipoCobrancaTROCA: TStringField;
    cdsTipoCobrancaTROCA: TStringField;
    sdsTipoCobrancaPADRAO_NFC: TStringField;
    cdsTipoCobrancaPADRAO_NFC: TStringField;
    sdsTipoCobrancaMOSTRAR_APP: TStringField;
    cdsTipoCobrancaMOSTRAR_APP: TStringField;
    sdsTipoCobrancaRECIBO_TROCA: TStringField;
    cdsTipoCobrancaRECIBO_TROCA: TStringField;
    sdsTipoCobrancaCASHBACK: TStringField;
    cdsTipoCobrancaCASHBACK: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspTipoCobrancaUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsTipoCobrancaNewRecord(DataSet: TDataSet);
    procedure cdsTipoCobranca_ItensCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMsgErro : String;
    ctCommand : String;
    procedure prc_Localizar(ID : Integer); //-1 = Inclus�o
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
    procedure prc_Inserir_CondPgto;
  end;

var
  DMCadTipoCobranca: TDMCadTipoCobranca;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMCadPais }

procedure TDMCadTipoCobranca.prc_Inserir;
var
  vAux : Integer;
begin
  if not cdsTipoCobranca.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('TIPOCOBRANCA',0);

  cdsTipoCobranca.Insert;
  cdsTipoCobrancaID.AsInteger := vAux;
end;

procedure TDMCadTipoCobranca.prc_Excluir;
begin
  if not(cdsTipoCobranca.Active) or (cdsTipoCobranca.IsEmpty) then
    exit;
  cdsTipoCobranca.Delete;
  cdsTipoCobranca.ApplyUpdates(0);
end;

procedure TDMCadTipoCobranca.prc_Gravar;
begin
  vMsgErro := '';
  if trim(cdsTipoCobrancaNOME.AsString) = '' then
    vMsgErro := vMsgErro + #13 + '*** Nome n�o informado!';
  if vMsgErro <> '' then
    exit;
  cdsTipoCobranca.Post;
  cdsTipoCobranca.ApplyUpdates(0);
end;

procedure TDMCadTipoCobranca.prc_Localizar(ID : Integer);
begin
  cdsTipoCobranca.Close;
  sdsTipoCobranca.CommandText := ctCommand;
  if ID <> 0 then
    sdsTipoCobranca.CommandText := sdsTipoCobranca.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsTipoCobranca.Open;
end;

procedure TDMCadTipoCobranca.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand := sdsTipoCobranca.CommandText;
  qParametros.Close;
  qParametros.Open;
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

procedure TDMCadTipoCobranca.dspTipoCobrancaUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadTipoCobranca.cdsTipoCobrancaNewRecord(DataSet: TDataSet);
begin
  cdsTipoCobrancaDESCONTADO.AsString     := 'N';
  cdsTipoCobrancaDEPOSITO.AsString       := 'N';
  cdsTipoCobrancaGERARBOLETO.AsString    := 'N';
  cdsTipoCobrancaCARTAOCREDITO.AsString  := 'N';
  cdsTipoCobrancaCHEQUE.AsString         := 'N';
  cdsTipoCobrancaDINHEIRO.AsString       := 'N';
  cdsTipoCobrancaMOSTRARNOCUPOM.AsString := 'N';
  cdsTipoCobrancaQTDDIAS.AsInteger       := 0;
end;

procedure TDMCadTipoCobranca.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadTipoCobranca.prc_Inserir_CondPgto;
var
  vItemAux : Integer;
begin
  cdsTipoCobranca_Itens.Last;
  vItemAux := cdsTipoCobranca_ItensITEM.AsInteger;
  cdsTipoCobranca_Itens.Insert;
  cdsTipoCobranca_ItensID.AsInteger   := cdsTipoCobrancaID.AsInteger;
  cdsTipoCobranca_ItensITEM.AsInteger := vItemAux + 1;
end;

procedure TDMCadTipoCobranca.cdsTipoCobranca_ItensCalcFields(
  DataSet: TDataSet);
begin
  if cdsTipoCobranca_ItensID_CONDPAGTO.AsString <> '' then
    cdsTipoCobranca_ItensNome_CondPagto.AsString := SQLLocate('CONDPGTO','ID','NOME',cdsTipoCobranca_ItensID_CONDPAGTO.AsString);
end;

end.
