unit UCadNotaFiscal_Itens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, UDMCadNotaFiscal, StdCtrls,
  Buttons, RxLookup, DBCtrls, DB, Mask, RxDBComb, UCadProduto, UCadUnidade, UCadCFOP, RzTabs, Grids, DBGrids, uCadNCM,
  SMDBGrid, UCadNotaFiscal_Itens_Imp, UDMInformar_Tam, NxCollection, UInformar_Tam, strUtils, RzPanel, USenha, SqlExpr,
  UCadNotaFiscal_Itens_Drawback, Menus, RzButton;

type
  TfrmCadNotaFiscal_Itens = class(TForm)
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    pnlCFOP: TPanel;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label10: TLabel;
    lblOperacao: TLabel;
    Label12: TLabel;
    lblFinalidade: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    rxdbOperacao: TRxDBLookupCombo;
    rxcbFinalidade: TRxDBComboBox;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Label15: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    RxDBLookupCombo8: TRxDBLookupCombo;
    RxDBLookupCombo9: TRxDBLookupCombo;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    RxDBComboBox3: TRxDBComboBox;
    RxDBLookupCombo11: TRxDBLookupCombo;
    RxDBLookupCombo12: TRxDBLookupCombo;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label30: TLabel;
    Shape1: TShape;
    lblEstoque: TLabel;
    TabSheet3: TRzTabSheet;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    SMDBGrid2: TSMDBGrid;
    GroupBox1: TGroupBox;
    SMDBGrid1: TSMDBGrid;
    Label31: TLabel;
    DBEdit1: TDBEdit;
    DBEdit13: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit14: TDBEdit;
    pnlCod_Barras: TPanel;
    Label11: TLabel;
    Edit1: TEdit;
    Label13: TLabel;
    DBEdit15: TDBEdit;
    Label35: TLabel;
    DBEdit16: TDBEdit;
    Label36: TLabel;
    DBEdit17: TDBEdit;
    Label38: TLabel;
    RxDBLookupCombo13: TRxDBLookupCombo;
    BitBtn6: TBitBtn;
    TS_DrawBack: TRzTabSheet;
    Panel4: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    SMDBGrid3: TSMDBGrid;
    Label50: TLabel;
    Label51: TLabel;
    DBEdit27: TDBEdit;
    Label52: TLabel;
    DBEdit28: TDBEdit;
    Label55: TLabel;
    DBEdit30: TDBEdit;
    Label59: TLabel;
    RxDBLookupCombo15: TRxDBLookupCombo;
    RzGroupBox1: TRzGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    Panel6: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    lblTamanho: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label57: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    gbxVendedor: TRzGroupBox;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label14: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label34: TLabel;
    lblPerc_Importacao: TLabel;
    lblVlr_Aduaneira: TLabel;
    Label37: TLabel;
    Label41: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label58: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBComboBox4: TRxDBComboBox;
    DBCheckBox1: TDBCheckBox;
    dbedtPerc_Importacao: TDBEdit;
    dbedtVlr_Aduaneira: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    RxDBLookupCombo10: TRxDBLookupCombo;
    DBEdit20: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit29: TDBEdit;
    dbckDiferenca_ICMS: TDBCheckBox;
    DBEdit31: TDBEdit;
    DBEdit33: TDBEdit;
    btnGrade: TNxButton;
    dblcTamanho: TRxDBLookupCombo;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit32: TDBEdit;
    pnlNomeProduto: TPanel;
    Label63: TLabel;
    DBEdit34: TDBEdit;
    pnlCor: TPanel;
    Label53: TLabel;
    RxDBLookupCombo14: TRxDBLookupCombo;
    Label64: TLabel;
    DBEdit35: TDBEdit;
    RzGroupBox2: TRzGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RzGroupBox3: TRzGroupBox;
    Label60: TLabel;
    DBEdit40: TDBEdit;
    Label65: TLabel;
    DBEdit36: TDBEdit;
    lblContaOrc: TLabel;
    RxDBlkContaOrc: TRxDBLookupCombo;
    RxDBlkCCusto: TRxDBLookupCombo;
    lblCCusto: TLabel;
    gbxDimensoes: TGroupBox;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    dbckDraw: TDBCheckBox;
    Label69: TLabel;
    DBEdit43: TDBEdit;
    btnANP: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel5Exit(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo4Change(Sender: TObject);
    procedure RxDBLookupCombo11Exit(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure pnlCFOPExit(Sender: TObject);
    procedure rxdbOperacaoChange(Sender: TObject);
    procedure RxDBLookupCombo11Enter(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure btnGradeClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure gbxVendedorExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure RxDBLookupCombo7Exit(Sender: TObject);
    procedure DBEdit23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo6Exit(Sender: TObject);
    procedure pnlCFOPEnter(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit31Enter(Sender: TObject);
    procedure DBEdit31Exit(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure Panel5Enter(Sender: TObject);
    procedure RxDBLookupCombo15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBCheckBox1Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit34Enter(Sender: TObject);
    procedure RxDBLookupCombo14Enter(Sender: TObject);
    procedure RxDBLookupCombo14Exit(Sender: TObject);
    procedure RxDBlkCCustoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBlkContaOrcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure DBEdit43Exit(Sender: TObject);
    procedure DBEdit43KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnANPClick(Sender: TObject);
  private
    { Private declarations }
    ffrmCadProduto: TfrmCadProduto;
    ffrmCadUnidade: TfrmCadUnidade;
    ffrmCadCFOP: TfrmCadCFOP;
    ffrmCadNCM: TfrmCadNCM;
    ffrmCadNotaFiscal_Itens_Imp: TfrmCadNotaFiscal_Itens_Imp;
    ffrmInformar_Tam: TfrmInformar_Tam;
    ffrmCadNotaFiscal_Itens_Drawback: TfrmCadNotaFiscal_Itens_Drawback;
    ffrmSenha: TfrmSenha;

    vCodProdutoAnt: Integer;
    vID_CFOPAnt: Integer;
    vID_VariacaoAnt: Integer;
    vID_OperacaoAnt: Integer;
    vFinalidadeAnt: String;
    vID_CSTICMAnt: Integer;
    vIPI_Suspenso: Boolean;
    vPIS_Suspenso: Boolean;
    vID_NCM_Ant: Integer;
    vID_ICMS_Original: Integer;
    vQtd_Prod_Ant: Real;
    vQtd_KG_Ant: Real;
    vID_Produto_Ant: Integer;
    vID_ICMS, vID_IPI: Integer;
    vID_EnqIPI: Integer;
    vPreco_Ori: Real;
    vIDCombAnt: Integer;
    vPerc_BRedICMS_NCM: Real;

    vVlrTotal_Ant : Real;
    vPerc_IPI_Ant : Real;

    procedure prc_Buscar_Imposto(Auxiliar, Nome: String);
    procedure prc_Calcular_VlrItens;

    function  fnc_Erro: Boolean;

    function fnc_Gerar_Cofins: Boolean;
    function fnc_Gerar_PIS: Boolean;
    function fnc_Verificar_Cod_Barras: Boolean;
    function fnc_Verificar_Produto: Boolean;

    procedure prc_Gravar_mItens;
    procedure prc_Gravar_Tam;
    procedure prc_Busca_IBPT;
    procedure prc_NFCI;
    procedure prc_Mover_Lei_Transparencia;

    procedure prc_Le_Imp_Aux(Item: Integer);
    procedure prc_Chama_Form_Produto;
    procedure prc_Chama_Form_TabPreco;

    //Verificar 05/08/2019
    //procedure prc_Buscar_CST_ICMS;

    function fnc_Busca_NCM_CST: Integer;

    procedure prc_Habilitar_Desoneracao(CodCST_ICMS: String);
    procedure prc_Abrir_Combinacao;

    procedure prc_Montar_Codigos_CST(Variacao: Boolean);

    procedure prc_Estoque(ID_Produto: Integer);
    procedure prc_Le_NCM_Geral;
    procedure prc_Calcula_IPI_Pago_Empresa;
    procedure prc_Unidade_Trib;

    function fnc_Verifica_Simples: Boolean;
    function fnc_Verifica_SubstTributaria: Boolean;
    function fnc_EstoqueItenxAux: Real;

    function fnc_Busca_Preco_Orig: Real;
    function fnc_Verifica_ST_Ant: Boolean;

    function fnc_Gerar_IPI(ID : Integer) : Boolean;

    function fnc_Possui_Calc_ST : Boolean;

  public
    { Public declarations }
    vNotaSelecionada: Boolean;
    vValeSelecionado: Boolean;
    vRecNFSelecionado: Boolean;
    vOSSelecionada: Boolean;
    vGravacao_Ok: Boolean;
    vPedidoSelecionado: Boolean;
    vSacolaSelecionada: Boolean;
    vPedAmbiente: Boolean;
    vBaseIcms_Cre, vVlrIcms_Cre: Real;
    vBaseIPI_Cre, vVlrIPI_Cre : Real;
    vItem_Original: Integer;

    fDMCadNotaFiscal: TDMCadNotaFiscal;
    fDMInformar_Tam: TDMInformar_Tam;

    procedure prc_Move_Dados_Itens;
    procedure prc_Mover_Finalidade;

    function fnc_Estoque_OK(ID_Produto, ID_Cor: Integer; Tamanho: String; Qtd: Real): Boolean;
  end;

var
  frmCadNotaFiscal_Itens: TfrmCadNotaFiscal_Itens;

implementation

uses rsDBUtils, USel_Produto, uUtilPadrao, UMenu, uCalculo_NotaFiscal, USel_TabPreco, USel_Unidade, UDMUtil, DmdDatabase,
  USel_EnqIPI, USel_CentroCusto, USel_ContaOrc, USel_CBenef, Math,
  UCadNotaFiscal_Itens_ANP;

{$R *.dfm}

procedure TfrmCadNotaFiscal_Itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMCadNotaFiscal.cdsNotaFiscal_Itens.State in [dsEdit,dsInsert] then
    fDMCadNotaFiscal.cdsNotaFiscal_Itens.Cancel;
  if fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S' then
    FreeAndNil(fDMInformar_Tam);
  Action := Cafree;
end;

procedure TfrmCadNotaFiscal_Itens.FormShow(Sender: TObject);
var
  vID_CFOP : Integer;
  vAux : String;
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadNotaFiscal);
  fDMCadNotaFiscal.cdsParametros.Close;
  fDMCadNotaFiscal.cdsParametros.Open;
  if fDMCadNotaFiscal.vState_Item = 'I' then
  begin
    vID_Produto_Ant := 0;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString := 'S';
    TabSheet3.TabVisible := False;
    vID_CFOP := fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger;
  end
  else
  begin
    vID_Produto_Ant := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
    if copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) <> '3' then
      TabSheet3.TabVisible := False;
    Label42.Visible  := (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString <> '0');
    DBEdit21.Visible := (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString <> '0');
    Label43.Visible  := (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString <> '0');
    DBEdit22.Visible := (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString <> '0');
    vID_CFOP := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger;
  end;

  //if fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger > 0 then
  if vID_CFOP > 0 then
  begin
    //if fDMCadNotaFiscal.cdsCFOPID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger then
    //  fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger,[loCaseInsensitive]);
    if fDMCadNotaFiscal.cdsCFOPID.AsInteger <> vID_CFOP then
      fDMCadNotaFiscal.cdsCFOP.Locate('ID',vID_CFOP,[loCaseInsensitive]);
    TS_DrawBack.TabVisible := (((copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3') or  (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '7')));

    btnANP.Visible := (fDMCadNotaFiscal.cdsCFOPCOMBUSTIVEL.AsString = 'S');
  end
  else
    TS_DrawBack.TabVisible := False;
  //Tamanhos
  if fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S' then
  begin
    if not Assigned(fDMInformar_Tam) then
      fDMInformar_Tam := TDMInformar_Tam.Create(Self);
    if (fDMCadNotaFiscal.vState_Item = 'E') and (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString) <> '') then
    begin
      fDMInformar_Tam.prc_Abrir_Produto_Tam(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger);
      lblTamanho.Visible  := True;
      oDBUtils.SetDataSourceProperties(dblcTamanho, fDMInformar_Tam);
      dblcTamanho.Visible := True;
    end;
  end;

  lblPerc_Importacao.Visible   := (copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '3');
  dbedtPerc_Importacao.Visible := (copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '3');
  lblVlr_Aduaneira.Visible     := (copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '3');
  dbedtVlr_Aduaneira.Visible   := (copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '3');

  vCodProdutoAnt  := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
  vID_CFOPAnt     := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger;
  vID_VariacaoAnt := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger;
  vID_OperacaoAnt := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_OPERACAO_NOTA.AsInteger;
  vFinalidadeAnt  := fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString;
  vIDCombAnt      := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger;

  vVlrTotal_Ant   := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat));
  vPerc_IPI_Ant   := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat));

//  pnlCFOP.Visible := (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger <= 0) or
//                     (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_OPERACAO_NOTA.AsInteger <= 0) or (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString) = '');
  Label2.Visible  := (DBEdit2.ReadOnly);

  if rxdbOperacao.Text <> '' then
    rxdbOperacaoChange(Sender);

  //DBEdit14.ReadOnly     := (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S');
  pnlCod_Barras.Visible := (fDMCadNotaFiscal.cdsParametrosUSA_COD_BARRAS.AsString = 'S');
  Label13.Visible       := (fDMCadNotaFiscal.cdsParametrosUSA_ID_PRODUTO.AsString = 'S');
  DBEdit15.Visible      := (fDMCadNotaFiscal.cdsParametrosUSA_ID_PRODUTO.AsString = 'S');

  if (RxDBLookupCombo1.Text = '') and (fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger > 0) then
    RxDBLookupCombo1.KeyValue := fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger;

  if fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S' then
  begin
    if not Assigned(fDMInformar_Tam) then
      fDMInformar_Tam := TDMInformar_Tam.Create(Self);
  end;

  if (fDMCadNotaFiscal.vState_Item = 'E') then
  begin
    fDMCadNotaFiscal.cdsProduto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);
    if (fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S') then
    begin
      btnGrade.Visible := ((fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') and not(lblTamanho.Visible));
      DBEdit2.ReadOnly := ((fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') and not(lblTamanho.Visible));
      if (fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') and not(lblTamanho.Visible) then
        DBEdit2.Color := clSilver
      else
        DBEdit2.Color := clWindow;
    end;
    DBEdit24.Visible := ((fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_PACOTE.AsInteger > 1) or (fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString <> fDMCadNotaFiscal.cdsProdutoUNIDADE.AsString));
  end
  else
    DBEdit24.Visible := False;
  Label45.Visible  := DBEdit24.Visible;
  //***************
  DBCheckBox2.Visible := (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat)) > 0);
  Label39.Visible     := ((fDMCadNotaFiscal.cdsParametrosEMPRESA_INJETADO.AsString = 'S') or (fDMCadNotaFiscal.qParametros_NFeMOSTRAR_OC_NO_ITEM.AsString = 'S'));
  DBEdit18.Visible    := ((fDMCadNotaFiscal.cdsParametrosEMPRESA_INJETADO.AsString = 'S') or (fDMCadNotaFiscal.qParametros_NFeMOSTRAR_OC_NO_ITEM.AsString = 'S'));
  Label40.Visible     := ((fDMCadNotaFiscal.cdsParametrosEMPRESA_INJETADO.AsString = 'S') or (fDMCadNotaFiscal.qParametros_NFeMOSTRAR_OS_NO_ITEM.AsString = 'S'));
  DBEdit19.Visible    := ((fDMCadNotaFiscal.cdsParametrosEMPRESA_INJETADO.AsString = 'S') or (fDMCadNotaFiscal.qParametros_NFeMOSTRAR_OS_NO_ITEM.AsString = 'S'));
  Label64.Visible     := ((fDMCadNotaFiscal.qParametros_PedUSA_NUM_TALAO.AsString = 'I') or (fDMCadNotaFiscal.qParametros_PedUSA_NUM_TALAO.AsString = 'P'));
  DBEdit35.Visible    := ((fDMCadNotaFiscal.qParametros_PedUSA_NUM_TALAO.AsString = 'I') or (fDMCadNotaFiscal.qParametros_PedUSA_NUM_TALAO.AsString = 'P'));

  if (fDMCadNotaFiscal.cdsParametrosUSA_DESONERACAO.AsString = 'S') and (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString) <> '') then
    fDMCadNotaFiscal.prc_Abrir_Desoneracao(fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString);
  prc_Habilitar_Desoneracao(fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString);
  Label48.Visible  := ((fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString = '51') and (fDMCadNotaFiscal.cdsParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S'));
  DBEdit26.Visible := ((fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString = '51') and (fDMCadNotaFiscal.cdsParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S'));
  Label49.Visible  := ((fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString = '51') and (fDMCadNotaFiscal.cdsParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S'));
  //********************
  pnlCor.Visible := ((fDMCadNotaFiscal.cdsParametrosINFORMAR_COR_MATERIAL.AsString = 'S') or
                    (fDMCadNotaFiscal.cdsParametrosINFORMAR_COR_PROD.AsString = 'C') or
                    (fDMCadNotaFiscal.cdsParametrosINFORMAR_COR_PROD.AsString = 'B'));
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger > 0 then
    prc_Abrir_Combinacao;
  Label54.Visible  := (fDMCadNotaFiscal.cdsParametrosUSA_PEDIDO_FUT.AsString = 'S');
  DBEdit29.Visible := (fDMCadNotaFiscal.cdsParametrosUSA_PEDIDO_FUT.AsString = 'S');
  if fDMCadNotaFiscal.cdsNotaFiscal_Itens.State in [dsEdit] then
    vQtd_Prod_Ant := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat))
  else
    vQtd_Prod_Ant := StrToFloat(FormatFloat('0.0000',0));

  dbckDiferenca_ICMS.Visible := ((copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '6') and (fDMCadNotaFiscal.cdsCFOPSUBSTITUICAO_TRIB.AsString <> 'S'));

  Label56.Visible  := (fDMCadNotaFiscal.cdsParametrosEMPRESA_SUCATA.AsString = 'S');
  DBEdit31.Visible := (fDMCadNotaFiscal.cdsParametrosEMPRESA_SUCATA.AsString = 'S');
  gbxDimensoes.Visible := (fDMCadNotaFiscal.cdsParametrosEMPRESA_SUCATA.AsString = 'S');

  Label57.Visible  := (fDMCadNotaFiscal.cdsParametrosUSA_LOTE_CONTROLE.AsString = 'S');
  DBEdit32.Visible := (fDMCadNotaFiscal.cdsParametrosUSA_LOTE_CONTROLE.AsString = 'S');
  Label58.Visible  := (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I');
  DBEdit33.Visible := (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I');

  //01/02/2017
  if fDMCadNotaFiscal.qParametros_FinCONTROLE_DIG_PRECO.AsString = 'S' then
    DBEdit5.ReadOnly := ((fDMCadNotaFiscal.qParametros_UsuarioALT_PRECO_PED.AsString <> 'S') and (fDMCadNotaFiscal.qParametros_UsuarioALT_PRECO_PED.AsString <> 'C'));
  //************
  pnlNomeProduto.Visible := (fDMCadNotaFiscal.qParametros_NFeALTERAR_NOME_PROD.AsString = 'S');

  //21/05/2019
  lblContaOrc.Visible      := ((fDMCadNotaFiscal.cdsParametrosUSA_CONTA_ORCAMENTO.AsString = 'S') and (fDMCadNotaFiscal.qParametros_NTEUSA_CONTA_ORCAMENTO_ITENS.AsString = 'S'));
  RxDBlkContaOrc.Visible   := ((fDMCadNotaFiscal.cdsParametrosUSA_CONTA_ORCAMENTO.AsString = 'S') and (fDMCadNotaFiscal.qParametros_NTEUSA_CONTA_ORCAMENTO_ITENS.AsString = 'S'));
  lblCCusto.Visible        := (fDMCadNotaFiscal.qParametros_NTEUSA_CENTRO_CUSTO.AsString = 'S');
  RxDBlkCCusto.Visible     := (fDMCadNotaFiscal.qParametros_NTEUSA_CENTRO_CUSTO.AsString = 'S');

  //29/08/2019  aqui Cleomar        26/08/2020
  dbckDraw.Visible := (fDMCadNotaFiscal.qParametros_NFeUSA_REGRA_CLI_PROD.AsString = 'S');
  if (fDMCadNotaFiscal.qParametros_NFeUSA_REGRA_CLI_PROD.AsString = 'S') then
  begin
    //dbckDraw.Visible := uUtilPadrao.fnc_existe_Drawback(fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger);
    vAux := uUtilPadrao.fnc_existe_Drawback(fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger);
    if (copy(vAux,1,1) = 'S') or (copy(vAux,2,1) = 'S') then
      dbckDraw.Visible := True
    else
      dbckDraw.Visible := False;
  end;
  //*************************

  //11/12/2019
  DBEdit43.Visible := (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S');
  Label69.Visible  := (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S');
end;

procedure TfrmCadNotaFiscal_Itens.prc_Buscar_Imposto(Auxiliar, Nome: String);
begin
  if fDMCadNotaFiscal.cdsCFOP.FieldByName('ID_'+Auxiliar+Nome).AsInteger > 0 then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_Itens.FieldByName('ID_'+Auxiliar+Nome).AsInteger := fDMCadNotaFiscal.cdsCFOP.FieldByName('ID_'+Auxiliar+Nome).AsInteger;
    if trim(Auxiliar) = '' then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_Itens.FieldByName('PERC_'+Nome).AsFloat  := fDMCadNotaFiscal.cdsCFOP.FieldByName('PERC_'+Nome).AsFloat;
      fDMCadNotaFiscal.cdsNotaFiscal_Itens.FieldByName('TIPO_'+Nome).AsString := fDMCadNotaFiscal.cdsCFOP.FieldByName('TIPO_'+Nome).AsString;
    end;
  end
  else
  if fDMCadNotaFiscal.cdsFilial.FieldByName('ID_'+Auxiliar+Nome).AsInteger > 0 then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_Itens.FieldByName('ID_'+Auxiliar+Nome).AsInteger := fDMCadNotaFiscal.cdsFilial.FieldByName('ID_'+Auxiliar+Nome).AsInteger;
    if trim(Auxiliar) = '' then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_Itens.FieldByName('PERC_'+Nome).AsFloat := fDMCadNotaFiscal.cdsFilial.FieldByName('PERC_'+Nome).AsFloat;
      fDMCadNotaFiscal.cdsNotaFiscal_Itens.FieldByName('TIPO_'+Nome).AsString := fDMCadNotaFiscal.cdsFilial.FieldByName('TIPO_'+Nome).AsString;
    end;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Move_Dados_Itens;
var
  //vID_ICMS, vID_IPI: Integer;
  vPrecoAux: Real;
  vIDAux: Integer;
  vPerc_Icms_Suf, vPerc_Cofins_Suf, vPerc_Pis_Suf, vPerc_IPI_Suf: Real;
  vAux: Real;
  vUsouICM: Boolean;
  //vID_EnqIPI: Integer;
  vCod_CBenef_Loc : String;
  vGera_FCP : String;
  vPerc_ICMS: Real;
begin
  vPerc_ICMS := 0;
  vID_ICMS   := 0;
  vID_IPI  := 0;
  vPerc_Icms_Suf     := 0;
  vPerc_Cofins_Suf   := 0;
  vPerc_Pis_Suf      := 0;
  vPerc_IPI_Suf      := 0;
  vID_EnqIPI         := 0;
  vPerc_BRedICMS_NCM := 0;
  vCod_CBenef        := '';

  if not fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,[loCaseInsensitive]) then
  begin
    //21/11/2019 a Mensagem foi colocada nesta data
    MessageDlg('*** (prc_Move_Dados_Itens) ID CFOP  ' + fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsString + ', n�o encontrado! ' + #13 + '    Favor Verificar!' , mtError, [mbOk], 0);
    exit;
  end;
  btnANP.Visible := (fDMCadNotaFiscal.cdsCFOPCOMBUSTIVEL.AsString = 'S');

  //Vai come�ar com S para n�o mexer nos que existem hoje    11/03/2020
  vGera_FCP := 'S';
  if fDMCadNotaFiscal.vID_Variacao > 0 then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger := fDMCadNotaFiscal.vID_Variacao;
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger > 0 then
  begin
    if not fDMCadNotaFiscal.cdsCFOP_Variacao.Locate('ID;ITEM',VarArrayOf([fDMCadNotaFiscal.cdsCFOPID.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger]),[locaseinsensitive]) then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger := 0
    else
    begin
      //11/12/2019
      if trim(fDMCadNotaFiscal.cdsCFOP_VariacaoCOD_BENEF.AsString) <> '' then
        vCod_CBenef_Loc := fDMCadNotaFiscal.cdsCFOP_VariacaoCOD_BENEF.AsString;
      vGera_FCP := fDMCadNotaFiscal.cdsCFOP_VariacaoCALCULAR_FCP.AsString;
    end
  end;

  fDMCadNotaFiscal.vID_Variacao := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger;
  if not fDMCadNotaFiscal.cdsProduto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]) then
  begin
    //21/11/2019 a Mensagem foi colocada nesta data
    MessageDlg('*** (prc_Move_Dados_Itens) ID Produto  ' + fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsString + ', n�o encontrado! ' + #13 + '    Favor Verificar!' , mtError, [mbOk], 0);
    exit;
  end;
  DBEdit24.Visible := False;
  Label45.Visible  := False;

  //28/05/2020
  if fDMCadNotaFiscal.cdsProdutoANP_ID.AsInteger > 0 then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensANP_ID.AsInteger := fDMCadNotaFiscal.cdsProdutoANP_ID.AsInteger;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensANP_PRODUTO.AsString := SQLLocate('TAB_CPROD_ANP','ID','CODIGO',fDMCadNotaFiscal.cdsNotaFiscal_ItensANP_ID.AsString);
  end;
  //******************

  fDMCadNotaFiscal.cdsCliente.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,[loCaseInsensitive]);
  fDMCadNotaFiscal.cdsUF.Locate('UF',fDMCadNotaFiscal.cdsClienteUF.AsString,[loCaseInsensitive]);
  if fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger <> fDMCadNotaFiscal.cdsFilialID.AsInteger then
    fDMCadNotaFiscal.cdsFilial.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger,[loCaseInsensitive]);

  //21/05/2017  Supercrom
  if (vID_Produto_Ant <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger) and (fDMCadNotaFiscal.qParametros_NFeALTERAR_NOME_PROD.AsString = 'S') then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsProdutoNOME.AsString
  else
  if (fDMCadNotaFiscal.qParametros_NFeALTERAR_NOME_PROD.AsString = 'S') and (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString) = '') then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsProdutoNOME.AsString;
  //***********

  //30/08/2017
  if (fDMCadNotaFiscal.qParametros_ProdUSA_TAM_INDIVIDUAL.AsString = 'S') and (trim(fDMCadNotaFiscal.cdsProdutoTAMANHO.AsString) <> '' ) then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString := fDMCadNotaFiscal.cdsProdutoTAMANHO.AsString;
  //**********

  dbckDiferenca_ICMS.Visible := ((copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '6') and (fDMCadNotaFiscal.cdsCFOPSUBSTITUICAO_TRIB.AsString <> 'S'));

  lblPerc_Importacao.Visible   := (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3');
  dbedtPerc_Importacao.Visible := (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3');
  lblVlr_Aduaneira.Visible     := (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3');
  dbedtVlr_Aduaneira.Visible   := (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3');
  if copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3' then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IMPORTACAO.AsFloat := fDMCadNotaFiscal.cdsProdutoPERC_IMPORTACAO.AsFloat;

  TabSheet3.TabVisible := (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3');

  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_MOVESTOQUE_PED.AsInteger > 0 then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString := 'N'
  else
  begin
    //13/01/2018  Foi incluido essa altera��o para a RGB que esta fazendo baixa do estoque pela confer�ncia do pedido (C�d. Barra)
    if (fDMCadNotaFiscal.cdsParametrosTIPO_ESTOQUE.AsString = 'B') or (fDMCadNotaFiscal.cdsParametrosTIPO_ESTOQUE.AsString = 'P') then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString := 'N'
    else
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString := fDMCadNotaFiscal.cdsCFOPGERAR_ESTOQUE.AsString;
    if fDMCadNotaFiscal.cdsProdutoESTOQUE.AsString = 'N' then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString := 'N';
  end;

  fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger := fDMCadNotaFiscal.cdsProdutoID_NCM.AsInteger;
  if fDMCadNotaFiscal.cdsTab_NCMID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger then
    fDMCadNotaFiscal.cdsTab_NCM.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger,[loCaseInsensitive]);

  //esta sendo feito 05/08/2019  
  //prc_Busca_CST_ICMS;

  //4.00
  if (fDMCadNotaFiscal.cdsTab_NCMTIPO_ESCALA.AsString = 'S') AND (fDMCadNotaFiscal.cdsTab_NCMTIPO_ESCALA.AsString <> 'N') then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_ESCALA.AsString := fDMCadNotaFiscal.cdsTab_NCMTIPO_ESCALA.AsString
  else
    fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_ESCALA.Clear;
  //**************

  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger > 0 then
  begin
    if fDMCadNotaFiscal.cdsCFOP_Variacao.Locate('ITEM',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger,[loCaseInsensitive]) then
    begin
      prc_Montar_Codigos_CST(True);
      // 11/03/2020
      vGera_FCP := fDMCadNotaFiscal.cdsCFOP_VariacaoCALCULAR_FCP.AsString;
    end
  end
  else
    prc_Montar_Codigos_CST(False);

  //vai verificar as regras fiscais, Suspens�o de IPI e PIS/COFINS
  vIPI_Suspenso := False;
  vPIS_Suspenso := False;
  fDMCadNotaFiscal.qPessoa_Fiscal.Close;
  fDMCadNotaFiscal.qPessoa_Fiscal.ParamByName('CODIGO').AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger;
  fDMCadNotaFiscal.qPessoa_Fiscal.Open;
  if not fDMCadNotaFiscal.qPessoa_Fiscal.IsEmpty then
  begin
    if (fDMCadNotaFiscal.qPessoa_FiscalPIS_SUSPENSO.AsString = 'S') and
       (fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime >= fDMCadNotaFiscal.qPessoa_FiscalPIS_DT_INICIO.AsDateTime) and
       (fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime <= fDMCadNotaFiscal.qPessoa_FiscalPIS_DT_FINAL.AsDateTime) then
    begin
      vPIS_Suspenso := True;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat := 0;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat    := 0;
      if fDMCadNotaFiscal.qPessoa_FiscalPIS_ID_PIS.AsInteger > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger    := fDMCadNotaFiscal.qPessoa_FiscalPIS_ID_PIS.AsInteger;
      if fDMCadNotaFiscal.qPessoa_FiscalPIS_ID_COFINS.AsInteger > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger := fDMCadNotaFiscal.qPessoa_FiscalPIS_ID_COFINS.AsInteger;
    end;

    if (fDMCadNotaFiscal.qPessoa_FiscalIPI_SUSPENSO.AsString = 'S') and
       (fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime >= fDMCadNotaFiscal.qPessoa_FiscalIPI_DT_INICIO.AsDateTime) and
       ((fDMCadNotaFiscal.qPessoa_FiscalIPI_DT_FINAL.AsDateTime < 10) or
       (fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime <= fDMCadNotaFiscal.qPessoa_FiscalIPI_DT_FINAL.AsDateTime)) then
    begin
      vID_IPI := fDMCadNotaFiscal.qPessoa_FiscalIPI_ID_CSTIPI.AsInteger;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat := 0;
      vIPI_Suspenso := True;
      vID_EnqIPI    := fDMCadNotaFiscal.qPessoa_FiscalID_ENQIPI.AsInteger;
    end;
    //Suframa 09/11/2015
    if fDMCadNotaFiscal.qPessoa_FiscalDESC_SUFRAMA_ICMS.AsString = 'S' then
    begin
      if (fDMCadNotaFiscal.cdsProdutoUSA_PERC_IMP_INTERESTADUAL.AsString = 'S') and
         (fDMCadNotaFiscal.cdsFilialUF.AsString <> fDMCadNotaFiscal.cdsUFUF.AsString) then
        vPerc_Icms_Suf := fDMCadNotaFiscal.cdsFilialPERC_LISTA_CAMEX.AsFloat
      else
        vPerc_Icms_Suf := fDMCadNotaFiscal.cdsUFPERC_ICMS.AsFloat;
    end;
    if fDMCadNotaFiscal.qPessoa_FiscalDESC_SUFRAMA_IPI.AsString = 'S' then
    begin
      vPerc_IPI_Suf := fDMCadNotaFiscal.cdsProdutoPERC_IPI.AsFloat;
      //03/06/2018
      if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsTab_NCMPERC_IPI.AsFloat)) > 0 then
        vPerc_IPI_Suf := fDMCadNotaFiscal.cdsTab_NCMPERC_IPI.AsFloat;
    end;
    if fDMCadNotaFiscal.qPessoa_FiscalDESC_SUFRAMA_PIS_COFINS.AsString = 'S' then
    begin
      vPerc_Pis_Suf    := fDMCadNotaFiscal.cdsFilialPERC_PIS.AsFloat;
      vPerc_Cofins_Suf := fDMCadNotaFiscal.cdsFilialPERC_COFINS.AsFloat;
    end;
    //******************
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS_SUFRAMA.AsFloat := vPerc_Icms_Suf;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI_SUFRAMA.AsFloat  := vPerc_IPI_Suf;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS_COFINS_SUFRAMA.AsFloat := vPerc_Cofins_Suf;
  end;

  if (fDMCadNotaFiscal.cdsCFOPGERAR_IPI.AsString = 'S') and ((fDMCadNotaFiscal.cdsProdutoID_CSTIPI.AsInteger > 0) or (fDMCadNotaFiscal.cdsTab_NCMID_CSTIPI.AsInteger > 0)) and
     ((StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_IPI.AsFloat)) > 0) or (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsTab_NCMPERC_IPI.AsFloat)) > 0))
     and not(vIPI_Suspenso) and (fDMCadNotaFiscal.cdsFilialCALCULAR_IPI.AsString = 'S') then
  begin
    vID_IPI := fDMCadNotaFiscal.cdsProdutoID_CSTIPI.AsInteger;
    //03/06/2018
    if fDMCadNotaFiscal.cdsTab_NCMID_CSTIPI.AsInteger > 0 then
      vID_IPI := fDMCadNotaFiscal.cdsTab_NCMID_CSTIPI.AsInteger;
  end;

  //03/03/2018  
  if (fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString = 'S') and (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') then
  begin
    //07/12/2018
    if fDMCadNotaFiscal.cdsProdutoID_CSTICMS.AsInteger > 0 then
    begin
      vID_ICMS := fDMCadNotaFiscal.cdsProdutoID_CSTICMS.AsInteger;
      if fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',vID_ICMS,[loCaseInsensitive]) then
      begin
        if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '00' then
          vCod_CBenef_Loc := ''
        else
        if trim(fDMCadNotaFiscal.cdsProdutoCOD_BENEF.AsString) <> '' then
          vCod_CBenef_Loc := fDMCadNotaFiscal.cdsProdutoCOD_BENEF.AsString;
      end;

      //ver aqui 13/08/2019   S�o Jos�
      //if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_ICMS_NFCE.AsFloat)) > 0 then

    end
    else
    begin
      if fDMCadNotaFiscal.cdsTab_NCMID_CST_ICMS.AsInteger > 0 then
      begin
        vID_ICMS := fDMCadNotaFiscal.cdsTab_NCMID_CST_ICMS.AsInteger;
        if fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',vID_ICMS,[loCaseInsensitive]) then
        begin
          if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '00' then
            vCod_CBenef_Loc := ''
          else
          if trim(fDMCadNotaFiscal.cdsTab_NCMCOD_BENEF.AsString) <> '' then
            vCod_CBenef_Loc := fDMCadNotaFiscal.cdsTab_NCMCOD_BENEF.AsString;
        end;
      end;
      if StrToFloat(FormatFloat('0.0000',vPerc_BRedICMS_NCM)) > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := StrToFloat(FormatFloat('0.0000',vPerc_BRedICMS_NCM));
      //17/03/2020
      if StrToFloat(FormatFloat('0.000',fDMCadNotaFiscal.cdsTab_NCMPERC_ICMS.AsFloat)) > 0 then
        vPerc_ICMS := fDMCadNotaFiscal.cdsTab_NCMPERC_ICMS.AsFloat;
      //*****************
    end;
  end;

  //30/09/2016  Para a Shelly que vai usar para alguns clientes o 20 e outros o 51
  vUsouICM := False;
  if (fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString = 'S') and (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') then
  begin
    if fDMCadNotaFiscal.qPessoa_FiscalID_CST_ICMS.AsInteger > 0 then
    begin
      vID_ICMS := fDMCadNotaFiscal.qPessoa_FiscalID_CST_ICMS.AsInteger;
      if fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',vID_ICMS,[loCaseInsensitive]) then
      begin
        if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '00' then
          vCod_CBenef_Loc := ''
        else
        if trim(fDMCadNotaFiscal.qPessoa_FiscalCOD_BENEF.AsString) <> '' then
          vCod_CBenef_Loc := fDMCadNotaFiscal.qPessoa_FiscalCOD_BENEF.AsString;
        vUsouICM := True;
      end;
    end;
  end;

  //IF incluido para verificar Suframa  09/11/2015
  if (StrToFloat(FormatFloat('0.00',vPerc_Icms_Suf)) > 0) and (fDMCadNotaFiscal.qPessoa_FiscalID_CST_ICMS_SUFRAMA.AsInteger > 0) then
  begin
    vID_ICMS := fDMCadNotaFiscal.qPessoa_FiscalID_CST_ICMS_SUFRAMA.AsInteger;
    if fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',vID_ICMS,[loCaseInsensitive]) then
    begin
      if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '00' then
        vCod_CBenef_Loc := ''
      else
      if trim(fDMCadNotaFiscal.qPessoa_FiscalCOD_BENEF.AsString) <> '' then
        vCod_CBenef_Loc := fDMCadNotaFiscal.qPessoa_FiscalCOD_BENEF.AsString;
    end;
    vID_ICMS_Original := vID_ICMS;
  end
  else
  begin           
    vID_ICMS_Original := vID_ICMS;
    if not vUsouICM then
    begin
      vIDAux := fnc_Busca_NCM_CST;
      if vIDAux > 0 then
      begin
        vID_ICMS := vIDAux;
        vCod_CBenef_Loc := vCod_CBenef;
      end;
    end;
  end;                                                     

  //30/06/2017   Feito para a Ciex quando for para Revenda na Zona Franca de Manaus
  if (fDMCadNotaFiscal.qPessoa_FiscalID_CST_ICMS_SUFRAMA_ST.AsInteger > 0) and (fDMCadNotaFiscal.cdsTab_NCMGERAR_ST.AsString = 'S') and
     (fDMCadNotaFiscal.cdsClienteTIPO_CONSUMIDOR.AsInteger = 0) and ((fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '6109') or (fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '6110')) then
  begin
    vID_ICMS := fDMCadNotaFiscal.qPessoa_FiscalID_CST_ICMS_SUFRAMA_ST.AsInteger;
    if fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',vID_ICMS,[loCaseInsensitive]) then
    begin
      if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '00' then
        vCod_CBenef_Loc := ''
      else
      if trim(fDMCadNotaFiscal.qPessoa_FiscalCOD_BENEF.AsString) <> '' then
        vCod_CBenef_Loc := fDMCadNotaFiscal.qPessoa_FiscalCOD_BENEF.AsString;
    end;
    vID_ICMS_Original := vID_ICMS;
  end;
  //********************

  if (StrToFloat(FormatFloat('0.00',vPerc_IPI_Suf)) > 0) and (fDMCadNotaFiscal.qPessoa_FiscalID_CST_IPI_SUFRAMA.AsInteger > 0) then
  begin
    vID_IPI := fDMCadNotaFiscal.qPessoa_FiscalID_CST_IPI_SUFRAMA.AsInteger;
    if fDMCadNotaFiscal.qPessoa_FiscalID_ENQIPI_SUFRAMA.AsInteger > 0 then
      vID_EnqIPI := fDMCadNotaFiscal.qPessoa_FiscalID_ENQIPI_SUFRAMA.AsInteger;
  end;
  if vID_EnqIPI <= 0 then
    vID_EnqIPI := fDMCadNotaFiscal.cdsProdutoID_ENQIPI.AsInteger;
  if vID_EnqIPI > 0 then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_ENQIPI.AsInteger := vID_EnqIPI;
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_ENQIPI.AsInteger <= 0 then
  begin
    if fDMCadNotaFiscal.cdsFilialID_ENQIPI.AsInteger > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_ENQIPI.AsInteger := fDMCadNotaFiscal.cdsFilialID_ENQIPI.AsInteger;
  end;
  if vID_ICMS > 0 then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger := vID_ICMS
  else
    prc_Buscar_Imposto('CST','ICMS');
  if vID_IPI > 0 then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger := vID_IPI
  else
    prc_Buscar_Imposto('CST','IPI');

  if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S') or (fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString = 'N') then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := 0;
    vPerc_ICMS := 0;
  end
  else
  if fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString = 'S' then
  begin
    //07/11/2015
    if (fDMCadNotaFiscal.cdsCFOPUSA_REGRA_ORGAO_PUBLICO.AsString = 'S') and (fDMCadNotaFiscal.cdsParametrosUSA_PERC_ORGAO_PUBLICO.AsString = 'S') and
       (fDMCadNotaFiscal.cdsClienteORGAO_PUBLICO.AsString = 'S') and (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '6') then
    begin
      fDMCadNotaFiscal.cdsUF.Locate('UF',fDMCadNotaFiscal.cdsFilialUF.AsString,[loCaseInsensitive]);
      if (fDMCadNotaFiscal.cdsProdutoUSA_PERC_IMP_INTERESTADUAL.AsString = 'S') and (fDMCadNotaFiscal.cdsParametrosUSA_PERC_ORGAO_PUBLICO_IMP.AsString <> 'S') then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := fDMCadNotaFiscal.cdsFilialPERC_LISTA_CAMEX.AsFloat
      else
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := fDMCadNotaFiscal.cdsUFPERC_ICMS.AsFloat;
    end //****** foi incluido para o c�lculo do org�o p�blico
    else
    begin
      if (fDMCadNotaFiscal.cdsProdutoUSA_PERC_IMP_INTERESTADUAL.AsString = 'S') and (fDMCadNotaFiscal.cdsFilialUF.AsString <> fDMCadNotaFiscal.cdsUFUF.AsString) then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := fDMCadNotaFiscal.cdsFilialPERC_LISTA_CAMEX.AsFloat
      else
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := fDMCadNotaFiscal.cdsUFPERC_ICMS.AsFloat;
    end;
    if (fDMCadNotaFiscal.cdsFilialUF.AsString = fDMCadNotaFiscal.cdsClienteUF.AsString) and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_ICMS_NFCE.AsFloat)) > 0) then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_ICMS_NFCE.AsFloat))
    else
    //17/03/2020
    if StrToFloat(FormatFloat('0.000',vPerc_ICMS)) > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := StrToFloat(FormatFloat('0.00',vPerc_ICMS));
    //*************
    //24/07/2019
    //07/12/2018
    //if (StrToFloat(FormatFloat('0.000',fDMCadNotaFiscal.cdsTab_CSTICMSPERCENTUAL.AsFloat)) <= 0) and (StrToFloat(FormatFloat('0.000',fDMCadNotaFiscal.cdsTab_CSTICMSPERC_DIFERIMENTO.AsFloat)) <= 0) then
    //  fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := 0;
  end;

  if (fDMCadNotaFiscal.cdsCFOPGERAR_IPI.AsString = 'S') and not(vIPI_Suspenso) and (fDMCadNotaFiscal.cdsFilialCALCULAR_IPI.AsString = 'S') then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat := fDMCadNotaFiscal.cdsProdutoPERC_IPI.AsFloat;
    //03/06/2018
    if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsTab_NCMPERC_IPI.AsFloat)) > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat := fDMCadNotaFiscal.cdsTab_NCMPERC_IPI.AsFloat;
  end
  else
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat := 0;

  if (fDMCadNotaFiscal.vState_Item = 'I') or (fDMCadNotaFiscal.cdsNotaFiscal_Itens.State in [dsInsert]) then
  begin
    if vNotaSelecionada then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := fDMCadNotaFiscal.cdsProdutoPRECO_VENDA.AsFloat
    else
    begin
      if copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3' then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.0000000000',fDMCadNotaFiscal.cdsProdutoPRECO_CUSTO.AsFloat))
      else
      begin
        vPrecoAux := 0;
        if StrToFloat(FormatFloat('0.000000',vPreco_Pos)) > 0 then
        begin
          vPrecoAux := StrToFloat(FormatFloat('0.000000',vPreco_Pos));
          fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := vPrecoAux;
        end
        else
        begin
          if fDMCadNotaFiscal.cdsParametrospRODUTO_PRECO_POR_FINALIDADE.AsString = 'S' then
          begin
            case AnsiIndexStr(fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString,['C','R','I','O']) of
              0: fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := fDMCadNotaFiscal.cdsProdutoPRECO_CONSUMO.AsFloat;
              1: fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := fDMCadNotaFiscal.cdsProdutoPRECO_REVENDA.AsFloat;
              2: fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := fDMCadNotaFiscal.cdsProdutoPRECO_INDUSTRIALIZACAO.AsFloat;
            else
              fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := fDMCadNotaFiscal.cdsProdutoPRECO_VENDA.AsFloat;
            end
          end
          else
          begin
            if (fDMCadNotaFiscal.qParametros_PedUSA_TAB_PRECO.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscalID_TAB_PRECO.AsInteger > 0) then
            begin
              if (fDMCadNotaFiscal.qParametros_ProdPRODUTO_PRECO_COR.AsString = 'S') and (fDMCadNotaFiscal.cdsProdutoUSA_PRECO_COR.AsString = 'S') then
                vPrecoAux := DMUtil.fnc_Buscar_Preco(fDMCadNotaFiscal.cdsNotaFiscalID_TAB_PRECO.AsInteger,fDMCadNotaFiscal.cdsProdutoID.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger,'N')
              else
                vPrecoAux := DMUtil.fnc_Buscar_Preco(fDMCadNotaFiscal.cdsNotaFiscalID_TAB_PRECO.AsInteger,fDMCadNotaFiscal.cdsProdutoID.AsInteger,0,'N');
            end
            else
            //01/07/2020  para os pedidos do Caruso
            if (fDMCadNotaFiscal.qParametros_ProdUSA_PRECO_VAREJO.AsString = 'S') and (fDMCadNotaFiscal.cdsClienteUSA_PRECO_VAREJO.AsString = 'S') then
              vPrecoAux := StrToFloat(FormatFloat('0.00000',fDMCadNotaFiscal.cdsProdutoPRECO_VAREJO.AsFloat))
            else
            if fDMCadNotaFiscal.cdsClienteID_TAB_PRECO.AsInteger > 0 then
            begin
              if (fDMCadNotaFiscal.qParametros_ProdPRODUTO_PRECO_COR.AsString = 'S') and (fDMCadNotaFiscal.cdsProdutoUSA_PRECO_COR.AsString = 'S') then
                vPrecoAux := DMUtil.fnc_Buscar_Preco(fDMCadNotaFiscal.cdsClienteID_TAB_PRECO.AsInteger,fDMCadNotaFiscal.cdsProdutoID.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger,'N')
              else
                vPrecoAux := DMUtil.fnc_Buscar_Preco(fDMCadNotaFiscal.cdsClienteID_TAB_PRECO.AsInteger,fDMCadNotaFiscal.cdsProdutoID.AsInteger,0,'N')
            end;
            if StrToFloat(FormatFloat('0.000000',vPrecoAux)) > 0 then
              fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.0000000000',vPrecoAux))
            else
            begin
              //24/05/2017  Foi incluido para buscar o pre�o por cor
              if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger > 0) and (fDMCadNotaFiscal.cdsProdutoUSA_PRECO_COR.AsString = 'S') then
              begin
                prc_Abrir_Combinacao;
                if fDMCadNotaFiscal.cdsCombinacao.Locate('ID_COR_COMBINACAO',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger,[loCaseInsensitive]) then
                  fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := fDMCadNotaFiscal.cdsCombinacaoPRECO_VENDA.AsFloat;
                if StrToFloat(FormatFloat('0.000000',fDMCadNotaFiscal.cdsCombinacaoPRECO_VENDA.AsFloat)) <= 0 then
                  fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := fDMCadNotaFiscal.cdsProdutoPRECO_VENDA.AsFloat;
              end
              else
                fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := fDMCadNotaFiscal.cdsProdutoPRECO_VENDA.AsFloat;
              if (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsProdutoPRECO_VENDA.AsFloat)) <= 0) and (fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString = 'M') then
                fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := fDMCadNotaFiscal.cdsProdutoPRECO_CUSTO.AsFloat;
            end;
          end;
        end;
      end;
    end;
  end;
  vPreco_Ori := fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat;

  fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString               := fDMCadNotaFiscal.cdsProdutoUNIDADE.AsString;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger               := fDMCadNotaFiscal.cdsProdutoID_NCM.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString           := fDMCadNotaFiscal.cdsProdutoORIGEM_PROD.AsString;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensSOMAR_VLRTOTALPRODUTO.AsString := fDMCadNotaFiscal.cdsCFOPSOMAR_VLRTOTALPRODUTO.AsString;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString               := fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString;
  if vPIS_Suspenso then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCOFINS.AsString := fDMCadNotaFiscal.qPessoa_FiscalCOD_COFINS.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCODPIS.AsString    := fDMCadNotaFiscal.qPessoa_FiscalCOD_PIS.AsString;
  end
  else
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCOFINS.AsString := fDMCadNotaFiscal.cdsTab_CofinsCODIGO.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCODPIS.AsString    := fDMCadNotaFiscal.cdsTab_PisCODIGO.AsString;
  end;
  if vIPI_Suspenso then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_IPI.AsString := fDMCadNotaFiscal.cdsTab_CSTIPICOD_IPI.AsString
  else
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_IPI.AsString := fDMCadNotaFiscal.qPessoa_FiscalCOD_IPI.AsString;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_DUPLICATA.AsString := fDMCadNotaFiscal.cdsCFOPGERAR_DUPLICATA.AsString;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensMAOOBRA.AsString         := fDMCadNotaFiscal.cdsCFOPMAOOBRA.AsString;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_DESONERACAO.AsInteger := 0;
  //************

  if (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) <> '3') and (fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString = 'S') and
     (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') then
  begin
    //11/11/2015  Le a tabela de produto_UF
    uCalculo_NotaFiscal.prc_Abrir_qProduto_UF(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsProdutoID.AsInteger,fDMCadNotaFiscal.cdsClienteUF.AsString);
    //14/09/2016
    if fDMCadNotaFiscal.qProduto_UFID_CST_ICMS.AsInteger > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger := fDMCadNotaFiscal.qProduto_UFID_CST_ICMS.AsInteger;
      vCod_CBenef_Loc := fDMCadNotaFiscal.qProduto_UFCOD_BENEF.AsString;
    end;
    //*****************
    if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat)) > 0 then
      vPerc_BRedICMS_NCM := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat))
      //fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat))
    else
    if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsProdutoPERC_REDUCAOICMS.AsFloat)) > 0 then
    begin
      //fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsProdutoPERC_REDUCAOICMS.AsFloat));
      vPerc_BRedICMS_NCM := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsProdutoPERC_REDUCAOICMS.AsFloat));
      //21/02/2017
      if fDMCadNotaFiscal.cdsProdutoID_CSTICMS_BRED.AsInteger > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger := fDMCadNotaFiscal.cdsProdutoID_CSTICMS_BRED.AsInteger;
    end;
  end;

  //13/08/2019
  //if (fDMCadNotaFiscal.qParametros_NFeUSA_REGRA_CLI_PROD.AsString = 'S') then
  //29/08/2019
  //10/07/2020 alterado para ler o DRAWBACK no par�metros
  if (fDMCadNotaFiscal.qParametros_NFeUSA_REGRA_CLI_PROD.AsString = 'S') and (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') then
  begin
    fDMCadNotaFiscal.qPessoa_ProdICMS.Close;
    fDMCadNotaFiscal.qPessoa_ProdICMS.ParamByName('CODIGO').AsInteger     := fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger;
    fDMCadNotaFiscal.qPessoa_ProdICMS.ParamByName('ID_PRODUTO').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensDRAWBACK.AsString = 'S' then
      fDMCadNotaFiscal.qPessoa_ProdICMS.ParamByName('DRAWBACK').AsString := 'S'
    else
      fDMCadNotaFiscal.qPessoa_ProdICMS.ParamByName('DRAWBACK').AsString := 'N';
    if trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString) <> '' then
      fDMCadNotaFiscal.qPessoa_ProdICMS.ParamByName('FINALIDADE').AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString
    else
      fDMCadNotaFiscal.qPessoa_ProdICMS.ParamByName('FINALIDADE').AsString := 'A';
    fDMCadNotaFiscal.qPessoa_ProdICMS.Open;
    //20/08/2020  para a SLTextil   onde mesmo se n� informar o produto e estiver marcado que � draback vai usar do cliente as informa��es
    if (fDMCadNotaFiscal.qPessoa_ProdICMS.IsEmpty) and (fDMCadNotaFiscal.qPessoa_FiscalDRAW_POSSUI.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensDRAWBACK.AsString = 'S') then
    begin
      if fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_IPI.AsInteger > 0 then
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger := fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_IPI.AsInteger;
        if fDMCadNotaFiscal.qPessoa_FiscalDRAW_ENQIPI.AsInteger > 0 then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensID_ENQIPI.AsInteger := fDMCadNotaFiscal.qPessoa_FiscalDRAW_ENQIPI.AsInteger;
      end;
      if fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_PIS_COFINS.AsInteger > 0 then
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger    := fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_PIS_COFINS.AsInteger;
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger := fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_PIS_COFINS.AsInteger;
      end;
    end
    else
    //******************************
    if not fDMCadNotaFiscal.qPessoa_ProdICMS.IsEmpty then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger := fDMCadNotaFiscal.qPessoa_ProdICMSID_CSTICMS.AsInteger;
      if fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger,[loCaseInsensitive]) then
      begin
        if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '00' then
          vCod_CBenef_Loc := ''
        else
        //26/03/2020
        //if trim(fDMCadNotaFiscal.qPessoa_FiscalCOD_BENEF.AsString) <> '' then
        if trim(fDMCadNotaFiscal.qPessoa_ProdICMSCOD_BENEF.AsString) <> '' then
          vCod_CBenef_Loc := fDMCadNotaFiscal.qPessoa_ProdICMSCOD_BENEF.AsString;
      end;
      vPerc_BRedICMS_NCM := 0;
      if fDMCadNotaFiscal.qPessoa_ProdICMSID_LEI.AsInteger > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_OBS_LEI_NCM.AsInteger := fDMCadNotaFiscal.qPessoa_ProdICMSID_LEI.AsInteger;
      if (fDMCadNotaFiscal.qPessoa_ProdICMSDRAWBACK.AsString = 'S') and (fDMCadNotaFiscal.qPessoa_FiscalDRAW_POSSUI.AsString = 'S') then
      begin
        if fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_IPI.AsInteger > 0 then
        begin
          fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger := fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_IPI.AsInteger;
          if not fnc_Gerar_IPI(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger) then
            fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat := 0;
        end;
        if fDMCadNotaFiscal.qPessoa_FiscalDRAW_ENQIPI.AsInteger > 0 then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensID_ENQIPI.AsInteger :=fDMCadNotaFiscal.qPessoa_FiscalDRAW_ENQIPI.AsInteger;
        if fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_PIS_COFINS.AsInteger > 0 then
        begin
          fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger    := fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_PIS_COFINS.AsInteger;
          fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger := fDMCadNotaFiscal.qPessoa_FiscalDRAW_ID_PIS_COFINS.AsInteger;
        end;
        if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qPessoa_FiscalDRAW_PERC_DESCONTO.AsFloat)) > 0 then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DESCONTO.AsFloat := StrToFloat(FormatFloat('0.000',fDMCadNotaFiscal.qPessoa_FiscalDRAW_PERC_DESCONTO.AsFloat));
      end;
    end;
    if not fnc_Gerar_Cofins then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat := 0;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat    := 0;
    end;
  end;
  //*******************

  if fDMCadNotaFiscal.cdsTab_CSTIcms.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger,([Locaseinsensitive])) then
  begin
    if StrToFloat(FormatFloat('0.0000',vPerc_BRedICMS_NCM)) > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := StrToFloat(FormatFloat('0.0000',vPerc_BRedICMS_NCM))
    else
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := fDMCadNotaFiscal.cdsTab_CSTICMSPERCENTUAL.AsFloat;
    if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51' then
    begin
      //05/12/2018
      if (StrToFloat(FormatFloat('0.000',fDMCadNotaFiscal.cdsTab_CSTICMSPERCENTUAL.AsFloat)) <= 0) and
         (StrToFloat(FormatFloat('0.000',fDMCadNotaFiscal.cdsTab_CSTICMSPERC_DIFERIMENTO.AsFloat)) <= 0) then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := 0;
      //****************
      if fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString <> 'S' then
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat    := 0;
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat := 100;
      end
      else
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat := fDMCadNotaFiscal.cdsTab_CSTICMSPERC_DIFERIMENTO.AsFloat;
      if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat)) > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := 100;
    end
    else
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat := 0;
      //05/12/2018
      if (StrToFloat(FormatFloat('0.000',fDMCadNotaFiscal.cdsTab_CSTICMSPERCENTUAL.AsFloat)) <= 0) then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := 0;
      //****************
    end;

    fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString := fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString;
    fDMCadNotaFiscal.prc_Abrir_Desoneracao(fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString);
    if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') and (fDMCadNotaFiscal.cdsCFOPGERAR_DESONERACAO_ICMS.AsString = 'S') then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_DESONERACAO.AsInteger := fDMCadNotaFiscal.cdsTab_CSTICMSCOD_DESONERACAO.AsInteger;
    //*************
  end
  else
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat    := 0;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString         := '';
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat    := StrToFloat(FormatFloat('0.0000',0));
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat := 0;
  end;

  prc_Habilitar_Desoneracao(fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString);

  if copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3' then
  begin
    if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_COFINS.AsFloat)) > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_COFINS.AsFloat));
    if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_PIS.AsFloat)) > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_PIS.AsFloat));
    if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_ICMS_IMP.AsFloat)) > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_ICMS_IMP.AsFloat));
    if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_IPI_IMP.AsFloat)) > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_IPI_IMP.AsFloat));
      //03/06/2018
      if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsTab_NCMPERC_IPI.AsFloat)) > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsTab_NCMPERC_IPI.AsFloat));
    end;
  end;

  DBEdit1.ReadOnly  := (fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString <> 'N');
  DBEdit13.ReadOnly := (fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString <> 'N');

  if not DBEdit14.ReadOnly then
    DBEdit14.ReadOnly := (fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '00');

  //Tamanho
  if fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S' then
  begin
    btnGrade.Visible    := ((fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') and (fDMCadNotaFiscal.vState_Item = 'I'));
    lblTamanho.Visible  := ((fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') and (fDMCadNotaFiscal.vState_Item = 'E'));
    dblcTamanho.Visible := ((fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') and (fDMCadNotaFiscal.vState_Item = 'E'));
    DBEdit2.ReadOnly := ((fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S') and (fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S'));
    if (fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S') and (fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') then
      DBEdit2.Color := clSilver
    else
      DBEdit2.Color := clWindow;
  end;
  //************
  DBCheckBox2.Visible := (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat)) > 0);
  Label48.Visible  := ((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger > 0) and (fDMCadNotaFiscal.cdsParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S'));
  DBEdit26.Visible := ((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger > 0) and (fDMCadNotaFiscal.cdsParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S'));
  Label49.Visible  := ((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger > 0) and (fDMCadNotaFiscal.cdsParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S'));
  prc_Mover_Lei_Transparencia;

  //09/11/2015
  if (StrToFloat(FormatFloat('0.00',vPerc_Icms_Suf)) > 0) and (fDMCadNotaFiscal.qPessoa_FiscalID_CST_ICMS_SUFRAMA.AsInteger > 0) then
  begin
    if fDMCadNotaFiscal.cdsTab_CSTICMSID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger then
      fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger,[loCaseInsensitive]);
    if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsTab_CSTICMSPERCENTUAL.AsFloat)) <= 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat := 0;
  end;
  if (StrToFloat(FormatFloat('0.00',vPerc_IPI_Suf)) > 0) and (fDMCadNotaFiscal.qPessoa_FiscalID_CST_IPI_SUFRAMA.AsInteger > 0) then
  begin
    if not fnc_Gerar_IPI(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger) then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat := 0;
  end;
  if (StrToFloat(FormatFloat('0.00',vPerc_Cofins_Suf)) > 0) and (fDMCadNotaFiscal.qPessoa_FiscalID_CST_PIS_COFINS_SUFRAMA.AsInteger > 0) then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger := fDMCadNotaFiscal.qPessoa_FiscalID_CST_PIS_COFINS_SUFRAMA.AsInteger;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger    := fDMCadNotaFiscal.qPessoa_FiscalID_CST_PIS_COFINS_SUFRAMA.AsInteger;
    if not fnc_Gerar_Cofins then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat := 0;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat    := 0;
    end;
  end;
  vAux := StrToFloat(FormatFloat('0.00',vPerc_Cofins_Suf + vPerc_Icms_Suf + vPerc_IPI_Suf + vPerc_Pis_Suf));
  //06/10/2016
  fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS_COFINS_SUFRAMA.AsFloat := StrToFloat(FormatFloat('0.00',vPerc_Pis_Suf + vPerc_Cofins_Suf));
  fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS_SUFRAMA.AsFloat       := StrToFloat(FormatFloat('0.00',vPerc_Icms_Suf));
  //******************
  //31/08/2018  tirado o desconto quando � Suframa
  {if StrToFloat(FormatFloat('0.00',vAux)) > 0 then
  begin
    //07/10/2016
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DESCONTO.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
    //fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DESC_SUFRAMA.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  end;}
  //*****************
  prc_NFCI;
  //10/11/2015 Comiss�o por item
  if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString <> 'I') then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.00',0))
  else
  if ((fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger <> vID_Produto_Ant))
     and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger <= 0) then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat := fnc_Buscar_Comissao_Prod(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,
                                                                fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,
                                                                fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger);
                                                                
  if fDMCadNotaFiscal.qParametros_NFeSOMAR_IPI_NO_ICMS.AsString = 'S' then
  begin
    // Inclu�do 21/11/2018
    if (fDMCadNotaFiscal.qParametros_NFeSOMAR_IPI_NO_ICM_TC.AsString = 'C') and
       ((fDMCadNotaFiscal.cdsClienteTIPO_CONSUMIDOR.AsInteger = 1) or (fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString = 'C')) then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString := 'S'
    else
    //IF incluido 30/07/2017 para a Sulcromo, vai somar o IPI na base do icms quando for consumo a finalidade
    if (fDMCadNotaFiscal.qParametros_NFeSOMAR_IPI_NO_ICM_TC.AsString = 'F') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString = 'C') then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString := 'S'
    else
    if (fDMCadNotaFiscal.qParametros_NFeSOMAR_IPI_NO_ICM_TC.AsString = '1') and (fDMCadNotaFiscal.cdsClienteTIPO_CONTRIBUINTE.AsInteger = 1) then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString := 'S'
    else
    if (fDMCadNotaFiscal.qParametros_NFeSOMAR_IPI_NO_ICM_TC.AsString = '2') and ((fDMCadNotaFiscal.cdsClienteTIPO_CONTRIBUINTE.AsInteger = 2) or
       (fDMCadNotaFiscal.cdsClienteTIPO_CONTRIBUINTE.AsInteger = 9)) then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString := 'S'
    else
    if (fDMCadNotaFiscal.qParametros_NFeSOMAR_IPI_NO_ICM_TC.AsString = '9') then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString := 'S'
    else
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString := 'N';
  end
  else
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString := 'N';

  //08/07/2017   Unidade tribut�vel
  if (fDMCadNotaFiscal.cdsCFOPUSA_UNIDADE_TRIB.AsString = 'S') and (trim(fDMCadNotaFiscal.cdsTab_NCMUNIDADE_TRIB.AsString) <> '') then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE_TRIB.AsString := fDMCadNotaFiscal.cdsTab_NCMUNIDADE_TRIB.AsString;
  //***************

  //11/03/2020
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger > 0) and
     ((fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger <> fDMCadNotaFiscal.cdsCFOP_VariacaoID.AsInteger) or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger <> fDMCadNotaFiscal.cdsCFOP_VariacaoITEM.AsInteger)) then
  begin
    if fDMCadNotaFiscal.cdsCFOP_Variacao.Locate('ID;ITEM',VarArrayOf([fDMCadNotaFiscal.cdsCFOPID.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger]),[locaseinsensitive]) then
      vGera_FCP := fDMCadNotaFiscal.cdsCFOP_VariacaoCALCULAR_FCP.AsString;
  end;
  //*********************

  //4.00                 // (fDMCadNotaFiscal.cdsCFOP_VariacaoCALCULAR_FCP.AsString = 'S')   esse and foi incluido dia 11/03/2020 por varia��o
  if (fDMCadNotaFiscal.cdsUFPOSSUI_FCP.AsString = 'S') and (vGera_FCP = 'S')
    and (((fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'N') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat)) > 0))
    or ((fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S') and (fDMCadNotaFiscal.cdsCFOPGERAR_ICMS_SIMPLES.AsString = 'S'))
    or (fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '5405')) then
  begin
    fDMCadNotaFiscal.qNCM_CST.Close;
    //21/01/2019  Foi incluido para calcular o FCP da ST
    vIDAux := fnc_Busca_NCM_CST;
    vAux   := StrToFloat(FormatFloat('0.00',0));
    if trim(fDMCadNotaFiscal.cdsTab_NCMCALCULA_FCP.AsString) = 'S' then //O IF para controlar por NCM foi colocado dia 26/10/2018
    begin
      if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_CSTPERC_FCP.AsFloat)) > 0 then
      begin
        if fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '5405' then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS_FCP_5405.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_CSTPERC_FCP.AsFloat))
        else
          vAux := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_CSTPERC_FCP.AsFloat));
      end
      else
      begin
        if fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '5405' then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS_FCP_5405.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsUFPERC_CP.AsFloat))
        else
          vAux := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsUFPERC_CP.AsFloat));
      end;
      //10/12/2019
      if (fDMCadNotaFiscal.cdsTab_NCMGERAR_ST.AsString = 'S') and (fnc_Possui_Calc_ST)  then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_FCP_ST.AsFloat := StrToFloat(FormatFloat('0.00',vAux))
      else
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS_FCP.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
    end
    else
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS_FCP.AsFloat      := StrToFloat(FormatFloat('0.00',0));
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_FCP_ST.AsFloat        := StrToFloat(FormatFloat('0.00',0));
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS_FCP_5405.AsFloat := StrToFloat(FormatFloat('0.00',0));
    end;
  end
  else
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS_FCP.AsFloat      := StrToFloat(FormatFloat('0.00',0));
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_FCP_ST.AsFloat        := StrToFloat(FormatFloat('0.00',0));
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS_FCP_5405.AsFloat := StrToFloat(FormatFloat('0.00',0));
  end;

  //******
  //16/10/2018
  if (fDMCadNotaFiscal.cdsClienteTIPO_CONTRIBUINTE.AsInteger = 1) and (fDMCadNotaFiscal.cdsClienteTIPO_CONSUMIDOR.AsInteger = 1) and
    (fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString = '10') and (dbckDiferenca_ICMS.Visible) then
    //fDMCadNotaFiscal.cdsNotaFiscal_ItensDIFERENCA_ICMS.AsString := 'S'   //28/08/2019
    fDMCadNotaFiscal.cdsNotaFiscal_ItensDIFERENCA_ICMS.AsString := uUtilPadrao.fnc_UF_Possui_ST(fDMCadNotaFiscal.cdsProdutoID_NCM.AsInteger,fDMCadNotaFiscal.cdsClienteUF.AsString)
  else
    fDMCadNotaFiscal.cdsNotaFiscal_ItensDIFERENCA_ICMS.AsString := 'N';

  //07/03/2019  Estoque por benegficiamento e tipo de material  SLTextil vai ter esse controle devido ao Algod�o e ao Poliester
  if (Trim(fDMCadNotaFiscal.cdsProdutoESTOQUE.AsString) <> 'N') and (fDMCadNotaFiscal.cdsCFOPBENEFICIAMENTO.AsString = 'S') and (fDMCadNotaFiscal.cdsCFOPGERAR_ESTOQUE.AsString = 'S')  then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString := fnc_Estoque_Tipo_Mat(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString);
  //***************

  //22/06/2019  Quando for Textil e o produto for Semi, n�o � para gerar estoque em qualquer tipo de CFOP na nota
  if (fDMCadNotaFiscal.qParametros_LoteLOTE_TEXTIL.AsString = 'S') and (fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString = 'S') and
     (fDMCadNotaFiscal.qParametros_LoteOPCAO_ESTOQUE_SEMI.AsString = 'N') then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString := 'N';
  //***************************

  //26/03/2020
  if (trim(vCod_CBenef_Loc) = '') and (fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger,[loCaseInsensitive])) then
    vCod_CBenef_Loc := trim(fDMCadNotaFiscal.cdsTab_CSTICMSCOD_BENEF.AsString);

  //11/12/2019
  fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CBENEF.AsString := vCod_CBenef_Loc;
  //*******************
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit2Exit(Sender: TObject);
begin
  prc_Calcular_VlrItens;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Calcular_VlrItens;
