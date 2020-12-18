unit uConsPedConsumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, NxCollection, StdCtrls, Mask, ToolEdit, UDMConsFat, SqlExpr,
  NxEdit, Grids, DBGrids, SMDBGrid, AdvPanel, ComCtrls, RxLookup;
  //SysUtils, Classes, FMTBcd, DB, DBClient, Provider, , dbXPress, Math, Messages, Dialogs, LogTypes, Variants, frxClass, frxDBSet;


type
  TfrmConsPedConsumo = class(TForm)
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel1: TNxPanel;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    cbTipo: TNxComboBox;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    cbOpcao: TNxComboBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsFat: TDMConsFat;

    procedure prc_Consultar;

  public
    { Public declarations }
  end;

var
  frmConsPedConsumo: TfrmConsPedConsumo;

implementation

uses rsDBUtils, DB, DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfrmConsPedConsumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedConsumo.prc_Consultar;
var
  vComando : String;
begin
  vComando := 'select  aux.id_material, aux.nome_material, aux.id_cor, aux.nome_cor_mat, sum(aux.total_consumo) total_consumo, '
            + 'sum(aux.total_consumo_rest) total_consumo_rest, sum(aux.total_consumo_fat) total_consumo_fat, '
            + 'aux.tipo_reg, aux.unidade_mat '
            + 'from(select v.id_material, V.nome_material, V.id_cor, V.nome_cor_mat, V.total_consumo, '
            + 'V.total_consumo_rest, V.total_consumo_fat, '
            + 'V.tipo_reg, V.unidade_mat '
            + 'from vconsumoped v '
            + 'WHERE 0 = 0 ';

  if DateEdit1.Date > 10 then
    vComando := vComando + '  AND V.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + '  AND V.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case cbTipo.ItemIndex of
    1 : vComando := vComando + ' AND  V.TIPO_PRODUCAO = ' + QuotedStr('T');
    2 : vComando := vComando + ' AND  V.TIPO_PRODUCAO = ' + QuotedStr('E');
  end;
  case cbOpcao.ItemIndex of
    1 : vComando := vComando + ' AND  V.QTD_RESTANTE > 0 ';
    2 : vComando := vComando + ' AND  V.QTD_FATURADO > 0 ';
  end;
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND  V.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  vComando := vComando + ') aux '
            + 'GROUP BY aux.id_material, aux.nome_material, aux.id_cor, aux.nome_cor_mat, aux.tipo_reg, aux.unidade_mat ';
  fDMConsFat.cdsConsPedConsumo.Close;
  fDMConsFat.sdsConsPedConsumo.CommandText := vComando;
  fDMConsFat.cdsConsPedConsumo.Open;
end;

procedure TfrmConsPedConsumo.FormShow(Sender: TObject);
begin
  fDMConsFat := TDMConsFat.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsFat);
  fDMConsFat.qParametros_Lote.Close;
  fDMConsFat.qParametros_Lote.Open;
  Label3.Visible := (fDMConsFat.qParametros_LoteLOTE_TEXTIL.AsString = 'S');
  cbTipo.Visible := (fDMConsFat.qParametros_LoteLOTE_TEXTIL.AsString = 'S');
end;

procedure TfrmConsPedConsumo.btnConsultarClick(Sender: TObject);
var
  Form : TForm;
begin
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** É obrigatório informar a data inicial e final!',mtInformation,[mbOk],0);
    Exit;
  end;
  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);
  try
    SMDBGrid1.DisableScroll;
    prc_Consultar;
  finally
    SMDBGrid1.EnableScroll;
    FreeAndNil(Form);
  end;
end;

procedure TfrmConsPedConsumo.btnImprimirClick(Sender: TObject);
var
  vOpcaoAux : String;
  vArq : String;
begin
  vOpcaoAux := '';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Emissão: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')';
  case cbTipo.ItemIndex of
    1 : vOpcaoAux := vOpcaoAux + ' (Trançadeira)';
    2 : vOpcaoAux := vOpcaoAux + ' (Tear)';
  end;
  case cbOpcao.ItemIndex of
    1 : vOpcaoAux := vOpcaoAux + ' (Pedidos Pendentes)';
    2 : vOpcaoAux := vOpcaoAux + ' (Pedidos Faturados)';
  end;
  if RxDBLookupCombo1.Text <> '' then
    vOpcaoAux := vOpcaoAux + ' (' + RxDBLookupCombo1.Text + ')';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Pedido_Consumo.fr3';
  if FileExists(vArq) then
    fDMConsFat.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMConsFat.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoAux);
  fDMConsFat.frxReport1.ShowReport;
end;

end.
