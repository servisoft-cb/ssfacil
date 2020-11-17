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
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ColunaOrdenada: String;
    vComando: String;
    vSaldo_Original: Real;
    vSaldo: Real;

    procedure prc_Consultar;
    procedure prc_Le_cdsEstoque_Mov(Gerar_CC: Boolean);

    procedure prc_Condicao(Saldo_Ant: Boolean = False);

    procedure prc_Monta_Saldo_Ant;

  public
    { Public declarations }
    vFilial_Loc : Integer;
    vNome_Produto : String;
    vID_Cor_Loc: Integer;
    fDMConsEstoque: TDMConsEstoque;

  end;

var
  frmConsEstoque_Prod_Mov: TfrmConsEstoque_Prod_Mov;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, Math, DateUtils,
  USel_Produto;

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

  if not Assigned(fDMConsEstoque) then
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
  vQtdEntrada, vQtdSaida: Real;
begin
  SMDBGrid1.DisableScroll;
  vQtdEntrada := 0;
  vQtdSaida   := 0;
  fDMConsEstoque.mEstoque_CentroCusto.close;
  fDMConsEstoque.mEstoque_CentroCusto.CreateDataSet;
  fDMConsEstoque.mEstoque_CentroCusto.EmptyDataSet;

  fDMConsEstoque.cdsEstoque_Mov.First;
  while not fDMConsEstoque.cdsEstoque_Mov.Eof do
  begin
    if fDMConsEstoque.cdsEstoque_MovTIPO_ES.AsString = 'E' then
      vQtdEntrada := vQtdEntrada + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat
    else
      vQtdSaida := vQtdSaida + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat;
    fDMConsEstoque.cdsEstoque_Mov.Next;
  end;

  vSaldo := vQtdEntrada - vQtdSaida;
  lblEntrada.Caption := FormatFloat('###,###,##0.0000',vQtdEntrada);
  lblSaida.Caption   := FormatFloat('###,###,##0.0000',vQtdSaida);
  lblSaldo.Caption   := FormatFloat('###,###,##0.0000',vSaldo);
  SMDBGrid1.EnableScroll;
end;

procedure TfrmConsEstoque_Prod_Mov.btnConsultarClick(Sender: TObject);
var
  Form: TForm;
begin
  if CurrencyEdit1.AsInteger <= 0 then
  begin
    MessageDlg('*** ID Produto não informado!', mtError, [mbOk], 0);
    CurrencyEdit1.SetFocus;
    exit;
  end;

  vSaldo := 0;
  vSaldo_Original := 0;
  SMDBGrid1.DisableScroll;
  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);
  try
    prc_Condicao;
    prc_Consultar;
    prc_Le_cdsEstoque_Mov(False);
    vSaldo_Original := vSaldo;
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
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + ' AND EM.ID_PRODUTO = ' + IntToStr(CurrencyEdit1.AsInteger);
  if vFilial_Loc > 0 then
    vComando := vComando + ' AND EM.FILIAL = ' + IntToStr(vFilial_Loc);
  if (DateEdit1.Date > 10) then
    vComando := vComando + ' AND EM.DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if (DateEdit2.Date > 10) then
    vComando := vComando + ' AND EM.DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
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
  vAux: Real;
begin
  if DateEdit1.Date <= 10 then
  begin
    Label2.Caption := 'Saldo anterior ';
    Label7.Caption := '0';
    if DateEdit2.Date > 10 then
      label10.Caption := 'Saldo até ' + DateEdit2.Text + ': '
    else
      label10.Caption := 'Saldo Físico: ';
    Label8.Caption := FormatFloat('###,###,###,##0.0000',vSaldo_Original);
    exit;
  end;

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
      sds.CommandText   := sds.CommandText + '  AND E.DTMOVIMENTO < :DTMOVIMENTO ';
    sds.ParamByName('ID_PRODUTO').AsInteger := CurrencyEdit1.AsInteger;
    if DateEdit1.Date > 10 then
      sds.ParamByName('DTMOVIMENTO').AsDate   := DateEdit1.Date;
    sds.Open;
    Label2.Caption := 'Saldo anterior a data: ' + DateEdit1.Text;
    Label7.Caption := FormatFloat('###,###,###,##0.0000',sds.FieldByName('QTD').AsFloat);
    vAux := StrToFloat(FormatFloat('0.00',sds.FieldByName('QTD').AsFloat + vSaldo_Original));
    Label8.Caption := FormatFloat('###,###,###,##0.0000',vAux);
    if DateEdit2.Date > 10 then
      label10.Caption := 'Saldo até ' + DateEdit2.Text + ': '
    else
      label10.Caption := 'Saldo Físico: ';

  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmConsEstoque_Prod_Mov.CurrencyEdit1Exit(Sender: TObject);
begin
  Edit3.Text := '';
  if CurrencyEdit1.AsInteger > 0 then
  begin
    Edit3.Text := SQLLocate('PRODUTO','ID','NOME',CurrencyEdit1.Text);
    if trim(Edit3.Text) = '' then
    begin
      MessageDlg('*** Produto não encontrado!', mtError, [mbOk], 0);
      CurrencyEdit1.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmConsEstoque_Prod_Mov.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vCodProduto_Pos := 0;
    frmSel_Produto := TfrmSel_Produto.Create(Self);
    frmSel_Produto.ShowModal;
    FreeAndNil(frmSel_Produto);
    if vCodProduto_Pos > 0 then
    begin
      CurrencyEdit1.AsInteger := vCodProduto_Pos;
      CurrencyEdit1.SetFocus;
      CurrencyEdit1Exit(Sender);
    end;
  end;
end;

end.
