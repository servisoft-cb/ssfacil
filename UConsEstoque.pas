unit UConsEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, Mask, 
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, UDMConsEstoque, RxLookup, UCBase, NxCollection, ToolEdit, CurrEdit,
  UConsProduto_Pes, UConsEstoque_Mov, Menus;

type
  TfrmConsEstoque = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtRef: TEdit;
    SMDBGrid1: TSMDBGrid;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RadioGroup1: TRadioGroup;
    rgTipo: TRadioGroup;
    ckPrecoCusto: TCheckBox;
    Label3: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label4: TLabel;
    rxdbGrupo: TRxDBLookupCombo;
    ckInativo: TCheckBox;
    btnConsultar: TNxButton;
    Panel2: TPanel;
    btnImprimir_Est: TNxButton;
    NxButton1: TNxButton;
    Label5: TLabel;
    ceIDProduto: TCurrencyEdit;
    UCControls1: TUCControls;
    ckPrecoVenda: TCheckBox;
    Label6: TLabel;
    rxdbLocalEstoque: TRxDBLookupCombo;
    Label7: TLabel;
    Label8: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label9: TLabel;
    PopupMenu1: TPopupMenu;
    Produtos1: TMenuItem;
    Marca1: TMenuItem;
    Produto1: TMenuItem;
    ckImpAgrupado: TCheckBox;
    ckImpInventario: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label12: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure rgTipoClick(Sender: TObject);
    procedure edtRefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure rxdbGrupoEnter(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnConsultarClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure ceIDProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxdbGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxdbLocalEstoqueExit(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Produto1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
  private
    { Private declarations }
    fDMConsEstoque: TDMConsEstoque;
    ColunaOrdenada: String;
    ffrmConsProduto_Pes: TfrmConsProduto_Pes;
    ffrmConsEstoque_Mov: TfrmConsEstoque_Mov;

    procedure prc_Grava_Marca;
    procedure prc_Consultar;
    procedure prc_Monta_Cab;
    procedure prc_Chamar_Sel_Produto(Tipo: String);
  public
    { Public declarations }
  end;

var
  frmConsEstoque: TfrmConsEstoque;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, URelEstoque, URelInventario, USel_Grupo, USel_Produto, uConsProduto_Compras, StrUtils,
  UConsEstoque_Prod_Mov;

{$R *.dfm}

procedure TfrmConsEstoque.prc_Consultar;
var
  vQtdAux: Integer;
  Form: TForm;
begin
  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);

  try
    vQtdAux := 0;
    fDMConsEstoque.cdsEstoque.Close;
    fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.ctEstoque + ' WHERE (0 = 0) ';
    if ckInativo.Checked then
      fDMConsEstoque.sdsEstoque.CommandText := AnsiReplaceText(fDMConsEstoque.sdsEstoque.CommandText, 'AND PRO.INATIVO = ' +QuotedStr('N'), '');
    if RxDBLookupCombo3.KeyValue > 0 then
      fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.ID_FORNECEDOR = ' + IntToStr(RxDBLookupCombo3.KeyValue);
    if ceIDProduto.AsInteger > 0 then
      fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.ID = ' + ceIDProduto.Text
    else
    begin
      if trim(edtRef.Text) <> '' then
        fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.REFERENCIA LIKE ' + QuotedStr('%'+edtRef.Text+'%')
      else
      begin
        case RadioGroup1.ItemIndex of
          0: fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.QTD > ' + IntToStr(vQtdAux);
          1: fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.QTD < ' + IntToStr(vQtdAux);
          2: fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND coalesce(AUX.QTD,0) < coalesce(AUX.QTD_ESTOQUE_MIN,0) ';
          3: fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.QTD = 0 ';
        end;
      end;
      if RxDBLookupCombo2.Text <> '' then
        fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.ID_MARCA = ' + IntToStr(RxDBLookupCombo2.KeyValue);
      if rxdbGrupo.Text <> '' then
        fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.ID_GRUPO = ' + IntToStr(rxdbGrupo.KeyValue);
    end;
    if fDMConsEstoque.qParametros_EstUSA_QTD_INI.AsString = 'S' then
    begin
      if CurrencyEdit1.Value > 0 then
        fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.QTDGERAL >= ' + CurrencyEdit1.Text;
      if CurrencyEdit2.Value > 0 then
        fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText + ' AND AUX.QTDGERAL <= ' + CurrencyEdit2.Text;
    end;
    if rxdbLocalEstoque.Text <> '' then
      fDMConsEstoque.sdsEstoque.CommandText := fDMConsEstoque.sdsEstoque.CommandText
                                            + ' AND ((AUX.ID_LOCAL_ESTOQUE = ' + IntToStr(rxdbLocalEstoque.KeyValue) + ')'
                                            + ' OR (AUX.ID_LOCAL_ESTOQUE is null))';
    if RxDBLookupCombo1.Text <> '' then
      fDMConsEstoque.sdsEstoque.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
    case rgTipo.ItemIndex of
      0: fDMConsEstoque.sdsEstoque.ParamByName('TIPO_REG').AsString := 'P';
      1: fDMConsEstoque.sdsEstoque.ParamByName('TIPO_REG').AsString := 'M';
      2: fDMConsEstoque.sdsEstoque.ParamByName('TIPO_REG').AsString := 'C';
      3: fDMConsEstoque.sdsEstoque.ParamByName('TIPO_REG').AsString := 'S';
      4: fDMConsEstoque.sdsEstoque.ParamByName('TIPO_REG').AsString := 'I';
    end;
    fDMConsEstoque.cdsEstoque.Open;
  finally
    FreeAndNil(Form);
  end;
end;

procedure TfrmConsEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  prc_Grava_Grid(SMDBGrid1, Name, fDMConsEstoque.qParametros_GeralENDGRIDS.AsString);
  Action := Cafree;
end;

procedure TfrmConsEstoque.FormShow(Sender: TObject);
var
  i: Integer;
begin
  fDMConsEstoque := TDMConsEstoque.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsEstoque);
  prc_le_Grid(SMDBGrid1, Name, fDMConsEstoque.qParametros_GeralENDGRIDS.AsString);
  rgTipoClick(Sender);
  fDMConsEstoque.cdsFilial.First;
  if (fDMConsEstoque.cdsFilial.RecordCount < 2) and (fDMConsEstoque.cdsFilialID.AsInteger > 0) then
    RxDBLookupCombo1.KeyValue := fDMConsEstoque.cdsFilialID.AsInteger;
  Label6.Visible           := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
  rxdbLocalEstoque.Visible := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');

  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_LOCAL') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'COD_LOCAL') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'NUM_LOTE_CONTROLE') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametros_ProdUSA_LOTE_PROD.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'QTDGERAL') then
      SMDBGrid1.Columns[i].Visible := ((fDMConsEstoque.qParametros_EstUSA_QTD_INI.AsString = 'S') and (fDMConsEstoque.cdsFilial.RecordCount > 1));
    if (SMDBGrid1.Columns[i].FieldName = 'QTD_SUB_SALDO') or (SMDBGrid1.Columns[i].FieldName = 'QTD_SALDO_FINAL') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametros_EstUSA_RESERVA.AsString = 'S');
  end;

  Label8.Visible        := (fDMConsEstoque.qParametros_EstUSA_QTD_INI.AsString = 'S');
  CurrencyEdit1.Visible := (fDMConsEstoque.qParametros_EstUSA_QTD_INI.AsString = 'S');
  Label9.Visible        := (fDMConsEstoque.qParametros_EstUSA_QTD_INI.AsString = 'S');
  CurrencyEdit2.Visible := (fDMConsEstoque.qParametros_EstUSA_QTD_INI.AsString = 'S');
  if fDMConsEstoque.qParametros_EstUSA_QTD_INI.AsString = 'S' then
    Panel1.Height := 129
  else
    Panel1.Height := 107;
