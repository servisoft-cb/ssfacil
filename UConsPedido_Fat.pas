unit UConsPedido_Fat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, UDMConsPedido, RxLookup, UCBase, Mask, RzPanel, ToolEdit,
  ComObj, RzButton, RzTabs, CurrEdit;

type
  TfrmConsPedido_Fat = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    ckMostrarPreco: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    RzPageControl1: TRzPageControl;
    TS_Item: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    TS_Pedido: TRzTabSheet;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SMDBGrid4: TSMDBGrid;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    UCControls1: TUCControls;
    TS_Fatura: TRzTabSheet;
    Label7: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SMDBGrid2: TSMDBGrid;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    ComboBox2: TComboBox;
    SMDBGrid3: TSMDBGrid;
    edtCliente: TEdit;
    TS_Item_Acum: TRzTabSheet;
    SMDBGrid5: TSMDBGrid;
    Label10: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label11: TLabel;
    ceNotaIni: TCurrencyEdit;
    ceNotaFinal: TCurrencyEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtSerie: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo4Change(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure SMDBGrid4TitleClick(Column: TColumn);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
  private
    { Private declarations }
    fDMConsPedido: TDMConsPedido;
    ColunaOrdenada: String;

    procedure prc_Consultar;
    procedure prc_Consultar_Ped;
    procedure prc_Consultar_Faturas;
    procedure prc_CriaExcel(vDados: TDataSource);
    procedure prc_Consultar_TipoMat;
    procedure prc_Consultar_Fat_Acum;

  public
    { Public declarations }
  end;

var
  frmConsPedido_Fat: TfrmConsPedido_Fat;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, URelPedido_Fat, URelPedido_FatPed, StrUtils;

{$R *.dfm}

procedure TfrmConsPedido_Fat.BitBtn1Click(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Item then
  begin
    prc_Consultar;
    prc_Consultar_TipoMat;
  end
  else
  if RzPageControl1.ActivePage = TS_Pedido then
    prc_Consultar_Ped
  else
  if RzPageControl1.ActivePage = TS_Fatura then
    prc_Consultar_Faturas
  else
  if RzPageControl1.ActivePage = TS_Item_Acum then
    prc_Consultar_Fat_Acum;
end;

procedure TfrmConsPedido_Fat.prc_Consultar;
var
  vComando : String;
begin
  fDMConsPedido.cdsPedido_Fat.Close;
  fDMConsPedido.sdsPedido_Fat.CommandText := fDMConsPedido.ctPedido_Fat + ' WHERE PED.TIPO_REG = ' + QuotedStr('P');
  vComando := '';
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND NT.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(edtCliente.Text) <> '' then
    vComando := vComando + ' AND PES.NOME LIKE ' + QuotedStr('%'+edtCliente.Text+'%');
  if RxDBLookupCombo3.Text <> '' then
    vComando := vComando + ' AND PI.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo3.KeyValue);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND NT.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND NT.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND PED.PEDIDO_CLIENTE LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  if ComboBox2.Visible then
  begin
    case ComboBox2.ItemIndex of
      1 : vComando := vComando + ' AND PROD.TIPO_PRODUCAO = ' + QuotedStr('T');
      2 : vComando := vComando + ' AND PROD.TIPO_PRODUCAO = ' + QuotedStr('E');
    end;
  end;
  if trim(edtSerie.Text) <> '' then
    vComando := vComando + ' AND NT.SERIE = ' + QuotedStr(trim(edtSerie.Text));
  if ceNotaIni.AsInteger > 0 then
    vComando := vComando + ' AND NT.NUMNOTA >= ' + IntToStr(ceNotaIni.AsInteger);
  if ceNotaFinal.AsInteger > 0 then
    vComando := vComando + ' AND NT.NUMNOTA <= ' + IntToStr(ceNotaFinal.AsInteger);
  fDMConsPedido.sdsPedido_Fat.CommandText := fDMConsPedido.sdsPedido_Fat.CommandText + vComando;
  fDMConsPedido.cdsPedido_Fat.Open;
  fDMConsPedido.cdsPedido_Fat.IndexFieldNames := 'PEDIDO_CLIENTE;DTEMISSAO;ITEM_PEDIDO;';
end;

procedure TfrmConsPedido_Fat.prc_Consultar_Ped;
var
  vComando : String;
  vComandoAux : String;
  i : Integer;
begin
  fDMConsPedido.cdsPedido_FatPed.Close;
  fDMConsPedido.cdsPedido_Fat.Close;
  i := PosEx('GROUP',fDMConsPedido.ctPedido_FatPed,0);
  vComandoAux := copy(fDMConsPedido.ctPedido_FatPed,i,Length(fDMConsPedido.ctPedido_FatPed) - i + 1);
  vComando    := copy(fDMConsPedido.ctPedido_FatPed,1,i-1);

  vComando := vComando + ' WHERE PED.TIPO_REG = ' + QuotedStr('P');
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND NT.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(edtCliente.Text) <> '' then
    vComando := vComando + ' AND PES.NOME LIKE ' + QuotedStr('%'+edtCliente.Text+'%');
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND NT.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND NT.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND PED.PEDIDO_CLIENTE LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  if ComboBox2.Visible then
  begin
    case ComboBox2.ItemIndex of
      1 : vComando := vComando + ' AND PROD.TIPO_PRODUCAO = ' + QuotedStr('T');
      2 : vComando := vComando + ' AND PROD.TIPO_PRODUCAO = ' + QuotedStr('E');
    end;
  end;
  if trim(edtSerie.Text) <> '' then
    vComando := vComando + ' AND NT.SERIE = ' + QuotedStr(trim(edtSerie.Text));
  if ceNotaIni.AsInteger > 0 then
    vComando := vComando + ' AND NT.NUMNOTA >= ' + IntToStr(ceNotaIni.AsInteger);
  if ceNotaFinal.AsInteger > 0 then
    vComando := vComando + ' AND NT.NUMNOTA <= ' + IntToStr(ceNotaFinal.AsInteger);
  fDMConsPedido.sdsPedido_FatPed.CommandText := vComando + '  ' + vComandoAux;
  fDMConsPedido.cdsPedido_FatPed.Open;
  fDMConsPedido.cdsPedido_FatPed.IndexFieldNames := 'PEDIDO_CLIENTE;DTEMISSAO';
end;

procedure TfrmConsPedido_Fat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedido_Fat.FormShow(Sender: TObject);
var
  i : Integer;
begin
  fDMConsPedido := TDMConsPedido.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedido);
  RadioGroup2Click(Sender);
  fDMConsPedido.cdsFilial.First;
  if (fDMConsPedido.cdsFilial.RecordCount < 2) and (fDMConsPedido.cdsFilialID.AsInteger > 0) then
    RxDBLookupCombo1.KeyValue := fDMConsPedido.cdsFilialID.AsInteger;
  Label9.Visible    := (fDMConsPedido.qParametros_LoteLOTE_TEXTIL.AsString = 'S');
  ComboBox2.Visible := (fDMConsPedido.qParametros_LoteLOTE_TEXTIL.AsString = 'S');

  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'DESC_TIPO_PRODUCAO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsPedido.qParametros_LoteLOTE_TEXTIL.AsString = 'S');
  end;
end;

procedure TfrmConsPedido_Fat.SMDBGrid1TitleClick(Column: TColumn);
var
  i : Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsPedido.cdsPedido_Fat.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsPedido_Fat.RadioGroup2Click(Sender: TObject);
var
  i : Integer;
  vColunaAux : String;
  vColunaAux2 : String;
begin
  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    //if (SMDBGrid1.Columns[i].FieldName = 'PRECO_CUSTO') OR (SMDBGrid1.Columns[i].FieldName = 'PRECO_VENDA') then
    if (SMDBGrid1.Columns[i].FieldName = 'VLR_TOTAL') OR (SMDBGrid1.Columns[i].FieldName = 'VLR_UNITARIO') OR
       (SMDBGrid1.Columns[i].FieldName = 'VLR_RESTANTE') OR (SMDBGrid1.Columns[i].FieldName = 'VLR_FATURADO') OR
       (SMDBGrid1.Columns[i].FieldName = 'VLR_CANCELADO') OR (SMDBGrid1.Columns[i].FieldName = 'VLR_DESCONTO') then
    begin
        SMDBGrid1.Columns[i].Visible := ckMostrarPreco.Checked;
    end;
    //if trim(vColunaAux2) <> '' then
    //  SMDBGrid1.Columns[i].Visible := (SMDBGrid1.Columns[i].FieldName <> vColunaAux2);
  end;

  for i := 1 to SMDBGrid4.ColCount - 2 do
  begin
    if (SMDBGrid4.Columns[i].FieldName = 'VLR_TOTAL') OR (SMDBGrid4.Columns[i].FieldName = 'VLR_UNITARIO') OR
       (SMDBGrid4.Columns[i].FieldName = 'VLR_RESTANTE') OR (SMDBGrid4.Columns[i].FieldName = 'VLR_FATURADO') OR
       (SMDBGrid4.Columns[i].FieldName = 'VLR_CANCELADO') OR (SMDBGrid4.Columns[i].FieldName = 'VLR_DESCONTO') then
    begin
        SMDBGrid4.Columns[i].Visible := ckMostrarPreco.Checked;
    end;
  end;
end;

procedure TfrmConsPedido_Fat.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    BitBtn1Click(Sender);
end;

procedure TfrmConsPedido_Fat.BitBtn2Click(Sender: TObject);
var
  vOpcaoAux : String;
  vArq : String;
begin
  fDMConsPedido.mUnidade.EmptyDataSet;
  vOpcaoAux := '';
  vTipo_Config_Email := 3;
  if RxDBLookupCombo1.Text <> '' then
    vOpcaoAux := vOpcaoAux + '(Filial: ' + RxDBLookupCombo1.Text + ')';
  if trim(edtCliente.Text) <> '' then
    vOpcaoAux := vOpcaoAux + '(Cliente: ' + edtCliente.Text + ')';
  if RxDBLookupCombo5.Text <> '' then
    vOpcaoAux := vOpcaoAux + '(Representante: ' + RxDBLookupCombo5.Text + ')';
  if RxDBLookupCombo4.Text <> '' then
    vOpcaoAux := vOpcaoAux + '(Refer�ncia: ' + RxDBLookupCombo4.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Fatura: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Fatura Ini: ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Fatura Fin: ' + DateEdit2.Text + ')';
  if trim(edtSerie.Text) <> '' then
    vOpcaoAux := vOpcaoAux + '(S�rie: ' + edtSerie.Text + ')';
  if (ceNotaIni.AsInteger > 0) and (ceNotaFinal.AsInteger > 0) then
    vOpcaoAux := vOpcaoAux + '(N.Nota: ' + ceNotaIni.Text + ' a ' + ceNotaFinal.Text + ')'
  else
  if (ceNotaIni.AsInteger > 0) then
    vOpcaoAux := vOpcaoAux + '(N.Nota Ini: ' + ceNotaIni.Text + ')'
  else
  if (ceNotaFinal.AsInteger > 0) then
    vOpcaoAux := vOpcaoAux + '(N.Nota Fin: ' + ceNotaFinal.Text + ')';
  if RzPageControl1.ActivePage = TS_Item then
  begin
    SMDBGrid1.DisableScroll;
    if ComboBox1.ItemIndex = 0 then
    begin
      fRelPedido_Fat := TfRelPedido_Fat.Create(Self);
      fRelPedido_Fat.fDMConsPedido := fDMConsPedido;
      fRelPedido_Fat.vImp_Vlr      := ckMostrarPreco.Checked;
      fRelPedido_Fat.vOpcaoImp     := vOpcaoAux;
      fRelPedido_Fat.RLReport1.PreviewModal;
      fRelPedido_Fat.RLReport1.Free;
      FreeAndNil(fRelPedido_Fat);
    end
    else
    if ComboBox1.ItemIndex = 1 then
    begin
      fDMConsPedido.cdsPedido_Fat.IndexFieldNames := 'NUM_PEDIDO';
      fDMConsPedido.cdsPedido_Fat.First;
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Nota_Por_Pedido.fr3';
      if FileExists(vArq) then
        fDMConsPedido.frxReport1.Report.LoadFromFile(vArq)
      else
      begin
        ShowMessage('Relatorio n�o localizado! ' + vArq);
        Exit;
      end;
      fDMConsPedido.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoAux);
      fDMConsPedido.frxReport1.ShowReport;
    end
    else
    begin
      fDMConsPedido.cdsPedido_Fat.IndexFieldNames := 'DESC_TIPO_PRODUCAO;NUM_PEDIDO';
      fDMConsPedido.cdsPedido_Fat.First;
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Nota_Por_Pedido_TipoProducao.fr3';
      if FileExists(vArq) then
        fDMConsPedido.frxReport1.Report.LoadFromFile(vArq)
      else
      begin
        ShowMessage('Relatorio n�o localizado! ' + vArq);
        Exit;
      end;
      fDMConsPedido.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoAux);
      fDMConsPedido.frxReport1.ShowReport;
    end;
    SMDBGrid1.EnableScroll;
  end
  else
  if RzPageControl1.ActivePage = TS_Pedido then
  begin
    SMDBGrid4.DisableScroll;
    fRelPedido_FatPed := TfRelPedido_FatPed.Create(Self);
    fRelPedido_FatPed.fDMConsPedido := fDMConsPedido;
    fRelPedido_FatPed.vImp_Vlr      := ckMostrarPreco.Checked;
    fRelPedido_FatPed.vOpcaoImp     := vOpcaoAux;
    fRelPedido_FatPed.RLReport1.PreviewModal;
    fRelPedido_FatPed.RLReport1.Free;
    FreeAndNil(fRelPedido_FatPed);
    SMDBGrid4.EnableScroll;
  end
  else
  if RzPageControl1.ActivePage = TS_Item_Acum then
  begin
    SMDBGrid5.DisableScroll;
    fDMConsPedido.cdsPedido_Fat_Acum.First;
    while not fDMConsPedido.cdsPedido_Fat_Acum.Eof do
    begin
      if fDMConsPedido.mUnidade.Locate('Unidade',fDMConsPedido.cdsPedido_Fat_AcumUNIDADE.AsString,([Locaseinsensitive])) then
        fDMConsPedido.mUnidade.Edit
      else
      begin
        fDMConsPedido.mUnidade.Insert;
        fDMConsPedido.mUnidadeUnidade.AsString := fDMConsPedido.cdsPedido_Fat_AcumUNIDADE.AsString;
      end;
      fDMConsPedido.mUnidadeQtd.AsFloat := fDMConsPedido.mUnidadeQtd.AsFloat + fDMConsPedido.cdsPedido_Fat_AcumQTD.AsFloat;
      fDMConsPedido.mUnidade.Post;
      fDMConsPedido.cdsPedido_Fat_Acum.Next;
    end;
    SMDBGrid5.EnableScroll;

    fDMConsPedido.cdsPedido_Fat_Acum.First;
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Pedido_Fat_Acum.fr3';
    if FileExists(vArq) then
      fDMConsPedido.frxReport1.Report.LoadFromFile(vArq)
    else
    begin
      ShowMessage('Relatorio n�o localizado! ' + vArq);
      Exit;
    end;
    fDMConsPedido.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoAux);
    fDMConsPedido.frxReport1.ShowReport;
  end;