var
  vAux: Real;
begin
  vAux := 0;
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat > 0) and (fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat > 0) then
  begin
    if fDMCadNotaFiscal.cdsParametrosARREDONDAR_5.AsString = 'B' then
      vAux := StrToCurr(FormatCurr('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat * fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat))
    else
      vAux := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat * fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat));
  end;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit5Exit(Sender: TObject);
begin
  if (fDMCadNotaFiscal.qParametros_FinCONTROLE_DIG_PRECO.AsString = 'S') and (fDMCadNotaFiscal.qParametros_UsuarioALT_PRECO_PED.AsString = 'C') and
    (StrToFloat(FormatFloat('0.000000',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat)) < StrToFloat(FormatFloat('0.000000',vPreco_Ori))) then
  begin
    MessageDlg('*** Pre�o n�o pode ser menor que ' + FormatFloat('0.00####',vPreco_Ori), mtError, [mbOk], 0);
    fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := vPreco_Ori;
    DBEdit5.SetFocus;
  end;
  prc_Calcular_VlrItens;
end;

procedure TfrmCadNotaFiscal_Itens.BitBtn1Click(Sender: TObject);
var
  vFlagErro: Boolean;
  vEditar: Boolean;
  vQtdAux: Real;
  vGravar_Tab_Tam: String;
  vAux: String;
  vVlrAux : Real;
  vIPIAux : Real;
