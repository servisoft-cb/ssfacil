unit UConsProduto_Vendas_PCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, UDMConsNotas, RxLookup, UCBase, Mask, ToolEdit, RzPanel,
  RzTabs, CurrEdit, NxEdit, NxCollection, ComObj, Menus, AdvPanel;

type
  TfrmConsProduto_Vendas_PCusto = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    Label5: TLabel;
    edtCliente: TEdit;
    edtReferencia: TEdit;
    edtNomeProduto: TEdit;
    Shape1: TShape;
    Label7: TLabel;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsNotas: TDMConsNotas;
    vOpcaoImp: String;

    procedure prc_Monta_Cab;

    procedure prc_Consultar_Produto_VendasPCusto;

  public
    { Public declarations }
  end;

var
  frmConsProduto_Vendas_PCusto: TfrmConsProduto_Vendas_PCusto;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, StrUtils;

{$R *.dfm}

procedure TfrmConsProduto_Vendas_PCusto.btnConsultarClick(Sender: TObject);
begin
  if (DateEdit1.Date < 10) or (DateEdit2.Date < 10) then
  begin
    MessageDlg('*** É obrigatório informar a data inicial e final!', mtError, [mbOk], 0);
    exit;
  end;
  prc_Consultar_Produto_VendasPCusto;
  fDMConsNotas.cdsConsProduto_VendasPCusto.IndexFieldNames := 'NOME_PRODUTO_COMP;DTEMISSAO';
end;

procedure TfrmConsProduto_Vendas_PCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsProduto_Vendas_PCusto.FormShow(Sender: TObject);
var
  vTexto1, vTexto2: String;
  i: Integer;
begin
  fDMConsNotas := TDMConsNotas.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsNotas);
  fDMConsNotas.cdsFilial.First;

  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_COR') or (SMDBGrid1.Columns[i].FieldName = 'ID_COR') then
      SMDBGrid1.Columns[i].Visible := ((fDMConsNotas.qParametrosINFORMAR_COR_MATERIAL.AsString = 'S')
                                       or (fDMConsNotas.qParametrosINFORMAR_COR_PROD.AsString = 'C') or (fDMConsNotas.qParametrosINFORMAR_COR_PROD.AsString = 'B'));
    if (SMDBGrid1.Columns[i].FieldName = 'TAMANHO') then
      SMDBGrid1.Columns[i].Visible :=(fDMConsNotas.qParametrosUSA_GRADE.AsString = 'S');
  end;
end;

procedure TfrmConsProduto_Vendas_PCusto.prc_Consultar_Produto_VendasPCusto;
var
  vComando : String;
begin
  fDMConsNotas.cdsConsProduto_VendasPCusto.Close;
  vComando := vComando + ' AND M.DTEMISSAO BETWEEN ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                             + ' AND ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND M.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(edtCliente.Text) <> '' then
    vComando := vComando + ' AND PES.NOME LIKE ' + QuotedStr('%'+edtCliente.Text+'%');
  if trim(edtNomeProduto.Text) <> '' then
    vComando := vComando + ' AND PROD.NOME LIKE ' + QuotedStr('%'+edtNomeProduto.Text+'%');
  if trim(edtReferencia.Text) <> '' then
    vComando := vComando + ' AND PROD.REFERENCIA LIKE ' + QuotedStr('%'+edtReferencia.Text+'%');
  fDMConsNotas.sdsConsProduto_VendasPCusto.CommandText := fDMConsNotas.ctConsProduto_VendasPCusto + vComando;
  fDMConsNotas.cdsConsProduto_VendasPCusto.Open;
end;

procedure TfrmConsProduto_Vendas_PCusto.prc_Monta_Cab;
begin
  vTipo_Config_Email := 3;
  fDMConsNotas.vDescOpcao_Rel := '';
  if RxDBLookupCombo1.Text <> '' then
    fDMConsNotas.vDescOpcao_Rel := fDMConsNotas.vDescOpcao_Rel + '(Filial: ' + RxDBLookupCombo1.Text + ')';
  if edtCliente.Text <> '' then
    fDMConsNotas.vDescOpcao_Rel := fDMConsNotas.vDescOpcao_Rel + '(Cli: ' + edtCliente.Text + ')';
  if edtNomeProduto.Text <> '' then
    fDMConsNotas.vDescOpcao_Rel := fDMConsNotas.vDescOpcao_Rel + '(Prod: ' + edtNomeProduto.Text + ')';
  if edtReferencia.Text <> '' then
    fDMConsNotas.vDescOpcao_Rel := fDMConsNotas.vDescOpcao_Rel + '(Ref: ' + edtReferencia.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    fDMConsNotas.vDescOpcao_Rel := fDMConsNotas.vDescOpcao_Rel + '(Dt.Emissão: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')';
end;

procedure TfrmConsProduto_Vendas_PCusto.SMDBGrid1GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if (fDMConsNotas.cdsConsProduto_VendasPCusto.Active) and (fDMConsNotas.cdsConsProduto_VendasPCusto.RecordCount > 0) and
     (StrToFloat(FormatFloat('0.00000',fDMConsNotas.cdsConsProduto_VendasPCustoPRECO_CUSTO.AsFloat)) <= 0) then
    Background := clYellow;
end;

procedure TfrmConsProduto_Vendas_PCusto.btnImprimirClick(Sender: TObject);
var
  vArq : String;
begin
  fDMConsNotas.cdsConsProduto_VendasPCusto.IndexFieldNames := 'NOME_PRODUTO_COMP;DTEMISSAO';
  if not(fDMConsNotas.cdsConsProduto_VendasPCusto.Active) or (fDMConsNotas.cdsConsProduto_VendasPCusto.IsEmpty) then
    exit;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Produto_Vendas_PCusto.fr3';
  if not FileExists(vArq) then
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDMConsNotas.frxReport1.Report.LoadFromFile(vArq);
  fDMConsNotas.frxReport1.variables['OpcaoImp'] := QuotedStr(vOpcaoImp);
  fDMConsNotas.frxReport1.ShowReport;
end;

end.
