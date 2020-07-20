unit UCadRegiaoVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDmCadRegioes, Mask, UCBase,
  StdCtrls, RxDBComb, DBCtrls, ExtCtrls, DBGrids, RzTabs, DB, NxCollection;

type
  TfrmCadRegiaoVendas = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    pnlCadastro: TPanel;
    Label1: TLabel;
    DBEdit7: TDBEdit;
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
    Label3: TLabel;
    Edit1: TEdit;
    UCControls1: TUCControls;
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
    fDmCadRegioes: TDmCadRegioes;
    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
    procedure prc_Limpar_Edit_Consulta;
  public
    { Public declarations }            
  end;

var
  frmCadRegiaoVendas: TfrmCadRegiaoVendas;

implementation

uses DmdDatabase, rsDBUtils, UMenu;

{$R *.dfm}

procedure TfrmCadRegiaoVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadRegiaoVendas.btnExcluirClick(Sender: TObject);
begin
  if fDmCadRegioes.cdsRegiao_Venda.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
end;

procedure TfrmCadRegiaoVendas.prc_Excluir_Registro;
begin
  fDmCadRegioes.prc_Excluir;
end;

procedure TfrmCadRegiaoVendas.prc_Gravar_Registro;
begin
  fDmCadRegioes.prc_Gravar;
  if fDmCadRegioes.cdsRegiao_Venda.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDmCadRegioes.vMsgCNAE, mtError, [mbOk], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);
end;

procedure TfrmCadRegiaoVendas.prc_Inserir_Registro;
begin
  fDmCadRegioes.prc_Inserir;

  if fDmCadRegioes.cdsRegiao_Venda.State in [dsBrowse] then
    exit;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
  DBEdit1.SetFocus;
end;

procedure TfrmCadRegiaoVendas.FormShow(Sender: TObject);
begin
  fDmCadRegioes := TDmCadRegioes.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDmCadRegioes);
end;

procedure TfrmCadRegiaoVendas.prc_Consultar;
begin
  fDmCadRegioes.cdsRegiao_Venda.Close;
  fDmCadRegioes.sdsRegiao_Venda.CommandText := fDmCadRegioes.ctCommand + ' WHERE 0 = 0 ';
  if Trim(Edit4.Text) <> '' then
    fDmCadRegioes.sdsRegiao_Venda.CommandText := fDmCadRegioes.sdsRegiao_Venda.CommandText + ' AND NOME LIKE ' + QuotedStr('%'+Edit4.Text+'%');
  fDmCadRegioes.cdsRegiao_Venda.Open;
end;

procedure TfrmCadRegiaoVendas.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmCadRegiaoVendas.btnCancelarClick(Sender: TObject);
begin
  if (fDmCadRegioes.cdsRegiao_Venda.State in [dsBrowse]) or not(fDmCadRegioes.cdsRegiao_Venda.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDmCadRegioes.cdsRegiao_Venda.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);
end;

procedure TfrmCadRegiaoVendas.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadRegiaoVendas.btnAlterarClick(Sender: TObject);
begin
  if (fDmCadRegioes.cdsRegiao_Venda.IsEmpty) or not(fDmCadRegioes.cdsRegiao_Venda.Active) or (fDmCadRegioes.cdsRegiao_VendaID.AsInteger < 1) then
    exit;

  fDmCadRegioes.cdsRegiao_Venda.Edit;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
end;

procedure TfrmCadRegiaoVendas.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadRegiaoVendas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDmCadRegioes);
end;

procedure TfrmCadRegiaoVendas.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadRegiaoVendas.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadRegiaoVendas.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
    Edit4.SetFocus
  else
    prc_Limpar_Edit_Consulta;
end;

procedure TfrmCadRegiaoVendas.prc_Limpar_Edit_Consulta;
begin
  Edit4.Clear;
end;

procedure TfrmCadRegiaoVendas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if fDmCadRegioes.cdsRegiao_Venda.State in [dsEdit,dsInsert] then
  begin
    if MessageDlg('Fechar esta tela sem confirmar?',mtConfirmation,[mbOk,mbNo],0) = mrNo then
      CanClose := False
    else
    begin
      DmCadRegioes.cdsRegiao_Venda.CancelUpdates;
      CanClose := True;
    end;
  end;
end;

end.
