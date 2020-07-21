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
    UCControls1: TUCControls;
    RzPageControl1: TRzPageControl;
    TS_Item: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel6: TPanel;
    Label33: TLabel;
    ComboBox3: TComboBox;
    TS_Pedido: TRzTabSheet;
    SMDBGrid4: TSMDBGrid;
    Panel4: TPanel;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Shape1: TShape;
    Label7: TLabel;
    Shape2: TShape;
    Label8: TLabel;
    Shape3: TShape;
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
    procedure SMDBGrid4GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid4TitleClick(Column: TColumn);
    procedure RxDBLookupCombo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure SMDBGrid3TitleClick(Column: TColumn);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RzPageControl1Changing(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure btnRecalcularClick(Sender: TObject);
    procedure ckAprovadoClick(Sender: TObject);
    procedure SMDBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid8GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RzPageControl1Change(Sender: TObject);
  private
    { Private declarations }
    ffrmConsPedido_Nota: TfrmConsPedido_Nota;

    ColunaOrdenada: String;

    vComando, vComando_GroupBy: String;

    vOrdProducao: String;

    procedure prc_Consultar;
    procedure prc_Consultar_Pedido;
    procedure prc_GroupBy(ctTexto: String);
    procedure prc_Montar_RadioGroup2;

    procedure prc_Somar_cdsPedido_item;
    procedure prc_Somar_cdsPedido;
    procedure prc_Imprimir_Personalizado(Opcao: String);
    procedure prc_Consultar_Ref2;

    procedure prc_Gravar_Unidade(Unidade: String ; Qtd, Qtd_Rest, Qtd_Fat: Real);

    procedure prc_Monta_mNotas_Ped;

  public
    { Public declarations }
    fDMConsPedido: TDMConsPedido;
    vOpcao_Rel: String; //H=Horizontal  V=Vertical

  end;

var
  frmConsOrcamento: TfrmConsOrcamento;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, URelPedido_Det, URelPedido_Res, StrUtils,
  URelPedido_Res2, USel_Produto, URelPedido_Ref, URelPedido_Ref_Acum,
  URelPedido_Cli, URelPedido_Ref_Comb, UInformar_DtExpedicao, USel_Pessoa;

{$R *.dfm}

procedure TfrmConsOrcamento.prc_Consultar;
var
  vOpcaoDtEntrega: String;
  vOpcaoConferido: String;
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
  prc_Montar_RadioGroup2;
  RadioGroup2Click(Sender);
  fDMConsPedido.cdsFilial.First;
  if (fDMConsPedido.cdsFilial.RecordCount < 2) and (fDMConsPedido.cdsFilialID.AsInteger > 0) then
    RxDBLookupCombo1.KeyValue := fDMConsPedido.cdsFilialID.AsInteger;
  Shape9.Visible  := (fDMConsPedido.qParametrosUSA_PEDIDO_FUT.AsString = 'S');
  Label45.Visible := (fDMConsPedido.qParametrosUSA_PEDIDO_FUT.AsString = 'S');

  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_COR_COMBINACAO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsPedido.qParametros_PedCONCATENA_PROD_COR_TAM.AsString <> 'S');
  end;

  if fDMConsPedido.qParametros_PedFATURAR_PED_INTEGRAL.AsString = 'S' then
    ComboBox1.ItemIndex := 2;
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
  if (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_ItemQTD_RESTANTE.AsFloat)) <= 0) and (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_ItemQTD_FATURADO.AsFloat)) > 0) then
  begin
    Background  := clGreen;
    AFont.Color := clWhite;
  end
  else
  if (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_ItemQTD_FATURADO.AsFloat)) > 0) then
    Background  := clAqua
  else
  if (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_ItemQTD_FATURADO.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_ItemQTD_RESTANTE.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_ItemQTD_CANCELADO.AsFloat)) > 0) then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end
  else
  if StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_ItemQTD_FUT.AsFloat)) > 0 then
    Background  := clSilver
  else
  if (fDMConsPedido.qParametrosUSA_APROVACAO_PED.AsString = 'S') and (fDMConsPedido.cdsPedido_ItemAPROVADO_PED.AsString = 'P') then
  begin
    Background  := $0080FFFF;
    AFont.Color := clBlack;
  end
  else
  if fDMConsPedido.cdsPedido_ItemDTCONFERENCIA.AsDateTime > 10 then
  begin
    Background  := $000080FF;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmConsOrcamento.prc_Consultar_Pedido;