begin
  vGravacao_Ok := False;
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '0' then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensNUM_FCI.AsString       := '';
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_USADO_FCI.AsFloat := 0;
  end;

  if fnc_Erro then
    exit;

  //29/11/2020
  if (fDMCadNotaFiscal.vState_Item = 'E') and ((StrToFloat(FormatFloat('0.0000',vQtd_Prod_Ant)) > 0) and
     (StrToFloat(FormatFloat('0.0000',vQtd_Prod_Ant)) < StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat)))) and
     (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger > 0) and (fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_PEDIDO.AsInteger > 0)
     and (fDMCadNotaFiscal.cdsParametrosPERMITE_QTDMAIOR_PEDIDO.AsString <> 'S') then
  begin
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat >
       uCalculo_NotaFiscal.fnc_Busca_Qtd_Restante(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger,
                                       fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_PEDIDO.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID.AsInteger,
                                       fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger) then
    begin
      MessageDlg('*** Qtd. Informada maior que a Restante no Pedido: ' + fDMCadNotaFiscal.cdsNotaFiscal_ItensNUM_PEDIDO.AsString + ' Item: '
                                                                       + fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_PEDIDO.AsString
                                                                       + ', Favor Verificar!' , mtInformation, [mbOk], 0);
      exit;
    end;
  end;
  //***************

  if (vIPI_Suspenso) and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat)) > 0) then
  begin
    if MessageDlg('Cliente com suspens�o de IPI, deseja confirmar este item com lan�amento de IPI?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
  end;

  //10/01/2019  Ajuste do IPI MB
  if fDMCadNotaFiscal.cdsClienteCODIGO.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger then
    fDMCadNotaFiscal.cdsCliente.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,[loCaseInsensitive]);
  if (fDMCadNotaFiscal.cdsClienteIPI_PAGO_FILIAL.AsString = 'S') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat)) > 0) then
  begin
    if ((StrToFloat(FormatFloat('0.00',vVlrTotal_Ant)) <> StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat))) or
       (StrToFloat(FormatFloat('0.00',vPerc_IPI_Ant)) <> StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat))) or
       (vID_Produto_Ant <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger) or (fDMCadNotaFiscal.vState_Item = 'I')) and
       (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger <= 0) then
      prc_Calcula_IPI_Pago_Empresa;
  end;
  //******************
  //11/10/2020
  fDMCadNotaFiscal.cdsNotaFiscal_ItensPRECO_CUSTO.AsFloat := fnc_Preco_Custo(fDMCadNotaFiscal);
  //*******************

  if fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString = 'N' then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString := 'N';

  //Controle do estoque  11/05/2015
  if (fDMCadNotaFiscal.cdsParametrosCONTROLAR_ESTOQUE_SAIDA.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString = 'S')
    and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString = 'S') then
  begin
    if (fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString <> 'S') or ((fDMCadNotaFiscal.cdsNotaFiscal_Itens.State in [dsEdit]) and
       (StrToFloat(FormatFloat('0.0000',vQtd_Prod_Ant)) <> StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat)))) then
    begin
      //11/09/2015  alterado conforme JW
      vQtdAux := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat));
      if (fDMCadNotaFiscal.cdsParametrosEMPRESA_SUCATA.AsString = 'S') and (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_LANCAR_ESTOQUE.AsFloat)) > 0) then
        vQtdAux := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_LANCAR_ESTOQUE.AsFloat));
      if not fnc_Estoque_OK(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger,
                            fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString,StrToFloat(FormatFloat('0.0000',vQtdAux))) then
        exit;
    end
    else
    begin
      vFlagErro := False;
      fDMInformar_Tam.mTamanho.First;
      while not fDMInformar_Tam.mTamanho.eof do
      begin
        if StrToFloat(FormatFloat('0.0000',fDMInformar_Tam.mTamanhoQtd.AsFloat)) > 0 then
        begin
          if not fnc_Estoque_OK(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger,
                                fDMInformar_Tam.mTamanhoTamanho.AsString,fDMInformar_Tam.mTamanhoQtd.AsFloat) then
          begin
            fDMInformar_Tam.mTamanho.Last;
            vFlagErro := True;
          end
          else
            fDMInformar_Tam.mTamanho.Next
        end
        else
          fDMInformar_Tam.mTamanho.Next;
      end;
      if vFlagErro then
        exit;
      if fDMInformar_Tam.mTamanho.IsEmpty then
        exit;
    end;
  end;
  //**************  11/05/2015
  
  fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVACAO_COM_ERRO.AsString := '';
  vEditar   := (fDMCadNotaFiscal.vState_Item = 'E');
  vFlagErro := False;

  try
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger <> fDMCadNotaFiscal.cdsCFOPID.AsInteger then
      fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,[loCaseInsensitive]);
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString := fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString;
    if trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensFONTE_TRIBUTO.AsString) <> '' then
      fDMCadNotaFiscal.cdsNotaFiscalFONTE_TRIBUTOS.AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensFONTE_TRIBUTO.AsString;
    if trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensVERSAO_TRIBUTO.AsString) <> '' then
      fDMCadNotaFiscal.cdsNotaFiscalVERSAO_TRIBUTOS.AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensVERSAO_TRIBUTO.AsString;
    //14/11/2016
    if trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensIBPT_CHAVE.AsString) <> '' then
      fDMCadNotaFiscal.cdsNotaFiscalIBPT_CHAVE.AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensIBPT_CHAVE.AsString;
    //************
    if (pnlCor.Visible) and (RxDBLookupCombo14.Text <> '') then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_COR_COMBINACAO.AsString := RxDBLookupCombo14.Text;
    if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger > 0) and (fDMCadNotaFiscal.cdsTab_CSTIPIID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger) then
      fDMCadNotaFiscal.cdsTab_CSTIPI.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger,[loCaseInsensitive]);
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_IPI.AsString := fDMCadNotaFiscal.cdsTab_CSTIPICOD_IPI.AsString
    else
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_IPI.Clear;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.Clear;
    if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger > 0) then
    begin
      if fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger,[loCaseInsensitive]) then
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString := fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString;
        //verificar erro do cst 30/09/2014
        if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S') and (Length(fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString) < 3) then
        begin
          fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.Clear;
          fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString := '';
        end
        else
        if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'N') and (Length(fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString) > 2) then
        begin
          fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.Clear;
          fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CST.AsString := '';
        end;
        if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'N') and (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsTab_CSTICMSPERCENTUAL.AsFloat)) > 0) and
           (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat)) <= 0) then
          MessageDlg('*** Verificar esse item, pois n�o foi informado ICMS!' , mtInformation, [mbOk], 0);
      end
      else
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.Clear;
    end;
    //if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DESCONTO.AsFloat)) > 0) or (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DESCONTO.AsFloat)) > 0) then
    //  fDMCadNotaFiscal.cdsNotaFiscalTIPO_DESCONTO.AsString := 'I';

    fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_BARRA.AsString := '';
    //28/11/2019
    if (trim(fDMCadNotaFiscal.qParametros_ProdUSA_BITOLA.AsString) = 'S') and (trim(fDMCadNotaFiscal.cdsProdutoMEDIDA.AsString) <> '') then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsProdutoNOME.AsString + ' ' + fDMCadNotaFiscal.cdsProdutoMEDIDA.AsString
    else
    if fDMCadNotaFiscal.qParametros_NFeUSA_NOMEPROD_FORN_NFE.AsString = 'S' then
    begin
      fDMCadNotaFiscal.qProduto_Forn.Close;
      fDMCadNotaFiscal.qProduto_Forn.ParamByName('ID').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
      fDMCadNotaFiscal.qProduto_Forn.ParamByName('ID_FORNECEDOR').AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger;
      fDMCadNotaFiscal.qProduto_Forn.ParamByName('ID_COR').AsInteger        := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger;
      fDMCadNotaFiscal.qProduto_Forn.Open;
      if not(fDMCadNotaFiscal.qProduto_Forn.IsEmpty) and (trim(fDMCadNotaFiscal.qProduto_FornNOME_MATERIAL_FORN.AsString) <> '') then
      begin
        if not(vNotaSelecionada) or (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString) = '') then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.qProduto_FornNOME_MATERIAL_FORN.AsString;
        fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_PRODUTO_FORN.AsString := fDMCadNotaFiscal.qProduto_FornCOD_MATERIAL_FORN.AsString;
        if fDMCadNotaFiscal.qProduto_FornCOD_BARRA.AsString <> '' then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_BARRA.AsString := fDMCadNotaFiscal.qProduto_FornCOD_BARRA.AsString;
      end
      else
      if ((fDMCadNotaFiscal.qParametros_PedUSA_OPERACAO_SERV.AsString <> 'S') and (trim(fDMCadNotaFiscal.qParametros_NFeALTERAR_NOME_PROD.AsString) <> 'S')) then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsProdutoNOME.AsString;
      fDMCadNotaFiscal.qProduto_Forn.Close;
    end
    else
    if not(vNotaSelecionada) then //aqui
    begin
      if (vCodProdutoAnt = fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger) and (fDMCadNotaFiscal.cdsNotaFiscal_NDevolvida.RecordCount > 0)
      and (fDMCadNotaFiscal.qParametros_NFeUSA_PROD_NTE.AsString = 'S') then
        vAux := ''
      else
      //19/11/2019
      if (trim(fDMCadNotaFiscal.qParametros_NFeALTERAR_NOME_PROD.AsString) = 'S') and (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString) <> '') then
      else
      if ((fDMCadNotaFiscal.qParametros_PedUSA_OPERACAO_SERV.AsString <> 'S') or (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString) = '')) then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsProdutoNOME.AsString;
    end;
    //08/07/2014  Quantidade por pacote
    if fDMCadNotaFiscal.cdsProdutoUNIDADE.AsString = fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_PACOTE.AsFloat := StrToFloat(FormatFloat('0',0));
    //************
    if trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString) = '' then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsProdutoNOME.AsString;
    if fDMCadNotaFiscal.cdsTab_NCMID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger then
      fDMCadNotaFiscal.cdsTab_NCM.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger,[loCaseInsensitive]);

    if not(vPedidoSelecionado) or (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensREFERENCIA.AsString) = '') then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensREFERENCIA.AsString := fDMCadNotaFiscal.cdsProdutoREFERENCIA.AsString;
    if (fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString = 'N') and (fDMCadNotaFiscal.vState_Item = 'E') then
    begin
      fDMCadNotaFiscal.cdsNotaFiscalBASE_ICMS.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalBASE_ICMS.AsFloat - vBaseIcms_Cre));
      fDMCadNotaFiscal.cdsNotaFiscalVLR_ICMS.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_ICMS.AsFloat - vVlrIcms_Cre));
      //02/03/2020
      fDMCadNotaFiscal.cdsNotaFiscalBASE_IPI.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalBASE_IPI.AsFloat - vBaseIPI_Cre));
      fDMCadNotaFiscal.cdsNotaFiscalVLR_IPI.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_IPI.AsFloat - vVlrIPI_Cre));
    end;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensNCM.AsString       := fDMCadNotaFiscal.cdsTab_NCMNCM.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_NOTA.AsString := fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString;
    //20/05/2016
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_ORIGINAL.AsInteger <= 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_ORIGINAL.AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;

    //08/07/2017  Unidade tribut�vel
    //14/08/2020 ajustado o IF
    //if (fDMCadNotaFiscal.cdsCFOPUSA_UNIDADE_TRIB.AsString = 'S') and (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE_TRIB.AsString) <> '') then
    if (fDMCadNotaFiscal.cdsCFOPUSA_UNIDADE_TRIB.AsString = 'S') then
      prc_Unidade_Trib
    else
    begin   //13/08/2020
      fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE_TRIB.AsString     := '';
      fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_TRIB.AsFloat          := 0;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO_TRIB.AsFloat := 0;
    end;  
    //******************

    prc_Calculo_GeralItem(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat,fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat,
                                           fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DESCONTO.AsFloat,fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DESCONTO.AsFloat,
                                           fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat,fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_DUPLICATA.AsString);

    //15/08/2014
    if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger > 0) then
      if not fnc_Verifica_Simples then
        exit;
    if (fDMCadNotaFiscal.cdsCFOPSUBSTITUICAO_TRIB.AsString = 'S') then
      if not fnc_Verifica_SubstTributaria then
        exit;
    //23/05/2019
    if (fDMCadNotaFiscal.cdsCFOPENVIAR_BASE_ST.AsString = 'S') and (fDMCadNotaFiscal.cdsFilialUSA_ENVIO_ST_RET.AsString = 'S') then
      if not fnc_Verifica_ST_Ant then
        exit;
    //**********************

    //Esse if foi incluido no dia   26/05/2016  para controlar se gravou na tabela de tamanhos
    if (fDMCadNotaFiscal.qParametros_NFeGRAVAR_TAB_TAMANHO.AsString = 'S') then
    begin
      if not(fDMCadNotaFiscal.cdsNotaFiscal_Tam.IsEmpty) or not(fDMInformar_Tam.mTamanho.IsEmpty) then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVOU_TAB_TAMANHO.AsString := 'S'
      else
        fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVOU_TAB_TAMANHO.AsString := 'N';
    end
    else
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVOU_TAB_TAMANHO.AsString := 'N';

    if (fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVOU_TAB_TAMANHO.AsString = 'S') then
    begin
      if not(vPedidoSelecionado) and not(vNotaSelecionada) then
      begin
        fDMInformar_Tam.mTamanho.First;
        while not fDMInformar_Tam.mTamanho.Eof do
        begin
          if fDMCadNotaFiscal.cdsNotaFiscal_Tam.Locate('ID;ITEM;TAMANHO',VarArrayOf([fDMCadNotaFiscal.cdsNotaFiscal_ItensID.AsInteger,
                                                       fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger,fDMInformar_Tam.mTamanhoTamanho.AsString]),[locaseinsensitive]) then
            fDMCadNotaFiscal.cdsNotaFiscal_Tam.Edit
          else
          begin
            if StrToFloat(FormatFloat('0.0000',fDMInformar_Tam.mTamanhoQtd.AsFloat)) > 0 then
            begin
              fDMCadNotaFiscal.cdsNotaFiscal_Tam.Insert;
              fDMCadNotaFiscal.cdsNotaFiscal_TamID.AsInteger     := fDMCadNotaFiscal.cdsNotaFiscal_ItensID.AsInteger;
              fDMCadNotaFiscal.cdsNotaFiscal_TamITEM.AsInteger   := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;
              fDMCadNotaFiscal.cdsNotaFiscal_TamTAMANHO.AsString := fDMInformar_Tam.mTamanhoTamanho.AsString;
              fDMCadNotaFiscal.cdsNotaFiscal_TamQTD.AsFloat      := 0;
              fDMCadNotaFiscal.cdsNotaFiscal_TamID_PEDIDO.AsInteger   := 0;
              fDMCadNotaFiscal.cdsNotaFiscal_TamITEM_PEDIDO.AsInteger := 0;
            end;
          end;
          if fDMCadNotaFiscal.cdsNotaFiscal_Tam.State in [dsEdit,dsInsert] then
          begin
            fDMCadNotaFiscal.cdsNotaFiscal_TamQTD.AsFloat := StrToFloat(FormatFloat('0.000',fDMInformar_Tam.mTamanhoQtd.AsFloat));
            fDMCadNotaFiscal.cdsNotaFiscal_Tam.Post;
          end;
          fDMInformar_Tam.mTamanho.Next;
        end;
        fDMCadNotaFiscal.cdsNotaFiscal_Tam.First;
        while not fDMCadNotaFiscal.cdsNotaFiscal_Tam.Eof do
        begin
          if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_TamQTD.AsFloat)) <= 0 then
            fDMCadNotaFiscal.cdsNotaFiscal_Tam.Delete
          else
            fDMCadNotaFiscal.cdsNotaFiscal_Tam.Next;
        end;
      end;
    end
    else
    if (fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVOU_TAB_TAMANHO.AsString <> 'S') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVOU_TAB_TAMANHO.IsNull) then
    begin
      //Tamanho aqui  30/08/2017
      if fDMCadNotaFiscal.qParametros_ProdUSA_TAM_INDIVIDUAL.AsString = 'S' then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString + ' TAM. ' + fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString
      else
      if (fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') and (fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S')  then
      begin
        //if vNotaSelecionada then
        //  fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString + ' TAM. ' + fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString
        //else
        if (fDMCadNotaFiscal.vState_Item = 'E') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger > 0) or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO_FUT.AsInteger > 0) or
           (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NTE.AsInteger > 0) then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString + ' TAM. ' + fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString
        else
        begin
          prc_Gravar_mItens;
          fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString + ' TAM. ' + fDMInformar_Tam.vTamanho_Ini;
          fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString      := fDMInformar_Tam.vTamanho_Ini;
          fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat           := fDMInformar_Tam.vQtd_Ini;
          fDMCadNotaFiscal.cdsNotaFiscal_ItensQTDRESTANTE.AsFloat   := fDMInformar_Tam.vQtd_Ini;
          //14/08/2020
          //if (fDMCadNotaFiscal.cdsCFOPUSA_UNIDADE_TRIB.AsString = 'S') and (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE_TRIB.AsString) <> '') then
          if (fDMCadNotaFiscal.cdsCFOPUSA_UNIDADE_TRIB.AsString = 'S') then
          begin
            fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat * fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat));
            prc_Unidade_Trib
          end
          else
          begin   //13/08/2020
            fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE_TRIB.AsString     := '';
            fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_TRIB.AsFloat          := 0;
            fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO_TRIB.AsFloat := 0;
          end;
          //fDMCadNotaFiscal.cdsNotaFiscal_Itens
          vEditar := True;
        end;
      end;
    end;
    //*****

    fDMCadNotaFiscal.cdsNotaFiscal_Itens.Post;

    //27/09/2020
    if fDMCadNotaFiscal.cdsNotaFiscal_Desconto.RecordCount > 0 then
    begin
      //fDMCadNotaFiscal.cdsNotaFiscal_Desconto.First;
      //while not fDMCadNotaFiscal.cdsNotaFiscal_Desconto.Eof do
      //  fDMCadNotaFiscal.cdsNotaFiscal_Desconto.Delete;
    end;
    if not(vPedidoSelecionado) and not(vNotaSelecionada) then
    begin
      fDMCadNotaFiscal.cdsNotaFiscalPERC_DESCONTO.AsFloat := StrToFloat(FormatFloat('0.00',0));
      fDMCadNotaFiscal.cdsNotaFiscalVLR_DESCONTO.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_DESCONTO_ITENS.AsFloat));
    end;
    //*****************

    if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NTE.AsInteger > 0 then
      fDMCadNotaFiscal.prc_Ajustar_NDevolvida;

    //15/11/2015
    if (fDMCadNotaFiscal.cdsParametrosCONTROLAR_ESTOQUE_SAIDA.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString = 'S') then
    begin
      if fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString = 'S' then
        uCalculo_NotaFiscal.prc_Gravar_cdsNotaFiscal_ItensAux(fDMCadNotaFiscal)
      else
        fDMCadNotaFiscal.prc_Excluir_cdsNotaFiscal_ItensAux(fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger);
    end;
    //**********
    //26/05/2016
    if (fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVOU_TAB_TAMANHO.AsString <> 'S') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVOU_TAB_TAMANHO.IsNull) then
    begin
      if (fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') and (fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S') and
         (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger <= 0) and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO_FUT.AsInteger <= 0) then
      begin
        prc_Gravar_Tam;
        if fDMCadNotaFiscal.cdsParametrosCALCULAR_PESO_CONSUMO.AsString <> 'S' then
        begin
          fDMCadNotaFiscal.cdsTab_NCM.Close;
          fDMCadNotaFiscal.cdsTab_NCM.Open;
          prc_Calcular_Desconto_Novo(fDMCadNotaFiscal,False);
        end;
      end;
    end;

    vGravacao_Ok := True;
  except
    on E: exception do
    begin
      vGravacao_Ok := False;
      vFlagErro    := True;
      raise Exception.Create('Erro ao gravar, ' + E.Message);
    end;
  end;

  lblEstoque.Caption := '0';

  if (vNotaSelecionada) or (vPedidoSelecionado) or (Tag = 99) or (vValeSelecionado) or (vOSSelecionada) or (vSacolaSelecionada) or (vPedAmbiente) or (vRecNFSelecionado)  then
  begin
    vNotaSelecionada   := False;
    vPedidoSelecionado := False;
    vValeSelecionado   := False;
    vOSSelecionada     := False;
    vSacolaSelecionada := False;
    vPedAmbiente       := False;
    vRecNFSelecionado  := False;
    exit;
  end;
  fDMCadNotaFiscal.vID_Variacao := 0;

  if not vFlagErro then
  begin
    if vEditar then
      Close
    else
    begin
      fDMCadNotaFiscal.prc_Inserir_Itens;
      if pnlCod_Barras.Visible then
      begin
        Edit1.Clear;
        Edit1.SetFocus;
      end
      else
      begin
        if DBEdit15.Visible then
          DBEdit15.SetFocus
        else
        RxDBLookupCombo4.SetFocus;
      end;
    end;
  end;