end;

procedure TfrmConsEstoque.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsEstoque.cdsEstoque.IndexFieldNames := Column.FieldName + ';TAMPRODUTO';
  //Column.Title.Color := clBtnShadow;
  //for i := 0 to SMDBGrid1.Columns.Count - 1 do
  //  if not (SMDBGrid1.Columns.Items[I] = Column) then
  //    SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsEstoque.rgTipoClick(Sender: TObject);
var
  i: Integer;
  vColunaAux: String;
  vColunaAux2: String;
begin
  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'QTD_RESERVA') then
      SMDBGrid1.Columns[i].Visible := ((fDMConsEstoque.qParametros_EstUSA_RESERVA.AsString = 'S') and (rgTipo.ItemIndex = 1))
                                      or ((fDMConsEstoque.qParametros_EstUSA_RESERVA_PROD.AsString = 'S')
                                           and ((rgTipo.ItemIndex = 0) or (rgTipo.ItemIndex = 3)));
    if (SMDBGrid1.Columns[i].FieldName = 'QTD_SALDO_OC') then
      SMDBGrid1.Columns[i].Visible := ((fDMConsEstoque.qParametros_EstUSA_RESERVA.AsString = 'S') and (rgTipo.ItemIndex = 1));

    if (SMDBGrid1.Columns[i].FieldName = 'PRECO_CUSTO') OR
       (SMDBGrid1.Columns[i].FieldName = 'clTotal_Custo') then
      SMDBGrid1.Columns[i].Visible := ckPrecoCusto.Checked;

    if (SMDBGrid1.Columns[i].FieldName = 'PRECO_VENDA') OR
       (SMDBGrid1.Columns[i].FieldName = 'clTotal_Venda') then
      SMDBGrid1.Columns[i].Visible := ckPrecoVenda.Checked;

    if (SMDBGrid1.Columns[i].FieldName = 'TAMPRODUTO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_GRADE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_COR') then
      SMDBGrid1.Columns[i].Visible := ((fDMConsEstoque.qParametrosINFORMAR_COR_MATERIAL.AsString = 'S') or
      (fDMConsEstoque.qParametrosINFORMAR_COR_PROD.AsString = 'C'));              
  end;
