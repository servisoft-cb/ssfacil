unit UConsEstoque_Transf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, ExtCtrls, AdvPanel, NxEdit,
  NxCollection, StdCtrls, Mask, ToolEdit, UDMConsEstoque, RxLookup, DBCtrls;

type
  TfrmConsEstoque_Transf = class(TForm)
    NxPanel1: TNxPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    edtRef: TEdit;
    NxPanel2: TNxPanel;
    NxLabel1: TNxLabel;
    DBEdit1: TDBEdit;
    NxLabel2: TNxLabel;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsEstoque: TDMConsEstoque;

    procedure prc_Consultar;
    function fnc_Monta_Cab : String;

  public
    { Public declarations }
  end;

var
  frmConsEstoque_Transf: TfrmConsEstoque_Transf;

implementation

uses rsDBUtils, StrUtils;

{$R *.dfm}

procedure TfrmConsEstoque_Transf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMConsEstoque);
  Action := Cafree;
end;

procedure TfrmConsEstoque_Transf.FormShow(Sender: TObject);
begin
  fDMConsEstoque := TDMConsEstoque.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsEstoque);
end;

procedure TfrmConsEstoque_Transf.btnConsultarClick(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
  begin
    MessageDlg('*** Filial não informada', mtError, [mbOk], 0);
    RxDBLookupCombo1.SetFocus;
    exit;
  end;
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** É obrigatório informar a data inicial e final', mtError, [mbOk], 0);
    DateEdit1.SetFocus;
    exit;
  end;
  if (DateEdit1.Date > DateEdit2.Date) then
  begin
    MessageDlg('*** Data inicial não pode ser maior que a final', mtError, [mbOk], 0);
    DateEdit1.SetFocus;
    exit;
  end;
  prc_Consultar;

  
  
end;

procedure TfrmConsEstoque_Transf.prc_Consultar;
var
  vComandoAux, vComandoAux2: String;
  i: Integer;
begin
  fDMConsEstoque.cdsEstoque_Transf.Close;
  i := PosEx('GROUP',UpperCase(fDMConsEstoque.ctEstoque_Transf),0);
  vComandoAux  := copy(fDMConsEstoque.ctEstoque_Transf,i,Length(fDMConsEstoque.ctEstoque_Transf) - i + 1);
  vComandoAux2 := copy(fDMConsEstoque.ctEstoque_Transf,1,i-1);
  if trim(edtRef.Text) <> '' then
    vComandoAux2 := vComandoAux2 + ' AND P.REFERENCIA = ' + QuotedStr(edtRef.Text);
  fDMConsEstoque.sdsEstoque_Transf.CommandText := vComandoAux2 + vComandoAux;
  fDMConsEstoque.sdsEstoque_Transf.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
  fDMConsEstoque.sdsEstoque_Transf.ParamByName('data1').AsDate := DateEdit1.Date;
  fDMConsEstoque.sdsEstoque_Transf.ParamByName('data2').AsDate := DateEdit2.Date;
  fDMConsEstoque.cdsEstoque_Transf.Open;
end;

procedure TfrmConsEstoque_Transf.btnImprimirClick(Sender: TObject);
var
  vArq: string;
begin
  fDMConsEstoque.cdsEstoque_Transf.First;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Estoque_Transf.fr3';
  if FileExists(vArq) then
    fDMConsEstoque.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDMConsEstoque.frxReport1.variables['ImpOpcao'] := QuotedStr(fnc_Monta_Cab);
  fDMConsEstoque.frxReport1.ShowReport;
end;

function TfrmConsEstoque_Transf.fnc_Monta_Cab: String;
var
  vAux : String;
begin
  vAux := '';
  if RxDBLookupCombo1.Text <> '' then
    vAux := '(Filial: ' + RxDBLookupCombo1.Text + ') ';
  vAux := vAux + '(Data ini: ' + DateEdit1.Text + ' até ' + DateEdit2.Text + ') ';
  if trim(edtRef.Text) <> '' then
  vAux   := vAux + '(Ref: ' + edtRef.Text + ')';
  Result := vAux;
end;

end.
