unit UCadPedido_Proc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, UDMCadPedido, StdCtrls,
  DB, Mask, NxCollection, RzPanel, Grids, DBGrids, SMDBGrid, FMTBcd,
  SqlExpr, Provider, DBClient;
type
  TfrmCadPedido_Proc = class(TForm)
    NxHeaderPanel1: TNxHeaderPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel2: TNxPanel;
    NxButton2: TNxButton;
    NxButton3: TNxButton;
    NxHeaderPanel2: TNxHeaderPanel;
    SMDBGrid2: TSMDBGrid;
    NxPanel1: TNxPanel;
    btnConfirmar: TNxButton;
    procedure FormShow(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure NxButton3Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
    fDMCadPedido: TDMCadPedido;

  end;

var
  frmCadPedido_Proc: TfrmCadPedido_Proc;

implementation

uses rsDBUtils, uUtilPadrao, UMenu, Math, DmdDatabase;

{$R *.dfm}

procedure TfrmCadPedido_Proc.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadPedido);
  if fDMCadPedido.mProcesso_Sel.IsEmpty then
    SMDBGrid1.SelectAllClick(Sender);
end;

procedure TfrmCadPedido_Proc.NxButton2Click(Sender: TObject);
begin
  fdmCadPedido.cdsProcesso.First;
  while not fdmCadPedido.cdsProcesso.Eof do
  begin
    if SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      if not fdmCadPedido.mProcesso_Sel.Locate('ID',fdmCadPedido.cdsProcessoID.AsInteger,[loCaseInsensitive]) then
      begin
        fdmCadPedido.mProcesso_Sel.Insert;
        fdmCadPedido.mProcesso_SelID.AsInteger        := fdmCadPedido.cdsProcessoID.AsInteger;
        fdmCadPedido.mProcesso_SelNome.AsString       := fdmCadPedido.cdsProcessoNOME.AsString;
        fdmCadPedido.mProcesso_SelOrdem.AsInteger     := fdmCadPedido.cdsProcessoORDEM_MAPA.AsInteger;
        fdmCadPedido.mProcesso_SelQtd_Dobra.AsInteger := 1;
        fdmCadPedido.mProcesso_Sel.Post;
      end;
    end;
    fdmCadPedido.cdsProcesso.Next;
  end;
  SMDBGrid1.UnSelectAllClick(Sender);
end;

procedure TfrmCadPedido_Proc.NxButton3Click(Sender: TObject);
begin
  if fdmCadPedido.mProcesso_SelID.AsInteger > 0 then
    fdmCadPedido.mProcesso_Sel.Delete;
end;

procedure TfrmCadPedido_Proc.btnConfirmarClick(Sender: TObject);
var
  vItemAux : Integer;
begin
  btnConfirmar.ModalResult := mrOk;
  if fdmCadPedido.mProcesso_Sel.IsEmpty then
  begin
    MessageDlg('*** Não existe processo selecionado para copiar!',mtError, [mbOk], 0);
    exit;
  end;
  if Tag <> 1 then  // o 1 é quando vem do F6
  begin
    fDMCadPedido.cdsPedido_Item_Processo.First;
    while not fDMCadPedido.cdsPedido_Item_Processo.Eof do
      fDMCadPedido.cdsPedido_Item_Processo.Delete;
    vItemAux := 0;
    fdmCadPedido.mProcesso_Sel.First;
    while not fdmCadPedido.mProcesso_Sel.Eof do
    begin
      vItemAux := vItemAux + 1;
      fDMCadPedido.cdsPedido_Item_Processo.Insert;
      fDMCadPedido.cdsPedido_Item_ProcessoID.AsInteger            := fDMCadPedido.cdsPedidoID.AsInteger;
      fDMCadPedido.cdsPedido_Item_ProcessoITEM.AsInteger          := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
      fDMCadPedido.cdsPedido_Item_ProcessoITEM_PROCESSO.AsInteger := vItemAux;
      fDMCadPedido.cdsPedido_Item_ProcessoID_PROCESSO.AsInteger   := fdmCadPedido.mProcesso_SelID.AsInteger;
      fDMCadPedido.cdsPedido_Item_ProcessoQTD.AsInteger           := fdmCadPedido.mProcesso_SelQtd_Dobra.AsInteger;
      fDMCadPedido.cdsPedido_Item_ProcessoNOME.AsString           := fdmCadPedido.mProcesso_SelNome.AsString;
      fDMCadPedido.cdsPedido_Item_ProcessoDTENTRADA.Clear;
      fDMCadPedido.cdsPedido_Item_ProcessoHRENTRADA.Clear;
      fDMCadPedido.cdsPedido_Item_ProcessoDTBAIXA.Clear;
      fDMCadPedido.cdsPedido_Item_ProcessoHRSAIDA.Clear;
      fDMCadPedido.cdsPedido_Item_Processo.Post;
      fdmCadPedido.mProcesso_Sel.Next;
    end;

    fDMCadPedido.cdsPedido_Itens.Edit;
    fDMCadPedido.cdsPedido_ItensITEM.AsInteger := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
    fDMCadPedido.cdsPedido_Itens.Post;
    fDMCadPedido.cdsPedido_Item_Tipo.Edit;
  end;

  Close;

end;

procedure TfrmCadPedido_Proc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Tag := 0;
end;

end.