end;

procedure TfrmConsEstoque.edtRefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender)
  else
  if (Key = Vk_F2) then
    prc_Chamar_Sel_Produto('R');
end;

procedure TfrmConsEstoque.RxDBLookupCombo2Enter(Sender: TObject);
begin
  fDMConsEstoque.cdsMarca.IndexFieldNames := 'NOME';
end;

procedure TfrmConsEstoque.rxdbGrupoEnter(Sender: TObject);
begin
  fDMConsEstoque.cdsGrupo.IndexFieldNames := 'NOME';
end;

procedure TfrmConsEstoque.RxDBLookupCombo4Enter(Sender: TObject);
begin
  fDMConsEstoque.cdsSubGrupo.IndexFieldNames := 'NOME';
end;

procedure TfrmConsEstoque.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if StrToFloat(FormatFloat('0.000000',fDMConsEstoque.cdsEstoqueQTD.AsFloat)) = 0 then
  begin
    AFont.Color := clRed;
    AFont.Style := [];
  end
  else
  if StrToFloat(FormatFloat('0.000000',fDMConsEstoque.cdsEstoqueQTD.AsFloat)) < 0 then
  begin
    AFont.Color := clRed;
    AFont.Style := [fsBold];
  end
  else
  if StrToFloat(FormatFloat('0.000000',fDMConsEstoque.cdsEstoqueQTD.AsFloat)) <
     StrToFloat(FormatFloat('0.000000',fDMConsEstoque.cdsEstoqueQTD_ESTOQUE_MIN.AsFloat)) then
  begin
    AFont.Color := clMaroon;
    Background  := clYellow;
    AFont.Style := [];
  end;
end;

