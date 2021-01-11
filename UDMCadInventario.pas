unit UDMCadInventario;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes, Dialogs;

type
  TDMCadInventario = class(TDataModule)
    sdsInventario: TSQLDataSet;
    dspInventario: TDataSetProvider;
    cdsInventario: TClientDataSet;
    dsInventario: TDataSource;
    dsInventario_Mestre: TDataSource;
    sdsInventario_Itens: TSQLDataSet;
    cdsInventario_Itens: TClientDataSet;
    dsInventario_Itens: TDataSource;
    sdsInventarioID: TIntegerField;
    sdsInventarioDATA: TDateField;
    sdsInventarioGERADO_ESTOQUE: TStringField;
    cdsInventarioID: TIntegerField;
    cdsInventarioDATA: TDateField;
    cdsInventarioGERADO_ESTOQUE: TStringField;
    sdsInventario_ItensID: TIntegerField;
    sdsInventario_ItensITEM: TIntegerField;
    sdsInventario_ItensID_PRODUTO: TIntegerField;
    sdsInventario_ItensTAMANHO: TStringField;
    sdsInventario_ItensQTD_ESTOQUE: TFloatField;
    sdsInventario_ItensQTD_INVENTARIO: TFloatField;
    sdsInventario_ItensQTD_AJUSTE: TFloatField;
    sdsInventario_ItensTIPO_AJUSTE: TStringField;
    sdsInventario_ItensVLR_UNITARIO: TFloatField;
    sdsInventario_ItensPERC_IPI: TFloatField;
    sdsInventario_ItensPERC_ICMS: TFloatField;
    sdsInventario_ItensID_MOVESTOQUE: TIntegerField;
    cdsInventariosdsInventario_Itens: TDataSetField;
    cdsInventario_ItensID: TIntegerField;
    cdsInventario_ItensITEM: TIntegerField;
    cdsInventario_ItensID_PRODUTO: TIntegerField;
    cdsInventario_ItensTAMANHO: TStringField;
    cdsInventario_ItensQTD_ESTOQUE: TFloatField;
    cdsInventario_ItensQTD_INVENTARIO: TFloatField;
    cdsInventario_ItensQTD_AJUSTE: TFloatField;
    cdsInventario_ItensTIPO_AJUSTE: TStringField;
    cdsInventario_ItensVLR_UNITARIO: TFloatField;
    cdsInventario_ItensPERC_IPI: TFloatField;
    cdsInventario_ItensPERC_ICMS: TFloatField;
    cdsInventario_ItensID_MOVESTOQUE: TIntegerField;
    sdsInventarioDTUSUARIO: TDateField;
    sdsInventarioHRUSUARIO: TTimeField;
    cdsInventarioDTUSUARIO: TDateField;
    cdsInventarioHRUSUARIO: TTimeField;
    sdsInventarioFILIAL: TIntegerField;
    cdsInventarioFILIAL: TIntegerField;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    sdsInventario_Consulta: TSQLDataSet;
    dspInventario_Consulta: TDataSetProvider;
    cdsInventario_Consulta: TClientDataSet;
    dsInventario_Consulta: TDataSource;
    cdsInventario_ConsultaID: TIntegerField;
    cdsInventario_ConsultaDATA: TDateField;
    cdsInventario_ConsultaGERADO_ESTOQUE: TStringField;
    cdsInventario_ConsultaDTUSUARIO: TDateField;
    cdsInventario_ConsultaHRUSUARIO: TTimeField;
    cdsInventario_ConsultaFILIAL: TIntegerField;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    sdsInventarioTIPO_REG: TStringField;
    cdsInventarioTIPO_REG: TStringField;
    cdsInventario_ConsultaTIPO_REG: TStringField;
    sdsInventarioNUM_INVENTARIO: TIntegerField;
    cdsInventarioNUM_INVENTARIO: TIntegerField;
    cdsInventario_ConsultaNUM_INVENTARIO: TIntegerField;
    qProximo: TSQLQuery;
    qProximoNUM_INVENTARIO: TIntegerField;
    sdsEstoque_Atual: TSQLDataSet;
    dspEstoque_Atual: TDataSetProvider;
    cdsEstoque_Atual: TClientDataSet;
    dsEstoque_Atual: TDataSource;
    cdsProdutoID: TIntegerField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoNOME: TStringField;
    cdsProdutoINATIVO: TStringField;
    cdsProdutoPERC_IPI: TFloatField;
    cdsProdutoPRECO_CUSTO: TFloatField;
    cdsProdutoPRECO_VENDA: TFloatField;
    cdsProdutoTAMANHO: TStringField;
    cdsEstoque_AtualFILIAL: TIntegerField;
    cdsEstoque_AtualID_PRODUTO: TIntegerField;
    cdsEstoque_AtualID_COR: TIntegerField;
    cdsEstoque_AtualTAMANHO: TStringField;
    cdsEstoque_AtualQTD: TFMTBCDField;
    cdsProdutoNOME_GRUPO: TStringField;
    cdsProdutoUNIDADE: TStringField;
    mExcluir: TClientDataSet;
    mExcluirItem: TIntegerField;
    qParametros: TSQLQuery;
    qParametrosINFORMAR_COR_MATERIAL: TStringField;
    qParametrosINFORMAR_COR_PROD: TStringField;
    qParametrosINV_TRAZER_QTD_ZERADA: TStringField;
    cdsProdutoNOME_COR: TStringField;
    sdsInventario_ItensID_COR: TFMTBCDField;
    cdsInventario_ItensID_COR: TFMTBCDField;
    cdsProdutoID_COR_COMBINACAO: TIntegerField;
    cdsEstoque_AtualID_LOCAL_ESTOQUE: TIntegerField;
    cdsEstoque_AtualQTD_GERAL: TFMTBCDField;
    sdsInventarioID_LOCAL_ESTOQUE: TIntegerField;
    cdsInventarioID_LOCAL_ESTOQUE: TIntegerField;
    qParametrosUSA_LOCAL_ESTOQUE: TStringField;
    sdsLocal_Estoque: TSQLDataSet;
    dspLocal_Estoque: TDataSetProvider;
    cdsLocal_Estoque: TClientDataSet;
    cdsLocal_EstoqueID: TIntegerField;
    cdsLocal_EstoqueCOD_LOCAL: TIntegerField;
    cdsLocal_EstoqueNOME: TStringField;
    cdsLocal_EstoqueENDERECO: TStringField;
    cdsLocal_EstoqueNUM_ENDERECO: TStringField;
    cdsLocal_EstoqueID_CIDADE: TIntegerField;
    cdsLocal_EstoqueUF: TStringField;
    cdsLocal_EstoqueBAIRRO: TStringField;
    cdsLocal_EstoqueCEP: TStringField;
    cdsLocal_EstoquePRINCIPAL: TStringField;
    cdsLocal_EstoqueINATIVO: TStringField;
    dsLocal_Estoque: TDataSource;
    cdsInventario_ConsultaID_LOCAL_ESTOQUE: TIntegerField;
    cdsInventario_ConsultaCOD_LOCAL: TIntegerField;
    cdsInventario_ConsultaNOME_LOCAL: TStringField;
    cdsInventario_ItensUNIDADE: TStringField;
    cdsInventario_ItensNOME_COR_COMBINACAO: TStringField;
    cdsInventario_ItensREFERENCIA: TStringField;
    cdsInventario_ItensNOME: TStringField;
    qProduto: TSQLQuery;
    qProdutoNOME: TStringField;
    qProdutoREFERENCIA: TStringField;
    qProdutoUNIDADE: TStringField;
    qCombinacao: TSQLQuery;
    qCombinacaoNOME: TStringField;
    cdsEstoque_AtualQTD_RESERVA: TFloatField;
    sdsEstMov: TSQLDataSet;
    dspEstMov: TDataSetProvider;
    cdsEstMov: TClientDataSet;
    dsEstMov: TDataSource;
    cdsEstMovQTD: TFloatField;
    cdsEstMovID_PRODUTO: TIntegerField;
    cdsEstMovID_COR: TIntegerField;
    cdsEstMovTAMANHO: TStringField;
    qParametros_Est: TSQLQuery;
    qParametros_EstINVENTARIO_ESTMOV: TStringField;
    qProdutoID: TIntegerField;
    qProdutoPRECO_CUSTO: TFloatField;
    qProdutoTIPO_REG: TStringField;
    qProd2: TSQLQuery;
    qProd2NOME: TStringField;
    qProd2REFERENCIA: TStringField;
    qProd2UNIDADE: TStringField;
    qProd2ID: TIntegerField;
    qProd2PRECO_CUSTO: TFloatField;
    qProd2TIPO_REG: TStringField;
    SPBuscarProdInventario: TSQLStoredProc;
    sdsInventario_ItensNUM_LOTE_CONTROLE: TStringField;
    cdsInventario_ItensNUM_LOTE_CONTROLE: TStringField;
    sdsEstoque_Lote: TSQLDataSet;
    dspEstoque_Lote: TDataSetProvider;
    cdsEstoque_Lote: TClientDataSet;
    dsEstoque_Lote: TDataSource;
    cdsEstoque_LoteFILIAL: TIntegerField;
    cdsEstoque_LoteID_PRODUTO: TIntegerField;
    cdsEstoque_LoteID_COR: TIntegerField;
    cdsEstoque_LoteNUM_LOTE_CONTROLE: TStringField;
    cdsEstoque_LoteQTD: TFMTBCDField;
    cdsEstoque_LoteNOME_PRODUTO: TStringField;
    cdsEstoque_LoteREFERENCIA: TStringField;
    qParametrosUSA_LOTE_CONTROLE: TStringField;
    cdsEstoque_LotePRECO_CUSTO: TFloatField;
    cdsEstoque_LotePRECO_VENDA: TFloatField;
    cdsEstoque_LoteUNIDADE: TStringField;
    cdsEstoque_LotePERC_IPI: TFloatField;
    qProd3: TSQLQuery;
    qProd3ID: TIntegerField;
    mNaoGravados: TClientDataSet;
    mNaoGravadosID_Produto: TIntegerField;
    mNaoGravadosID_Cor: TIntegerField;
    mNaoGravadosTamanho: TStringField;
    mNaoGravadosData: TDateField;
    dsmNaoGravados: TDataSource;
    mNaoGravadosNum_Inventario: TIntegerField;
    cdsProdutoQTD: TFloatField;
    cdsProdutoQTD_GERAL: TFloatField;
    mAuxInventario: TClientDataSet;
    mAuxInventarioID: TIntegerField;
    mAuxInventarioCodBarra: TStringField;
    mAuxInventarioReferencia: TStringField;
    mAuxInventarioQtd: TFloatField;
    mAuxInventarioPreco_Custo: TFloatField;
    mAuxInventarioPreco_Venda: TFloatField;
    dsmAuxInventario: TDataSource;
    mAuxInventarioNome_Produto: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsInventarioNewRecord(DataSet: TDataSet);
    procedure dspInventarioUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsInventario_ItensNewRecord(DataSet: TDataSet);
    procedure cdsProdutoCalcFields(DataSet: TDataSet);
    procedure cdsInventarioReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsInventario_ItensReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsInventario_ItensCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMsgErro: String;
    ctCommand: String;
    ctConsulta: String;
    ctProduto: String;
    ctEstoque_Lote: String;
    ctProd3: string;
    
    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
    procedure prc_Inserir_Itens;
    function fnc_Possui_Erro: Boolean;
    procedure prc_Abrir_Produto(Tipo_Reg, Referencia, Nome: String ; ID_Produto : Integer);

  end;

