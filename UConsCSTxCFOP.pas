unit UConsCSTxCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, NxCollection, UDMConsFat,
  Grids, DBGrids, SMDBGrid;

type
  TfrmConsCSTxCFOP = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    cbxEmpresa: TComboBox;
    Label4: TLabel;
    btnConsultar: TNxButton;
    SMDBGrid1: TSMDBGrid;
    btnImprimir: TNxButton;
    cbxEntradaSaida: TComboBox;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsFat: TDMConsFat;
    vOpcaoImp : String;

    procedure prc_Consultar;
    procedure prc_Monta_Cab;

  public
    { Public declarations }
  end;

var
  frmConsCSTxCFOP: TfrmConsCSTxCFOP;

implementation

uses rsDBUtils;


{$R *.dfm}

procedure TfrmConsCSTxCFOP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsCSTxCFOP.FormShow(Sender: TObject);
begin
  fDMConsFat := TDMConsFat.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsFat);
end;

procedure TfrmConsCSTxCFOP.btnConsultarClick(Sender: TObject);
begin
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('É obrigatório informar a data de inicio e fim!',mtInformation,[mbOk],0);
    Exit;
  end;

  prc_Consultar;
end;

procedure TfrmConsCSTxCFOP.prc_Consultar;
var
  vComando : String;
begin
  vComando := '';
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND N.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND N.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND N.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case cbxEmpresa.ItemIndex of
    1 : vComando := vComando + ' AND ICMS.TIPO = ' + QuotedStr('N');
    2 : vComando := vComando + ' AND ICMS.TIPO = ' + QuotedStr('S');
  end;
  case cbxEntradaSaida.ItemIndex of
    1 : vComando := vComando + ' AND N.TIPO_NOTA = ' + QuotedStr('E');
    2 : vComando := vComando + ' AND N.TIPO_NOTA = ' + QuotedStr('S');
  end;
  fDMConsFat.cdsCSTICMS_CFOP.Close;
  fDMConsFat.sdsCSTICMS_CFOP.CommandText := fDMConsFat.ctCSTICMS_CFOP + vComando;
  fDMConsFat.cdsCSTICMS_CFOP.Open;
end;

procedure TfrmConsCSTxCFOP.btnImprimirClick(Sender: TObject);
var
  vArq: string;
begin
  prc_Monta_Cab;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CSTICMSxCFOP.fr3';
  if FileExists(vArq) then
    fDMConsFat.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMConsFat.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  fDMConsFat.frxReport1.ShowReport;
end;

procedure TfrmConsCSTxCFOP.prc_Monta_Cab;
begin
  vOpcaoImp := '';
  if RxDBLookupCombo1.Text <> '' then
    vOpcaoImp := vOpcaoImp + '(Filial:' + RxDBLookupCombo1.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt.Inicial: ' + DateEdit1.Text + '  Final: ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt.Inicial: )'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt.Final: )';
  case cbxEmpresa.ItemIndex of
    1: vOpcaoImp := vOpcaoImp + '(Empresa do Geral)';
    2: vOpcaoImp := vOpcaoImp + '(Empresa do Simples)';
  end;
  case cbxEntradaSaida.ItemIndex of
    1: vOpcaoImp := vOpcaoImp + '(Notas de Entradas)';
    2: vOpcaoImp := vOpcaoImp + '(Notas de Saídas)';
  end;
end;

end.
