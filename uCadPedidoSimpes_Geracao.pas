unit uCadPedidoSimpes_Geracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, StdCtrls, UDMCadPedido,
  NxCollection;

type
  TfrmCadPedidoSimples_Geracao = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    btnGerar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmCadPedido: TDmCadPedido;
  end;

var
  frmCadPedidoSimples_Geracao: TfrmCadPedidoSimples_Geracao;

implementation

{$R *.dfm}

procedure TfrmCadPedidoSimples_Geracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCadPedidoSimples_Geracao.RxDBLookupCombo1Enter(
  Sender: TObject);
begin
  fDmCadPedido.cdsRegiao_Venda.IndexFieldNames := 'NOME';
end;

end.
 