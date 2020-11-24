unit UCadCanalVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadCanalVendas, Mask, 
  UCBase, StdCtrls, RxDBComb, DBCtrls, ExtCtrls, DBGrids, RzTabs, DB, NxCollection, SqlExpr;

type
  TfrmCadCanalVendas = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    pnlCadastro: TPanel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    StaticText1: TStaticText;
    pnlPesquisa: TPanel;
    Label6: TLabel;
    Edit4: TEdit;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnConsultar: TNxButton;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    UCControls1: TUCControls;
    DBCheckBox1: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    fDMCadCanalVendas: TDMCadCanalVendas;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
    procedure prc_Habilitar;

  public
    { Public declarations }
  end;

var
  frmCadCanalVendas: TfrmCadCanalVendas;

implementation

uses DmdDatabase, rsDBUtils, UMenu, uUtilPadrao;

{$R *.dfm}

procedure TfrmCadCanalVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadCanalVendas.btnExcluirClick(Sender: TObject);
begin
  if fDMCadCanalVendas.cdsCanalVendas.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
end;

procedure TfrmCadCanalVendas.prc_Excluir_Registro;
begin
  fDMCadCanalVendas.prc_Excluir;
end;

procedure TfrmCadCanalVendas.prc_Gravar_Registro;
begin
  fDMCadCanalVendas.prc_Gravar;
  if fDMCadCanalVendas.cdsCanalVendas.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadCanalVendas.vMsg, mtError, [mbOk], 0);
    exit;
  end;
  prc_Habilitar;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadCanalVendas.prc_Inserir_Registro;
begin
  fDMCadCanalVendas.prc_Inserir;

  if fDMCadCanalVendas.cdsCanalVendas.State in [dsBrowse] then
    exit;
    
  RzPageControl1.ActivePage := TS_Cadastro;
  prc_Habilitar;
  DBEdit2.SetFocus;
end;

procedure TfrmCadCanalVendas.FormShow(Sender: TObject);
var
  i : Integer;
begin
  fDMCadCanalVendas := TDMCadCanalVendas.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadCanalVendas);
end;

procedure TfrmCadCanalVendas.prc_Consultar;
begin
  fDMCadCanalVendas.cdsCanalVendas.Close;
  fDMCadCanalVendas.sdsCanalVendas.CommandText := fDMCadCanalVendas.ctCommand + ' WHERE 0 = 0 ';
  if Trim(Edit4.Text) <> '' then
    fDMCadCanalVendas.sdsCanalVendas.CommandText := fDMCadCanalVendas.sdsCanalVendas.CommandText + ' AND NOME LIKE ' + QuotedStr('%'+Edit4.Text+'%');
  fDMCadCanalVendas.cdsCanalVendas.Open;
end;

procedure TfrmCadCanalVendas.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmCadCanalVendas.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadCanalVendas.cdsCanalVendas.State in [dsBrowse]) or not(fDMCadCanalVendas.cdsCanalVendas.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadCanalVendas.cdsCanalVendas.CancelUpdates;
  prc_Habilitar;
end;

procedure TfrmCadCanalVendas.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadCanalVendas.btnAlterarClick(Sender: TObject);
begin
  if not(fDMCadCanalVendas.cdsCanalVendas.Active) or (fDMCadCanalVendas.cdsCanalVendas.IsEmpty) or (fDMCadCanalVendas.cdsCanalVendasID.AsInteger < 1) then
    exit;

  fDMCadCanalVendas.cdsCanalVendas.Edit;
  prc_Habilitar;
end;

procedure TfrmCadCanalVendas.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadCanalVendas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadCanalVendas);
end;

procedure TfrmCadCanalVendas.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadCanalVendas.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadCanalVendas.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
    Edit4.SetFocus;
end;


procedure TfrmCadCanalVendas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDMCadCanalVendas.cdsCanalVendas);
end;

procedure TfrmCadCanalVendas.prc_Habilitar;
begin
  TS_Consulta.TabEnabled := not(TS_Consulta.TabEnabled);
  btnAlterar.Enabled     := not(btnAlterar.Enabled);
  btnConfirmar.Enabled   := not(btnConfirmar.Enabled);
  pnlCadastro.Enabled    := not(pnlCadastro.Enabled);
end;

end.