end;

function TfrmCadNotaFiscal_Itens.fnc_Erro: Boolean;
var
  vMsgErro: String;
  vAux: Real;
begin
  //Verifica��o de erros para n�o deixar gravar o item
  Result := True;
  vMsgErro := '';
  if fDMCadNotaFiscal.cdsNotaFiscal_Itens.RecordCount > 990 then
    vMsgErro := vMsgErro + #13 + '*** M�ximo de itens permitido � 990!';
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger > 0 then
  begin
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger <> fDMCadNotaFiscal.cdsCFOPID.AsInteger then
      fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,[loCaseInsensitive]);
    if copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3' then
    begin
      if fDMCadNotaFiscal.cdsNotaFiscal_Imp.IsEmpty then
        vMsgErro := vMsgErro + #13 + '*** Adi��o n�o informada!'
      else
      if fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.IsEmpty then
        vMsgErro := vMsgErro + #13 + '*** Adi��o n�o informada!';
    end;
  end;
  if fDMCadNotaFiscal.cdsProdutoID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger then
    fDMCadNotaFiscal.cdsProduto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger <= 0 then
    vMsgErro := vMsgErro + #13 + '*** CFOP n�o informado!';
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger <= 0 then
    vMsgErro := vMsgErro + #13 + '*** Produto n�o informado!';
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString = '' then
    vMsgErro := vMsgErro + #13 + '*** Unidade n�o informada!';
  if (fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString <> 'N') and (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat)) <= 0) then
    vMsgErro := vMsgErro + #13 + '*** Quantidade n�o informada!';                         
  if (fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString <> 'N') and (StrToFloat(FormatFloat('0.0000000000',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat)) <= 0) then
    vMsgErro := vMsgErro + #13 + '*** Valor Unit�rio n�o informado!';
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger <= 0) or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.IsNull) then
    vMsgErro := vMsgErro + #13 + '*** NCM n�o informado!';
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '' then
    vMsgErro := vMsgErro + #13 + '*** Origem do produto n�o informado!';
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger <= 0 then
  if (fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString <> 'N') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger <= 0) then
    vMsgErro := vMsgErro + #13 + '*** CST ICMS n�o informada!';
  if (fDMCadNotaFiscal.cdsProdutoTIPO_REG.AsString <> 'N') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTIPI.AsInteger <= 0) then
    vMsgErro := vMsgErro + #13 + '*** CST IPI n�o informada!';
  if (fDMCadNotaFiscal.cdsParametrosUSA_GRADE.AsString = 'S') and (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString) = '') and
     (fDMCadNotaFiscal.cdsProdutoUSA_GRADE.AsString = 'S') and
     (fDMCadNotaFiscal.vState_Item = 'E') and (fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVOU_TAB_TAMANHO.AsString = 'N')  then
    vMsgErro := vMsgErro + #13 + '*** Tamanho n�o informado!';
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_MOVESTOQUE_PED.AsInteger > 0) and (fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString = 'S') then
    vMsgErro := vMsgErro + #13 + '*** Estoque j� foi descontado no pedido!';
  if (fDMCadNotaFiscal.qParametros_ProdUSA_DESC_MAXIMO.AsString = 'S') and
     (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DESCONTO.AsFloat)) <= StrToFloat(FormatFloat('0.00',0))) and
     (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DESCONTO.AsFloat)) > StrToFloat(FormatFloat('0.00',0))) then
  begin
    vAux := StrToFloat(FormatFloat('0.00',(fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DESCONTO.AsFloat / fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat) * 100));
    if StrToFloat(FormatFloat('0.00',vAux)) > StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsProdutoPERC_DESC_MAX.AsFloat)) then
      vMsgErro := vMsgErro + #13 + '*** % Desconto informado maior que o m�ximo de ' + FormatFloat('0.00##',fDMCadNotaFiscal.cdsProdutoPERC_DESC_MAX.AsFloat) + ', que est� informado no produto!';
  end;
  //07/03/2019
  if (pnlCor.Visible) and (fDMCadNotaFiscal.cdsCombinacao.Active) and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger <= 0) then
  begin
    if fDMCadNotaFiscal.cdsCombinacao.RecordCount > 0 then
      vMsgErro := vMsgErro + #13 + '*** Produto n�o informado a COR!';
  end;
  //**********************

  if vMsgErro <> '' then
  begin
    MessageDlg(vMsgErro, mtError, [mbOk], 0);
    exit;
  end;
  Result := False;
