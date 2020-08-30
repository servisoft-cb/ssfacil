unit uConsEstoque_Compras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, NxCollection, StdCtrls, Mask, ToolEdit, UDMCompras, SqlExpr,
  NxEdit, Grids, DBGrids, SMDBGrid, AdvPanel, RxLookup, CurrEdit, DB;
  //SysUtils, Classes, FMTBcd, DB, DBClient, Provider, , dbXPress, Math, Messages, Dialogs, LogTypes, Variants, frxClass, frxDBSet;


type
  TfrmConsEstoque_Compras = class(TForm)
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel1: TNxPanel;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label1: TLabel;
    Edit1: TEdit;
    btnGerarOC: TNxButton;
    NxComboBox1: TNxComboBox;
    Label2: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    Label6: TLabel;
    Shape2: TShape;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnGerarOCClick(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    fDMCompras: TDMCompras;

    procedure prc_Consultar;

  public
    { Public declarations }
  end;

var
  frmConsEstoque_Compras: TfrmConsEstoque_Compras;

implementation

uses rsDBUtils, DmdDatabase, uUtilPadrao, USel_Produto, StrUtils;

{$R *.dfm}

procedure TfrmConsEstoque_Compras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsEstoque_Compras.prc_Consultar;
var
  vComandoAux, vComandoAux2: String;
  i : Integer;
begin
  fDMCompras.cdsEstoque_Compras.Close;
  i := PosEx(') AUX',uppercase(fDMCompras.ctEstoque_Compras),0);
  vComandoAux  := copy(fDMCompras.ctEstoque_Compras,i,Length(fDMCompras.ctEstoque_Compras) - i + 1);
  vComandoAux2 := copy(fDMCompras.ctEstoque_Compras,1,i-1);

  case NxComboBox1.ItemIndex of
    0 : vComandoAux2 := vComandoAux2 + ' WHERE ((VP.TIPO_REG = ' + QuotedStr('P') + ') or (VP.TIPO_REG = ' + QuotedStr('S') + '))';
    1 : vComandoAux2 := vComandoAux2 + ' WHERE VP.TIPO_REG = ' + QuotedStr('M');
    2 : vComandoAux2 := vComandoAux2 + ' WHERE VP.TIPO_REG = ' + QuotedStr('C');
  end;
  if CurrencyEdit1.AsInteger > 0 then
    vComandoAux2 := vComandoAux2 + ' AND VP.ID = ' + IntToStr(CurrencyEdit1.AsInteger)
  else
  if trim(Edit1.Text) <> '' then
    vComandoAux2 := vComandoAux2 + ' AND VP.NOME_PRODUTO LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  fDMCompras.sdsEstoque_Compras.CommandText := vComandoAux2 + vComandoAux;
  if RxDBLookupCombo1.Text <> '' then
    fDMCompras.sdsEstoque_Compras.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue
  else
    fDMCompras.sdsEstoque_Compras.ParamByName('FILIAL').AsInteger := 0;
  fDMCompras.cdsEstoque_Compras.Open;
end;

procedure TfrmConsEstoque_Compras.FormShow(Sender: TObject);
var
  i : Integer;
  vCorMat : String;
  vCorProd : String;
begin
  fDMCompras := TDMCompras.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCompras);
  fDMCompras.cdsFilial.Open;

  vCorMat  := SQLLocate('PARAMETROS','ID','INFORMAR_COR_MATERIAL','1');
  vCorProd := SQLLocate('PARAMETROS','ID','INFORMAR_COR_PROD','1');

  for i := 0 to SMDBGrid1.ColCount - 2 do
  begin
    if SMDBGrid1.Columns[i].FieldName = 'NOME_COR' then
      SMDBGrid1.Columns[i].Visible := ((vCorMat = 'S') or (vCorProd = 'C') or (vCorProd = 'B'));
    if SMDBGrid1.Columns[i].FieldName = 'TAMANHO' then
      SMDBGrid1.Columns[i].Visible := (SQLLocate('PARAMETROS','ID','USA_GRADE','1') = 'S');
  end;
end;

procedure TfrmConsEstoque_Compras.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsEstoque_Compras.btnImprimirClick(Sender: TObject);
var
  vOpcaoAux : String;
  vArq : String;
begin
  {vOpcaoAux := '';
  if RxDBLookupCombo1.Text <> '' then
    vOpcaoAux := vOpcaoAux + '(Filial: ' + RxDBLookupCombo1.TEdit + ')';
  if CurrencyEdit1.AsInteger > 0 then
    vOpcaoAux := vOpcaoAux + '(ID.Produto: ' + CurrencyEdit1.Text + ')'
  else
  if trim(Edit1.Text) <> '' then
    vOpcaoAux := vOpcaoAux + '(Nome Produto: ' + Edit1.Text + ')';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Faturamento_Consumo.fr3';
  if FileExists(vArq) then
    fDMCompras.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMCompras.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoAux);
  fDMCompras.frxReport1.ShowReport;}
end;

procedure TfrmConsEstoque_Compras.btnGerarOCClick(Sender: TObject);
begin
  ShowMessage('Esta sendo implementado!');
end;

procedure TfrmConsEstoque_Compras.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    if CurrencyEdit1.AsInteger > 0 then
      btnConsultarClick(Sender)
    else
      Edit1.SetFocus;
  end
  else
  if (Key = Vk_F2) then
  begin
    vCodProduto_Pos := CurrencyEdit1.AsInteger;
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.vTipo_Prod := '';
    frmSel_Produto.ShowModal;
    CurrencyEdit1.AsInteger := vCodProduto_Pos;
    Edit1.Text := vNome_Pos;
  end;
end;

procedure TfrmConsEstoque_Compras.Edit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    btnConsultarClick(Sender);
end;

procedure TfrmConsEstoque_Compras.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger > 0 then
  begin
    Edit1.Text := SQLLocate('PRODUTO','ID','NOME',CurrencyEdit1.Text);
    if trim(Edit1.Text) = '' then
    begin
      MessageDlg('*** Código do Produto não encontrado!', mtError, [mbOk], 0);
      CurrencyEdit1.SetFocus;
      exit;
    end;
  end;
  Label5.Visible := False;
end;

procedure TfrmConsEstoque_Compras.CurrencyEdit1Enter(Sender: TObject);
begin
  Label5.Visible := True;
end;

procedure TfrmConsEstoque_Compras.SMDBGrid1TitleClick(Column: TColumn);
begin
  fDMCompras.cdsEstoque_Compras.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsEstoque_Compras.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if StrToFloat(FormatFloat('0.0000',fDMCompras.cdsEstoque_ComprasSALDO.AsFloat)) < 0 then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end
  else
  if StrToFloat(FormatFloat('0.0000',fDMCompras.cdsEstoque_ComprasSALDO_MIN.AsFloat)) < StrToFloat(FormatFloat('0.0000',fDMCompras.cdsEstoque_ComprasQTD_ESTOQUE_MIN.AsFloat))  then
  begin
    Background  := clYellow;
    AFont.Color := clBlack;
  end;
end;

end.
