unit UConsReceberContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, SMDBGrid, ExtCtrls, AdvPanel,
  RxLookup, NxEdit, StdCtrls, Mask, ToolEdit, NxCollection, UDMConsDuplicata;

type
  TfrmConsReceberContas = class(TForm)
    NxPanel1: TNxPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    cbOpcao: TNxComboBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    Label3: TLabel;
    Label6: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Label7: TLabel;
    Edit1: TEdit;
    NxCheckBox1: TNxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsDuplicata: TDMConsDuplicata;

    procedure prc_Consultar;

  public
    { Public declarations }
  end;

var
  frmConsReceberContas: TfrmConsReceberContas;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmConsReceberContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsReceberContas.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsReceberContas.prc_Consultar;
var
  vComando : String;
begin
  vComando := fDMConsDuplicata.ctReceberContas;
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND D.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND D.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND D.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND D.DTVENCIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND D.DTVENCIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
  case cbOpcao.ItemIndex of
    1 : vComando := vComando + ' AND D.VLR_RESTANTE > 0 ';
    2 : vComando := vComando + ' AND D.VLR_RESTANTE <= 0 ';
  end;
  if NxCheckBox1.Checked then
    vComando := vComando + ' AND D.ID_CONTA_BOLETO IS NOT NULL ';
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND (P.NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%') + ' OR P.FANTASIA LIKE ' + QuotedStr('%'+Edit1.Text+'%') + ')';
  fDMConsDuplicata.cdsReceberContas.Close;
  fDMConsDuplicata.sdsReceberContas.CommandText := vComando;
  fDMConsDuplicata.cdsReceberContas.Open;
  fDMConsDuplicata.cdsReceberContas.IndexFieldNames := 'NOME_CONTA;DTVENCIMENTO;NUMDUPLICATA;PARCELA';
end;

procedure TfrmConsReceberContas.FormShow(Sender: TObject);
begin
  fDMConsDuplicata := TDMConsDuplicata.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsDuplicata);

end;

procedure TfrmConsReceberContas.btnImprimirClick(Sender: TObject);
var
  vOpcaoAux : String;
  vArq : String;
begin
  vOpcaoAux := '';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Emissão: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Emissão Ini: ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Emissão Final: ' + DateEdit2.Text + ')';
  if (DateEdit3.Date > 10) and (DateEdit4.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Vencimento: ' + DateEdit3.Text + ' a ' + DateEdit4.Text + ')'
  else
  if (DateEdit3.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Vencimento Ini: ' + DateEdit3.Text + ')'
  else
  if (DateEdit4.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Vencimento Final: ' + DateEdit4.Text + ')';
  case cbOpcao.ItemIndex of
    1 : vOpcaoAux := vOpcaoAux + ' (Em Aberto)';
    2 : vOpcaoAux := vOpcaoAux + ' (Quitados)';
  end;
  if RxDBLookupCombo1.Text <> '' then
    vOpcaoAux := vOpcaoAux + ' (Filial: ' + RxDBLookupCombo1.Text + ')';
  if trim(Edit1.Text) <> '' then
    vOpcaoAux := vOpcaoAux + ' (Cliente: ' + Edit1.Text + ')';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\ReceberContas.fr3';
  if FileExists(vArq) then
    fDMConsDuplicata.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMConsDuplicata.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoAux);
  fDMConsDuplicata.frxReport1.ShowReport;
end;

end.
