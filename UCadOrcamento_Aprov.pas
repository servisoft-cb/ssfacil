unit UCadOrcamento_Aprov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadPedido, ExtCtrls, Grids, DBGrids, SMDBGrid, DBCtrls,
  StdCtrls, Mask, ToolEdit, RzPanel, NxCollection, DB, UCadPedido, Menus, SqlExpr;

type
  TfrmCadOrcamento_Aprov = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    gbxDuplicata: TRzGroupBox;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Label4: TLabel;
    Memo1: TMemo;
    btnConfirmar: TNxButton;
    PopupMenu1: TPopupMenu;
    SelecionarTodos1: TMenuItem;
    SMDBGrid6: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SelecionarTodos1Click(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    vItem_Pedido: Integer;
    vNumPedido_Gerado: Integer;
    vID_Pedido_Gerado: Integer;
    procedure prc_Montar_mOrcamento_Itens;
    procedure prc_Gravar_Pedido;
    procedure prc_Gravar_Pedido_Item;
    procedure prc_Gravar_Reprovacao;

  public
    { Public declarations }
    fDMCadPedido: TDMCadPedido;
    
  end;

var
  frmCadOrcamento_Aprov: TfrmCadOrcamento_Aprov;

implementation

uses rsDBUtils, UMenu, uUtilPadrao, uCalculo_Pedido, uGrava_Pedido,
  DmdDatabase;

{$R *.dfm}

procedure TfrmCadOrcamento_Aprov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadOrcamento_Aprov.FormShow(Sender: TObject);
var
  i: Integer;
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadPedido);
  Label2.Visible := ((fDMCadPedido.cdsOrcamentoID_CLIENTE.AsInteger <= 0) or (fDMCadPedido.cdsOrcamentoID_CLIENTE.IsNull));
  prc_Montar_mOrcamento_Itens;
  DateEdit1.Date := Date;

  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'Nome_Grupo') then
      SMDBGrid1.Columns[i].Visible := (fDMCadPedido.cdsParametrosEMPRESA_AMBIENTES.AsString = 'S');
  end;

  SMDBGrid6.Visible := (fDMCadPedido.cdsParametrosEMPRESA_SUCATA.AsString = 'S');
end;

procedure TfrmCadOrcamento_Aprov.prc_Montar_mOrcamento_Itens;
begin
  fDMCadPedido.mOrcamento_Itens.EmptyDataSet;
  fDMCadPedido.cdsOrcamento_Itens.First;
  while not fDMCadPedido.cdsOrcamento_Itens.Eof do
  begin
    if (StrToFloat(FormatFloat('0.00000',fDMCadPedido.cdsOrcamento_ItensQTD.AsFloat)) > 0) then
    begin
      fDMCadPedido.mOrcamento_Itens.Insert;
      fDMCadPedido.mOrcamento_ItensID_Orcamento.AsInteger := fDMCadPedido.cdsOrcamento_ItensID.AsInteger;
      fDMCadPedido.mOrcamento_ItensItem.AsInteger         := fDMCadPedido.cdsOrcamento_ItensITEM.AsInteger;
      if fDMCadPedido.cdsOrcamento_ItensID_PRODUTO.AsInteger > 0 then
        fDMCadPedido.mOrcamento_ItensID_Produto.AsInteger   := fDMCadPedido.cdsOrcamento_ItensID_PRODUTO.AsInteger
      else
        fDMCadPedido.mOrcamento_ItensID_Produto.Clear;
      fDMCadPedido.mOrcamento_ItensNome_Produto.AsString    := fDMCadPedido.cdsOrcamento_ItensNOMEPRODUTO.AsString;
      fDMCadPedido.mOrcamento_ItensQtd.AsFloat              := StrToFloat(FormatFloat('0.00000',fDMCadPedido.cdsOrcamento_ItensQTD.AsFloat));
      fDMCadPedido.mOrcamento_ItensVlr_Unitario.AsFloat     := StrToFloat(FormatFloat('0.00000',fDMCadPedido.cdsOrcamento_ItensVLR_UNITARIO.AsFloat));
      fDMCadPedido.mOrcamento_ItensVlr_Unitario_IPI.AsFloat := StrToFloat(FormatFloat('0.00000',fDMCadPedido.cdsOrcamento_ItensVLR_UNITARIO_IPI.AsFloat));
      fDMCadPedido.mOrcamento_ItensVlr_Total.AsFloat       := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsOrcamento_ItensVLR_TOTAL.AsFloat));
      fDMCadPedido.mOrcamento_ItensAprovar.AsBoolean       := False;
      fDMCadPedido.mOrcamento_ItensReprovar.AsBoolean      := False;
      fDMCadPedido.mOrcamento_ItensDtEntrega.AsDateTime    := fDMCadPedido.cdsOrcamento_ItensDTENTREGA.AsDateTime;
      fDMCadPedido.mOrcamento_ItensID_CFOP.AsInteger       := fDMCadPedido.cdsOrcamento_ItensID_CFOP.AsInteger;
      fDMCadPedido.mOrcamento_ItensQtd_Peca.AsInteger      := fDMCadPedido.cdsOrcamento_ItensQTD_PECA.AsInteger;
      fDMCadPedido.mOrcamento_ItensID_NCM.AsInteger        := fDMCadPedido.cdsOrcamento_ItensID_NCM.AsInteger;
      fDMCadPedido.mOrcamento_ItensTipo_Orcamento.AsString := fDMCadPedido.cdsOrcamento_ItensTIPO_ORCAMENTO.AsString;
      fDMCadPedido.mOrcamento_ItensPerc_Desconto.AsFloat   := StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsOrcamento_ItensPERC_DESCONTO.AsFloat));
      fDMCadPedido.mOrcamento_ItensVlr_Desconto.AsFloat    := StrToFloat(FormatFloat('0.0000',(fDMCadPedido.cdsOrcamento_ItensVLR_DESCONTO.AsFloat + fDMCadPedido.cdsOrcamento_ItensVLR_DESCONTORATEIO.AsFloat)));
      fDMCadPedido.mOrcamento_ItensPerc_Comissao.AsFloat   := StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsOrcamento_ItensPERC_COMISSAO.AsFloat));
      fDMCadPedido.mOrcamento_ItensFoto.AsString           := fDMCadPedido.cdsOrcamento_ItensFOTO.AsString;
      fDMCadPedido.mOrcamento_ItensEspessura.AsFloat       := StrToFloat(FormatFloat('0.00##',fDMCadPedido.cdsOrcamento_ItensESPESSURA.AsFloat));
      fDMCadPedido.mOrcamento_ItensComprimento.AsFloat     := fDMCadPedido.cdsOrcamento_ItensCOMPRIMENTO.AsFloat;
      fDMCadPedido.mOrcamento_ItensLargura.AsFloat         := fDMCadPedido.cdsOrcamento_ItensLARGURA.AsFloat;
      fDMCadPedido.mOrcamento_ItensDiametro.AsFloat        := fDMCadPedido.cdsOrcamento_ItensDIAMETRO.AsFloat;               
      fDMCadPedido.mOrcamento_ItensDiametro_Ext.AsFloat    := fDMCadPedido.cdsOrcamento_ItensDIAMETRO_EXT.AsFloat;
      fDMCadPedido.mOrcamento_ItensDiametro_Int.AsFloat    := fDMCadPedido.cdsOrcamento_ItensDIAMETRO_INT.AsFloat;
      fDMCadPedido.mOrcamento_ItensParede.AsFloat          := fDMCadPedido.cdsOrcamento_ItensPAREDE.AsFloat;
      fDMCadPedido.mOrcamento_ItensDescricao_Tipo.AsString := fDMCadPedido.cdsOrcamento_ItensDESCRICAO_TIPO.AsString;
      fDMCadPedido.mOrcamento_ItensComplemento_Nome.AsString := fDMCadPedido.cdsOrcamento_ItensCOMPLEMENTO_NOME.AsString;
      if fDMCadPedido.cdsParametrosEMPRESA_AMBIENTES.AsString = 'S' then
      begin
        fDMCadPedido.qProduto.Close;
        fDMCadPedido.qProduto.ParamByName('ID').AsInteger := fDMCadPedido.cdsOrcamento_ItensID_PRODUTO.AsInteger;
        fDMCadPedido.qProduto.Open;
        if fDMCadPedido.qProdutoID_GRUPO.AsInteger > 0 then
        begin
          fDMCadPedido.qGrupo.Close;
          fDMCadPedido.qGrupo.ParamByName('ID').AsInteger  := fDMCadPedido.qProdutoID_GRUPO.AsInteger;
          fDMCadPedido.qGrupo.Open;
          fDMCadPedido.mOrcamento_ItensNome_Grupo.AsString := fDMCadPedido.qGrupoNOME.AsString;
        end;
      end;
      fDMCadPedido.mOrcamento_Itens.Post;
    end;
    fDMCadPedido.cdsOrcamento_Itens.Next;
  end;
  fDMCadPedido.mOrcamento_Itens.IndexFieldNames := 'Espessura;Item';
