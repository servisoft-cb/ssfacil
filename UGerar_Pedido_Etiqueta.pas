//SL Textil usa para imprimir as etiquetas e controlar por código de barras
unit UGerar_Pedido_Etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDmCadPedido, StdCtrls, Mask, ToolEdit,
  CurrEdit, ExtCtrls, NxCollection, RzTabs, Grids, DBGrids, SMDBGrid, DB, SqlExpr;

type
  TfrmGerar_Pedido_Etiqueta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    btnConsultar: TNxButton;
    RzPageControl1: TRzPageControl;
    TS_Itens: TRzTabSheet;
    TS_Talao: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    btnGerar: TNxButton;
    Label3: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label4: TLabel;
    SMDBGrid2: TSMDBGrid;
    Panel3: TPanel;
    Label5: TLabel;
    btnReimprimir: TNxButton;
    Shape2: TShape;
    Shape3: TShape;
    Label6: TLabel;
    Label7: TLabel;
    ckReimprimir_Baixado: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnReimprimirClick(Sender: TObject);
  private
    { Private declarations }
    vItem_Talao: Integer;
    vQtdDiv: Integer;
    vQtdPed: Real;
    vQtdPac: Real;

    procedure prc_Consultar(Num_Pedido, Item: Integer);
    procedure prc_Gravar_Qtd;
    procedure prc_mEtiqueta;
    procedure prc_Grava_mEtiqueta;
    procedure prc_Gravar_Pedido_Talao;
    procedure prc_Abrir_Talao_Ped(ID, Item, Item_Talao: Integer);
    procedure prc_Grava_Gerou_Talao(Gerou: String; Qtd, ID, Item: Integer);
    procedure prc_Consultar_Talao;

    procedure prc_Imprimir;
  public
    { Public declarations }
    fDmCadPedido: TDMCadPedido;
  end;

var
  frmGerar_Pedido_Etiqueta: TfrmGerar_Pedido_Etiqueta;

implementation

uses rsDBUtils, uUtilPadrao, DmdDatabase; //UConsPed

{$R *.dfm}

procedure TfrmGerar_Pedido_Etiqueta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmGerar_Pedido_Etiqueta.btnConsultarClick(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger <= 0 then
  begin
    MessageDlg('*** Nº do Pedido não informado!', mtError, [mbOk], 0);
    exit;
  end;
  if RzPageControl1.ActivePage = TS_Itens then
    prc_Consultar(CurrencyEdit1.AsInteger,0)
  else
    prc_Consultar_Talao;
end;

procedure TfrmGerar_Pedido_Etiqueta.FormShow(Sender: TObject);
begin
//  fDmCadPedido := TDmCadPedido.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDmCadPedido);
  if fDmCadPedido.qParametros_LoteQTD_PADRAO_ETIQ.AsInteger > 0 then
    CurrencyEdit2.AsInteger := fDmCadPedido.qParametros_LoteQTD_PADRAO_ETIQ.AsInteger;
end;

procedure TfrmGerar_Pedido_Etiqueta.prc_Consultar(Num_Pedido, Item: Integer);
begin
  fDmCadPedido.cdsPedidoImp_Itens.Close;
  fDmCadPedido.sdsPedidoImp_Itens.CommandText := fDmCadPedido.ctPedidoImp_Itens;
  if Item > 0 then
  begin
    fDmCadPedido.sdsPedidoImp_Itens.CommandText                   := fDmCadPedido.sdsPedidoImp_Itens.CommandText + ' AND PI.ITEM = :ITEM ';
    fDmCadPedido.sdsPedidoImp_Itens.ParamByName('ITEM').AsInteger := Item;
  end;
  fDmCadPedido.sdsPedidoImp_Itens.ParamByName('ID').AsInteger := fDmCadPedido.cdsPedidoImpID.AsInteger;
  fDmCadPedido.cdsPedidoImp_Itens.Open;
  fDmCadPedido.cdsPedidoImp_Itens.First;
  Label4.Caption := fDmCadPedido.cdsPedidoImpNOME_CLI.AsString;
end;

procedure TfrmGerar_Pedido_Etiqueta.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit2.AsInteger > 0) then
    prc_Gravar_Qtd;
