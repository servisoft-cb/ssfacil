unit UAjusta_Peso_Ped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, RxLookup, StdCtrls,
  UDMCadNotaFiscal, Buttons, Grids, DBGrids, SMDBGrid, DB, NxCollection, SqlExpr, ComCtrls, UDMCadPedido;

type
  TfrmAjusta_Peso_Ped = class(TForm)
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    btnConfirmar: TNxButton;
    pgbItens: TProgressBar;
    btnCancelar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    fDMCadPedido: TDMCadPedido;

    procedure prc_Gravar_mPedido_Peso;

  public
    { Public declarations }
    fDMCadNotaFiscal: TDMCadNotaFiscal;

  end;

var
  frmAjusta_Peso_Ped: TfrmAjusta_Peso_Ped;

implementation

uses rsDBUtils, uUtilPadrao, StrUtils, DmdDatabase, Math, uCalculo_Pedido;

{$R *.dfm}

procedure TfrmAjusta_Peso_Ped.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmAjusta_Peso_Ped.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self,fDMCadNotaFiscal);
  fDMCadPedido := TDMCadPedido.Create(Self);
  fDMCadPedido.prc_Abrir_cdsCFOP('S');
  fDMCadPedido.prc_Abrir_CSTICMS(fDMCadNotaFiscal.cdsFilialSIMPLES.AsString);
  prc_Gravar_mPedido_Peso;

  SMDBGrid1.SelectAllClick(Sender);
end;

procedure TfrmAjusta_Peso_Ped.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja CANCELAR o Ajuste?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    Close;
end;

procedure TfrmAjusta_Peso_Ped.btnConfirmarClick(Sender: TObject);
var
  Form: TForm;
begin
  if MessageDlg('Deseja Confirmar o Ajuste?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;

  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);

  if fDMCadNotaFiscal.mPedido_Peso.State in [dsEdit] then
    fDMCadNotaFiscal.mPedido_Peso.Post;

  try
    fDMCadNotaFiscal.mPedido_Peso.First;
    while not fDMCadNotaFiscal.mPedido_Peso.Eof do
    begin
      if (SMDBGrid1.SelectedRows.CurrentRowSelected) and (fDMCadNotaFiscal.mPedido_PesoQtd.AsFloat > 0) then
      begin
        fDMCadPedido.prc_Abrir_cdsCliente(fDMCadNotaFiscal.cdsPedidoID_CLIENTE.AsInteger);

        if fDMCadPedido.cdsPedido_Itens.Locate('ID;ITEM',VarArrayOf([fDMCadPedido.cdsPedidoID.AsInteger,fDMCadNotaFiscal.mPedido_PesoItem.AsInteger]),[locaseinsensitive]) then
        begin
          fDMCadPedido.cdsPedido_Itens.Edit;
          fDMCadPedido.cdsPedido_ItensQTD.AsFloat            := fDMCadNotaFiscal.mPedido_PesoQtd.AsFloat;
          fDMCadPedido.cdsPedido_ItensQTD_RESTANTE.AsFloat   := fDMCadPedido.cdsPedido_ItensQTD.AsFloat;
          fDMCadPedido.cdsPedido_ItensPESO_AJUSTADO.AsString := 'S';
          uCalculo_Pedido.prc_Calculo_GeralItem(fDMCadPedido,fDMCadPedido.cdsPedido_ItensQTD.AsFloat,fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat,
                                               fDMCadPedido.cdsPedido_ItensVLR_DESCONTO.AsFloat,fDMCadPedido.cdsPedido_ItensPERC_DESCONTO.AsFloat,
                                               fDMCadPedido.cdsPedido_ItensVLR_TOTAL.AsFloat);

          if fDMCadPedido.cdsPedido_Itens.State in [dsEdit] then
            fDMCadPedido.cdsPedido_Itens.Post;
        end;
      end;
      fDMCadNotaFiscal.mPedido_Peso.Next;
    end;
  finally
    fDMCadPedido.cdsPedido.Edit;
    uCalculo_Pedido.prc_Calcular_Desconto_Novo(fDMCadPedido,False);
    fDMCadPedido.cdsPedido.Post;
    fDMCadPedido.cdsPedido.ApplyUpdates(0);
    SMDBGrid1.EnableScroll;
    FreeAndNil(fDMCadPedido);
    FreeAndNil(Form);
  end;
  Close;
end;

procedure TfrmAjusta_Peso_Ped.prc_Gravar_mPedido_Peso;
begin
  fDMCadNotaFiscal.mPedido_Peso.EmptyDataSet;
  fDMCadPedido.prc_Localizar(fDMCadNotaFiscal.cdsPedidoID.AsInteger);

  fDMCadPedido.cdsPedido_Itens.First;
  while not fDMCadPedido.cdsPedido_Itens.Eof do
  begin
    fDMCadNotaFiscal.mPedido_Peso.Insert;
    fDMCadNotaFiscal.mPedido_PesoID.AsInteger           := fDMCadPedido.cdsPedido_ItensID.AsInteger;
    fDMCadNotaFiscal.mPedido_PesoItem.AsInteger         := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
    fDMCadNotaFiscal.mPedido_PesoQtd.AsFloat            := fDMCadPedido.cdsPedido_ItensQTD.AsFloat;
    fDMCadNotaFiscal.mPedido_PesoQtd_Peca.AsInteger     := fDMCadPedido.cdsPedido_ItensQTD_PECA.AsInteger;
    fDMCadNotaFiscal.mPedido_PesoPeso_Ajustado.AsString := fDMCadPedido.cdsPedido_ItensPESO_AJUSTADO.AsString;
    fDMCadNotaFiscal.mPedido_PesoID_Produto.AsInteger   := fDMCadPedido.cdsPedido_ItensID_PRODUTO.AsInteger;
    fDMCadNotaFiscal.mPedido_PesoNome_Produto.AsString  := fDMCadPedido.cdsPedido_ItensNOMEPRODUTO.AsString;
    fDMCadNotaFiscal.mPedido_PesoUnidade.AsString       := fDMCadPedido.cdsPedido_ItensUNIDADE.AsString;
    fDMCadNotaFiscal.mPedido_Peso.Post;
    
    fDMCadPedido.cdsPedido_Itens.Next;
  end;
end;

end.
