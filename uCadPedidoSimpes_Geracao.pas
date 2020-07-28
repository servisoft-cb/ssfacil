unit uCadPedidoSimpes_Geracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, StdCtrls, UDMCadPedido,
  NxCollection, UDMPedido_Reserva, rsDbUtils;

type
  TfrmCadPedidoSimples_Geracao = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    btnGerar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
    fDmPedido_Reserva: TDmPedido_Reserva;
  public
    { Public declarations }
    fDmCadPedido: TDmCadPedido;
  end;

var
  frmCadPedidoSimples_Geracao: TfrmCadPedidoSimples_Geracao;

implementation

uses
  uGrava_Pedido;

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

procedure TfrmCadPedidoSimples_Geracao.FormShow(Sender: TObject);
begin
  fDMPedido_Reserva := TDmPedido_Reserva.Create(Self);
  oDBUtils.SetDataSourceProperties(Self,fDMPedido_Reserva);
end;

procedure TfrmCadPedidoSimples_Geracao.btnGerarClick(Sender: TObject);
begin
  fDmPedido_Reserva.cdsPessoa.Close;
  fDmPedido_Reserva.sdsPessoa.ParamByName('RV1').AsInteger := RxDBLookupCombo1.KeyValue;
  fDmPedido_Reserva.cdsPessoa.Open;
  fDmPedido_Reserva.cdsproduto.Open;
  while not fDmPedido_Reserva.cdsPessoa.Eof do
  begin
    fDmPedido_Reserva.cdsProduto.First;

    uGrava_Pedido.prc_Inserir_Ped(fDMCadPedido);

    while not fDmPedido_Reserva.cdsProduto.Eof do
    begin
      fDmCadPedido.cdsPedido_Itens.Insert;
      fDmCadPedido.cdsPedido_Itens.Post;
      fDmCadPedido.cdsProduto.Next;
    end;
    fDmCadPedido.cdsPedido.Post;
    fDmPedido_Reserva.cdsPessoa.Next;
  end;
end;

end.
 