var
  vOpcaoDtEntrega: String;
  vComandoAux: String;
  i: Integer;
begin
  fDMConsPedido.cdsPedido.Close;
  i := PosEx('GROUP',UpperCase(fDMConsPedido.ctPedido),0);
  vComandoAux := copy(fDMConsPedido.ctPedido,i,Length(fDMConsPedido.ctPedido) - i + 1);
  vComando    := copy(fDMConsPedido.ctPedido,1,i-1);

  case RadioGroup1.ItemIndex of
    0: vComando := vComando + ' WHERE V.TIPO_REG = ' + QuotedStr('P');
    1: vComando := vComando + ' WHERE V.TIPO_REG = ' + QuotedStr('O');
    2: vComando := vComando + ' WHERE 1 = 1';
  end;

  if (fDMConsPedido.qParametrosUSA_APROVACAO_PED.AsString = 'S') and not(ckAprovado.Checked) then
    vComando := vComando + ' AND V.APROVADO_PED = ' + QuotedStr('A');

  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + ' AND V.NUM_PEDIDO IN (' + vOrdProducao + ')'
  else
  begin
    case ComboBox2.ItemIndex of
      0: vComando := vComando + ' AND V.CLIENTE_ESTOQUE = ' + QuotedStr('S');
      1: vComando := vComando + ' AND V.CLIENTE_ESTOQUE = ' + QuotedStr('N');
    end;
    if RxDBLookupCombo1.Text <> '' then
      vComando := vComando + ' AND V.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
    if RxDBLookupCombo2.Text <> '' then
      vComando := vComando + ' AND V.ID_CLIENTE = ' + IntToStr(RxDBLookupCombo2.KeyValue);
    if RxDBLookupCombo3.Text <> '' then
      vComando := vComando + ' AND V.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo3.KeyValue);
    if RxDBLookupCombo5.Text <> '' then
      vComando := vComando + ' AND V.ID_VENDEDOR = ' + IntToStr(RxDBLookupCombo5.KeyValue);
    if RxDBLookupCombo6.Text <> '' then
      vComando := vComando + ' AND V.ID_VENDEDOR_INT = ' + IntToStr(RxDBLookupCombo6.KeyValue);
    if DateEdit1.Date > 10 then
      vComando := vComando + ' AND V.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
    if DateEdit2.Date > 10 then
      vComando := vComando + ' AND V.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
    vOpcaoDtEntrega := '';
    if fDMConsPedido.qParametrosOPCAO_DTENTREGAPEDIDO.AsString = 'P' then
      vOpcaoDtEntrega := 'V.DTENTREGA_PED'
    else
      vOpcaoDtEntrega := 'V.DTENTREGA_ITEM';
    if DateEdit3.Date > 10 then
      vComando := vComando + ' AND ' + vOpcaoDtEntrega + ' >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
    if DateEdit4.Date > 10 then
      vComando := vComando + ' AND ' + vOpcaoDtEntrega + ' <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
    if trim(Edit1.Text) <> '' then
      vComando := vComando + ' AND V.PEDIDO_CLIENTE LIKE ' + QuotedStr('%'+Edit1.Text+'%');
    if CurrencyEdit1.AsInteger > 0 then
      vComando := vComando + ' AND V.NUM_PEDIDO = ' + IntToStr(CurrencyEdit1.AsInteger);

    case RadioGroup2.ItemIndex of
      0: vComando := vComando + ' AND V.QTD_RESTANTE > 0 ';
      1: vComando := vComando + ' AND V.QTD_FATURADO > 0 ';
      2: vComando := vComando + ' AND V.QTD_CANCELADO > 0 ';
      4: vComando := vComando + ' AND V.QTD_FUT > 0 ';
    end;
  end;
  fDMConsPedido.sdsPedido.CommandText := vComando + '  ' + vComandoAux;
  fDMConsPedido.cdsPedido.Open;
  fDMConsPedido.cdsPedido.IndexFieldNames := 'DTENTREGA_ITEM;PEDIDO_CLIENTE';
  prc_Somar_cdsPedido;