end;

procedure TfrmGerar_Pedido_Etiqueta.prc_Gravar_Qtd;
begin
  if not(fDmCadPedido.cdsPedidoImp_Itens.Active) or (fDmCadPedido.cdsPedidoImp_Itens.IsEmpty) then
    exit;
  SMDBGrid1.DisableScroll;
  fDmCadPedido.cdsPedidoImp_Itens.First;
  while not fDmCadPedido.cdsPedidoImp_Itens.Eof do
  begin
    fDmCadPedido.cdsPedidoImp_Itens.Edit;
    fDmCadPedido.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger := CurrencyEdit2.AsInteger;
    fDmCadPedido.cdsPedidoImp_Itens.Post;
    fDmCadPedido.cdsPedidoImp_Itens.Next;
  end;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmGerar_Pedido_Etiqueta.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit1.AsInteger > 0) then
    btnConsultarClick(Sender)
  else
  if (Key = Vk_F2) then
  begin
{    frmConsPed := TfrmConsPed.Create(Self);
    frmConsPed.ShowModal;
    if vNum_Pedido_Pos > 0 then
    begin
      CurrencyEdit1.AsInteger := vNum_Pedido_Pos;
      btnConsultarClick(Sender);
    end;}
  end;
end;

procedure TfrmGerar_Pedido_Etiqueta.btnGerarClick(Sender: TObject);
var
  vItem: Integer;
begin
  if not(fDmCadPedido.cdsPedidoImp_Itens.Active) or (fDmCadPedido.cdsPedidoImp_Itens.IsEmpty) then
    exit;
  fDmCadPedido.mEtiqueta_Nav.EmptyDataSet;
  fDmCadPedido.cdsPedidoImp_Itens.First;
  while not fDmCadPedido.cdsPedidoImp_Itens.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
//      prc_Abrir_Talao_Ped(fDmCadPedido.cdsPedidoImp_ItensID.AsInteger,fDmCadPedido.cdsPedidoImp_ItensITEM.AsInteger,0);
//      fDmCadPedido.cdsPedido_Talao.Last;
//      vItem_Talao := fDmCadPedido.cdsPedido_TalaoITEM_TALAO.AsInteger;
      prc_mEtiqueta;
    end;
    fDmCadPedido.cdsPedidoImp_Itens.Next;
  end;
  if fDmCadPedido.mEtiqueta_Nav.IsEmpty then
   exit;

  vItem := 0;
  try
    fDmCadPedido.cdsPedidoImp_Itens.First;
    fDmCadPedido.mEtiqueta_Nav.IndexFieldNames := 'Item_Ped';
    fDmCadPedido.mEtiqueta_Nav.First;
    while not fDmCadPedido.mEtiqueta_Nav.Eof do
    begin
