unit uCadPedidoSimpes_Geracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, StdCtrls, UDMCadPedido,
  NxCollection, UDMPedido_Reserva, rsDbUtils, Mask, ToolEdit;

type
  TfrmCadPedidoSimples_Geracao = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    btnGerar: TNxButton;
    Label2: TLabel;
    DateEdit1: TDateEdit;
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
  uGrava_Pedido, DB;

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
  DateEdit1.Date := Date;
end;

procedure TfrmCadPedidoSimples_Geracao.btnGerarClick(Sender: TObject);
var
  vItem: Word;
begin
  if RxDBLookupCombo1.KeyValue <= 0 then
    Exit;

  Screen.Cursor := crHourGlass;
  fDmPedido_Reserva.cdsPessoa.Close;
  fDmPedido_Reserva.sdsPessoa.ParamByName('RV1').AsInteger := RxDBLookupCombo1.KeyValue;
  fDmPedido_Reserva.cdsPessoa.Open;
  fDmPedido_Reserva.cdsproduto.Open;
  while not fDmPedido_Reserva.cdsPessoa.Eof do
  begin
    fDmPedido_Reserva.cdsProduto.First;

    uGrava_Pedido.prc_Inserir_Ped(fDMCadPedido);
    fDmCadPedido.cdsPedidoID_CLIENTE.AsInteger  := fDmPedido_Reserva.cdsPessoaCODIGO.AsInteger;
    fDmCadPedido.cdsPedidoNOME_CLIENTE.AsString := fDmPedido_Reserva.cdsPessoaNOME.AsString;
    fDmCadPedido.cdsPedidoNUM_PEDIDO.AsInteger  := fDmCadPedido.cdsPedidoID.AsInteger;
    fDmCadPedido.cdsPedidoTIPO_REG.AsString     := 'P';
    fDmCadPedido.cdsPedidoDTENTREGA.AsDateTime  := DateEdit1.Date;

    vItem := 0;
    while not fDmPedido_Reserva.cdsProduto.Eof do
    begin
      Inc(vItem);
      fDmCadPedido.cdsPedido_Itens.Insert;
      fDmCadPedido.cdsPedido_ItensID.AsInteger         := fDmCadPedido.cdsPedidoID.AsInteger;
      fDmCadPedido.cdsPedido_ItensITEM.AsInteger       := vItem;
      fDmCadPedido.cdsPedido_ItensID_PRODUTO.AsInteger := fDmPedido_Reserva.cdsProdutoID.AsInteger;
      fDmCadPedido.cdsPedido_ItensNOMEPRODUTO.AsString := fDmPedido_Reserva.cdsProdutoNOME.AsString;
      fDmCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat := fDmPedido_Reserva.cdsProdutoPRECO_VENDA.AsCurrency;
      fDmCadPedido.cdsPedido_ItensUNIDADE.AsString     := fDmPedido_Reserva.cdsProdutoUNIDADE.AsString;
      fDmCadPedido.cdsPedido_Itens.Post;
      fDmPedido_Reserva.cdsProduto.Next;
    end;
    fDmCadPedido.cdsPedido_Itens.ApplyUpdates(0);
    fDmCadPedido.cdsPedido.ApplyUpdates(0);
    fDmPedido_Reserva.cdsPessoa.Next;
  end;
  Screen.Cursor := crDefault;
  Close;
end;

end.