end;

procedure TfrmCadNotaFiscal_Itens.BitBtn4Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclus�o/altera��o?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  fDMCadNotaFiscal.vID_Variacao := 0;
  Close;
end;

procedure TfrmCadNotaFiscal_Itens.SpeedButton1Click(Sender: TObject);
begin
  ffrmCadProduto := TfrmCadProduto.Create(self);
  ffrmCadProduto.ShowModal;

  FreeAndNil(ffrmCadProduto);

  SpeedButton4Click(sender);
end;

procedure TfrmCadNotaFiscal_Itens.SpeedButton4Click(Sender: TObject);
begin
  fDMCadNotaFiscal.cdsProduto.Close;
  //03/07/2019 ajustado para filstrar por tabela de pre�o
  if (fDMCadNotaFiscal.cdsParametrosUSA_PRODUTO_CLIENTE.AsString = 'S') or (fDMCadNotaFiscal.cdsParametrosUSA_PRODUTO_CLIENTE.AsString = 'G') or
     (fDMCadNotaFiscal.qParametros_ProdUSA_PRODUTO_FILIAL.AsString = 'S') or (fDMCadNotaFiscal.qParametros_ProdMOSTRA_PROD_TPRECO.AsString = 'S') then
    fDMCadNotaFiscal.prc_Filtrar_Produto_Cliente(False)
  else
    fDMCadNotaFiscal.cdsProduto.Open;
  //****************
end;

procedure TfrmCadNotaFiscal_Itens.SpeedButton2Click(Sender: TObject);
begin
  ffrmCadUnidade := TfrmCadUnidade.Create(self);
  ffrmCadUnidade.ShowModal;

  FreeAndNil(ffrmCadUnidade);

  SpeedButton6Click(Sender);
end;

procedure TfrmCadNotaFiscal_Itens.SpeedButton3Click(Sender: TObject);
begin
  ffrmCadCFOP := TfrmCadCFOP.Create(self);
  ffrmCadCFOP.ShowModal;

  FreeAndNil(ffrmCadCFOP);

  SpeedButton5Click(Sender);
end;

procedure TfrmCadNotaFiscal_Itens.SpeedButton5Click(Sender: TObject);
begin
  fDMCadNotaFiscal.cdsCFOP.Close;
  fDMCadNotaFiscal.cdsCFOP.Open;
  fDMCadNotaFiscal.cdsCFOP_Variacao.Close;
  fDMCadNotaFiscal.cdsCFOP_Variacao.Open;
  if RxDBLookupCombo1.Text <> '' then
  begin
    fDMCadNotaFiscal.cdsCFOP.Locate('ID',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
    if RxDBLookupCombo6.Text <> '' then
      fDMCadNotaFiscal.cdsCFOP_Variacao.Locate('ITEM',RxDBLookupCombo6.KeyValue,[loCaseInsensitive]);
  end;
end;

procedure TfrmCadNotaFiscal_Itens.SpeedButton6Click(Sender: TObject);
begin
  fDMCadNotaFiscal.cdsUnidade.Close;
  fDMCadNotaFiscal.cdsUnidade.Open;
end;

procedure TfrmCadNotaFiscal_Itens.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F10) then
    BitBtn4Click(Sender)
  else
  if (Key = Vk_F7) then
    BitBtn1Click(Sender);
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo1Enter(Sender: TObject);
begin
  fDMCadNotaFiscal.cdsCFOP.IndexFieldNames := 'CODCFOP';
end;

procedure TfrmCadNotaFiscal_Itens.FormCreate(Sender: TObject);
begin
  vNotaSelecionada   := False;
  vPedidoSelecionado := False;
  vValeSelecionado   := False;
  vOSSelecionada     := False;
  vSacolaSelecionada := False;
  vPedAmbiente       := False;
  vRecNFSelecionado  := False;
  fDMInformar_Tam := TDMInformar_Tam.Create(Self);
end;

procedure TfrmCadNotaFiscal_Itens.Panel5Exit(Sender: TObject);
var
  vFinalidadeAux: String;
  vID_VariacaoAux: Integer;
  vID_CFOPAux: Integer;
  vAux : String;
begin
  //fDMCadNotaFiscal.vID_Variacao := 0;
  //07/03/2019
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger <> vID_Produto_Ant then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger := 0;
  ///***********

  vID_CFOPAux := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger;
  if fDMCadNotaFiscal.cdsClienteCODIGO.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger then
    fDMCadNotaFiscal.cdsCliente.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,[loCaseInsensitive]);
  vFinalidadeAux := fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString;
  if trim(vFinalidadeAux) = '' then
    vFinalidadeAux := 'O';
  if not fDMCadNotaFiscal.cdsProduto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]) then
    exit;
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_OPERACAO_NOTA.AsInteger <> vID_OperacaoAnt) or
     (fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString <> vFinalidadeAnt) then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger := 0;

  if ((fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger <= 0) or (vID_Produto_Ant <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger))
    and (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_OPERACAO_NOTA.AsInteger > 0) then
  begin
    uCalculo_NotaFiscal.prc_Posicionar_Regra_Empresa(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_OPERACAO_NOTA.AsInteger,vFinalidadeAux,False);
    if (fDMCadNotaFiscal.vID_CFOP <= 0) and (vID_CFOPAux > 0) then
      fDMCadNotaFiscal.vID_CFOP := vID_CFOPAux;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger := fDMCadNotaFiscal.vID_CFOP;
  end;

  if fDMCadNotaFiscal.vID_CFOP > 0 then
  begin
    RxDBLookupCombo1.KeyValue := fDMCadNotaFiscal.vID_CFOP;
    if fDMCadNotaFiscal.vID_Variacao > 0 then
      RxDBLookupCombo6.KeyValue := fDMCadNotaFiscal.vID_Variacao;
    RxDBLookupCombo1Exit(Sender);
  end;
  prc_Abrir_Combinacao;

  //27/08/2019
  //if fDMCadNotaFiscal.cdsParametrosGRAVAR_CONSUMO_NOTA.AsString = 'S' then
  //begin
    if (fDMCadNotaFiscal.cdsClienteUF.AsString = fDMCadNotaFiscal.cdsFilialUF.AsString) and (fDMCadNotaFiscal.cdsProdutoID_CFOP_NFCE.AsInteger > 0) then
    begin
      if (fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger <= 0) then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger := fDMCadNotaFiscal.cdsProdutoID_CFOP_NFCE.AsInteger
      else
      if (fDMCadNotaFiscal.cdsProdutoID_CFOP_NFCE.AsInteger > 0) then
      begin
        if fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger > 0 then
          fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger,[loCaseInsensitive]);
        if ((fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '5101') or (fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '5102'))
           and (fDMCadNotaFiscal.cdsProdutoID_CFOP_NFCE.AsInteger > 0) then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger := fDMCadNotaFiscal.cdsProdutoID_CFOP_NFCE.AsInteger;
      end;
    end;
  //end;

  //29/08/2019
    if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger <> vID_Produto_Ant) and (fDMCadNotaFiscal.qParametros_NFeUSA_REGRA_CLI_PROD.AsString = 'S') then
    begin
      //dbckDraw.Visible := uUtilPadrao.fnc_existe_Drawback(fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger);
      vAux := uUtilPadrao.fnc_existe_Drawback(fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger);
      if (copy(vAux,1,1) = 'S') or (copy(vAux,2,1) = 'S') then
        dbckDraw.Visible := True
      else
        dbckDraw.Visible := False;
      if (copy(vAux,2,1) = 'S') then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensDRAWBACK.AsString := 'S'
      else
        fDMCadNotaFiscal.cdsNotaFiscal_ItensDRAWBACK.AsString := 'N';
    end;
  //*************************
end;

procedure TfrmCadNotaFiscal_Itens.Panel1Exit(Sender: TObject);
var
  vAux: String;
begin
  vID_ICMS_Original := 0;
  vPreco_Ori        := 0;
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger < 1) or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger < 1) then
    exit;
  if (fDMCadNotaFiscal.vState_Item = 'I') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger <> vCodProdutoAnt) or
     (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger <> vID_CFOPAnt) or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger <> vID_VariacaoAnt) then
    prc_Move_Dados_Itens
  else
  begin
    vID_ICMS_Original := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger;
    vPreco_Ori := fnc_Busca_Preco_Orig;
  end;
  vAux := RxDBLookupCombo1.Text;
  Label37.Visible           := (copy(vAux,1,1) = '3');
  RxDBLookupCombo10.Visible := (copy(vAux,1,1) = '3');
end;

procedure TfrmCadNotaFiscal_Itens.SpeedButton7Click(Sender: TObject);
begin
  ffrmCadNCM := TfrmCadNCM.Create(self);
  ffrmCadNCM.ShowModal;

  FreeAndNil(ffrmCadNCM);

  SpeedButton8Click(Sender);
end;

procedure TfrmCadNotaFiscal_Itens.SpeedButton8Click(Sender: TObject);
begin
  fDMCadNotaFiscal.cdsTab_NCM.Close;
  fDMCadNotaFiscal.cdsTab_NCM.Open;
end;

function TfrmCadNotaFiscal_Itens.fnc_Gerar_Cofins: Boolean;
begin
  Result := False;
  if fDMCadNotaFiscal.cdsTab_Cofins.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger,[loCaseInsensitive]) then
  begin
    if fDMCadNotaFiscal.cdsTab_CofinsGERAR.AsString = 'S' then
      Result := True;
  end;
end;

function TfrmCadNotaFiscal_Itens.fnc_Gerar_PIS: Boolean;
begin
  Result := False;                                                    
  if fDMCadNotaFiscal.cdsTab_PIS.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger,[loCaseInsensitive]) then
  begin
    if fDMCadNotaFiscal.cdsTab_PisGERAR.AsString = 'S' then
      Result := True;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo4Enter(Sender: TObject);
begin
  if fDMCadNotaFiscal.cdsProduto.IndexFieldNames <> 'REFERENCIA' then
    fDMCadNotaFiscal.cdsProduto.IndexFieldNames := 'REFERENCIA';
  prc_Mover_Finalidade;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Mover_Finalidade;
begin
  //08/10/2018  Tirado porque a Finalidade � a do comprador e n�o a da fabrica��o do produto 
  {if (fDMCadNotaFiscal.vState_Item = 'I') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger <> vCodProdutoAnt) then
  begin
    if (trim(fDMCadNotaFiscal.cdsNotaFiscalFINALIDADE.AsString) = '') or (fDMCadNotaFiscal.cdsNotaFiscalFINALIDADE.IsNull) then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString := fDMCadNotaFiscal.cdsProdutoTIPO_VENDA.AsString;
  end;}
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo2Enter(Sender: TObject);
begin
  fDMCadNotaFiscal.cdsProduto.IndexFieldNames := 'NOME';
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo4Change(Sender: TObject);
begin
  if trim(RxDBLookupCombo4.Text) <> '' then
    prc_Estoque(RxDBLookupCombo4.KeyValue);
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo11Exit(Sender: TObject);
var
  vIDAux: Integer;
  vCodAux : String;