end;

procedure TfrmCadOrcamento_Aprov.btnConfirmarClick(Sender: TObject);
var
  vMSGAux: String;
  vAprovado, vReprovado: Boolean;
begin
  vItem_Pedido      := 0;
  vNumPedido_Gerado := 0;
  vID_Pedido_Gerado := 0;
  //Fazendo as verifica��es para poder aprovar ou reprovar o or�amento
  vMSGAux    := '';
  vAprovado  := False;
  vReprovado := False;
  SMDBGrid1.DisableScroll;
  fDMCadPedido.mOrcamento_Itens.First;
  while not fDMCadPedido.mOrcamento_Itens.Eof do
  begin
    if (fDMCadPedido.mOrcamento_ItensAprovar.AsBoolean) and (fDMCadPedido.mOrcamento_ItensID_Produto.AsInteger <= 0) then
      vMSGAux := vMSGAux + #13 + ' Item ' + fDMCadPedido.mOrcamento_ItensItem.AsString + ' n�o esta com o produto cadastrado!'
    else
    if (fDMCadPedido.mOrcamento_ItensID_CFOP.AsInteger <= 0) and (fDMCadPedido.cdsParametrosMOSTRAR_CFOP_PEDIDO.AsString = 'S') then
      vMSGAux := vMSGAux + #13 + ' Item ' + fDMCadPedido.mOrcamento_ItensItem.AsString + ' n�o esta com a CFOP lan�ada!'
    else
    if (fDMCadPedido.mOrcamento_ItensAprovar.AsBoolean) and (StrToFloat(FormatFloat('0.0000',fDMCadPedido.mOrcamento_ItensQtd.AsFloat)) <= 0)  then
      vMSGAux := vMSGAux + #13 + ' Item ' + fDMCadPedido.mOrcamento_ItensItem.AsString + ' esta sem a quantidade!'
    else
    if fDMCadPedido.mOrcamento_ItensID_Produto.AsInteger = fDMCadPedido.qParametros_ProdID_PRODUTO_GENERICO.AsInteger then
      vMSGAux := vMSGAux + #13 + ' Item ' + fDMCadPedido.mOrcamento_ItensItem.AsString + ' Este produto � o Gen�rico, n�o pode ser copiado para o pedido!'
    else
    if fDMCadPedido.mOrcamento_ItensAprovar.AsBoolean then
      vAprovado := True
    else
    if fDMCadPedido.mOrcamento_ItensReprovar.AsBoolean then
       vReprovado := True;
    fDMCadPedido.mOrcamento_Itens.Next;
  end;
  SMDBGrid1.EnableScroll;
  if not(vAprovado) and not(vReprovado) then
    vMSGAux := vMSGAux + #13 + ' N�o foi aprovado/reprovado nenhum item';
  if (vAprovado) and (fDMCadPedido.cdsOrcamentoID_CLIENTE.AsInteger <= 0) then
  begin
    MessageDlg('*** Cliente n�o cadastrado, aprova��o cancelada!', mtError, [mbOk], 0);
    exit;
  end;
  if (vReprovado) and ((DateEdit1.Date <= 10) or (trim(Memo1.Text) = '')) then
    vMSGAux := vMSGAux + #13 + ' N�o foi informada a data, ou motivo da reprova��o';
  if trim(vMSGAux) <> '' then
  begin
    MessageDlg(vMSGAux, mtError, [mbOk], 0);
    exit;
  end;
  if vAprovado then
    prc_Gravar_Pedido;

  fDMCadPedido.mOrcamento_Itens.First;
  while not fDMCadPedido.mOrcamento_Itens.Eof do
  begin
    if fDMCadPedido.mOrcamento_ItensAprovar.AsBoolean then
      prc_Gravar_Pedido_Item
    else
    if fDMCadPedido.mOrcamento_ItensReprovar.AsBoolean then
      prc_Gravar_Reprovacao;
    fDMCadPedido.mOrcamento_Itens.Next;
  end;

  if vAprovado then
  begin
    uCalculo_Pedido.prc_Calcular_Desconto_Novo(fDMCadPedido,False);
    if not (fDMCadPedido.cdsPedido.State in [dsEdit,dsInsert]) then
      fDMCadPedido.cdsPedido.Edit;
    uGrava_Pedido.prc_Gravar(fDMCadPedido);
    if fDMCadPedido.cdsPedido.State in [dsEdit] then
      fDMCadPedido.cdsPedido.Post;
    fDMCadPedido.cdsPedido.ApplyUpdates(0);
  end;

  fDMCadPedido.prc_Situacao_Orc(fDMCadPedido.cdsOrcamentoID.AsInteger);

  if vNumPedido_Gerado > 0 then
  begin
    MessageDlg('*** Pedido gerado n�mero = ' + IntToStr(vNumPedido_Gerado), mtInformation, [mbOk], 0);
    if StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_FRETE.AsFloat)) > 0 then
      MessageDlg('*** Favor verificar o valor do frete se esta tudo ok!', mtInformation, [mbOk], 0);
    vNum_Pedido_Pos := vID_Pedido_Gerado;
    fMenu.OpenForm(TfrmCadPedido,wsMaximized);
    Close;
  end
  else
  if vReprovado then
  begin
    MessageDlg('*** Reprova��o do or�amento confirmada!', mtInformation, [mbOk], 0);
    Close;
  end;
