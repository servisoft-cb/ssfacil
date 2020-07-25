unit UConsOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, UDMConsPedido, RxLookup, UCBase, Mask, RzPanel, ToolEdit,
  RzButton, RzTabs, UConsPedido_Nota, NxCollection, CurrEdit, Menus,
  ComCtrls;

type
  TfrmConsOrcamento = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label4: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    Label9: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RadioGroup2: TRadioGroup;
    Panel2: TPanel;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    Label12: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    pnlTotal: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    btnRecalcular: TNxButton;
    Label35: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    RzPageControl1: TRzPageControl;
    TS_Item: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    Shape1: TShape;
    Label7: TLabel;
    Shape2: TShape;
    Label8: TLabel;
    Shape3: TShape;
    Label10: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo4Change(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnRecalcularClick(Sender: TObject);
    procedure RxDBLookupCombo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ffrmConsPedido_Nota: TfrmConsPedido_Nota;

    ColunaOrdenada: String;

    vComando, vComando_GroupBy: String;

    vOrdProducao: String;

    procedure prc_Consultar;

    procedure prc_Somar_cdsPedido_item;

  public
    { Public declarations }
    fDMConsPedido: TDMConsPedido;
    vOpcao_Rel: String; //H=Horizontal  V=Vertical

  end;

var
  frmConsOrcamento: TfrmConsOrcamento;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, StrUtils, USel_Produto,
  USel_Pessoa, UConsClienteOBS;

{$R *.dfm}

procedure TfrmConsOrcamento.prc_Consultar;
begin
  fDMConsPedido.cdsPedido_Item.Close;
  fDMConsPedido.cdsPedido_Item.IndexFieldNames := '';

  fDMConsPedido.sdsPedido_Item.CommandText := fDMConsPedido.ctPedido_Item;
  if fDMConsPedido.qParametros_GeralUSA_VENDEDOR_INT.AsString <> 'S' then
  begin
    fDMConsPedido.sdsPedido_Item.CommandText := AnsiReplaceText(fDMConsPedido.sdsPedido_Item.CommandText, 'LEFT JOIN PESSOA VINT ON PED.ID_VENDEDOR_INT = VINT.CODIGO', '');
    fDMConsPedido.sdsPedido_Item.CommandText := AnsiReplaceText(fDMConsPedido.sdsPedido_Item.CommandText, 'VINT.NOME NOME_VENDEDOR_INT', 'cast(' +QuotedStr('') + ' as Varchar(60)) NOME_VENDEDOR_INT');
  end;
  fDMConsPedido.sdsPedido_Item.CommandText := fDMConsPedido.sdsPedido_Item.CommandText + ' WHERE PED.TIPO_REG = ' + QuotedStr('O');

  vComando := '';
  if CurrencyEdit1.AsInteger > 0 then
    vComando := ' AND PED.NUM_PEDIDO = ' + IntToStr(CurrencyEdit1.AsInteger) 
  else
  begin
    if RxDBLookupCombo1.Text <> '' then
      vComando := vComando + ' AND PED.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
    if RxDBLookupCombo2.Text <> '' then
      vComando := vComando + ' AND PED.ID_CLIENTE = ' + IntToStr(RxDBLookupCombo2.KeyValue);
    if RxDBLookupCombo3.Text <> '' then
      vComando := vComando + ' AND ITE.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo3.KeyValue);
    if RxDBLookupCombo5.Text <> '' then
      vComando := vComando + ' AND PED.ID_VENDEDOR = ' + IntToStr(RxDBLookupCombo5.KeyValue);
    if RxDBLookupCombo6.Text <> '' then
      vComando := vComando + ' AND PED.ID_VENDEDOR_INT = ' + IntToStr(RxDBLookupCombo6.KeyValue);
    if DateEdit1.Date > 10 then
      vComando := vComando + ' AND PED.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
    if DateEdit2.Date > 10 then
      vComando := vComando + ' AND PED.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
    case RadioGroup2.ItemIndex of
      1: vComando := vComando + ' AND ITE.APROVADO_ORC = ' + QuotedStr('P');
      2: vComando := vComando + ' AND ITE.APROVADO_ORC = ' + QuotedStr('A');
      3: vComando := vComando + ' AND ITE.APROVADO_ORC = ' + QuotedStr('N');
    end;
  end;
  fDMConsPedido.sdsPedido_Item.CommandText := fDMConsPedido.sdsPedido_Item.CommandText + vComando;
  fDMConsPedido.cdsPedido_Item.Open;
//  fDMConsPedido.cdsPedido_Item.IndexFieldNames := 'PEDIDO_CLIENTE;DTEMISSAO';
  prc_Somar_cdsPedido_item;
end;

procedure TfrmConsOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsOrcamento.FormShow(Sender: TObject);
var
  i: Integer;
begin
  fDMConsPedido := TDMConsPedido.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedido);
  fDMConsPedido.cdsFilial.First;
  if (fDMConsPedido.cdsFilial.RecordCount < 2) and (fDMConsPedido.cdsFilialID.AsInteger > 0) then
    RxDBLookupCombo1.KeyValue := fDMConsPedido.cdsFilialID.AsInteger;

  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_COR_COMBINACAO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsPedido.qParametros_PedCONCATENA_PROD_COR_TAM.AsString <> 'S');
  end;

  Label35.Visible          := (fDMConsPedido.qParametros_GeralUSA_VENDEDOR_INT.AsString = 'S');
  RxDBLookupCombo6.Visible := (fDMConsPedido.qParametros_GeralUSA_VENDEDOR_INT.AsString = 'S');