begin
  vIDAux := 0;
  if RxDBLookupCombo11.Text <> '' then
    vIDAux := RxDBLookupCombo11.KeyValue;
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger <> fDMCadNotaFiscal.cdsTab_CSTICMSID.AsInteger then
    fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger,[loCaseInsensitive]);
  if fDMCadNotaFiscal.cdsClienteCODIGO.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger then
   fDMCadNotaFiscal.cdsCliente.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,[loCaseInsensitive]);
  prc_Habilitar_Desoneracao(fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString);
  fDMCadNotaFiscal.prc_Abrir_Desoneracao(fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString);

  if vID_CSTICMAnt <> vIDAux then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := fDMCadNotaFiscal.cdsTab_CSTICMSPERCENTUAL.AsFloat;
    if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51' then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat := fDMCadNotaFiscal.cdsTab_CSTICMSPERC_DIFERIMENTO.AsFloat;
      if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat)) > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := 100;
    end
    else
    begin
      if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '900' then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat := fDMCadNotaFiscal.cdsTab_CSTICMSPERC_DIFERIMENTO.AsFloat
      else
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat := 0;
      //11/11/2015
      uCalculo_NotaFiscal.prc_Abrir_qProduto_UF(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,fDMCadNotaFiscal.cdsClienteUF.AsString);
      if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat)) > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat;
      //*****
    end;
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger <> fDMCadNotaFiscal.cdsCFOPID.AsInteger then
      fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger,[loCaseInsensitive]);
    if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') and (fDMCadNotaFiscal.cdsCFOPGERAR_DESONERACAO_ICMS.AsString = 'S') then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_DESONERACAO.AsInteger := fDMCadNotaFiscal.cdsTab_CSTICMSCOD_DESONERACAO.AsInteger
    else
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_DESONERACAO.AsInteger := 0;

  end;
  if fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S' then
    DBEdit14.ReadOnly := (fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '00');
  if fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString <> 'S' then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat := StrToFloat(FormatFloat('0.00',100));
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat    := StrToFloat(FormatFloat('0.00',0));
  end;

  Label48.Visible  := ((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51') and (fDMCadNotaFiscal.cdsParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S'));
  DBEdit26.Visible := ((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51') and (fDMCadNotaFiscal.cdsParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S'));
  Label49.Visible  := ((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51') and (fDMCadNotaFiscal.cdsParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S'));
  Label55.Visible   := (((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51') or ((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '900')))  and (fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString = 'S'));
  DBEdit30.Visible  := (((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51') or ((fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '900')))  and (fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString = 'S'));

  //26/03/2020
  if vID_CSTICMAnt <> vIDAux then
  begin
    vCodAux := fnc_Buscar_CBenef_CSTICMS(fDMCadNotaFiscal);
    if trim(vCodAux) <> '' then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensCOD_CBENEF.AsString := vCodAux;
  end;
  //*************************
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo1Exit(Sender: TObject);
var
  vAux: String;
  vID_VariacaoAux: Integer;
begin
  vAux := RxDBLookupCombo1.Text;
  if (trim(vAux) <> '') and (copy(vAux,1,1) = '3') then
    TabSheet3.TabVisible := True
  else
    TabSheet3.TabVisible := False;
  if RxDBLookupCombo1.Text <> '' then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString := RxDBLookupCombo1.Text;
    vID_VariacaoAux := fnc_Buscar_Regra_CFOP(fDMCadNotaFiscal, fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger);
    if vID_VariacaoAux > 0 then
    begin
      fDMCadNotaFiscal.vID_Variacao := vID_VariacaoAux;
      RxDBLookupCombo6.KeyValue     := vID_VariacaoAux;
    end;
    if (fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger <= 0) then
      TS_DrawBack.TabVisible := (((copy(RxDBLookupCombo1.Text,1,1) = '3') or (copy(RxDBLookupCombo1.Text,1,1) = '7')));
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo1Change(Sender: TObject);
var
  vAux: String;
begin
  vAux := RxDBLookupCombo1.Text;
  if (trim(vAux) <> '') and (copy(vAux,1,1) = '3') then
    TabSheet3.TabVisible := True
  else
    TabSheet3.TabVisible := False;
end;

procedure TfrmCadNotaFiscal_Itens.BitBtn3Click(Sender: TObject);
var
  vItemAux: Integer;
begin
  fDMCadNotaFiscal.cdsNotaFiscal_Imp.Last;
  vItemAux := fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM_IMP.AsInteger;
  vItemAux := vItemAux + 1;

  fDMCadNotaFiscal.cdsNotaFiscal_Imp.Insert;
  fDMCadNotaFiscal.cdsNotaFiscal_ImpID.AsInteger       := fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM.AsInteger     := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM_IMP.AsInteger := vItemAux;

  ffrmCadNotaFiscal_Itens_Imp := TfrmCadNotaFiscal_Itens_Imp.Create(self);
  ffrmCadNotaFiscal_Itens_Imp.fDMCadNotaFiscal := fDMCadNotaFiscal;
  ffrmCadNotaFiscal_Itens_Imp.ShowModal;

  FreeAndNil(ffrmCadNotaFiscal_Itens_Imp);
end;

procedure TfrmCadNotaFiscal_Itens.BitBtn5Click(Sender: TObject);
begin
  if fDMCadNotaFiscal.cdsNotaFiscal_Imp.IsEmpty then
    exit;

  fDMCadNotaFiscal.cdsNotaFiscal_Imp.Edit;

  ffrmCadNotaFiscal_Itens_Imp := TfrmCadNotaFiscal_Itens_Imp.Create(self);
  ffrmCadNotaFiscal_Itens_Imp.fDMCadNotaFiscal := fDMCadNotaFiscal;
  ffrmCadNotaFiscal_Itens_Imp.ShowModal;

  FreeAndNil(ffrmCadNotaFiscal_Itens_Imp);
end;

procedure TfrmCadNotaFiscal_Itens.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir os dados da importa��o?',mtWarning,[mbOK,mbNO],0) = mrNO then
    exit;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.First;
  while not fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Eof do
    fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Delete;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp.Delete;
end;

procedure TfrmCadNotaFiscal_Itens.pnlCFOPExit(Sender: TObject);
begin
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger > 0) and
    not(fDMCadNotaFiscal.fnc_verificar_CFOP(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger)) then
  begin
    if trim(fDMCadNotaFiscal.vMSGNotaFiscal) <> '' then
    begin
      MessageDlg(fDMCadNotaFiscal.vMSGNotaFiscal, mtError, [mbOk], 0);
      fDMCadNotaFiscal.vMSGNotaFiscal := '';
      RxDBLookupCombo1.SetFocus;
    end;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.rxdbOperacaoChange(Sender: TObject);
begin
  if rxdbOperacao.Text <> '' then
  begin
    fDMCadNotaFiscal.cdsOperacao_Nota.Locate('ID',rxdbOperacao.KeyValue,[loCaseInsensitive]);
    rxcbFinalidade.Visible := (fDMCadNotaFiscal.cdsOperacao_NotaPEDIR_FINALIDADE.AsString = 'S');
    lblFinalidade.Visible  := (fDMCadNotaFiscal.cdsOperacao_NotaPEDIR_FINALIDADE.AsString = 'S');
    if not rxcbFinalidade.Visible then
    begin
      rxcbFinalidade.ItemIndex := 3;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensFINALIDADE.AsString := 'O';
    end;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo11Enter(Sender: TObject);
begin
  vID_CSTICMAnt := 0;
  if RxDBLookupCombo11.Text <> '' then
    vID_CSTICMAnt := RxDBLookupCombo11.KeyValue;
end;

procedure TfrmCadNotaFiscal_Itens.Edit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (Trim(Edit1.Text) <> '') then
  begin
    if not fnc_Verificar_Cod_Barras then
      MessageDlg('*** C�digo de Barras n�o encontrado!', mtError, [mbOk], 0)
    else
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger := fDMCadNotaFiscal.cdsProdutoID.AsInteger;
      if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger > 0 then
      begin
        RxDBLookupCombo1Exit(Sender);
        if pnlCor.Visible then
          RxDBLookupCombo14.SetFocus
        else
          DBEdit2.SetFocus;
      end
      else
        RxDBLookupCombo1.SetFocus;
    end;
  end;
end;

function TfrmCadNotaFiscal_Itens.fnc_Verificar_Cod_Barras: Boolean;
begin
  Result := False;
  if fDMCadNotaFiscal.cdsProduto.Locate('COD_BARRA',Edit1.Text,[loCaseInsensitive]) then
    Result := True;
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit15KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (Trim(DBEdit15.Text) <> '') then
  begin
    if not fnc_Verificar_Produto then
      MessageDlg('*** C�digo do produto n�o encontrado!', mtError, [mbOk], 0)
    else
    begin
      //fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger := fDMCadNotaFiscal.cdsProdutoID.AsInteger;
      if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger > 0 then
      begin
        if pnlCor.Visible then
          RxDBLookupCombo14.SetFocus
        else
          DBEdit2.SetFocus;
      end
      else
        RxDBLookupCombo1.SetFocus;
    end;
  end
  else
  if (Key = Vk_F2) then
    prc_Chama_Form_Produto
  else
  if (Key = Vk_F3) then
    prc_Chama_Form_TabPreco;
end;

function TfrmCadNotaFiscal_Itens.fnc_Verificar_Produto: Boolean;
begin
  Result := False;
  if fDMCadNotaFiscal.cdsProduto.Locate('ID',DBEdit15.Text,[loCaseInsensitive]) then
  begin
    if fDMCadNotaFiscal.cdsProdutoINATIVO.AsString = 'N' then
      Result := True;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.DBMemo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) or (Key = #10) then
    Key := ' ';
end;

procedure TfrmCadNotaFiscal_Itens.btnGradeClick(Sender: TObject);
begin
  ffrmInformar_Tam := TfrmInformar_Tam.Create(self);
  ffrmInformar_Tam.fDMInformar_Tam := fDMInformar_Tam;
  ffrmInformar_Tam.fDMInformar_Tam.prc_Le_Produto_Tam(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger);
  if not fDMCadNotaFiscal.cdsNotaFiscal_Tam.IsEmpty then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_Tam.First;
    while not fDMCadNotaFiscal.cdsNotaFiscal_Tam.Eof do
    begin
      if fDMInformar_Tam.mTamanho.Locate('Tamanho',fDMCadNotaFiscal.cdsNotaFiscal_TamTAMANHO.AsString,[loCaseInsensitive]) then
        fDMInformar_Tam.mTamanho.Edit
      else
      begin
        fDMInformar_Tam.mTamanho.Insert;
        fDMInformar_Tam.mTamanhoTamanho.AsString := fDMCadNotaFiscal.cdsNotaFiscal_TamTAMANHO.AsString;
      end;
      fDMInformar_Tam.mTamanhoQtd.AsFloat := StrToFloat(FormatFloat('0.000',fDMCadNotaFiscal.cdsNotaFiscal_TamQTD.AsFloat));
      fDMInformar_Tam.mTamanho.Post;
      fDMCadNotaFiscal.cdsNotaFiscal_Tam.Next;
    end;
  end;
  ffrmInformar_Tam.ShowModal;
  if fDMInformar_Tam.vGravar = 'S' then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat := fDMInformar_Tam.vQtd_Grade;
  prc_Calcular_VlrItens;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Gravar_Tam;
var
  x: Integer;
  vItemAux: Integer;
begin
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger <> fDMCadNotaFiscal.cdsCFOPID.AsInteger then
    fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,[loCaseInsensitive]);

  fDMInformar_Tam.mItens.First;
  fDMInformar_Tam.mTamanho.First;
  while not fDMInformar_Tam.mTamanho.Eof do
  begin
    if (fDMInformar_Tam.mTamanhoTamanho.AsString <> fDMInformar_Tam.vTamanho_Ini) and (StrToFloat(FormatFloat('0.0000',fDMInformar_Tam.mTamanhoQtd.AsFloat)) > 0) then
    begin
      fDMCadNotaFiscal.prc_Inserir_Itens(False);
      for x := 0 to (fDMInformar_Tam.mItens.FieldCount - 1) do
      begin
        try
          if (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'ID') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Item') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Nome_Produto_Original') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'QTD_RESTANTE') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Obs') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'ID_Atelier') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Vlr_Unitario_Atelier') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'VLR_TOTAL_ATELIER') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'DT_ENVIO_ATELIER') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'NomeProduto') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Qtd_Cancelado') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Qtd_Restante') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Qtd_Faturado') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Cancelado') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'DtEntrega')  and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Faturado') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'DtFaturado') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Cod_Produto_Cliente') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Tipo') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'NumOS') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'BASE_ICMSTRANSF') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'PERC_TRANSF') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'VLR_TRANSF')  and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'ID_CONFIG_CFOP') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'QTD_AFATURAR')  and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'DT_RETORNO_ATELIER') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'VLR_PAGTO_ATELIER') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'DT_PAGTO_ATELIER') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Aprovado_Orc')  and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'MOTIVO_NAO_APROV') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'DTAPROVADO_NAO') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'ID_ORCAMENTO') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'ITEM_ORCAMENTO') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'QTD_LIBERADA') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'QTD_PRODUZIDA') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'PERC_ICMSSIMPLES') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'GERAR_LOTE')    and (UpperCase(fDMInformar_Tam.mItens.Fields[x].FieldName) <> 'CARIMBO') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'DTPRODUCAO')    and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'NUM_LOTE')      and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'TIPO_ORCAMENTO') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'End_Foto')      and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'QTD_PECA') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'QTD_FUT')       and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'PERC_TRIBUTO') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'CALCULAR_ST')   and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'COMPLEMENTO_PROD') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'PRECO_CUSTO')   and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'PERC_MARGEM') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'PERC_MARGEM2')  and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'OBS_ETIQUETA') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'OBSMATERIAL')   and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'ENCERADO')  and

             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'ATUALIZA_PRECO_CUSTO')   and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Fabrica')  and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Item_Tam')   and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'UNIDADE_PROD')  and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'Caixinha')   and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'TIPO_OS')  and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'CONV_UNIDADE') and (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'QTD_SOBRA_OC') and
             (fDMInformar_Tam.mItens.Fields[x].FieldName <> 'VLR_UNITARIO_IPI') then
            fDMCadNotaFiscal.cdsNotaFiscal_Itens.FieldByName(fDMInformar_Tam.mItens.Fields[x].FieldName).AsVariant := fDMInformar_Tam.mItens.Fields[x].Value;
        except
        end;
      end;

      fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString := fDMInformar_Tam.mItensNome_Produto_Original.AsString + ' TAM. ' + fDMInformar_Tam.mTamanhoTamanho.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString      := fDMInformar_Tam.mTamanhoTamanho.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat           := fDMInformar_Tam.mTamanhoQtd.AsFloat;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensQTDRESTANTE.AsFloat   := fDMInformar_Tam.mTamanhoQtd.AsFloat;

      //14/08/2020
      //if (fDMCadNotaFiscal.cdsCFOPUSA_UNIDADE_TRIB.AsString = 'S') and (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE_TRIB.AsString) <> '') then
      if (fDMCadNotaFiscal.cdsCFOPUSA_UNIDADE_TRIB.AsString = 'S') then
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat * fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat));
        prc_Unidade_Trib;
      end
      else
      begin   //13/08/2020
        fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE_TRIB.AsString     := '';
        fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_TRIB.AsFloat          := 0;
        fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO_TRIB.AsFloat := 0;
      end;  

      fDMCadNotaFiscal.cdsNotaFiscal_Itens.Post;

      fDMInformar_Tam.mNotaFiscal_Imp.First;
      while not fDMInformar_Tam.mNotaFiscal_Imp.Eof do
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_Imp.Last;
        vItemAux := fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM_IMP.AsInteger;
        vItemAux := vItemAux + 1;

        fDMCadNotaFiscal.cdsNotaFiscal_Imp.Insert;
        fDMCadNotaFiscal.cdsNotaFiscal_ImpID.AsInteger       := fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger;
        fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM.AsInteger     := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;
        fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM_IMP.AsInteger := vItemAux;
        for x := 0 to (fDMInformar_Tam.mNotaFiscal_Imp.FieldCount - 1) do
        begin
          try
            if (fDMInformar_Tam.mNotaFiscal_Imp.Fields[x].FieldName <> 'ID') and (fDMInformar_Tam.mNotaFiscal_Imp.Fields[x].FieldName <> 'Item') and
               (fDMInformar_Tam.mNotaFiscal_Imp.Fields[x].FieldName <> 'Item_Imp') then
              fDMCadNotaFiscal.cdsNotaFiscal_Imp.FieldByName(fDMInformar_Tam.mNotaFiscal_Imp.Fields[x].FieldName).AsVariant := fDMInformar_Tam.mNotaFiscal_Imp.Fields[x].Value;
          except
          end;
        end;
        fDMCadNotaFiscal.cdsNotaFiscal_Imp.Post;

        fDMInformar_Tam.mNotaFiscal_Imp_AD.First;
        while not fDMInformar_Tam.mNotaFiscal_Imp_AD.Eof do
        begin
          fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Last;
          //vItemAux := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdITEM_AD.AsInteger;
          //vItemAux := vItemAux + 1;

          fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Insert;
          fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdID.AsInteger       := fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger;
          fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdITEM.AsInteger     := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;
          fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdITEM_IMP.AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM_IMP.AsInteger;
          for x := 0 to (fDMInformar_Tam.mNotaFiscal_Imp_AD.FieldCount - 1) do
          begin
            try
              if (fDMInformar_Tam.mNotaFiscal_Imp_AD.Fields[x].FieldName <> 'ID') and (fDMInformar_Tam.mNotaFiscal_Imp_AD.Fields[x].FieldName <> 'Item') and
                 (fDMInformar_Tam.mNotaFiscal_Imp_AD.Fields[x].FieldName <> 'Item_Imp') then
                fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.FieldByName(fDMInformar_Tam.mNotaFiscal_Imp_AD.Fields[x].FieldName).AsVariant := fDMInformar_Tam.mNotaFiscal_Imp_AD.Fields[x].Value;
            except
            end;
          end;
          fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Post;
          fDMInformar_Tam.mNotaFiscal_Imp_AD.Next;
        end;
        fDMInformar_Tam.mNotaFiscal_Imp.Next;
      end;
    end;
    fDMInformar_Tam.mTamanho.Next;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Gravar_mItens;
var
  x: Integer;
begin
  fDMInformar_Tam.mItens.EmptyDataSet;
  fDMInformar_Tam.mPedido_Cli.EmptyDataSet;

  fDMInformar_Tam.mItens.Insert;
  for x := 0 to (fDMCadNotaFiscal.cdsNotaFiscal_Itens.FieldCount - 1) do
  begin
    if (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'sdsNotaFiscal_Ped') and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'sdsNotaFiscal_NDevolvida') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'sdsNotaFiscal_Imp') and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'sdsNotaFiscal_DrawBack') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'sdsNotaFiscal_Fut') and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'sdsNotaFiscal_OS') and
       //(fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'NOME_COR_COMBINACAO') and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'QTD_DESC_ESTOQUE') then
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'QTD_DESC_ESTOQUE')  and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'QTD_LANCAR_ESTOQUE') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PERC_ICMS_FCP')  and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PERC_ICMS_UF_DEST') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PERC_ICMS_PARTILHA') and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_ICMS_FCP') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_ICMS_UF_DEST')   and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_ICMS_UF_REMET') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'GRAVOU_TAB_TAMANHO') and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'sdsNotaFiscal_Tam') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'ID_MOVESTOQUE_PED')  and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PERC_ICMS_DESON') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_PIS_COFINS_SUFRAMA') and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PERC_DESC_SUFRAMA') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_DESC_SUFRAMA')    and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_AFRMM') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PERC_ISSQN')          and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_ISSQN') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PRECO_CUSTO_TOTAL')   and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_AJUSTE_CUSTO') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'sdsNotaFiscal_Copia') and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_IPI_DEVOL')  and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PERC_DEVOL')          and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'BASE_IPI') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PERC_BASE_RED_EFET')  and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_BASE_EFET') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'PERC_ICMS_EFET')      and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'VLR_ICMS_EFET') and
       (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'ANP_PRODUTO')         and (fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName <> 'ANP_UF_CONS') then
      fDMInformar_Tam.mItens.FieldByName(fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].FieldName).AsVariant := fDMCadNotaFiscal.cdsNotaFiscal_Itens.Fields[x].Value;
  end;
  fDMInformar_Tam.mItensItem_original.AsInteger        := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;
  fDMInformar_Tam.mItensNome_Produto_Original.AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString;
  fDMInformar_Tam.mItens.Post;

  if not fDMCadNotaFiscal.cdsNotaFiscal_Imp.IsEmpty then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_Imp.First;
    while not fDMCadNotaFiscal.cdsNotaFiscal_Imp.Eof do
    begin
      fDMInformar_Tam.mNotaFiscal_Imp.Insert;
      for x := 0 to (fDMCadNotaFiscal.cdsNotaFiscal_Imp.FieldCount - 1) do
      begin
        if (fDMCadNotaFiscal.cdsNotaFiscal_Imp.Fields[x].FieldName <> 'sdsNotaFiscal_Imp_Ad') then
          fDMInformar_Tam.mNotaFiscal_Imp.FieldByName(fDMCadNotaFiscal.cdsNotaFiscal_Imp.Fields[x].FieldName).AsVariant := fDMCadNotaFiscal.cdsNotaFiscal_Imp.Fields[x].Value;
      end;
      fDMInformar_Tam.mNotaFiscal_Imp.Post;

      fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.First;
      while not fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Eof do
      begin
        fDMInformar_Tam.mNotaFiscal_Imp_AD.Insert;
        for x := 0 to (fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.FieldCount - 1) do
        begin
          fDMInformar_Tam.mNotaFiscal_Imp_Ad.FieldByName(fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Fields[x].FieldName).AsVariant := fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Fields[x].Value;
        end;
        fDMInformar_Tam.mNotaFiscal_Imp_AD.Post;
        fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Next;
      end;
      fDMCadNotaFiscal.cdsNotaFiscal_Imp.Next;
    end;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit4Exit(Sender: TObject);
begin
  DBCheckBox2.Visible := (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat)) > 0);
end;

procedure TfrmCadNotaFiscal_Itens.prc_Busca_IBPT;
var
  vComandoAux: String;
begin
  //24/10/2013
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger <> fDMCadNotaFiscal.cdsProdutoID.AsInteger then
    fDMCadNotaFiscal.cdsProduto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);
  if fDMCadNotaFiscal.cdsCFOPID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger then
    fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,[loCaseInsensitive]);

  fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_FEDERAL.AsFloat   := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_ESTADUAL.AsFloat  := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsNotaFiscal_ItensFONTE_TRIBUTO.Clear;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensVERSAO_TRIBUTO.Clear;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensIBPT_CHAVE.Clear;

  if (fDMCadNotaFiscal.cdsCFOPGERAR_TRIBUTO.AsString <> 'S') then
    exit;

  if (fDMCadNotaFiscal.cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString <> 'I') and (fDMCadNotaFiscal.cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString <> 'P') then
    exit;

  vComandoAux := '';  
  fDMCadNotaFiscal.qIBPT.Close;
  fDMCadNotaFiscal.qIBPT.SQL.Text := fDMCadNotaFiscal.ctqIBPT;
  if (fDMCadNotaFiscal.cdsParametrosTIPO_LEI_TRANSPARENCIA.AsString = 'P') then
  begin
    if fDMCadNotaFiscal.cdsCFOPTIPO_IND_VEN.AsString = 'V' then
      vComandoAux := 'WHERE I.CODIGO = ' + QuotedStr('COMERCIO')
    else
    if fDMCadNotaFiscal.cdsCFOPTIPO_IND_VEN.AsString = 'I' then
      vComandoAux := 'WHERE I.CODIGO = ' + QuotedStr('INDUSTRIA');
  end
  else
    vComandoAux := 'WHERE  N.ID = ' + IntToStr(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger)
                 + ' AND I.EX = ' + QuotedStr(fDMCadNotaFiscal.cdsProdutoNCM_EX.AsString);
  if trim(vComandoAux) = '' then
    exit;
  fDMCadNotaFiscal.qIBPT.SQL.Text := fDMCadNotaFiscal.qIBPT.SQL.Text + ' ' + vComandoAux;
  fDMCadNotaFiscal.qIBPT.Open;
  if not fDMCadNotaFiscal.qIBPT.IsEmpty then
  begin
    if (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '0') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '3') or
       (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '4') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '5') then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qIBPTPERC_NACIONAL.AsFloat))
    else
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qIBPTPERC_IMPORTACAO.AsFloat));
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_ESTADUAL.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qIBPTPERC_ESTADUAL.AsFloat));
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qIBPTPERC_MUNICIPAL.AsFloat));
    fDMCadNotaFiscal.cdsNotaFiscal_ItensFONTE_TRIBUTO.AsString         := fDMCadNotaFiscal.qIBPTFONTE.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensVERSAO_TRIBUTO.AsString        := fDMCadNotaFiscal.qIBPTVERSAO.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensIBPT_CHAVE.AsString            := fDMCadNotaFiscal.qIBPTCHAVE.AsString;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo5Enter(Sender: TObject);
begin
  fDMCadNotaFiscal.cdsTab_NCM.IndexFieldNames := 'NCM';
  vID_NCM_Ant := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo5Exit(Sender: TObject);
var
  vIDAux: Integer;
  vIDAux2: Integer;
begin
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger <> vID_NCM_Ant) then
  begin
    //Incluido 09/11/2015
    fDMCadNotaFiscal.qPessoa_Fiscal.Close;
    fDMCadNotaFiscal.qPessoa_Fiscal.ParamByName('CODIGO').AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger;
    fDMCadNotaFiscal.qPessoa_Fiscal.Open;
    //*************

    //30/06/2017   Feito para a Ciex quando for para Revenda na Zona Franca de Manaus
    if fDMCadNotaFiscal.cdsClienteCODIGO.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger then
      fDMCadNotaFiscal.cdsCliente.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,[loCaseInsensitive]);
    if (fDMCadNotaFiscal.qPessoa_FiscalID_CST_ICMS_SUFRAMA_ST.AsInteger > 0) and (fDMCadNotaFiscal.cdsTab_NCMGERAR_ST.AsString = 'S') and
       (fDMCadNotaFiscal.cdsClienteTIPO_CONSUMIDOR.AsInteger = 0) and ((fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '6109') or
       (fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '6110')) then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger := fDMCadNotaFiscal.qPessoa_FiscalID_CST_ICMS_SUFRAMA_ST.AsInteger;
    end
    else
    //********************

    if (fDMCadNotaFiscal.qPessoa_FiscalDESC_SUFRAMA_ICMS.AsString <> 'S') then // 09/11/2015
    begin
      vIDAux2 := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger;
      vIDAux := fnc_Busca_NCM_CST;
      //03/03/2018
      if fDMCadNotaFiscal.cdsCFOPID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger then
        fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,[loCaseInsensitive]);
      if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') and (fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString = 'S') then
      begin
        prc_Le_NCM_Geral;
        if (vIDAux <= 0) and (fDMCadNotaFiscal.cdsTab_NCMID_CST_ICMS.AsInteger > 0) then
          vIDAux := fDMCadNotaFiscal.cdsTab_NCMID_CST_ICMS.AsInteger;
      end;
      //**************************
      if vIDAux > 0 then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger := vIDAux
      else
        fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger := vID_ICMS_Original;
      if vIDAux2 <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger then
      begin
        if fDMCadNotaFiscal.cdsTab_CSTIcms.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger,([Locaseinsensitive])) then
        begin
          fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsTab_CSTICMSPERCENTUAL.AsFloat));
          if fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString = '51' then
          begin
            fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat := fDMCadNotaFiscal.cdsTab_CSTICMSPERC_DIFERIMENTO.AsFloat;
            if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DIFERIMENTO.AsFloat)) > 0 then
              fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := 100;
          end
          else
          begin
            //11/11/2015
            if fDMCadNotaFiscal.cdsClienteCODIGO.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger then
              fDMCadNotaFiscal.cdsCliente.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,([Locaseinsensitive]));
            uCalculo_NotaFiscal.prc_Abrir_qProduto_UF(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,fDMCadNotaFiscal.cdsClienteUF.AsString);
            if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat)) > 0 then
              fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat
            else  //03/03/2018
            if StrToFloat(FormatFloat('0.0000',vPerc_BRedICMS_NCM)) > 0 then
              fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat := StrToFloat(FormatFloat('0.0000',vPerc_BRedICMS_NCM));
            //******
          end;
        end;
      end;
    end;
  end;
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger <> vID_NCM_Ant) then
    prc_Busca_IBPT;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Le_Imp_Aux(Item: Integer);