procedure TfrmConsEstoque.btnConsultarClick(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
  begin
    ShowMessage('Filial n�o informada!');
    RxDBLookupCombo1.SetFocus;
    exit;
  end;

  if fDMConsEstoque.qParametrosUSA_GRADE.AsString = 'S' then
    fDMConsEstoque.cdsEstoque.IndexFieldNames := 'NOMEPRODUTO;NOME_COR;TAMPRODUTO'
  else
    fDMConsEstoque.cdsEstoque.IndexFieldNames := 'NOMEPRODUTO';
  prc_Consultar;
end;

procedure TfrmConsEstoque.NxButton1Click(Sender: TObject);
begin
  if trim(RxDBLookupCombo1.Text) = '' then
  begin
    MessageDlg('*** Filial n�o informada', mtError, [mbOk], 0);
    exit;
  end;
  if not(fDMConsEstoque.cdsEstoque.Active) or (fDMConsEstoque.cdsEstoque.IsEmpty) then
  begin
    MessageDlg('*** Efetuar pesquisa antes de imprimir!', mtError, [mbOk], 0);
    exit;
  end;
  SMDBGrid1.DisableScroll;
  try
    vTipo_Config_Email := 4;
    prc_Monta_Cab;
    fDMConsEstoque.cdsFilial.Locate('ID',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
    if ckImpInventario.Checked then
      fDMConsEstoque.cdsEstoque.IndexFieldNames := 'NOMEGRUPO;NOMEPRODUTO;NOME_COR;TAMPRODUTO'
    else
      fDMConsEstoque.cdsEstoque.IndexFieldNames := 'NOMEPRODUTO;NOME_COR;TAMPRODUTO';
    fRelInventario                := TfRelInventario.Create(Self);
    if ckImpInventario.Checked then
      fRelInventario.vOrderm := 'G'
    else
      fRelInventario.vOrderm := 'N';
    fRelInventario.fDMConsEstoque := fDMConsEstoque;
    fRelInventario.fDMConsEstoque := fDMConsEstoque;
    fRelInventario.RLReport1.PreviewModal;
    fRelInventario.RLReport1.Free;
    FreeAndNil(fRelInventario);
  finally
    SMDBGrid1.EnableScroll;
  end;
end;

procedure TfrmConsEstoque.ceIDProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender)
  else
  if (Key = Vk_F2) then
    prc_Chamar_Sel_Produto('P');
end;

procedure TfrmConsEstoque.rxdbGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if rxdbGrupo.Text <> '' then
      vID_Grupo_Pos := rxdbGrupo.KeyValue;
    frmSel_Grupo := TfrmSel_Grupo.Create(Self);
    frmSel_Grupo.ShowModal;
    if vID_Grupo_Pos > 0 then
    begin
      rxdbGrupo.KeyValue := vID_Grupo_Pos;
      rxdbGrupo.SetFocus;
    end;
  end;
end;

procedure TfrmConsEstoque.prc_Monta_Cab;
begin
  fDMConsEstoque.vDescOpcao_Rel := '';
  if RxDBLookupCombo1.Text <> '' then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Filial: ' + RxDBLookupCombo1.Text + ')';
  if RxDBLookupCombo2.Text <> '' then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Marca: ' + RxDBLookupCombo2.Text + ')';
  if rxdbGrupo.Text <> '' then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Estrutura: ' + rxdbGrupo.Text + ')';
  if rxdbLocalEstoque.Text <> '' then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Local: ' + rxdbLocalEstoque.Text + ')';
  case RadioGroup1.ItemIndex of
    0: fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Com Saldo)';
    1: fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Saldo Negativo)';
    2: fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Estoque M�nimo)';
  end;
  fDMConsEstoque.vOpcao_ProdMat := '';
  case rgTipo.ItemIndex of
    0: fDMConsEstoque.vOpcao_ProdMat := fDMConsEstoque.vOpcao_ProdMat + 'PRODUTO';
    1: fDMConsEstoque.vOpcao_ProdMat := fDMConsEstoque.vOpcao_ProdMat + 'MATERIAL';
    2: fDMConsEstoque.vOpcao_ProdMat := fDMConsEstoque.vOpcao_ProdMat + 'MATERIAL DE CONSUMO';
    3: fDMConsEstoque.vOpcao_ProdMat := fDMConsEstoque.vOpcao_ProdMat + 'SEMI ACABADO';
    4: fDMConsEstoque.vOpcao_ProdMat := fDMConsEstoque.vOpcao_ProdMat + 'IMOBILIZADO';
  end;
end;

procedure TfrmConsEstoque.rxdbLocalEstoqueExit(Sender: TObject);
begin
  if rxdbLocalEstoque.Text <> '' then
    RadioGroup1.ItemIndex := 0;
end;

procedure TfrmConsEstoque.prc_Chamar_Sel_Produto(Tipo: String);
begin
  vCodProduto_Pos := 0;
  frmSel_Produto := TfrmSel_Produto.Create(Self);
  frmSel_Produto.ShowModal;
  FreeAndNil(frmSel_Produto);
  if vCodProduto_Pos > 0 then
  begin
    edtRef.Text := vReferencia_Pos;
    ceIDProduto.AsInteger := vCodProduto_Pos;
    if Tipo = 'R' then
      edtRef.SetFocus
    else
      ceIDProduto.SetFocus;
  end;
end;

procedure TfrmConsEstoque.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vId: Integer;
  vTipoReg: String;
  vIndexName, vIndexValue: String;
