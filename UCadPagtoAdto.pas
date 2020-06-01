unit UCadPagtoAdto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadDuplicata, Math, 
  DBGrids, ExtCtrls, StdCtrls, FMTBcd, SqlExpr, RzTabs, Mask, DBCtrls, ToolEdit, CurrEdit, RxLookup, RxDBComb, RXDBCtrl,
  RzEdit, RzDBEdit, RzButton, UCBase, RzPanel, dbXPress, NxCollection,
  DateUtils, DB, Menus, uEtiq_Individual;

type
  TfrmCadPagtoAdto = class(TForm)
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
    Label12: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
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
    pnlCadastro: TPanel;
    Label18: TLabel;
    Label80: TLabel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    SpeedButton3: TSpeedButton;
    DBDateEdit1: TDBDateEdit;
    DBEdit52: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label2: TLabel;
    DBEdit1: TDBEdit;
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
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxcbTipo_ESKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fDMCadDuplicata: TDMCadDuplicata;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer);

    procedure prc_Posiciona_Registro;

    procedure prc_Habilitar_CamposNota;

    procedure prc_Abrir_Pessoa(Tipo: String = 'S'); //E=Fornecedor  S=Cliente

  public
    { Public declarations }
  end;

var
  frmCadPagtoAdto: TfrmCadPagtoAdto;

implementation

uses DmdDatabase, rsDBUtils, UMenu, uUtilPadrao;

{$R *.dfm}

procedure TfrmCadPagtoAdto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadPagtoAdto.btnExcluirClick(Sender: TObject);
begin
  prc_Posiciona_Registro;

  if fDMCadDuplicata.cdsPagtoAdto.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;

  btnConsultarClick(Sender);
end;

procedure TfrmCadPagtoAdto.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadPagtoAdto.prc_Excluir_Registro;
begin
  fDMCadDuplicata.prc_Excluir;
end;

procedure TfrmCadPagtoAdto.prc_Gravar_Registro;
var
  vIDAux: Integer;
  vID_Estoque: Integer;
  ID: TTransactionDesc;
  vID_LocalAux: Integer;
begin
  vIDAux := fDMCadDuplicata.cdsPagtoAdtoID.AsInteger;
  fDMCadDuplicata.prc_Gravar_PagtoAdto;
  if fDMCadDuplicata.cdsPagtoAdto.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadDuplicata.vMSGErro, mtError, [mbOk], 0);
    exit;
  end;

  {ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao gravar o estoque: ' + #13 + e.Message);
    end;
  end;}

  fDMCadDuplicata.cdsPagtoAdto.Post;
  fDMCadDuplicata.cdsPagtoAdto.ApplyUpdates(0);

  prc_Habilitar_CamposNota;

  prc_Consultar(vIDAux);
  prc_Posiciona_Registro;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadPagtoAdto.prc_Inserir_Registro;
begin
  fDMCadDuplicata.prc_Inserir;

  if fDMCadDuplicata.cdsPagtoAdto.State in [dsBrowse] then
    exit;

  prc_Habilitar_CamposNota;

  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadPagtoAdto.FormShow(Sender: TObject);
var
  vData: TDateTime;
begin
  fDMCadDuplicata := TDMCadDuplicata.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadDuplicata);

  vData          := EncodeDate(YearOf(Date),MonthOf(Date),01);
  DateEdit1.Date := vData;
end;

procedure TfrmCadPagtoAdto.prc_Consultar(ID: Integer);
begin
  fDMCadDuplicata.cdsPagtoAdto_Consulta.Close;
  fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText := fDMCadDuplicata.ctConsulta;
  fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText := fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText +
                                                         ' WHERE (TIPO_REG = ' + QuotedStr('D') + ' OR TIPO_REG = ' + QuotedStr('T') + ' OR TIPO_REG = ' + QuotedStr('P') + ')';
  if ID > 0 then
    fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText := fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText +
                                                           ' AND DC.ID = ' + IntToStr(ID);
  if not(RxDBLookupCombo1.Text = '') then
    fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText := fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText +
                                                           ' AND DC.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  case ComboBox1.ItemIndex of
    0: fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText := fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText + ' AND DC.TIPO_ES = ' + QuotedStr('E');
    1: fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText := fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText + ' AND DC.TIPO_ES = ' + QuotedStr('S');
  end;

  if DateEdit1.Date > 10 then
    fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText := fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText
                        + ' AND DC.DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText := fDMCadDuplicata.sdsPagtoAdto_Consulta.CommandText
                        + ' AND DC.DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  fDMCadDuplicata.cdsPagtoAdto_Consulta.Open;
