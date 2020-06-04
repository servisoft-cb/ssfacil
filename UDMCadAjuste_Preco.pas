unit UDMCadAjuste_Preco;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, dbXPress, LogTypes, frxClass, frxDBSet;

type
  TDMCadAjuste_Preco = class(TDataModule)
    sdsAjuste_Preco: TSQLDataSet;
    dspAjuste_Preco: TDataSetProvider;
    cdsAjuste_Preco: TClientDataSet;
    dsAjuste_Preco: TDataSource;
    dsAjuste_Preco_Mestre: TDataSource;
    sdsAjuste_Preco_Itens: TSQLDataSet;
    cdsAjuste_Preco_Itens: TClientDataSet;
    dsAjuste_Preco_Itens: TDataSource;
    sdsConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    sdsAjuste_PrecoID: TIntegerField;
    sdsAjuste_PrecoNOME: TStringField;
    sdsAjuste_PrecoDATA: TDateField;
    sdsAjuste_PrecoTIPO: TStringField;
    sdsAjuste_PrecoPERC_AJUSTE: TFloatField;
    sdsAjuste_PrecoUSUARIO: TStringField;
    sdsAjuste_PrecoDTUSUARIO: TDateField;
    sdsAjuste_PrecoHRUSUARIO: TTimeField;
    cdsAjuste_PrecoID: TIntegerField;
    cdsAjuste_PrecoNOME: TStringField;
    cdsAjuste_PrecoDATA: TDateField;
    cdsAjuste_PrecoTIPO: TStringField;
    cdsAjuste_PrecoPERC_AJUSTE: TFloatField;
    cdsAjuste_PrecoUSUARIO: TStringField;
    cdsAjuste_PrecoDTUSUARIO: TDateField;
    cdsAjuste_PrecoHRUSUARIO: TTimeField;
    sdsAjuste_Preco_ItensID: TIntegerField;
    sdsAjuste_Preco_ItensITEM: TIntegerField;
    sdsAjuste_Preco_ItensID_PRODUTO: TIntegerField;
    sdsAjuste_Preco_ItensPRECO_NOVO: TFloatField;
    sdsAjuste_Preco_ItensPRECO_ANT: TFloatField;
    cdsAjuste_PrecosdsAjuste_Preco_Itens: TDataSetField;
    cdsAjuste_Preco_ItensID: TIntegerField;
    cdsAjuste_Preco_ItensITEM: TIntegerField;
    cdsAjuste_Preco_ItensID_PRODUTO: TIntegerField;
    cdsAjuste_Preco_ItensPRECO_NOVO: TFloatField;
    cdsAjuste_Preco_ItensPRECO_ANT: TFloatField;
    cdsConsultaID: TIntegerField;
    cdsConsultaNOME: TStringField;
    cdsConsultaDATA: TDateField;
    cdsConsultaTIPO: TStringField;
    cdsConsultaPERC_AJUSTE: TFloatField;
    cdsConsultaUSUARIO: TStringField;
    cdsConsultaDTUSUARIO: TDateField;
    cdsConsultaHRUSUARIO: TTimeField;
    cdsConsultaDESC_TIPO: TStringField;
    qProduto: TSQLQuery;
    qProdutoID: TIntegerField;
    qProdutoNOME: TStringField;
    cdsAjuste_Preco_ItensclNome_Produto: TStringField;
    qGrupo: TSQLQuery;
    qGrupoID: TIntegerField;
    qGrupoNOME: TStringField;
    qGrupoSUPERIOR: TStringField;
    qGrupoCOD_PRINCIPAL: TIntegerField;
    qGrupoCODIGO: TStringField;
    qGrupoTIPO: TStringField;
    cdsProdutoID_PRODUTO: TIntegerField;
    cdsProdutoNOME_PRODUTO: TStringField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoPRECO_VENDA: TFloatField;
    cdsProdutoNOME_GRUPO: TStringField;
    cdsProdutoID_GRUPO: TIntegerField;
    cdsProdutoSUPERIOR: TStringField;
    cdsProdutoID_MARCA: TIntegerField;
    cdsProdutoNOME_MARCA: TStringField;
    qUltimo: TSQLQuery;
    qUltimoID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspAjuste_PrecoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsAjuste_Preco_ItensCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMSGErro: String;
    ctCommand, ctConsulta, ctProduto: String;
    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
    procedure prc_Excluir_Item;
    procedure prc_Inserir_Itens;
  end;

