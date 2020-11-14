unit UMontaPed_TipoItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, SMDBGrid, FMTBcd, DB,
  Provider, DBClient, SqlExpr, RxLookup, Mask, ToolEdit, CurrEdit, ComObj, 
  UDMCopiaPedido, ShellAPI, Menus, uConsProdutoPedido, UCadPedido_Itens, uDMCadPedido,
  uSel_Produto, uMostraPDF, classe.ControlePedidoProjeto, classe.Controle, classe.ConexaoBD,
  NxCollection, NxEdit, RzButton;

type
  EnumTipo = (tpChapa, tpInox, tpAluminio);
type
  TfrmMontaPed_TipoItem = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    Panel2: TPanel;
    btnCopiar: TBitBtn;
    lblDiretorio: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    btnCarrega: TSpeedButton;
    mArquivoImportado: TClientDataSet;
    dsmArquivoImportado: TDataSource;
    mArquivoImportadoCaminhoArquivo: TStringField;
    mArquivoImportadoNomeArquivo: TStringField;
    mArquivoImportadoExtensaoArquivo: TStringField;
    mArquivoImportadoEspessura: TFloatField;
    mArquivoImportadoQtde: TFloatField;
    mArquivoImportadoLargura: TFloatField;
    mArquivoImportadoPeso: TFloatField;
    mArquivoImportadoVlr_Unitario: TFloatField;
    mArquivoImportadoVlr_Dobra: TFloatField;
    mArquivoImportadoVlr_Total: TFloatField;
    mArquivoImportadoComprimento: TFloatField;
    mArquivoImportadoPrecoKG: TFloatField;
    RadioGroup1: TRadioGroup;
    mArquivoImportadoCodigo_Produto: TIntegerField;
    Shape1: TShape;
    Label25: TLabel;
    RadioGroup2: TRadioGroup;
    mArquivoImportadoAltura: TFloatField;
    mArquivoImportadoFator_Calculo: TFloatField;
    Shape2: TShape;
    Label1: TLabel;
    pnlItens: TPanel;
    SMDBGrid1: TSMDBGrid;
    btnAbrirPDF: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    FilenameEdit1: TFilenameEdit;
    Label4: TLabel;
    cbxArquivo: TNxComboBox;
    Label3: TLabel;
    mArquivoImportadoProcesso: TStringField;
    Label5: TLabel;
    mArquivoImportadoItem: TIntegerField;
    mArquivoImportadoProcesso_01: TIntegerField;
    mArquivoImportadoProcesso_02: TIntegerField;
    mArquivoImportadoProcesso_03: TIntegerField;
    mArquivoImportadoProcesso_04: TIntegerField;
    mArquivoImportadoProcesso_05: TIntegerField;
    mArquivoImportadoProcesso_06: TIntegerField;
    mArquivoImportadoProcesso_07: TIntegerField;
    mArquivoImportadoProcesso_08: TIntegerField;
    mArquivoImportadoProcesso_09: TIntegerField;
    mArquivoImportadoProcesso_10: TIntegerField;
    mProcesso: TClientDataSet;
    mProcessoOrdem: TIntegerField;
    mProcessoID_Processo: TIntegerField;
    mProcessoNome: TStringField;
    mProcessoQtd: TIntegerField;
    mProcessoDobra: TStringField;
    mProcessoColuna: TIntegerField;
    mArquivoImportadoObs_Reduzida: TStringField;
    Shape3: TShape;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure btnCopiarClick(Sender: TObject);
    procedure btnCarregaClick(Sender: TObject);
    procedure prc_OpenPDF(aFile: TFileName; TypeForm: Integer = SW_NORMAL);
    procedure SpeedButton2Click(Sender: TObject);
    procedure mArquivoImportadoEspessuraChange(Sender: TField);
    procedure mArquivoImportadoNewRecord(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mArquivoImportadoQtdeChange(Sender: TField);
    procedure mArquivoImportadoVlr_DobraChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure btnAbrirPDFClick(Sender: TObject);
    procedure mArquivoImportadoVlr_UnitarioChange(Sender: TField);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    ctChapaLocal: string;
    StringGrid1: TStringGrid;
    ffrmCadPedido_Itens : TfrmCadPedido_Itens;
    ffrmMostraPDF : TfrmMostraPDF;

    vSomar : Boolean;
    vProcurar_Prod : Boolean;
    vItem_Arq : Integer;

    procedure ListarArquivos(Diretorio: string);
    procedure prc_Calcular_Peso_PC_Chapa;
    procedure prc_Calcular_VlrTotal;
    procedure prc_Desabilita_Controles;
    procedure prc_Habilita_Controles;
    procedure prc_Carrega_Excel;
    procedure prc_Le_StringGrid;
    procedure prc_Carrega_CSV;
    procedure prc_Carrega_mProcesso_Sel;
    procedure prc_Gravar_mArquivo_Proc;

    function fnc_Buscar_Produto(MM : Real; Tipo : String): Integer;
    function NomeArquivoSemExtensao(Texto: string): string;

    function XlsToStringGrid2(AGrid: TStringGrid; AXLSFile: string; WorkSheet: Integer): Boolean;

  public
    { Public declarations }
    fDMCadPedido : TDMCadPedido;
    ffrmConsultaProduto : TfrmConsultaProduto;
    fDMCopiaPedido: TDMCopiaPedido;
    vTipo_Prod: string; //P=Produto  M=Material  'V�zio'=Ambos
    vID_Cliente: Integer;
  end;

var
  frmMontaPed_TipoItem: TfrmMontaPed_TipoItem;

implementation

uses
  DmdDatabase, uUtilPadrao, uCalculo_Pedido, classe.CalcularPeso,
  UCadPedido_Proc;

{$R *.dfm}

procedure TfrmMontaPed_TipoItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmMontaPed_TipoItem.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: string;
begin
  ColunaOrdenada := Column.FieldName;
  mArquivoImportado.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[i] = Column) then
      SMDBGrid1.Columns.Items[i].Title.Color := clBtnFace;
end;

