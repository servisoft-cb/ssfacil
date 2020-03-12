unit UANP_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, SMDBGrid, NxCollection, UDMANP_Produto, DB;

type
  TfrmANP_Produto = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    btnDigitar: TNxButton;
    btnCancelar: TNxButton;
    btnConfirmar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnDigitarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    fDMANP_Produto: TDMANP_Produto;

  public
    { Public declarations }
  end;

var
  frmANP_Produto: TfrmANP_Produto;

implementation

uses rsDBUtils;


{$R *.dfm}

procedure TfrmANP_Produto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmANP_Produto.FormShow(Sender: TObject);
begin
  fDMANP_Produto := TDMANP_Produto.Create(Self);
  oDBUtils.SetDataSourceProperties(Self,fDMANP_Produto);
  fDMANP_Produto.cdsTab_CProd_ANP.Open;
end;

procedure TfrmANP_Produto.btnDigitarClick(Sender: TObject);
begin
  SMDBGrid1.ReadOnly   := False;
  btnDigitar.Enabled   := False;
  btnCancelar.Enabled  := True;
  btnConfirmar.Enabled := True;
end;

procedure TfrmANP_Produto.btnCancelarClick(Sender: TObject);
begin
  SMDBGrid1.ReadOnly   := True;
  btnDigitar.Enabled   := True;
  btnCancelar.Enabled  := False;
  btnConfirmar.Enabled := False;
  fDMANP_Produto.cdsTab_CProd_ANP.CancelUpdates;
end;

procedure TfrmANP_Produto.btnConfirmarClick(Sender: TObject);
begin
  if fDMANP_Produto.cdsTab_CProd_ANP.State in [dsEdit,dsInsert] then
    fDMANP_Produto.cdsTab_CProd_ANP.Post;
  fDMANP_Produto.cdsTab_CProd_ANP.ApplyUpdates(0);
  SMDBGrid1.ReadOnly   := True;
  btnDigitar.Enabled   := True;
  btnCancelar.Enabled  := False;
  btnConfirmar.Enabled := False;
end;

end.
