unit UConsEstoque_Prod_Mov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, Mask, 
  DBGrids, SMDBGrid, Provider, DBClient, SqlExpr, UDMConsEstoque, RxLookup, UCBase, ToolEdit, RzTabs, RzPanel, FMTBcd, 
  NxCollection, StrUtils, CurrEdit, DB, ComCtrls, AdvPanel;

type
  TfrmConsEstoque_Prod_Mov = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Label4: TLabel;
    DateEdit2: TDateEdit;
    btnConsultar: TNxButton;
    Label14: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    RzGroupBox2: TRzGroupBox;
    Label5: TLabel;
    lblEntrada: TLabel;
    Label6: TLabel;
    lblSaida: TLabel;
    Label9: TLabel;
    lblSaldo: TLabel;
    NxButton1: TNxButton;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure NxButton1Click(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
  private
    { Private declarations }
    fDMConsEstoque: TDMConsEstoque;
    ColunaOrdenada: String;
    vComando: String;

    procedure prc_Consultar;
    procedure prc_Le_cdsEstoque_Mov(Gerar_CC: Boolean);
    procedure prc_Consultar_Ant;

    procedure prc_Condicao(Saldo_Ant: Boolean = False);

    procedure prc_Monta_Saldo_Ant;

  public
    { Public declarations }
    vID_Produto_Loc, vFilial_Loc : Integer;
    vNome_Produto : String;
    vID_Cor_Loc: Integer;

  end;

var
  frmConsEstoque_Prod_Mov: TfrmConsEstoque_Prod_Mov;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, Math, DateUtils;

{$R *.dfm}

procedure TfrmConsEstoque_Prod_Mov.prc_Consultar;
begin
  fDMConsEstoque.cdsEstoque_Mov.Close;
  fDMConsEstoque.sdsEstoque_Mov.CommandText := fDMConsEstoque.ctEstoque_Mov + vComando;
  fDMConsEstoque.cdsEstoque_Mov.Open;
end;

procedure TfrmConsEstoque_Prod_Mov.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vID_Cor_Loc := 0;
  prc_Grava_Grid(SMDBGrid1, Name, fDMConsEstoque.qParametros_GeralENDGRIDS.AsString);
  fDMConsEstoque.cdsProduto.Filtered := False;
  Action := Cafree;
end;

procedure TfrmConsEstoque_Prod_Mov.FormShow(Sender: TObject);
var
  i: Integer;
  vDia, vMes, vAno: Word;
  vData: TDateTime;
begin
  vData := Date;
  vData := IncDay(vData,-20);
  vData := EncodeDate(YearOf(vData),MonthOf(vData),01);
  DateEdit1.Date := vData;

  fDMConsEstoque := TDMConsEstoque.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsEstoque);

  SMDBGrid1.ClearFilter;

  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'TAMANHO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_GRADE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_COR') then
      SMDBGrid1.Columns[i].Visible := ((fDMConsEstoque.qParametrosINFORMAR_COR_MATERIAL.AsString = 'S') or (fDMConsEstoque.qParametrosINFORMAR_COR_PROD.AsString = 'C'));
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_LOCAL') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'COD_LOCAL') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'NUM_LOTE_CONTROLE') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_LOTE_CONTROLE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'PRECO_CUSTO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametros_EstMOSTRAR_PCUSTO_MOV.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'PRECO_CUSTO_TOTAL') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametros_EstMOSTRAR_PCUSTO_TOTAL_MOV.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'ESPESSURA') or (SMDBGrid1.Columns[i].FieldName = 'LARGURA') or (SMDBGrid1.Columns[i].FieldName = 'COMPRIMENTO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosEMPRESA_SUCATA.AsString = 'S');
  end;
end;

procedure TfrmConsEstoque_Prod_Mov.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsEstoque.cdsEstoque_Mov.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsEstoque_Prod_Mov.prc_Le_cdsEstoque_Mov(Gerar_CC: Boolean);
var
  vQtdEntrada, vQtdSaida, vSaldo: Real;
begin
  SMDBGrid1.DisableScroll;
  vQtdEntrada := 0;
  vQtdSaida   := 0;
  fDMConsEstoque.mEstoque_CentroCusto.close;
  fDMConsEstoque.mEstoque_CentroCusto.CreateDataSet;
  fDMConsEstoque.mEstoque_CentroCusto.EmptyDataSet;
  ProgressBar1.Visible  := True;
  ProgressBar1.Refresh;
  ProgressBar1.Max      := fDMConsEstoque.cdsEstoque_Mov.RecordCount;
  ProgressBar1.Position := 0;

  fDMConsEstoque.cdsEstoque_Mov.First;
  while not fDMConsEstoque.cdsEstoque_Mov.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if fDMConsEstoque.cdsEstoque_MovTIPO_ES.AsString = 'E' then
      vQtdEntrada := vQtdEntrada + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat
    else
      vQtdSaida := vQtdSaida + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat;
    if Gerar_CC then
    begin
      //07/09/2019
      //if fDMConsEstoque.cdsEstoque_MovTIPO_ES.AsString = 'S' then
      //begin
       if not(fDMConsEstoque.mEstoque_CentroCusto.Locate('Id_Produto; Codigo_CentroCusto',VarArrayOf([fDMConsEstoque.cdsEstoque_MovID_PRODUTO.AsInteger,fDMConsEstoque.cdsEstoque_MovCODIGO_CCUSTO.AsString]),[loCaseInsensitive])) then
         fDMConsEstoque.mEstoque_CentroCusto.Insert
       else
         fDMConsEstoque.mEstoque_CentroCusto.Edit;
        fDMConsEstoque.mEstoque_CentroCustoId_Produto.AsInteger        := fDMConsEstoque.cdsEstoque_MovID_PRODUTO.AsInteger;
        fDMConsEstoque.mEstoque_CentroCustoNome_Produto.AsString       := fDMConsEstoque.cdsEstoque_MovNOMEPRODUTO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoCodigo_Grupo.AsString       := fDMConsEstoque.cdsEstoque_MovCODIGO_GRUPO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoNome_Grupo.AsString         := fDMConsEstoque.cdsEstoque_MovNOME_GRUPO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoCodigo_CentroCusto.AsString := fDMConsEstoque.cdsEstoque_MovCODIGO_CCUSTO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoNome_CentroCusto.AsString   := fDMConsEstoque.cdsEstoque_MovNOME_CENTROCUSTO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoCodigo_Superior.AsString    := fDMConsEstoque.cdsEstoque_MovCODIGO_SUPERIOR.AsString;
        fDMConsEstoque.mEstoque_CentroCustoNome_Superior.AsString      := fDMConsEstoque.cdsEstoque_MovDESC_SUPERIOR.AsString;
        //06/09/2019
        if fDMConsEstoque.cdsEstoque_MovTIPO_ES.AsString = 'S' then
        begin
          fDMConsEstoque.mEstoque_CentroCustoQSai.AsFloat     := fDMConsEstoque.mEstoque_CentroCustoQSai.AsFloat + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat;
          fDMConsEstoque.mEstoque_CentroCustoVlrTotal.AsFloat := fDMConsEstoque.mEstoque_CentroCustoVlrTotal.AsFloat + (fDMConsEstoque.cdsEstoque_MovVLR_UNITARIO.AsFloat * fDMConsEstoque.cdsEstoque_MovQTD.AsFloat);
        end
        else
        begin
          fDMConsEstoque.mEstoque_CentroCustoQEnt.AsFloat       := fDMConsEstoque.mEstoque_CentroCustoQEnt.AsFloat + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat;
          fDMConsEstoque.mEstoque_CentroCustoVlrEntrada.AsFloat := fDMConsEstoque.mEstoque_CentroCustoVlrEntrada.AsFloat + (fDMConsEstoque.cdsEstoque_MovVLR_UNITARIO.AsFloat * fDMConsEstoque.cdsEstoque_MovQTD.AsFloat);
        end;
        fDMConsEstoque.mEstoque_CentroCustoQSaldo.AsFloat       := fDMConsEstoque.mEstoque_CentroCustoQEnt.AsFloat - fDMConsEstoque.mEstoque_CentroCustoQSai.AsFloat;
        fDMConsEstoque.mEstoque_CentroCustoVlrSaldo.AsFloat     := fDMConsEstoque.mEstoque_CentroCustoVlrEntrada.AsFloat - fDMConsEstoque.mEstoque_CentroCustoVlrTotal.AsFloat;
        //************
        fDMConsEstoque.mEstoque_CentroCusto.Post;
      //end;
    end;
    fDMConsEstoque.cdsEstoque_Mov.Next;
  end;

  vSaldo := vQtdEntrada - vQtdSaida;
  lblEntrada.Caption := FormatFloat('###,###,##0.0000',vQtdEntrada);
  lblSaida.Caption   := FormatFloat('###,###,##0.0000',vQtdSaida);
  lblSaldo.Caption   := FormatFloat('###,###,##0.0000',vSaldo);
  SMDBGrid1.EnableScroll;
  ProgressBar1.Visible := False;
end;

procedure TfrmConsEstoque_Prod_Mov.btnConsultarClick(Sender: TObject);
var
  Form: TForm;
begin
  SMDBGrid1.DisableScroll;
  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);
  try
    prc_Condicao;
    prc_Consultar;
    prc_Monta_Saldo_Ant;
  finally
    FreeAndNil(Form);
  end;
  SMDBGrid1.EnableScroll;
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    Label9.Caption := 'Saldo de ' + DateEdit1.Text + ' até ' + DateEdit2.Text
  else
  if (DateEdit1.Date > 10) then
    Label9.Caption := 'Saldo de ' + DateEdit1.Text + ' até ' + DateToStr(Date)
  else
  if (DateEdit2.Date > 10) then
    Label9.Caption := 'Saldo até ' + DateEdit2.Text
  else
    Label9.Caption := 'Saldo' + DateEdit2.Text;