procedure TfrmMontaPed_TipoItem.btnCopiarClick(Sender: TObject);
var
  vID_CFOPAnt : Integer;
  vControlePedidoProjeto : TPedidoControle;
  vControle : TControle;
  vItemAux : Integer;
  vCont: Integer;
  vContProc : Integer;
  i: Integer;
  vGravar: Boolean;
begin
  mArquivoImportado.First;
  if mArquivoImportado.IsEmpty then
  begin
    MessageDlg('Nenhum registro encontrado!',mtError,mbOKCancel,0);
    exit;
  end;

  ffrmCadPedido_Itens := TfrmCadPedido_Itens.Create(self);
  ffrmCadPedido_Itens.Tag := 99;
  ffrmCadPedido_Itens.fDMCadPedido   := fDMCadPedido;
  ffrmCadPedido_Itens.vMostrar_Preco := True;

  //mArquivoImportado.DisableControls;
  vGravar := True;

  if trim(fDMCadPedido.qParametros_PedLIB_ITEM_SEM_PROCESSO.AsString) <> 'S' then
  begin
    SMDBGrid1.DisableScroll;
    try
      mArquivoImportado.First;
      while not mArquivoImportado.Eof do
      begin
        if StrToFloat(FormatFloat('0.0000',mArquivoImportadoQtde.AsFloat)) > 0 then
        begin
          vContProc := 0;
          for i := 1 to 10 do
          begin
            if mArquivoImportado.FieldByName('PROCESSO_'+FormatFloat('00',i)).AsInteger > 0 then
             vContProc := vContProc + 1;
          end;
          if vContProc <= 1 then
          begin
            MessageDlg('Item ' + mArquivoImportadoNomeArquivo.AsString + ', sem Processo, n�o ser� copiado!', mtWarning,mbOKCancel,0);
            vGravar := False;
            mArquivoImportado.Last;
          end;
        end;
        mArquivoImportado.Next;
      end;
    finally
      SMDBGrid1.EnableScroll;
    end;
  end;

  if not vGravar then
    exit;

  try
    mArquivoImportado.First;
    while not mArquivoImportado.Eof do
    begin
      if mArquivoImportadoQtde.AsFloat > 0 then
      begin
        fDMCadPedido.prc_Inserir_Itens;
        fDMCadPedido.cdsPedido_ItensID_PRODUTO.AsInteger := mArquivoImportadoCodigo_Produto.AsInteger;
        fDMCadPedido.cdsPedido_ItensQTD.AsFloat          := mArquivoImportadoQtde.AsFloat;
        fDMCadPedido.cdsPedido_ItensUNIDADE.AsString     := SQLLocate('PRODUTO','ID','UNIDADE',mArquivoImportadoCodigo_Produto.AsString);
        fDMCadPedido.cdsPedido_ItensQTD.AsFloat          := mArquivoImportadoQtde.AsFloat;
        fDMCadPedido.cdsPedido_ItensQTD_RESTANTE.AsFloat := mArquivoImportadoQtde.AsFloat;
        fDMCadPedido.cdsPedido_ItensID_NCM.AsString      := SQLLocate('PRODUTO','ID','ID_NCM',mArquivoImportadoCodigo_Produto.AsString);
        fDMCadPedido.cdsPedido_ItensREFERENCIA.AsString  := SQLLocate('PRODUTO','ID','REFERENCIA',mArquivoImportadoCodigo_Produto.AsString);
        fDMCadPedido.cdsPedido_ItensNOMEPRODUTO.AsString := SQLLocate('PRODUTO','ID','NOME',mArquivoImportadoCodigo_Produto.AsString);
        fDMCadPedido.cdsPedido_ItensNCM.AsString         := SQLLocate('TAB_NCM','ID','NCM',fDMCadPedido.cdsPedido_ItensID_NCM.AsString);
        fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat := mArquivoImportadoVlr_Unitario.AsFloat;
        //Foi tirado pois estava deixando filtrado os produtos   05/11/2020    Cleomar
        //fDMCadPedido.prc_Abrir_ProdutoLoja(mArquivoImportadoCodigo_Produto.AsInteger,'','');
        fDMCadPedido.cdsProduto.Locate('ID',mArquivoImportadoCodigo_Produto.AsInteger,[loCaseInsensitive]);

        if fDMCadPedido.cdsPedidoID_OPERACAO_NOTA.AsInteger > 0 then
          uCalculo_Pedido.prc_Posicionar_Regra_Empresa(fDMCadPedido,fDMCadPedido.cdsPedidoID_OPERACAO_NOTA.AsInteger,fDMCadPedido.vFinalidade);
        if (fDMCadPedido.cdsPedido_ItensID_CFOP.AsInteger <= 0) and (fDMCadPedido.vID_CFOP > 0) then
          fDMCadPedido.cdsPedido_ItensID_CFOP.AsInteger := fDMCadPedido.vID_CFOP;
        if fDMCadPedido.cdsPedido_ItensID_CFOP.AsInteger > 0 then
          vID_CFOPAnt := fDMCadPedido.cdsPedido_ItensID_CFOP.AsInteger
        else
          vID_CFOPAnt := 0;
