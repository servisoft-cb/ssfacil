unit UConsPedido_Est;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, RxLookup, ExtCtrls, Grids, DBGrids,
  SMDBGrid, NxCollection, UDMConsPedido, DB, ComObj;

type
  TfrmConsPedido_Est = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    Label9: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SMDBGrid1: TSMDBGrid;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    btnExcel: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsPedido: TDMConsPedido;
    
    procedure prc_Consultar;
    procedure prc_CriaExcel(vDados: TDataSource);

  public
    { Public declarations }
  end;

var
  frmConsPedido_Est: TfrmConsPedido_Est;

implementation

uses rsDBUtils, StrUtils, uUtilPadrao;

{$R *.dfm}

procedure TfrmConsPedido_Est.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedido_Est.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsPedido_Est.prc_Consultar;
var
  vComandoAux: String;
  vComando : String;
  i: Integer;
begin
  fDMConsPedido.cdsPedido_Est.Close;
  i := PosEx('GROUP',UpperCase(fDMConsPedido.ctPedido_Est),0);
  vComandoAux := copy(fDMConsPedido.ctPedido_Est,i,Length(fDMConsPedido.ctPedido_Est) - i + 1);
  vComando    := copy(fDMConsPedido.ctPedido_Est,1,i-1);

  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND P.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if RxDBLookupCombo2.Text <> '' then
    vComando := vComando + ' AND P.ID_CLIENTE = ' + IntToStr(RxDBLookupCombo2.KeyValue);
  if RxDBLookupCombo3.Text <> '' then
    vComando := vComando + ' AND i.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo3.KeyValue)
  else
  if RxDBLookupCombo4.Text <> '' then
    vComando := vComando + ' AND i.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo4.KeyValue);
  if RxDBLookupCombo5.Text <> '' then
    vComando := vComando + ' AND p.ID_VENDEDOR = ' + IntToStr(RxDBLookupCombo5.KeyValue);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND p.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND p.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  fDMConsPedido.sdsPedido_Est.CommandText := vComando + '  ' + vComandoAux;
  fDMConsPedido.cdsPedido_Est.Open;
  fDMConsPedido.cdsPedido_Est.IndexFieldNames := 'ID_PRODUTO';
end;

procedure TfrmConsPedido_Est.FormShow(Sender: TObject);
begin
  fDMConsPedido := TDMConsPedido.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedido);
end;

procedure TfrmConsPedido_Est.btnImprimirClick(Sender: TObject);
var
  vOpcaoAux: String;
  vArq: String;
begin
  fDMConsPedido.cdsPedido_Est.IndexFieldNames := 'ID_PRODUTO;ESPESSURA';
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
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Pedido_Est.fr3';
  if FileExists(vArq) then
    fDMConsPedido.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMConsPedido.frxReport1.variables['Opcao_Imp'] := QuotedStr(vOpcaoAux);
  fDMConsPedido.frxReport1.ShowReport;
end;

procedure TfrmConsPedido_Est.SMDBGrid1TitleClick(Column: TColumn);
begin
  fDMConsPedido.cdsPedido_Est.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsPedido_Est.RxDBLookupCombo4Exit(Sender: TObject);
begin
  if RxDBLookupCombo4.Text <> '' then
  begin
    if RxDBLookupCombo4.KeyValue <> fDMConsPedido.cdsProdutoID.AsInteger then
      fDMConsPedido.cdsProduto.Locate('ID',RxDBLookupCombo4.KeyValue,[loCaseInsensitive]);
    RxDBLookupCombo3.KeyValue := fDMConsPedido.cdsProdutoID.AsInteger;
  end;
end;

procedure TfrmConsPedido_Est.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
  begin
    if RxDBLookupCombo3.KeyValue <> fDMConsPedido.cdsProdutoID.AsInteger then
      fDMConsPedido.cdsProduto.Locate('ID',RxDBLookupCombo3.KeyValue,[loCaseInsensitive]);
    RxDBLookupCombo4.KeyValue := fDMConsPedido.cdsProdutoID.AsInteger;
  end;
end;

procedure TfrmConsPedido_Est.btnExcelClick(Sender: TObject);
begin
  prc_CriaExcel(SMDBGrid1.DataSource);
end;

procedure TfrmConsPedido_Est.prc_CriaExcel(vDados: TDataSource);
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

  prc_Preencher_Excel2(planilha, vDados, SMDBGrid1);

  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  vTexto := vTexto + Name + '_Pedido_Estoque';

  Planilha.ActiveWorkBook.SaveAs(vTexto);
  Screen.Cursor := crDefault;
end;

end.
