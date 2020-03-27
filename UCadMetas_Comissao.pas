unit UCadMetas_Comissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxCollection, ExtCtrls, Grids, DBGrids, SMDBGrid, UDMCadMetas_Comissao,
  UCBase, DB;

type
  TfrmCadMetas_Comissao = class(TForm)
    Panel1: TPanel;
    btnDigitar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    SMDBGrid1: TSMDBGrid;
    UCControls1: TUCControls;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnDigitarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    fDMCadMetas_Comissao: TDMCadMetas_Comissao;

    procedure prc_Habilitar;

  public
    { Public declarations }
  end;

var
  frmCadMetas_Comissao: TfrmCadMetas_Comissao;

implementation

uses rsDBUtils, UMenu;

{$R *.dfm}

procedure TfrmCadMetas_Comissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCadMetas_Comissao);
  Action := Cafree;
end;

procedure TfrmCadMetas_Comissao.FormShow(Sender: TObject);
begin
  fDMCadMetas_Comissao := TDMCadMetas_Comissao.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadMetas_Comissao);
  fDMCadMetas_Comissao.cdsMetas_Comissao.Close;
  fDMCadMetas_Comissao.cdsMetas_Comissao.Open;
end;

procedure TfrmCadMetas_Comissao.prc_Habilitar;
begin
  btnDigitar.Enabled   := not(btnDigitar.Enabled);
  btnCancelar.Enabled  := not(btnCancelar.Enabled);
  btnConfirmar.Enabled := not(btnConfirmar.Enabled);
  SMDBGrid1.ReadOnly   := not(SMDBGrid1.ReadOnly);
end;

procedure TfrmCadMetas_Comissao.btnDigitarClick(Sender: TObject);
begin
  prc_Habilitar;
  SMDBGrid1.SetFocus;
end;

procedure TfrmCadMetas_Comissao.btnConfirmarClick(Sender: TObject);
begin
  if fDMCadMetas_Comissao.cdsMetas_Comissao.State in [dsEdit,dsInsert] then
    fDMCadMetas_Comissao.cdsMetas_Comissao.Post;
  fDMCadMetas_Comissao.cdsMetas_Comissao.ApplyUpdates(0);
  prc_Habilitar;
end;

procedure TfrmCadMetas_Comissao.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar as alterações?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  fDMCadMetas_Comissao.cdsMetas_Comissao.Cancel;
  prc_Habilitar;
  fDMCadMetas_Comissao.cdsMetas_Comissao.Close;
  fDMCadMetas_Comissao.cdsMetas_Comissao.Open;
end;

end.