//      if vItem <> fDmCadPedido.mEtiqueta_NavItem_Ped.AsInteger  then
//        prc_Abrir_Talao_Ped(fDmCadPedido.cdsPedidoImp_ItensID.AsInteger,fDmCadPedido.mEtiqueta_NavItem_Ped.AsInteger,0);
//      prc_Gravar_Pedido_Talao;
      vItem := fDmCadPedido.mEtiqueta_NavItem_Ped.AsInteger;
      fDmCadPedido.mEtiqueta_Nav.Next;
      //if (fDmCadPedido.mEtiqueta_NavItem_Ped.AsInteger <> vItem) or (fDmCadPedido.mEtiqueta_Nav.Eof) then
      //  prc_Grava_Gerou_Talao;
    end;
  except
    on e: Exception do
      MessageDlg('*** Erro ao gravar Pedido_Talao ' + #13+ e.Message, mtError, [mbOk], 0);
  end;

  SMDBGrid1.DisableScroll;
  try
    fDmCadPedido.cdsPedidoImp_Itens.First;
    while not fDmCadPedido.cdsPedidoImp_Itens.Eof do
    begin
      prc_Grava_Gerou_Talao('S',fDmCadPedido.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger,fDmCadPedido.cdsPedidoImp_ItensID.AsInteger,fDmCadPedido.cdsPedidoImp_ItensITEM.AsInteger);
      fDmCadPedido.cdsPedidoImp_Itens.Next;
    end;
  except
    on e: Exception do
      MessageDlg('*** Erro ao gravar que o Item do Pedido gerou o talão ' + #13+ e.Message, mtError, [mbOk], 0);
  end;

  SMDBGrid1.EnableScroll;

//  prc_Imprimir;

//  prc_Consultar(CurrencyEdit1.AsInteger,0);
  RzPageControl1.ActivePageIndex := 1;
end;

procedure TfrmGerar_Pedido_Etiqueta.prc_mEtiqueta;
var
  i: Integer;
  vTexto: String;
  vQtdAux2: Real;
begin
  vQtdPac := fDmCadPedido.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger;
  if vQtdPac = 0 then
    vQtdPac := 1;


  vQtdAux2 := fDmCadPedido.cdsPedidoImp_ItensQTD_FATURADO.AsFloat / vQtdPac;
  vQtdDiv := Trunc(vQtdAux2);
  if (vQtdAux2 - Trunc(vQtdAux2)) > 0 then
    vQtdDiv := vQtdDiv + 1;

  vQtdPed := fDmCadPedido.cdsPedidoImp_ItensQTD_FATURADO.AsFloat;
  for i := 1 to vQtdDiv do
  begin
    vItem_Talao := vItem_Talao + 1;
    prc_Grava_mEtiqueta;
    if vQtdPed <= 0 then
      vQtdDiv := i;
  end;
end;

procedure TfrmGerar_Pedido_Etiqueta.prc_Gravar_Pedido_Talao;
begin
{  fDmCadPedido.cdsPedido_Talao.Insert;
  fDmCadPedido.cdsPedido_TalaoID.AsInteger := fDmCadPedido.cdsPedidoImp_ItensID.AsInteger;
  fDmCadPedido.cdsPedido_TalaoITEM.AsInteger := fDmCadPedido.mEtiqueta_NavItem_Ped.AsInteger;
  fDmCadPedido.cdsPedido_TalaoITEM_TALAO.AsInteger := fDmCadPedido.mEtiqueta_NavItem_Talao.AsInteger;
  fDmCadPedido.cdsPedido_TalaoQTD.AsFloat        := fDmCadPedido.mEtiqueta_NavQtd.AsFloat;
  fDmCadPedido.cdsPedido_TalaoCODBARRA.AsString    := fDmCadPedido.mEtiqueta_NavCodBarra.AsString;
  fDmCadPedido.cdsPedido_TalaoDTBAIXA.Clear;
  fDmCadPedido.cdsPedido_TalaoHRBAIXA.Clear;
  fDmCadPedido.cdsPedido_TalaoDTEMISSAO.AsDateTime := Date;
  fDmCadPedido.cdsPedido_TalaoHREMISSAO.AsDateTime := Now;
  fDmCadPedido.cdsPedido_Talao.Post;
  fDmCadPedido.cdsPedido_Talao.ApplyUpdates(0); }
end;

procedure TfrmGerar_Pedido_Etiqueta.prc_Abrir_Talao_Ped(ID, Item, Item_Talao: Integer);
begin
{  fDmCadPedido.cdsPedido_Talao.Close;
  fDmCadPedido.sdsPedido_Talao.CommandText := fDmCadPedido.ctPedido_Talao;
  if Item_Talao > 0 then
  begin
    fDmCadPedido.sdsPedido_Talao.CommandText := fDmCadPedido.sdsPedido_Talao.CommandText + ' AND ITEM_TALAO = :ITEM_TALAO ';
    fDmCadPedido.sdsPedido_Talao.ParamByName('ITEM_TALAO').AsInteger := Item_Talao;
  end;
  fDmCadPedido.sdsPedido_Talao.ParamByName('ID').AsInteger   := ID;
  fDmCadPedido.sdsPedido_Talao.ParamByName('ITEM').AsInteger := Item;
  fDmCadPedido.cdsPedido_Talao.Open; }
end;

procedure TfrmGerar_Pedido_Etiqueta.prc_Grava_Gerou_Talao(Gerou: String; Qtd, ID, Item: Integer);
var
  sds: TSQLDataSet;
  vTexto: String;
begin
  //fDmCadPedido.cdsPedidoImp_Itens.Locate('ITEM',fDmCadPedido.cdsPedido_TalaoITEM.AsInteger,[loCaseInsensitive]);
  vTexto := 'where exists(select 1 from PEDIDO_TALAO T where T.ID = I.ID and T.ITEM = I.ITEM) and I.ID = :ID and I.ITEM = :ITEM ';
  if Gerou = 'N' then
    vTexto := 'where I.ID = :ID and I.ITEM = :ITEM ';
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'update PEDIDO_ITEM I set I.GEROU_PED_TALAO = :GEROU_PED_TALAO, I.QTD_POR_ROTULO = :QTD_POR_ROTULO ' + vTexto;

    sds.ParamByName('GEROU_PED_TALAO').AsString := Gerou;
    sds.ParamByName('QTD_POR_ROTULO').AsInteger := Qtd;
    sds.ParamByName('ID').AsInteger             := ID;
    sds.ParamByName('ITEM').AsInteger           := Item;
    sds.ExecSQL;
  finally
    FreeAndNil(sds);
  end;

  {fDmCadPedido.cdsPedido_Itens.Close;
  fDmCadPedido.sdsPedido_Itens.ParamByName('ID').AsInteger   := fDmCadPedido.cdsPedido_TalaoID.AsInteger;
  fDmCadPedido.sdsPedido_Itens.ParamByName('ITEM').AsInteger := fDmCadPedido.cdsPedido_TalaoITEM.AsInteger;
  fDmCadPedido.cdsPedido_Itens.Open;
  if fDmCadPedido.cdsPedido_Itens.IsEmpty then
    exit;
  fDmCadPedido.cdsPedido_Itens.Edit;
  fDmCadPedido.cdsPedido_ItensGEROU_PED_TALAO.AsString := 'S';
  fDmCadPedido.cdsPedido_ItensQTD_POR_ROTULO.AsInteger := fDmCadPedido.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger;
  fDmCadPedido.cdsPedido_Itens.Post;
  fDmCadPedido.cdsPedido_Itens.ApplyUpdates(0);

  fDmCadPedido.cdsPedido_Talao.ApplyUpdates(0);}
end;

procedure TfrmGerar_Pedido_Etiqueta.prc_Grava_mEtiqueta;
begin
  fDmCadPedido.mEtiqueta_Nav.Insert;
  fDmCadPedido.mEtiqueta_NavReferencia.AsString   := fDmCadPedido.cdsPedidoImp_ItensREFERENCIA.AsString;
  fDmCadPedido.mEtiqueta_NavNome_Produto.AsString := fDmCadPedido.cdsPedidoImp_ItensNOMEPRODUTO.AsString;
  fDmCadPedido.mEtiqueta_NavPedido_Cliente.AsInteger := fDmCadPedido.cdsPedidoImpNUM_PEDIDO.AsInteger;
  fDmCadPedido.mEtiqueta_NavItem_Ped.AsInteger    := fDmCadPedido.cdsPedidoImp_ItensITEM.AsInteger;
  fDmCadPedido.mEtiqueta_NavTamanho.AsString      := fDmCadPedido.cdsPedidoImp_ItensTAMANHO.AsString;
  fDmCadPedido.mEtiqueta_NavUnidade_Prod.AsString := fDmCadPedido.cdsPedidoImp_ItensUNIDADE.AsString;
  if fDmCadPedido.cdsPedidoImp_ItensENCERADO.AsString = 'S' then
  begin
    fDmCadPedido.mEtiqueta_NavEncerado.AsString   := 'encerado';
    fDmCadPedido.mEtiqueta_NavReferencia.AsString := fDmCadPedido.mEtiqueta_NavReferencia.AsString + '-E';
  end
  else
    fDmCadPedido.mEtiqueta_NavEncerado.AsString     := '';
  if trim(fDmCadPedido.cdsPedidoImp_ItensCOD_PRODUTO_CLIENTE.AsString) <> '' then
    fDmCadPedido.mEtiqueta_NavProd_Cliente.AsString := fDmCadPedido.cdsPedidoImp_ItensCOD_PRODUTO_CLIENTE.AsString
  else
  begin
    fDmCadPedido.mEtiqueta_NavProd_Cliente.AsString := fnc_Busca_CodProduto_Cliente(fDmCadPedido.cdsPedidoImp_ItensID_PRODUTO.AsInteger,
                                                                                    fDmCadPedido.cdsPedidoImpID_CLIENTE.AsInteger,
                                                                                    fDmCadPedido.cdsPedidoImp_ItensID_COR.AsInteger,'',
                                                                                    fDmCadPedido.cdsPedidoImp_ItensTAMANHO_CLIENTE.AsString);
  end;
  fDmCadPedido.mEtiqueta_NavDtEmissao.AsDateTime    := fDmCadPedido.cdsPedidoImpDTEMISSAO.AsDateTime;
  fDmCadPedido.mEtiqueta_NavNome_Empresa.AsString   := fDmCadPedido.cdsPedidoImpNOME_INTERNO_FIL.AsString;
  fdmcadpedido.mEtiqueta_NavFone.AsString           := fDmCadPedido.cdsPedidoImpFONE1_FILIAL.AsString;
  fDmCadPedido.mEtiqueta_NavNome_Cliente.AsString   := fDmCadPedido.cdsPedidoImpNOME_CLI.AsString;
  fDmCadPedido.mEtiqueta_NavFantasia_Cli.AsString   := fDmCadPedido.cdsPedidoImpFANTASIA_CLI.AsString;
  fDmCadPedido.mEtiqueta_NavNome_Cor.AsString       := fDmCadPedido.cdsPedidoImpEND_CLIENTE.AsString  + ', ' +
                                                       fDmCadPedido.cdsPedidoImpNUM_END_CLIENTE.AsString + ' ' +
                                                       fDmCadPedido.cdsPedidoImpCIDADE_CLIENTE.AsString + ' ' +
                                                       fDmCadPedido.cdsPedidoImpUF.AsString;
  if vQtdPed > vQtdPac then
    fDmCadPedido.mEtiqueta_NavQtd.AsFloat := StrtoFloat(FormatFloat('0.0000', vQtdPac))
  else
    fDmCadPedido.mEtiqueta_NavQtd.AsFloat := StrToFloat(FormatFloat('0.0000', vQtdPed));
  vQtdPed := vQtdPed - vQtdPac;
  //if vQtdPed <= 0 then
  //  vQtdDiv := i;
  if fDmCadPedido.mEtiqueta_Nav.State in [dsEdit,dsInsert] then
    fDmCadPedido.mEtiqueta_Nav.Post;
end;

procedure TfrmGerar_Pedido_Etiqueta.prc_Consultar_Talao;
begin
end;

procedure TfrmGerar_Pedido_Etiqueta.prc_Imprimir;
var
  vArq: String;
begin
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Valen_rotulo.fr3';
  if FileExists(vArq) then
    fDmCadPedido.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDmCadPedido.frxReport1.ShowReport;
end;

procedure TfrmGerar_Pedido_Etiqueta.btnExcluirClick(Sender: TObject);
var
  vMSGAux: widestring;
  vContador: Integer;
begin
  if MessageDlg('Deseja excluir as Etiquetas selecionadas?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  vMSGAux   := '';
  vContador := 0;
  fDmCadPedido.mEtiqueta_Nav.EmptyDataSet;
  SMDBGrid2.DisableScroll;
  SMDBGrid2.EnableScroll;
  if trim(vMSGAux) <> '' then
    vMSGAux := '*** Etiquetas Não Excluídas ' + vMSGAux;
  vMSGAux := vMSGAux + #13 + #13 + ' Etiquetas Excluídas: ' + IntToStr(vContador);
  MessageDlg(vMSGAux, mtInformation, [mbOk], 0);
end;

procedure TfrmGerar_Pedido_Etiqueta.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then //W
    ckReimprimir_Baixado.Visible := not(ckReimprimir_Baixado.Visible);
end;

procedure TfrmGerar_Pedido_Etiqueta.btnReimprimirClick(Sender: TObject);
begin
  prc_Imprimir;
end;

end.
