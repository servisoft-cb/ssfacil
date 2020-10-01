unit UAltPrecoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadPedido, StdCtrls, Mask, DBCtrls, NxCollection, DB;

type
  TfrmAltPrecoPedido = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
     fDMCadPedido: TDMCadPedido;

  end;

var
  frmAltPrecoPedido: TfrmAltPrecoPedido;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmAltPrecoPedido.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadPedido);
  Label2.Visible  := (fDMCadPedido.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I');
  DBEdit2.Visible := (fDMCadPedido.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I');
end;

procedure TfrmAltPrecoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmAltPrecoPedido.NxButton1Click(Sender: TObject);
begin
  if fDMCadPedido.cdsPedido_Itens.State in [dsEdit] then
    fDMCadPedido.cdsPedido_Itens.Post;
  Close;
end;

procedure TfrmAltPrecoPedido.NxButton2Click(Sender: TObject);
begin
  Close;
end;

end.