end;

procedure TfrmConsEstoque_Prod_Mov.prc_Condicao(Saldo_Ant: Boolean = False);
begin
  vComando := '';
  if vID_Produto_Loc > 0 then
    vComando := vComando + ' AND EM.ID_PRODUTO = ' + IntToStr(vID_Produto_Loc);
  if vFilial_Loc > 0 then
    vComando := vComando + ' AND EM.FILIAL = ' + IntToStr(vFilial_Loc);
  if (DateEdit1.Date > 10)
    vComando := vComando + ' AND EM.DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if (DateEdit2.Date > 10)
    vComando := vComando + ' AND EM.DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
end;

procedure TfrmConsEstoque_Prod_Mov.prc_Consultar_Ant;
var
  vComandoAux, vComandoAux2: String;
  i: Integer;
  vFilialAux: Integer;
begin
  fDMConsEstoque.cdsEstoque_Ant.Close;
  i := PosEx('GROUP',fDMConsEstoque.ctEstoque_Ant,0);
  vComandoAux  := copy(fDMConsEstoque.ctEstoque_Ant,i,Length(fDMConsEstoque.ctEstoque_Ant) - i + 1);
  vComandoAux2 := copy(fDMConsEstoque.ctEstoque_Ant,1,i-1);
  fDMConsEstoque.sdsEstoque_Ant.CommandText := vComandoAux2 + vComando + vComandoAux;
  fDMConsEstoque.cdsEstoque_Ant.Open;

  fDMConsEstoque.cdsEstoque_Ant.First;
  while not fDMConsEstoque.cdsEstoque_Ant.Eof do
  begin
    //14/09/2020  tirado pois estava dando diferença no cálculo quando o saldo era negativo
    //if (StrToFloat(FormatFloat('0.00000',fDMConsEstoque.cdsEstoque_AntSALDO.AsFloat)) > 0) or (CheckBox3.Checked) then
    begin
      if fDMConsEstoque.mAuxEst_Acum.Locate('ID_Produto',fDMConsEstoque.cdsEstoque_AntID_PRODUTO.AsInteger,[loCaseInsensitive]) then
        fDMConsEstoque.mAuxEst_Acum.Edit
      else
      begin
        fDMConsEstoque.mAuxEst_Acum.Insert;
        fDMConsEstoque.mAuxEst_AcumID_Produto.AsInteger := fDMConsEstoque.cdsEstoque_AntID_PRODUTO.AsInteger;
        fDMConsEstoque.mAuxEst_AcumReferencia.AsString  := fDMConsEstoque.cdsEstoque_AntREFERENCIA.AsString;
        fDMConsEstoque.mAuxEst_AcumNomeProduto.AsString := fDMConsEstoque.cdsEstoque_AntNOMEPRODUTO.AsString;
        
        fDMConsEstoque.mAuxEst_AcumQtd_Ent.AsFloat      := StrToFloat(FormatFloat('0.00',0));
        fDMConsEstoque.mAuxEst_AcumQtd_Sai.AsFloat      := StrToFloat(FormatFloat('0.00',0));
        fDMConsEstoque.mAuxEst_AcumVlr_Entrada.AsFloat  := StrToFloat(FormatFloat('0.00',0));
        fDMConsEstoque.mAuxEst_AcumVlr_Saida.AsFloat    := StrToFloat(FormatFloat('0.00',0));
        fDMConsEstoque.mAuxEst_AcumSaldo_Periodo.AsFloat := StrToFloat(FormatFloat('0.00',0));
      end;
      fDMConsEstoque.mAuxEst_AcumQtd_Ant.AsFloat := StrToFloat(FormatFloat('0.000000',fDMConsEstoque.cdsEstoque_AntSALDO.AsFloat));
      fDMConsEstoque.mAuxEst_AcumSaldo.AsFloat   := StrToFloat(FormatFloat('0.000000',fDMConsEstoque.mAuxEst_AcumQtd_Ant.AsFloat + fDMConsEstoque.mAuxEst_AcumQtd_Ent.AsFloat - fDMConsEstoque.mAuxEst_AcumQtd_Sai.AsFloat));
      fDMConsEstoque.mAuxEst_Acum.Post;
    end;
    fDMConsEstoque.cdsEstoque_Ant.Next;
  end;
