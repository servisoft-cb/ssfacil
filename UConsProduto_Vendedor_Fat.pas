unit UConsProduto_Vendedor_Fat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMComissaoVend, StdCtrls, ExtCtrls, RxLookup, NxCollection,
  Mask, ToolEdit, CurrEdit, Grids, DBGrids, SMDBGrid, DB, ComObj;

type
  TfrmConsProduto_Vendedor_Fat = class(TForm)
    Panel2: TPanel;
    Label6: TLabel;
    btnConsultar: TNxButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    btnExcel: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    fDMComissaoVend: TDMComissaoVend;

    procedure prc_Consulta;
    procedure prc_CriaExcel(vDados: TDataSource);

  public
    { Public declarations }
  end;

var
  frmConsProduto_Vendedor_Fat: TfrmConsProduto_Vendedor_Fat;

implementation

uses rsDBUtils, uUtilPadrao;

{$R *.dfm}

procedure TfrmConsProduto_Vendedor_Fat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsProduto_Vendedor_Fat.FormShow(Sender: TObject);
begin
  fDMComissaoVend := TDMComissaoVend.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMComissaoVend);
end;

procedure TfrmConsProduto_Vendedor_Fat.btnConsultarClick(Sender: TObject);
begin
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** É obrigatório informar a data inicial e final!', mtError, [mbOk], 0);
    exit;
  end;
  prc_Consulta;
end;

procedure TfrmConsProduto_Vendedor_Fat.prc_Consulta;
var
  vComando : String;
begin
  fDMComissaoVend.cdsConsProdFat.Close;
  vComando := '';
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND N.ID_VENDEDOR = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND N.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND N.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  fDMComissaoVend.sdsConsProdFat.CommandText := fDMComissaoVend.ctConsProdFat + vComando;
  fDMComissaoVend.cdsConsProdFat.Open;
end;

procedure TfrmConsProduto_Vendedor_Fat.btnExcelClick(Sender: TObject);
begin
  prc_CriaExcel(SMDBGrid1.DataSource);
end;

procedure TfrmConsProduto_Vendedor_Fat.prc_CriaExcel(vDados: TDataSource);
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

  vTexto := vTexto + Name + '_Produto_Vendedor_Fat';

  Planilha.ActiveWorkBook.SaveAs(vTexto);
  Screen.Cursor := crDefault;
end;

end.