end;

procedure TfrmConsOrcamento.SMDBGrid4GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedidoQTD_RESTANTE.AsFloat)) <= 0) and (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedidoQTD_FATURADO.AsFloat)) > 0) then
  begin
    Background  := clGreen;
    AFont.Color := clWhite;
  end
  else
  if (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedidoQTD_FATURADO.AsFloat)) > 0) then
    Background  := clAqua
  else
  if (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedidoQTD_FATURADO.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedidoQTD_RESTANTE.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedidoQTD_CANCELADO.AsFloat)) > 0) then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end
  else
  if (fDMConsPedido.qParametrosUSA_APROVACAO_PED.AsString = 'S') and (fDMConsPedido.cdsPedidoAPROVADO_PED.AsString = 'P') then
  begin
    Background  := $0080FFFF;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmConsOrcamento.SMDBGrid4TitleClick(Column: TColumn);
var
  i: Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsPedido.cdsPedido.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid4.Columns.Count - 1 do
    if not (SMDBGrid4.Columns.Items[I] = Column) then
      SMDBGrid4.Columns.Items[I].Title.Color := clBtnFace;
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

procedure TfrmConsOrcamento.prc_GroupBy(ctTexto: String);
var
  i: Integer;
begin
  i := PosEx('GROUP',UpperCase(ctTexto),0);
  vComando_GroupBy := copy(ctTexto,i,Length(ctTexto) - i + 1);
  vComando         := copy(ctTexto,1,i-1);
end;

procedure TfrmConsOrcamento.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsPedido.cdsPedido_Ref.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsOrcamento.SMDBGrid3TitleClick(Column: TColumn);
var
  i: Integer;
  vlbMesmoCampo: Boolean;
  vloIndices: TStrings;
  vliCont: Integer;