var
  DMCadInventario: TDMCadInventario;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao, StdConvs;

{$R *.dfm}

{ TDMCadInventario}

procedure TDMCadInventario.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsInventario.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('INVENTARIO',0);

  cdsInventario.Insert;
  cdsInventarioID.AsInteger     := vAux;
  cdsInventarioFILIAL.AsInteger := vFilial;

  qProximo.Close;
  qProximo.Open;
  cdsInventarioNUM_INVENTARIO.AsInteger := qProximoNUM_INVENTARIO.AsInteger + 1;
end;

procedure TDMCadInventario.prc_Excluir;
begin
  if not(cdsInventario.Active) or (cdsInventario.IsEmpty) then
    exit;
  cdsInventario_Itens.First;
  while not cdsInventario_Itens.Eof do
    cdsInventario_Itens.Delete;
  cdsInventario.Delete;
  cdsInventario.ApplyUpdates(0);
end;

procedure TDMCadInventario.prc_Gravar;
begin
  cdsInventario.Post;
  cdsInventario.ApplyUpdates(0);
end;

procedure TDMCadInventario.prc_Localizar(ID: Integer); //-1 � para inclus�o
begin
  cdsInventario.Close;
  sdsInventario.CommandText := ctCommand;
  if ID <> 0 then
    sdsInventario.CommandText := sdsInventario.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsInventario.Open;