end;

procedure TfrmCadOrcamento_Aprov.prc_Gravar_Pedido;
var
  vID_Aux: Integer;
  vID_LocalAux: Integer;
begin
  UGrava_Pedido.prc_Inserir_Ped(fDMCadPedido);
  vID_Aux           := fDMCadPedido.cdsPedidoID.AsInteger;
  vID_Pedido_Gerado := fDMCadPedido.cdsPedidoID.AsInteger;
  fDMCadPedido.cdsPedidoTIPO_REG.AsString           := 'P';
  fDMCadPedido.cdsPedidoFILIAL.AsInteger            := fDMCadPedido.cdsOrcamentoFILIAL.AsInteger;
  //10/07/2020  Cleomar  para a JW
  if fDMCadPedido.cdsOrcamentoID_OPERACAO_NOTA.AsInteger > 0 then
    fDMCadPedido.cdsPedidoID_OPERACAO_NOTA.AsInteger  := fDMCadPedido.cdsOrcamentoID_OPERACAO_NOTA.AsInteger;
  fDMCadPedido.cdsPedidoFINALIDADE.AsString := fDMCadPedido.cdsOrcamentoFINALIDADE.AsString;
  //**************
  fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime        := Date;
  if fDMCadPedido.qParametros_PedGRAVAR_ORC_PED_CLIENTE.AsString = 'S' then
    fDMCadPedido.cdsPedidoPEDIDO_CLIENTE.AsString     := 'Orc. ' + fDMCadPedido.cdsOrcamentoNUM_ORCAMENTO.AsString;
  fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger        := fDMCadPedido.cdsOrcamentoID_CLIENTE.AsInteger;
  fDMCadPedido.cdsPedidoEMAIL_COMPRAS.AsString      := fDMCadPedido.cdsOrcamentoEMAIL_COMPRAS.AsString;
  //20/11/2017
  fDMCadPedido.cdsPedidoDDD.AsInteger               := fDMCadPedido.cdsOrcamentoDDD.AsInteger;
  fDMCadPedido.cdsPedidoFONE.AsString               := fDMCadPedido.cdsOrcamentoFONE.AsString;

  if fDMCadPedido.cdsOrcamentoID_TRANSPORTADORA.AsInteger > 0 then
    fDMCadPedido.cdsPedidoID_TRANSPORTADORA.AsInteger := fDMCadPedido.cdsOrcamentoID_TRANSPORTADORA.AsInteger;
  if fDMCadPedido.cdsOrcamentoID_REDESPACHO.AsInteger > 0 then
    fDMCadPedido.cdsPedidoID_REDESPACHO.AsInteger := fDMCadPedido.cdsOrcamentoID_REDESPACHO.AsInteger;
  if fDMCadPedido.cdsOrcamentoID_CONDPGTO.AsInteger > 0 then
    fDMCadPedido.cdsPedidoID_CONDPGTO.AsInteger := fDMCadPedido.cdsOrcamentoID_CONDPGTO.AsInteger;
  if fDMCadPedido.cdsOrcamentoID_VENDEDOR.AsInteger > 0 then
    fDMCadPedido.cdsPedidoID_VENDEDOR.AsInteger := fDMCadPedido.cdsOrcamentoID_VENDEDOR.AsInteger;
  if fDMCadPedido.cdsOrcamentoID_CFOP.AsInteger > 0 then
    fDMCadPedido.cdsPedidoID_CFOP.AsInteger := fDMCadPedido.cdsOrcamentoID_CFOP.AsInteger;
  fDMCadPedido.cdsPedidoTIPO_FRETE.AsString := fDMCadPedido.cdsOrcamentoTIPO_FRETE.AsString;
  fDMCadPedido.cdsPedidoPERC_COMISSAO.AsFloat := fDMCadPedido.cdsOrcamentoPERC_COMISSAO.AsFloat;
  fDMCadPedido.cdsPedidoNOME_CONSUMIDOR.AsString := fDMCadPedido.cdsOrcamentoNOME_CONSUMIDOR.AsString;
  fDMCadPedido.cdsPedidoQTD.AsFloat           := 0;
  fDMCadPedido.cdsPedidoQTD_RESTANTE.AsFloat  := 0;
  fDMCadPedido.cdsPedidoQTD_CANCELADO.AsFloat := 0;
  fDMCadPedido.cdsPedidoQTD_FATURADO.AsFloat  := 0;
  fDMCadPedido.cdsPedidoVLR_TOTAL.AsFloat     := 0;
  fDMCadPedido.cdsPedidoVLR_DESCONTO.AsFloat  := 0;
  fDMCadPedido.cdsPedidoCANCELADO.AsString    := 'N'; 
  fDMCadPedido.cdsPedidoDOLAR.AsString        := 'N';
  if fDMCadPedido.qParametros_PedDTENTREGA_ZERADA_ORC.AsString = 'S' then
    fDMCadPedido.cdsPedidoDTENTREGA.Clear
  else
  if fDMCadPedido.cdsOrcamentoDTENTREGA.AsDateTime > 10 then
    fDMCadPedido.cdsPedidoDTENTREGA.AsDateTime  := fDMCadPedido.cdsOrcamentoDTENTREGA.AsDateTime
  else
    fDMCadPedido.cdsPedidoDTENTREGA.AsDateTime  := Date;
  fDMCadPedido.cdsPedidoOBS.Value             := fDMCadPedido.cdsOrcamentoOBS.Value;
  fDMCadPedido.cdsPedidoVLR_FRETE.AsFloat     := fDMCadPedido.cdsOrcamentoVLR_FRETE.AsFloat;
  fDMCadPedido.cdsPedidoLOCALENTREGA.AsString := 'N';
  fDMCadPedido.cdsPedidoVLR_ITENS.AsFloat     := 0;
  fDMCadPedido.cdsPedidoPESOBRUTO.AsFloat     := 0;
  fDMCadPedido.cdsPedidoPESOLIQUIDO.AsFloat   := 0;
  fDMCadPedido.cdsPedidoCALCULARICMSSOBREIPI.AsString := fDMCadPedido.cdsOrcamentoCALCULARICMSSOBREIPI.AsString;
  fDMCadPedido.cdsPedidoID_REGIMETRIB.AsInteger := fDMCadPedido.cdsOrcamentoID_REGIMETRIB.AsInteger;
  fDMCadPedido.cdsPedidoSIMPLES_FILIAL.AsString := fDMCadPedido.cdsOrcamentoSIMPLES_FILIAL.AsString;
  fDMCadPedido.cdsPedidoDESCRICAO_DESC.AsString  := '';
  fDMCadPedido.cdsPedidoIMP_OC_NOTA.AsString     := fDMCadPedido.cdsOrcamentoIMP_OC_NOTA.AsString;
  fDMCadPedido.cdsPedidoNOME_CLIENTE.AsString    := fDMCadPedido.cdsOrcamentoNOME_CLIENTE.AsString;
  fDMCadPedido.cdsPedidoNUM_ORCAMENTO.AsInteger  := fDMCadPedido.cdsOrcamentoNUM_ORCAMENTO.AsInteger;
  fDMCadPedido.cdsPedidoVLR_ADIANTAMENTO.AsFloat := 0;
  fDMCadPedido.cdsPedidoFATURADO.AsString        := 'N';
  fDMCadPedido.cdsPedidoEMAIL_COMPRAS.AsString   := fDMCadPedido.cdsOrcamentoEMAIL_COMPRAS.AsString;

  //01/03/2016 alterado a busca do pr�ximo n�mero do pedido/or�amento/ordem de compra
  //fDMCadPedido.qProximoPedido.Close;
  //fDMCadPedido.qProximoPedido.ParamByName('TIPO_REG').AsString := 'P';
  //fDMCadPedido.qProximoPedido.Open;
  //fDMCadPedido.cdsPedidoNUM_PEDIDO.AsInteger := fDMCadPedido.qProximoPedidoNUM_PEDIDO.AsInteger + 1;
  fDMCadPedido.cdsPedidoNUM_PEDIDO.AsInteger := fnc_Proximo_Num_Pedido('P',fDMCadPedido.qParametros_PedUSA_NUM_PEDIDO_POR_FILIAL.AsString,fDMCadPedido.cdsFilialNUM_PEDIDO_ULT.AsInteger) + 1;
  vNumPedido_Gerado                          := fDMCadPedido.cdsPedidoNUM_PEDIDO.AsInteger;

  if trim(fDMCadPedido.qParametros_PedGRAVAR_ORC_PED_CLIENTE.AsString) <> 'S' then
    fDMCadPedido.cdsPedidoPEDIDO_CLIENTE.AsString     := fDMCadPedido.cdsPedidoNUM_PEDIDO.AsString; 

  vID_LocalAux := fnc_Verificar_Local(fDMCadPedido.cdsParametrosUSA_LOCAL_ESTOQUE.AsString);
  if vID_LocalAux > 0 then
    fDMCadPedido.cdsPedidoID_LOCAL_ESTOQUE.AsInteger := vID_LocalAux;

  if fDMCadPedido.cdsOrcamentoID_VENDEDOR_INT.AsInteger > 0 then
    fDMCadPedido.cdsPedidoID_VENDEDOR_INT.AsInteger := fDMCadPedido.cdsOrcamentoID_VENDEDOR_INT.AsInteger;

  //19/08/2019
  if (fDMCadPedido.qParametros_GeralUSA_VENDEDOR_INT.AsString = 'S') and (fDMCadPedido.cdsPedidoID_VENDEDOR_INT.AsInteger <= 0) then
  begin
    if fDMCadPedido.cdsClienteCODIGO.AsInteger <> fDMCadPedido.cdsOrcamentoID_CLIENTE.AsInteger then
      fDMCadPedido.cdsCliente.Locate('CODIGO',fDMCadPedido.cdsOrcamentoID_CLIENTE.AsInteger,[loCaseInsensitive]);
    if (fDMCadPedido.cdsClienteID_VENDEDOR_INT.AsInteger > 0)
      and (MessageDlg('Or�amento Sem Vendedor Interno.'+#13+#13+ 'Copiar o Vendedor Interno que esta no Cadastro do Cliente para o Pedido?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      fDMCadPedido.cdsPedidoID_VENDEDOR_INT.AsInteger := fDMCadPedido.cdsClienteID_VENDEDOR_INT.AsInteger;
  end;
  //********************

  fDMCadPedido.cdsPedido.Post;
  fDMCadPedido.cdsPedido.Edit;
  
  //aqui verificar
  {if (fDMCadPedido.cdsParametrosEMPRESA_AMBIENTES.AsString = 'S') then
  begin
    fDMCadPedido.cdsOrcamento_Ace.Close;
    fDMCadPedido.sdsOrcamento_Ace.ParamByName('ID').AsInteger := fDMCadPedido.cdsOrcamentoID.AsInteger;
    fDMCadPedido.cdsOrcamento_Ace.Open;

    fDMCadPedido.cdsOrcamento_Ace.First;
    while not fDMCadPedido.cdsOrcamento_Ace.Eof do
    begin
      fDMCadPedido.cdsPedido_Ace.Insert;
      for x := 0 to (fDMCadPedido.cdsOrcamento_Ace.FieldCount - 1) do
      begin
        if not(fDMCadPedido.cdsOrcamento_Ace.Fields[x].FieldName = 'ID') then
        begin
          if not (fDMCadPedido.cdsOrcamento_Ace.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
            fDMCadPedido.cdsPedido_Ace.FieldByName(fDMCadPedido.cdsOrcamento_Ace.Fields[x].FieldName).AsVariant := fDMCadPedido.cdsOrcamento_Ace.Fields[x].Value;
        end;
      end;
      fDMCadPedido.cdsPedido_AceID.AsInteger := fDMCadPedido.cdsPedidoID.AsInteger;
      fDMCadPedido.cdsPedido_Ace.Post;
      fDMCadPedido.cdsOrcamento_Ace.Next;
    end;
  end;

  if (fDMCadPedido.cdsParametrosEMPRESA_AMBIENTES.AsString = 'S') then
  begin
    fDMCadPedido.cdsOrcamento_Rol.Close;
    fDMCadPedido.sdsOrcamento_Rol.ParamByName('ID').AsInteger := fDMCadPedido.cdsOrcamentoID.AsInteger;
    fDMCadPedido.cdsOrcamento_Rol.Open;
                                        
    fDMCadPedido.cdsOrcamento_Rol.First;
    while not fDMCadPedido.cdsOrcamento_Rol.Eof do
    begin
      fDMCadPedido.cdsPedido_Rol.Insert;
      for x := 0 to (fDMCadPedido.cdsOrcamento_Rol.FieldCount - 1) do
      begin
        if not(fDMCadPedido.cdsOrcamento_Rol.Fields[x].FieldName = 'ID') then
        begin
          if not (fDMCadPedido.cdsOrcamento_Rol.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
            fDMCadPedido.cdsPedido_Rol.FieldByName(fDMCadPedido.cdsOrcamento_Rol.Fields[x].FieldName).AsVariant := fDMCadPedido.cdsOrcamento_Rol.Fields[x].Value;
        end;
      end;
      fDMCadPedido.cdsPedido_RolID.AsInteger := fDMCadPedido.cdsPedidoID.AsInteger;
      fDMCadPedido.cdsPedido_Rol.Post;
      fDMCadPedido.cdsOrcamento_Rol.Next;
    end;
  end;}
end;

procedure TfrmCadOrcamento_Aprov.prc_Gravar_Pedido_Item;
var
  x: Integer;
begin
  if not fDMCadPedido.cdsOrcamento_Itens.Locate('ITEM',fDMCadPedido.mOrcamento_ItensItem.AsInteger,[loCaseInsensitive]) then
    exit;

  fDMCadPedido.cdsOrcamento_Mat.Close;
  fDMCadPedido.sdsOrcamento_Mat.ParamByName('ID').AsInteger   := fDMCadPedido.cdsOrcamento_ItensID.AsInteger;
  fDMCadPedido.sdsOrcamento_Mat.ParamByName('ITEM').AsInteger := fDMCadPedido.cdsOrcamento_ItensITEM.AsInteger;
  fDMCadPedido.cdsOrcamento_Mat.Open;

  if (fDMCadPedido.cdsParametrosEMPRESA_SUCATA.AsString = 'S') or (fDMCadPedido.cdsParametrosEMPRESA_AMBIENTES.AsString = 'S') or
     (fDMCadPedido.qParametros_PedUSA_ITEM_RED.AsString = 'S') then
  begin
    fDMCadPedido.cdsOrcamento_Item_Tipo.Close;
    fDMCadPedido.sdsOrcamento_Item_Tipo.ParamByName('ID').AsInteger   := fDMCadPedido.cdsOrcamento_ItensID.AsInteger;
    fDMCadPedido.sdsOrcamento_Item_Tipo.ParamByName('ITEM').AsInteger := fDMCadPedido.cdsOrcamento_ItensITEM.AsInteger;
    fDMCadPedido.cdsOrcamento_Item_Tipo.Open;

    if (fDMCadPedido.cdsParametrosEMPRESA_SUCATA.AsString = 'S') then
    begin
      fDMCadPedido.cdsOrcamento_Item_Processo.Close;
      fDMCadPedido.sdsOrcamento_Item_Processo.ParamByName('ID').AsInteger   := fDMCadPedido.cdsOrcamento_ItensID.AsInteger;
      fDMCadPedido.sdsOrcamento_Item_Processo.ParamByName('ITEM').AsInteger := fDMCadPedido.cdsOrcamento_ItensITEM.AsInteger;
      fDMCadPedido.cdsOrcamento_Item_Processo.Open;
    end;
  end;

  fDMCadPedido.cdsPedido_Itens.Insert;
  for x := 0 to (fDMCadPedido.cdsOrcamento_Itens.FieldCount - 1) do
  begin
    if not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'ID') and not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'VLR_TOTAL') and
       not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'ESPESSURA') and not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'COMPRIMENTO') and
       not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'LARGURA') and not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'DIAMETRO') and
       not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'DIAMETRO_EXT') and not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'DIAMETRO_INT') and
       not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'PAREDE') and not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'DESCRICAO_TIPO') and
       not(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName = 'COMPLEMENTO_NOME') then
    begin
      if not (fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
        fDMCadPedido.cdsPedido_Itens.FieldByName(fDMCadPedido.cdsOrcamento_Itens.Fields[x].FieldName).AsVariant := fDMCadPedido.cdsOrcamento_Itens.Fields[x].Value;
    end;
  end;

  fDMCadPedido.cdsPedido_ItensVLR_DESCONTO.AsFloat       := StrToFloat(FormatFloat('0.0000',fDMCadPedido.mOrcamento_ItensVlr_Desconto.AsFloat));
  fDMCadPedido.cdsPedido_ItensVLR_DESCONTORATEIO.AsFloat := StrToFloat(FormatFloat('0.0000',0));

  vItem_Pedido := vItem_Pedido + 1;
  fDMCadPedido.cdsPedido_ItensID.AsInteger          := fDMCadPedido.cdsPedidoID.AsInteger;
  if (fDMCadPedido.cdsParametrosEMPRESA_AMBIENTES.AsString = 'S') and (fDMCadPedido.mOrcamento_ItensItem.AsInteger >= 500) then
    fDMCadPedido.cdsPedido_ItensITEM.AsInteger := fDMCadPedido.mOrcamento_ItensItem.AsInteger
  else
    fDMCadPedido.cdsPedido_ItensITEM.AsInteger        := vItem_Pedido;
  fDMCadPedido.cdsPedido_ItensQTD.AsFloat           := StrToFloat(FormatFloat('0.00000',fDMCadPedido.mOrcamento_ItensQtd.AsFloat));
  fDMCadPedido.cdsPedido_ItensVLR_TOTAL.AsFloat     := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat * fDMCadPedido.cdsPedido_ItensQTD.AsFloat));
  if (StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsOrcamento_ItensVLR_DESCONTO.AsFloat)) > 0) or (StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsOrcamento_ItensVLR_DESCONTORATEIO.AsFloat)) > 0) then
    fDMCadPedido.cdsPedido_ItensVLR_TOTAL.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_TOTAL.AsFloat - fDMCadPedido.cdsPedido_ItensVLR_DESCONTO.AsFloat - fDMCadPedido.cdsPedido_ItensVLR_DESCONTORATEIO.AsFloat));

  fDMCadPedido.cdsPedido_ItensQTD_AFATURAR.AsFloat  := 0;
  fDMCadPedido.cdsPedido_ItensQTD_FATURADO.AsFloat  := 0;
  fDMCadPedido.cdsPedido_ItensQTD_CANCELADO.AsFloat := 0;
  fDMCadPedido.cdsPedido_ItensQTD_RESTANTE.AsFloat  := StrToFloat(FormatFloat('0.00000',fDMCadPedido.cdsPedido_ItensQTD.AsFloat));
  fDMCadPedido.cdsPedido_ItensCANCELADO.AsString    := 'N';
  fDMCadPedido.cdsPedido_ItensFATURADO.AsString     := 'N';
  fDMCadPedido.cdsPedido_ItensPERC_DESCONTO.AsFloat := 0;
  if (fDMCadPedido.cdsParametrosTIPO_COMISSAO_PROD.AsString <> 'I') then
    fDMCadPedido.cdsPedido_ItensPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.00',0))
  else
    fDMCadPedido.cdsPedido_ItensPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadPedido.mOrcamento_ItensPerc_Comissao.AsFloat));
  
  if StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensPERC_IPI.AsFloat)) > 0 then
    fDMCadPedido.cdsPedido_ItensVLR_IPI.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_TOTAL.AsFloat * fDMCadPedido.cdsPedido_ItensPERC_IPI.AsFloat / 100));

  fDMCadPedido.cdsPedido_ItensID_ORCAMENTO.AsInteger   := fDMCadPedido.cdsOrcamentoID.AsInteger;
  fDMCadPedido.cdsPedido_ItensITEM_ORCAMENTO.AsInteger := fDMCadPedido.mOrcamento_ItensItem.AsInteger;
  fDMCadPedido.cdsPedido_ItensEND_FOTO.AsString        := fDMCadPedido.cdsOrcamento_ItensEND_FOTO.AsString;
  fDMCadPedido.cdsPedido_ItensQTD_PECA.AsInteger       := fDMCadPedido.mOrcamento_ItensQtd_Peca.AsInteger;
  fDMCadPedido.cdsPedido_ItensID_NCM.AsInteger         := StrToInt(FormatFloat('0',fDMCadPedido.mOrcamento_ItensID_NCM.AsInteger));
  fDMCadPedido.cdsPedido_ItensTIPO_ORCAMENTO.AsString  := fDMCadPedido.mOrcamento_ItensTipo_Orcamento.AsString;

  if (fDMCadPedido.cdsCFOP.Locate('ID',fDMCadPedido.cdsPedido_ItensID_CFOP.AsInteger,[loCaseInsensitive])) and (StrToFloat(formatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_ICMSSUBST.AsFloat)) <= 0)
    and (fDMCadPedido.cdsCFOPSUBSTITUICAO_TRIB.AsString = 'S') then
  begin
    if fDMCadPedido.cdsParametrosCONTROLAR_NOTIFICACAO.AsString <> 'S' then
      fDMCadPedido.cdsPedido_ItensGRAVACAO_COM_ERRO.AsString := ''
    else
      fDMCadPedido.cdsPedido_ItensGRAVACAO_COM_ERRO.AsString := 'CST';
  end;
  if fDMCadPedido.cdsParametrosTIPO_ESTOQUE.AsString = 'P' then
    fDMCadPedido.cdsPedido_ItensGERAR_ESTOQUE.AsString := 'S'
  else
    fDMCadPedido.cdsPedido_ItensGERAR_ESTOQUE.AsString := 'N';
  fDMCadPedido.cdsPedido_Itens.Post;

  //Materiais
  fDMCadPedido.cdsOrcamento_Mat.First;
  while not fDMCadPedido.cdsOrcamento_Mat.Eof do
  begin
    fDMCadPedido.cdsOrcamento_Etiqueta.Close;
    fDMCadPedido.sdsOrcamento_Etiqueta.ParamByName('ID').AsInteger       := fDMCadPedido.cdsOrcamento_ItensID.AsInteger;
    fDMCadPedido.sdsOrcamento_Etiqueta.ParamByName('ITEM').AsInteger     := fDMCadPedido.cdsOrcamento_ItensITEM.AsInteger;
    fDMCadPedido.sdsOrcamento_Etiqueta.ParamByName('ITEM_MAT').AsInteger := fDMCadPedido.cdsOrcamento_MatITEM_MAT.AsInteger;
    fDMCadPedido.cdsOrcamento_Etiqueta.Open;

    fDMCadPedido.cdsPedido_Material.Insert;
    for x := 0 to (fDMCadPedido.cdsOrcamento_Mat.FieldCount - 1) do
    begin
      if not(fDMCadPedido.cdsOrcamento_Mat.Fields[x].FieldName = 'ID') and not(fDMCadPedido.cdsOrcamento_Mat.Fields[x].FieldName = 'ITEM')  then
      begin
        if not (fDMCadPedido.cdsOrcamento_Mat.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
          fDMCadPedido.cdsPedido_Material.FieldByName(fDMCadPedido.cdsOrcamento_Mat.Fields[x].FieldName).AsVariant := fDMCadPedido.cdsOrcamento_Mat.Fields[x].Value;
      end;
    end;
    fDMCadPedido.cdsPedido_MaterialID.AsInteger   := fDMCadPedido.cdsPedido_ItensID.AsInteger;
    fDMCadPedido.cdsPedido_MaterialITEM.AsInteger := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
    fDMCadPedido.cdsPedido_Material.Post;

    //Etiquetas (Tamanhos)
    fDMCadPedido.cdsOrcamento_Etiqueta.First;
    while not fDMCadPedido.cdsOrcamento_Etiqueta.Eof do
    begin
      fDMCadPedido.cdsPedido_Etiqueta.Insert;
      for x := 0 to (fDMCadPedido.cdsOrcamento_Etiqueta.FieldCount - 1) do
      begin
        if not(fDMCadPedido.cdsOrcamento_Etiqueta.Fields[x].FieldName = 'ID') and not(fDMCadPedido.cdsOrcamento_Etiqueta.Fields[x].FieldName = 'ITEM')  then
        begin
          if not (fDMCadPedido.cdsOrcamento_Etiqueta.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
            fDMCadPedido.cdsPedido_Etiqueta.FieldByName(fDMCadPedido.cdsOrcamento_Etiqueta.Fields[x].FieldName).AsVariant := fDMCadPedido.cdsOrcamento_Etiqueta.Fields[x].Value;
        end;
      end;
      fDMCadPedido.cdsPedido_EtiquetaID.AsInteger   := fDMCadPedido.cdsPedido_EtiquetaID.AsInteger;
      fDMCadPedido.cdsPedido_EtiquetaITEM.AsInteger := fDMCadPedido.cdsPedido_EtiquetaITEM.AsInteger;
      fDMCadPedido.cdsPedido_Etiqueta.Post;
      fDMCadPedido.cdsOrcamento_Etiqueta.Next;
    end;
    //****************
    fDMCadPedido.cdsOrcamento_Mat.Next;
  end;

  //Empresa de Sucata (JW)
  if (fDMCadPedido.cdsParametrosEMPRESA_SUCATA.AsString = 'S') or (fDMCadPedido.cdsParametrosEMPRESA_AMBIENTES.AsString = 'S')
    or (fDMCadPedido.qParametros_PedUSA_ITEM_RED.AsString = 'S') then
  begin
    fDMCadPedido.cdsPedido_Item_Tipo.Insert;
    for x := 0 to (fDMCadPedido.cdsOrcamento_Item_Tipo.FieldCount - 1) do
    begin
      if not(fDMCadPedido.cdsOrcamento_Item_Tipo.Fields[x].FieldName = 'ID') and not(fDMCadPedido.cdsOrcamento_Item_Tipo.Fields[x].FieldName = 'ITEM')  then
      begin
        if not (fDMCadPedido.cdsOrcamento_Item_Tipo.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
          fDMCadPedido.cdsPedido_Item_Tipo.FieldByName(fDMCadPedido.cdsOrcamento_Item_Tipo.Fields[x].FieldName).AsVariant := fDMCadPedido.cdsOrcamento_Item_Tipo.Fields[x].Value;
      end;
    end;
    fDMCadPedido.cdsPedido_Item_TipoQTD.AsFloat       := StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsPedido_ItensQTD.AsFloat));
    fDMCadPedido.cdsPedido_Item_TipoVLR_TOTAL.AsFloat := StrToFloat(FormatFloat('0.00',(fDMCadPedido.cdsPedido_Item_TipoVLR_UNITARIO.AsFloat * fDMCadPedido.cdsPedido_Item_TipoQTD.AsFloat)));
    fDMCadPedido.cdsPedido_Item_TipoID.AsInteger   := fDMCadPedido.cdsPedido_ItensID.AsInteger;
    fDMCadPedido.cdsPedido_Item_TipoITEM.AsInteger := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
    fDMCadPedido.cdsPedido_Item_Tipo.Post;

    //30/10/2020
    if (fDMCadPedido.cdsParametrosEMPRESA_SUCATA.AsString = 'S') then
    begin
      fDMCadPedido.cdsOrcamento_Item_Processo.First;
      while not fDMCadPedido.cdsOrcamento_Item_Processo.Eof do
      begin
        fDMCadPedido.cdsPedido_Item_Processo.Insert;
        for x := 0 to (fDMCadPedido.cdsOrcamento_Item_Processo.FieldCount - 1) do
        begin
          if not(fDMCadPedido.cdsOrcamento_Item_Processo.Fields[x].FieldName = 'ID') and not(fDMCadPedido.cdsOrcamento_Item_Processo.Fields[x].FieldName = 'ITEM')  then
          begin
            if not (fDMCadPedido.cdsOrcamento_Item_Processo.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
              fDMCadPedido.cdsPedido_Item_Processo.FieldByName(fDMCadPedido.cdsOrcamento_Item_Processo.Fields[x].FieldName).AsVariant := fDMCadPedido.cdsOrcamento_Item_Processo.Fields[x].Value;
          end;
        end;
        fDMCadPedido.cdsPedido_Item_ProcessoID.AsInteger   := fDMCadPedido.cdsPedido_ItensID.AsInteger;
        fDMCadPedido.cdsPedido_Item_ProcessoITEM.AsInteger := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
        fDMCadPedido.cdsPedido_Item_Processo.Post;

        fDMCadPedido.cdsOrcamento_Item_Processo.Next;
      end;

    end;
    //******************

  end;

  fDMCadPedido.mOrcamento_Itens.Edit;
  fDMCadPedido.mOrcamento_ItensCopiado.AsString := 'S';
  fDMCadPedido.mOrcamento_Itens.Post;

  fDMCadPedido.cdsPedidoVLR_TOTAL.AsFloat    := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_TOTAL.AsFloat + fDMCadPedido.cdsPedido_ItensVLR_TOTAL.AsFloat));
  fDMCadPedido.cdsPedidoVLR_ITENS.AsFloat    := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_ITENS.AsFloat + fDMCadPedido.cdsPedido_ItensVLR_TOTAL.AsFloat));
  fDMCadPedido.cdsPedidoVLR_IPI.AsFloat      := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_IPI.AsFloat   + fDMCadPedido.cdsPedido_ItensVLR_IPI.AsFloat));
  fDMCadPedido.cdsPedidoVLR_DESCONTO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_DESCONTO.AsFloat +
                                                fDMCadPedido.cdsPedido_ItensVLR_DESCONTO.AsFloat + fDMCadPedido.cdsPedido_ItensVLR_DESCONTORATEIO.AsFloat));
  fDMCadPedido.cdsPedidoVLR_FRETE.AsFloat    := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_FRETE.AsFloat));

  fDMCadPedido.cdsPedidoQTD.AsFloat          := fDMCadPedido.cdsPedidoQTD.AsFloat + fDMCadPedido.cdsPedido_ItensQTD.AsFloat;
  fDMCadPedido.cdsPedidoQTD_RESTANTE.AsFloat := fDMCadPedido.cdsPedidoQTD_RESTANTE.AsFloat + fDMCadPedido.cdsPedido_ItensQTD.AsFloat;
  if StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsPedidoVLR_DESCONTO.AsFloat)) > 0 then
    fDMCadPedido.cdsPedidoTIPO_DESCONTO.AsString := 'I';