begin
  vlbMesmoCampo := False;
  vloIndices    := TStringList.Create;

  TClientDataSet(Column.Grid.DataSource.DataSet).GetIndexNames(vloIndices);
  TClientDataSet(Column.Grid.DataSource.DataSet).IndexName := EmptyStr;
  vliCont := vloIndices.IndexOf('idx' + Column.FieldName);
  if vliCont >= 0 then
  begin
    vlbMesmoCampo := not (ixDescending in TClientDataSet(Column.Grid.DataSource.DataSet).IndexDefs[vliCont].Options);
    TClientDataSet(Column.Grid.DataSource.DataSet).DeleteIndex('idx' + Column.FieldName);
  end;
  TClientDataSet(Column.Grid.DataSource.DataSet).AddIndex('idx' + Column.FieldName, Column.FieldName, [], IfThen(vlbMesmoCampo, Column.FieldName));
  TClientDataSet(Column.Grid.DataSource.DataSet).IndexName := 'idx' + Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid6.Columns.Count - 1 do
    if not (SMDBGrid6.Columns.Items[I] = Column) then
      SMDBGrid6.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsOrcamento.btnConsultarClick(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Item then
    prc_Consultar
  else
  if RzPageControl1.ActivePage = TS_Pedido then
    prc_Consultar_Pedido;
end;

procedure TfrmConsOrcamento.btnImprimirClick(Sender: TObject);
var
  vOpcaoAux: String;
  vArq: String;
begin
  vTipo_Config_Email := 3;
  case cbImpCliente.ItemIndex of
    0: vImpCliente_RF := 'F';
    1: vImpCliente_RF := 'R';
  end;
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
  case ComboBox2.ItemIndex of
    0: vOpcaoAux := vOpcaoAux + '(Somente Ped. Estoque)';
  end;
  case RadioGroup2.ItemIndex of
    0: vOpcaoAux := vOpcaoAux + '(Pendente)';
    1: vOpcaoAux := vOpcaoAux + '(Faturado)';
    2: vOpcaoAux := vOpcaoAux + '(Cancelado)';
    4: vOpcaoAux := vOpcaoAux + '(Enviado Não Cobr.)';
  end;
  if RxDBLookupCombo6.Text <> '' then
    vOpcaoAux := vOpcaoAux + '(Vend.Interno: ' + RxDBLookupCombo6.Text + ')';
  fDMConsPedido.frxReport1.Variables['DataInicial'] := QuotedStr(DateToStr(DateEdit1.Date));
  if RzPageControl1.ActivePage = TS_Item then
  begin
    SMDBGrid1.DisableScroll;
    fDMConsPedido.mNotas_Ped.EmptyDataSet;
    fDMConsPedido.cdsPedido_Item.First;
    if ckImpNotas.Checked then
      prc_Monta_mNotas_Ped;
    if ComboBox3.ItemIndex = 1 then
    begin
      fRelPedido_Det := TfRelPedido_Det.Create(Self);
      fRelPedido_Det.fDMConsPedido := fDMConsPedido;
      fRelPedido_Det.vImp_Vlr      := ckMostrarPreco.Checked;
      fRelPedido_Det.vOpcaoImp     := vOpcaoAux;
      fRelPedido_Det.RLReport1.PreviewModal;
      fRelPedido_Det.RLReport1.Free;
      FreeAndNil(fRelPedido_Det);
    end
    else
    begin
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Pedido_Item.fr3';
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
  end
  else
  if RzPageControl1.ActivePage = TS_Pedido then
  begin
    SMDBGrid4.DisableScroll;
    if chkImprimirPedidoItem.Checked then
    begin
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Pedido_Item_Consolidado.fr3';
      if FileExists(vArq) then
        fDMConsPedido.frxReport1.Report.LoadFromFile(vArq)
      else
      begin
        ShowMessage('Relatorio não localizado! ' + vArq);
        Exit;
      end;
      fDMConsPedido.vDataIni := FormatDateTime('DD/MM/YYYY',DateEdit1.Date);
      fDMConsPedido.vDataFim := FormatDateTime('DD/MM/YYYY',DateEdit2.Date);
      fDMConsPedido.frxReport1.ShowReport;
    end
    else
    begin
      if ComboBox1.ItemIndex = 0 then
      begin
        fRelPedido_Res2 := TfRelPedido_Res2.Create(Self);
        fRelPedido_Res2.fDMConsPedido := fDMConsPedido;
        fRelPedido_Res2.vImp_Vlr      := ckMostrarPreco.Checked;
        fRelPedido_Res2.vOpcaoImp     := vOpcaoAux;
        fRelPedido_Res2.RLReport1.PreviewModal;
        fRelPedido_Res2.RLReport1.Free;
        FreeAndNil(fRelPedido_Res2);
      end
      else
      if ComboBox1.ItemIndex = 1 then
      begin
        fRelPedido_Res := TfRelPedido_Res.Create(Self);
        fRelPedido_Res.fDMConsPedido := fDMConsPedido;
        fRelPedido_Res.vImp_Vlr      := ckMostrarPreco.Checked;
        fRelPedido_Res.vOpcaoImp     := vOpcaoAux;
        fRelPedido_Res.RLReport1.PreviewModal;
        fRelPedido_Res.RLReport1.Free;
        FreeAndNil(fRelPedido_Res);
      end
      else
        prc_Imprimir_Personalizado(vOpcaoAux);
      SMDBGrid4.EnableScroll;
    end;
  end;
end;

procedure TfrmConsOrcamento.prc_Montar_RadioGroup2;
begin
  if fDMConsPedido.qParametrosUSA_PEDIDO_FUT.AsString <> 'S' then
    RadioGroup2.Items.Delete(4);
end;

procedure TfrmConsOrcamento.RzPageControl1Changing(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
  if fDMConsPedido.qParametrosUSA_APROVACAO_PED.AsString = 'S' then
  begin
    ckAprovado.Visible := ((RzPageControl1.ActivePage = TS_Item) or (RzPageControl1.ActivePage = TS_Pedido));
    Shape10.Visible    := ((RzPageControl1.ActivePage = TS_Item) or (RzPageControl1.ActivePage = TS_Pedido));
    Label50.Visible    := ((RzPageControl1.ActivePage = TS_Item) or (RzPageControl1.ActivePage = TS_Pedido));
    ckAprovadoClick(Sender);
    if not ckAprovado.Visible then
    begin
      Label25.Visible := False;
      Label26.Visible := False;
    end;
  end;
end;

procedure TfrmConsOrcamento.prc_Somar_cdsPedido_item;
var
  vVlrTotal, vVlrRestante, vVlrFaturado, vVlrPendAprovacao: Real;
begin
  fDMConsPedido.mUnidade.EmptyDataSet;
  vVlrTotal         := 0;
  vVlrRestante      := 0;
  vVlrFaturado      := 0;
  vVlrPendAprovacao := 0;
  SMDBGrid1.DisableScroll;
  fDMConsPedido.cdsPedido_Item.First;
  while not fDMConsPedido.cdsPedido_Item.Eof do
  begin
    prc_Gravar_Unidade(fDMConsPedido.cdsPedido_ItemUNIDADE.AsString,fDMConsPedido.cdsPedido_ItemQTD.AsFloat,fDMConsPedido.cdsPedido_ItemQTD_RESTANTE.AsFloat,fDMConsPedido.cdsPedido_ItemQTD_FATURADO.AsFloat);
    vVlrTotal         := StrToFloat(FormatFloat('0.00',vVlrTotal + fDMConsPedido.cdsPedido_ItemVLR_TOTAL.AsFloat));
    if StrToFloat(FormatFloat('0.00',fDMConsPedido.cdsPedido_ItemVLR_RESTANTE.AsFloat)) > 0 then
      vVlrRestante      := StrToFloat(FormatFloat('0.00',vVlrRestante + fDMConsPedido.cdsPedido_ItemVLR_RESTANTE.AsFloat));
    vVlrFaturado      := StrToFloat(FormatFloat('0.00',vVlrFaturado + fDMConsPedido.cdsPedido_ItemVLR_FATURADO.AsFloat));
    if (fDMConsPedido.cdsPedido_ItemAPROVADO_PED.AsString = 'P') then
      vVlrPendAprovacao := StrToFloat(FormatFloat('0.00',vVlrPendAprovacao + fDMConsPedido.cdsPedido_ItemVLR_TOTAL.AsFloat));
    fDMConsPedido.cdsPedido_Item.Next;
  end;
  SMDBGrid1.EnableScroll;
  Label20.Caption := FormatFloat('###,###,##0.00',vVlrTotal);
  Label21.Caption := FormatFloat('###,###,##0.00',vVlrRestante);
  Label24.Caption := FormatFloat('###,###,##0.00',vVlrFaturado);
  Label26.Caption := FormatFloat('###,###,##0.00',vVlrPendAprovacao);
end;

procedure TfrmConsOrcamento.btnRecalcularClick(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Item then
    prc_Somar_cdsPedido_item
  else
    prc_Somar_cdsPedido;
end;

procedure TfrmConsOrcamento.prc_Somar_cdsPedido;
var
  vVlrTotal, vVlrRestante, vVlrFaturado, vVlrPendAprovacao: Real;
begin
  vVlrTotal         := 0;
  vVlrRestante      := 0;
  vVlrFaturado      := 0;
  vVlrPendAprovacao := 0;
  SMDBGrid4.DisableScroll;
  fDMConsPedido.cdsPedido.First;
  while not fDMConsPedido.cdsPedido.Eof do
  begin
    vVlrTotal      := StrToFloat(FormatFloat('0.00',vVlrTotal + fDMConsPedido.cdsPedidoVLR_TOTAL.AsFloat));
    if StrToFloat(FormatFloat('0.00',fDMConsPedido.cdsPedidoVLR_RESTANTE.AsFloat)) > 0 then
      vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrRestante + fDMConsPedido.cdsPedidoVLR_RESTANTE.AsFloat));
    vVlrFaturado   := StrToFloat(FormatFloat('0.00',vVlrFaturado + fDMConsPedido.cdsPedidoVLR_FATURADO.AsFloat));
    if (fDMConsPedido.cdsPedidoAPROVADO_PED.AsString = 'P') then
      vVlrPendAprovacao := StrToFloat(FormatFloat('0.00',vVlrPendAprovacao + fDMConsPedido.cdsPedidoVLR_TOTAL.AsFloat));
    fDMConsPedido.cdsPedido.Next;
  end;
  SMDBGrid4.EnableScroll;
  Label20.Caption := FormatFloat('###,###,##0.00',vVlrTotal);
  Label21.Caption := FormatFloat('###,###,##0.00',vVlrRestante);
  Label24.Caption := FormatFloat('###,###,##0.00',vVlrFaturado);
  Label26.Caption := FormatFloat('###,###,##0.00',vVlrPendAprovacao);
end;

procedure TfrmConsOrcamento.ckAprovadoClick(Sender: TObject);
begin
  Label25.Visible := (ckAprovado.Checked);
  Label26.Visible := (ckAprovado.Checked);
end;

procedure TfrmConsOrcamento.SMDBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ffrmInformar_DtExpedicao: TfrmInformar_DtExpedicao;
begin
  if (Key = Vk_F4) and (Label27.Visible) then
  begin
    ffrmInformar_DtExpedicao := TfrmInformar_DtExpedicao.Create(self);
    ffrmInformar_DtExpedicao.Tag := 1;
    if not(fDMConsPedido.cdsPedido.IsEmpty) then
      ffrmInformar_DtExpedicao.CurrencyEdit1.AsInteger := fDMConsPedido.cdsPedidoNUM_PEDIDO.AsInteger;
    ffrmInformar_DtExpedicao.ShowModal;
    FreeAndNil(ffrmInformar_DtExpedicao);
  end;
end;

procedure TfrmConsOrcamento.prc_Imprimir_Personalizado(Opcao: String);
var
  vArq: String;
begin
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Cons_Pedido.fr3';
  if FileExists(vArq) then
    fDMConsPedido.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMConsPedido.frxReport1.variables['Opcao_Imp'] := QuotedStr(Opcao);
  fDMConsPedido.frxReport1.ShowReport;
end;

procedure TfrmConsOrcamento.prc_Gravar_Unidade(Unidade: String; Qtd, Qtd_Rest,
  Qtd_Fat: Real);
begin
  if not (fDMConsPedido.qParametros_PedIMP_RESUMO_UNID.AsString = 'S') then
    exit;
  if fDMConsPedido.mUnidade.Locate('Unidade',Unidade,[loCaseInsensitive]) then
    fDMConsPedido.mUnidade.Edit
  else
  begin
    fDMConsPedido.mUnidade.Insert;
    fDMConsPedido.mUnidadeUnidade.AsString := Unidade;
  end;
  fDMConsPedido.mUnidadeQtd.AsFloat      := fDMConsPedido.mUnidadeQtd.AsFloat + Qtd;
  fDMConsPedido.mUnidadeQtd_Fat.AsFloat  := fDMConsPedido.mUnidadeQtd_Fat.AsFloat + Qtd_Fat;
  fDMConsPedido.mUnidadeQtd_Rest.AsFloat := fDMConsPedido.mUnidadeQtd_Rest.AsFloat + Qtd_Rest;
  fDMConsPedido.mUnidade.Post;
end;

procedure TfrmConsOrcamento.prc_Monta_mNotas_Ped;
begin
  fDMConsPedido.mNotas_Ped.MasterSource := nil;
  fDMConsPedido.mNotas_Ped.MasterFields := '';

  ProgressBar1.Visible  := True;
  ProgressBar1.Max      := fDMConsPedido.cdsPedido_Item.RecordCount;
  ProgressBar1.Position := 0;

  fDMConsPedido.mNotas_Ped.EmptyDataSet;
  fDMConsPedido.cdsPedido_Item.First;
  while not fDMConsPedido.cdsPedido_Item.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if StrToFloat(FormatFloat('0.000',fDMConsPedido.cdsPedido_ItemQTD_FATURADO.AsFloat)) > 0 then
    begin
      fDMConsPedido.prc_Consultar_Pedido_Nota(fDMConsPedido.cdsPedido_ItemID.AsInteger,fDMConsPedido.cdsPedido_ItemITEM.AsInteger);
      fDMConsPedido.cdsPedido_Nota.First;
      while not fDMConsPedido.cdsPedido_Nota.Eof do
      begin
        fDMConsPedido.mNotas_Ped.Insert;
        fDMConsPedido.mNotas_PedID_Pedido.AsInteger   := fDMConsPedido.cdsPedido_ItemID.AsInteger;
        fDMConsPedido.mNotas_PedItem_Pedido.AsInteger := fDMConsPedido.cdsPedido_ItemITEM.AsInteger;
        fDMConsPedido.mNotas_PedNum_Nota.AsInteger    := fDMConsPedido.cdsPedido_NotaNUMNOTA.AsInteger;
        fDMConsPedido.mNotas_PedItem_Nota.AsInteger   := fDMConsPedido.cdsPedido_NotaITEM_NOTA.AsInteger;
        fDMConsPedido.mNotas_PedDtEmissao.AsDateTime  := fDMConsPedido.cdsPedido_NotaDTEMISSAO.AsDateTime;
        fDMConsPedido.mNotas_PedQtd.AsFloat           := fDMConsPedido.cdsPedido_NotaQTD.AsFloat;
        fDMConsPedido.mNotas_Ped.Post;
        fDMConsPedido.cdsPedido_Nota.Next;
      end;
    end;
    fDMConsPedido.cdsPedido_Item.Next;
  end;
  fDMConsPedido.cdsPedido_Item.First;
  ProgressBar1.Visible := False;

  fDMConsPedido.mNotas_Ped.MasterSource := fDMConsPedido.dsPedido_Item;
  fDMConsPedido.mNotas_Ped.MasterFields := 'ID;ITEM';
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

procedure TfrmConsOrcamento.SMDBGrid8GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_RefCombQTD_RESTANTE.AsFloat)) <= 0) and (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_RefCombQTD_FATURADO.AsFloat)) > 0) then
  begin
    Background  := clGreen;
    AFont.Color := clWhite;
  end
  else
  if (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_RefCombQTD_FATURADO.AsFloat)) > 0) then
    Background  := clAqua
  else
  if (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_RefCombQTD_FATURADO.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_RefCombQTD_RESTANTE.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.0000',fDMConsPedido.cdsPedido_RefCombQTD_CANCELADO.AsFloat)) > 0) then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end;
end;

procedure TfrmConsOrcamento.RzPageControl1Change(Sender: TObject);
begin
  Label34.Visible   := ((RzPageControl1.ActivePage = TS_Item) and (fDMConsPedido.qParametros_PedPEDIDO_LOJA.AsString = 'S'));
  ComboBox4.Visible := ((RzPageControl1.ActivePage = TS_Item) and (fDMConsPedido.qParametros_PedPEDIDO_LOJA.AsString = 'S'));
end;

end.