end;

procedure TfrmConsOrcamento.RxDBLookupCombo4Enter(Sender: TObject);
begin
  fDMConsPedido.cdsProduto.IndexFieldNames := 'REFERENCIA';
end;

procedure TfrmConsOrcamento.RxDBLookupCombo3Enter(Sender: TObject);
begin
  fDMConsPedido.cdsProduto.IndexFieldNames := 'NOME';
end;

procedure TfrmConsOrcamento.RxDBLookupCombo2Enter(Sender: TObject);
begin
  fDMConsPedido.cdsCliente.IndexFieldNames := 'NOME';
end;

procedure TfrmConsOrcamento.RxDBLookupCombo5Enter(Sender: TObject);
begin
  fDMConsPedido.cdsVendedor.IndexFieldNames := 'NOME';
end;

procedure TfrmConsOrcamento.RxDBLookupCombo4Change(Sender: TObject);
begin
  if RxDBLookupCombo4.Text <> '' then
    RxDBLookupCombo3.KeyValue := RxDBLookupCombo4.KeyValue;
end;

procedure TfrmConsOrcamento.RxDBLookupCombo3Change(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    RxDBLookupCombo4.KeyValue := RxDBLookupCombo3.KeyValue;
end;

procedure TfrmConsOrcamento.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMConsPedido.cdsPedido_ItemAPROVADO_ORC.AsString = 'P' then
  begin
    Background  := clYellow;
    AFont.Color := clBlack;
  end
  else
  if fDMConsPedido.cdsPedido_ItemAPROVADO_ORC.AsString = 'A' then
  begin
    Background  := clGreen;
    AFont.Color := clWhite;
  end
  else
  //if (fDMConsPedido.cdsPedido_ItemAPROVADO_ORC.AsString = 'R') or (fDMConsPedido.cdsPedido_ItemAPROVADO_ORC.AsString = 'N') then
  if (fDMConsPedido.cdsPedido_ItemAPROVADO_ORC.AsString = 'N') then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end;
end;

procedure TfrmConsOrcamento.RxDBLookupCombo4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if RxDBLookupCombo4.Text <> '' then
      vCodProduto_Pos := RxDBLookupCombo4.KeyValue;
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.vTipo_Prod := 'P';
    frmSel_Produto.ShowModal;
    if vCodProduto_Pos > 0 then
      RxDBLookupCombo4.KeyValue := vCodProduto_Pos;
    RxDBLookupCombo4.SetFocus;
  end;
end;

procedure TfrmConsOrcamento.RxDBLookupCombo3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if RxDBLookupCombo3.Text <> '' then
      vCodProduto_Pos := RxDBLookupCombo3.KeyValue;
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.vTipo_Prod := 'P';
    frmSel_Produto.ShowModal;
    if vCodProduto_Pos > 0 then
      RxDBLookupCombo3.KeyValue := vCodProduto_Pos;
    RxDBLookupCombo3.SetFocus;
  end;
end;

procedure TfrmConsOrcamento.btnConsultarClick(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Item then
    prc_Consultar;
end;

procedure TfrmConsOrcamento.btnImprimirClick(Sender: TObject);
var
  vOpcaoAux: String;
  vArq: String;
begin
  vTipo_Config_Email := 3;
  vOpcaoAux := '';
  if RxDBLookupCombo2.Text <> '' then
    vOpcaoAux := vOpcaoAux + '(Cliente: ' + RxDBLookupCombo2.Text + ')';
  if RxDBLookupCombo4.Text <> '' then
    vOpcaoAux := vOpcaoAux + '(Referência: ' + RxDBLookupCombo4.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Emissão: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Emissão Ini: ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Emissão Fin: ' + DateEdit2.Text + ')';

  if RxDBLookupCombo5.Text <> '' then
    vOpcaoAux := vOpcaoAux + '(Vendedor: ' + RxDBLookupCombo5.Text + ')';
  case RadioGroup2.ItemIndex of
    1: vOpcaoAux := vOpcaoAux + '(Pendente de Aprovação)';
    2: vOpcaoAux := vOpcaoAux + '(Aprovado)';
    3: vOpcaoAux := vOpcaoAux + '(Não Aprovado)';
  end;
  if RxDBLookupCombo6.Text <> '' then
    vOpcaoAux := vOpcaoAux + '(Vend.Interno: ' + RxDBLookupCombo6.Text + ')';
  fDMConsPedido.frxReport1.Variables['DataInicial'] := QuotedStr(DateToStr(DateEdit1.Date));
  if RzPageControl1.ActivePage = TS_Item then
  begin
    SMDBGrid1.DisableScroll;
    fDMConsPedido.mNotas_Ped.EmptyDataSet;
    fDMConsPedido.cdsPedido_Item.First;
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Orcamento_Item.fr3';
    if FileExists(vArq) then
      fDMConsPedido.frxReport1.Report.LoadFromFile(vArq)
    else
    begin
      ShowMessage('Relatorio não localizado! ' + vArq);
      Exit;
    end;
    fDMConsPedido.frxReport1.variables['Opcao_Imp'] := QuotedStr(vOpcaoAux);
    fDMConsPedido.frxReport1.variables['Informar_Cor_Prod'] := QuotedStr(fDMConsPedido.qParametrosINFORMAR_COR_PROD.AsString);
    fDMConsPedido.frxReport1.ShowReport;
  end;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmConsOrcamento.prc_Somar_cdsPedido_item;
var
  vVlrTotal, vVlrPendente, vVlrAprovado, vVlrNaoAprovado : Real;
begin
  vVlrTotal       := 0;
  vVlrPendente    := 0;
  vVlrAprovado    := 0;
  vVlrNaoAprovado := 0;
  SMDBGrid1.DisableScroll;
  fDMConsPedido.cdsPedido_Item.First;
  while not fDMConsPedido.cdsPedido_Item.Eof do
  begin
    vVlrTotal := StrToFloat(FormatFloat('0.00',vVlrTotal + fDMConsPedido.cdsPedido_ItemVLR_TOTAL.AsFloat));
    if fDMConsPedido.cdsPedido_ItemAPROVADO_ORC.AsString = 'P' then
      vVlrPendente := StrToFloat(FormatFloat('0.00',vVlrPendente + fDMConsPedido.cdsPedido_ItemVLR_TOTAL.AsFloat))
    else
    if fDMConsPedido.cdsPedido_ItemAPROVADO_ORC.AsString = 'A' then
      vVlrAprovado := StrToFloat(FormatFloat('0.00',vVlrAprovado + fDMConsPedido.cdsPedido_ItemVLR_TOTAL.AsFloat))
    else
    if fDMConsPedido.cdsPedido_ItemAPROVADO_ORC.AsString = 'R' then
      vVlrNaoAprovado := StrToFloat(FormatFloat('0.00',vVlrNaoAprovado + fDMConsPedido.cdsPedido_ItemVLR_TOTAL.AsFloat));
    fDMConsPedido.cdsPedido_Item.Next;
  end;
  SMDBGrid1.EnableScroll;
  Label20.Caption := FormatFloat('###,###,##0.00',vVlrTotal);
  Label21.Caption := FormatFloat('###,###,##0.00',vVlrPendente);
  Label24.Caption := FormatFloat('###,###,##0.00',vVlrAprovado);
  Label26.Caption := FormatFloat('###,###,##0.00',vVlrNaoAprovado);
end;

procedure TfrmConsOrcamento.btnRecalcularClick(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Item then
    prc_Somar_cdsPedido_item;
end;

procedure TfrmConsOrcamento.RxDBLookupCombo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if trim(RxDBLookupCombo2.Text) <> '' then
      vCodPessoa_Pos := RxDBLookupCombo2.KeyValue
    else
      vCodPessoa_Pos := 0;
    frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
    frmSel_Pessoa.vTipo_Pessoa := 'C';
    frmSel_Pessoa.ShowModal;
    FreeAndNil(frmSel_Pessoa);
    if vCodPessoa_Pos > 0 then
      RxDBLookupCombo2.KeyValue := vCodPessoa_Pos;
    RxDBLookupCombo2.SetFocus;
  end;
end;

procedure TfrmConsOrcamento.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsPedido.cdsPedido_Item.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsOrcamento.SMDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F4) and (fDMConsPedido.cdsPedido_Item.Active) and (fDMConsPedido.cdsPedido_ItemID_CLIENTE.AsInteger > 0) then
  begin
    frmConsClienteOBS := TfrmConsClienteOBS.Create(self);
    frmConsClienteOBS.CurrencyEdit1.AsInteger := fDMConsPedido.cdsPedido_ItemID_CLIENTE.AsInteger;
    frmConsClienteOBS.ShowModal;
    FreeAndNil(frmConsClienteOBS);
  end;
end;

end.
