unit UCadAdto_Mov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadAdto_Mov, Math, 
  DBGrids, ExtCtrls, StdCtrls, FMTBcd, SqlExpr, RzTabs, Mask, DBCtrls, ToolEdit, CurrEdit, RxLookup, RxDBComb, RXDBCtrl,
  RzEdit, RzDBEdit, RzButton, UCBase, RzPanel, dbXPress, NxCollection,
  DateUtils, DB, Menus; 

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
    pnlCadastro: TPanel;
    btnImprimir: TNxButton;
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
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Edit1: TEdit;
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
    fDMCadAdto_Mov: TDMCadAdto_Mov;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer);

    procedure prc_Posiciona_Registro;

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
  prc_Posiciona_Registro;

  if fDMCadAdto_Mov.cdsAdto_Mov.IsEmpty then
    exit;

  if fDMCadAdto_Mov.cdsAdto_MovTIPO_MOV.AsString <> 'MAN' then
  begin
    MessageDlg('*** Esse Registro foi gerado automático, não pode ser excluído!', mtError, [mbOk], 0);
    exit;
  end;

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
  fDMCadAdto_Mov.prc_Excluir;
end;

procedure TfrmCadAdto_Mov.prc_Gravar_Registro;
var
  vIDAux: Integer;
  vID_Estoque: Integer;
  ID: TTransactionDesc;
  vID_LocalAux: Integer;
begin
  fDMCadAdto_Mov.prc_Gravar;
  vIDAux := fDMCadAdto_Mov.cdsAdto_MovID.AsInteger;
  if fDMCadAdto_Mov.cdsAdto_Mov.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadAdto_Mov.vMSGErro, mtError, [mbOk], 0);
    exit;
  end;

  prc_Habilitar;
  prc_Consultar(vIDAux);
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadAdto_Mov.prc_Inserir_Registro;
begin
  fDMCadAdto_Mov.prc_Inserir;

  if fDMCadAdto_Mov.cdsAdto_Mov.State in [dsBrowse] then
    exit;

  prc_Habilitar;

  fDMCadAdto_Mov.cdsAdto_MovTIPO_MOV.AsString := 'MAN';

  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadAdto_Mov.FormShow(Sender: TObject);
var
  vData: TDateTime;
  i: Integer;
begin
  fDMCadAdto_Mov := TDMCadAdto_Mov.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadAdto_Mov);

  vData          := EncodeDate(YearOf(Date),MonthOf(Date),01);
  DateEdit1.Date := vData;
end;

procedure TfrmCadAdto_Mov.prc_Consultar(ID: Integer);
begin
  fDMCadAdto_Mov.cdsConsulta.Close;
  fDMCadAdto_Mov.sdsConsulta.CommandText := fDMCadAdto_Mov.ctConsulta;
  fDMCadAdto_Mov.sdsConsulta.CommandText := fDMCadAdto_Mov.sdsConsulta.CommandText + ' WHERE 0 = 0 ';
  if ID > 0 then
    fDMCadAdto_Mov.sdsConsulta.CommandText := fDMCadAdto_Mov.sdsConsulta.CommandText + ' AND a.ID = ' + IntToStr(ID);
    
  case ComboBox1.ItemIndex of
    0: fDMCadAdto_Mov.sdsConsulta.CommandText := fDMCadAdto_Mov.sdsConsulta.CommandText + ' AND A.TIPO_ES = ' + QuotedStr('E');
    1: fDMCadAdto_Mov.sdsConsulta.CommandText := fDMCadAdto_Mov.sdsConsulta.CommandText + ' AND A.TIPO_ES = ' + QuotedStr('S');
  end;

  if DateEdit1.Date > 10 then
    fDMCadAdto_Mov.sdsConsulta.CommandText := fDMCadAdto_Mov.sdsConsulta.CommandText
                        + ' AND a.data >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    fDMCadAdto_Mov.sdsConsulta.CommandText := fDMCadAdto_Mov.sdsConsulta.CommandText
                        + ' AND a.data <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));

  if trim(Edit1.Text) <> '' then
    fDMCadAdto_Mov.sdsConsulta.CommandText := fDMCadAdto_Mov.sdsConsulta.CommandText
                        + ' AND P.NOME like ' + QuotedStr('%'+Edit1.Text+'%');
                        
  fDMCadAdto_Mov.cdsConsulta.Open;
end;

procedure TfrmCadAdto_Mov.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(0);
end;

procedure TfrmCadAdto_Mov.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadAdto_Mov.cdsAdto_Mov.State in [dsBrowse]) or not(fDMCadAdto_Mov.cdsAdto_Mov.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadAdto_Mov.cdsAdto_Mov.CancelUpdates;

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
  if (fDMCadAdto_Mov.cdsAdto_Mov.IsEmpty) or not(fDMCadAdto_Mov.cdsAdto_Mov.Active) or (fDMCadAdto_Mov.cdsAdto_MovID.AsInteger < 1) then
    exit;

  if fDMCadAdto_Mov.cdsAdto_MovTIPO_MOV.AsString <> 'MAN' then
  begin
    MessageDlg('*** Esse Registro foi gerado automático, não pode ser alterado!', mtError, [mbOk], 0);
    exit;
  end;

  fDMCadAdto_Mov.cdsAdto_Mov.Edit;
  prc_Habilitar;
end;

procedure TfrmCadAdto_Mov.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadAdto_Mov.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadAdto_Mov);
end;

procedure TfrmCadAdto_Mov.prc_Posiciona_Registro;
begin
  fDMCadAdto_Mov.prc_Localizar(fDMCadAdto_Mov.cdsConsultaID.AsInteger);
end;

procedure TfrmCadAdto_Mov.RzPageControl1Change(Sender: TObject);
begin
  if not(fDMCadAdto_Mov.cdsAdto_Mov.State in [dsEdit, dsInsert]) then
  begin
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fDMCadAdto_Mov.cdsConsulta.Active) or (fDMCadAdto_Mov.cdsConsulta.IsEmpty) or (fDMCadAdto_Mov.cdsConsultaID.AsInteger <= 0) then
        exit;
      prc_Posiciona_Registro;
    end;
  end;
end;

procedure TfrmCadAdto_Mov.prc_Habilitar;
begin
  TS_Consulta.TabEnabled := not(TS_Consulta.TabEnabled);

  pnlCadastro.Enabled    := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled   := not(btnConfirmar.Enabled);
  btnAlterar.Enabled     := not(btnAlterar.Enabled);
end;

procedure TfrmCadAdto_Mov.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDMCadAdto_Mov.cdsAdto_Mov);
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
  fDMCadAdto_Mov.cdsAdto_Mov.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

end.