end;

procedure TfrmCadOrcamento_Aprov.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadPedido.mOrcamento_ItensCopiado.AsString = 'S' then
    Background := clMoneyGreen;
end;

procedure TfrmCadOrcamento_Aprov.prc_Gravar_Reprovacao;
var
  sds: TSQLDataSet;
begin
  if not fDMCadPedido.cdsOrcamento_Itens.Locate('ITEM',fDMCadPedido.mOrcamento_ItensItem.AsInteger,[loCaseInsensitive]) then
    exit;

  fDMCadPedido.cdsOrcamento_Itens.Edit;
  fDMCadPedido.cdsOrcamento_ItensAPROVADO_ORC.AsString  := 'N';
  fDMCadPedido.cdsOrcamento_ItensMOTIVO_NAO_APROV.Value := Memo1.Lines.Text;
  if DateEdit1.Date > 10 then
    fDMCadPedido.cdsOrcamento_ItensDTAPROVADO_NAO.AsDateTime := DateEdit1.Date
  else
    fDMCadPedido.cdsOrcamento_ItensDTAPROVADO_NAO.Clear;
  fDMCadPedido.cdsOrcamento_Itens.Post;
  //fDMCadPedido.cdsOrcamento_Itens.ApplyUpdates(0);
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'UPDATE PEDIDO_ITEM SET APROVADO_ORC = :APROVADO_ORC, MOTIVO_NAO_APROV = :MOTIVO_NAO_APROV, DTAPROVADO_NAO = :DTAPROVADO_NAO '
                       + ' WHERE ID = ' + IntToStr(fDMCadPedido.cdsOrcamento_ItensID.AsInteger)
                       + '   AND ITEM = ' + IntToStr(fDMCadPedido.cdsOrcamento_ItensITEM.AsInteger);
    sds.ParamByName('APROVADO_ORC').AsString     := 'N';
    sds.ParamByName('MOTIVO_NAO_APROV').AsString := Memo1.Lines.Text;
    sds.ParamByName('DTAPROVADO_NAO').AsDate     := DateEdit1.Date;
    sds.ExecSQL;
  finally
    FreeAndNil(sds);
  end;

end;

procedure TfrmCadOrcamento_Aprov.SelecionarTodos1Click(Sender: TObject);
begin
  fDMCadPedido.mOrcamento_Itens.First;
  while not fDMCadPedido.mOrcamento_Itens.Eof do
  begin
    fDMCadPedido.mOrcamento_Itens.Edit;
    fDMCadPedido.mOrcamento_ItensAprovar.AsBoolean := True;
    fDMCadPedido.mOrcamento_Itens.Post;
    fDMCadPedido.mOrcamento_Itens.Next;
  end;
  fDMCadPedido.mOrcamento_Itens.First;
end;

procedure TfrmCadOrcamento_Aprov.SMDBGrid1TitleClick(Column: TColumn);
var
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadPedido.mOrcamento_Itens.IndexFieldNames := Column.FieldName;
end;

end.