end;

procedure TfrmCadPagtoAdto.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(0);
end;

procedure TfrmCadPagtoAdto.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadDuplicata.cdsPagtoAdto.State in [dsBrowse]) or not(fDMCadDuplicata.cdsPagtoAdto.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadDuplicata.cdsPagtoAdto.CancelUpdates;

  prc_Habilitar_CamposNota;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadPagtoAdto.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadPagtoAdto.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadDuplicata.cdsPagtoAdto.IsEmpty) or not(fDMCadDuplicata.cdsPagtoAdto.Active) or (fDMCadDuplicata.cdsPagtoAdtoID.AsInteger < 1) then
    exit;

  fDMCadDuplicata.cdsPagtoAdto.Edit;
  prc_Habilitar_CamposNota;
end;

procedure TfrmCadPagtoAdto.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadPagtoAdto.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadDuplicata);
end;

procedure TfrmCadPagtoAdto.prc_Posiciona_Registro;
begin
  fDMCadDuplicata.prc_Localizar(fDMCadDuplicata.cdsPagtoAdto_ConsultaID.AsInteger);
  fDMCadDuplicata.cdsPagtoAdto_Itens.Close;
  fDMCadDuplicata.cdsPagtoAdto_Itens.Open;
end;

procedure TfrmCadPagtoAdto.RzPageControl1Change(Sender: TObject);
begin
  if not(fDMCadDuplicata.cdsPagtoAdto.State in [dsEdit, dsInsert]) then
  begin
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fDMCadDuplicata.cdsPagtoAdto_Consulta.Active) or (fDMCadDuplicata.cdsPagtoAdto_Consulta.IsEmpty) or (fDMCadDuplicata.cdsPagtoAdto_ConsultaID.AsInteger <= 0) then
        exit;
      prc_Posiciona_Registro;
      prc_Abrir_Pessoa();
    end;
  end;
end;

procedure TfrmCadPagtoAdto.prc_Habilitar_CamposNota;
begin
  TS_Consulta.TabEnabled := not(TS_Consulta.TabEnabled);

  pnlCadastro.Enabled    := not(pnlCadastro.Enabled);

  btnConfirmar.Enabled   := not(btnConfirmar.Enabled);
  btnAlterar.Enabled     := not(btnAlterar.Enabled);
end;

procedure TfrmCadPagtoAdto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDMCadDuplicata.cdsPagtoAdto);
end;

procedure TfrmCadPagtoAdto.SpeedButton1Click(Sender: TObject);
begin
  prc_Abrir_Pessoa(fDMCadDuplicata.cdsPagtoAdtoTIPO_ES.AsString);
end;

procedure TfrmCadPagtoAdto.prc_Abrir_Pessoa(Tipo: String = 'S'); //E=Fornecedor  S=Cliente
begin
  fDMCadDuplicata.cdsPessoa.Close;
  fDMCadDuplicata.sdsPessoa.CommandText := fDMCadDuplicata.ctPessoa;
  fDMCadDuplicata.sdsPessoa.CommandText := fDMCadDuplicata.sdsPessoa.CommandText + ' AND TP_CLIENTE = ' + QuotedStr('S');
  fDMCadDuplicata.cdsPessoa.Open;
end;

procedure TfrmCadPagtoAdto.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
     DateEdit1.SetFocus;
end;

procedure TfrmCadPagtoAdto.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadDuplicata.cdsPagtoAdto.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmCadPagtoAdto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F5) then
  begin
    frmConsEstRed := TfrmConsEstRed.Create(Self);
    frmConsEstRed.ShowModal;
    FreeAndNil(frmConsEstRed);
  end;
end;

procedure TfrmCadPagtoAdto.rxcbTipo_ESKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 27) then
    rxcbTipo_ES.ItemIndex := -1;
end;

end.
