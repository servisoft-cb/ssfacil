unit UCadAjuste_Preco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadAjuste_Preco, Math, 
  DBGrids, ExtCtrls, StdCtrls, FMTBcd, SqlExpr, RzTabs, Mask, DBCtrls, ToolEdit, CurrEdit, RxLookup, RxDBComb, RXDBCtrl,
  RzEdit, RzDBEdit, RzButton, UCBase, RzPanel, dbXPress, NxCollection,
  DateUtils, DB, Menus;

type
  TfrmCadAjuste_Preco = class(TForm)
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
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    pnlCadastro: TPanel;
    lblTipo: TLabel;
    Label18: TLabel;
    Label80: TLabel;
    Label1: TLabel;
    rxcbTipo_ES: TRxDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit52: TDBEdit;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    pnlItem: TPanel;
    btnInserir_Itens: TNxButton;
    btnExcluir_Itens: TNxButton;
    SMDBGrid2: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluir_ItensClick(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPesquisarClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure btnInserir_ItensClick(Sender: TObject);
    procedure rxcbTipo_ESEnter(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
  private
    { Private declarations }
    fDMCadAjuste_Preco: TDMCadAjuste_Preco;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer);

    procedure prc_Posiciona_Ajuste_Preco;

    procedure prc_Habilitar_CamposNota;
  public
    { Public declarations }
  end;

var
  frmCadAjuste_Preco: TfrmCadAjuste_Preco;

implementation

uses DmdDatabase, rsDBUtils, UMenu, uUtilPadrao, UCadAjuste_Preco_Sel;

{$R *.dfm}

procedure TfrmCadAjuste_Preco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadAjuste_Preco.btnExcluirClick(Sender: TObject);
begin
  prc_Posiciona_Ajuste_Preco;

  if fDMCadAjuste_Preco.cdsAjuste_Preco.IsEmpty then
    exit;

  fDMCadAjuste_Preco.qUltimo.Close;
  fDMCadAjuste_Preco.qUltimo.Open;

  if fDMCadAjuste_Preco.cdsAjuste_PrecoID.AsInteger <> fDMCadAjuste_Preco.qUltimoID.AsInteger then
  begin
    MessageDlg('*** Ajuste não é o último, não pode ser excluído!', mtError, [mbOk], 0);
    exit;
  end;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;

  btnConsultarClick(Sender);
end;

procedure TfrmCadAjuste_Preco.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadAjuste_Preco.prc_Excluir_Registro;
begin
  fDMCadAjuste_Preco.prc_Excluir;
end;

procedure TfrmCadAjuste_Preco.prc_Gravar_Registro;
var
  vIDAux: Integer;
  ID: TTransactionDesc;
  vID_LocalAux: Integer;
begin
  fDMCadAjuste_Preco.prc_Gravar;
  vIDAux := fDMCadAjuste_Preco.cdsAjuste_PrecoID.AsInteger;
  if fDMCadAjuste_Preco.cdsAjuste_Preco.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadAjuste_Preco.vMSGErro, mtError, [mbOk], 0);
    exit;
  end;

  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.First;
    while not fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.Eof do
    begin
    
      fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.Next;
    end;

    fDMCadAjuste_Preco.cdsAjuste_Preco.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao gravar o estoque: ' + #13 + e.Message);
    end;
  end;

  prc_Habilitar_CamposNota;
  RzPageControl1.ActivePage := TS_Consulta;
  prc_Consultar(vIDAux);
end;

procedure TfrmCadAjuste_Preco.prc_Inserir_Registro;
begin
  fDMCadAjuste_Preco.prc_Inserir;

  if fDMCadAjuste_Preco.cdsAjuste_Preco.State in [dsBrowse] then
    exit;

  prc_Habilitar_CamposNota;
  pnlCadastro.Enabled := True;

  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadAjuste_Preco.FormShow(Sender: TObject);
var
  vData: TDateTime;
  i: Integer;
begin
  fDMCadAjuste_Preco := TDMCadAjuste_Preco.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadAjuste_Preco);

  vData          := EncodeDate(YearOf(Date),MonthOf(Date),01);
  DateEdit1.Date := vData;
end;