end;

procedure TfrmConsPedido_Fat.RxDBLookupCombo4Enter(Sender: TObject);
begin
  fDMConsPedido.cdsProduto.IndexFieldNames := 'REFERENCIA';
end;

procedure TfrmConsPedido_Fat.RxDBLookupCombo3Enter(Sender: TObject);
begin
  fDMConsPedido.cdsProduto.IndexFieldNames := 'NOME';
end;

procedure TfrmConsPedido_Fat.RxDBLookupCombo4Change(Sender: TObject);
begin
  if RxDBLookupCombo4.Text <> '' then
    RxDBLookupCombo3.KeyValue := RxDBLookupCombo4.KeyValue;
end;

procedure TfrmConsPedido_Fat.RxDBLookupCombo3Change(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    RxDBLookupCombo4.KeyValue := RxDBLookupCombo3.KeyValue;
end;

procedure TfrmConsPedido_Fat.SMDBGrid4TitleClick(Column: TColumn);
var
  i : Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsPedido.cdsPedido_FatPed.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid4.Columns.Count - 1 do
    if not (SMDBGrid4.Columns.Items[I] = Column) then
      SMDBGrid4.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsPedido_Fat.RxDBLookupCombo5Enter(Sender: TObject);
begin
  fDMConsPedido.cdsVendedor.IndexFieldNames := 'NOME';
end;

procedure TfrmConsPedido_Fat.prc_Consultar_Faturas;
var
  vComando : String;
begin
  fDmConsPedido.cdsPedidoFaturas.Close;
  vComando := fDmConsPedido.ctPedFaturas; 
  if RxDBLookupCombo5.KeyValue > 0 then
    vComando := vComando +  ' AND NF.ID_VENDEDOR = ' + RxDBLookupCombo5.KeyValue;
  if trim(edtCliente.Text) <> '' then
    vComando := vComando +  ' AND CLI.NOME LIKE ' + QuotedStr('%'+edtCliente.Text+'%');
  if DateEdit1.Date > 0 then
    vComando := vComando +  ' AND NF.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.Date));
  if DateEdit2.Date > 0 then
    vComando := vComando +  ' AND NF.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.Date));
  if Edit1.Text <> '' then
    vComando := vComando +  ' AND NFPED.NUM_PEDIDO = ' + Edit1.Text;
  if trim(edtSerie.Text) <> '' then
    vComando := vComando + ' AND NF.SERIE = ' + QuotedStr(trim(edtSerie.Text));
  if ceNotaIni.AsInteger > 0 then
    vComando := vComando + ' AND NF.NUMNOTA >= ' + IntToStr(ceNotaIni.AsInteger);
  if ceNotaFinal.AsInteger > 0 then
    vComando := vComando + ' AND NF.NUMNOTA <= ' + IntToStr(ceNotaFinal.AsInteger);
  fDmConsPedido.sdsPedidoFaturas.CommandText := vComando + ' ORDER BY NFPED.NUM_PEDIDO';
  fDmConsPedido.cdsPedidoFaturas.Open;
end;

procedure TfrmConsPedido_Fat.BitBtn3Click(Sender: TObject);
begin
  if RzPageControl1.ActivePage <> TS_Fatura then
  begin
    ShowMessage('Esta aba n�o exporta para o Excel!');
    Exit;
  end;
  prc_CriaExcel(SMDBGrid2.DataSource);
end;

procedure TfrmConsPedido_Fat.prc_CriaExcel(vDados: TDataSource);
var
  planilha: variant;
  vTexto: string;
begin
  Screen.Cursor := crHourGlass;
  vDados.DataSet.First;

  planilha := CreateOleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do tela para o Excel';
  planilha.visible := true;

  prc_Preencher_Excel2(planilha, vDados, SMDBGrid2);

  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  vTexto := vTexto + Name + '_' + RzPageControl1.ActivePage.Caption;

  Planilha.ActiveWorkBook.SaveAs(vTexto);
  Screen.Cursor := crDefault;
end;

procedure TfrmConsPedido_Fat.prc_Consultar_TipoMat;
var
  vComandoAux, vComandoAux2: String;
  i: Integer;
  vComando : String;
begin
  fDMConsPedido.cdsTipoMat.Close;
  i := PosEx('GROUP',fDMConsPedido.ctTipoMat,0);
  vComandoAux  := copy(fDMConsPedido.ctTipoMat,i,Length(fDMConsPedido.ctTipoMat) - i + 1);
  vComandoAux2 := copy(fDMConsPedido.ctTipoMat,1,i-1);

  vComando := ' WHERE PED.TIPO_REG = ' + QuotedStr('P');
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND NT.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(edtCliente.Text) <> '' then
    vComando := vComando + ' AND PES.NOME LIKE ' + QuotedStr('%'+edtCliente.Text+'%');
  if RxDBLookupCombo3.Text <> '' then
    vComando := vComando + ' AND PI.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo3.KeyValue);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND NT.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND NT.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND PED.PEDIDO_CLIENTE LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  if ComboBox2.Visible then
  begin
    case ComboBox2.ItemIndex of
      1 : vComando := vComando + ' AND PROD.TIPO_PRODUCAO = ' + QuotedStr('T');
      2 : vComando := vComando + ' AND PROD.TIPO_PRODUCAO = ' + QuotedStr('E');
    end;
  end;
  if trim(edtSerie.Text) <> '' then
    vComando := vComando + ' AND NT.SERIE = ' + QuotedStr(trim(edtSerie.Text));
  if ceNotaIni.AsInteger > 0 then
    vComando := vComando + ' AND NT.NUMNOTA >= ' + IntToStr(ceNotaIni.AsInteger);
  if ceNotaFinal.AsInteger > 0 then
    vComando := vComando + ' AND NT.NUMNOTA <= ' + IntToStr(ceNotaFinal.AsInteger);
  fDMConsPedido.sdsTipoMat.CommandText := vComandoAux2 + vComando + vComandoAux;
  fDMConsPedido.cdsTipoMat.Open;
end;

procedure TfrmConsPedido_Fat.prc_Consultar_Fat_Acum;
var
  vComando : String;
  vComandoAux : String;
  i : Integer;
begin
  fDMConsPedido.cdsPedido_Fat_Acum.Close;
  i := PosEx('GROUP',fDMConsPedido.ctPedido_Fat_Acum,0);
  vComandoAux := copy(fDMConsPedido.ctPedido_Fat_Acum,i,Length(fDMConsPedido.ctPedido_Fat_Acum) - i + 1);
  vComando    := copy(fDMConsPedido.ctPedido_Fat_Acum,1,i-1);
  vComando := vComando + ' WHERE PED.TIPO_REG = ' + QuotedStr('P');

  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND NT.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(edtCliente.Text) <> '' then
    vComando := vComando + ' AND PES.NOME LIKE ' + QuotedStr('%'+edtCliente.Text+'%');
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND NT.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND NT.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND PED.PEDIDO_CLIENTE LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  if RxDBLookupCombo2.Text <> '' then
    vComando := vComando + ' AND GP.ID = ' + IntToStr(RxDBLookupCombo2.KeyValue);
  if ComboBox2.Visible then
  begin
    case ComboBox2.ItemIndex of
      1 : vComando := vComando + ' AND PROD.TIPO_PRODUCAO = ' + QuotedStr('T');
      2 : vComando := vComando + ' AND PROD.TIPO_PRODUCAO = ' + QuotedStr('E');
    end;
  end;
  if trim(edtSerie.Text) <> '' then
    vComando := vComando + ' AND NT.SERIE = ' + QuotedStr(trim(edtSerie.Text));
  if ceNotaIni.AsInteger > 0 then
    vComando := vComando + ' AND NT.NUMNOTA >= ' + IntToStr(ceNotaIni.AsInteger);
  if ceNotaFinal.AsInteger > 0 then
    vComando := vComando + ' AND NT.NUMNOTA <= ' + IntToStr(ceNotaFinal.AsInteger);
  fDMConsPedido.sdsPedido_Fat_Acum.CommandText := vComando + '  ' + vComandoAux;
  fDMConsPedido.cdsPedido_Fat_Acum.Open;
  fDMConsPedido.cdsPedido_Fat_Acum.IndexFieldNames := 'NOME_GRUPO_PESSOA;UNIDADE;REFERENCIA;NOME_PRODUTO;NOME_COR_COMBINACAO';
end;

procedure TfrmConsPedido_Fat.RzPageControl1Change(Sender: TObject);
begin
  Label10.Visible          := (RzPageControl1.ActivePage = TS_Item_Acum);
  RxDBLookupCombo2.Visible := (RzPageControl1.ActivePage = TS_Item_Acum);
  Label9.Visible    := (RzPageControl1.ActivePage <> TS_Fatura);
  ComboBox2.Visible := (RzPageControl1.ActivePage <> TS_Fatura);
end;

end.