end;

procedure TDMCadInventario.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand      := sdsInventario.CommandText;
  ctConsulta     := sdsInventario_Consulta.CommandText;
  ctProduto      := sdsProduto.CommandText;
  ctEstoque_Lote := sdsEstoque_Lote.CommandText;
  ctProd3        := qProd3.Sql.Text;

  cdsFilial.Open;
  cdsEstoque_Atual.Open;
  qParametros.Open;
  qParametros_Est.Open;
  cdsLocal_Estoque.Open;

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

procedure TDMCadInventario.prc_Inserir_Itens;
var
  vItemAux: Integer;
begin
  cdsInventario_Itens.Last;
  vItemAux := cdsInventario_ItensITEM.AsInteger;
  vItemAux := vItemAux + 1;

  cdsInventario_Itens.Insert;
  cdsInventario_ItensID.AsInteger   := cdsInventarioID.AsInteger;
  cdsInventario_ItensITEM.AsInteger := vItemAux;
end;

procedure TDMCadInventario.cdsInventarioNewRecord(DataSet: TDataSet);
begin
  cdsInventarioGERADO_ESTOQUE.AsString := 'N';
  cdsInventarioDTUSUARIO.AsDateTime    := Date;
  cdsInventarioHRUSUARIO.AsDateTime    := Now;