var
  vItemAux: Integer;
  vExiste_Imp, vExiste_Imp_Ad: Boolean;
begin
  if not fDMCadNotaFiscal.cdsNotaFiscal_Imp_Aux.Locate('ID;ITEM',VarArrayOf([fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger,Item]),[locaseinsensitive]) then
    exit;
  vExiste_Imp    := False;
  vExiste_Imp_Ad := False;
  if fDMCadNotaFiscal.cdsNotaFiscal_Imp.Locate('NUMDI',fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxNUM_DI.AsString,[loCaseInsensitive]) then
  begin
    vExiste_Imp := True;
    if fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Locate('NUMADICAO;NUM_SEQ',VarArrayOf([fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxNUM_ADICAO.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxNUM_SEQ.AsInteger]),[locaseinsensitive]) then
      vExiste_Imp_Ad := True;
  end;
  if vExiste_Imp_Ad then
    exit;
  if (fDMCadNotaFiscal.cdsNotaFiscal_Imp.RecordCount > 0) and (fDMCadNotaFiscal.cdsNotaFiscal_Imp_Aux.RecordCount = 1) then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.First;
    while not fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Eof do
      fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Delete;
    fDMCadNotaFiscal.cdsNotaFiscal_Imp.Delete;
  end;

  if not vExiste_Imp then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_Imp.Last;
    vItemAux := fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM_IMP.AsInteger;
    fDMCadNotaFiscal.cdsNotaFiscal_Imp.Insert;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpID.AsInteger             := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxID.AsInteger;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM.AsInteger           := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM_IMP.AsInteger       := vItemAux + 1;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpNUMDI.AsString           := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxNUM_DI.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpDTREGISTRO.AsDateTime    := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxDTREGISTRO.AsDateTime;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpDTDESEMBARACO.AsDateTime := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxDTDESEMBARACO.AsDateTime;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpCODEXPORTADOR.AsString   := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxCOD_EXPORTADOR.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpUF.AsString              := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxUF.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpNUMFATURA.AsString       := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxNUM_FATURA.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpLOCAL_DESEMBARACO.AsString := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxLOCAL_DESEMBARACO.AsString;
    if fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxTIPO_VIA_TRANSPORTE.AsInteger > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ImpTIPO_VIA_TRANSORTE.AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxTIPO_VIA_TRANSPORTE.AsInteger;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpVLR_AFRMM.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxVLR_AFRMM.AsFloat));
    if fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxTIPO_INTERMEDIO.AsInteger > 0 then
      fDMCadNotaFiscal.cdsNotaFiscal_ImpTIPO_INTERMEDIO.AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxTIPO_INTERMEDIO.AsInteger;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpUF_TERCEIRO.AsString := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxUF_TERCEIRO.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ImpCNPJ.AsString        := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxCNPJ_TERCEIRO.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_Imp.Post;
  end;

  fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Last;
  vItemAux := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdITEM_AD.AsInteger;

  fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Insert;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdID.AsInteger            := fDMCadNotaFiscal.cdsNotaFiscal_ImpID.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdITEM.AsInteger          := fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdITEM_IMP.AsInteger      := fDMCadNotaFiscal.cdsNotaFiscal_ImpITEM_IMP.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdITEM_AD.AsInteger       := vItemAux + 1;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdNUMADICAO.AsInteger     := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxNUM_ADICAO.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdCODFABRICANTE.AsString  := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxCOD_FABRICANTE.AsString;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdVLR_DESCONTO_DI.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxVLR_DESCONTO_DI.AsFloat));
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdNUM_SEQ.AsInteger       := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxNUM_SEQ.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_AdNUM_DRAWBACK.AsString   := fDMCadNotaFiscal.cdsNotaFiscal_Imp_AuxNUM_DRAWBACK.AsString;
  fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Post;

  if fDMCadNotaFiscal.cdsNotaFiscal_Imp.State in [dsEdit,dsInsert] then
    fDMCadNotaFiscal.cdsNotaFiscal_Imp.Post;
end;

procedure TfrmCadNotaFiscal_Itens.gbxVendedorExit(Sender: TObject);
begin
  if trim(RxDBLookupCombo10.Text) <> '' then
  begin
    if fDMCadNotaFiscal.cdsNotaFiscal_Itens.State in [dsEdit,dsInsert] then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_Imp.First;
      while not fDMCadNotaFiscal.cdsNotaFiscal_Imp.Eof do
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.First;
        while not fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Eof do
          fDMCadNotaFiscal.cdsNotaFiscal_Imp_Ad.Delete;
        fDMCadNotaFiscal.cdsNotaFiscal_Imp.Delete;
      end;
      prc_Le_Imp_Aux(RxDBLookupCombo10.KeyValue);
    end;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.BitBtn6Click(Sender: TObject);
begin
  if trim(RxDBLookupCombo13.Text) <> '' then
    if fDMCadNotaFiscal.cdsNotaFiscal_Itens.State in [dsEdit,dsInsert] then
      prc_Le_Imp_Aux(RxDBLookupCombo13.KeyValue);
end;

procedure TfrmCadNotaFiscal_Itens.prc_NFCI;
begin
  Label42.Visible  := (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString <> '0');
  DBEdit21.Visible := (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString <> '0');
  Label43.Visible  := (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString <> '0');
  DBEdit22.Visible := (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString <> '0');
  if DBEdit21.Visible then
  begin
    if (vID_Produto_Ant <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger) or (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensNUM_FCI.AsString) = '') then
    begin
      if TRIM(fDMCadNotaFiscal.cdsProdutoNUM_FCI.AsString) <> '' then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensNUM_FCI.AsString := fDMCadNotaFiscal.cdsProdutoNUM_FCI.AsString
      else
      begin
        fDMCadNotaFiscal.qProduto_Forn.Close;
        fDMCadNotaFiscal.qProduto_Forn.ParamByName('ID').AsInteger            := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
        fDMCadNotaFiscal.qProduto_Forn.ParamByName('ID_FORNECEDOR').AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger;
        fDMCadNotaFiscal.qProduto_Forn.ParamByName('ID_COR').AsInteger        := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger;
        fDMCadNotaFiscal.qProduto_Forn.Open;
        if not (fDMCadNotaFiscal.qProduto_Forn.IsEmpty) and (trim(fDMCadNotaFiscal.qProduto_FornNUM_FCI.AsString) <> '') then
          fDMCadNotaFiscal.cdsNotaFiscal_ItensNUM_FCI.AsString := fDMCadNotaFiscal.qProduto_FornNUM_FCI.AsString;
        fDMCadNotaFiscal.qProduto_Forn.Close;
      end;
    end;
  end
  else
    fDMCadNotaFiscal.cdsNotaFiscal_ItensNUM_FCI.Clear;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo7Exit(Sender: TObject);
begin
  prc_NFCI;
  prc_Mover_Lei_Transparencia;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Mover_Lei_Transparencia;
begin
  fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_ESTADUAL.AsFloat  := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_FEDERAL.AsFloat   := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',0));
  if fDMCadNotaFiscal.cdsCFOPID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger then
    if not fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,[loCaseInsensitive]) then
      exit;
  prc_Busca_IBPT;
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit23KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger <= 0 then
      ShowMessage('N�o foi escolhido nenhum produto!')
    else
    begin
      fDMCadNotaFiscal.cdsProduto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);
      vUnidade_Pos := fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString;
      vQtd_Pacote_Pos := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_PACOTE.AsFloat));
      frmSel_Unidade := TfrmSel_Unidade.Create(Self);
      frmSel_Unidade.vID_Produto_Uni := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
      frmSel_Unidade.vUnidade_Ori    := fDMCadNotaFiscal.cdsProdutoUNIDADE.AsString;
      frmSel_Unidade.ShowModal;
      if trim(vUnidade_Pos) <> '' then
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString   := vUnidade_Pos;
        fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_PACOTE.AsFloat := StrToFloat(FormatFloat('0.0000',vQtd_Pacote_Pos));
      end;
      Label45.Visible  := (fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_PACOTE.AsInteger > 1);
      DBEdit24.Visible := (fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_PACOTE.AsInteger > 1);
    end;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chama_Form_Produto
  else
  if (Key = Vk_F3) then
    prc_Chama_Form_TabPreco;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Chama_Form_Produto;
begin
  vCodProduto_Pos := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
  vCodPessoa_Pos  := fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger;
  frmSel_Produto := TfrmSel_Produto.Create(Self);
  frmSel_Produto.ShowModal;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger := vCodProduto_Pos;
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger > 0 then
  begin
    if DBEdit15.Visible then
      DBEdit15.SetFocus
    else
      RxDBLookupCombo4.SetFocus;
  end;
  RxDBLookupCombo4Change(RxDBLookupCombo4);
end;

procedure TfrmCadNotaFiscal_Itens.prc_Chama_Form_TabPreco;
begin
  vCodProduto_Pos := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
  frmSel_TabPreco := TfrmSel_TabPreco.Create(Self);
  frmSel_TabPreco.ShowModal;
  FreeAndNil(frmSel_Produto);
  fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger := vCodProduto_Pos;
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger > 0 then
  begin
    if DBEdit15.Visible then
      DBEdit15.SetFocus
    else
      RxDBLookupCombo4.SetFocus;
  end;
  RxDBLookupCombo4Change(RxDBLookupCombo4);
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chama_Form_Produto
  else
  if (Key = Vk_F3) then
    prc_Chama_Form_TabPreco;
end;

function TfrmCadNotaFiscal_Itens.fnc_Verifica_Simples: Boolean;
begin
  Result := True;
  if fDMCadNotaFiscal.cdsParametrosCONTROLAR_NOTIFICACAO.AsString <> 'S' then
    exit;
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger <> fDMCadNotaFiscal.cdsTab_CSTICMSID.AsInteger then
    fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CSTICMS.AsInteger,[loCaseInsensitive]);
  if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsTab_CSTICMSPERCENTUAL.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_ICMSSIMPLES.AsFloat)) <= 0) then
  begin
    if (vNotaSelecionada) or (vPedidoSelecionado) or (Tag = 99) or (vValeSelecionado) or (vOSSelecionada) or (vSacolaSelecionada) or (vPedAmbiente)
      or (vRecNFSelecionado) then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVACAO_COM_ERRO.AsString := 'CSI'
    else
    if MessageDlg('CST ' + fDMCadNotaFiscal.cdsTab_CSTICMSCOD_CST.AsString + ' possui % de imposto, mas o mesmo n�o est� sendo calculado!' + #13 +
                  'Motivo: Verifique se a CFOP pode usar a CST especificada;' + #13 +
                  '        Verifique se a Filial atingiu o valor limite do faturamento para usar a CST especificada;' + #13 +
                  '        Verifique se foi lan�ado o % do simples para o c�lculo;' + #13 +
                  '        Verifique se o cliente pode se creditar do valor do imposto;' + #13 + #13 + #13 +
                  ' Confirmar assim a grava��o do item?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Result := False
    else
    if fDMCadNotaFiscal.cdsNotaFiscal_Itens.State in [dsEdit,dsInsert] then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVACAO_COM_ERRO.AsString := 'CSI';
  end;
end;

function TfrmCadNotaFiscal_Itens.fnc_Verifica_SubstTributaria: Boolean;
begin
  Result := True;
  if fDMCadNotaFiscal.cdsParametrosCONTROLAR_NOTIFICACAO.AsString <> 'S' then
    exit;
  if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_ICMSSUBST.AsFloat)) <= 0) then
  begin
    if (vNotaSelecionada) or (vPedidoSelecionado) or (Tag = 99) or (vValeSelecionado) or (vOSSelecionada) or (vSacolaSelecionada) or (vPedAmbiente) or
      (vRecNFSelecionado)then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVACAO_COM_ERRO.AsString := 'CST'
    else
    if MessageDlg('Item n�o foi calculada a substitui��o tribut�ria!' + #13
                 + 'CFOP ' + fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString + ' est� marcada para calcular a ST, mas o sistema n�o calculou!' + #13
                 + 'Motivo: Verifique se a NCM est� configurada para o estado com o MVA;' + #13
                 + '        Verifique se na UF de destino existe % ICMS Interno;' + #13 + #13 + #13
                 + ' Confirmar assim a grava��o do item?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Result := False
    else
    if fDMCadNotaFiscal.cdsNotaFiscal_Itens.State in [dsEdit,dsInsert] then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVACAO_COM_ERRO.AsString := 'CST';
  end;
end;

function TfrmCadNotaFiscal_Itens.fnc_Verifica_ST_Ant: Boolean;
begin
  //23/05/2019
  //Controla se foi gravado o valor anterior da ST
  Result := True;
  if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_ICMSSUBST_RET.AsFloat)) <= 0) then
  begin
    if (vNotaSelecionada) or (vPedidoSelecionado) or (Tag = 99) or (vValeSelecionado) or (vOSSelecionada) or (vSacolaSelecionada) or (vPedAmbiente) or
      (vRecNFSelecionado)then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVACAO_COM_ERRO.AsString := 'STA'
    else
    if MessageDlg('Item n�o foi destacado o valor da ST Cobrada Anteriormente!' + #13
                 + 'CFOP ' + fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString + ' est� marcada para enviar a ST Anterior , mas o sistema n�o encontrou a ST Anterior!' + #13 + #13
                 + 'Motivo: Verifique se na nota de entrada veio a ST Anterior ou se foi feito o MOV. ST Anterior' + #13
                 + ' Confirmar assim a grava��o do item?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Result := False
    else
    if fDMCadNotaFiscal.cdsNotaFiscal_Itens.State in [dsEdit,dsInsert] then
      fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVACAO_COM_ERRO.AsString := 'STA';
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo6Exit(Sender: TObject);
begin
  if RxDBLookupCombo6.Text <> '' then
    fDMCadNotaFiscal.vID_Variacao := RxDBLookupCombo6.KeyValue;
end;

procedure TfrmCadNotaFiscal_Itens.pnlCFOPEnter(Sender: TObject);
begin
  vID_VariacaoAnt := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger;
  vID_CFOPAnt     := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger;
end;

procedure TfrmCadNotaFiscal_Itens.BitBtn7Click(Sender: TObject);
var
  vItemAux: Integer;
begin
  fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.Last;
  vItemAux := fDMCadNotaFiscal.cdsNotaFiscal_DrawBackITEM_DRAWBACK.AsInteger;
  vItemAux := vItemAux + 1;

  fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.Insert;
  fDMCadNotaFiscal.cdsNotaFiscal_DrawBackID.AsInteger            := fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_DrawBackITEM.AsInteger          := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;
  fDMCadNotaFiscal.cdsNotaFiscal_DrawBackITEM_DRAWBACK.AsInteger := vItemAux;

  ffrmCadNotaFiscal_Itens_Drawback := TfrmCadNotaFiscal_Itens_Drawback.Create(self);
  ffrmCadNotaFiscal_Itens_Drawback.fDMCadNotaFiscal := fDMCadNotaFiscal;
  ffrmCadNotaFiscal_Itens_Drawback.ShowModal;
  FreeAndNil(ffrmCadNotaFiscal_Itens_Drawback);
end;

procedure TfrmCadNotaFiscal_Itens.BitBtn8Click(Sender: TObject);
begin
  if fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.IsEmpty then
    exit;

  fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.Edit;
  ffrmCadNotaFiscal_Itens_Drawback := TfrmCadNotaFiscal_Itens_Drawback.Create(self);
  ffrmCadNotaFiscal_Itens_Drawback.fDMCadNotaFiscal := fDMCadNotaFiscal;
  ffrmCadNotaFiscal_Itens_Drawback.ShowModal;
  FreeAndNil(ffrmCadNotaFiscal_Itens_Drawback);


end;

procedure TfrmCadNotaFiscal_Itens.BitBtn9Click(Sender: TObject);
begin
  if fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir o registro selecionado',mtWarning,[mbOK,mbNO],0) = mrNO then
    exit;
  fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.Delete;
  fDMCadNotaFiscal.vAlt_ExtExport := False;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Habilitar_Desoneracao(CodCST_ICMS: String);
var
  vUsa_Desoneracao: Boolean;
begin
  if fDMCadNotaFiscal.cdsParametrosUSA_DESONERACAO.AsString <> 'S' then
    vUsa_Desoneracao := False
  else
  if (CodCST_ICMS <> '20') and (CodCST_ICMS <> '30') and (CodCST_ICMS <> '40') and (CodCST_ICMS <> '41') and (CodCST_ICMS <> '50')
     and (CodCST_ICMS <> '70') and (CodCST_ICMS <> '90') then
    vUsa_Desoneracao := False
  else
    vUsa_Desoneracao := True;
  Label46.Visible  := ((fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') and (fDMCadNotaFiscal.cdsCFOPGERAR_DESONERACAO_ICMS.AsString = 'S')
                     and (vUsa_Desoneracao));
  DBEdit25.Visible := ((fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') and (fDMCadNotaFiscal.cdsCFOPGERAR_DESONERACAO_ICMS.AsString = 'S')
                     and (vUsa_Desoneracao));
  Label47.Visible  := ((fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') and (fDMCadNotaFiscal.cdsCFOPGERAR_DESONERACAO_ICMS.AsString = 'S')
                     and (vUsa_Desoneracao));
  RxDBLookupCombo3.Visible := ((fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') and (fDMCadNotaFiscal.cdsCFOPGERAR_DESONERACAO_ICMS.AsString = 'S')
                     and (vUsa_Desoneracao));
end;

function TfrmCadNotaFiscal_Itens.fnc_Busca_NCM_CST: Integer;
begin
  Result      := 0;
  vCod_CBenef := '';
  begin
  //27/06/2018
  //if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger > 0) and (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') then
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger > 0) then
    if fDMCadNotaFiscal.cdsClienteCODIGO.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger then
      fDMCadNotaFiscal.cdsCliente.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,[loCaseInsensitive]);
    if fDMCadNotaFiscal.cdsCFOPID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger then
      fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,[loCaseInsensitive]);
    if (((copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '5') or (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '6')) and
      ((fDMCadNotaFiscal.cdsCFOPGERAR_ICMS.AsString = 'S') or (fDMCadNotaFiscal.cdsCFOPGERAR_ICMS_SIMPLES.AsString = 'S' )))
      or (fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString = '5405') then
    begin
      fDMCadNotaFiscal.qNCM_CST.Close;
      fDMCadNotaFiscal.qNCM_CST.ParamByName('UF').AsString  := fDMCadNotaFiscal.cdsClienteUF.AsString;
      fDMCadNotaFiscal.qNCM_CST.ParamByName('ID').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger;
      fDMCadNotaFiscal.qNCM_CST.Open;
      if not(fDMCadNotaFiscal.qNCM_CST.IsEmpty) and (fDMCadNotaFiscal.qNCM_CSTID_CST_ICMS.AsInteger > 0) then
      begin
        if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S') and (Length(fDMCadNotaFiscal.qNCM_CSTCOD_CST.AsString) = 3) then
          Result := fDMCadNotaFiscal.qNCM_CSTID_CST_ICMS.AsInteger
        else
        if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') and (Length(fDMCadNotaFiscal.qNCM_CSTCOD_CST.AsString) < 3) then
        begin
          Result := fDMCadNotaFiscal.qNCM_CSTID_CST_ICMS.AsInteger;
          vCod_CBenef := fDMCadNotaFiscal.qNCM_CSTCOD_BENEF.AsString;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Abrir_Combinacao;
begin
  fDMCadNotaFiscal.cdsCombinacao.Close;
  fDMCadNotaFiscal.sdsCombinacao.ParamByName('ID').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
  fDMCadNotaFiscal.cdsCombinacao.Open;
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit2Enter(Sender: TObject);
begin
  //vQtd_Prod_Ant := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat));
end;

function TfrmCadNotaFiscal_Itens.fnc_Estoque_OK(ID_Produto, ID_Cor: Integer; Tamanho: String; Qtd: Real): Boolean;
var
  vQtdAux: Real;
  vID_LocalAux: Integer;
begin
  Result := True;
  if fDMCadNotaFiscal.cdsParametrosCONTROLAR_ESTOQUE_SAIDA.AsString <> 'S' then
    exit;
  //12/11/2015
  vID_LocalAux := fDMCadNotaFiscal.cdsNotaFiscalID_LOCAL_ESTOQUE.AsInteger;
  if (fDMCadNotaFiscal.cdsParametrosUSA_LOCAL_ESTOQUE.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscalID_LOCAL_ESTOQUE.AsInteger <= 0) then
    vID_LocalAux := fnc_Verificar_Local(fDMCadNotaFiscal.cdsParametrosUSA_LOCAL_ESTOQUE.AsString)
  else
  if (fDMCadNotaFiscal.cdsParametrosUSA_LOCAL_ESTOQUE.AsString <> 'S') then
    vID_LocalAux := 0;
  //**********
  vQtdAux := fnc_Busca_Estoque2(fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger,ID_Produto,ID_Cor,Tamanho,vID_LocalAux,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_MOVESTOQUE.AsInteger); //*** Foi acrescentado o campo local
  //15/11/2015 Estoque 
  if fDMCadNotaFiscal.mItensAlt.FindKey([fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,ID_Cor,Tamanho]) then
    vQtdAux := StrToFloat(FormatFloat('0.0000',vQtdAux + fDMCadNotaFiscal.mItensAltQtd.AsFloat));
  vQtdAux := StrToFloat(FormatFloat('0.0000',vQtdAux - fnc_EstoqueItenxAux));
  //*******

  if StrToFloat(FormatFloat('0.0000',vQtdAux)) < StrToFloat(FormatFloat('0.0000',Qtd)) then
  begin
    if trim(fDMCadNotaFiscal.cdsParametrosSENHA_LIBERA_ESTOQUE.AsString) = '' then
      //Result := MessageDlg('Produto com quantidade menor no estoque, confirma inclus�o do produto ?',mtConfirmation,[mbYes,mbNo],0) = mrNo
      Result := (MessageDlg('Produto com quantidade menor no estoque, confirma inclus�o do produto ?',mtConfirmation,[mbYes,mbNo],0) = mrYes)
    else
    begin
      ffrmSenha := TfrmSenha.Create(self);
      ffrmSenha.Label2.Caption := 'Produto: ' + fDMCadNotaFiscal.cdsProdutoREFERENCIA.AsString + ', com estoque negativo!';
      ffrmSenha.Label3.Caption := 'Informe a senha para liberar ';
      if Tamanho <> '' then
        ffrmSenha.Label4.Caption := 'Tamanho = ' + Tamanho
      else
        ffrmSenha.Label4.Caption := '';
      ffrmSenha.Label4.Caption := ffrmSenha.Label4.Caption + '   Qtd Est. ' + FormatFloat('0.####',vQtdAux);
      if StrToFloat(FormatFloat('0.0000',vQtdAux)) <= 0 then
        ffrmSenha.Label4.Font.Color := clRed
      else
        ffrmSenha.Label4.Font.Color := clBlue;
      ffrmSenha.vControlaSenha := True;
      ffrmSenha.vSenha_Param := fDMCadNotaFiscal.cdsParametrosSENHA_LIBERA_ESTOQUE.AsString;
      ffrmSenha.ShowModal;
      FreeAndNil(ffrmSenha);
      if vSenha <> fDMCadNotaFiscal.cdsParametrosSENHA_LIBERA_ESTOQUE.AsString then
        Result := False;
    end;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit31Enter(Sender: TObject);
begin
  vQtd_KG_Ant := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_LANCAR_ESTOQUE.AsFloat));
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit31Exit(Sender: TObject);
begin
  if (fDMCadNotaFiscal.cdsParametrosEMPRESA_SUCATA.AsString = 'S') then
  begin
    if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_LANCAR_ESTOQUE.AsFloat)) > 0 then
    begin
      if trim(fDMCadNotaFiscal.cdsParametrosUNIDADE_PECA.AsString) <> '' then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString := fDMCadNotaFiscal.cdsParametrosUNIDADE_PECA.AsString;
    end
    else
    if StrToFloat(FormatFloat('0.0000',vQtd_KG_Ant)) > 0 then
    begin
      if fDMCadNotaFiscal.cdsProduto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]) then
        fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString := fDMCadNotaFiscal.cdsProdutoUNIDADE.AsString;
    end;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit15Exit(Sender: TObject);
