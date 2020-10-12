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
    SMDBGrid19: TSMDBGrid;
    Label1: TLabel;
    Label5: TLabel;
    edtCliente: TEdit;
    edtReferencia: TEdit;
    edtNomeProduto: TEdit;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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

end;

procedure TfrmConsProduto_Vendas_PCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsProduto_Vendas_PCusto.FormShow(Sender: TObject);
var
  vTexto1, vTexto2: String;
begin
  fDMConsNotas := TDMConsNotas.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsNotas);
  fDMConsNotas.cdsFilial.First;
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

end.
