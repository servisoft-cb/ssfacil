unit UConsPedido_Rep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxCollection, Grids, DBGrids, SMDBGrid, ExtCtrls, AdvPanel, UDMConsPedidoCom,
  StdCtrls, Mask, ToolEdit, NxEdit;

type
  TfrmConsPedido_Rep = class(TForm)
    pnlPrincipal: TAdvPanel;
    NxPanel1: TNxPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    Edit1: TEdit;
    btnConsultar: TNxButton;
    SMDBGrid1: TSMDBGrid;
    cbBoxTipo: TNxComboBox;
    Label4: TLabel;
    btnImprimir: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsPedidoCom: TDMConsPedidoCom;

    procedure prc_Consultar;
    
  public
    { Public declarations }
  end;

var
  frmConsPedido_Rep: TfrmConsPedido_Rep;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmConsPedido_Rep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedido_Rep.FormShow(Sender: TObject);
begin
  fDMConsPedidoCom := TDMConsPedidoCom.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedidoCom);
end;

procedure TfrmConsPedido_Rep.btnConsultarClick(Sender: TObject);
begin
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** É obrigatório informar a data inicial e final!',mtInformation,[mbOk],0);
    Exit;
  end;
  prc_Consultar;
end;

procedure TfrmConsPedido_Rep.prc_Consultar;
var
  vComando : String;
begin
  vComando := ' WHERE 0 = 0 ';
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND PED.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND PED.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND CLI.NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  case cbBoxTipo.ItemIndex of
    1 : vComando := vComando + ' AND COALESCE(PED.AMOSTRA,'+QuotedStr('N')+' ) = ' + QuotedStr('N');
    2 : vComando := vComando + ' AND COALESCE(PED.AMOSTRA,'+QuotedStr('N')+' ) = ' + QuotedStr('S');
  end;
  fDMConsPedidoCom.cdsConsPedido.Close;
  fDMConsPedidoCom.sdsConsPedido.CommandText := fDMConsPedidoCom.ctConsPedido + vComando;
  fDMConsPedidoCom.cdsConsPedido.Open;
end;

procedure TfrmConsPedido_Rep.btnImprimirClick(Sender: TObject);
var
  vOpcaoAux : String;
  vArq : String;
begin
  vOpcaoAux := '';
  if trim(Edit1.Text) <> '' then
    vOpcaoAux := vOpcaoAux + '(Cliente: ' + Edit1.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Emissão: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')';
  fDMConsPedidoCom.cdsConsPedido.IndexFieldNames := 'NOME_CLIENTE;ID_CLIENTE';
  fDMConsPedidoCom.cdsConsPedido.First;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Cons_Pedido_Rep.fr3';
  if FileExists(vArq) then
    fDMConsPedidoCom.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMConsPedidoCom.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoAux);
  fDMConsPedidoCom.frxReport1.ShowReport;
end;

end.