begin
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger > 0 then
    prc_Estoque(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger);
end;

procedure TfrmCadNotaFiscal_Itens.Panel5Enter(Sender: TObject);
begin
  vID_Produto_Ant := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
  vCodProdutoAnt  := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
end;

function TfrmCadNotaFiscal_Itens.fnc_EstoqueItenxAux: Real;
var
  sds: TSQLDataSet;
begin
  Result := StrToFloat(FormatFloat('0',0));
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.GetMetadata   := False;
    sds.NoMetadata    := True;
    sds.CommandText   := 'SELECT SUM(I.qtd) QTD  FROM notafiscal_itensaux I ' +
                         'WHERE I.id = :ID  AND I.ITEM <> :ITEM ' +
                         ' AND I.id_produto = :ID_PRODUTO';
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger > 0 then
      sds.CommandText := sds.CommandText + '   AND I.id_cor = :ID_COR ';
    if trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString) <> '' then
      sds.CommandText := sds.CommandText + '   AND I.tamanho = :TAMANHO ';
    sds.ParamByName('ID').AsInteger   := fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger;
    sds.ParamByName('ITEM').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;
    sds.ParamByName('ID_PRODUTO').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger > 0 then
      sds.ParamByName('ID_COR').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger;
    if trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString) <> '' then
      sds.ParamByName('TAMANHO').AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString;
    sds.Open;
    Result := StrToFloat(FormatFloat('0.0000',sds.FieldByName('QTD').AsFloat));
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo15KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if RxDBLookupCombo15.Text <> '' then
      viD_EnqIPI_Pos := RxDBLookupCombo15.KeyValue;
    frmSel_EnqIPI := TfrmSel_EnqIPI.Create(Self);
    frmSel_EnqIPI.ShowModal;
    if viD_EnqIPI_Pos > 0 then
      RxDBLookupCombo15.KeyValue := viD_EnqIPI_Pos
    else
      RxDBLookupCombo15.ClearValue;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Montar_Codigos_CST(Variacao: Boolean);
begin
  //22/07/2016
  //ICMS e IPI
  vID_IPI    := 0;
  vID_ICMS   := 0;
  vID_EnqIPI := 0;
  if Variacao then
  begin
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsCFOP_VariacaoID_CSTICMS.AsInteger)) > 0 then
      vID_ICMS := fDMCadNotaFiscal.cdsCFOP_VariacaoID_CSTICMS.AsInteger;
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsCFOP_VariacaoID_CSTIPI.AsInteger)) > 0 then
      vID_IPI := fDMCadNotaFiscal.cdsCFOP_VariacaoID_CSTIPI.AsInteger;
    if StrToFloat(FormatFloat('000',fDMCadNotaFiscal.cdsCFOP_VariacaoID_ENQIPI.AsInteger)) > 0 then
      vID_EnqIPI := fDMCadNotaFiscal.cdsCFOP_VariacaoID_ENQIPI.AsInteger;
  end;
  if (StrToFloat(FormatFloat('00',vID_ICMS)) <= 0) and (fDMCadNotaFiscal.cdsCFOPID_CSTICMS.AsInteger > 0) then
    vID_ICMS := fDMCadNotaFiscal.cdsCFOPID_CSTICMS.AsInteger;
  if (StrToFloat(FormatFloat('00',vID_IPI)) <= 0) and (fDMCadNotaFiscal.cdsCFOPID_CSTIPI.AsInteger > 0) then
    vID_IPI := fDMCadNotaFiscal.cdsCFOPID_CSTIPI.AsInteger;
  if (StrToFloat(FormatFloat('00',vID_ICMS)) <= 0) and (fDMCadNotaFiscal.cdsFilialID_CSTICMS.AsInteger > 0) then
    vID_ICMS := fDMCadNotaFiscal.cdsFilialID_CSTICMS.AsInteger;
  if (StrToFloat(FormatFloat('00',vID_IPI)) <= 0) and (fDMCadNotaFiscal.cdsFilialID_CSTIPI.AsInteger > 0) then
    vID_IPI := fDMCadNotaFiscal.cdsFilialID_CSTIPI.AsInteger;
  if (StrToFloat(FormatFloat('000',vID_EnqIPI)) <= 0) and (fDMCadNotaFiscal.cdsFilialID_ENQIPI.AsInteger > 0) then
    vID_EnqIPI := fDMCadNotaFiscal.cdsFilialID_ENQIPI.AsInteger;
  //**********
  fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.Clear;
  fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.Clear;
  if fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S' then
  begin
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsCFOPID_PIS_SIMP.AsInteger)) > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger  := fDMCadNotaFiscal.cdsCFOPID_PIS_SIMP.AsInteger;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_PIS.AsString := fDMCadNotaFiscal.cdsCFOPTIPO_PIS_SIMP.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsCFOPPERC_PIS_SIMP.AsFloat));
    end;
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsCFOPID_COFINS_SIMP.AsInteger)) > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger  := fDMCadNotaFiscal.cdsCFOPID_COFINS_SIMP.AsInteger;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_COFINS.AsString := fDMCadNotaFiscal.cdsCFOPTIPO_COFINS_SIMP.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsCFOPPERC_COFINS_SIMP.AsFloat));
    end;
  end
  else
  //03/03/2018   Busca o PIS/COFINS da tabela de NCM por CST
    prc_Le_NCM_Geral;
  //****************************

  if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger)) <= 0 then
  begin
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsCFOPID_PIS.AsInteger)) > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger  := fDMCadNotaFiscal.cdsCFOPID_PIS.AsInteger;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_PIS.AsString := fDMCadNotaFiscal.cdsCFOPTIPO_PIS.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsCFOPPERC_PIS.AsFloat));
    end;
  end;
  if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger)) <= 0 then
  begin
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsCFOPID_COFINS.AsInteger)) > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger  := fDMCadNotaFiscal.cdsCFOPID_COFINS.AsInteger;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_COFINS.AsString := fDMCadNotaFiscal.cdsCFOPTIPO_COFINS.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsCFOPPERC_COFINS.AsFloat));
    end;
  end;
  //Verifica quando tem varia��o
  if (StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger)) <= 0) and (Variacao) then
  begin
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsCFOP_VariacaoID_PIS.AsInteger)) > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger  := fDMCadNotaFiscal.cdsCFOP_VariacaoID_PIS.AsInteger;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_PIS.AsString := fDMCadNotaFiscal.cdsCFOP_VariacaoTIPO_PIS.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsCFOP_VariacaoPERC_PIS.AsFloat));
    end;
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsCFOP_VariacaoID_COFINS.AsInteger)) > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger  := fDMCadNotaFiscal.cdsCFOP_VariacaoID_COFINS.AsInteger;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_COFINS.AsString := fDMCadNotaFiscal.cdsCFOP_VariacaoTIPO_COFINS.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsCFOP_VariacaoPERC_COFINS.AsFloat));
    end;
  end;
  //Verifica no cadastro da Filial
  if (StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger)) <= 0) then
  begin
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsFilialID_PIS.AsInteger)) > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger  := fDMCadNotaFiscal.cdsFilialID_PIS.AsInteger;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_PIS.AsString := fDMCadNotaFiscal.cdsFilialTIPO_PIS.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsFilialPERC_PIS.AsFloat));
    end;
    if StrToFloat(FormatFloat('00',fDMCadNotaFiscal.cdsFilialID_COFINS.AsInteger)) > 0 then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger  := fDMCadNotaFiscal.cdsFilialID_COFINS.AsInteger;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_COFINS.AsString := fDMCadNotaFiscal.cdsFilialTIPO_COFINS.AsString;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsFilialPERC_COFINS.AsFloat));
    end;
  end;
  if fDMCadNotaFiscal.cdsTab_PisID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger then
    fDMCadNotaFiscal.cdsTab_Pis.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger,[loCaseInsensitive]);
  if fDMCadNotaFiscal.cdsTab_CofinsID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger then
    fDMCadNotaFiscal.cdsTab_Cofins.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger,[loCaseInsensitive]);
  if (vID_ICMS > 0) and (fDMCadNotaFiscal.cdsTab_CSTICMSID.AsInteger <> vID_ICMS) then
    fDMCadNotaFiscal.cdsTab_CSTICMS.Locate('ID',vID_ICMS,[loCaseInsensitive]);
  if (vID_IPI > 0) and (fDMCadNotaFiscal.cdsTab_CSTIPIID.AsInteger <> vID_IPI) then
    fDMCadNotaFiscal.cdsTab_CSTIPI.Locate('ID',vID_IPI,[loCaseInsensitive]);
end;

procedure TfrmCadNotaFiscal_Itens.DBCheckBox1Exit(Sender: TObject);
begin
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_MOVESTOQUE_PED.AsInteger > 0 then
  begin
    MessageDlg('Estoque j� foi descontado no pedido, n�o pode descontar novamente!', mtInformation, [mbOk], 0);
    fDMCadNotaFiscal.cdsNotaFiscal_ItensGERAR_ESTOQUE.AsString := 'N';
  end;
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit11Exit(Sender: TObject);
begin
  if (fDMCadNotaFiscal.qParametros_ProdUSA_DESC_MAXIMO.AsString = 'S') then
  begin
    if fDMCadNotaFiscal.cdsProdutoID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger then
      fDMCadNotaFiscal.cdsProduto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);
    if (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_DESCONTO.AsFloat)) >
        StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsProdutoPERC_DESC_MAX.AsFloat))) then
    begin
      MessageDlg('*** % Desconto informado maior que o m�ximo de ' + FormatFloat('0.00##',fDMCadNotaFiscal.cdsProdutoPERC_DESC_MAX.AsFloat) +
                      ', que est� informado no produto!', mtInformation, [mbOk], 0);
      DBEdit11.SetFocus;
    end;
  end;
end;

function TfrmCadNotaFiscal_Itens.fnc_Busca_Preco_Orig: Real;
//var
//  vPrecoAux: Real;
//  sds: TSQLDataSet;
begin
  Result := StrToFloat(FormatFloat('0.000000',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat));
  {vPrecoAux := 0;
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger > 0) and (fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_PEDIDO.AsInteger > 0) then
  begin
    sds := TSQLDataSet.Create(nil);
    try
      sds.SQLConnection := dmDatabase.scoDados;
      sds.GetMetadata   := False;
      sds.NoMetadata    := True;
      sds.CommandText   := 'SELECT PI.VLR_UNITARIO  FROM pedido_item PI '
                         +  ' WHERE PI.id = ' + IntToStr(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger)
                         +  ' AND PI.item = ' + IntToStr(fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_PEDIDO.AsInteger);
      sds.Open;
      if StrToFloat(FormatFloat('0.0000',sds.FieldByName('VLR_UNITARIO').AsFloat)) > 0 then
        vPrecoAux := StrToFloat(FormatFloat('0.000000',sds.FieldByName('VLR_UNITARIO').AsFloat));
    finally
      FreeAndNil(sds);
    end;
  end;

  if StrToFloat(FormatFloat('0.000000',vPrecoAux)) > 0 then
    Result := StrToFloat(FormatFloat('0.000000',vPrecoAux))
  else
  begin
    if fDMCadNotaFiscal.cdsProdutoID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger then
      fDMCadNotaFiscal.cdsProduto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);
    if StrToFloat(FormatFloat('0.00000',vPreco_Pos)) > 0 then
      vPrecoAux := StrToFloat(FormatFloat('0.00000',vPreco_Pos))
    else
    if fDMCadNotaFiscal.cdsClienteID_TAB_PRECO.AsInteger > 0 then
      vPrecoAux := DMUtil.fnc_Buscar_Preco(fDMCadNotaFiscal.cdsClienteID_TAB_PRECO.AsInteger,fDMCadNotaFiscal.cdsProdutoID.AsInteger);
    if StrToFloat(FormatFloat('0.0000',vPrecoAux)) > 0 then
      Result := StrToFloat(FormatFloat('0.000000',vPrecoAux))
    else
      Result := fDMCadNotaFiscal.cdsProdutoPRECO_VENDA.AsFloat;
  end;}
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit34Enter(Sender: TObject);
begin
  DBEdit34.SelStart := (Length(DBEdit34.Text) + 1);
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo14Enter(Sender: TObject);
begin
  if Trim(RxDBLookupCombo14.Text) <> '' then
    vIDCombAnt := RxDBLookupCombo14.KeyValue
  else
    vIDCombAnt := 0;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo14Exit(Sender: TObject);
var
  vQtdAux: Real;
begin
  if (trim(RxDBLookupCombo4.Text) <> '') then
    prc_Estoque(RxDBLookupCombo4.KeyValue);
end;

procedure TfrmCadNotaFiscal_Itens.prc_Estoque(ID_Produto: Integer);
var
  vQtdAux: Real;
  vID_Cor: Integer;
begin
  vQtdAux := 0;
  vID_Cor := 0;
  if trim(RxDBLookupCombo14.Text) <> '' then
    vID_Cor := RxDBLookupCombo14.KeyValue;
  vQtdAux := fnc_Buscar_Estoque(ID_Produto,fDMCadNotaFiscal.cdsNotaFiscalID_LOCAL_ESTOQUE.AsInteger,vID_Cor,fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger);
  lblEstoque.Caption := FormatFloat('0.####',vQtdAux);
end;

procedure TfrmCadNotaFiscal_Itens.prc_Le_NCM_Geral;
begin
  //03/03/2018
  if fDMCadNotaFiscal.cdsTab_NCMID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger then
    fDMCadNotaFiscal.cdsTab_NCM.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger,[loCaseInsensitive]);
  if fDMCadNotaFiscal.cdsTab_NCMID_PIS.AsInteger > 0 then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PIS.AsInteger     := fDMCadNotaFiscal.cdsTab_NCMID_PIS.AsInteger;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_PIS.AsFloat     := fDMCadNotaFiscal.cdsTab_NCMPERC_PIS.AsFloat;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COFINS.AsInteger  := fDMCadNotaFiscal.cdsTab_NCMID_COFINS.AsInteger;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COFINS.AsFloat  := fDMCadNotaFiscal.cdsTab_NCMPERC_COFINS.AsFloat;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_PIS.AsString    := fDMCadNotaFiscal.cdsCFOPTIPO_PIS.AsString;
    fDMCadNotaFiscal.cdsNotaFiscal_ItensTIPO_COFINS.AsString := fDMCadNotaFiscal.cdsCFOPTIPO_COFINS.AsString;
  end;
  vPerc_BRedICMS_NCM := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsTab_NCMPERC_BASE_ICMS.AsFloat));
  if fDMCadNotaFiscal.cdsTab_NCMID_OBS_LEI.AsInteger > 0 then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_OBS_LEI_NCM.AsInteger := fDMCadNotaFiscal.cdsTab_NCMID_OBS_LEI.AsInteger
  else
    fDMCadNotaFiscal.cdsNotaFiscal_ItensID_OBS_LEI_NCM.Clear;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Calcula_IPI_Pago_Empresa;
var
  vVlrAux : Real;
  vIPIAux : Real;
begin
  vVlrAux := fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat * fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat;
  vIPIAux := fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat +
            StrToFloat(FormatFloat('0.00',(fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat * fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat) / 100));
  vVlrAux := StrToFloat(FormatFloat('0.0000',vVlrAux / vIPIAux));
  fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.0000',vVlrAux));
  prc_Calcular_VlrItens;
end;

procedure TfrmCadNotaFiscal_Itens.prc_Unidade_Trib;
var
  vQtdAux: Real;
begin
  if fDMCadNotaFiscal.cdsTab_NCMID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger then
     fDMCadNotaFiscal.cdsTab_NCM.Locate('ID',fDMCadNotaFiscal.cdsTab_NCMID.AsInteger,[loCaseInsensitive]);
  if (fDMCadNotaFiscal.cdsTab_NCMUNIDADE_TRIB.AsString <> '') and (trim(fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE_TRIB.AsString) = '') then
    fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE_TRIB.AsString := fDMCadNotaFiscal.cdsTab_NCMUNIDADE_TRIB.AsString;
  vQtdAux := fnc_Unidade_Conv(fDMCadNotaFiscal);
  if StrToFloat(FormatFloat('0.00000',vQtdAux)) > 0 then
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_TRIB.AsFloat          := StrToFloat(FormatFloat('0.0000',vQtdAux));
    fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO_TRIB.AsFloat := StrToFloat(FormatFloat('0.0000000000',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat / fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_TRIB.AsFloat));
  end
  else
  begin
    fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD_TRIB.AsFloat          := StrToFloat(FormatFloat('0.0000',0));
    fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO_TRIB.AsFloat := StrToFloat(FormatFloat('0.0000000000',0));
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBlkCCustoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if RxDBlkCCusto.Text <> '' then
      vID_Centro_Custo := RxDBlkCCusto.KeyValue;
    frmSel_CentroCusto := TfrmSel_CentroCusto.Create(Self);
    frmSel_CentroCusto.ShowModal;
    if vID_Centro_Custo > 0 then
      RxDBlkCCusto.KeyValue := vID_Centro_Custo;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBlkContaOrcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if RxDBlkContaOrc.Text <> '' then
      vID_ContaOrcamento_Pos := RxDBlkContaOrc.KeyValue;
    frmSel_ContaOrc := TfrmSel_ContaOrc.Create(Self);
    if fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString = 'S' then
      frmSel_ContaOrc.ComboBox2.ItemIndex := 0
    else
      frmSel_ContaOrc.ComboBox2.ItemIndex := 1;
    frmSel_ContaOrc.ShowModal;
    if vID_ContaOrcamento_Pos > 0 then
      RxDBlkContaOrc.KeyValue:= vID_ContaOrcamento_Pos;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.RxDBLookupCombo4Exit(Sender: TObject);
begin
  if trim(RxDBLookupCombo4.Text) <> '' then
  begin
    if rxdbOperacao.Visible then
      rxdbOperacao.SetFocus
    else
      RxDBLookupCombo1.SetFocus;
  end;
end;

function TfrmCadNotaFiscal_Itens.fnc_Gerar_IPI(ID: Integer): Boolean;
begin
  Result := False;
  if fDMCadNotaFiscal.cdsTab_CSTIPIID.AsInteger <> ID then
    fDMCadNotaFiscal.cdsTab_CSTIPI.Locate('ID',ID,[loCaseInsensitive]);
  if fDMCadNotaFiscal.cdsTab_CSTIPIGERAR_IPI.AsString = 'S' then
    Result := True;
end;

function TfrmCadNotaFiscal_Itens.fnc_Possui_Calc_ST: Boolean;
var
  vImportado_Nacional : String;
  vUF : String;
begin
  Result := False;
  if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S') and (fDMCadNotaFiscal.cdsTab_NCMUSAR_MVA_UF_DESTINO.AsString <> 'S') then
    vUF := fDMCadNotaFiscal.cdsFilialUF.AsString
  else
    vUF := fDMCadNotaFiscal.cdsClienteUF.AsString;
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '1')  or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '2')
    or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '3') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '8') then
    vImportado_Nacional := 'I'
  else
    vImportado_Nacional := 'N';
  prc_Abrir_qNCM_UF(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger,vUF,'A');
  if not fDMCadNotaFiscal.qNCM_UF.IsEmpty then
    Result := True
  else
  begin
    prc_Abrir_qNCM_UF(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger,vUF,vImportado_Nacional);
    if not fDMCadNotaFiscal.qNCM_UF.IsEmpty then
      Result := True;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit43Exit(Sender: TObject);
begin
  if not fnc_Existe_CBenef(DBEdit43.Text) then
  begin
    MessageDlg('*** C�digo Benef�cio Fiscal n�o encontrado!', mtInformation, [mbOk], 0);
    DBEdit43.SetFocus;
  end;
end;

procedure TfrmCadNotaFiscal_Itens.DBEdit43KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vCod_CBenef   := DBEdit43.Text;
    frmSel_CBenef := TfrmSel_CBenef.Create(Self);
    if (RxDBLookupCombo11.Text <> '') and (Length(RxDBLookupCombo11.Text) = 2) then
      frmSel_CBenef.vCod_CST := RxDBLookupCombo11.Text;
    frmSel_CBenef.ShowModal;
    if trim(vCod_CBenef) <> '' then
      DBEdit1.Text := vCod_CBenef;
    FreeAndNil(frmSel_CBenef);
  end;
end;

procedure TfrmCadNotaFiscal_Itens.btnANPClick(Sender: TObject);
begin
  frmCadNotaFiscal_Itens_ANP := TfrmCadNotaFiscal_Itens_ANP.Create(self);
  frmCadNotaFiscal_Itens_ANP.fDMCadNotaFiscal := fDMCadNotaFiscal;
  frmCadNotaFiscal_Itens_ANP.ShowModal;
  FreeAndNil(frmCadNotaFiscal_Itens_ANP);
end;

end.