var
  DMCadAjuste_Preco: TDMCadAjuste_Preco;

implementation

uses DmdDatabase, Math, uUtilPadrao, LogProvider;

{$R *.dfm}

{ TDMCadCFOP}

procedure TDMCadAjuste_Preco.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsAjuste_Preco.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('AJUSTE_PRECO',0);

  cdsAjuste_Preco.Insert;
  cdsAjuste_PrecoID.AsInteger     := vAux;
  cdsAjuste_PrecoDATA.AsDateTime  := Date;
  cdsAjuste_PrecoUSUARIO.AsString := vUsuario;
  cdsAjuste_PrecoDTUSUARIO.AsDateTime := Date;
  cdsAjuste_PrecoHRUSUARIO.AsDateTime := Now;
end;

procedure TDMCadAjuste_Preco.prc_Excluir;
begin
  if not(cdsAjuste_Preco.Active) or (cdsAjuste_Preco.IsEmpty) then
    exit;
  cdsAjuste_Preco.Delete;
  cdsAjuste_Preco.ApplyUpdates(0);
end;

procedure TDMCadAjuste_Preco.prc_Gravar;
begin
  vMsgErro := '';
  if (cdsAjuste_PrecoTIPO.AsString <> 'A') and (cdsAjuste_PrecoTIPO.AsString <> 'D') then
    vMsgErro := vMsgErro + #13 + '*** Tipo não informado!';
  if cdsAjuste_PrecoDATA.AsDateTime < 10 then
    vMsgErro := vMsgErro + #13 + '*** Data não informada!';
  if trim(cdsAjuste_PrecoNOME.AsString) = '' then
    vMsgErro := vMsgErro + #13 + '*** Nome não informado!';
  if StrToFloat(FormatFloat('0.00',cdsAjuste_PrecoPERC_AJUSTE.AsFloat)) <= 0 then
    vMsgErro := vMsgErro + #13 + '*** % não informado!';
  if trim(vMsgErro) <> '' then
    exit;
  cdsAjuste_Preco.Post;
  cdsAjuste_Preco.ApplyUpdates(0);
end;

procedure TDMCadAjuste_Preco.prc_Localizar(ID: Integer); //-1 é para inclusão
begin
  cdsAjuste_Preco.Close;
  sdsAjuste_Preco.CommandText := ctCommand;
  if ID <> 0 then
    sdsAjuste_Preco.CommandText := sdsAjuste_Preco.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsAjuste_Preco.Open;
end;

procedure TDMCadAjuste_Preco.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand  := sdsAjuste_Preco.CommandText;
  ctConsulta := sdsConsulta.CommandText;
  ctProduto  := sdsProduto.CommandText;
  cdsProduto.Open;
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
  cdsProduto.IndexFieldNames := 'NOME_PRODUTO';
end;

procedure TDMCadAjuste_Preco.prc_Excluir_Item;
begin
  cdsAjuste_Preco_Itens.Delete;
end;

procedure TDMCadAjuste_Preco.prc_Inserir_Itens;
var
  vItemAux: Integer;
begin
  cdsAjuste_Preco_Itens.Last;
  vItemAux := cdsAjuste_Preco_ItensITEM.AsInteger;

  cdsAjuste_Preco_Itens.Insert;
  cdsAjuste_Preco_ItensID.AsInteger   := cdsAjuste_PrecoID.AsInteger;
  cdsAjuste_Preco_ItensITEM.AsInteger := vItemAux + 1;
end;

procedure TDMCadAjuste_Preco.dspAjuste_PrecoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadAjuste_Preco.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadAjuste_Preco.cdsAjuste_Preco_ItensCalcFields(
  DataSet: TDataSet);
begin
  qProduto.Close;
  qProduto.ParamByName('ID').AsInteger := cdsAjuste_Preco_ItensID_PRODUTO.AsInteger;
  qProduto.Open;
  cdsAjuste_Preco_ItensclNome_Produto.AsString := qProdutoNOME.AsString;
end;

end.
