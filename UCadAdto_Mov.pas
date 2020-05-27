unit UCadAdto_Mov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadDocEstoque, Math, 
  DBGrids, ExtCtrls, StdCtrls, FMTBcd, SqlExpr, RzTabs, Mask, DBCtrls, ToolEdit, CurrEdit, RxLookup, RxDBComb, RXDBCtrl,
  RzEdit, RzDBEdit, RzButton, UCadDocEstoque_Itens, UDMEstoque, UCBase, RzPanel, dbXPress, NxCollection,
  DateUtils, DB, Menus, uEtiq_Individual, uDmConsPedido, UDMCadProduto_Lote;

type
  TfrmCadAdto_Mov = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    pnlPesquisa: TPanel;
    Panel1: TPanel;
    lblCliente: TLabel;
    StaticText1: TStaticText;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    Panel11: TPanel;
    UCControls1: TUCControls;
    ComboBox1: TComboBox;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnConsultar: TNxButton;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    pnlTipo: TPanel;
    Label3: TLabel;
    rxcbTipo_Reg: TRxDBComboBox;
    btnImp_Nota: TNxButton;
    PopupMenu2: TPopupMenu;
    Nota1: TMenuItem;
    Etiquetas1: TMenuItem;
    EtiquetaEstoque1: TMenuItem;
    lblTipo_Nota: TLabel;
    Label18: TLabel;
    Label80: TLabel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    rxcbTipo_ES: TRxDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit52: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPesquisarClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    fDMCadDocEstoque: TDMCadDocEstoque;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer);

    procedure prc_Posiciona_DocEstoque;

    procedure prc_Habilitar;

  public
    { Public declarations }
  end;

var
  frmCadAdto_Mov: TfrmCadAdto_Mov;

implementation

uses DmdDatabase, rsDBUtils, UMenu, uUtilPadrao;

{$R *.dfm}

procedure TfrmCadAdto_Mov.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadAdto_Mov.btnExcluirClick(Sender: TObject);
begin
  prc_Posiciona_DocEstoque;

  if fDMCadDocEstoque.cdsDocEstoque.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;

  btnConsultarClick(Sender);
end;

procedure TfrmCadAdto_Mov.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadAdto_Mov.prc_Excluir_Registro;
begin
  fDMCadDocEstoque.prc_Excluir;
end;

procedure TfrmCadAdto_Mov.prc_Gravar_Registro;
var
  vIDAux: Integer;
  vID_Estoque: Integer;
  ID: TTransactionDesc;
  vID_LocalAux: Integer;
begin
  if (fDMCadDocEstoque.cdsDocEstoqueID_LOCAL_ESTOQUE.AsInteger <= 0) and (fDMCadDocEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString <> 'S') then
  begin
    vID_LocalAux := fnc_Verificar_Local(fDMCadDocEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString);
    if vID_LocalAux <= 0 then
      vID_LocalAux := 1;
    fDMCadDocEstoque.cdsDocEstoqueID_LOCAL_ESTOQUE.AsInteger := vID_LocalAux;
  end;

  fDMCadDocEstoque.prc_Gravar;
  vIDAux := fDMCadDocEstoque.cdsDocEstoqueID.AsInteger;
  if fDMCadDocEstoque.cdsDocEstoque.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadDocEstoque.vMSGErro, mtError, [mbOk], 0);
    exit;
  end;

  prc_Habilitar;
  prc_Consultar(vIDAux);
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadAdto_Mov.prc_Inserir_Registro;
begin
  fDMCadDocEstoque.prc_Inserir;

  if fDMCadDocEstoque.cdsDocEstoque.State in [dsBrowse] then
    exit;

  prc_Habilitar;

  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadAdto_Mov.FormShow(Sender: TObject);
var
  vData: TDateTime;
  i: Integer;
begin
  fDMCadDocEstoque := TDMCadDocEstoque.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadDocEstoque);

  vData          := EncodeDate(YearOf(Date),MonthOf(Date),01);
  DateEdit1.Date := vData;
end;

procedure TfrmCadAdto_Mov.prc_Consultar(ID: Integer);
begin
  fDMCadDocEstoque.cdsDocEstoque_Consulta.Close;
  fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.ctConsulta;
  fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText +
                                                         ' WHERE (TIPO_REG = ' + QuotedStr('D') + ' OR TIPO_REG = ' + QuotedStr('T') + ' OR TIPO_REG = ' + QuotedStr('P') + ')';
  if ID > 0 then
    fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText +
                                                           ' AND DC.ID = ' + IntToStr(ID);
  case ComboBox1.ItemIndex of
    0: fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText + ' AND DC.TIPO_ES = ' + QuotedStr('E');
    1: fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText + ' AND DC.TIPO_ES = ' + QuotedStr('S');
  end;

  if DateEdit1.Date > 10 then
    fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText
                        + ' AND DC.DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText
                        + ' AND DC.DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  fDMCadDocEstoque.cdsDocEstoque_Consulta.Open;
end;

procedure TfrmCadAdto_Mov.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(0);
end;

procedure TfrmCadAdto_Mov.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadDocEstoque.cdsDocEstoque.State in [dsBrowse]) or not(fDMCadDocEstoque.cdsDocEstoque.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadDocEstoque.cdsDocEstoque.CancelUpdates;

  prc_Habilitar;

  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadAdto_Mov.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadAdto_Mov.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadDocEstoque.cdsDocEstoque.IsEmpty) or not(fDMCadDocEstoque.cdsDocEstoque.Active) or (fDMCadDocEstoque.cdsDocEstoqueID.AsInteger < 1) then
    exit;

  fDMCadDocEstoque.cdsDocEstoque.Edit;
  prc_Habilitar;
  pnlTipo.Enabled := False;
end;

procedure TfrmCadAdto_Mov.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadAdto_Mov.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadDocEstoque);
end;

procedure TfrmCadAdto_Mov.prc_Posiciona_DocEstoque;
begin
  fDMCadDocEstoque.prc_Localizar(fDMCadDocEstoque.cdsDocEstoque_ConsultaID.AsInteger);
end;

procedure TfrmCadAdto_Mov.RzPageControl1Change(Sender: TObject);
begin
  if not(fDMCadDocEstoque.cdsDocEstoque.State in [dsEdit, dsInsert]) then
  begin
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fDMCadDocEstoque.cdsDocEstoque_Consulta.Active) or (fDMCadDocEstoque.cdsDocEstoque_Consulta.IsEmpty) or (fDMCadDocEstoque.cdsDocEstoque_ConsultaID.AsInteger <= 0) then
        exit;
      prc_Posiciona_DocEstoque;
    end;
  end;
end;

procedure TfrmCadAdto_Mov.prc_Habilitar;
begin
  TS_Consulta.TabEnabled := not(TS_Consulta.TabEnabled);

  pnlTipo.Enabled        := not(pnlTipo.Enabled);
  btnConfirmar.Enabled   := not(btnConfirmar.Enabled);
  btnAlterar.Enabled     := not(btnAlterar.Enabled);
end;

procedure TfrmCadAdto_Mov.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDMCadDocEstoque.cdsDocEstoque);
end;

procedure TfrmCadAdto_Mov.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
     DateEdit1.SetFocus;
end;

procedure TfrmCadAdto_Mov.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadDocEstoque.cdsDocEstoque.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

end.