//        ffrmCadPedido_Itens.pnlTipo1Exit(ffrmCadPedido_Itens);
        if (vID_CFOPAnt > 0) and (fDMCadPedido.cdsPedido_ItensID_CFOP.AsInteger <> vID_CFOPAnt) then
        begin
          fDMCadPedido.cdsPedido_ItensID_CFOP.AsInteger := vID_CFOPAnt;
          if (fDMCadPedido.cdsPedido_ItensID_CFOP.AsInteger > 0) then
            ffrmCadPedido_Itens.RxDBLookupCombo1Exit(ffrmCadPedido_Itens);
        end;
        ffrmCadPedido_Itens.prc_Move_Dados_Itens;
        fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat := mArquivoImportadoVlr_Unitario.AsFloat;
        ffrmCadPedido_Itens.BitBtn1Click(ffrmCadPedido_Itens);

         //Grava Item Tipo do Pedido
        fDMCadPedido.cdsPedido_Item_Tipo.Insert;
        fDMCadPedido.cdsPedido_Item_TipoID.AsInteger         := fDMCadPedido.cdsPedido_ItensID.AsInteger;
        fDMCadPedido.cdsPedido_Item_TipoITEM.AsInteger       := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
        fDMCadPedido.cdsPedido_Item_TipoCOMPRIMENTO.AsFloat  := mArquivoImportadoComprimento.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoLARGURA.AsFloat      := mArquivoImportadoLargura.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoALTURA.AsFloat       := mArquivoImportadoAltura.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoESPESSURA.AsFloat    := mArquivoImportadoEspessura.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoVLR_KG.AsFloat       := mArquivoImportadoPrecoKG.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoQTD.AsFloat          := mArquivoImportadoQtde.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoVLR_UNITARIO.AsFloat := mArquivoImportadoVlr_Unitario.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoVLR_TOTAL.AsFloat    := mArquivoImportadoVlr_Total.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoPESO.AsFloat         := mArquivoImportadoPeso.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoCOMPLEMENTO_NOME.AsString := mArquivoImportadoNomeArquivo.AsString;
        fDMCadPedido.cdsPedido_Item_TipoVLR_DOBRA.AsFloat    := mArquivoImportadoVlr_Dobra.AsFloat;
        fDMCadPedido.cdsPedido_Item_TipoFATOR_CALCULO.AsFloat := mArquivoImportadoFator_Calculo.AsFloat;

        fDMCadPedido.cdsPedido_Item_TipoTIPO_ORCAMENTO.AsString := 'C';
        fDMCadPedido.cdsPedido_Item_TipoDESCRICAO_TIPO.AsString := 'CHAPA';
        fDMCadPedido.cdsPedido_Item_TipoCAMINHO_ARQUIVO_PDF.AsString := mArquivoImportadoCaminhoArquivo.AsString;

        fDMCadPedido.cdsPedido_ItensQTD_LANCAR_ESTOQUE.AsFloat := StrToFloat(FormatFloat('0.0000',(fDMCadPedido.cdsPedido_Item_TipoPESO.AsFloat)));
        fDMCadPedido.cdsPedido_ItensNOMEPRODUTO.AsString := fDMCadPedido.cdsPedido_ItensNOMEPRODUTO.AsString + ' ' + fDMCadPedido.cdsPedido_Item_TipoCOMPLEMENTO_NOME.AsString;

        fDMCadPedido.cdsPedido_ItensOBS_REDUZIDA.AsString := mArquivoImportadoObs_Reduzida.AsString;

        //Grava os processos    28/10/2020

        vItemAux := 0;
        for vCont := 1 to 10 do
        begin
          vItemAux := vItemAux + 1;
          if mArquivoImportado.FieldByName('Processo_'+FormatFloat('00',vCont)).AsInteger > 0 then
          begin
            fDMCadPedido.cdsPedido_Item_Processo.Insert;
            fDMCadPedido.cdsPedido_Item_ProcessoID.AsInteger            := fDMCadPedido.cdsPedidoID.AsInteger;
            fDMCadPedido.cdsPedido_Item_ProcessoITEM.AsInteger          := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
            fDMCadPedido.cdsPedido_Item_ProcessoITEM_PROCESSO.AsInteger := vCont;
            mProcesso.Locate('Ordem',vCont,([Locaseinsensitive]));
            fDMCadPedido.cdsPedido_Item_ProcessoID_PROCESSO.AsInteger   := mProcessoID_Processo.AsInteger;
            fDMCadPedido.cdsPedido_Item_ProcessoQTD.AsInteger           := mArquivoImportadoQtde.AsInteger;
            fDMCadPedido.cdsPedido_Item_ProcessoQTD_DOBRA.AsInteger     := mArquivoImportado.FieldByName('Processo_'+FormatFloat('00',vCont)).AsInteger;
            //if mProcessoDobra.AsString = 'S' then
            //  fDMCadPedido.cdsPedido_Item_ProcessoNOME2.AsString := mProcessoNome.AsString + ' Qtd: ' + fDMCadPedido.cdsPedido_Item_ProcessoQTD_DOBRA.AsString;
            fDMCadPedido.cdsPedido_Item_ProcessoDTENTRADA.Clear;
            fDMCadPedido.cdsPedido_Item_ProcessoHRENTRADA.Clear;
            fDMCadPedido.cdsPedido_Item_ProcessoDTBAIXA.Clear;
            fDMCadPedido.cdsPedido_Item_ProcessoHRSAIDA.Clear;
            fDMCadPedido.cdsPedido_Item_Processo.Post;
          end;
        end;

        {vItemAux := 0;
        mArquivo_Proc.First;
        while not mArquivo_Proc.Eof do
        begin
          vItemAux := vItemAux + 1;
          fDMCadPedido.cdsPedido_Item_Processo.Insert;
          fDMCadPedido.cdsPedido_Item_ProcessoID.AsInteger            := fDMCadPedido.cdsPedidoID.AsInteger;
          fDMCadPedido.cdsPedido_Item_ProcessoITEM.AsInteger          := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
          fDMCadPedido.cdsPedido_Item_ProcessoITEM_PROCESSO.AsInteger := vItemAux;
          fDMCadPedido.cdsPedido_Item_ProcessoID_PROCESSO.AsInteger   := mArquivo_ProcID.AsInteger;
          fDMCadPedido.cdsPedido_Item_ProcessoQTD.AsInteger           := mArquivoImportadoQtde.AsInteger;
          fDMCadPedido.cdsPedido_Item_ProcessoQTD_DOBRA.AsInteger     := mArquivo_ProcQtd_Dobra.AsInteger;
          fDMCadPedido.cdsPedido_Item_ProcessoNOME.AsString           := mArquivo_ProcNome.AsString;
          fDMCadPedido.cdsPedido_Item_ProcessoDTENTRADA.Clear;
          fDMCadPedido.cdsPedido_Item_ProcessoHRENTRADA.Clear;
          fDMCadPedido.cdsPedido_Item_ProcessoDTBAIXA.Clear;
          fDMCadPedido.cdsPedido_Item_ProcessoHRSAIDA.Clear;
          fDMCadPedido.cdsPedido_Item_Processo.Post;
          mArquivo_Proc.Next;
        end;}
        //************************

        fDMCadPedido.cdsPedido_Item_Tipo.Post;
        fdmCadPedido.cdsPedido_Itens.Post;

        vControle := TControle.Create;

        vControlePedidoProjeto := TPedidoControle.create(vControle);
        try
          vControlePedidoProjeto.NomeProjeto  := mArquivoImportadoNomeArquivo.AsString;
          vControlePedidoProjeto.ID_Pessoa    := fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger;
          vControlePedidoProjeto.PRECO_KG     := mArquivoImportadoPrecoKG.AsFloat;
          vControlePedidoProjeto.PESO         := mArquivoImportadoPeso.AsFloat;
          vControlePedidoProjeto.VLR_DOBRA    := mArquivoImportadoVlr_Dobra.AsFloat;
          vControlePedidoProjeto.VLR_UNITARIO := mArquivoImportadoVlr_Unitario.AsFloat;
          vControlePedidoProjeto.COMPRIMENTO  := mArquivoImportadoComprimento.AsFloat;
          vControlePedidoProjeto.LARGURA      := mArquivoImportadoLargura.AsFloat;
          vControlePedidoProjeto.ESPESSURA    := mArquivoImportadoEspessura.AsFloat;
          vControlePedidoProjeto.ID_PRODUTO   := mArquivoImportadoCodigo_Produto.AsInteger;
          vControlePedidoProjeto.PROCESSO_01  := mArquivoImportadoProcesso_01.AsInteger;
          vControlePedidoProjeto.PROCESSO_02  := mArquivoImportadoProcesso_02.AsInteger;
          vControlePedidoProjeto.PROCESSO_03  := mArquivoImportadoProcesso_03.AsInteger;
          vControlePedidoProjeto.PROCESSO_04  := mArquivoImportadoProcesso_04.AsInteger;
          vControlePedidoProjeto.PROCESSO_05  := mArquivoImportadoProcesso_05.AsInteger;
          vControlePedidoProjeto.PROCESSO_06  := mArquivoImportadoProcesso_06.AsInteger;
          vControlePedidoProjeto.PROCESSO_07  := mArquivoImportadoProcesso_07.AsInteger;
          vControlePedidoProjeto.PROCESSO_08  := mArquivoImportadoProcesso_08.AsInteger;
          vControlePedidoProjeto.PROCESSO_09  := mArquivoImportadoProcesso_09.AsInteger;
          vControlePedidoProjeto.PROCESSO_10  := mArquivoImportadoProcesso_10.AsInteger;
          if not vControlePedidoProjeto.InserePedidoProjeto then
            MessageDlg('Erro ao gravar o projeto',mtInformation,[mbOK],0);
        finally
          begin
            vControlePedidoProjeto.Free;
            vControle.Free;
          end;
        end;

      end;
      mArquivoImportado.Next;
    end;
  finally
    //mArquivoImportado.EnableControls;
    FreeAndNil(ffrmCadPedido_Itens);
  end;
  ShowMessage('Itens importados com sucesso!');
  Close;
