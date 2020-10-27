unit UCadPedido_Proc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, UDMCadPedido, StdCtrls,
  DB, Mask;
type
  TfrmCadPedido_Proc = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    fDMCadPedido: TDMCadPedido;

  end;

var
  frmCadPedido_Proc: TfrmCadPedido_Proc;

implementation

uses rsDBUtils, uUtilPadrao, UMenu, Math;

{$R *.dfm}

procedure TfrmCadPedido_Proc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadPedido_Proc.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadPedido);
end;

end.