begin
  if (Key = Vk_F6) and not(fDMConsEstoque.cdsEstoque.IsEmpty) then
  begin
    vId := fDMConsEstoque.cdsEstoqueID.AsInteger;
    //vIndexName  := fDMConsEstoque.cdsEstoque.IndexFieldNames;
    frmConsEstoque_Prod_Mov   := TfrmConsEstoque_Prod_Mov.Create(self);
    if Trim(RxDBLookupCombo1.Text) <> '' then
    begin
      frmConsEstoque_Prod_Mov.vFilial_Loc := RxDBLookupCombo1.KeyValue;
      frmConsEstoque_Prod_Mov.Edit1.Text  := RxDBLookupCombo1.Text;
    end;
    frmConsEstoque_Prod_Mov.CurrencyEdit1.Text := fDMConsEstoque.cdsEstoqueID.AsString;
    frmConsEstoque_Prod_Mov.Edit3.Text         := fDMConsEstoque.cdsEstoqueNOMEPRODUTO.AsString;
    frmConsEstoque_Prod_Mov.vID_Cor_Loc        := fDMConsEstoque.cdsEstoqueID_COR_COMBINACAO.AsInteger;
    frmConsEstoque_Prod_Mov.fDMConsEstoque     := fDMConsEstoque;
    frmConsEstoque_Prod_Mov.ShowModal;
    FreeAndNil(frmConsEstoque_Prod_Mov);
  end;
  if (Key = Vk_F7) and not(fDMConsEstoque.cdsEstoque.IsEmpty) then
  begin
    case rgTipo.ItemIndex of
      0: vTipoReg := 'P';
      1: vTipoReg := 'M';
      2: vTipoReg := 'C';
      3: vTipoReg := 'S';
      4: vTipoReg := 'I';
    end;
    vId := fDMConsEstoque.cdsEstoqueID.AsInteger;
    vIndexName  := fDMConsEstoque.cdsEstoque.IndexFieldNames;
    ceIDProduto.AsInteger := vId;
    ffrmConsEstoque_Mov   := TfrmConsEstoque_Mov.Create(self);
    vControleExterno      := True;
    ffrmConsEstoque_Mov.RxDBLookupCombo1.KeyValue := RxDBLookupCombo1.KeyValue;
    ffrmConsEstoque_Mov.ceIDProduto.AsInteger := ceIDProduto.AsInteger;
    ffrmConsEstoque_Mov.edtRef.Text := edtRef.Text;
    ffrmConsEstoque_Mov.WindowState := wsMaximized;
    ffrmConsEstoque_Mov.ShowModal;
    ceIDProduto.Clear;
    FreeAndNil(frmConsEstoque_Mov);
  end;
  if (Key = Vk_F8) and not(fDMConsEstoque.cdsEstoque.IsEmpty) then
  begin
    frmConsProduto_Compras := TfrmConsProduto_Compras.Create(Self);
    frmConsProduto_Compras.vIdProd := fDMConsEstoque.cdsEstoqueID.AsInteger;
    frmConsProduto_Compras.ShowModal;
    FreeAndNil(frmConsProduto_Compras);
  end;
end;

procedure TfrmConsEstoque.Produto1Click(Sender: TObject);
begin
  if not(fDMConsEstoque.cdsEstoque.Active) or (fDMConsEstoque.cdsEstoque.IsEmpty) then
  begin
    MessageDlg('*** Efetuar pesquisa antes de imprimir!', mtError, [mbOk], 0);
    exit;
  end;

  SMDBGrid1.DisableScroll;
  try
    vTipo_Config_Email := 4;
    prc_Monta_Cab;
    fRelEstoque                := TfRelEstoque.Create(Self);
    fRelEstoque.fDMConsEstoque := fDMConsEstoque;
    fRelEstoque.vImpQtdGeral   := (fDMConsEstoque.cdsEstoque.RecordCount > 1);
    if (ckPrecoCusto.Checked) or (ckPrecoVenda.Checked) then
    begin
      fRelEstoque.vPrecoCusto := ckPrecoCusto.Checked;
      fRelEstoque.vPrecoVenda := ckPrecoVenda.Checked;
      fRelEstoque.RLReport2.PreviewModal;
      fRelEstoque.RLReport2.Free;
      FreeAndNil(fRelEstoque);
    end
    else
    begin
      fRelEstoque.RLReport1.PreviewModal;
      fRelEstoque.RLReport1.Free;
      FreeAndNil(fRelEstoque);
    end;
  finally
    SMDBGrid1.EnableScroll;
  end;        
end;

procedure TfrmConsEstoque.Marca1Click(Sender: TObject);
var
  vArq: String;