end;

procedure TfrmConsEstoque_Prod_Mov.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMConsEstoque.cdsEstoque_MovTIPO_ES.AsString = 'E' then
    AFont.Color := clMaroon
  else
    AFont.Color := clBlue;
end;

procedure TfrmConsEstoque_Prod_Mov.NxButton1Click(Sender: TObject);
begin
  prc_Le_cdsEstoque_Mov(False);
end;

procedure TfrmConsEstoque_Prod_Mov.prc_Monta_Saldo_Ant;
var
  sds: TSQLDataSet;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT SUM(E.qtd2) QTD FROM ESTOQUE_MOV E '
                       + 'WHERE E.ID_PRODUTO = :ID_PRODUTO ';
    if vFilial_Loc > 0 then
      sds.CommandText   := sds.CommandText + '  AND E.FILIAL = ' + IntToStr(vFilial_Loc);
    if vID_Cor_Loc > 0 then
      sds.CommandText   := sds.CommandText + '  AND E.ID_COR = ' + IntToStr(vID_Cor_Loc);
    if DateEdit1.Date > 10 then
      sds.CommandText   := sds.CommandText + '  AND E.DTMOVIMENTO < :DTMOVIMENTO ' +
    sds.ParamByName('ID_PRODUTO').AsInteger := vID_Produto_Loc;
    sds.ParamByName('DTMOVIMENTO').AsDate   := DateEdit1.Date;
    sds.Open;
    Label2.Caption := 'Saldo anterior a data: ' + DateEdit1.Text;
    Label7.Caption := FormatFloat('###,###,###,##0.0000',sds.FieldByName('QTD').AsFloat;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmConsEstoque_Prod_Mov.CurrencyEdit1Exit(Sender: TObject);
begin
  if SQLLocate('PARAMETROS_RECXML','ID','UTILIZA_DFE_ACBR','1') = 'S' then

end;

end.