end;

procedure TDMCadInventario.dspInventarioUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadInventario.cdsInventario_ItensNewRecord(DataSet: TDataSet);
begin
  cdsInventario_ItensTIPO_AJUSTE.AsString := 'N';
end;

procedure TDMCadInventario.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadInventario.cdsProdutoCalcFields(DataSet: TDataSet);
var
  vTam: String;
  vCor: Integer;
begin
  //cdsProdutoclQtd.AsFloat       := StrToFloat(FormatFloat('0.0000',0));
  //cdsProdutoclQtd_Geral.AsFloat := StrToFloat(FormatFloat('0.0000',0));
  //if qParametros_EstINVENTARIO_ESTMOV.AsString = 'S' then
    //cdsProdutoclQtd.AsFloat := StrToFloat(FormatFloat('0.0000',cdsProdutoQTD.AsFloat))
  //else
  begin
    {if (trim(cdsProdutoTAMANHO.AsString) = '') or (cdsProdutoTAMANHO.IsNull) then
      vTam := ''
    else
      vTam := cdsProdutoTAMANHO.AsString;
    if cdsProdutoID_COR_COMBINACAO.AsInteger > 0 then
      vCor := cdsProdutoID_COR_COMBINACAO.AsInteger
    else
      vCor := 0;
    if qParametros_EstINVENTARIO_ESTMOV.AsString = 'S' then
    begin
      if cdsEstMov.FindKey([cdsProdutoID.AsInteger,vTam,vCor]) then
        cdsProdutoclQtd.AsFloat := StrToFloat(FormatFloat('0.0000',cdsEstMovQTD.AsFloat));
    end
    else
    begin
      if cdsEstoque_Atual.FindKey([cdsProdutoID.AsInteger,vTam,vCor]) then
      begin
        //26/09/2019  foi tirado
        //cdsProdutoclQtd.AsFloat       := StrToFloat(FormatFloat('0.0000',cdsEstoque_AtualQTD.AsFloat - cdsEstoque_AtualQTD_RESERVA.AsFloat));
        cdsProdutoclQtd.AsFloat       := StrToFloat(FormatFloat('0.0000',cdsEstoque_AtualQTD.AsFloat));
        cdsProdutoclQtd_Geral.AsFloat := StrToFloat(FormatFloat('0.0000',cdsEstoque_AtualQTD_GERAL.AsFloat));
      end;
    end;}
  end;
end;

