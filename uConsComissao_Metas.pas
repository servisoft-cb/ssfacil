unit uConsComissao_Metas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, NxCollection, StdCtrls, Mask, ToolEdit, Grids,
  DBGrids, SMDBGrid, uUtilPadrao, AdvPanel, UDMComissao, 
  Menus, RzPanel, RzTabs;

type
  TfrmConsComissao_Metas = class(TForm)
    pnlPrincipal: TPanel;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtInicial: TDateEdit;
    dtFinal: TDateEdit;
    btnConsultar: TNxButton;
    Label4: TLabel;
    ComboVendedor: TRxDBLookupCombo;
    btnReimprimir: TNxButton;
    RzPageControl1: TRzPageControl;
    TS_Vendedor: TRzTabSheet;
    TS_Vendedor_Det: TRzTabSheet;
    Panel1: TPanel;
    ckImpCupom: TCheckBox;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReimprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDmComissao: TDmComissao;

    procedure prc_Consultar;
    procedure prc_Consultar_Det(ID_Vendedor : Integer);
    procedure prc_Imprimir_Comissao;
    procedure prc_Imprimir_Comissao_Det;
    
    function fnc_Monta_Cab : String;

  public
    { Public declarations }

  end;

var
  frmConsComissao_Metas: TfrmConsComissao_Metas;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmConsComissao_Metas.FormShow(Sender: TObject);
begin
  fDmComissao := TDmComissao.Create(nil);
  oDBUtils.SetDataSourceProperties(Self, fDmComissao);
  fDmComissao.cdsVendedor.Close;
  fDmComissao.cdsVendedor.Open;
end;

procedure TfrmConsComissao_Metas.btnConsultarClick(Sender: TObject);
begin
  if (dtInicial.Date <= 0) or (dtFinal.Date <= 0) then
  begin
    MessageDlg('*** Data Inicial e Final são obrigatórias!', mtInformation, [mbOk], 0);
    exit;
  end;

  if RzPageControl1.ActivePage = TS_Vendedor then
    prc_Consultar
  else
  begin
    if ComboVendedor.KeyValue > 0 then
      prc_Consultar_Det(ComboVendedor.KeyValue)
    else
      prc_Consultar_Det(0);
  end;
end;

procedure TfrmConsComissao_Metas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fDmComissao);
  Action := Cafree;
end;

procedure TfrmConsComissao_Metas.prc_Consultar;
begin
  fDMComissao.cdsComissao.Close;
  fDmComissao.sdsComissao.ParamByName('DATA1').AsDate := dtInicial.Date;
  fDmComissao.sdsComissao.ParamByName('DATA2').AsDate := dtFinal.Date;
  if ComboVendedor.KeyValue > 0 then
    fDmComissao.sdsComissao.ParamByName('ID_VENDEDOR').AsInteger := ComboVendedor.KeyValue
  else
    fDmComissao.sdsComissao.ParamByName('ID_VENDEDOR').AsInteger := 0;
  fDmComissao.cdsComissao.Open;
end;

procedure TfrmConsComissao_Metas.prc_Consultar_Det(ID_Vendedor : Integer);
begin
  fDMComissao.cdsComissao_Det.Close;
  fDmComissao.sdsComissao_Det.ParamByName('DATA1').AsDate := dtInicial.Date;
  fDmComissao.sdsComissao_Det.ParamByName('DATA2').AsDate := dtFinal.Date;
  if ID_Vendedor > 0 then
    fDmComissao.sdsComissao_Det.ParamByName('ID_VENDEDOR').AsInteger := ID_Vendedor
  else
    fDmComissao.sdsComissao_Det.ParamByName('ID_VENDEDOR').AsInteger := 0;
  fDmComissao.cdsComissao_Det.Open;
  fDmComissao.cdsComissao_Det.IndexFieldNames := 'NOME_VENDEDOR;DTEMISSAO;NUMCUPOM';
end;

procedure TfrmConsComissao_Metas.btnReimprimirClick(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Vendedor then
    prc_Imprimir_Comissao
  else
    prc_Imprimir_Comissao_Det;
end;

procedure TfrmConsComissao_Metas.prc_Imprimir_Comissao;
var
  vArq: string;
begin
  fDmComissao.cdsComissao.First;
  fDmComissao.vImp_Cupom := ckImpCupom.Checked;
  fDmComissao.vDtInicial := dtInicial.Date;
  fDmComissao.vDtFinal   := dtFinal.Date;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Comissao.fr3';
  if FileExists(vArq) then
    fDmComissao.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDmComissao.frxReport1.variables['ImpOpcao'] := QuotedStr(fnc_Monta_Cab);
  if ckImpCupom.Checked then
    fDmComissao.frxReport1.variables['ImpCupom'] := QuotedStr('S')
  else
    fDmComissao.frxReport1.variables['ImpCupom'] := QuotedStr('N');
  fDmComissao.frxReport1.ShowReport;
end;

function TfrmConsComissao_Metas.fnc_Monta_Cab: String;
begin
  Result := '(Vendedor: ' + ComboVendedor.Text + ')';
  Result := Result + ' (Dt.Inicial: ' + dtInicial.Text + ' a ' + dtFinal.Text + ')';
end;

procedure TfrmConsComissao_Metas.prc_Imprimir_Comissao_Det;
var
  vArq: string;
  NomeCampo : String;
begin
  fDmComissao.cdsComissao_Det.First;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Comissao_Det.fr3';
  if FileExists(vArq) then
    fDmComissao.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDmComissao.frxReport1.variables['ImpOpcao'] := QuotedStr(fnc_Monta_Cab);
  fDmComissao.frxReport1.ShowReport;
end;

end.