procedure TfrmCadAjuste_Preco.prc_Consultar(ID: Integer);
begin
  fDMCadAjuste_Preco.cdsConsulta.Close;
  fDMCadAjuste_Preco.sdsConsulta.CommandText := fDMCadAjuste_Preco.ctConsulta;
  fDMCadAjuste_Preco.sdsConsulta.CommandText := fDMCadAjuste_Preco.sdsConsulta.CommandText + ' WHERE 0 = 0 ';
  if ID > 0 then
    fDMCadAjuste_Preco.sdsConsulta.CommandText := fDMCadAjuste_Preco.sdsConsulta.CommandText +
                                                           ' AND P.ID = ' + IntToStr(ID);
  case ComboBox1.ItemIndex of
    1: fDMCadAjuste_Preco.sdsConsulta.CommandText := fDMCadAjuste_Preco.sdsConsulta.CommandText + ' AND P.TIPO = ' + QuotedStr('A');
    2: fDMCadAjuste_Preco.sdsConsulta.CommandText := fDMCadAjuste_Preco.sdsConsulta.CommandText + ' AND P.TIPO = ' + QuotedStr('D');
  end;

  if DateEdit1.Date > 10 then
    fDMCadAjuste_Preco.sdsConsulta.CommandText := fDMCadAjuste_Preco.sdsConsulta.CommandText
                        + ' AND P.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    fDMCadAjuste_Preco.sdsConsulta.CommandText := fDMCadAjuste_Preco.sdsConsulta.CommandText
                        + ' AND P.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  fDMCadAjuste_Preco.cdsConsulta.Open;
end;

procedure TfrmCadAjuste_Preco.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(0);
end;

procedure TfrmCadAjuste_Preco.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadAjuste_Preco.cdsAjuste_Preco.State in [dsBrowse]) or not(fDMCadAjuste_Preco.cdsAjuste_Preco.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadAjuste_Preco.cdsAjuste_Preco.CancelUpdates;

  prc_Habilitar_CamposNota;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadAjuste_Preco.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadAjuste_Preco.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadAjuste_Preco.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadAjuste_Preco);
end;

procedure TfrmCadAjuste_Preco.prc_Posiciona_Ajuste_Preco;
begin
  fDMCadAjuste_Preco.prc_Localizar(fDMCadAjuste_Preco.cdsConsultaID.AsInteger);
  fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.Close;
  fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.Open;
end;

procedure TfrmCadAjuste_Preco.btnExcluir_ItensClick(Sender: TObject);
begin
  if not(fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.Active) and (fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.IsEmpty) or (fDMCadAjuste_Preco.cdsAjuste_Preco_ItensITEM.AsInteger < 1) then
    exit;

  if MessageDlg('Deseja excluir o item selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadAjuste_Preco.prc_Excluir_Item;
end;

procedure TfrmCadAjuste_Preco.RzPageControl1Change(Sender: TObject);
begin
  if not(fDMCadAjuste_Preco.cdsAjuste_Preco.State in [dsEdit, dsInsert]) then
  begin
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fDMCadAjuste_Preco.cdsConsulta.Active) or (fDMCadAjuste_Preco.cdsConsulta.IsEmpty) or (fDMCadAjuste_Preco.cdsConsultaID.AsInteger <= 0) then
        exit;
    end;
  end;
end;

procedure TfrmCadAjuste_Preco.prc_Habilitar_CamposNota;
begin
  TS_Consulta.TabEnabled := not(TS_Consulta.TabEnabled);

  btnConfirmar.Enabled        := not(btnConfirmar.Enabled);
  pnlCadastro.Enabled         := not(pnlCadastro.Enabled);
end;

procedure TfrmCadAjuste_Preco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDMCadAjuste_Preco.cdsAjuste_Preco);
end;

procedure TfrmCadAjuste_Preco.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
     DateEdit1.SetFocus;
end;

procedure TfrmCadAjuste_Preco.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadAjuste_Preco.cdsAjuste_Preco.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmCadAjuste_Preco.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmCadAjuste_Preco.btnInserir_ItensClick(Sender: TObject);
begin
  if (fDMCadAjuste_Preco.cdsAjuste_PrecoTIPO.AsString <> 'A') and (fDMCadAjuste_Preco.cdsAjuste_PrecoTIPO.AsString <> 'D') then
  begin
    MessageDlg('*** É obrigatório informar o TIPO', mtError, [mbOk], 0);
    rxcbTipo_ES.SetFocus;
    exit;
  end;
  if StrToFloat(FormatFloat('0.00',fDMCadAjuste_Preco.cdsAjuste_PrecoPERC_AJUSTE.AsFloat)) <= 0 then
  begin
    MessageDlg('*** É obrigatório informar o % ', mtError, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;
  frmCadAjuste_Preco_Sel := TfrmCadAjuste_Preco_Sel.Create(Self);
  frmCadAjuste_Preco_Sel.fDMCadAjuste_Preco := fDMCadAjuste_Preco;
  frmCadAjuste_Preco_Sel.ShowModal;
  FreeAndNil(frmCadAjuste_Preco_Sel);
end;

procedure TfrmCadAjuste_Preco.rxcbTipo_ESEnter(Sender: TObject);
begin
  rxcbTipo_ES.ReadOnly := (fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.RecordCount > 0);
  if (fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.RecordCount > 0) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadAjuste_Preco.DBEdit2Enter(Sender: TObject);
begin
  DBEdit2.ReadOnly := (fDMCadAjuste_Preco.cdsAjuste_Preco_Itens.RecordCount > 0);
end;

end.