function TDMCadInventario.fnc_Possui_Erro: Boolean;
begin
  Result   := True;
  vMsgErro := '';
  if cdsInventarioDATA.AsDateTime <= 10 then
    vMsgErro := vMsgErro + #13 + '*** Data n�o informada!';
  if cdsInventarioFILIAL.AsInteger <= 0 then
    vMsgErro := vMsgErro + #13 + '*** Filial n�o informada!';
  if (qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S') and (cdsInventarioID_LOCAL_ESTOQUE.AsInteger <= 0) then
    vMsgErro := vMsgErro + #13 + '*** Local do Estoque n�o informado!';
  if trim(vMsgErro) <> '' then
    exit;
  Result := False;
end;

procedure TDMCadInventario.cdsInventarioReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  if trim(e.Message) <> '' then
    MessageDlg(e.Message + #13 + #13 + '*** Erro ao gravar a tabela de Invent�rio!', mtError, [mbOk], 0);
end;

procedure TDMCadInventario.cdsInventario_ItensReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  if trim(e.Message) <> '' then
    MessageDlg(e.Message + #13 + #13 + '*** Erro ao gravar a tabela de Produtos do Invent�rio!', mtError, [mbOk], 0);
end;

procedure TDMCadInventario.cdsInventario_ItensCalcFields(
  DataSet: TDataSet);
begin
  if cdsInventario_ItensID_PRODUTO.AsInteger > 0 then
  begin
    qProduto.Close;
    qProduto.ParamByName('ID').AsInteger := cdsInventario_ItensID_PRODUTO.AsInteger;
    qProduto.Open;
    if not qProduto.IsEmpty then
    begin
      cdsInventario_ItensNOME.AsString       := qProdutoNOME.AsString;
      cdsInventario_ItensREFERENCIA.AsString := qProdutoREFERENCIA.AsString;
      cdsInventario_ItensUNIDADE.AsString    := qProdutoUNIDADE.AsString;
    end;
  end;
  if cdsInventario_ItensID_COR.AsInteger > 0 then
  begin
    qCombinacao.Close;
    qCombinacao.ParamByName('ID').AsInteger := cdsInventario_ItensID_COR.AsInteger;
    qCombinacao.Open;
    if not qCombinacao.IsEmpty then
      cdsInventario_ItensNOME_COR_COMBINACAO.AsString := qCombinacaoNOME.AsString;
  end;
end;

procedure TDMCadInventario.prc_Abrir_Produto(Tipo_Reg, Referencia, Nome: String ; ID_Produto : Integer);
var
  vTab : String;
begin
  cdsProduto.Close;
  cdsProduto.IndexFieldNames := 'NOME;NOME_COR;TAMANHO';
  vTab := 'PRO.';
  if qParametros_EstINVENTARIO_ESTMOV.AsString = 'S' then
  begin
    sdsProduto.CommandText := 'SELECT AUX.*, (SELECT coalesce(round(sum(EM.QTD2),5),0) QTD FROM ESTOQUE_MOV EM '


                                             + ' where EM.filial = :FILIAL '
                                             + '  AND EM.id_local_estoque = :ID_LOCAL_ESTOQUE '
                                             + '  AND EM.dtmovimento <= :DATA '
                                             + '  AND EM.ID_PRODUTO = AUX.ID '
                                             + '  AND EM.ID_COR = AUX.ID_COR_COMBINACAO '
                                             + '  AND EM.TAMANHO = AUX.TAMANHO) QTD'
                                             + '  FROM ('
                                             + '  SELECT PRO.ID, PRO.REFERENCIA, PRO.nome, PRO.INATIVO, PRO.perc_ipi,'
                                             + '  PRO.preco_custo, PRO.preco_venda, PRO.unidade, GR.NOME NOME_GRUPO,'
                                             + '  PC.NOME NOME_COR, CAST(0 AS DOUBLE PRECISION) QTD_GERAL, '
                                             + '  CASE'
                                             + ' WHEN PT.TAMANHO IS NULL THEN ' + QuotedStr('')
                                             + ' ELSE PT.TAMANHO '
                                             + '   END TAMANHO, '
                                             + ' CASE'
                                             + '   WHEN PC.ID_COR_COMBINACAO IS NULL THEN 0'
                                             + '   ELSE PC.id_cor_combinacao'
                                             + '   END ID_COR_COMBINACAO'
                                             + ' FROM PRODUTO PRO'
                                             + ' LEFT JOIN PRODUTO_TAM PT'
                                             + ' ON PRO.ID = PT.ID'
                                             + ' LEFT JOIN PRODUTO_COMB PC'
                                             + ' ON PRO.ID = PC.ID'
                                             + ' LEFT JOIN GRUPO GR'
                                             + ' ON PRO.ID_GRUPO = GR.ID'
                                             + ' WHERE PRO.INATIVO = ' + QuotedStr('N')
                                             + ' AND PRO.ESTOQUE = ' + QuotedStr('S')
                                             + ' AND PRO.TIPO_REG = ' + QuotedStr(Tipo_Reg) + ') AUX WHERE 0 = 0' ;
    //sdsProduto.ParamByName('FILIAL').AsInteger           := cdsInventarioFILIAL.AsInteger;
    //sdsProduto.ParamByName('ID_LOCAL_ESTOQUE').AsInteger := cdsInventarioID_LOCAL_ESTOQUE.AsInteger;
    //sdsProduto.ParamByName('DATA').AsDate                := cdsInventarioDATA.AsDateTime;
    vTab := 'AUX.';
  end
  else
  begin
    vTab := 'AUX.';
    sdsProduto.CommandText := 'select AUX.*, '
                            + ' CAST( (select sum(E.QTD) QTD '
                            + '               from ESTOQUE_ATUAL E '
                            + '               where E.FILIAL = :FILIAL and '
                            + '                     E.ID_LOCAL_ESTOQUE = :ID_LOCAL_ESTOQUE and '
                            + '                     E.ID_PRODUTO = AUX.ID and '
                            + '                     E.ID_COR = AUX.ID_COR_COMBINACAO and '
                            + '                     E.TAMANHO = AUX.TAMANHO) AS DOUBLE PRECISION) QTD, '
                            + '              CAST ( (select sum(QTD) QTD_GERAL '
                            + '               from ESTOQUE_ATUAL E2 '
                            + '               where E2.ID_PRODUTO = AUX.ID and '
                            + '                     E2.ID_COR = AUX.ID_COR_COMBINACAO and '
                            + '                     E2.TAMANHO = AUX.TAMANHO) AS DOUBLE precision) QTD_GERAL '
                            + '       from (select coalesce(PT.TAMANHO, ' +QuotedStr('') + ') TAMANHO, PRO.ID, PRO.REFERENCIA, PRO.NOME, PRO.PERC_IPI, PRO.PRECO_CUSTO, '
                            + '                    PRO.PRECO_VENDA, PRO.INATIVO, PRO.UNIDADE, GR.NOME NOME_GRUPO, PC.NOME NOME_COR, '
                            + '                    coalesce(PC.ID_COR_COMBINACAO, 0) ID_COR_COMBINACAO '
                            + '             from PRODUTO PRO '
                            + '             left join PRODUTO_TAM PT on PRO.ID = PT.ID '
                            + '             left join PRODUTO_COMB PC on PRO.ID = PC.ID '
                            + '             left join GRUPO GR on PRO.ID_GRUPO = GR.ID '
                            + '             where PRO.INATIVO = ' + QuotedStr('N') + ' and '
                            + '                   PRO.TIPO_REG = ' + QuotedStr(Tipo_Reg) + ' and '
                            + '                   PRO.ESTOQUE = ' + QuotedStr('S') + ') AUX  WHERE 0 = 0 '
  end;

  if ID_Produto > 0 then
    sdsProduto.CommandText := sdsProduto.CommandText +  ' AND ' + vTab + 'ID = ' + IntToStr(ID_Produto);
  if trim(Referencia) <> '' then
    sdsProduto.CommandText := sdsProduto.CommandText + ' AND ' + vTab + 'REFERENCIA LIKE ' + QuotedStr('%'+Referencia+'%');
  if trim(Nome) <> '' then
    sdsProduto.CommandText := sdsProduto.CommandText + ' AND ' + vTab + 'NOME LIKE ' + QuotedStr('%'+Nome+'%');
  sdsProduto.ParamByName('FILIAL').AsInteger           := cdsInventarioFILIAL.AsInteger;
  sdsProduto.ParamByName('ID_LOCAL_ESTOQUE').AsInteger := cdsInventarioID_LOCAL_ESTOQUE.AsInteger;
  if qParametros_EstINVENTARIO_ESTMOV.AsString = 'S' then
    sdsProduto.ParamByName('DATA').AsDate                := cdsInventarioDATA.AsDateTime;
  cdsProduto.Open;
end;

end.
