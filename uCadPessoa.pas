unit uCadPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RzTabs, StdCtrls, DBCtrls, RzButton, db,
  RxDBComb, RxLookup, Mask, Grids, DateUtils, DBGrids, SMDBGrid, Buttons, ExtCtrls, UCBase, uDmCadPessoa, RzDBChk, RzRadChk,
  UNFe_ConsultaCadastro, RzPanel, ToolEdit, RXDBCtrl, UConsPessoa_Fat, UConsPessoa_Fin, UCadPessoa_Servico, RzLstBox, ComObj,
  UCadPessoa_Servico_Int, NxCollection, dbXPress, SqlExpr, ACBrBase, ACBrSocket, Menus, ComCtrls,
  RzChkLst, ACBrConsultaCPF, UConsPessoa_Prod, CurrEdit, uConsAgenda;

type
  TfrmCadPessoa = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    pnlPesquisa: TPanel;
    Label6: TLabel;
    Edit4: TEdit;
    Panel2: TPanel;
    StaticText1: TStaticText;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    RZPageControlDados: TRzPageControl;
    TS_Pessoa_Dados: TRzTabSheet;
    TS_Pessoa_Endereco: TRzTabSheet;
    GroupBox2: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    RxDBLookupCombo8: TRxDBLookupCombo;
    RxDBLookupCombo9: TRxDBLookupCombo;
    GroupBox3: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    RxDBComboBox3: TRxDBComboBox;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    RxDBLookupCombo10: TRxDBLookupCombo;
    RxDBLookupCombo11: TRxDBLookupCombo;
    Panel4: TPanel;
    Label34: TLabel;
    Label53: TLabel;
    Label57: TLabel;
    RxDBLookupCombo12: TRxDBLookupCombo;
    RxDBLookupCombo13: TRxDBLookupCombo;
    RxDBComboBox6: TRxDBComboBox;
    TS_Pessoa_Financeiro: TRzTabSheet;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    DBEdit24: TDBEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    RxDBLookupCombo7: TRxDBLookupCombo;
    UCControls1: TUCControls;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label25: TLabel;
    RxDBLookupCombo15: TRxDBLookupCombo;
    SpeedButton7: TSpeedButton;
    Label55: TLabel;
    ComboBox1: TComboBox;
    Label56: TLabel;
    DBEdit23: TDBEdit;
    gbxConta_Orcamento: TRzGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    RxDBLookupCombo18: TRxDBLookupCombo;
    RxDBLookupCombo19: TRxDBLookupCombo;
    RxDBLookupCombo20: TRxDBLookupCombo;
    RxDBLookupCombo21: TRxDBLookupCombo;
    Label68: TLabel;
    RxDBLookupCombo22: TRxDBLookupCombo;
    btnConsultar: TNxButton;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    btnInserir: TNxButton;
    btnPesquisar: TNxButton;
    btnImprimir: TNxButton;
    btnExcluir: TNxButton;
    TS_RegrasFiscais: TRzTabSheet;
    Panel3: TPanel;
    Panel6: TPanel;
    RzDBCheckBox1: TRzDBCheckBox;
    gbxIPI: TRzGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    Label74: TLabel;
    Label73: TLabel;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    RxDBLookupCombo23: TRxDBLookupCombo;
    DBMemo1: TDBMemo;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    RzCheckList1: TRzCheckList;
    StaticText2: TStaticText;
    TS_Aluno: TRzTabSheet;
    Label85: TLabel;
    Label86: TLabel;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    TabSheet1: TRzTabSheet;
    DBMemo3: TDBMemo;
    DBCheckBox6: TDBCheckBox;
    Label87: TLabel;
    DBEdit47: TDBEdit;
    Panel7: TPanel;
    gbxSuframa: TRzGroupBox;
    RzDBCheckBox2: TRzDBCheckBox;
    Panel5: TPanel;
    gbxPIS: TRzGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    DBDateEdit5: TDBDateEdit;
    DBDateEdit6: TDBDateEdit;
    RxDBLookupCombo24: TRxDBLookupCombo;
    DBMemo2: TDBMemo;
    RxDBLookupCombo25: TRxDBLookupCombo;
    ACBrConsultaCPF1: TACBrConsultaCPF;
    Label91: TLabel;
    DBEdit49: TDBEdit;
    PopupMenu1: TPopupMenu;
    Customizado1: TMenuItem;
    Completo1: TMenuItem;
    N1: TMenuItem;
    N11: TMenuItem;
    Label94: TLabel;
    Label95: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    ComboBox2: TComboBox;
    Label96: TLabel;
    RzCheckList2: TRzCheckList;
    Personalizado21: TMenuItem;
    Panel9: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lblInscEstadual: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    lblRG: TLabel;
    Label15: TLabel;
    SpeedButton4: TSpeedButton;
    Label58: TLabel;
    Label89: TLabel;
    Label92: TLabel;
    DBEdit7: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    dbeInscEstadual: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    dbeRG: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    GroupBox1: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    chkRepresentante: TDBCheckBox;
    ckAtelier: TDBCheckBox;
    ckAluno: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    RxDBLookupCombo14: TRxDBLookupCombo;
    btnCadConsultar: TBitBtn;
    DBEdit10: TDBEdit;
    DBEdit27: TDBEdit;
    btnCadConsultar_Receita: TBitBtn;
    RxDBComboBox5: TRxDBComboBox;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit50: TDBEdit;
    Label54: TLabel;
    Label97: TLabel;
    DBEdit52: TDBEdit;
    Label98: TLabel;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    gbxDadosAdic: TRzGroupBox;
    DBMemo4: TDBMemo;
    Label99: TLabel;
    DBMemo5: TDBMemo;
    RzGroupBox1: TRzGroupBox;
    Label100: TLabel;
    Label101: TLabel;
    RxDBLookupCombo29: TRxDBLookupCombo;
    DBEdit54: TDBEdit;
    Label88: TLabel;
    RxDBLookupCombo28: TRxDBLookupCombo;
    Label90: TLabel;
    RxDBLookupCombo30: TRxDBLookupCombo;
    Label102: TLabel;
    RxDBLookupCombo31: TRxDBLookupCombo;
    Label103: TLabel;
    edtCod_EnqIPI_Suframa: TEdit;
    Label104: TLabel;
    edtCod_EnqIPI: TEdit;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    DBEdit48: TDBEdit;
    TS_Fisica: TRzTabSheet;
    pnlPessoaFisica: TPanel;
    RzGroupBox4: TRzGroupBox;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    DBDateEdit7: TDBDateEdit;
    RxDBComboBox8: TRxDBComboBox;
    RxDBComboBox9: TRxDBComboBox;
    RxDBLookupCombo32: TRxDBLookupCombo;
    RxDBLookupCombo33: TRxDBLookupCombo;
    Label121: TLabel;
    DBEdit61: TDBEdit;
    Label122: TLabel;
    DBEdit62: TDBEdit;
    Label123: TLabel;
    DBEdit63: TDBEdit;
    Label124: TLabel;
    DBEdit64: TDBEdit;
    Label125: TLabel;
    RxDBLookupCombo34: TRxDBLookupCombo;
    Label126: TLabel;
    DBDateEdit8: TDBDateEdit;
    Label127: TLabel;
    RxDBComboBox10: TRxDBComboBox;
    Label128: TLabel;
    RxDBComboBox11: TRxDBComboBox;
    Label129: TLabel;
    RxDBComboBox12: TRxDBComboBox;
    Label120: TLabel;
    TS_Servico: TRzTabSheet;
    pnlServico: TPanel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    SpeedButton8: TSpeedButton;
    Label80: TLabel;
    Label81: TLabel;
    DBEdit41: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    RxDBLookupCombo16: TRxDBLookupCombo;
    RxDBLookupCombo17: TRxDBLookupCombo;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    BitBtn1: TBitBtn;
    DBCheckBox11: TDBCheckBox;
    BitBtn2: TBitBtn;
    RxDBLookupCombo26: TRxDBLookupCombo;
    DBCheckBox12: TDBCheckBox;
    DBEdit44: TDBEdit;
    Label133: TLabel;
    RxDBLookupCombo35: TRxDBLookupCombo;
    SpeedButton9: TSpeedButton;
    Panel10: TPanel;
    Label108: TLabel;
    DBEdit55: TDBEdit;
    Label134: TLabel;
    DBEdit67: TDBEdit;
    Panel11: TPanel;
    Panel12: TPanel;
    Label146: TLabel;
    RxDBComboBox13: TRxDBComboBox;
    Label147: TLabel;
    RxDBComboBox14: TRxDBComboBox;
    DBCheckBox22: TDBCheckBox;
    DBDateEdit11: TDBDateEdit;
    Label155: TLabel;
    rxdbFilial: TRxDBLookupCombo;
    Label156: TLabel;
    RxDBLookupCombo37: TRxDBLookupCombo;
    Label157: TLabel;
    DBDateEdit12: TDBDateEdit;
    Label158: TLabel;
    DBEdit21: TDBEdit;
    Label159: TLabel;
    DBEdit82: TDBEdit;
    Label160: TLabel;
    DBEdit83: TDBEdit;
    Label161: TLabel;
    DBEdit84: TDBEdit;
    RzGroupBox5: TRzGroupBox;
    Label162: TLabel;
    RxDBLookupCombo38: TRxDBLookupCombo;
    RzGroupBox7: TRzGroupBox;
    Label180: TLabel;
    Label181: TLabel;
    RxDBComboBox22: TRxDBComboBox;
    DBEdit89: TDBEdit;
    Label163: TLabel;
    DBEdit85: TDBEdit;
    Label182: TLabel;
    DBEdit99: TDBEdit;
    Label183: TLabel;
    RxDBComboBox15: TRxDBComboBox;
    TS_Atividade: TRzTabSheet;
    SMDBGrid7: TSMDBGrid;
    lblCarteira: TLabel;
    RxDBLookupCombo42: TRxDBLookupCombo;
    SpeedButton10: TSpeedButton;
    DBCheckBox24: TDBCheckBox;
    RzPageControl2: TRzPageControl;
    TS_Dados_Profissionais: TRzTabSheet;
    pnlDados_Profissionais: TPanel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label176: TLabel;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    RxDBLookupCombo36: TRxDBLookupCombo;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    DBDateEdit10: TDBDateEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit95: TDBEdit;
    TS_Conjuge: TRzTabSheet;
    pnlConjuge: TPanel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    Label166: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label177: TLabel;
    Label178: TLabel;
    Label179: TLabel;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    DBDateEdit9: TDBDateEdit;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    DBEdit88: TDBEdit;
    DBEdit90: TDBEdit;
    DBEdit91: TDBEdit;
    DBEdit92: TDBEdit;
    RxDBLookupCombo39: TRxDBLookupCombo;
    DBEdit93: TDBEdit;
    DBEdit94: TDBEdit;
    DBDateEdit13: TDBDateEdit;
    RxDBLookupCombo40: TRxDBLookupCombo;
    DBEdit96: TDBEdit;
    DBEdit97: TDBEdit;
    DBEdit98: TDBEdit;
    TS_Dados_Conta: TRzTabSheet;
    pnlDados_Conta: TPanel;
    Label109: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label110: TLabel;
    Label114: TLabel;
    Label111: TLabel;
    DBEdit56: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    RxDBComboBox7: TRxDBComboBox;
    TS_Dependentes: TRzTabSheet;
    SMDBGrid3: TSMDBGrid;
    TS_RefP: TRzTabSheet;
    SMDBGrid4: TSMDBGrid;
    TS_RefC: TRzTabSheet;
    SMDBGrid5: TSMDBGrid;
    TS_Autorizadas: TRzTabSheet;
    SMDBGrid6: TSMDBGrid;
    RxDBLookupCombo43: TRxDBLookupCombo;
    Label185: TLabel;
    CadastrodeConsumidor1: TMenuItem;
    Label186: TLabel;
    DBEdit100: TDBEdit;
    DBEdit101: TDBEdit;
    DBCheckBox25: TDBCheckBox;
    Excel1: TMenuItem;
    DBEdit102: TDBEdit;
    DBCheckBox28: TDBCheckBox;
    Label187: TLabel;
    DBEdit103: TDBEdit;
    RzGroupBox3: TRzGroupBox;
    Label154: TLabel;
    DBEdit104: TDBEdit;
    Label189: TLabel;
    DBEdit105: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    TS_TipoMaterial: TRzTabSheet;
    SMDBGrid8: TSMDBGrid;
    Label190: TLabel;
    DBEdit106: TDBEdit;
    Label191: TLabel;
    DBEdit107: TDBEdit;
    Label192: TLabel;
    RxDBComboBox16: TRxDBComboBox;
    RxDBComboBox17: TRxDBComboBox;
    Label193: TLabel;
    RxDBLookupCombo44: TRxDBLookupCombo;
    DBCheckBox31: TDBCheckBox;
    TS_Pessoa_Fil: TRzTabSheet;
    SMDBGrid9: TSMDBGrid;
    pnlPessoa_Fil: TPanel;
    btnCopiar_Fil: TNxButton;
    DBCheckBox5: TDBCheckBox;
    Label197: TLabel;
    RxDBLookupCombo45: TRxDBLookupCombo;
    Label198: TLabel;
    Edit1: TEdit;
    Label199: TLabel;
    Edit2: TEdit;
    btnFiscalProduto: TNxButton;
    Panel14: TPanel;
    RzDBCheckBox3: TRzDBCheckBox;
    gbxDrawback: TRzGroupBox;
    Label202: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    Label205: TLabel;
    RxDBLookupCombo46: TRxDBLookupCombo;
    DBMemo6: TDBMemo;
    RxDBLookupCombo47: TRxDBLookupCombo;
    DBEdit111: TDBEdit;
    edtCod_EnqIPI_DrawBack: TEdit;
    Personalizadonafilial1: TMenuItem;
    Label206: TLabel;
    DBEdit112: TDBEdit;
    Etiqueta1: TMenuItem;
    RzPageControl3: TRzPageControl;
    ts_Contatos: TRzTabSheet;
    pnlContato: TPanel;
    Panel13: TPanel;
    SMDBGrid2: TSMDBGrid;
    ts_Vendedor: TRzTabSheet;
    pnlVendedor: TPanel;
    Label82: TLabel;
    Label83: TLabel;
    Label188: TLabel;
    SpeedButton11: TSpeedButton;
    Label184: TLabel;
    lblSenha: TLabel;
    Label195: TLabel;
    RxDBComboBox4: TRxDBComboBox;
    DBEdit53: TDBEdit;
    CurrencyEdit1: TCurrencyEdit;
    RxDBLookupCombo41: TRxDBLookupCombo;
    DBEdit109: TDBEdit;
    DBEdit110: TDBEdit;
    btnConfDescontos: TNxButton;
    TS_CAE: TRzTabSheet;
    pnlCAE: TPanel;
    Label207: TLabel;
    DBEdit113: TDBEdit;
    Label208: TLabel;
    DBEdit114: TDBEdit;
    Label209: TLabel;
    DBEdit115: TDBEdit;
    Label210: TLabel;
    DBEdit116: TDBEdit;
    DBCheckBox33: TDBCheckBox;
    btnSefaz: TSpeedButton;
    btnReceita: TSpeedButton;
    DBCheckBox36: TDBCheckBox;
    TS_Compras: TRzTabSheet;
    pnlCompras_Pedidos: TPanel;
    Label84: TLabel;
    RxDBLookupCombo27: TRxDBLookupCombo;
    Label69: TLabel;
    DBEdit42: TDBEdit;
    Label70: TLabel;
    DBEdit43: TDBEdit;
    Label93: TLabel;
    DBEdit51: TDBEdit;
    Label194: TLabel;
    DBEdit108: TDBEdit;
    Label153: TLabel;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox35: TDBCheckBox;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    RzGroupBox2: TRzGroupBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    Label196: TLabel;
    RxDBComboBox18: TRxDBComboBox;
    DBCheckBox29: TDBCheckBox;
    Label211: TLabel;
    DBEdit117: TDBEdit;
    Label212: TLabel;
    RxDBLookupCombo48: TRxDBLookupCombo;
    TS_Download: TRzTabSheet;
    Panel8: TPanel;
    SMDBGrid10: TSMDBGrid;
    Label213: TLabel;
    Label214: TLabel;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    cbxTipoPessoaXML: TComboBox;
    edtCNPJXML: TMaskEdit;
    Label215: TLabel;
    DBEdit118: TDBEdit;
    Label216: TLabel;
    DBEdit119: TDBEdit;
    SpeedButton12: TSpeedButton;
    Label217: TLabel;
    DBEdit120: TDBEdit;
    RxDBComboBox19: TRxDBComboBox;
    Label218: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBComboBox1Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure btnCadConsultarClick(Sender: TObject);
    procedure chkRepresentanteClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo17Enter(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure RzDBCheckBox1Click(Sender: TObject);
    procedure RzDBCheckBox2Click(Sender: TObject);
    procedure Panel3Enter(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo18CloseUp(Sender: TObject);
    procedure RxDBLookupCombo19CloseUp(Sender: TObject);
    procedure RxDBLookupCombo20CloseUp(Sender: TObject);
    procedure RxDBLookupCombo21CloseUp(Sender: TObject);
    procedure RxDBLookupCombo22CloseUp(Sender: TObject);
    procedure RxDBLookupCombo18DropDown(Sender: TObject);
    procedure RxDBLookupCombo19DropDown(Sender: TObject);
    procedure RxDBLookupCombo20DropDown(Sender: TObject);
    procedure RxDBLookupCombo21DropDown(Sender: TObject);
    procedure RxDBLookupCombo22DropDown(Sender: TObject);
    procedure RxDBLookupCombo18Enter(Sender: TObject);
    procedure gbxConta_OrcamentoEnter(Sender: TObject);
    procedure gbxConta_OrcamentoExit(Sender: TObject);
    procedure RxDBLookupCombo18KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RxDBLookupCombo19KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RxDBLookupCombo20KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RxDBLookupCombo21KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RxDBLookupCombo22KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckAlunoClick(Sender: TObject);
    procedure GroupBox3Enter(Sender: TObject);
    procedure GroupBox2Enter(Sender: TObject);
    procedure btnCadConsultar_ReceitaClick(Sender: TObject);
    procedure Customizado1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure Personalizado21Click(Sender: TObject);
    procedure DBMemo4KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo5KeyPress(Sender: TObject; var Key: Char);
    procedure DBCheckBox19Click(Sender: TObject);
    procedure DBCheckBox20Click(Sender: TObject);
    procedure DBCheckBox21Click(Sender: TObject);
    procedure RZPageControlDadosChange(Sender: TObject);
    procedure edtCod_EnqIPI_SuframaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCod_EnqIPIKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBCheckBox3Exit(Sender: TObject);
    procedure RxDBComboBox5Exit(Sender: TObject);
    procedure DBEdit65Enter(Sender: TObject);
    procedure DBEdit65Exit(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure RxDBLookupCombo8Exit(Sender: TObject);
    procedure RxDBLookupCombo10Exit(Sender: TObject);
    procedure RxDBComboBox2Exit(Sender: TObject);
    procedure DBEdit25Enter(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure DBEdit50Enter(Sender: TObject);
    procedure DBEdit50Exit(Sender: TObject);
    procedure RxDBLookupCombo39Exit(Sender: TObject);
    procedure DBEdit63Enter(Sender: TObject);
    procedure DBEdit63Exit(Sender: TObject);
    procedure SMDBGrid7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBCheckBox2Enter(Sender: TObject);
    procedure DBCheckBox2Exit(Sender: TObject);
    procedure RxDBLookupCombo7Change(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure TS_FisicaEnter(Sender: TObject);
    procedure CadastrodeConsumidor1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure RxDBLookupCombo27Change(Sender: TObject);
    procedure DBEdit102Exit(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure DBCheckBox4Click(Sender: TObject);
    procedure RxDBLookupCombo44DropDown(Sender: TObject);
    procedure RxDBLookupCombo44CloseUp(Sender: TObject);
    procedure RxDBLookupCombo44KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure btnCopiar_FilClick(Sender: TObject);
    procedure btnConfDescontosClick(Sender: TObject);
    procedure btnFiscalProdutoClick(Sender: TObject);
    procedure RzDBCheckBox3Click(Sender: TObject);
    procedure edtCod_EnqIPI_DrawBackKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Personalizadonafilial1Click(Sender: TObject);
    procedure Etiqueta1Click(Sender: TObject);
    procedure pnlCAEEnter(Sender: TObject);
    procedure DBEdit116Exit(Sender: TObject);
    procedure DBEdit116KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit113Exit(Sender: TObject);
    procedure DBEdit113Enter(Sender: TObject);
    procedure RzPageControl3Change(Sender: TObject);
    procedure DBCheckBox33Exit(Sender: TObject);
    procedure btnSefazClick(Sender: TObject);
    procedure btnReceitaClick(Sender: TObject);
    procedure DBEdit117Exit(Sender: TObject);
    procedure pnlCompras_PedidosEnter(Sender: TObject);
    procedure RxDBLookupCombo48Enter(Sender: TObject);
    procedure edtCNPJXMLEnter(Sender: TObject);
    procedure edtCNPJXMLExit(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DBCheckBox5Click(Sender: TObject);
  private
    { Private declarations }
    fDMCadPessoa: TDMCadPessoa;
    ffNFe_ConsultaCadastro: TfNFe_ConsultaCadastro;
    ffrmCadPessoa_Servico: TfrmCadPessoa_Servico;
    ffrmCadPessoa_Servico_Int: TfrmCadPessoa_Servico_Int;
    ffrmConsAgenda: TfrmConsAgenda;
    vCod_Alfa_Ant: string;
    vRG_Ant: string;
    vTP_Cliente_Ant: string;
    vCAE_Ant : String;
    vStatus_Pessoa : String; //I= Inserir   A= Alterar   E=Excluir
    procedure prc_Inserir_Registro(Tipo: string);
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer = 0);
    procedure prc_Le_cdsPessoa_Consulta(Tipo: Integer);
    procedure prc_Configurarr_vTipoPessoa;
    procedure prc_Limpar_Edit_Consulta;
    procedure prc_Abrir_Pessoas_Outras;
    procedure prc_Chamar_frmSel_ContaOrc(Campo: string; Codigo: Integer ; Tipo_RD : String = '');
    procedure prc_Posiciona_Pessoa;
    procedure prc_Inserir_mResumo(Tipo, Codigo, Nome: string);
    procedure prc_Abrir_EnqIPI(ID: Integer);
    procedure prc_Abrir_Atividade(ID: Integer);
    procedure prc_CriaExcel(vDados: TDataSource);
    procedure prc_opcao_vendedor;
    procedure prc_Habilitar;
    procedure prc_Preenche_Dados;
    procedure prc_Consulta_Sefaz;
    procedure prc_Consulta_Receita;

    
  public
    { Public declarations }
  end;

var
  frmCadPessoa: TfrmCadPessoa;

implementation

uses
  UMenu, DmdDatabase, rsDBUtils, uUtilPadrao, uNFeComandos, URelPessoa, USel_ContaOrc, USel_EnqIPI, USel_Atividade, UVendedor_Config,
  UCadPessoa_ProdICMS, USel_CBenef, uUtilCliente, uPessoa, MaskUtils;

{$R *.dfm}

procedure TfrmCadPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fDMCadPessoa.qParametros_Geral.Close;
  fDMCadPessoa.qParametros_Geral.Open;
  prc_Grava_Grid(SMDBGrid1, Name, fDMCadPessoa.qParametros_GeralENDGRIDS.AsString);
  Action := Cafree;
end;

procedure TfrmCadPessoa.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadPessoa);
end;

procedure TfrmCadPessoa.FormShow(Sender: TObject);
var
  i: Integer;
begin
  fDMCadPessoa := TDMCadPessoa.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadPessoa);
  prc_le_Grid(SMDBGrid1, Name, fDMCadPessoa.qParametros_GeralENDGRIDS.AsString);
  SMDBGrid1.ClearFilter;

  if fMenu.vTipoPessoa = 'C' then
    ComboBox1.ItemIndex := 0
  else if fMenu.vTipoPessoa = 'F' then
    ComboBox1.ItemIndex := 1
  else if fMenu.vTipoPessoa = 'T' then
    ComboBox1.ItemIndex := 2
  else if fMenu.vTipoPessoa = 'V' then
    ComboBox1.ItemIndex := 3
  else if fMenu.vTipoPessoa = 'N' then
    ComboBox1.ItemIndex := 7
  else if fMenu.vTipoPessoa = 'A' then
    ComboBox1.ItemIndex := 8;
  TS_Servico.TabVisible := (fDMCadPessoa.qParametrosUSA_SERVICO.AsString = 'S');
  fDMCadPessoa.cdsCidade.IndexFieldNames := 'NOME';
  DBCheckBox15.Visible := (fDMCadPessoa.qParametrosUSA_TAMANHO_AGRUPADO_NFE.AsString = 'S');
  gbxConta_Orcamento.Visible := (fDMCadPessoa.qParametrosUSA_CONTA_ORCAMENTO.AsString = 'S');
  Label84.Visible := (fDMCadPessoa.qParametrosUSA_EDI.AsString = 'S');
  RxDBLookupCombo27.Visible := (fDMCadPessoa.qParametrosUSA_EDI.AsString = 'S');

  ckAluno.Visible := fDMCadPessoa.qParametrosESCOLA.AsString = 'S';
  TS_Aluno.TabVisible := ckAluno.Checked;
  TS_RegrasFiscais.TabVisible := not ckAluno.Checked;
  TS_Pessoa_Endereco.TabVisible := not ckAluno.Checked;
  DBRadioGroup1.Visible := not ckAluno.Checked;
  RzGroupBox3.Visible := fDMCadPessoa.qParametros_GeralUSA_SENHA_CONTRASENHA.AsString = 'S';
  Label87.Visible := (fDMCadPessoa.qParametrosUSA_LIMITE_CREDITO.AsString = 'S');
  DBEdit47.Visible := (fDMCadPessoa.qParametrosUSA_LIMITE_CREDITO.AsString = 'S');
  // Foi comentado no dia 12/03/2019 - o GroupBox4 era usado pelo vendedor, agora est� no PageControl
//  if fDMCadPessoa.qParametrosESCOLA.AsString = 'S' then
//  begin
//    DBCheckBox5.Caption := 'Professor';
//    GroupBox4.Caption := ' Op��o do Professor ';
//    Label26.Caption := 'Professor';
//    ComboBox1.Clear;
//    ComboBox1.Items.Add('Cliente');
//    ComboBox1.Items.Add('Fornecedor');
//    ComboBox1.Items.Add('Transportadora');
//    ComboBox1.Items.Add('Professor');
//    ComboBox1.Items.Add('Atelier');
//    ComboBox1.Items.Add('Exporta��o');
//    ComboBox1.Items.Add('Preposto');
//    ComboBox1.Items.Add('Funcionario');
//    ComboBox1.Items.Add('Ambos');
//    ComboBox1.ItemIndex := 8;
//    for i := 1 to SMDBGrid1.ColCount - 2 do
//    begin
//      if (SMDBGrid1.Columns[i].FieldName = 'TP_VENDEDOR') then
//        SMDBGrid1.Columns[i].Title.Caption := 'Professor';
//    end;
//  end;
  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'COD_ALFA') then
      SMDBGrid1.Columns[i].Visible := (fDMCadPessoa.qParametrosEMPRESA_CONTABIL.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'COD_VENDEDOR') then
      SMDBGrid1.Columns[i].Visible := (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_VENDEDOR') or (SMDBGrid1.Columns[i].FieldName = 'PERC_COMISSAO_VEND') then
      SMDBGrid1.Columns[i].Visible := (fDMCadPessoa.qParametrosUSA_VENDEDOR.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_VENDEDOR_INT') then
      SMDBGrid1.Columns[i].Visible := (fDMCadPessoa.qParametros_GeralUSA_VENDEDOR_INT.AsString = 'S');
  end;
  DBCheckBox16.Visible := (fDMCadPessoa.qParametrosCADASTRA_ORGAO_PUBLICO.AsString = 'S');
  Label92.Visible := (fDMCadPessoa.qParametrosEMPRESA_CONTABIL.AsString = 'S');
  DBEdit50.Visible := (fDMCadPessoa.qParametrosEMPRESA_CONTABIL.AsString = 'S');
  Label93.Visible := (fDMCadPessoa.qParametrosUSA_CARIMBO.AsString = 'S');
  DBEdit51.Visible := (fDMCadPessoa.qParametrosUSA_CARIMBO.AsString = 'S');
  Label153.Visible := (fDMCadPessoa.qParametrosUSA_CARIMBO.AsString = 'S');
  TS_Fisica.TabVisible := (fDMCadPessoa.qParametros_GeralMOSTRAR_DADOS_PESSOA_FISICA.AsString = 'S');
  DBDateEdit11.readonly := not (fDMCadPessoa.qParametros_GeralLIBERAR_DIG_DTCADASTRO.AsString = 'S');
  Label154.Visible := (fDMCadPessoa.qParametros_NFeUSA_OPCAO_IMP_COD_CLI.AsString = 'S');
  DBCheckBox23.Visible := (fDMCadPessoa.qParametros_NFeUSA_OPCAO_IMP_COD_CLI.AsString = 'S');
  Label155.Visible := (fDMCadPessoa.qParametros_GeralUSAR_PESSOA_FILIAL.AsString = 'S');
  rxdbFilial.Visible := (fDMCadPessoa.qParametros_GeralUSAR_PESSOA_FILIAL.AsString = 'S');
  Label156.Visible := (fDMCadPessoa.qParametros_GeralUSAR_PESSOA_FILIAL.AsString = 'S');
  RxDBLookupCombo37.Visible := (fDMCadPessoa.qParametros_GeralUSAR_PESSOA_FILIAL.AsString = 'S');

  Label160.Visible := (fDMCadPessoa.qParametros_GeralMOSTRAR_COD_CONTABIL.AsString = 'S');
  Label161.Visible := (fDMCadPessoa.qParametros_GeralMOSTRAR_COD_CONTABIL.AsString = 'S');
  DBEdit83.Visible := (fDMCadPessoa.qParametros_GeralMOSTRAR_COD_CONTABIL.AsString = 'S');
  DBEdit84.Visible := (fDMCadPessoa.qParametros_GeralMOSTRAR_COD_CONTABIL.AsString = 'S');

  Label183.Visible := (fDMCadPessoa.qParametros_FinMOSTRAR_TIPO_CRED.AsString = 'S');
  RxDBComboBox15.Visible := (fDMCadPessoa.qParametros_FinMOSTRAR_TIPO_CRED.AsString = 'S');

  Label184.Visible := (fDMCadPessoa.qParametros_GeralINF_USUARIO_VEND.AsString = 'S');
  RxDBLookupCombo41.Visible := (fDMCadPessoa.qParametros_GeralINF_USUARIO_VEND.AsString = 'S');
  DBEdit109.Visible := (fDMCadPessoa.qParametros_GeralINF_USUARIO_VEND.AsString = 'S');
  lblSenha.Visible := (fDMCadPessoa.qParametros_GeralINF_USUARIO_VEND.AsString = 'S');
  DBCheckBox26.Visible := (fDMCadPessoa.qParametros_RecXMLUSA_OC_XML.AsString = 'S');

  Label188.Visible := (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S');
  CurrencyEdit1.Visible := (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S');
  SpeedButton11.Visible := (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S');

  TS_TipoMaterial.TabVisible := (fDMCadPessoa.qParametros_GeralUSA_TIPO_MATERIAL.AsString = 'S');
  TS_Pessoa_Fil.TabVisible   := (fDMCadPessoa.qParametros_NFeUSA_CLIENTE_FAT_FIL.AsString = 'S');

  DBCheckBox29.Visible := (fDMCadPessoa.qParametros_RecXMLCONTROLAR_GRAVA_PROD.AsString = 'S');
  Label194.Visible := (fDMCadPessoa.qParametros_PedUSA_CAIXINHA.AsString = 'S');
  DBEdit108.Visible := (fDMCadPessoa.qParametros_PedUSA_CAIXINHA.AsString = 'S');
  DBCheckBox32.Visible := (fDMCadPessoa.qParametros_NFeIMP_NOMEPROD_CLIENTE.AsString = 'S');
  btnConfDescontos.Visible := ((fDMCadPessoa.qParametros_UsuarioLIBERA_CONFIG_VENDEDOR.AsString = 'S')
                              and (fDMCadPessoa.qParametros_ComUSA_CONFIG_IND.AsString = 'S'));

  Label26.Visible          := (fDMCadPessoa.qParametrosUSA_VENDEDOR.AsString = 'S');
  RxDBLookupCombo4.Visible := (fDMCadPessoa.qParametrosUSA_VENDEDOR.AsString = 'S');
  SpeedButton6.Visible     := (fDMCadPessoa.qParametrosUSA_VENDEDOR.AsString = 'S');
  Label27.Visible          := (fDMCadPessoa.qParametrosUSA_VENDEDOR.AsString = 'S');
  DBEdit24.Visible         := (fDMCadPessoa.qParametrosUSA_VENDEDOR.AsString = 'S');
  Label198.Visible         := (fDMCadPessoa.qParametrosUSA_VENDEDOR.AsString = 'S');
  Edit1.Visible            := (fDMCadPessoa.qParametrosUSA_VENDEDOR.AsString = 'S');
  Label197.Visible          := (fDMCadPessoa.qParametros_GeralUSA_VENDEDOR_INT.AsString = 'S');
  RxDBLookupCombo45.Visible := (fDMCadPessoa.qParametros_GeralUSA_VENDEDOR_INT.AsString = 'S');
  Label199.Visible         := (fDMCadPessoa.qParametros_GeralUSA_VENDEDOR_INT.AsString = 'S');
  Edit2.Visible            := (fDMCadPessoa.qParametros_GeralUSA_VENDEDOR_INT.AsString = 'S');

  btnFiscalProduto.Visible := (fDMCadPessoa.qParametros_NFeUSA_REGRA_CLI_PROD.AsString = 'S');
  TS_CAE.TabVisible        := (fDMCadPessoa.qParametros_GeralUSA_CAE_PESSOA.AsString = 'S');
  DBCheckBox34.Visible     := (fDMCadPessoa.qParametros_NFeIMP_TAMANHO_FINAL.AsString = 'S');

  DBCheckBox36.Visible     := (fDMCadPessoa.qParametros_ProdUSA_PRECO_VAREJO.AsString = 'S');

  DBEdit117.Visible := (fDMCadPessoa.qParametros_PedUSA_UNIDADE_CLIENTE.AsString = 'S');
  Label211.Visible  := (fDMCadPessoa.qParametros_PedUSA_UNIDADE_CLIENTE.AsString = 'S');
end;

procedure TfrmCadPessoa.btnInserirClick(Sender: TObject);
begin
  vStatus_Pessoa := 'I';
  prc_Configurarr_vTipoPessoa;
  prc_Inserir_Registro(fMenu.vTipoPessoa);
end;

procedure TfrmCadPessoa.btnExcluirClick(Sender: TObject);
var
  vCodAux: Integer;
begin
  if not (fDMCadPessoa.cdsPessoa_Consulta.Active) or (fDMCadPessoa.cdsPessoa_Consulta.IsEmpty) or (fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger <= 0) then
    exit;
  if fDMCadPessoa.cdsPessoaCODIGO.AsInteger = 99999 then
  begin
    MessageDlg('*** Este registro n�o pode ser exclu�do, � usado para Consumidor Final!', mtError, [mbOk], 0);
    exit;
  end;
  vStatus_Pessoa := 'E';

  prc_Posiciona_Pessoa;

  prc_Abrir_Pessoas_Outras;

  if fDMCadPessoa.cdsPessoa.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro ' + fDMCadPessoa.cdsPessoa_ConsultaNOME.AsString + '?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;

  vCodAux := fDMCadPessoa.cdsPessoa_Consulta.RecNo;
  prc_Excluir_Registro;
  prc_Consultar;
  if vCodAux <= fDMCadPessoa.cdsPessoa_Consulta.RecordCount then
    fDMCadPessoa.cdsPessoa_Consulta.RecNo := vCodAux;
end;

procedure TfrmCadPessoa.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmCadPessoa.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadPessoa.cdsPessoa.IsEmpty) or not (fDMCadPessoa.cdsPessoa.Active) or (fDMCadPessoa.cdsPessoaCODIGO.AsInteger < 1) then
    exit;
  fDMCadPessoa.cdsPessoa.Edit;
  vStatus_Pessoa := 'A';
  prc_Habilitar;
end;

procedure TfrmCadPessoa.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadPessoa.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadPessoa.cdsPessoa.State in [dsBrowse]) or not (fDMCadPessoa.cdsPessoa.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar altera��o/inclus�o do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  fDMCadPessoa.cdsPessoa.CancelUpdates;
  if fDMCadPessoa.cdsPessoa_Fiscal.State in [dsEdit, dsInsert] then
    fDMCadPessoa.cdsPessoa_Fiscal.CancelUpdates;
  if fDMCadPessoa.cdsPessoa_Fisica.State in [dsEdit, dsInsert] then
    fDMCadPessoa.cdsPessoa_Fisica.CancelUpdates;
  if fDMCadPessoa.cdsPessoa_Ped.State in [dsEdit, dsInsert] then
    fDMCadPessoa.cdsPessoa_Ped.CancelUpdates;

  fDMCadPessoa.prc_Abrir_Cidade('');

  prc_Habilitar;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadPessoa.prc_Consultar(ID: Integer = 0);
begin
  SMDBGrid1.UnSelectAllClick(SMDBGrid1);
  SMDBGrid1.DisableScroll;
  prc_Configurarr_vTipoPessoa;
  fDMCadPessoa.cdsPessoa_Consulta.Close;
  fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.ctConsulta;
  if ID > 0 then
    fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' WHERE P.CODIGO = ' + IntToStr(ID)
  else
  begin
    fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' WHERE 1 = 1';
    if Trim(Edit4.Text) <> '' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND ((P.NOME LIKE ' + QuotedStr('%' + Edit4.Text + '%') + ')' + ' OR (P.FANTASIA LIKE ' + QuotedStr('%' + Edit4.Text + '%') + '))';
    if trim(rxdbFilial.Text) <> '' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND (P.FILIAL = ' + IntToStr(rxdbFilial.KeyValue) + ')';

    if fMenu.vTipoPessoa = 'C' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.TP_CLIENTE = ' + QuotedStr('S');
    if fMenu.vTipoPessoa = 'F' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.TP_FORNECEDOR = ''S''';
    if fMenu.vTipoPessoa = 'T' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.TP_TRANSPORTADORA = ''S''';
    if fMenu.vTipoPessoa = 'V' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.TP_VENDEDOR = ''S''';
    if fMenu.vTipoPessoa = 'A' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.TP_ATELIER = ''S''';
    if fMenu.vTipoPessoa = 'X' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.TP_EXPORTACAO = ''S''';
    if fMenu.vTipoPessoa = 'P' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.TP_PREPOSTO = ''S''';
    if fMenu.vTipoPessoa = 'N' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.TP_FUNCIONARIO = ''S''';
    case ComboBox2.ItemIndex of
      0:
        fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.INATIVO = ''N''';
      1:
        fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.INATIVO = ''S''';
    end;

    if DateEdit1.Date > 10 then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.DTCADASTRO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.date));
    if DateEdit2.Date > 10 then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND P.DTCADASTRO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.date));
    if Trim(Edit1.Text) <> '' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND (VEND.NOME LIKE ' + QuotedStr('%' + Edit1.Text + '%') + ')';
    if Trim(Edit2.Text) <> '' then
      fDMCadPessoa.sdsPessoa_Consulta.CommandText := fDMCadPessoa.sdsPessoa_Consulta.CommandText + ' AND (VEND2.NOME LIKE ' + QuotedStr('%' + Edit2.Text + '%') + ')';
  end;
  fDMCadPessoa.cdsPessoa_Consulta.Open;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmCadPessoa.prc_Excluir_Registro;
var
  vCodAux: Integer;
begin
  try
    vCodAux := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
    fDMCadPessoa.prc_Excluir;
  except
    on e: Exception do
    begin
      prc_Consultar;
      if vCodAux > 0 then
        fDMCadPessoa.cdsPessoa.Locate('CODIGO', vCodAux, ([Locaseinsensitive]));
      raise;
    end
  end;
  fDMCadPessoa.qParametros_Geral.Close;
  fDMCadPessoa.qParametros_Geral.Open;
  if fDMCadPessoa.qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S' then
    fDMCadPessoa.prc_Gravar_Log(vCodAux,'E');
end;

procedure TfrmCadPessoa.prc_Gravar_Registro;
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vIPI_Suspenso, vPIS_Suspenso: string;
  vCodAux: Integer;
begin
  fDMCadPessoa.prc_Abrir_Cidade('');

  if (fDMCadPessoa.cdsPessoaTP_VENDEDOR.AsString = 'S') and (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S') and (CurrencyEdit1.AsInteger <= 0) then
  begin
    MessageDlg('*** N�o informado o c�digo do vendedor espec�fico!', mtError, [mbOk], 0);
    RzPageControl3.ActivePage := ts_Vendedor;
    CurrencyEdit1.SetFocus;
    exit;
  end;

  if fDMCadPessoa.fnc_Erro_Registro then
  begin
    MessageDlg(fDMCadPessoa.vMsgPessoa, mtError, [mbOk], 0);
    exit;
  end;
  fDMCadPessoa.cdsPessoaENDERECO.AsString := trim(fDMCadPessoa.cdsPessoaENDERECO.AsString);
  fDMCadPessoa.cdsPessoaBAIRRO.AsString := trim(fDMCadPessoa.cdsPessoaBAIRRO.AsString);
  fDMCadPessoa.cdsPessoaCOMPLEMENTO_END.AsString := trim(fDMCadPessoa.cdsPessoaCOMPLEMENTO_END.AsString);
  fDMCadPessoa.cdsPessoaNUM_END.AsString := trim(fDMCadPessoa.cdsPessoaNUM_END.AsString);
  vCodPessoa_Pos := 0;

  sds := TSQLDataSet.Create(nil);
  ID.TransactionID := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata := True;
    sds.GetMetadata := False;
    sds.CommandText := ' UPDATE TABELALOC SET FLAG = 1 ' + ' WHERE TABELA = ' + QuotedStr('PESSOA');
    sds.ExecSQL();

    vCodAux := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
    fDMCadPessoa.cdsPessoaCIDADE.AsString := RxDBLookupCombo2.Text;
    fDMCadPessoa.cdsPessoaCIDADE_ENT.AsString := RxDBLookupCombo10.Text;
    fDMCadPessoa.cdsPessoaCIDADE_PGTO.AsString := RxDBLookupCombo8.Text;

    //Foi colocado nesse ponto para gravar primeiro
    if (fDMCadPessoa.cdsPessoaTP_VENDEDOR.AsString = 'S') and (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S') then
    begin
      if (CurrencyEdit1.AsInteger <= 0) and (fDMCadPessoa.cdsPessoa_VendCOD_VENDEDOR.AsInteger > 0) then
      begin
        fDMCadPessoa.cdsPessoa_Vend.Delete;
        fDMCadPessoa.cdsPessoa_Vend.ApplyUpdates(0);
      end
      else if (CurrencyEdit1.AsInteger > 0) and (CurrencyEdit1.AsInteger <> fDMCadPessoa.cdsPessoa_VendCOD_VENDEDOR.AsInteger) then
      begin
        if fDMCadPessoa.cdsPessoa_VendCOD_VENDEDOR.AsInteger > 0 then
          fDMCadPessoa.cdsPessoa_Vend.Edit
        else if fDMCadPessoa.cdsPessoa_VendCOD_VENDEDOR.AsInteger <= 0 then
        begin
          fDMCadPessoa.cdsPessoa_Vend.Insert;
          fDMCadPessoa.cdsPessoa_VendCODIGO.AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
        end;
        fDMCadPessoa.cdsPessoa_VendCOD_VENDEDOR.AsInteger := CurrencyEdit1.AsInteger;
        fDMCadPessoa.cdsPessoa_Vend.Post;
        fDMCadPessoa.cdsPessoa_Vend.ApplyUpdates(0);
      end;
    end;
    //******

    fDMCadPessoa.prc_Gravar;

    vIPI_Suspenso := fDMCadPessoa.cdsPessoa_FiscalIPI_SUSPENSO.AsString;
    vPIS_Suspenso := fDMCadPessoa.cdsPessoa_FiscalPIS_SUSPENSO.AsString;

    if (fDMCadPessoa.cdsPessoa_FiscalIPI_SUSPENSO.AsString = 'N') then
    begin
      if not (fDMCadPessoa.cdsPessoa_Fiscal.State in [dsEdit, dsInsert]) then
        fDMCadPessoa.cdsPessoa_Fiscal.Edit;
      fDMCadPessoa.cdsPessoa_FiscalIPI_DT_FINAL.Clear;
      fDMCadPessoa.cdsPessoa_FiscalIPI_DT_INICIO.Clear;
      fDMCadPessoa.cdsPessoa_FiscalIPI_ID_CSTIPI.Clear;
      fDMCadPessoa.cdsPessoa_FiscalIPI_OBS.Clear;
    end;
    if (fDMCadPessoa.cdsPessoa_FiscalPIS_SUSPENSO.AsString = 'N') then
    begin
      if not (fDMCadPessoa.cdsPessoa_Fiscal.State in [dsEdit, dsInsert]) then
        fDMCadPessoa.cdsPessoa_Fiscal.Edit;
      fDMCadPessoa.cdsPessoa_FiscalPIS_DT_FINAL.Clear;
      fDMCadPessoa.cdsPessoa_FiscalPIS_DT_INICIO.Clear;
      fDMCadPessoa.cdsPessoa_FiscalPIS_ID_COFINS.Clear;
      fDMCadPessoa.cdsPessoa_FiscalPIS_ID_PIS.Clear;
      fDMCadPessoa.cdsPessoa_FiscalPIS_OBS.Clear;
    end;
    //16/07/20020
    if fDMCadPessoa.qParametros_PedUSA_UNIDADE_CLIENTE.AsString = 'S' then
    begin
      if fDMCadPessoa.cdsPessoa_Ped.State in [dsEdit,dsInsert] then
      begin
        if trim(fDMCadPessoa.cdsPessoa_PedUNIDADE_PADRAO.AsString) = '' then
        begin
          fDMCadPessoa.cdsPessoa_Ped.CancelUpdates;
          if not fDMCadPessoa.cdsPessoa_Ped.IsEmpty then
          begin
            fDMCadPessoa.cdsPessoa_Ped.Delete;
            fDMCadPessoa.cdsPessoa_Ped.ApplyUpdates(0);
          end;
        end
        else
        begin
          fDMCadPessoa.cdsPessoa_Ped.Post;
          fDMCadPessoa.cdsPessoa_Ped.ApplyUpdates(0);
        end;
      end;
    end;
    //*****************

    fDMCadPessoa.cdsPessoa_Fiscal.ApplyUpdates(0);
    fDMCadPessoa.cdsPessoa_Servico.ApplyUpdates(0);
    fDMCadPessoa.cdsPessoa_Servico_Int.ApplyUpdates(0);
    fDMCadPessoa.cdsPessoa_Dep.ApplyUpdates(0);
    fDMCadPessoa.cdsPessoa_Ativ.ApplyUpdates(0);
    fDMCadPessoa.cdsPessoa_Aut.ApplyUpdates(0);
    fDMCadPessoa.cdsPessoa_TipoMat.ApplyUpdates(0);
    fDMCadPessoa.cdsPessoa_Fil.ApplyUpdates(0);
    fDMCadPessoa.cdsPessoa_RefP.ApplyUpdates(0);
    fDMCadPessoa.cdsPessoa_RefC.ApplyUpdates(0);
    //31/08/2020
    if fDMCadPessoa.cdsPessoa_Download.Active then
      fDMCadPessoa.cdsPessoa_Download.ApplyUpdates(0);
    //**********
    //13/08/2019
    if fDMCadPessoa.qParametros_NFeUSA_REGRA_CLI_PROD.AsString = 'S' then
      fDMCadPessoa.cdsPessoa_ProdICMS.ApplyUpdates(0);
    //**************
    if (fDMCadPessoa.cdsVendedor_Config.Active) then
      fDMCadPessoa.cdsVendedor_Config.ApplyUpdates(0);
    if fDMCadPessoa.cdsPessoa_Fisica.State in [dsEdit, dsInsert] then
    begin
      fDMCadPessoa.cdsPessoa_Fisica.Post;
      fDMCadPessoa.cdsPessoa_Fisica.ApplyUpdates(0);
    end;
    fDMCadPessoa.cdsPessoa_Fisica.ApplyUpdates(0);
    if (vIPI_Suspenso = 'N') and (vPIS_Suspenso = 'N') then
    begin
      fDMCadPessoa.cdsPessoa_Fiscal.Delete;
      fDMCadPessoa.cdsPessoa_Fiscal.ApplyUpdates(0);
    end;

    dmDatabase.scoDados.Commit(ID);

    vCodPessoa_Pos := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;

    prc_Habilitar;
    RzPageControl1.ActivePage := TS_Consulta;

    if (not (fDMCadPessoa.cdsPessoa_Consulta.Active)) or (not fDMCadPessoa.cdsPessoa_Consulta.Locate('CODIGO', vCodAux, ([Locaseinsensitive]))) then
      prc_Consultar(vCodAux);
    fDMCadPessoa.cdsPessoa_Consulta.Locate('CODIGO', vCodAux, ([Locaseinsensitive]));

  except
    on e: Exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao gravar o Registro: ' + #13 + e.Message);
    end;
  end;

  fDMCadPessoa.qParametros_Geral.Close;
  fDMCadPessoa.qParametros_Geral.Open;
  if fDMCadPessoa.qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S' then
    fDMCadPessoa.prc_Gravar_Log(vCodAux,vStatus_Pessoa);

  FreeAndNil(sds);
end;

procedure TfrmCadPessoa.prc_Inserir_Registro(Tipo: string);
begin
  if fDMCadPessoa.qParametros_GeralUSAR_PESSOA_FILIAL.AsString = 'S' then
  begin
    fDMCadPessoa.cdsFilial.First;
    if fDMCadPessoa.cdsFilial.RecordCount = 1 then
      vFilial := fDMCadPessoa.cdsFilialID.AsInteger
    else
      prc_Escolhe_Filial;
    if vFilial <= 0 then
      exit
    else if not fDMCadPessoa.cdsFilial.Locate('ID', vFilial, [loCaseInsensitive]) then
    begin
      ShowMessage('Filial n�o encontrada!');
      exit;
    end;
  end;

  fDMCadPessoa.prc_Inserir(Tipo);

  if fDMCadPessoa.cdsPessoa.State in [dsBrowse] then
    Exit;

  RzPageControl1.ActivePage := TS_Cadastro;
  prc_Habilitar;
  RxDBComboBox1.SetFocus;
end;

procedure TfrmCadPessoa.RzPageControl1Change(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Cadastro then
  begin
//    lblRG.Visible := (RxDBComboBox1.ItemIndex = 1);
//    dbeRG.Visible := (RxDBComboBox1.ItemIndex = 1);
    lblRG.Visible := (fDMCadPessoa.cdsPessoa_ConsultaPESSOA.AsString = 'F');
    dbeRG.Visible := (fDMCadPessoa.cdsPessoa_ConsultaPESSOA.AsString = 'F');

    chkRepresentanteClick(Sender);
    if not (fDMCadPessoa.cdsPessoa.State in [dsEdit, dsInsert]) then
      prc_Posiciona_Pessoa;

    prc_Abrir_Pessoas_Outras;

    CurrencyEdit1.AsInteger := 0;
    Label188.Visible := ((fDMCadPessoa.cdsPessoaTP_VENDEDOR.AsString = 'S') and (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S'));
    CurrencyEdit1.Visible := ((fDMCadPessoa.cdsPessoaTP_VENDEDOR.AsString = 'S') and (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S'));
    SpeedButton11.Visible := ((fDMCadPessoa.cdsPessoaTP_VENDEDOR.AsString = 'S') and (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S'));
    if (fDMCadPessoa.cdsPessoaTP_VENDEDOR.AsString = 'S') and (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S') then
      CurrencyEdit1.AsInteger := fDMCadPessoa.cdsPessoa_VendCOD_VENDEDOR.AsInteger;

    DBEdit6Enter(Sender);
    RZPageControlDados.ActivePage := TS_Pessoa_Dados;
    fDMCadPessoa.prc_Abre_Carteira(fDMCadPessoa.cdsContasID.AsInteger);

    if not (fDMCadPessoa.cdsPessoa.State in [dsEdit, dsInsert]) then
    begin
      //prc_Posiciona_Pessoa;
      DBCheckBox3Exit(Sender);
      TS_Fisica.TabVisible := ((fDMCadPessoa.cdsPessoaPESSOA.AsString = 'F') and (fDMCadPessoa.qParametros_GeralMOSTRAR_DADOS_PESSOA_FISICA.AsString = 'S'));
    end;

    DBCheckBox27.Visible := (fDMCadPessoa.cdsPessoaID_EDI.AsInteger > 0);

    Label190.Visible := (fDMCadPessoa.cdsPessoaTP_TRANSPORTADORA.AsString = 'S');
    DBEdit106.Visible := (fDMCadPessoa.cdsPessoaTP_TRANSPORTADORA.AsString = 'S');
    Label191.Visible := (fDMCadPessoa.cdsPessoaTP_TRANSPORTADORA.AsString = 'S');
    DBEdit107.Visible := (fDMCadPessoa.cdsPessoaTP_TRANSPORTADORA.AsString = 'S');

    DBCheckBox33.Visible := ((fDMCadPessoa.cdsPessoaUF.AsString = 'RS') and (fDMCadPessoa.qParametros_GeralUSA_CAE_PESSOA.AsString = 'S'));

    prc_opcao_vendedor;
  end;
end;

procedure TfrmCadPessoa.RxDBLookupCombo1Change(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
  begin
    fDMCadPessoa.cdsUF.Locate('UF', RxDBLookupCombo1.Value, [loCaseInsensitive]);
    if fDMCadPessoa.cdsUFIDPAIS.AsInteger > 0 then
      fDMCadPessoa.cdsPessoaID_PAIS.AsInteger := fDMCadPessoa.cdsUFIDPAIS.AsInteger;
    DBCheckBox33.Visible := ((RxDBLookupCombo1.Text = 'RS') and (fDMCadPessoa.qParametros_GeralUSA_CAE_PESSOA.AsString = 'S'));
  end;
end;

procedure TfrmCadPessoa.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadPessoa.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    fDMCadPessoa.cdsPessoaUF.AsString := fDMCadPessoa.cdsCidadeUF.AsString;
end;

procedure TfrmCadPessoa.SpeedButton4Click(Sender: TObject);
begin
  fDMCadPessoa.cdsCidade.Close;
  fDMCadPessoa.cdsCidade.Open;
end;

procedure TfrmCadPessoa.SpeedButton2Click(Sender: TObject);
begin
  fDMCadPessoa.cdsCondPgto.Close;
  fDMCadPessoa.cdsCondPgto.Open;
end;

procedure TfrmCadPessoa.SpeedButton3Click(Sender: TObject);
begin
  fDMCadPessoa.cdsContas.Close;
  fDMCadPessoa.cdsContas.Open;
end;

procedure TfrmCadPessoa.SpeedButton5Click(Sender: TObject);
begin
  fDMCadPessoa.cdsTipoCobranca.Close;
  fDMCadPessoa.cdsTipoCobranca.Open;
end;

procedure TfrmCadPessoa.SpeedButton6Click(Sender: TObject);
begin
  fDMCadPessoa.cdsVendedor.Close;
  fDMCadPessoa.cdsVendedor.Open;
end;

procedure TfrmCadPessoa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if fDMCadPessoa.cdsPessoa.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg('Fechar esta tela sem confirmar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      CanClose := False
    else
      CanClose := True;
  end;
end;

procedure TfrmCadPessoa.Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadPessoa.DBEdit6Enter(Sender: TObject);
begin
  if fDMCadPessoa.cdsPESSOAPessoa.AsString = 'J' then
    fDMCadPessoa.cdsPESSOACNPJ_CPF.EditMask := '00.000.000/0000-00'
  else if fDMCadPessoa.cdsPESSOAPessoa.AsString = 'F' then
    fDMCadPessoa.cdsPESSOACNPJ_CPF.EditMask := '000.000.000-00'
  else if fDMCadPessoa.cdsPESSOAPessoa.AsString = 'E' then
    fDMCadPessoa.cdsPESSOACNPJ_CPF.EditMask := '';
end;

procedure TfrmCadPessoa.DBEdit6Exit(Sender: TObject);
var
  vNomeAux: string;
  vAux: string;
begin
  vAux := Monta_Numero(DBEdit6.Text, 0);
  if (trim(vAux) = '') or (copy(vAux, 1, 9) = '000000000') then
    exit;
  if fDMCadPessoa.cdsPessoaPESSOA.AsString = 'J' then
  begin
    if not ValidaCNPJ(DBEdit6.Text) then
    begin
      ShowMessage('CNPJ incorreto!');
      fDMCadPessoa.cdsPessoaCNPJ_CPF.Clear;
      DBEdit6.SetFocus;
    end;
  end
  else if fDMCadPessoa.cdsPessoaPESSOA.AsString = 'F' then
  begin
    if not ValidaCPF(DBEdit6.Text) then
    begin
      ShowMessage('CPF incorreto!');
      fDMCadPessoa.cdsPessoaCNPJ_CPF.Clear;
      DBEdit6.SetFocus;
    end;
  end;
  if (fDMCadPessoa.qParametros_GeralPERMITE_CNPJ_DUP.AsString = 'S') then
    exit;
  if not (fDMCadPessoa.cdsPessoaCNPJ_CPF.IsNull) then
  begin
    if (fDMCadPessoa.qParametros_GeralPERMITE_CNPJ_DUPLICADO_TRANSP.AsString = 'S') and (fDMCadPessoa.cdsPessoaTP_TRANSPORTADORA.AsString = 'S') then
      vNomeAux := VerificaDuplicidade(DBEdit6.Text, 'T', fDMCadPessoa.cdsPessoaCODIGO.AsInteger, fDMCadPessoa.cdsPessoaFILIAL.AsInteger)
    else if fDMCadPessoa.qParametros_GeralUSAR_PESSOA_FILIAL.AsString = 'S' then
      vNomeAux := VerificaDuplicidade(DBEdit6.Text, 'P', fDMCadPessoa.cdsPessoaCODIGO.AsInteger, fDMCadPessoa.cdsPessoaFILIAL.AsInteger)
    else
      vNomeAux := VerificaDuplicidade(DBEdit6.Text, 'P', fDMCadPessoa.cdsPessoaCODIGO.AsInteger, 0);
    if trim(vNomeAux) <> '' then
    begin
      ShowMessage('CNPJ ou CPF j� utilizado para ' + vNomeAux + '!');
      fDMCadPessoa.cdsPessoaCNPJ_CPF.Clear;
      DBEdit6.SetFocus;
    end;
  end;
end;

procedure TfrmCadPessoa.SMDBGrid1GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadPessoa.cdsPessoa_ConsultaINATIVO.AsString = 'S' then
    AFont.Color := clRed;
end;

procedure TfrmCadPessoa.RxDBComboBox1Exit(Sender: TObject);
begin
  if RxDBComboBox1.ItemIndex = 0 then
    fDMCadPessoa.cdsPESSOACNPJ_CPF.EditMask := '00.000.000/0000-00'
  else if RxDBComboBox1.ItemIndex = 1 then
  begin
    fDMCadPessoa.cdsPESSOACNPJ_CPF.EditMask := '000.000.000-00';
    fDMCadPessoa.cdsPessoaID_REGIME_TRIB.AsInteger := 1;
  end
  else if RxDBComboBox1.ItemIndex = 2 then
    fDMCadPessoa.cdsPESSOACNPJ_CPF.EditMask := '';
  lblRG.Visible := (RxDBComboBox1.ItemIndex = 1);
  dbeRG.Visible := (RxDBComboBox1.ItemIndex = 1);
  if (fDMCadPessoa.cdsPessoa.State in [dsInsert]) or (fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.IsNull) then
  begin
    if RxDBComboBox1.ItemIndex = 0 then
      fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.AsInteger := 1
    else if RxDBComboBox1.ItemIndex = 1 then
      fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.AsInteger := 9
    else
      fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.AsInteger := 9;
  end;
  if (fDMCadPessoa.cdsPessoa.State in [dsInsert]) or (fDMCadPessoa.cdsPessoaTIPO_CONSUMIDOR.IsNull) then
  begin
    if RxDBComboBox1.ItemIndex = 1 then
      fDMCadPessoa.cdsPessoaTIPO_CONSUMIDOR.AsInteger := 1
    else
      fDMCadPessoa.cdsPessoaTIPO_CONSUMIDOR.AsInteger := 0;
  end;

  TS_Fisica.TabVisible := ((fDMCadPessoa.cdsPessoaPESSOA.AsString = 'F') and (fDMCadPessoa.qParametros_GeralMOSTRAR_DADOS_PESSOA_FISICA.AsString = 'S'));
end;

procedure TfrmCadPessoa.SpeedButton7Click(Sender: TObject);
begin
  fDMCadPessoa.cdsContas.Close;
  fDMCadPessoa.cdsContas.Open;
end;

procedure TfrmCadPessoa.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: string;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadPessoa.cdsPessoa_Consulta.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[i] = Column) then
      SMDBGrid1.Columns.Items[i].Title.Color := clBtnFace;
end;

procedure TfrmCadPessoa.btnCadConsultarClick(Sender: TObject);
begin
  prc_Consulta_Sefaz;
end;

procedure TfrmCadPessoa.chkRepresentanteClick(Sender: TObject);
begin
  prc_opcao_vendedor
end;

procedure TfrmCadPessoa.prc_Configurarr_vTipoPessoa;
begin
  case ComboBox1.ItemIndex of
    0:
      fMenu.vTipoPessoa := 'C';
    1:
      fMenu.vTipoPessoa := 'X';
    2:
      fMenu.vTipoPessoa := 'F';
    3:
      fMenu.vTipoPessoa := 'N'; //Funcion�rio
    4:
      fMenu.vTipoPessoa := 'P';
    5:
      fMenu.vTipoPessoa := 'V';
    6:
      fMenu.vTipoPessoa := 'A'; //Terceirizado / Atelier
    7:
      fMenu.vTipoPessoa := 'T';
    8:
      fMenu.vTipoPessoa := '';
  end;
end;

procedure TfrmCadPessoa.SpeedButton8Click(Sender: TObject);
begin
  fDMCadPessoa.cdsServico_Int.Close;
  fDMCadPessoa.cdsServico_Int.Open;
end;

procedure TfrmCadPessoa.RxDBLookupCombo17Enter(Sender: TObject);
begin
  fDMCadPessoa.cdsServico_Int.IndexFieldNames := 'NOME';
end;

procedure TfrmCadPessoa.SMDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ffrmConsPessoa_Fat: TfrmConsPessoa_Fat;
  ffrmConsPessoa_Fin: TfrmConsPessoa_Fin;
  ffrmConsPessoa_Prod: TfrmConsPessoa_Prod;
begin
  if (Key = Vk_F4) and (fDMCadPessoa.cdsPessoa_Consulta.Active) and (fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger > 0) then
  begin
    ffrmConsPessoa_Fat := TfrmConsPessoa_Fat.Create(self);
    ffrmConsPessoa_Fat.vID_Pessoa_Cons := fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger;
    ffrmConsPessoa_Fat.Label2.Caption := fDMCadPessoa.cdsPessoa_ConsultaNOME.AsString;
    ffrmConsPessoa_Fat.ShowModal;
    FreeAndNil(ffrmConsPessoa_Fat);
  end
  else if (Key = Vk_F5) and (fDMCadPessoa.cdsPessoa_Consulta.Active) and (fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger > 0) then
  begin
    ffrmConsPessoa_Fin := TfrmConsPessoa_Fin.Create(self);
    ffrmConsPessoa_Fin.vID_Pessoa_Cons := fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger;
    ffrmConsPessoa_Fin.Label2.Caption := fDMCadPessoa.cdsPessoa_ConsultaNOME.AsString;
    ffrmConsPessoa_Fin.ShowModal;
    FreeAndNil(ffrmConsPessoa_Fin);
  end
  else if (Key = Vk_F6) and (fDMCadPessoa.cdsPessoa_Consulta.Active) and (fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger > 0) then
  begin
    ffrmConsPessoa_Prod := TfrmConsPessoa_Prod.Create(self);
    ffrmConsPessoa_Prod.vID_Pessoa_Cons := fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger;
    ffrmConsPessoa_Prod.Label2.Caption := fDMCadPessoa.cdsPessoa_ConsultaNOME.AsString;
    if (fDMCadPessoa.cdsPessoa_ConsultaTP_CLIENTE.AsString = 'S') and (fDMCadPessoa.cdsPessoa_ConsultaTP_FORNECEDOR.AsString = 'S') then
      ffrmConsPessoa_Prod.vTipo_Pessoa := 'A'
    else if (fDMCadPessoa.cdsPessoa_ConsultaTP_CLIENTE.AsString = 'S') then
      ffrmConsPessoa_Prod.vTipo_Pessoa := 'C'
    else
      ffrmConsPessoa_Prod.vTipo_Pessoa := 'F';
    ffrmConsPessoa_Prod.ShowModal;
    FreeAndNil(ffrmConsPessoa_Prod);
  end
  else if (Key = Vk_F8) and (fDMCadPessoa.cdsPessoa_Consulta.Active) and (fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger > 0) then
  begin
    ffrmConsAgenda := TfrmConsAgenda.Create(self);
    ffrmConsAgenda.vID_Pessoa_Cons := fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger;
    ffrmConsAgenda.ShowModal;
    FreeAndNil(ffrmConsAgenda);
  end

end;

procedure TfrmCadPessoa.BitBtn1Click(Sender: TObject);
begin
  ffrmCadPessoa_Servico := TfrmCadPessoa_Servico.Create(self);
  ffrmCadPessoa_Servico.fDMCadPessoa := fDMCadPessoa;
  ffrmCadPessoa_Servico.ShowModal;
  FreeAndNil(ffrmCadPessoa_Servico);
end;

procedure TfrmCadPessoa.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not (pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
    Edit4.SetFocus
  else
    prc_Limpar_Edit_Consulta;
end;

procedure TfrmCadPessoa.prc_Limpar_Edit_Consulta;
begin
  Edit4.Clear;
  ComboBox1.ItemIndex := 8;
  ComboBox2.ItemIndex := 0;
end;

procedure TfrmCadPessoa.RzDBCheckBox1Click(Sender: TObject);
begin
  gbxIPI.Visible := RzDBCheckBox1.Checked;
end;

procedure TfrmCadPessoa.RzDBCheckBox2Click(Sender: TObject);
begin
  if RzDBCheckBox2.Checked then
    Panel5.Height := 82
  else
    Panel5.Height := 0;
end;

procedure TfrmCadPessoa.prc_Abrir_Pessoas_Outras;
begin
  fDMCadPessoa.cdsOBS_Lei.Close;
  fDMCadPessoa.cdsOBS_Lei.Open;

  fDMCadPessoa.cdsPessoa_Servico.Close;
  fDMCadPessoa.sdsPessoa_Servico.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Servico.Open;

  fDMCadPessoa.cdsPessoa_Fiscal.Close;
  fDMCadPessoa.sdsPessoa_Fiscal.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Fiscal.Open;

  if fDMCadPessoa.qParametros_PedUSA_UNIDADE_CLIENTE.AsString = 'S' then
  begin
    fDMCadPessoa.cdsPessoa_Ped.Close;
    fDMCadPessoa.sdsPessoa_Ped.ParamByName('ID').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
    fDMCadPessoa.cdsPessoa_Ped.Open;
  end;

  fDMCadPessoa.cdsPessoa_Servico_Int.Close;
  fDMCadPessoa.sdsPessoa_Servico_Int.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Servico_Int.Open;

  fDMCadPessoa.cdsPessoa_Dep.Close;
  fDMCadPessoa.sdsPessoa_Dep.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Dep.Open;

  fDMCadPessoa.cdsPessoa_Download.Close;
  fDMCadPessoa.sdsPessoa_Download.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Download.Open;

  fDMCadPessoa.cdsPessoa_Ativ.Close;
  fDMCadPessoa.sdsPessoa_Ativ.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Ativ.Open;

  fDMCadPessoa.cdsPessoa_Fisica.Close;
  fDMCadPessoa.sdsPessoa_Fisica.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Fisica.Open;

  fDMCadPessoa.cdsPessoa_Aut.Close;
  fDMCadPessoa.sdsPessoa_Aut.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Aut.Open;

  fDMCadPessoa.cdsPessoa_RefP.Close;
  fDMCadPessoa.sdsPessoa_RefP.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_RefP.Open;

  fDMCadPessoa.cdsPessoa_RefC.Close;
  fDMCadPessoa.sdsPessoa_RefC.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_RefC.Open;

  fDMCadPessoa.cdsPessoa_Vend.Close;
  fDMCadPessoa.sdsPessoa_Vend.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Vend.Open;

  fDMCadPessoa.cdsPessoa_TipoMat.Close;
  fDMCadPessoa.sdsPessoa_TipoMat.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_TipoMat.Open;

  fDMCadPessoa.cdsPessoa_Fil.Close;
  fDMCadPessoa.sdsPessoa_Fil.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Fil.Open;

  if fDMCadPessoa.qParametros_NFeUSA_REGRA_CLI_PROD.AsString = 'S' then
  begin
    fDMCadPessoa.cdsPessoa_ProdICMS.Close;
    fDMCadPessoa.sdsPessoa_ProdICMS.ParamByName('CODIGO').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
    fDMCadPessoa.cdsPessoa_ProdICMS.Open;
  end;
end;

procedure TfrmCadPessoa.Panel3Enter(Sender: TObject);
begin
  if not (fDMCadPessoa.cdsPessoa_Fiscal.State in [dsEdit, dsInsert]) then
  begin
    if not fDMCadPessoa.cdsPessoa_Fiscal.IsEmpty then
      fDMCadPessoa.cdsPessoa_Fiscal.Edit
    else
    begin
      fDMCadPessoa.cdsPessoa_Fiscal.Insert;
      fDMCadPessoa.cdsPessoa_FiscalCODIGO.AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
    end;
  end;
end;

procedure TfrmCadPessoa.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := ' ';
end;

procedure TfrmCadPessoa.DBMemo2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := ' ';
end;

procedure TfrmCadPessoa.BitBtn2Click(Sender: TObject);
begin
  ffrmCadPessoa_Servico_Int := TfrmCadPessoa_Servico_Int.Create(self);
  ffrmCadPessoa_Servico_Int.fDMCadPessoa := fDMCadPessoa;
  ffrmCadPessoa_Servico_Int.ShowModal;
  FreeAndNil(ffrmCadPessoa_Servico_Int);
end;

procedure TfrmCadPessoa.RxDBLookupCombo2Enter(Sender: TObject);
begin
  fDMCadPessoa.prc_Abrir_Cidade(fDMCadPessoa.cdsPessoaUF.AsString);
end;

procedure TfrmCadPessoa.RxDBLookupCombo18CloseUp(Sender: TObject);
begin
  RxDBLookupCombo18.LookupDisplay := 'DESCRICAO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo19CloseUp(Sender: TObject);
begin
  RxDBLookupCombo19.LookupDisplay := 'DESCRICAO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo20CloseUp(Sender: TObject);
begin
  RxDBLookupCombo20.LookupDisplay := 'DESCRICAO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo21CloseUp(Sender: TObject);
begin
  RxDBLookupCombo21.LookupDisplay := 'DESCRICAO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo22CloseUp(Sender: TObject);
begin
  RxDBLookupCombo22.LookupDisplay := 'DESCRICAO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo18DropDown(Sender: TObject);
begin
  RxDBLookupCombo18.LookupDisplay := 'NOME_AUX;CODIGO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo19DropDown(Sender: TObject);
begin
  RxDBLookupCombo19.LookupDisplay := 'NOME_AUX;CODIGO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo20DropDown(Sender: TObject);
begin
  RxDBLookupCombo20.LookupDisplay := 'NOME_AUX;CODIGO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo21DropDown(Sender: TObject);
begin
  RxDBLookupCombo21.LookupDisplay := 'NOME_AUX;CODIGO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo22DropDown(Sender: TObject);
begin
  RxDBLookupCombo22.LookupDisplay := 'NOME_AUX;CODIGO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo18Enter(Sender: TObject);
begin
  fDMCadPessoa.cdsContaOrcamento.IndexFieldNames := 'CODIGO';
end;

procedure TfrmCadPessoa.gbxConta_OrcamentoEnter(Sender: TObject);
begin
  StaticText2.Visible := True;
end;

procedure TfrmCadPessoa.gbxConta_OrcamentoExit(Sender: TObject);
begin
  StaticText2.Visible := False;
end;

procedure TfrmCadPessoa.RxDBLookupCombo18KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_frmSel_ContaOrc('CLIENTE_CONTA_ID', fDMCadPessoa.cdsPessoaCLIENTE_CONTA_ID.AsInteger,'R');
end;

procedure TfrmCadPessoa.prc_Chamar_frmSel_ContaOrc(Campo: string; Codigo: Integer ; Tipo_RD : String = '');
begin
  vID_ContaOrcamento_Pos := Codigo;
  frmSel_ContaOrc := TfrmSel_ContaOrc.Create(Self);
  if Tipo_RD = 'R' then
    frmSel_ContaOrc.ComboBox2.ItemIndex := 0
  else
  if Tipo_RD = 'D' then
    frmSel_ContaOrc.ComboBox2.ItemIndex := 1
  else
    frmSel_ContaOrc.ComboBox2.ItemIndex := 2;
  frmSel_ContaOrc.ShowModal;
  fDMCadPessoa.cdsPessoa.FieldByName(Campo).AsInteger := vID_ContaOrcamento_Pos;
end;

procedure TfrmCadPessoa.RxDBLookupCombo19KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_frmSel_ContaOrc('FORNECEDOR_CONTA_ID', fDMCadPessoa.cdsPessoaFORNECEDOR_CONTA_ID.AsInteger,'D');
end;

procedure TfrmCadPessoa.RxDBLookupCombo20KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_frmSel_ContaOrc('VENDEDOR_CONTA_ID', fDMCadPessoa.cdsPessoaVENDEDOR_CONTA_ID.AsInteger);
end;

procedure TfrmCadPessoa.RxDBLookupCombo21KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_frmSel_ContaOrc('TRANSPORTADORA_CONTA_ID', fDMCadPessoa.cdsPessoaTRANSPORTADORA_CONTA_ID.AsInteger);
end;

procedure TfrmCadPessoa.RxDBLookupCombo22KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_frmSel_ContaOrc('ATELIER_CONTA_ID', fDMCadPessoa.cdsPessoaATELIER_CONTA_ID.AsInteger);
end;

procedure TfrmCadPessoa.ckAlunoClick(Sender: TObject);
begin
  TS_Aluno.TabVisible := ckAluno.Checked;
  TS_RegrasFiscais.TabVisible := not ckAluno.Checked;
  TS_Pessoa_Endereco.TabVisible := not ckAluno.Checked;
  DBRadioGroup1.Visible := not ckAluno.Checked;
end;

procedure TfrmCadPessoa.GroupBox3Enter(Sender: TObject);
begin
  fDMCadPessoa.prc_Abrir_Cidade('');
end;

procedure TfrmCadPessoa.GroupBox2Enter(Sender: TObject);
begin
  fDMCadPessoa.prc_Abrir_Cidade('');
end;

procedure TfrmCadPessoa.prc_Posiciona_Pessoa;
begin
  fDMCadPessoa.prc_Localizar(fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger);
  fDMCadPessoa.cdsPessoa_Contato.Close;
  fDMCadPessoa.cdsPessoa_Contato.Open;
end;

procedure TfrmCadPessoa.btnCadConsultar_ReceitaClick(Sender: TObject);
begin
  prc_Consulta_Receita;
end;

procedure TfrmCadPessoa.Customizado1Click(Sender: TObject);
begin
  prc_Le_cdsPessoa_Consulta(1);
  SMDBGrid1.DisableScroll;
  vTipo_Config_Email := 3;
  fRelPessoa := TfRelPessoa.Create(Self);
  fRelPessoa.fDMCadPessoa := fDMCadPessoa;
  fRelPessoa.vTipoPessoa := fMenu.vTipoPessoa;
  //fRelPessoa.vImpEndereco := ckImpEndereco.Checked;
  fRelPessoa.vImpEndereco := RzCheckList1.ItemChecked[1];
  fRelPessoa.vImpEmail := RzCheckList1.ItemChecked[2];
  fRelPessoa.vImpEndCobranca := RzCheckList1.ItemChecked[3];
  fRelPessoa.vImpEndEntrega := RzCheckList1.ItemChecked[4];
  fRelPessoa.vImpFinanceiro := RzCheckList1.ItemChecked[5];
  fRelPessoa.vImpVendedor := RzCheckList1.ItemChecked[6];
  fRelPessoa.vImpDtPedidoNota := RzCheckList1.ItemChecked[7];

  fRelPessoa.RLReport1.PreviewModal;
  fRelPessoa.RLReport1.Free;
  FreeAndNil(fRelPessoa);
  SMDBGrid1.EnableScroll;
end;

procedure TfrmCadPessoa.N11Click(Sender: TObject);
var
  vArq: string;
begin
  prc_Le_cdsPessoa_Consulta(1);
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Clientes_Comp.fr3';
  if FileExists(vArq) then
    fDMCadPessoa.frxReport1.Report.LoadFromFile(vArq);

  if not fDMCadPessoa.cdsFilial.Active then
    fDMCadPessoa.cdsFilial.Open;
  fDMCadPessoa.frxReport1.variables['Nome_Empresa'] := QuotedStr(fDMCadPessoa.cdsFilialNOME.AsString);
  case ComboBox1.ItemIndex of
    0:
      fDMCadPessoa.frxReport1.variables['Titulo_Relatorio'] := QuotedStr('Relat�rio de Clientes');
    1:
      fDMCadPessoa.frxReport1.variables['Titulo_Relatorio'] := QuotedStr('Relat�rio de Fornecedores');
    2:
      fDMCadPessoa.frxReport1.variables['Titulo_Relatorio'] := QuotedStr('Relat�rio de Transportadoras');
    3:
      fDMCadPessoa.frxReport1.variables['Titulo_Relatorio'] := QuotedStr('Relat�rio de Representantes');
    4:
      fDMCadPessoa.frxReport1.variables['Titulo_Relatorio'] := QuotedStr('Relat�rio de Terceirizados');
    5:
      fDMCadPessoa.frxReport1.variables['Titulo_Relatorio'] := QuotedStr('Relat�rio de Exporta��o');
    6:
      fDMCadPessoa.frxReport1.variables['Titulo_Relatorio'] := QuotedStr('Relat�rio de Preposto');
    7:
      fDMCadPessoa.frxReport1.variables['Titulo_Relatorio'] := QuotedStr('Relat�rio de Colaboradores');
    8:
      fDMCadPessoa.frxReport1.variables['Titulo_Relatorio'] := QuotedStr('Relat�rio de Funcion�rios');
  end;
  fDMCadPessoa.frxReport1.variables['ImpResumoCidade'] := QuotedStr('N');
  fDMCadPessoa.frxReport1.variables['ImpResumoUF'] := QuotedStr('N');
  fDMCadPessoa.frxReport1.variables['ImpResumoVendedor'] := QuotedStr('N');
  if RzCheckList2.ItemChecked[1] then
    fDMCadPessoa.frxReport1.variables['ImpResumoCidade'] := QuotedStr('S');
  if RzCheckList2.ItemChecked[2] then
    fDMCadPessoa.frxReport1.variables['ImpResumoUF'] := QuotedStr('S');
  if RzCheckList2.ItemChecked[3] then
    fDMCadPessoa.frxReport1.variables['ImpResumoVendedor'] := QuotedStr('S');
  fDMCadPessoa.frxReport1.ShowReport;
end;

procedure TfrmCadPessoa.prc_Le_cdsPessoa_Consulta(Tipo: Integer);
var
  vItemImp: Integer;
  vCodAux: string;
  vGravar: Boolean;
begin
  vItemImp := 0;
  if not fDMCadPessoa.mImpAuxiliar.Active then
    fDMCadPessoa.mImpAuxiliar.Open;
  fDMCadPessoa.mImpAuxiliar.EmptyDataSet;
  fDMCadPessoa.mResumo.EmptyDataSet;
  fDMCadPessoa.mResumo.IndexFieldNames := 'Tipo;Codigo';
  SMDBGrid1.DisableScroll;
  fDMCadPessoa.cdsPessoa_Consulta.First;
  while not fDMCadPessoa.cdsPessoa_Consulta.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      vGravar := True;
      if (Tipo = 2) and (trim(fDMCadPessoa.cdsPessoa_ConsultaEMAIL_NFE.AsString) = '') and (trim(fDMCadPessoa.cdsPessoa_ConsultaEMAIL_NFE2.AsString) = '') then
        vGravar := False;
      if vGravar then
      begin
        vItemImp := vItemImp + 1;
        fDMCadPessoa.mImpAuxiliar.Insert;
        fDMCadPessoa.mImpAuxiliarID.AsInteger := fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger;
        fDMCadPessoa.mImpAuxiliarItem.AsInteger := vItemImp;
        fDMCadPessoa.mImpAuxiliar.Post;
        if RzCheckList2.ItemChecked[1] then
        begin
          vCodAux := FormatFloat('00000', fDMCadPessoa.cdsPessoa_ConsultaID_CIDADE.AsInteger);
          prc_Inserir_mResumo('1', vCodAux, fDMCadPessoa.cdsPessoa_ConsultaCIDADE.AsString);
        end;
        if RzCheckList2.ItemChecked[2] then
          prc_Inserir_mResumo('2', fDMCadPessoa.cdsPessoa_ConsultaUF.AsString, fDMCadPessoa.cdsPessoa_ConsultaUF.AsString);
        if RzCheckList2.ItemChecked[3] then
        begin
          vCodAux := FormatFloat('00000', fDMCadPessoa.cdsPessoa_ConsultaID_VENDEDOR.AsInteger);
          prc_Inserir_mResumo('3', vCodAux, fDMCadPessoa.cdsPessoa_ConsultaNOME_VENDEDOR.AsString);
        end;
      end;
    end;
    fDMCadPessoa.cdsPessoa_Consulta.Next;
  end;
  SMDBGrid1.EnableScroll;
  fDMCadPessoa.mResumo.IndexFieldNames := 'Tipo;Nome';
end;

procedure TfrmCadPessoa.prc_Inserir_mResumo(Tipo, Codigo, Nome: string);
begin
  if (fDMCadPessoa.mResumo.FindKey([Tipo, Codigo])) then
    fDMCadPessoa.mResumo.Edit
  else
  begin
    fDMCadPessoa.mResumo.Insert;
    fDMCadPessoa.mResumoTipo.AsString := Tipo;
    fDMCadPessoa.mResumoCodigo.AsString := Codigo;
    fDMCadPessoa.mResumoNome.AsString := Nome;
    fDMCadPessoa.mResumoQtd.AsInteger := 0;
    fDMCadPessoa.mResumoQtd_Ativo.AsInteger := 0;
    fDMCadPessoa.mResumoQtd_Inativo.AsInteger := 0;
  end;
  fDMCadPessoa.mResumoQtd.AsInteger := fDMCadPessoa.mResumoQtd.AsInteger + 1;
  if fDMCadPessoa.cdsPessoa_ConsultaINATIVO.AsString = 'S' then
    fDMCadPessoa.mResumoQtd_Ativo.AsInteger := fDMCadPessoa.mResumoQtd_Ativo.AsInteger + 1
  else
    fDMCadPessoa.mResumoQtd_Inativo.AsInteger := fDMCadPessoa.mResumoQtd_Inativo.AsInteger + 1;
  if Tipo = '1' then
    fDMCadPessoa.mResumoNome_Tipo.AsString := 'Resumo por Cidades'
  else if Tipo = '2' then
    fDMCadPessoa.mResumoNome_Tipo.AsString := 'Resumo de Clientes por Estado'
  else if Tipo = '3' then
    fDMCadPessoa.mResumoNome_Tipo.AsString := 'Resumo de Clientes por Representante';
  fDMCadPessoa.mResumo.Post;
end;

procedure TfrmCadPessoa.Personalizado21Click(Sender: TObject);
var
  vArq: string;
begin
  prc_Le_cdsPessoa_Consulta(2);
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Clientes_Email.fr3';
  if FileExists(vArq) then
    fDMCadPessoa.frxReport1.Report.LoadFromFile(vArq);
  fDMCadPessoa.frxReport1.variables['Nome_Empresa'] := QuotedStr(fDMCadPessoa.cdsFilialNOME.AsString);
  if not fDMCadPessoa.cdsFilial.Active then
    fDMCadPessoa.cdsFilial.Open;
  fDMCadPessoa.frxReport1.ShowReport;
end;

procedure TfrmCadPessoa.DBMemo4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := ' ';
end;

procedure TfrmCadPessoa.DBMemo5KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := ' ';
end;

procedure TfrmCadPessoa.DBCheckBox19Click(Sender: TObject);
begin
  Label88.Visible := (DBCheckBox19.Checked);
  RxDBLookupCombo28.Visible := (DBCheckBox19.Checked);
end;

procedure TfrmCadPessoa.DBCheckBox20Click(Sender: TObject);
begin
  Label90.Visible := (DBCheckBox20.Checked);
  RxDBLookupCombo30.Visible := (DBCheckBox20.Checked);
end;

procedure TfrmCadPessoa.DBCheckBox21Click(Sender: TObject);
begin
  Label102.Visible := (DBCheckBox21.Checked);
  RxDBLookupCombo31.Visible := (DBCheckBox21.Checked);
  Label103.Visible := (DBCheckBox21.Checked);
  edtCod_EnqIPI_Suframa.Visible := (DBCheckBox21.Checked);
end;

procedure TfrmCadPessoa.RZPageControlDadosChange(Sender: TObject);
begin
  if RZPageControlDados.ActivePage = TS_RegrasFiscais then
  begin
    DBCheckBox19Click(Sender);
    DBCheckBox20Click(Sender);
    DBCheckBox21Click(Sender);
    RzDBCheckBox2Click(Sender);
    edtCod_EnqIPI.Clear;
    edtCod_EnqIPI_Suframa.Clear;
    edtCod_EnqIPI_DrawBack.Clear;
    if fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI.AsInteger > 0 then
    begin
      prc_Abrir_EnqIPI(fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI.AsInteger);
      edtCod_EnqIPI.Text := fDMCadPessoa.qEnqIPICODIGO.AsString;
    end;
    if fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI_SUFRAMA.AsInteger > 0 then
    begin
      prc_Abrir_EnqIPI(fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI_SUFRAMA.AsInteger);
      edtCod_EnqIPI_Suframa.Text := fDMCadPessoa.qEnqIPICODIGO.AsString;
    end;
    if fDMCadPessoa.cdsPessoa_FiscalDRAW_ENQIPI.AsInteger > 0 then
    begin
      prc_Abrir_EnqIPI(fDMCadPessoa.cdsPessoa_FiscalDRAW_ENQIPI.AsInteger);
      edtCod_EnqIPI_DrawBack.Text := fDMCadPessoa.qEnqIPICODIGO.AsString;
    end;
  end
  else if RZPageControlDados.ActivePage = TS_Servico then
    fDMCadPessoa.prc_Abrir_Natureza
  else
  begin
    if RZPageControlDados.ActivePage = TS_Fisica then
    begin
      if (fDMCadPessoa.qParametros_GeralMOSTRAR_DADOS_PESSOA_FISICA.AsString = 'S') then
      begin
        if fDMCadPessoa.cdsPessoaCOD_ALFA.AsString <> '' then
        begin
          if (fnc_Verifica_Numero(fDMCadPessoa.cdsPessoaCOD_ALFA.AsString)) and (fDMCadPessoa.cdsPessoa.State in [dsEdit, dsInsert]) then
          begin
            //TS_FisicaEnter   pnlPessoaFisicaEnter(Sender);
            TS_FisicaEnter(Sender);
            if fDMCadPessoa.cdsPessoaCOD_ALFA.AsString <> fDMCadPessoa.cdsPessoa_FisicaCOD_SOCIO.AsString then
              fDMCadPessoa.cdsPessoa_FisicaCOD_SOCIO.AsString := fDMCadPessoa.cdsPessoaCOD_ALFA.AsString;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadPessoa.edtCod_EnqIPI_SuframaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 27) then
  begin
    fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI_SUFRAMA.Clear;
    edtCod_EnqIPI_Suframa.Clear;
  end
  else if (Key = Vk_F2) then
  begin
    viD_EnqIPI_Pos := fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI_SUFRAMA.AsInteger;
    frmSel_EnqIPI := TfrmSel_EnqIPI.Create(Self);
    frmSel_EnqIPI.ShowModal;
    if viD_EnqIPI_Pos > 0 then
      fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI_SUFRAMA.AsInteger := viD_EnqIPI_Pos
    else
      fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI_SUFRAMA.Clear;
    edtCod_EnqIPI_Suframa.Clear;
    prc_Abrir_EnqIPI(fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI_SUFRAMA.AsInteger);
    edtCod_EnqIPI_Suframa.Text := fDMCadPessoa.qEnqIPICODIGO.AsString;
  end;
end;

procedure TfrmCadPessoa.prc_Abrir_EnqIPI(ID: Integer);
begin
  fDMCadPessoa.qEnqIPI.Close;
  fDMCadPessoa.qEnqIPI.ParamByName('ID').AsInteger := ID;
  fDMCadPessoa.qEnqIPI.Open;
end;

procedure TfrmCadPessoa.edtCod_EnqIPIKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 27) then
  begin
    fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI.Clear;
    edtCod_EnqIPI.Clear;
  end
  else if (Key = Vk_F2) then
  begin
    viD_EnqIPI_Pos := fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI.AsInteger;
    frmSel_EnqIPI := TfrmSel_EnqIPI.Create(Self);
    frmSel_EnqIPI.ShowModal;
    if viD_EnqIPI_Pos > 0 then
      fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI.AsInteger := viD_EnqIPI_Pos
    else
      fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI.Clear;
    edtCod_EnqIPI.Clear;
    prc_Abrir_EnqIPI(fDMCadPessoa.cdsPessoa_FiscalID_ENQIPI.AsInteger);
    edtCod_EnqIPI.Text := fDMCadPessoa.qEnqIPICODIGO.AsString;
  end;
end;

procedure TfrmCadPessoa.DBCheckBox3Exit(Sender: TObject);
begin
  Label107.Visible := ((fDMCadPessoa.qParametros_FinUSA_LIMITE_COMPRAS.AsString = 'S') and (fDMCadPessoa.cdsPessoaTP_FORNECEDOR.AsString = 'S'));
  DBEdit48.Visible := ((fDMCadPessoa.qParametros_FinUSA_LIMITE_COMPRAS.AsString = 'S') and (fDMCadPessoa.cdsPessoaTP_FORNECEDOR.AsString = 'S'));
  DBCheckBox25.Visible := (fDMCadPessoa.cdsPessoaTP_FORNECEDOR.AsString = 'S');
end;

procedure TfrmCadPessoa.RxDBComboBox5Exit(Sender: TObject);
begin
  if fDMCadPessoa.cdsPessoaUF.AsString <> '' then
  begin
    fDMCadPessoa.cdsUF.Locate('UF', fDMCadPessoa.cdsPessoaUF.AsString, ([Locaseinsensitive]));
    if (RxDBComboBox5.ItemIndex = 1) and (trim(fDMCadPessoa.cdsUFACEITA_ISENTO.AsString) <> 'S') then
    begin
      MessageDlg('*** a UF  ' + fDMCadPessoa.cdsPessoaUF.AsString + ', n�o aceita Contribuinte do tipo Isento ' + #13 + '   O Sistema vai alterar para (N�o Contribuinte) ' + #13 + #13 + '   Favor verificar se esta correto', mtError, [mbOk], 0);
      exit;
    end;
  end;
  if fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.AsInteger = 2 then
    fDMCadPessoa.cdsPessoaINSCR_EST.AsString := 'ISENTO'
  else if fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.AsInteger = 9 then
    fDMCadPessoa.cdsPessoaINSCR_EST.AsString := '';
  case fDMCadPessoa.cdsPessoaTIPO_CONTRIBUINTE.AsInteger of
    1:
      fDMCadPessoa.cdsPessoaTIPO_CONSUMIDOR.AsInteger := 0;
    2, 9:
      fDMCadPessoa.cdsPessoaTIPO_CONSUMIDOR.AsInteger := 1;
  end;
end;

procedure TfrmCadPessoa.DBEdit65Enter(Sender: TObject);
begin
  fDMCadPessoa.cdsPessoa_FisicaCONJUGE_CPF.EditMask := '000.000.000-00';
end;

procedure TfrmCadPessoa.DBEdit65Exit(Sender: TObject);
var
  vAux: string;
begin
  vAux := Monta_Numero(DBEdit65.Text, 0);
  if (trim(vAux) = '') or (copy(vAux, 1, 9) = '000000000') then
    exit;
  if not ValidaCPF(DBEdit65.Text) then
  begin
    ShowMessage('CPF incorreto!');
    fDMCadPessoa.cdsPessoa_FisicaCONJUGE_CPF.Clear;
    DBEdit65.SetFocus;
  end;
end;

procedure TfrmCadPessoa.SpeedButton9Click(Sender: TObject);
begin
  fDMCadPessoa.cdsGrupo_Pessoa.Close;
  fDMCadPessoa.cdsGrupo_Pessoa.Open;
end;

procedure TfrmCadPessoa.RxDBLookupCombo8Exit(Sender: TObject);
begin
  if RxDBLookupCombo8.Text <> '' then
    fDMCadPessoa.cdsPessoaUF_PGTO.AsString := fDMCadPessoa.cdsCidadeUF.AsString;
end;

procedure TfrmCadPessoa.RxDBLookupCombo10Exit(Sender: TObject);
begin
  if RxDBLookupCombo10.Text <> '' then
    fDMCadPessoa.cdsPessoaUF_ENT.AsString := fDMCadPessoa.cdsCidadeUF.AsString;
end;

procedure TfrmCadPessoa.RxDBComboBox2Exit(Sender: TObject);
begin
  if RxDBComboBox2.ItemIndex = 0 then
    fDMCadPessoa.cdsPessoaCNPJ_CPG_PGTO.EditMask := '99.999.999/9999-99'
  else if RxDBComboBox2.ItemIndex = 1 then
    fDMCadPessoa.cdsPessoaCNPJ_CPG_PGTO.EditMask := '999.999.999-99'
  else if RxDBComboBox1.ItemIndex = 2 then
    fDMCadPessoa.cdsPessoaCNPJ_CPG_PGTO.EditMask := '';
end;

procedure TfrmCadPessoa.DBEdit25Enter(Sender: TObject);
begin
  if fDMCadPessoa.cdsPessoaPESSOA_PGTO.AsString = 'J' then
    fDMCadPessoa.cdsPessoaCNPJ_CPG_PGTO.EditMask := '99.999.999/9999-99'
  else if fDMCadPessoa.cdsPESSOAPessoa.AsString = 'F' then
    fDMCadPessoa.cdsPessoaCNPJ_CPG_PGTO.EditMask := '999.999.999-99'
  else if fDMCadPessoa.cdsPESSOAPessoa.AsString = 'E' then
    fDMCadPessoa.cdsPessoaCNPJ_CPG_PGTO.EditMask := '';
end;

procedure TfrmCadPessoa.DBEdit25Exit(Sender: TObject);
var
  vAux: string;
begin
  vAux := Monta_Numero(DBEdit25.Text, 0);
  if (trim(vAux) = '') or (copy(vAux, 1, 9) = '000000000') then
    exit;
  if fDMCadPessoa.cdsPessoaPESSOA_PGTO.AsString = 'J' then
  begin
    if not ValidaCNPJ(DBEdit25.Text) then
    begin
      ShowMessage('CNPJ incorreto!');
      fDMCadPessoa.cdsPessoaCNPJ_CPG_PGTO.Clear;
      DBEdit25.SetFocus;
    end;
  end
  else if fDMCadPessoa.cdsPessoaPESSOA_PGTO.AsString = 'F' then
  begin
    if not ValidaCPF(DBEdit25.Text) then
    begin
      ShowMessage('CPF incorreto!');
      fDMCadPessoa.cdsPessoaCNPJ_CPG_PGTO.Clear;
      DBEdit25.SetFocus;
    end;
  end;
end;

procedure TfrmCadPessoa.DBEdit50Enter(Sender: TObject);
begin
  vCod_Alfa_Ant := fDMCadPessoa.cdsPessoaCOD_ALFA.AsString;
end;

procedure TfrmCadPessoa.DBEdit50Exit(Sender: TObject);
begin
  if (fDMCadPessoa.qParametros_GeralMOSTRAR_DADOS_PESSOA_FISICA.AsString = 'S') then
  begin
    DBEdit50.Text := trim(DBEdit50.Text);
    if DBEdit50.Text <> '' then
    begin
      if not fnc_Verifica_Numero(DBEdit50.Text) then
      begin
        MessageDlg('*** Digitar somente n�meros aqui!', mtError, [mbOk], 0);
        DBEdit50.SetFocus;
        exit;
      end;
    end;
  end;
end;

procedure TfrmCadPessoa.RxDBLookupCombo39Exit(Sender: TObject);
begin
  fDMCadPessoa.cdsPessoa_FisicaCONJUGE_CID_EMP.AsString := RxDBLookupCombo39.Text;
  if RxDBLookupCombo39.Text <> '' then
    fDMCadPessoa.cdsCidade.Locate('ID', RxDBLookupCombo39.KeyValue, ([Locaseinsensitive]));
  if RxDBLookupCombo39.Text <> '' then
    fDMCadPessoa.cdsPessoa_FisicaCONJUGE_UF_EMP.AsString := fDMCadPessoa.cdsCidadeUF.AsString;
end;

procedure TfrmCadPessoa.DBEdit63Enter(Sender: TObject);
begin
  vRG_Ant := fDMCadPessoa.cdsPessoa_FisicaRG_NUM.AsString;
end;

procedure TfrmCadPessoa.DBEdit63Exit(Sender: TObject);
begin
  if trim(fDMCadPessoa.cdsPessoa_FisicaRG_NUM.AsString) <> trim(vRG_Ant) then
    fDMCadPessoa.cdsPessoaRG.AsString := fDMCadPessoa.cdsPessoa_FisicaRG_NUM.AsString;
end;

procedure TfrmCadPessoa.SMDBGrid7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) and (fDMCadPessoa.cdsPessoa_Ativ.State in [dsEdit, dsInsert]) then
  begin
    vID_Atividade_Pos := fDMCadPessoa.cdsPessoa_AtivID_ATIVIDADE.AsInteger;
    frmSel_Atividade := TfrmSel_Atividade.Create(Self);
    frmSel_Atividade.ShowModal;
    if vID_Atividade_Pos > 0 then
      fDMCadPessoa.cdsPessoa_AtivID_ATIVIDADE.AsInteger := vID_Atividade_Pos
    else
      fDMCadPessoa.cdsPessoa_AtivID_ATIVIDADE.Clear;
    if fDMCadPessoa.cdsPessoa_AtivID_ATIVIDADE.AsInteger > 0 then
    begin
      prc_Abrir_Atividade(fDMCadPessoa.cdsPessoa_AtivID_ATIVIDADE.AsInteger);
      fDMCadPessoa.cdsPessoa_AtivNOME_ATIVIDADE.AsString := fDMCadPessoa.qAtividadeNOME.AsString;
    end
    else
      fDMCadPessoa.cdsPessoa_AtivNOME_ATIVIDADE.AsString := '';
  end;
end;

procedure TfrmCadPessoa.prc_Abrir_Atividade(ID: Integer);
begin
  fDMCadPessoa.qAtividade.Close;
  fDMCadPessoa.qAtividade.ParamByName('ID').AsInteger := ID;
  fDMCadPessoa.qAtividade.Open;
end;

procedure TfrmCadPessoa.DBCheckBox2Enter(Sender: TObject);
begin
  vTP_Cliente_Ant := fDMCadPessoa.cdsPessoaTP_CLIENTE.AsString;
end;

procedure TfrmCadPessoa.DBCheckBox2Exit(Sender: TObject);
var
  sds: TSQLDataSet;
begin
  if (fDMCadPessoa.cdsPessoaTP_CLIENTE.AsString = 'N') and (vTP_Cliente_Ant = 'S') then
  begin
    sds := TSQLDataSet.Create(nil);
    try
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata := True;
      sds.GetMetadata := False;
      sds.CommandText := 'SELECT COUNT(1) CONTADOR FROM NOTAFISCAL N ' + ' WHERE N.ID_CLIENTE = :ID_CLIENTE ';
      sds.ParamByName('ID_CLIENTE').AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
      sds.Open;
      if sds.FieldByName('CONTADOR').AsInteger > 0 then
      begin
        MessageDlg('*** Op��o (Tipo Pessoa) n�o pode ser desmarcado o CLIENTE, pois j� existe nota para ele!', mtError, [mbOk], 0);
        fDMCadPessoa.cdsPessoaTP_CLIENTE.AsString := 'S';
      end;
    finally
      FreeAndNil(sds);
    end;
  end;
end;

procedure TfrmCadPessoa.RxDBLookupCombo7Change(Sender: TObject);
begin
  if RxDBLookupCombo7.Value <> '' then
    fDMCadPessoa.prc_Abre_Carteira(RxDBLookupCombo7.KeyValue)
  else
    fDMCadPessoa.prc_Abre_Carteira(0);
end;

procedure TfrmCadPessoa.SpeedButton10Click(Sender: TObject);
begin
  fDMCadPessoa.cdsCarteira.Close;
  fDMCadPessoa.prc_Abre_Carteira(RxDBLookupCombo7.KeyValue);
  fDMCadPessoa.cdsCarteira.Open;
end;

procedure TfrmCadPessoa.TS_FisicaEnter(Sender: TObject);
begin
  if not (fDMCadPessoa.cdsPessoa_Fisica.State in [dsEdit, dsInsert]) then
  begin
    if not fDMCadPessoa.cdsPessoa_Fisica.IsEmpty then
      fDMCadPessoa.cdsPessoa_Fisica.Edit
    else
    begin
      fDMCadPessoa.cdsPessoa_Fisica.Insert;
      fDMCadPessoa.cdsPessoa_FisicaCODIGO.AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
    end;
  end;
end;

procedure TfrmCadPessoa.CadastrodeConsumidor1Click(Sender: TObject);
var
  vArq: string;
  vCodPessoa: Integer;
begin
  vCodPessoa := fDMCadPessoa.cdsPessoa_ConsultaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_Consulta.Filtered := False;
  fDMCadPessoa.cdsPessoa_Consulta.Filter := 'CODIGO = ' + IntToStr(vCodPessoa);
  fDMCadPessoa.cdsPessoa_Consulta.Filtered := True;

  fDMCadPessoa.cdsPessoa_Aut.Close;
  fDMCadPessoa.sdsPessoa_Aut.ParamByName('CODIGO').AsInteger := vCodPessoa;
  fDMCadPessoa.cdsPessoa_Aut.Open;

  prc_Le_cdsPessoa_Consulta(1);
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Clientes_PF.fr3';
  if FileExists(vArq) then
    fDMCadPessoa.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relat�rio n�o localizado: ' + vArq);
    Exit;
  end;
  fDMCadPessoa.frxReport1.ShowReport;

  fDMCadPessoa.cdsPessoa_Consulta.Filtered := False;
  fDMCadPessoa.cdsPessoa_Consulta.Filter := '';
  fDMCadPessoa.cdsPessoa_Consulta.IndexFieldNames := 'CODIGO';
  fDMCadPessoa.cdsPessoa_Consulta.FindKey([vCodPessoa]);
end;

procedure TfrmCadPessoa.Excel1Click(Sender: TObject);
begin
  prc_CriaExcel(SMDBGrid1.DataSource);
end;

procedure TfrmCadPessoa.prc_CriaExcel(vDados: TDataSource);
var
  planilha: variant;
  vTexto: string;
begin
  Screen.Cursor := crHourGlass;
  vDados.DataSet.First;

  planilha := CreateOleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do tela para o Excel';
  planilha.visible := true;

  prc_Preencher_Excel2(planilha, vDados, SMDBGrid1);

  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  vTexto := vTexto + Name + '_Pessoa_' + Monta_Numero(DateToStr(Date), 0);

  planilha.ActiveWorkBook.SaveAs(vTexto);
  Screen.Cursor := crDefault;
end;

procedure TfrmCadPessoa.RxDBLookupCombo27Change(Sender: TObject);
begin
  DBCheckBox27.Visible := (RxDBLookupCombo27.Text <> '');
end;

procedure TfrmCadPessoa.DBEdit102Exit(Sender: TObject);
begin
  if fDMCadPessoa.cdsPessoaID_TAB_PRECO.AsInteger > 0 then
  begin
    if not (fDMCadPessoa.cdsTab_Preco.Locate('ID', fDMCadPessoa.cdsPessoaID_TAB_PRECO.AsInteger, ([Locaseinsensitive]))) then
    begin
      MessageDlg('*** C�digo n�o encontrado!', mtError, [mbOk], 0);
      DBEdit102.SelectAll;
      DBEdit102.SetFocus;
    end;
  end;
end;

procedure TfrmCadPessoa.SpeedButton11Click(Sender: TObject);
var
  sds: TSQLDataSet;
  vCod: Integer;
begin
  vCod := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata := True;
    sds.GetMetadata := False;
    sds.CommandText := 'SELECT coalesce(MAX(P.COD_VENDEDOR),0) COD_VENDEDOR FROM PESSOA_VEND P ';
    sds.Open;
    vCod := sds.FieldByName('COD_VENDEDOR').AsInteger;
  finally
    FreeAndNil(sds);
  end;
  CurrencyEdit1.AsInteger := vCod + 1;
  CurrencyEdit1.SetFocus;
end;

procedure TfrmCadPessoa.CurrencyEdit1Exit(Sender: TObject);
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata := True;
    sds.GetMetadata := False;
    sds.CommandText := 'SELECT CODIGO FROM PESSOA_VEND WHERE COD_VENDEDOR = :COD_VENDEDOR ';
    sds.ParamByName('COD_VENDEDOR').AsInteger := CurrencyEdit1.AsInteger;
    sds.Open;
    if (sds.FieldByName('CODIGO').AsInteger > 0) and (sds.FieldByName('CODIGO').AsInteger <> fDMCadPessoa.cdsPessoaCODIGO.AsInteger) then
    begin
      MessageDlg('*** Este c�digo j� existe no ID do Vendedor ' + sds.FieldByName('CODIGO').AsString, mtError, [mbOk], 0);
      CurrencyEdit1.SetFocus;
    end;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadPessoa.DBCheckBox4Click(Sender: TObject);
begin
  Label190.Visible := (DBCheckBox4.Checked);
  DBEdit106.Visible := (DBCheckBox4.Checked);
  Label191.Visible := (DBCheckBox4.Checked);
  DBEdit107.Visible := (DBCheckBox4.Checked);
end;

procedure TfrmCadPessoa.RxDBLookupCombo44DropDown(Sender: TObject);
begin
  RxDBLookupCombo44.LookupDisplay := 'NOME_AUX;CODIGO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo44CloseUp(Sender: TObject);
begin
  RxDBLookupCombo44.LookupDisplay := 'DESCRICAO';
end;

procedure TfrmCadPessoa.RxDBLookupCombo44KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_frmSel_ContaOrc('FUNCIONARIO_CONTA_ID', fDMCadPessoa.cdsPessoaATELIER_CONTA_ID.AsInteger);
end;

procedure TfrmCadPessoa.DBEdit8Exit(Sender: TObject);
begin
  if DBEdit8.Text <> '' then
    DBEdit8.Text := Trim(DBEdit8.Text);
end;

procedure TfrmCadPessoa.DBEdit9Exit(Sender: TObject);
begin
  if DBEdit9.Text <> '' then
    DBEdit9.Text := Trim(DBEdit9.Text);
end;

procedure TfrmCadPessoa.DBEdit5Exit(Sender: TObject);
begin
  if DBEdit5.Text <> '' then
    DBEdit5.Text := Trim(DBEdit5.Text);
end;

procedure TfrmCadPessoa.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    DBEdit1.Text := Trim(DBEdit1.Text);
end;

procedure TfrmCadPessoa.DBEdit7Exit(Sender: TObject);
begin
  if DBEdit7.Text <> '' then
    DBEdit7.Text := Trim(DBEdit7.Text);
end;

procedure TfrmCadPessoa.prc_opcao_vendedor;
begin
  ts_Vendedor.TabVisible := chkRepresentante.Checked;
  if not ts_Vendedor.TabVisible then
    RzPageControl3.ActivePage := ts_Contatos;
  if chkRepresentante.Checked then
  begin
    //ts_Vendedor.TabVisible := (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S');
    Label188.Visible := (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S');
    CurrencyEdit1.Visible := (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S');
    SpeedButton11.Visible := (fDMCadPessoa.qParametros_GeralUSA_COD_VENDEDOR.AsString = 'S');
  end;
end;

procedure TfrmCadPessoa.btnCopiar_FilClick(Sender: TObject);
var
  vItem: Integer;
begin
  fDMCadPessoa.cdsPessoa_Fil.Last;
  vItem := fDMCadPessoa.cdsPessoa_FilITEM.AsInteger;
  fDMCadPessoa.cdsFilial.First;
  while not fDMCadPessoa.cdsFilial.Eof do
  begin
    if not fDMCadPessoa.cdsPessoa_Fil.Locate('FILIAL', fDMCadPessoa.cdsFilialID.AsInteger , ([Locaseinsensitive])) then
    begin
      vItem := vItem + 1;
      fDMCadPessoa.cdsPessoa_Fil.Insert;
      fDMCadPessoa.cdsPessoa_FilCODIGO.AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
      fDMCadPessoa.cdsPessoa_FilITEM.AsInteger   := vItem;
      fDMCadPessoa.cdsPessoa_FilFILIAL.AsInteger := fDMCadPessoa.cdsFilialID.AsInteger;
      fDMCadPessoa.cdsPessoa_Fil.Post;
    end;
    fDMCadPessoa.cdsFilial.Next;
  end;
end;

procedure TfrmCadPessoa.prc_Habilitar;
var
  i: Integer;
begin
  TS_Consulta.TabEnabled       := not(TS_Consulta.TabEnabled);
  btnAlterar.Enabled           := not(btnAlterar.Enabled);
  btnCopiar_Fil.Enabled        := not(btnCopiar_Fil.Enabled);
  btnConfirmar.Enabled         := not(btnConfirmar.Enabled);
  TS_Pessoa_Dados.Enabled      := not(TS_Pessoa_Dados.Enabled);
  TS_Pessoa_Endereco.Enabled   := not(TS_Pessoa_Endereco.Enabled);
  TS_Pessoa_Financeiro.Enabled := not(TS_Pessoa_Financeiro.Enabled);
  Panel3.Enabled               := not(Panel3.Enabled); 
  pnlPessoaFisica.Enabled      := not(pnlPessoaFisica.Enabled);
  pnlServico.Enabled           := not(pnlServico.Enabled);
  pnlVendedor.Enabled          := not(pnlVendedor.Enabled);
  pnlCAE.Enabled               := not(pnlCAE.Enabled);
  DBMemo3.readonly             := not(DBMemo3.readonly);
  SMDBGrid2.readonly           := not(SMDBGrid3.readonly);
  SMDBGrid3.readonly           := not(SMDBGrid3.readonly);
  SMDBGrid4.readonly           := not(SMDBGrid4.readonly);
  SMDBGrid5.readonly           := not(SMDBGrid5.readonly);
  SMDBGrid6.readonly           := not(SMDBGrid6.readonly);
  SMDBGrid7.readonly           := not(SMDBGrid7.readonly);
  SMDBGrid8.readonly           := not(SMDBGrid8.readonly);
  SMDBGrid9.readonly           := not(SMDBGrid9.readonly);
  pnlDados_Profissionais.Enabled := not(pnlDados_Profissionais.Enabled);
  pnlConjuge.Enabled             := not(pnlConjuge.Enabled);
  pnlDados_Conta.Enabled         := not(pnlDados_Conta.Enabled);
  pnlCompras_Pedidos.Enabled     := not(pnlCompras_Pedidos.Enabled);
  for i := 1 to SMDBGrid7.ColCount - 2 do
    SMDBGrid7.Columns[i].readonly := not(SMDBGrid7.Columns[i].readonly)
end;

procedure TfrmCadPessoa.btnConfDescontosClick(Sender: TObject);
begin
  frmVendedor_Config := TfrmVendedor_Config.Create(self);
  frmVendedor_Config.fDMCadPessoa := fDMCadPessoa;
  frmVendedor_Config.ShowModal;
  FreeAndNil(frmVendedor_Config);
end;

procedure TfrmCadPessoa.btnFiscalProdutoClick(Sender: TObject);
begin
  frmCadPessoa_ProdICMS := TfrmCadPessoa_ProdICMS.Create(self);
  frmCadPessoa_ProdICMS.fDMCadPessoa := fDMCadPessoa;
  frmCadPessoa_ProdICMS.ShowModal;
  FreeAndNil(frmCadPessoa_ProdICMS);
end;

procedure TfrmCadPessoa.RzDBCheckBox3Click(Sender: TObject);
begin
  gbxDrawback.Visible := RzDBCheckBox3.Checked;
end;

procedure TfrmCadPessoa.edtCod_EnqIPI_DrawBackKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 27) then
  begin
    fDMCadPessoa.cdsPessoa_FiscalDRAW_ENQIPI.Clear;
    edtCod_EnqIPI_DrawBack.Clear;
  end
  else if (Key = Vk_F2) then
  begin
    viD_EnqIPI_Pos := fDMCadPessoa.cdsPessoa_FiscalDRAW_ENQIPI.AsInteger;
    frmSel_EnqIPI := TfrmSel_EnqIPI.Create(Self);
    frmSel_EnqIPI.ShowModal;
    if viD_EnqIPI_Pos > 0 then
      fDMCadPessoa.cdsPessoa_FiscalDRAW_ENQIPI.AsInteger := viD_EnqIPI_Pos
    else
      fDMCadPessoa.cdsPessoa_FiscalDRAW_ENQIPI.Clear;
    edtCod_EnqIPI_DrawBack.Clear;
    prc_Abrir_EnqIPI(fDMCadPessoa.cdsPessoa_FiscalDRAW_ENQIPI.AsInteger);
    edtCod_EnqIPI_DrawBack.Text := fDMCadPessoa.qEnqIPICODIGO.AsString;
  end;
end;

procedure TfrmCadPessoa.Personalizadonafilial1Click(Sender: TObject);
var
  vArq: String;
begin
  fDMCadPessoa.qFilial_Rel.Close;
  fDMCadPessoa.qFilial_Rel.ParamByName('ID').AsInteger      := 1;
  fDMCadPessoa.qFilial_Rel.ParamByName('TIPO').AsInteger    := 14;
  fDMCadPessoa.qFilial_Rel.ParamByName('POSICAO').AsInteger := 1;
  fDMCadPessoa.qFilial_Rel.Open;
  if trim(fDMCadPessoa.qFilial_RelCAMINHO.AsString) <> '' then
  begin
    vArq := fDMCadPessoa.qFilial_RelCAMINHO.AsString;
    if FileExists(vArq) then
      fDMCadPessoa.frxReport1.Report.LoadFromFile(vArq)
    else
    begin
      ShowMessage('Relat�rio n�o localizado! ' + vArq);
      Exit;
    end;
    fDMCadPessoa.frxReport1.ShowReport;
  end;
end;

procedure TfrmCadPessoa.Etiqueta1Click(Sender: TObject);
var
  vArq: string;
begin

  if fDMCadPessoa.cdsPessoa_Consulta.IsEmpty then
  begin
    MessageDlg('*** Deve ser feita a consulta primeiro!', mtInformation, [mbOk], 0);
    exit;
  end;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Etiqueta_Cliente.fr3';
  if FileExists(vArq) then
    fDMCadPessoa.frxReport1.Report.LoadFromFile(vArq);
  fDMCadPessoa.cdsPessoa_Consulta.DisableControls;
  try
    fDMCadPessoa.frxReport1.ShowReport;
  finally
    fDMCadPessoa.cdsPessoa_Consulta.EnableControls;
  end;
end;

procedure TfrmCadPessoa.pnlCAEEnter(Sender: TObject);
begin
  Panel3Enter(Sender);
end;

procedure TfrmCadPessoa.DBEdit116Exit(Sender: TObject);
begin
  if not fnc_Existe_CBenef(DBEdit116.Text) then
  begin
    MessageDlg('*** C�digo Benef�cio Fiscal n�o encontrado!', mtInformation, [mbOk], 0);
    DBEdit116.SetFocus;
  end;
end;

procedure TfrmCadPessoa.DBEdit116KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vCod_CBenef   := DBEdit116.Text;
    frmSel_CBenef := TfrmSel_CBenef.Create(Self);
    if (RxDBLookupCombo38.Text <> '') and (Length(RxDBLookupCombo38.Text) = 2) then
      frmSel_CBenef.vCod_CST := RxDBLookupCombo38.Text;
    frmSel_CBenef.ShowModal;
    if trim(vCod_CBenef) <> '' then
      DBEdit116.Text := vCod_CBenef;
    FreeAndNil(frmSel_CBenef);
  end;
end;

procedure TfrmCadPessoa.DBEdit113Exit(Sender: TObject);
var
  vAux : String;
begin
  if (vCAE_Ant = fDMCadPessoa.cdsPessoa_FiscalCAE_1.AsString) then
    exit;
  if (fDMCadPessoa.cdsPessoaUF.AsString <> 'RS') then
    exit;
    
  vAux := Monta_Numero(DBEdit113.Text,0); 

  if uUtilCliente.fnc_Verifica_CAE(copy(vAux,1,5)) then
  begin
    fDMCadPessoa.cdsPessoa_FiscalOPCAO_DIFERIMENTO.AsString := 'S';
    if fDMCadPessoa.qParametros_NFeID_CST_DIFERIMENTO.AsInteger > 0 then
      fDMCadPessoa.cdsPessoa_FiscalID_CST_ICMS.AsInteger := fDMCadPessoa.qParametros_NFeID_CST_DIFERIMENTO.AsInteger;
  end
  else
  begin
    if MessageDlg('CAE  N�O  faz parte dos c�digos para diferimento!' +#13 + #13
                  + 'Lan�ar a CST 00 (ICMS Integral)?' , mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if fDMCadPessoa.cdsTab_CSTICMS.Locate('COD_CST', '00', ([Locaseinsensitive])) then
        fDMCadPessoa.cdsPessoa_FiscalID_CST_ICMS.AsInteger := fDMCadPessoa.cdsTab_CSTICMSID.AsInteger
      else
        fDMCadPessoa.cdsPessoa_FiscalID_CST_ICMS.Clear;
    end
    else
      fDMCadPessoa.cdsPessoa_FiscalID_CST_ICMS.Clear;
  end;
end;

procedure TfrmCadPessoa.DBEdit113Enter(Sender: TObject);
begin
  vCAE_Ant := fDMCadPessoa.cdsPessoa_FiscalCAE_1.AsString;
end;

procedure TfrmCadPessoa.RzPageControl3Change(Sender: TObject);
begin
  if RzPageControl3.ActivePage = TS_CAE then
    DBCheckBox33.Visible := ((fDMCadPessoa.cdsPessoaUF.AsString = 'RS') and (fDMCadPessoa.qParametros_GeralUSA_CAE_PESSOA.AsString = 'S'));
end;

procedure TfrmCadPessoa.DBCheckBox33Exit(Sender: TObject);
begin
  if not(fDMCadPessoa.cdsPessoa.State in [dsEdit,dsInsert]) and
    not(fDMCadPessoa.cdsPessoa_Fiscal.State in [dsEdit,dsInsert]) then
    exit;

  if not DBCheckBox33.Checked then
  begin
    if fDMCadPessoa.cdsTab_CSTICMS.Locate('COD_CST', '00', ([Locaseinsensitive])) then
      fDMCadPessoa.cdsPessoa_FiscalID_CST_ICMS.AsInteger := fDMCadPessoa.cdsTab_CSTICMSID.AsInteger;
  end
  else
    DBEdit113Exit(Sender);
end;

procedure TfrmCadPessoa.prc_Preenche_Dados;
var
  Caminho : String;
  Retorno : TStringList;
begin
  Caminho := ExtractFilePath(Application.ExeName) + 'ConsultaCNPJ.TXT';
  if not FileExists(Caminho) then
    exit;
  try
    //�ndices do StringList
    //0 - CNPJ   //1 - Tipo   //2 - Raz�o Social   //3 - Porte  //4 - Abertura  //5 - Fantasia  //6 - Endere�o  //7 - N�mero  //8 - Complemento   //9 - Bairro
    //10 - Cidade  //11 - UF  //12 - CEP  //13 - Situa��o  //14 - CNAE1  //15 - Email  //16 - Telefone

    Retorno := TStringList.Create;
    Retorno.LoadFromFile(Caminho);
    if Retorno.Strings[0] <> fDMCadPessoa.cdsPessoaCNPJ_CPF.AsString then
      exit;
    fDMCadPessoa.cdsPessoaNOME.AsString := Retorno.Strings[2];
    if copy(Retorno.Strings[5],1,2) <> '**' then
      fDMCadPessoa.cdsPessoaFANTASIA.AsString := Retorno.Strings[5]
    else
      fDMCadPessoa.cdsPessoaFANTASIA.AsString := Retorno.Strings[2];
    fDMCadPessoa.cdsPessoaENDERECO.AsString := Retorno.Strings[6];
    fDMCadPessoa.cdsPessoaNUM_END.AsString  := Retorno.Strings[7];
    if copy(Retorno.Strings[8],1,2) <> '**' then
      fDMCadPessoa.cdsPessoaCOMPLEMENTO_END.AsString := Retorno.Strings[8];
    if copy(Retorno.Strings[9],1,2) <> '**' then
      fDMCadPessoa.cdsPessoaBAIRRO.AsString          := Retorno.Strings[9];
    fDMCadPessoa.cdsPessoaCEP.AsString             := Retorno.Strings[12];
    fDMCadPessoa.cdsPessoaUF.AsString              := Retorno.Strings[11];
    fDMCadPessoa.prc_Abrir_Cidade(fDMCadPessoa.cdsPessoaUF.AsString);
    if fDMCadPessoa.cdsCidade.Locate('NOME',Retorno.Strings[10],([Locaseinsensitive])) then
    begin
      fDMCadPessoa.cdsPessoaID_CIDADE.AsInteger := fDMCadPessoa.cdsCidadeID.AsInteger;
      fDMCadPessoa.cdsPessoaCIDADE.AsString     := fDMCadPessoa.cdsCidadeNOME.AsString;
    end;
    fDMCadPessoa.cdsPessoaID_PAIS.AsInteger := 1;
  finally
    FreeAndNil(Retorno);
  end;
end;

procedure TfrmCadPessoa.prc_Consulta_Sefaz;
var
  texto: string;
  cnpj_pes: string;
  oStream: TMemoryStream;
  oStrStream: TStringStream;
  vPessoa: Integer;
  vUFAux: string;
  vLocalServidorNFe: string;
begin
  vPessoa := 0;
  if fDMCadPessoa.cdsPessoaPESSOA.AsString = 'J' then
    vPessoa := 1
  else if fDMCadPessoa.cdsPessoaPESSOA.AsString = 'F' then
    vPessoa := 2;
  if vPessoa = 0 then
  begin
    MessageDlg('*** Pessoa (Jur�dica/F�sica) n�o informada!', mtInformation, [mbOk], 0);
    exit;
  end;

  vUFAux := fDMCadPessoa.cdsPessoaUF.AsString;
  if trim(fDMCadPessoa.cdsPessoaUF.AsString) = '' then
    vUFAux := 'RS';

  fDMCadPessoa.qFilial.Close;
  fDMCadPessoa.qFilial.Open;

  fDMCadPessoa.cdsConsultaCadastro.Close;
  //20/04/2019
  texto := fnc_CNPJCFP_FilialNFeConfig;
  vLocalServidorNFe := fDMCadPessoa.qParametrosLOCALSERVIDORNFE.AsString;
  if trim(fDMCadPessoa.qFilialLOCALSERVIDORNFE.AsString) <> '' then
    vLocalServidorNFe := fDMCadPessoa.qFilialLOCALSERVIDORNFE.AsString;
  cnpj_pes := Monta_Texto(fDMCadPessoa.cdsPessoaCNPJ_CPF.AsString, 14);

  if (trim(texto) = '') or (trim(cnpj_pes) = '') then
  begin
    MessageDlg('*** CNPJ n�o informado!', mtInformation, [mbOk], 0);
    exit;
  end;

  oStream := TMemoryStream.Create;
  try
    ConsultarCadastro(Trim(vLocalServidorNFe), texto, vPessoa, vUFAux, cnpj_pes, oStream);

    oStream.Position := 0;

    oStrStream := TStringStream.Create('');
    try
      oStream.Position := 0;
      oStrStream.CopyFrom(oStream, oStream.Size);
      //oStream.SaveToFile('C:\a\Cadastro.xml');
      fDMCadPessoa.xtrConsultaCadastro.TransformRead.SourceXml := oStrStream.DataString;
      fDMCadPessoa.xtrConsultaCadastro.TransformRead.TransformationFile := ExtractFilePath(Application.ExeName) + 'xtr\ConsultaCadastro.xtr';
    finally
      FreeAndNil(oStrStream);
    end;
  finally
    FreeAndNil(oStream);
  end;
  fDMCadPessoa.cdsConsultaCadastro.Open;
  ffNFe_ConsultaCadastro := TfNFe_ConsultaCadastro.Create(self);
  ffNFe_ConsultaCadastro.fDMCadPessoa := fDMCadPessoa;
  ffNFe_ConsultaCadastro.ShowModal;
  FreeAndNil(ffNFe_ConsultaCadastro);
  if fDMCadPessoa.cdsPessoaID_CIDADE.AsInteger <= 0 then
    MessageDlg('*** Munic�pio precisa ser informado manualmente, pois a Sefaz n�o esta retornando o C�d. do Munic�pio!', mtInformation, [mbOk], 0);
end;

procedure TfrmCadPessoa.btnSefazClick(Sender: TObject);
begin
  prc_Consulta_Sefaz;
end;

procedure TfrmCadPessoa.prc_Consulta_Receita;
const
  C_Dll : string = 'ConsultaCNPJ.dll';
var
  aPessoa : TPessoa;
  FHandle : THandle;
  FRoutine : function (const CNPJ: WideString) : TPessoa;
  aCNPJ : String;
begin
  if fDMCadPessoa.cdsPessoaPESSOA.AsString = 'F' then
    prc_ShellExecute('ConsultaCPF.exe')
  else
  begin
    FHandle := LoadLibrary(PAnsiChar(C_Dll));
    try
      FRoutine := GetProcAddress(FHandle, 'ConsultarCNPJ');
      if (Assigned(FRoutine)) then
      begin
        try
          aPessoa := TPessoa.create;
          aCNPJ := DBEdit6.Text;
          aPessoa := FRoutine(aCNPJ);
          if aPessoa.RazaoSocial <> EmptyStr then
          begin
            with fDMCadPessoa do
            begin
              cdsPessoaNOME.AsString := aPessoa.RazaoSocial;
              if copy(aPessoa.Fantasia[5],1,2) <> '**' then
                cdsPessoaFANTASIA.AsString := aPessoa.Fantasia
              else
                cdsPessoaFANTASIA.AsString := aPessoa.RazaoSocial;
              cdsPessoaENDERECO.AsString := aPessoa.Endereco;
              cdsPessoaNUM_END.AsString  := aPessoa.Numero;
              if copy(aPessoa.Complemento,1,2) <> '**' then
                cdsPessoaCOMPLEMENTO_END.AsString := aPessoa.Complemento;
              if copy(aPessoa.Bairro,1,2) <> '**' then
                cdsPessoaBAIRRO.AsString      := aPessoa.Bairro;
              cdsPessoaCEP.AsString           := aPessoa.CEP;
              cdsPessoaUF.AsString            := aPessoa.UF;
              prc_Abrir_Cidade(cdsPessoaUF.AsString);
              if cdsCidade.Locate('NOME',aPessoa.Cidade,([Locaseinsensitive])) then
              begin
                cdsPessoaID_CIDADE.AsInteger := cdsCidadeID.AsInteger;
                cdsPessoaCIDADE.AsString     := cdsCidadeNOME.AsString;
              end;
              cdsPessoaID_PAIS.AsInteger := 1;
            end;
          end;
        except
          on E : Exception do
            FreeLibrary(FHandle);
        end;
      end;
    finally
      FreeLibrary(FHandle);
    end;
  end;
end;

procedure TfrmCadPessoa.btnReceitaClick(Sender: TObject);
begin
  prc_Consulta_Receita;
end;

procedure TfrmCadPessoa.DBEdit117Exit(Sender: TObject);
var
  vUniAux : String;
begin
  if trim(fDMCadPessoa.cdsPessoa_PedUNIDADE_PADRAO.AsString) <> '' then
  begin
    vUniAux := SQLLocate('UNIDADE','UNIDADE','UNIDADE',fDMCadPessoa.cdsPessoa_PedUNIDADE_PADRAO.AsString);
    if trim(vUniAux) = '' then
    begin
      MessageDlg('*** Este registro n�o pode ser exclu�do, � usado para Consumidor Final!', mtError, [mbOk], 0);
      DBEdit117.SetFocus;
    end;
  end;

end;

procedure TfrmCadPessoa.pnlCompras_PedidosEnter(Sender: TObject);
begin
  if fDMCadPessoa.qParametros_PedUSA_UNIDADE_CLIENTE.AsString = 'S' then
  begin
    if not (fDMCadPessoa.cdsPessoa_Ped.State in [dsEdit, dsInsert]) then
    begin
       if not fDMCadPessoa.cdsPessoa_Ped.IsEmpty then
        fDMCadPessoa.cdsPessoa_Ped.Edit
      else
      begin
        fDMCadPessoa.cdsPessoa_Ped.Insert;
        fDMCadPessoa.cdsPessoa_PedID.AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
      end;
    end;
  end;
end;

procedure TfrmCadPessoa.RxDBLookupCombo48Enter(Sender: TObject);
begin
  fDMCadPessoa.cdsRegiao_Venda.IndexFieldNames := 'NOME';
end;

procedure TfrmCadPessoa.edtCNPJXMLEnter(Sender: TObject);
begin
  edtCNPJXML.EditMask := '00.000.000/0000-00';
  if cbxTipoPessoaXML.ItemIndex = 0 then
    edtCNPJXML.EditMask := '000.000.000-00';
end;

procedure TfrmCadPessoa.edtCNPJXMLExit(Sender: TObject);
var
  vAux: String;
begin
  vAux := Monta_Numero(edtCNPJXML.Text,0);
  if (trim(vAux) = '') then
    exit;
  vAux := '';
  if (cbxTipoPessoaXML.ItemIndex = 1) and not(ValidaCNPJ(edtCNPJXML.Text)) then
    vAux := 'CNPJ incorreto!'
  else
  if (cbxTipoPessoaXML.ItemIndex = 0) and not(ValidaCPF(edtCNPJXML.Text)) then
    vAux := 'CPF incorreto!';
  if trim(vAux) <> '' then
  begin
    ShowMessage(vAux);
    edtCNPJXML.Clear;
    edtCNPJXML.SetFocus;
  end;
end;

procedure TfrmCadPessoa.NxButton1Click(Sender: TObject);
var
  vItem : Integer;
begin
  fDMCadPessoa.cdsPessoa_Download.Last;
  vItem := fDMCadPessoa.cdsPessoa_DownloadITEM.AsInteger;

  fDMCadPessoa.cdsPessoa_Download.Insert;
  fDMCadPessoa.cdsPessoa_DownloadCODIGO.AsInteger := fDMCadPessoa.cdsPessoaCODIGO.AsInteger;
  fDMCadPessoa.cdsPessoa_DownloadITEM.AsInteger   := vItem + 1;
  case cbxTipoPessoaXML.ItemIndex of
    0 : fDMCadPessoa.cdsPessoa_DownloadPESSOA.AsString := 'F';
    1 : fDMCadPessoa.cdsPessoa_DownloadPESSOA.AsString := 'J';
  end;
  fDMCadPessoa.cdsPessoa_DownloadCNPJ_CPF.AsString := edtCNPJXML.Text;
  fDMCadPessoa.cdsPessoa_Download.Post;

  cbxTipoPessoaXML.SetFocus;
  edtCNPJXML.Clear;
end;

procedure TfrmCadPessoa.NxButton2Click(Sender: TObject);
begin
  if fDMCadPessoa.cdsPessoa_Download.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir este registro ' + fDMCadPessoa.cdsPessoa_DownloadCNPJ_CPF.AsString + '?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  fDMCadPessoa.cdsPessoa_Download.Delete;
end;

procedure TfrmCadPessoa.SpeedButton12Click(Sender: TObject);
begin
  fDMCadPessoa.cdsContaOrcamento.Close;
  fDMCadPessoa.cdsContaOrcamento.Open;
end;

procedure TfrmCadPessoa.DBCheckBox5Click(Sender: TObject);
begin
  Label217.Visible        := DBCheckBox5.Checked;
  DBEdit120.Visible       := DBCheckBox5.Checked;
  Label218.Visible        := DBCheckBox5.Checked;
  RxDBComboBox19.Visible  := DBCheckBox5.Checked;
end;

end.