begin
  fDMConsEstoque.mProduto_Marca.EmptyDataSet;
  SMDBGrid1.DisableScroll;
  prc_Grava_Marca;
  fDMConsEstoque.cdsEstoque.First;
  fDMConsEstoque.mProduto_Marca.First;
  fDMConsEstoque.mProduto_Marca.IndexFieldNames := 'ID_MARCA;REFERENCIA';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Consulta_Estoque_Marca.fr3';
  if FileExists(vArq) then
    fDMConsEstoque.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relat�rio n�o localizado: ' + vArq);
    Exit;
  end;
  SMDBGrid1.EnableScroll;
  fDMConsEstoque.frxReport1.ShowReport;
end;

procedure TfrmConsEstoque.prc_Grava_Marca;
begin
  while not fDMConsEstoque.cdsEstoque.Eof do
  begin
    if fDMConsEstoque.mProduto_Marca.Locate('ID;ID_Marca',VarArrayOf([fDMConsEstoque.cdsEstoqueID.AsInteger,fDMConsEstoque.cdsEstoqueID_MARCA.AsInteger]),[locaseinsensitive]) then
      fDMConsEstoque.mProduto_Marca.Edit
    else
    begin
      fDMConsEstoque.mProduto_Marca.Insert;
      fDMConsEstoque.mProduto_MarcaID.AsInteger                   := fDMConsEstoque.cdsEstoqueID.AsInteger;
      fDMConsEstoque.mProduto_MarcaNome_Produto.AsString          := fDMConsEstoque.cdsEstoqueNOMEPRODUTO.AsString;
      fDMConsEstoque.mProduto_MarcaID_Marca.AsInteger             := fDMConsEstoque.cdsEstoqueID_MARCA.AsInteger;
      fDMConsEstoque.mProduto_MarcaNome_Marca.AsString            := fDMConsEstoque.cdsEstoqueNOMEMARCA.AsString;
      fDMConsEstoque.mProduto_MarcaReferencia.AsString            := fDMConsEstoque.cdsEstoqueREFERENCIA.AsString;
      fDMConsEstoque.mProduto_MarcaUnidade.AsString               := fDMConsEstoque.cdsEstoqueUNIDADE.AsString;
      fDMConsEstoque.mProduto_MarcaQtde_Embalagem.AsFloat         := fDMConsEstoque.cdsEstoqueQTD_EMBALAGEM.AsFloat;
      fDMConsEstoque.mProduto_MarcaQtde_Peca_Embalagem.AsFloat    := fDMConsEstoque.cdsEstoqueQTD_PECA_EMB.AsFloat;
      fDMConsEstoque.mProduto_MarcaID_Grupo.AsInteger             := fDMConsEstoque.cdsEstoqueID_GRUPO.AsInteger;
      fDMConsEstoque.mProduto_MarcaNome_Grupo.AsString            := fDMConsEstoque.cdsEstoqueNOMEGRUPO.AsString;
      fDMConsEstoque.mProduto_MarcaQtde_Estoque.AsFloat           := 0;
    end;
    fDMConsEstoque.mProduto_MarcaQtde_Estoque.AsFloat             := fDMConsEstoque.mProduto_MarcaQtde_Estoque.AsFloat + fDMConsEstoque.cdsEstoqueQTD.AsFloat;
    fDMConsEstoque.mProduto_Marca.Post;
    fDMConsEstoque.cdsEstoque.Next;
  end;
end;

procedure TfrmConsEstoque.Produtos1Click(Sender: TObject);
var
  vArq: String;
begin
  fDMConsEstoque.mProduto_Marca.EmptyDataSet;
  prc_Grava_Marca;
  fDMConsEstoque.cdsEstoque.First;
  fDMConsEstoque.mProduto_Marca.First;
  fDMConsEstoque.mProduto_Marca.IndexFieldNames := 'ID_Grupo;REFERENCIA';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Consulta_Estoque_Grupo.fr3';
  if FileExists(vArq) then
    fDMConsEstoque.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relat�rio n�o localizado: ' + vArq);
    Exit;
  end;
  fDMConsEstoque.frxReport1.ShowReport;          
end;

procedure TfrmConsEstoque.RxDBLookupCombo3Enter(Sender: TObject);
begin
  fDMConsEstoque.cdsPessoa.IndexFieldNames := 'NOME';
end;

end.