end;

procedure TfrmMontaPed_TipoItem.btnCarregaClick(Sender: TObject);
begin
  vProcurar_Prod := False;
  try
    btnCarrega.Tag := 1;
    vItem_Arq      := 0;
    ListarArquivos(DirectoryEdit1.Text);
    if (trim(FilenameEdit1.Text) <> '') then
    begin
      if cbxArquivo.ItemIndex = 0 then
        prc_Carrega_Excel
      else
        prc_Carrega_CSV;
    end;
    btnCarrega.Enabled := (mArquivoImportado.IsEmpty);
    btnCarrega.Tag := 0;
  finally
    vProcurar_Prod := True;
  end;
end;

procedure TfrmMontaPed_TipoItem.ListarArquivos(Diretorio: string);
var
  F: TSearchRec;
  Ret, i: Integer;
  TempNome, Extensao: string;
  vControlePedidoProjeto : TPedidoControle;
  vControle : TControle;
  vCalcularPeso : TCalcluar_Peso;
  vCont : Integer;
  vCont_Processo : Integer;
begin
  vControle := TControle.Create;
  vControlePedidoProjeto := TPedidoControle.create(vControle);
  vCalcularPeso := TCalcluar_Peso.Create;
  mArquivoImportado.EmptyDataSet;
  vCont := SMDBGrid1.Columns.Count - 1;
  vCont_Processo := 0;
  i := 0;
  mProcesso.EmptyDataSet;
  fDMCadPedido.cdsProcesso.Open;
  fDMCadPedido.cdsProcesso.IndexFieldNames := 'ORDEM_MAPA';
  fDMCadPedido.cdsProcesso.First;
  while not fDMCadPedido.cdsProcesso.Eof do
  begin
    if fDMCadPedido.cdsProcessoORDEM_MAPA.AsInteger > 0 then
    begin
      vCont := vCont + 1;
      i     := i + 1;
      mProcesso.Insert;
      mProcessoOrdem.AsInteger := fDMCadPedido.cdsProcessoORDEM_MAPA.AsInteger;
      mProcessoID_Processo.AsInteger := fDMCadPedido.cdsProcessoID.AsInteger;
      mProcessoNome.AsString         := fDMCadPedido.cdsProcessoNOME.AsString;
      if fDMCadPedido.qParametros_PedID_PROCESSO_FINAL.AsInteger = fDMCadPedido.cdsProcessoID.AsInteger then
      begin
        mProcessoQtd.AsInteger := 1;
        vCont_Processo         := i;
      end
      else
        mProcessoQtd.AsInteger := 0;
      mProcessoDobra.AsString        := fDMCadPedido.cdsProcessoUSAR_QTD_DOBRA.AsString;
      mProcessoColuna.AsInteger      := vCont;
      mProcesso.Post;
      SMDBGrid1.Columns.Add;
      SMDBGrid1.Columns[vCont].FieldName := 'Processo_' + FormatFloat('00',fDMCadPedido.cdsProcessoORDEM_MAPA.AsInteger);
      SMDBGrid1.Columns[vCont].Title.Caption := fDMCadPedido.cdsProcessoNOME.AsString;
    end;
    fDMCadPedido.cdsProcesso.Next;
  end;

  prc_Desabilita_Controles;
  Extensao := '*.PDF';
  Ret := FindFirst(Diretorio + '\' + Extensao, faAnyFile, F);
  try
    while Ret = 0 do
    begin
      vItem_Arq := vItem_Arq + 1;
      mArquivoImportado.Insert;
      mArquivoImportadoItem.AsInteger := vItem_Arq;
      mArquivoImportadoCaminhoArquivo.AsString := Diretorio + '\' + UpperCase(F.Name);
      i := Pos('.', F.Name);
      mArquivoImportadoNomeArquivo.AsString := NomeArquivoSemExtensao(F.Name);
      mArquivoImportadoExtensaoArquivo.AsString := ExtractFileExt(F.Name);

      vControlePedidoProjeto.PesquisaPedidoProjeto(mArquivoImportadoNomeArquivo.AsString, fDMCadPedido.cdsPedidoID_CLIENTE.AsString);
      if vControlePedidoProjeto.ESPESSURA > 0 then
      begin
        mArquivoImportadoComprimento.AsFloat := vControlePedidoProjeto.COMPRIMENTO;
        mArquivoImportadoLargura.AsFloat     := vControlePedidoProjeto.LARGURA;
        mArquivoImportadoEspessura.AsFloat   := vControlePedidoProjeto.ESPESSURA;
        mArquivoImportadoCodigo_Produto.AsInteger := vControlePedidoProjeto.ID_PRODUTO;
        mArquivoImportadoPeso.AsFloat := vControlePedidoProjeto.PESO;
        mArquivoImportadoVlr_Unitario.AsFloat := vControlePedidoProjeto.VLR_UNITARIO;
        mArquivoImportadoVlr_Dobra.AsFloat := vControlePedidoProjeto.VLR_DOBRA;
        mArquivoImportadoPrecoKG.AsFloat   := vControlePedidoProjeto.PRECO_KG;

        mArquivoImportadoProcesso_01.AsInteger := vControlePedidoProjeto.PROCESSO_01;
        mArquivoImportadoProcesso_02.AsInteger := vControlePedidoProjeto.PROCESSO_02;
        mArquivoImportadoProcesso_03.AsInteger := vControlePedidoProjeto.PROCESSO_03;
        mArquivoImportadoProcesso_04.AsInteger := vControlePedidoProjeto.PROCESSO_04;
        mArquivoImportadoProcesso_05.AsInteger := vControlePedidoProjeto.PROCESSO_05;
        mArquivoImportadoProcesso_06.AsInteger := vControlePedidoProjeto.PROCESSO_06;
        mArquivoImportadoProcesso_07.AsInteger := vControlePedidoProjeto.PROCESSO_07;
        mArquivoImportadoProcesso_08.AsInteger := vControlePedidoProjeto.PROCESSO_08;
        mArquivoImportadoProcesso_09.AsInteger := vControlePedidoProjeto.PROCESSO_09;
        mArquivoImportadoProcesso_10.AsInteger := vControlePedidoProjeto.PROCESSO_10;

        if (vCont_Processo > 0) and (mArquivoImportado.FieldByName('Processo_'+FormatFloat('00',vCont_Processo)).AsInteger <= 0) then
          mArquivoImportado.FieldByName('Processo_'+FormatFloat('00',vCont_Processo)).AsInteger := 1;

        vCalcularPeso.Comprimento := vControlePedidoProjeto.COMPRIMENTO;
        vCalcularPeso.Largura := vControlePedidoProjeto.LARGURA;
        vCalcularPeso.Espessura := vControlePedidoProjeto.ESPESSURA;

        mArquivoImportadoPeso.AsFloat := vCalcularPeso.CalcularPeso;
      end
      else
      begin
        if vCont_Processo > 0 then
          mArquivoImportado.FieldByName('Processo_'+FormatFloat('00',vCont_Processo)).AsInteger := 1;
      end;
      mArquivoImportado.Post;
      Ret := FindNext(F);
    end;
  finally
    begin
      mArquivoImportado.First;
      FindClose(F);
      vControlePedidoProjeto.Free;
      vControle.Free;
      vCalcularPeso.Free;
      prc_habilita_Controles;
    end;
  end;
end;

function TfrmMontaPed_TipoItem.NomeArquivoSemExtensao(Texto: string): string;
var
  Ext: string;
  I: Integer;
begin
  Ext := ExtractFileExt(Texto);
  I := pos(Ext, Texto);
  if I > 0 then
    Delete(Texto, I, Length(Ext));
  Result := Texto;
end;

procedure TfrmMontaPed_TipoItem.prc_OpenPDF(aFile: TFileName; TypeForm: Integer);
var
  Pdir: PChar;
begin
  GetMem(Pdir, 256);
  StrPCopy(Pdir, aFile);
  ShellExecute(0, nil, PChar(aFile), nil, Pdir, TypeForm);
  FreeMem(Pdir, 256);
end;

procedure TfrmMontaPed_TipoItem.SpeedButton2Click(Sender: TObject);
var
  vCaminhoPDF: string;
begin
//  vCaminhoPDF := StringReplace(mArquivoImportadoCaminhoArquivo.AsString, 'DWG', 'PDF', [rfReplaceAll]);
  vCaminhoPDF := mArquivoImportadoCaminhoArquivo.AsString;
  if FileExists(vCaminhoPDF) then
    prc_OpenPDF(vCaminhoPDF);
end;

function TfrmMontaPed_TipoItem.fnc_Buscar_Produto(MM: Real;
  Tipo: String) : Integer;
var
  vComando : String;  
begin
  Result := 0;
  ffrmConsultaProduto := TfrmConsultaProduto.Create(nil);

  ffrmConsultaProduto.cdsProduto.Close;
  vComando := 'select P.ID, P.NOME, P.ESPESSURA from PRODUTO P where P.NOME like :TIPO and P.ESPESSURA = :ESPESSURA and '
            + ' COALESCE(P.INATIVO,' + QuotedStr('N') +') = ' + QuotedStr('N');
  if fDMCadPedido.qParametros_ProdUSA_PRODUTO_FILIAL.AsString = 'S' then
    vComando := vComando + ' and P.FILIAL = ' + IntToStr(fDMCadPedido.cdsPedidoFILIAL.AsInteger)
  else
  if fDMCadPedido.qParametros_ProdUSA_PRODUTO_FILIAL.AsString = 'P' then
    vComando := vComando + ' and (P.FILIAL = ' + IntToStr(fDMCadPedido.cdsPedidoFILIAL.AsInteger) + ' or P.FILIAL IS NULL ) ';
  vComando := vComando + ' ORDER BY P.NOME ';
  ffrmConsultaProduto.sdsProduto.CommandText := vComando;
  ffrmConsultaProduto.sdsProduto.ParamByName('TIPO').AsString := trim(Tipo)+'%';
  ffrmConsultaProduto.sdsProduto.ParamByName('ESPESSURA').AsFloat := MM;
  ffrmConsultaProduto.cdsProduto.Open;
  if ffrmConsultaProduto.cdsProduto.RecordCount > 1  then
  begin
    ffrmConsultaProduto.ShowModal;
    if (ffrmConsultaProduto.ModalResult = mrOk) and (ffrmConsultaProduto.cdsProdutoID.AsInteger > 0) then
      Result := ffrmConsultaProduto.cdsProdutoID.AsInteger;
  end
  else
  if ffrmConsultaProduto.cdsProduto.RecordCount = 1  then
    Result := ffrmConsultaProduto.cdsProdutoID.AsInteger
  else
  begin
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    if fDMCadPedido.cdsParametrosMOSTRAR_MATERIAL_PED.AsString = 'S' then
      frmSel_Produto.vTipo_Prod := ''
    else
      frmSel_Produto.vTipo_Prod := 'P';

    if not(vProcurar_Prod) and (mArquivoImportadoCodigo_Produto.AsInteger > 0) then
    begin
      if Result <= 0 then
        Result := mArquivoImportadoCodigo_Produto.AsInteger;
      exit;
    end;

    frmSel_Produto.Edit1.Text := TIPO;
    frmSel_Produto.BitBtn1Click(frmSel_Produto);
    frmSel_Produto.ShowModal;
    Result := vCodProduto_Pos;
    if vCodProduto_Pos <= 0 then
    begin
      ShowMessage('Nenhum produto localizado!');
      Result := 0;
    end;
  end;
  FreeAndNil(frmConsultaProduto);
end;

procedure TfrmMontaPed_TipoItem.mArquivoImportadoEspessuraChange(
  Sender: TField);
var
  Tipo : String;
  vCodigoProduto : Integer;
begin
  case EnumTipo(RadioGroup1.ItemIndex)  of
    tpChapa    : Tipo := 'CHAPA';
    tpInox     : Tipo := 'INOX';
    tpAluminio : Tipo := 'ALUMINIO';
  end;
  mArquivoImportado.DisableControls;
  try
    vCodigoProduto := fnc_Buscar_Produto(mArquivoImportadoEspessura.AsFloat,Tipo);
    mArquivoImportado.Edit;
    mArquivoImportadoCodigo_Produto.AsInteger := vCodigoProduto;
    mArquivoImportado.Post;
  finally
    mArquivoImportado.EnableControls;
  end;
  prc_Calcular_Peso_PC_Chapa;
end;

procedure TfrmMontaPed_TipoItem.mArquivoImportadoNewRecord(
  DataSet: TDataSet);
begin
  mArquivoImportadoCodigo_Produto.AsInteger := 0;
  mArquivoImportadoProcesso.AsString        := '';
end;

procedure TfrmMontaPed_TipoItem.prc_Calcular_Peso_PC_Chapa;
var
  vCalcular : TCalcluar_Peso;
begin
  mArquivoImportado.DisableControls;
  vCalcular := TCalcluar_Peso.Create;
  try
    vCalcular.Espessura    := mArquivoImportadoEspessura.AsFloat;
    vCalcular.Largura      := mArquivoImportadoLargura.AsFloat;
    vCalcular.Comprimento  := mArquivoImportadoComprimento.AsFloat;
    vCalcular.FatorCalculo := mArquivoImportadoFator_Calculo.AsFloat;
    mArquivoImportado.Edit;
    mArquivoImportadoPeso.AsFloat := vCalcular.CalcularPeso;
    mArquivoImportadoVlr_Unitario.AsFloat := vCalcular.ValorUnitario;
    mArquivoImportado.Post;
  finally
    begin
      vCalcular.Free;
      mArquivoImportado.EnableControls;
    end;
  end;
end;

procedure TfrmMontaPed_TipoItem.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key <> #13) Then
    Exit;
  if (SMDBGrid1.SelectedIndex + 1 <> SMDBGrid1.FieldCount) Then
    SMDBGrid1.SelectedIndex := SMDBGrid1.SelectedIndex + 1
  else
  begin
    SMDBGrid1.SelectedIndex := 1;
    mArquivoImportado.Next;
  end;
end;

procedure TfrmMontaPed_TipoItem.prc_Calcular_VlrTotal;
var
  vCalcular : TCalcluar_Peso;
begin
  if not vSomar then
    exit;
  vCalcular := TCalcluar_Peso.Create;
  try
    vCalcular.ValorDobra := mArquivoImportadoVlr_Dobra.AsFloat;
    vCalcular.PrecoKG := mArquivoImportadoPrecoKG.AsFloat;
    vCalcular.Peso := mArquivoImportadoPeso.AsFloat;
    vCalcular.Quantidade := mArquivoImportadoQtde.AsFloat;
    vCalcular.CalcularVlrUnitario;
    vCalcular.CalcularVlrTotal;
    mArquivoImportado.Edit;
    mArquivoImportadoVlr_Unitario.AsFloat := vCalcular.ValorUnitario;
    mArquivoImportadoVlr_Total.AsFloat := vCalcular.ValorTotal;
    mArquivoImportado.Post;
  finally
    vCalcular.Free;
  end
end;

procedure TfrmMontaPed_TipoItem.mArquivoImportadoQtdeChange(
  Sender: TField);
begin
  prc_Calcular_Peso_PC_Chapa;
  prc_Calcular_VlrTotal;
end;

procedure TfrmMontaPed_TipoItem.mArquivoImportadoVlr_DobraChange(
  Sender: TField);
begin
  prc_Calcular_VlrTotal;
end;

procedure TfrmMontaPed_TipoItem.FormShow(Sender: TObject);
begin
  fDMCadPedido.qParametros_Ped.Close;
  fDMCadPedido.qParametros_Ped.Open;
  vFilial := fDMCadPedido.cdsPedidoFILIAL.AsInteger;
end;

procedure TfrmMontaPed_TipoItem.btnAbrirPDFClick(Sender: TObject);
var
  vCaminhoPDF : String;
begin
  //Para abrir esse form tem que ter os diret�rios fonts e lib no diret�rio da aplica��o
  ffrmMostraPDF := TfrmMostraPDF.Create(Self);
  try
//    vCaminhoPDF := StringReplace(mArquivoImportadoCaminhoArquivo.AsString, 'DWG', 'PDF', [rfReplaceAll]);
    vCaminhoPDF := mArquivoImportadoCaminhoArquivo.AsString;
    ffrmMostraPDF.vCaminhoPDF := vCaminhoPDF;
    ffrmMostraPDF.edtCaminhoPDF.Text := vCaminhoPDF;
    ffrmMostraPDF.Show;
  finally
//    FreeAndNil(ffrmMostraPDF);
  end;
end;


procedure TfrmMontaPed_TipoItem.mArquivoImportadoVlr_UnitarioChange(
  Sender: TField);
begin
  mArquivoImportadoVlr_Total.AsFloat := StrToFloat(FormatFloat('0.00',(mArquivoImportadoVlr_Unitario.AsFloat * mArquivoImportadoQtde.AsFloat)));
end;

procedure TfrmMontaPed_TipoItem.prc_Desabilita_Controles;
begin
  mArquivoImportadoEspessura.OnChange := nil;
  mArquivoImportadoVlr_Unitario.OnChange := nil;
  mArquivoImportadoVlr_Dobra.OnChange := nil;

end;

procedure TfrmMontaPed_TipoItem.prc_Habilita_Controles;
begin
  mArquivoImportadoEspessura.OnChange := mArquivoImportadoEspessuraChange;
  mArquivoImportadoVlr_Unitario.OnChange := mArquivoImportadoVlr_UnitarioChange;
  mArquivoImportadoVlr_Dobra.OnChange := mArquivoImportadoVlr_DobraChange;
end;

procedure TfrmMontaPed_TipoItem.FormDestroy(Sender: TObject);
begin
  if Assigned(ffrmMostraPDF) then
    FreeAndNil(ffrmMostraPDF);
end;

procedure TfrmMontaPed_TipoItem.SpeedButton3Click(Sender: TObject);
begin
  btnCarrega.Enabled := True;
end;

procedure TfrmMontaPed_TipoItem.SMDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (mArquivoImportado.State in [dsEdit]) and ((Key = 38) or (Key = 40)) then
    key := Vk_Return;
  if Key = Vk_Return then
    vSomar := True
  else
    vSomar := False;
  if Key = vk_F2 then
  begin
    prc_Carrega_mProcesso_Sel;
    frmCadPedido_Proc := TfrmCadPedido_Proc.Create(self);
    frmCadPedido_Proc.Tag := 1;
    frmCadPedido_Proc.fDMCadPedido := fDMCadPedido;
    frmCadPedido_Proc.ShowModal;
    if frmCadPedido_Proc.btnConfirmar.ModalResult = 1 then
      prc_Gravar_mArquivo_Proc;
    FreeAndNil(frmCadPedido_Proc);
  end;

end;

procedure TfrmMontaPed_TipoItem.prc_Carrega_Excel;
var
  vEnd_Arquivo: String;
begin
  vEnd_Arquivo := FilenameEdit1.Text;
  if copy(vEnd_Arquivo,1,1) = '"' then
    Delete(vEnd_Arquivo,1,1);
  if copy(vEnd_Arquivo,Length(vEnd_Arquivo),1) = '"' then
    Delete(vEnd_Arquivo,Length(vEnd_Arquivo),1);
  FilenameEdit1.Text := vEnd_Arquivo;
  if (trim(FilenameEdit1.Text) <> '') and  not(FileExists(FilenameEdit1.Text)) then
  begin
    MessageDlg('Arquivo em excel n�o encontrado!',mtError,mbOKCancel,0);
    exit;
  end;

  StringGrid1 := TStringGrid.Create(StringGrid1);
  XlsToStringGrid2(StringGrid1,FilenameEdit1.Text,1);
  prc_Le_StringGrid;
  FreeAndNil(StringGrid1);
end;

function TfrmMontaPed_TipoItem.XlsToStringGrid2(AGrid: TStringGrid;
  AXLSFile: string; WorkSheet: Integer): Boolean;
const
	xlCellTypeLastCell = $0000000B;
var
	XLApp, Sheet: OLEVariant;
	RangeMatrix: Variant;
	x, y, k, r: Integer;
begin
	Result := False;
	//Cria Excel- OLE Object
	XLApp  := CreateOleObject('Excel.Application');
	try
		//Esconde Excel
		XLApp.Visible:=False;

		//Abre o Workbook
		XLApp.Workbooks.Open(AXLSFile);

		//Setar na planilha desejada
		XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[WorkSheet].Activate;

		// Para saber a dimens�o do WorkSheet (o n�mero de linhas e de colunas),
		//selecionamos a �ltima c�lula n�o vazia do worksheet
		Sheet :=  XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[WorkSheet];
		Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Select;

    //Pegar o n�mero da �ltima linha
                x:=XLApp.ActiveCell.Row;
    //x:=fDMExcel.cdsProduto.RecordCount;
    //Pegar o n�mero da �ltima coluna
		y:=XLApp.ActiveCell.Column;

		//Seta Stringgrid linha e coluna
		AGrid.RowCount:=x;
		AGrid.ColCount:=y;

		//Associa a variant WorkSheet com a variant do Delphi
		RangeMatrix:=XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

		//Cria o loop para listar os registros no TStringGrid
		k:=1;
		repeat
		  for r:=1 to y do
		  begin
			 AGrid.Cells[(r - 1),(k - 1)] := RangeMatrix[K, R];

			 //Redimensionar tamanho das colunas do grid dinamicamente
			 If (AGrid.ColWidths[r-1] < (Length(AGrid.Cells[(r - 1),(k - 1)]) * 8)) then
				AGrid.ColWidths[r-1] := Length(AGrid.Cells[(r - 1),(k - 1)]) * 8;

		  end;
		  Inc(k,1);
		until k > x;
		RangeMatrix := Unassigned;
	finally
		//Fecha o Excel
		if not VarIsEmpty(XLApp) then
		   begin
			  XLApp.Quit;
			  XLAPP:=Unassigned;
			  Sheet:=Unassigned;
			  Result:=True;
		   end;
	end;
end;

procedure TfrmMontaPed_TipoItem.prc_Le_StringGrid;
var
  Linha, Coluna: Integer;
  i: Integer;
  vTexto: String;
  vGravar: Boolean;
  vContador: Integer;
  vFinalidadeAux : String;
begin
  vTexto  := '';
  Linha     := 0;
  vContador := 0;
  while Linha < StringGrid1.RowCount -1 do
  begin
    Linha := Linha + 1;
    //if Linha <= 1 then
    //  continue;

    vTexto:=StringGrid1.Cells[0,Linha];
    //i := Pos(' ',vTexto);
    //vTexto := copy(vTexto,1,i-1);
    if mArquivoImportado.Locate('NomeArquivo',vTexto,([Locaseinsensitive])) then
    begin
      mArquivoImportado.Edit;
      vTexto := trim(StringGrid1.Cells[3,Linha]);
      mArquivoImportadoEspessura.AsFloat := StrToFloat(vTexto);

      mArquivoImportado.Edit;

      vTexto := trim(StringGrid1.Cells[1,Linha]);
      mArquivoImportadoComprimento.AsFloat := StrToFloat(vTexto);

      if not (mArquivoImportado.State in [dsEdit]) then
        mArquivoImportado.Edit;

      vTexto := trim(StringGrid1.Cells[2,Linha]);
      mArquivoImportadoLargura.AsFloat := StrToFloat(vTexto);

      vTexto := trim(StringGrid1.Cells[4,Linha]);
      if trim(vTexto) <> '' then
      begin
        vSomar := True;
        mArquivoImportadoQtde.AsFloat := StrToFloat(vTexto);
        mArquivoImportadoQtdeChange(nil);
        vSomar := False;
      end;

      if (mArquivoImportado.State in [dsEdit]) then
        mArquivoImportado.Post;

    end;
  end;
end;

procedure TfrmMontaPed_TipoItem.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  i : Integer;
  vCont: Integer;  
begin
  if (StrToFloat(FormatFloat('0.000',mArquivoImportadoQtde.AsFloat)) > 0) and (mArquivoImportadoCodigo_Produto.AsInteger <= 0) and
    not(mArquivoImportado.State in [dsEdit, dsInsert]) then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end
  else
  if (StrToFloat(FormatFloat('0.000',mArquivoImportadoQtde.AsFloat)) > 0) and not(mArquivoImportado.State in [dsEdit, dsInsert]) then
  begin
    vCont := 0;
    for i := 1 to 10 do
    begin
      if mArquivoImportado.FieldByName('PROCESSO_'+FormatFloat('00',i)).AsInteger > 0 then
        vCont := vCont + 1;
    end;
    if vCont <= 1 then
    begin
      Background  := clYellow;
      AFont.Color := clBlack;
    end;
  end
end;

procedure TfrmMontaPed_TipoItem.prc_Carrega_CSV;
var
  Linha : Integer;
  vTexto: String;
  vEspessura, vComprimento, vLargura, vQtdCSV : String;
  Arquivo : TStringList;
begin
  vTexto := '';
  Linha  := 0;
  Arquivo := TStringList.Create();
  try
    Arquivo.LoadFromFile(FilenameEdit1.Text);
    while Linha < Arquivo.Count - 1 do
    begin
      Linha  := Linha + 1;
      vRegistro_CSV := Arquivo.Strings[Linha];
      vTexto := fnc_Montar_Campo(';','');
      if mArquivoImportado.Locate('NomeArquivo',vTexto,([Locaseinsensitive])) then
      begin
        mArquivoImportado.Edit;
        vComprimento := fnc_Montar_Campo(';','');
        vLargura     := fnc_Montar_Campo(';','');
        vEspessura   := fnc_Montar_Campo(';','');
        vQtdCSV      := fnc_Montar_Campo(';','');

        mArquivoImportadoEspessura.AsFloat := StrToFloat(vEspessura);

        mArquivoImportado.Edit;

        mArquivoImportadoComprimento.AsFloat := StrToFloat(vComprimento);

        if not (mArquivoImportado.State in [dsEdit]) then
          mArquivoImportado.Edit;

        mArquivoImportadoLargura.AsFloat := StrToFloat(vLargura);

        if trim(vQtdCSV) <> '' then
        begin
          vSomar := True;
          mArquivoImportadoQtde.AsFloat := StrToFloat(vQtdCSV);
          mArquivoImportadoQtdeChange(nil);
          vSomar := False;
        end;
        if (mArquivoImportado.State in [dsEdit]) then
          mArquivoImportado.Post;
      end;
    end;
  finally
    FreeAndNil(Arquivo);
  end;
end;

procedure TfrmMontaPed_TipoItem.prc_Carrega_mProcesso_Sel;
begin
end;

procedure TfrmMontaPed_TipoItem.prc_Gravar_mArquivo_Proc;
begin

end;

end.

