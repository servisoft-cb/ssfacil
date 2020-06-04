unit UCadAjuste_Preco_Sel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, UDMCadAjuste_Preco,  Mask, ToolEdit, CurrEdit,
  NxCollection;

type
  TfrmCadAjuste_Preco_Sel = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    Label2: TLabel;
    Edit1: TEdit;
    Label68: TLabel;
    ComboBox2: TComboBox;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    lblNomeGrupo: TLabel;
    Label4: TLabel;
    btnConsulta: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
  private
    { Private declarations }
    vItem_Local : Integer;
    procedure prc_Gravar_Itens;
    procedure prc_Le_Grupo;
    procedure prc_Consultar_Produto;

  public
    { Public declarations }
    fDMCadAjuste_Preco: TDMCadAjuste_Preco;
  end;
var
  frmCadAjuste_Preco_Sel: TfrmCadAjuste_Preco_Sel;

implementation

uses uUtilPadrao, rsDBUtils, USel_Grupo;

{$R *.dfm}

procedure TfrmCadAjuste_Preco_Sel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadAjuste_Preco_Sel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

procedure TfrmCadAjuste_Preco_Sel.FormShow(Sender: TObject);
var
  i: Integer;
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadAjuste_Preco);
end;

procedure TfrmCadAjuste_Preco_Sel.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadAjuste_Preco.cdsProduto.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmCadAjuste_Preco_Sel.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Confirmar a transferência de produtos?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  SMDBGrid1.DisableScroll;
  fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.Last;
  vItem_Local := fDMCadAjuste_Preco.cdsAjuste_Preco_ItensITEM.AsInteger;
  fDMCadAjuste_Preco.cdsProduto.First;
  while not fDMCadAjuste_Preco.cdsProduto.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) and (StrToFloat(FormatFloat('0.0000',fDMCadAjuste_Preco.cdsProdutoPRECO_VENDA.AsFloat)) > 0)
    and not(fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.Locate('ID_PRODUTO', fDMCadAjuste_Preco.cdsProdutoID_PRODUTO.AsInteger,[loCaseInsensitive])) then
      prc_Gravar_Itens;
    fDMCadAjuste_Preco.cdsProduto.Next;
  end;
  SMDBGrid1.EnableScroll;
  Close;
end;

procedure TfrmCadAjuste_Preco_Sel.Edit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultaClick(Sender);
end;

procedure TfrmCadAjuste_Preco_Sel.prc_Gravar_Itens;
var
  vAux: Real;
  vPreco_Origem: Real;
begin
  vPreco_Origem := 0;
  vItem_Local := vItem_Local + 1;
  fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.Insert;
  fDMCadAjuste_Preco.cdsAjuste_Preco_ItensID.AsInteger   := fDMCadAjuste_Preco.cdsAjuste_PrecoID.AsInteger;
  fDMCadAjuste_Preco.cdsAjuste_Preco_ItensITEM.AsInteger := vItem_Local;
  fDMCadAjuste_Preco.cdsAjuste_Preco_ItensID_PRODUTO.AsInteger := fDMCadAjuste_Preco.cdsProdutoID_PRODUTO.AsInteger;
  fDMCadAjuste_Preco.cdsAjuste_Preco_ItensPRECO_ANT.AsFloat    := fDMCadAjuste_Preco.cdsProdutoPRECO_VENDA.AsFloat;
  vAux := 0;
  if (StrToFloat(FormatFloat('0.00',fDMCadAjuste_Preco.cdsProdutoPRECO_VENDA.AsFloat)) > 0) then
    vAux := StrToFloat(FormatFloat('0.00',((fDMCadAjuste_Preco.cdsProdutoPRECO_VENDA.AsFloat * fDMCadAjuste_Preco.cdsAjuste_PrecoPERC_AJUSTE.AsFloat) / 100)));
  if fDMCadAjuste_Preco.cdsAjuste_PrecoTIPO.AsString = 'A' then
    fDMCadAjuste_Preco.cdsAjuste_Preco_ItensPRECO_NOVO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadAjuste_Preco.cdsAjuste_Preco_ItensPRECO_ANT.AsFloat + vAux))
  else
    fDMCadAjuste_Preco.cdsAjuste_Preco_ItensPRECO_NOVO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadAjuste_Preco.cdsAjuste_Preco_ItensPRECO_ANT.AsFloat - vAux));
  fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.Post;
end;

procedure TfrmCadAjuste_Preco_Sel.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vID_Grupo_Pos := CurrencyEdit1.AsInteger;
    frmSel_Grupo  := TfrmSel_Grupo.Create(Self);
    frmSel_Grupo.ShowModal;
    CurrencyEdit1.AsInteger := vID_Grupo_Pos;
    FreeAndNil(frmSel_Grupo);
  end
  else
  if Key = Vk_Return then
    CurrencyEdit1Exit(Sender);
end;

procedure TfrmCadAjuste_Preco_Sel.CurrencyEdit1Exit(Sender: TObject);
begin
  lblNomeGrupo.Caption := '';
  if CurrencyEdit1.AsInteger > 0 then
  begin
    prc_Le_Grupo;
    if (fDMCadAjuste_Preco.qGrupo.IsEmpty) then
    begin
      MessageDlg('*** Grupo não encontrado!', mtError, [mbOk], 0);
      CurrencyEdit1.SetFocus;
      exit;
    end;
    lblNomeGrupo.Caption := fDMCadAjuste_Preco.qGrupoNOME.AsString;
  end;
end;

procedure TfrmCadAjuste_Preco_Sel.prc_Le_Grupo;
begin
  fDMCadAjuste_Preco.qGrupo.Close;
  fDMCadAjuste_Preco.qGrupo.ParamByName('ID').AsInteger := CurrencyEdit1.AsInteger;
  fDMCadAjuste_Preco.qGrupo.Open;
end;

procedure TfrmCadAjuste_Preco_Sel.btnConsultaClick(Sender: TObject);
begin
  prc_Consultar_Produto;
end;

procedure TfrmCadAjuste_Preco_Sel.prc_Consultar_Produto;
var
  vComando : String;
begin
  case ComboBox2.ItemIndex of
    0 : vComando := ' AND P.TIPO_REG = ' + QuotedStr('P');
    1 : vComando := ' AND P.TIPO_REG = ' + QuotedStr('M');
    2 : vComando := ' AND P.TIPO_REG = ' + QuotedStr('S');
  end;
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND P.NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  if CurrencyEdit1.AsInteger > 0 then
  begin
    if fDMCadAjuste_Preco.qGrupoTIPO.AsString = 'A' then
      vComando := vComando + ' AND G.ID = ' + IntToStr(CurrencyEdit1.AsInteger)
    else
    if fDMCadAjuste_Preco.qGrupoTIPO.AsString = 'S' then
      vComando := vComando + ' AND G.SUPERIOR = ' + QuotedStr(CurrencyEdit1.Text);
  end;
  fDMCadAjuste_Preco.cdsProduto.Close;
  fDMCadAjuste_Preco.sdsProduto.CommandText := fDMCadAjuste_Preco.ctProduto + vComando;
  fDMCadAjuste_Preco.cdsProduto.Open;
  
  
end;

end.
