unit uCadPedidoSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, SMDBGrid, RxLookup, Menus, 
  ToolEdit, Mask, CurrEdit, StdCtrls, NxCollection, ExtCtrls, RzTabs, uDmCadPedido, db, DBCtrls, Buttons, DateUtils, RXDBCtrl,
  rsDbUtils, uCadPedidoSimples_Itens, UCadCondPgto, RxDBComb;

type
  TfrmCadPedidoSimples = class(TForm)
    RZPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    Panel11: TPanel;
    btnInserir: TNxButton;
    btnPesquisar: TNxButton;
    btnExcluir: TNxButton;
    btnImprimir: TNxButton;
    pnlPesquisa: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    btnConsultar: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    pnlNota: TPanel;
    Label16: TLabel;
    lblNome_Filial: TLabel;
    DBText1: TDBText;
    Label17: TLabel;
    DBEdit3: TDBEdit;
    pnlCliente: TPanel;
    Label18: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label22: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    Label11: TLabel;
    cePedInterno: TCurrencyEdit;
    lblNumNota: TLabel;
    Label10: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    SpeedButton4: TSpeedButton;
    pnlItem: TPanel;
    btnInserir_Itens: TNxButton;
    btnAlterar_Itens: TNxButton;
    btnExcluir_Itens: TNxButton;
    btnCalcular_Valores: TNxButton;
    SMDBGrid2: TSMDBGrid;
    DBMemo1: TDBMemo;
    PopupMenu1: TPopupMenu;
    ModeloresumidoTXT1: TMenuItem;
    Carndepagamento1: TMenuItem;
    Completo1: TMenuItem;
    SpeedButton2: TSpeedButton;
    Label19: TLabel;
    DBEdit6: TDBEdit;
    btnGerar: TNxButton;
    N1: TMenuItem;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Panel2: TPanel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnInserir_ItensClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure RZPageControl1Change(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterar_ItensClick(Sender: TObject);
    procedure btnCalcular_ValoresClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure btnExcluir_ItensClick(Sender: TObject);
    procedure pnlClienteEnter(Sender: TObject);
    procedure pnlClienteExit(Sender: TObject);
    procedure ModeloresumidoTXT1Click(Sender: TObject);
    procedure Carndepagamento1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
  private
    { Private declarations }
    fDmCadPedido: TDmCadPedido;
    ffrmCadPedidoSimples_Itens: TfrmCadPedidoSimples_Itens;
    ffrmCadCondPgto: TfrmCadCondPgto;
    vID_ClienteAnt: Integer;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer);

    procedure prc_Posiciona_Pedido;
    procedure prc_Posicionar_Cliente;
    procedure prc_Limpar_Edit_Consulta;
    procedure prc_Habilitar_CamposNota;

    procedure prc_prepara_print;
    procedure prc_imprime_DOS;
    function fnc_Verifica_Registro: Boolean;
    procedure prc_Scroll(DataSet: TDataSet);
  public
    { Public declarations }
  end;

var
  frmCadPedidoSimples: TfrmCadPedidoSimples;

implementation

uses uUtilPadrao, USel_Pessoa, uCalculo_Pedido, uGrava_Pedido, uCadPedidoSimpes_Geracao;

{$R *.dfm}

procedure TfrmCadPedidoSimples.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
  begin
    cePedInterno.SetFocus;
    btnConsultarClick(Sender);
  end
  else
    prc_Limpar_Edit_Consulta;
end;

procedure TfrmCadPedidoSimples.prc_Consultar(ID: Integer);
begin
  fDMCadPedido.cdsPedido_Consulta.Close;
  fDMCadPedido.sdsPedido_Consulta.CommandText := fDMCadPedido.ctConsulta + ' WHERE TIPO_REG = ' + QuotedStr('P');
  if ID > 0 then
    fDMCadPedido.sdsPedido_Consulta.CommandText := fDMCadPedido.sdsPedido_Consulta.CommandText +
                                                   ' AND PED.ID = ' + IntToStr(ID)
  else
  if cePedInterno.AsInteger > 0 then
    fDMCadPedido.sdsPedido_Consulta.CommandText := fDMCadPedido.sdsPedido_Consulta.CommandText +
                                                   ' AND PED.NUM_PEDIDO = ' + cePedInterno.Text;

  if DateEdit1.Date > 10 then
    fDMCadPedido.sdsPedido_Consulta.CommandText := fDMCadPedido.sdsPedido_Consulta.CommandText +
                                                   ' AND PED.DTEMISSAO >= ' +
                                                   QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    fDMCadPedido.sdsPedido_Consulta.CommandText := fDMCadPedido.sdsPedido_Consulta.CommandText +
                                                   ' AND PED.DTEMISSAO <= ' +
                                                   QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if RxDBLookupCombo1.KeyValue > 0 then
    fDMCadPedido.sdsPedido_Consulta.CommandText := fDMCadPedido.sdsPedido_Consulta.CommandText +
                                                   ' AND ID_MAPA = ' + RxDBLookupCombo1.Value;
  fDMCadPedido.cdsPedido_Consulta.Open;
end;

procedure TfrmCadPedidoSimples.prc_Excluir_Registro;
begin
  uGrava_Pedido.prc_Excluir_Pedido(fDMCadPedido);
end;

procedure TfrmCadPedidoSimples.prc_Gravar_Registro;
var
  vIDAux: Integer;
  vParcelaAux: Integer;
begin
  uGrava_Pedido.prc_Gravar(fDMCadPedido);
  vIDAux := fDMCadPedido.cdsPedidoID.AsInteger;
  if fDMCadPedido.cdsPedido.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadPedido.vMSGErro, mtError, [mbOk], 0);
    exit;
  end;

  TS_Consulta.TabEnabled := True;
  prc_Habilitar_CamposNota;

  prc_Consultar(vIDAux);
  prc_Posiciona_Pedido;
end;

procedure TfrmCadPedidoSimples.prc_Inserir_Registro;
begin
  if uUtilPadrao.fnc_Selecionar_Filial <= 0 then
    exit;
  fDMCadPedido.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]);

  //fDMCadPedido.prc_Inserir;
  UGrava_Pedido.prc_Inserir_Ped(fDMCadPedido);

  if fDMCadPedido.cdsPedido.State in [dsBrowse] then
    Exit;
  
  lblNome_Filial.Caption := vFilial_Nome;
  fDMCadPedido.cdsPedidoTIPO_REG.AsString       := 'S';

  prc_Habilitar_CamposNota;

  fDMCadPedido.cdsPedidoID_REGIMETRIB.AsInteger := fDMCadPedido.cdsFilialID_REGIME_TRIB.AsInteger;
  fDMCadPedido.cdsPedidoSIMPLES_FILIAL.AsString := fDMCadPedido.cdsFilialSIMPLES.AsString;

  if fDmCadPedido.qParametros_PedID_CFOP_PEDIDO.AsInteger > 0 then
    fDmCadPedido.cdsPedidoID_CFOP.AsInteger := fDmCadPedido.qParametros_PedID_CFOP_PEDIDO.AsInteger;

  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadPedidoSimples.prc_Posiciona_Pedido;
begin
  fDMCadPedido.prc_Localizar(fDMCadPedido.cdsPedido_ConsultaID.AsInteger);
  fDMCadPedido.cdsPedido_Itens.Close;
  fDMCadPedido.cdsPedido_Itens.Open;
  fDMCadPedido.cdsPedido_Cli.Close;
  fDMCadPedido.cdsPedido_Cli.Open;
  vFilial      := fDMCadPedido.cdsPedidoFILIAL.AsInteger;
  vFilial_Nome := '';
  if fDMCadPedido.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]) then
    vFilial_Nome := fDMCadPedido.cdsFilialNOME_INTERNO.AsString;
  lblNome_Filial.Caption := vFilial_Nome;
end;

procedure TfrmCadPedidoSimples.prc_Posicionar_Cliente;
begin
  fDMCadPedido.vAliqIcms := 0;
  fDMCadPedido.vSiglaUF  := '';
  if fDMCadPedido.cdsClienteCODIGO.AsInteger <> fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger then
    fDMCadPedido.cdsCliente.Locate('CODIGO',fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger,[loCaseInsensitive]);
  if fDMCadPedido.cdsUFUF.AsString <> fDMCadPedido.cdsClienteUF.AsString then
    fDMCadPedido.cdsUF.Locate('UF',fDMCadPedido.cdsClienteUF.AsString,[loCaseInsensitive]);
  if (fDMCadPedido.cdsPedidoID_VENDEDOR.AsInteger > 0) and (fDMCadPedido.cdsVendedorCODIGO.AsInteger <>
      fDMCadPedido.cdsPedidoID_VENDEDOR.AsInteger) then
    fDMCadPedido.cdsVendedor.Locate('CODIGO',fDMCadPedido.cdsPedidoID_VENDEDOR.AsInteger,[loCaseInsensitive]);
  if (fDMCadPedido.cdsFilialID.AsInteger <> fDMCadPedido.cdsPedidoFILIAL.AsInteger) then
    fDMCadPedido.cdsFilial.Locate('CODIGO',fDMCadPedido.cdsPedidoFILIAL.AsInteger,[loCaseInsensitive]);

  fDMCadPedido.vAliqIcms := fDMCadPedido.cdsUFPERC_ICMS.AsFloat;
  fDMCadPedido.vSiglaUF  := fDMCadPedido.cdsClienteUF.AsString;
end;

procedure TfrmCadPedidoSimples.prc_Limpar_Edit_Consulta;
begin
  cePedInterno.Clear;
  DateEdit1.Clear;
  DateEdit2.Clear;
end;

procedure TfrmCadPedidoSimples.prc_Habilitar_CamposNota;
begin
  pnlItem.Enabled       := not(pnlItem.Enabled);
  btnConfirmar.Enabled  := not(btnConfirmar.Enabled);
  btnAlterar.Enabled    := not(btnAlterar.Enabled);
  DBMemo1.ReadOnly      := not(DBMemo1.ReadOnly);
  pnlCliente.Enabled    := not(pnlCliente.Enabled);
  DBMemo1.Enabled       := not(DBMemo1.Enabled);
  SMDBGrid2.Columns[2].ReadOnly := not (SMDBGrid2.Columns[2].ReadOnly);
end;

procedure TfrmCadPedidoSimples.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(cePedInterno.AsInteger);
end;

procedure TfrmCadPedidoSimples.FormShow(Sender: TObject);
var
  i: Word;
  vData: TDateTime;
begin
  fDMCadPedido := TDMCadPedido.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadPedido);
  fDMCadPedido.prc_Abrir_cdsCliente;
  fDmCadPedido.cdsRegiao_Venda.Open;
  if vNum_Pedido_Pos > 0 then
  begin
    prc_Consultar(vNum_Pedido_Pos);
    RzPageControl1.ActivePage := TS_Cadastro;
  end
  else
  begin
    vData := EncodeDate(YearOf(Date),MonthOf(Date),01);
    DateEdit1.Date := vData;
    btnConsultarClick(Sender);
  end;

  vNum_Pedido_Pos := 0;

  for i := 1 to SMDBGrid2.ColCount - 2 do
    if fDMCadPedido.cdsParametrosUSA_GRADE.AsString <> 'S' then
    begin
      if (SMDBGrid2.Columns[i].FieldName = 'TAMANHO') then
        SMDBGrid2.Columns[i].Visible := False;
    end;

  fDmCadPedido.cdsPedido_Itens.AfterScroll := prc_Scroll;
end;

procedure TfrmCadPedidoSimples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadPedidoSimples.prc_imprime_DOS;
var
  f: TextFile;
  vTexto1, vTexto2, vImpressora: String;
  i, j, k: Word;
begin
  vImpressora := 'c:\Delphi7\PedidoSimples.txt';
  AssignFile(f,vImpressora);
  Rewrite(f);
  Write(F,'2',#15); // LD/CC
  Writeln(f);

  vTexto1 := fDMCadPedido.cdsPedidoImpNOME_FILIAL.AsString;
  for i := 1 to 65 - Length(vTexto1) do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + fDMCadPedido.cdsPedidoImpNOME_FILIAL.AsString;
  Writeln(f,vTexto1);
  Writeln(f);

  vTexto1 := 'REQUISICAO DE PRODUTOS No: ' + fDMCadPedido.cdsPedidoImpNUM_PEDIDO.AsString;
  for i := 1 to 65 - Length(vTexto1) do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + 'REQUISICAO DE PRODUTOS No: ' + fDMCadPedido.cdsPedidoImpNUM_PEDIDO.AsString;
  Writeln(f,vTexto1);

  vTexto1 := 'CLIENTE: ' + Copy(fDmCadPedido.cdsPedidoImpNOME_CLI.AsString,1,53);
  for i := 1 to 65 - Length(vTexto1) do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + 'CLIENTE: ' + Copy(fDmCadPedido.cdsPedidoImpNOME_CLI.AsString,1,53);
  Writeln(f,vTexto1);

  vTexto1 := 'OC: ' + fDmCadPedido.cdsPedidoImpPEDIDO_CLIENTE.AsString;
  for i := 1 to 65 - Length(vTexto1) do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + 'OC: ' + fDmCadPedido.cdsPedidoImpPEDIDO_CLIENTE.AsString;
  Writeln(f,vTexto1);
  Writeln(f);

  vTexto1 := '+------+---+--------------------------------------+----------+';
  vTexto1 := vTexto1 + '   ' + vTexto1;
  Writeln(f,vTexto1);

  vTexto1 := '|QUANT.|UNI|DESCRICAO PRODUTO                     |REFERENCIA|';
  vTexto1 := vTexto1 + '   ' + vTexto1;
  Writeln(f,vTexto1);

  vTexto1 := '|------+---+--------------------------------------+----------|';
  vTexto1 := vTexto1 + '   ' + vTexto1;
  Writeln(f,vTexto1);

  j := 0;

  fDmCadPedido.cdsPedidoImp_Itens.First;
  while not fDmCadPedido.cdsPedidoImp_Itens.Eof do
  begin
    vTexto1 := FormatFloat('0.00',fDmCadPedido.cdsPedidoImp_ItensQTD.AsCurrency);

    for i := 1 to 6 - Length(vTexto1) do
      vTexto1 := ' ' + vTexto1;
    vTexto1 := '|' + vTexto1;

    vTexto2 := Copy(fDmCadPedido.cdsPedidoImp_ItensUNIDADE.AsString,1,3);
    for i := 1 to 3 - Length(vTexto2) do
      vTexto2 := vTexto2 + ' ';
    vTexto1 := vTexto1 + '|' + vTexto2;

    vTexto2 := Copy(fDmCadPedido.cdsPedidoImp_ItensNOMEPRODUTO.AsString,1,38);
    for i := 1 to 38 - Length(vTexto2) do
      vTexto2 := vTexto2 + ' ';
    vTexto1 := vTexto1 + '|' + vTexto2;

    vTexto2 := Copy(fDmCadPedido.cdsPedidoImp_ItensREFERENCIA.AsString,1,10);
    for i := 1 to 10 - Length(vTexto2) do
      vTexto2 := vTexto2 + ' ';
    vTexto1 := vTexto1 + '|' + vTexto2 + '|';

    vTexto1 := vTexto1 + '   ' + vTexto1;

    Writeln(f,vTexto1);

    vTexto1 := '|------+---+--------------------------------------+----------|';
    vTexto1 := vTexto1 + '   ' + vTexto1;
    Writeln(f,vTexto1);

    inc(j);

    fDmCadPedido.cdsPedidoImp_Itens.Next;
  end;

  for i := 1 to 8 - j do
  begin
    vTexto1 := '|      |   |                                      |          |';
    vTexto1 := vTexto1 + '   ' + vTexto1;
    Writeln(f,vTexto1);
    vTexto1 := '|------+---+--------------------------------------+----------|';
    vTexto1 := vTexto1 + '   ' + vTexto1;
    Writeln(f,vTexto1);
  end;

  Writeln(f);

  vTexto1 := 'DATA DE CADASTRO: ' + fDmCadPedido.cdsPedidoImpDTEMISSAO.AsString;
  for i := 1 to 65 - Length(vTexto1) do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + 'DATA DE CADASTRO: ' + fDmCadPedido.cdsPedidoImpDTEMISSAO.AsString;
  Writeln(f,vTexto1);

  Writeln(f);

  vTexto1 := '  PROMETIDO PARA: ' + fDmCadPedido.cdsPedidoImpDTENTREGA.AsString;
  for i := 1 to 65 - Length(vTexto1) do
    vTexto1 := vTexto1 + ' ';
  vTexto1 := vTexto1 + '  PROMETIDO PARA: ' + fDmCadPedido.cdsPedidoImpDTENTREGA.AsString;
  Writeln(f,vTexto1);

  Writeln(f);

  vTexto1 := '                                   ---------------------------';
  vTexto1 := vTexto1 + '   ' + vTexto1;
  Writeln(f,vTexto1);

  vTexto1 := '                                   ASS.                       ';
  vTexto1 := vTexto1 + '   ' + vTexto1;
  Writeln(f,vTexto1);

  CloseFile(f);
end;

procedure TfrmCadPedidoSimples.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadPedidoSimples.btnInserir_ItensClick(Sender: TObject);
begin
  if fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger <= 0 then
  begin
    MessageDlg('*** Cliente não informado!', mtError, [mbOk], 0);
    Exit;
  end;

  fDMCadPedido.prc_Inserir_Itens;

  if fDmCadPedido.qParametros_PedID_CFOP_PEDIDO.AsInteger > 0 then
    fDmCadPedido.cdsPedido_ItensID_CFOP.AsInteger := fDmCadPedido.qParametros_PedID_CFOP_PEDIDO.AsInteger;

  ffrmCadPedidoSimples_Itens := TfrmCadPedidoSimples_Itens.Create(self);
  ffrmCadPedidoSimples_Itens.fDMCadPedido := fDMCadPedido;
  ffrmCadPedidoSimples_Itens.ShowModal;
  FreeAndNil(ffrmCadPedidoSimples_Itens);
end;

procedure TfrmCadPedidoSimples.btnConfirmarClick(Sender: TObject);
begin
  if fDMCadPedido.cdsPedidoID_VENDEDOR.AsInteger < 1 then
    fDMCadPedido.cdsPedidoPERC_COMISSAO.AsFloat := 0;
  if RxDBLookupCombo3.Text <> '' then
    fDMCadPedido.cdsPedidoNOME_CLIENTE.AsString := RxDBLookupCombo3.Text;
  prc_Gravar_Registro;
end;

procedure TfrmCadPedidoSimples.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadPedidoSimples.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadPedido.cdsPedido_Consulta.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmCadPedidoSimples.RZPageControl1Change(Sender: TObject);
begin
  if not(fDMCadPedido.cdsPedido.State in [dsEdit, dsInsert]) then
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fDMCadPedido.cdsPedido_Consulta.Active) or (fDMCadPedido.cdsPedido_Consulta.IsEmpty) or
            (fDMCadPedido.cdsPedido_ConsultaID.AsInteger <= 0) then
        exit;
      prc_Posiciona_Pedido;
    end;
end;

procedure TfrmCadPedidoSimples.RxDBLookupCombo3Enter(Sender: TObject);
begin
  fDMCadPedido.cdsCliente.IndexFieldNames := 'NOME';
end;

procedure TfrmCadPedidoSimples.RxDBLookupCombo3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vCodPessoa_Pos := fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger;
    frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
    frmSel_Pessoa.vTipo_Pessoa := 'C';
    frmSel_Pessoa.ShowModal;
    fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger := vCodPessoa_Pos;
    RxDBLookupCombo3.SetFocus;
  end;
end;

procedure TfrmCadPedidoSimples.btnAlterar_ItensClick(Sender: TObject);
var
  vMSGAux: String;
begin
  vMSGAux := '';
  if (fDMCadPedido.cdsPedido_Itens.IsEmpty) or (fDMCadPedido.cdsPedido_ItensITEM.AsInteger <= 0) then
    exit;
  if (fDMCadPedido.cdsPedido_ItensQTD_FATURADO.AsFloat > 0) then
    vMSGAux := vMSGAux + #13 + '*** Item já possui quantidade faturada!';

  if (fDMCadPedido.cdsPedido_ItensQTD_CANCELADO.AsFloat > 0) then
    vMSGAux := vMSGAux + #13 + '*** Item quantidade cancelada!';

  if Trim(vMSGAux) <> '' then
  begin
    MessageDlg(vMSGAux, mtError, [mbOk], 0);
    Exit;
  end;

  fDMCadPedido.cdsPedido_Itens.Edit;

  ffrmCadPedidoSimples_Itens := TfrmCadPedidoSimples_Itens.Create(self);
  ffrmCadPedidoSimples_Itens.fDMCadPedido := fDMCadPedido;
  ffrmCadPedidoSimples_Itens.Edit2.Text   := fDmCadPedido.cdsPedido_ItensNOMEPRODUTO.AsString;
  ffrmCadPedidoSimples_Itens.ShowModal;

  FreeAndNil(ffrmCadPedidoSimples_Itens);

  btnCalcular_ValoresClick(Sender);
end;

procedure TfrmCadPedidoSimples.btnCalcular_ValoresClick(Sender: TObject);
begin
  SMDBGrid2.DisableScroll;
  uCalculo_Pedido.prc_Calcular_Desconto_Novo(fDMCadPedido,False);
  SMDBGrid2.EnableScroll;
end;

procedure TfrmCadPedidoSimples.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadPedido.cdsPedido.IsEmpty) or not(fDMCadPedido.cdsPedido.Active) or (fDMCadPedido.cdsPedidoID.AsInteger < 1) then
    Exit;

  fDMCadPedido.cdsPedido.Edit;

  prc_Posicionar_Cliente;

  TS_Consulta.TabEnabled := False;
  prc_Habilitar_CamposNota;
end;

procedure TfrmCadPedidoSimples.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadPedido.cdsPedido.State in [dsBrowse]) or not(fDMCadPedido.cdsPedido.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    Exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    Exit;

  fDMCadPedido.cdsPedido.CancelUpdates;

  prc_Habilitar_CamposNota;

  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadPedidoSimples.SpeedButton1Click(Sender: TObject);
begin
  fDMCadPedido.cdsCliente.Close;
  fDMCadPedido.cdsCliente.Open;
end;

procedure TfrmCadPedidoSimples.SpeedButton4Click(Sender: TObject);
begin
  fDMCadPedido.cdsCondPgto.Close;
  fDMCadPedido.cdsCondPgto.Open;
end;

procedure TfrmCadPedidoSimples.RxDBLookupCombo2Enter(Sender: TObject);
begin
  fDMCadPedido.cdsCondPgto.IndexFieldNames := 'NOME';
end;

procedure TfrmCadPedidoSimples.btnExcluir_ItensClick(Sender: TObject);
begin
  if not(fDMCadPedido.cdsPedido_Itens.Active) and (fDMCadPedido.cdsPedido_Itens.IsEmpty) or (fDMCadPedido.cdsPedido_ItensITEM.AsInteger < 1) then
    Exit;

  if MessageDlg('Deseja excluir o item selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    Exit;

  uGrava_Pedido.prc_Excluir_Item_Ped(fDMCadPedido);

  btnCalcular_ValoresClick(Sender);
end;

procedure TfrmCadPedidoSimples.pnlClienteEnter(Sender: TObject);
begin
  vID_ClienteAnt := fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger;
end;

procedure TfrmCadPedidoSimples.pnlClienteExit(Sender: TObject);
begin
  prc_Posicionar_Cliente;

  if vID_ClienteAnt = fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger then
    exit;

  if fDMCadPedido.cdsClienteID_CONDPGTO.AsInteger > 0 then
    fDMCadPedido.cdsPedidoID_CONDPGTO.AsInteger  := fDMCadPedido.cdsClienteID_CONDPGTO.AsInteger;
end;

procedure TfrmCadPedidoSimples.ModeloresumidoTXT1Click(Sender: TObject);
begin
  prc_prepara_print;
  prc_imprime_DOS;
end;

procedure TfrmCadPedidoSimples.prc_prepara_print;
begin
  if not(fDMCadPedido.cdsPedido_Consulta.Active) or (fDMCadPedido.cdsPedido_Consulta.IsEmpty) or
        (fDMCadPedido.cdsPedido_ConsultaID.AsInteger <= 0) then
    Exit;

  fDMCadPedido.cdsFilial.Locate('ID',fDMCadPedido.cdsPedido_ConsultaFILIAL.AsInteger,[loCaseInsensitive]);

  fDMCadPedido.cdsPedidoImp.Close;
  fDMCadPedido.sdsPedidoImp.ParamByName('ID').AsInteger := fDMCadPedido.cdsPedido_ConsultaID.AsInteger;
  fDMCadPedido.cdsPedidoImp.Open;

  fDMCadPedido.cdsPedidoImp_Itens.Close;
  fDMCadPedido.sdsPedidoImp_Itens.ParamByName('ID').AsInteger := fDMCadPedido.cdsPedidoImpID.AsInteger;
  fDMCadPedido.cdsPedidoImp_Itens.Open;
end;

procedure TfrmCadPedidoSimples.Carndepagamento1Click(Sender: TObject);
begin
  prc_prepara_print;
end;

procedure TfrmCadPedidoSimples.Completo1Click(Sender: TObject);
var
  vArq: String;
begin
  fDmCadPedido.ctPedidoImp_Itens := fDmCadPedido.sdsPedidoImp_Itens.CommandText;
  fDmCadPedido.sdspedidoimp_itens.CommandText := 'SELECT ((PI.vlr_total / PI.qtd) * PI.qtd_restante) VLR_TOTAL_PARCIAL, ' +
                                    '((PI.vlr_duplicata / PI.qtd) * PI.qtd_restante) VLR_DUPLICATA_PARCIAL, ' +
                                    '((PI.vlr_desconto / PI.qtd) * PI.qtd_restante) VLR_DESCONTO_PARCIAL, ' +
                                    '((PI.vlr_descontorateio / PI.qtd) * PI.qtd_restante) VLR_DESCONTORATEIO_PARCIAL, ' +
                                    '((PI.vlr_frete / PI.qtd) * PI.qtd_restante) VLR_FRETE_PARCIAL, ' +
                                    '((PI.vlr_icms / PI.qtd) * PI.qtd_restante) VLR_ICMS_PARCIAL, ' +
                                    '((PI.vlr_transf / PI.qtd) * PI.qtd_restante) VLR_TRANSF_PARCIAL, ' +
                                    '((PI.vlr_ipi / PI.qtd) * PI.qtd_restante) VLR_IPI_PARCIAL, ' +
                                    '((PI.vlr_icmssimples / PI.qtd) * PI.qtd_restante) VLR_ICMSSIMPLES_PARCIAL, ' +
                                    '((PI.vlr_icmssubst / PI.qtd) * PI.qtd_restante) VLR_ICMSSUBST_PARCIAL, ' +
                                    '((PI.vlr_descontorateio / PI.qtd) * PI.qtd_restante) VLR_DESCONTO_RATEIO_PARCIAL, ' +
                                    '((PI.vlr_icmsdiferido / PI.qtd) * PI.qtd_restante) VLR_ICMSDIFERIDO_PARCIAL, ' +
                                    '((PI.vlr_icms_fcp / PI.qtd) * PI.qtd_restante) VLR_ICMS_FCP_PARCIAL, ' +
                                    '((PI.vlr_icms_uf_dest / PI.qtd) * PI.qtd_restante) VLR_ICMS_UF_DEST_PARCIAL, ' +
                                    '((PI.vlr_icms_uf_remet / PI.qtd) * PI.qtd_restante) VLR_ICMS_UF_REMET_PARCIAL, ' +
                                    '((PI.base_icmssubst / PI.qtd) * PI.qtd_restante) BASE_ICMSSUBST_PARCIAL ' +
                                    ' , PI.*, MARCA.NOME NOME_MARCA, PT.comprimento, PT.largura, PT.altura, ' +
                                    'PT.vlr_kg, PT.qtd QTD_TIPO, PT.vlr_unitario VLR_UNITARIO_TIPO, PT.VLR_TOTAL VLR_TOTAL_TIPO, ' +
                                    'PT.diametro, PT.diametro_ext, PT.diametro_int, PT.parede, PT.peso, PT.complemento_nome, ' +
                                    'PT.tipo_orcamento, PT.descricao_tipo, NCM.NCM, PT.QTD_FUROS, PRO.PICTOGRAMA, ' +
                                    'COMB.NOME NOME_COR_COMBINACAO, PRO.FOTO, PTAM.tam_matriz, ATE.nome NOME_ATELIER, ' +
                                    'PRO.imp_rotulo IMP_ROTULO_PROD, (pi.vlr_total + pi.vlr_desconto + pi.vlr_descontorateio) Vlr_Total_Calc, ' +
                                    '(pi.vlr_desconto + pi.vlr_descontorateio) Vlr_Desconto_Calc, (pro.pesobruto * pi.qtd_caixa) peso_varejo, PT.ID_MATERIAL, ' +
                                    'PT.ID_TIPO_MATERIAL, TMAT.NOME NOME_TIPO_MATERIAL, PT.ESPESSURA, PT.DENSIDADE, PT.ALTURA_CORTE, ' +
                                    'PT.LARGURA_CORTE,MP.NOME NOME_ACABAMENTO, PT.CAMINHO_ARQUIVO_PDF, ' +
                                    'CASE ' +
                                    '  WHEN (PLOTE.LOCALIZACAO IS NOT NULL) AND (PLOTE.LOCALIZACAO <> '''') THEN PLOTE.LOCALIZACAO ' +
                                    '  WHEN (PRO.LOCALIZACAO IS NOT NULL) AND (PRO.LOCALIZACAO <> '''') THEN PRO.LOCALIZACAO ' +
                                    '  ELSE NULL ' +
                                    '  END LOCALIZACAO, ' +
                                    'case ' +
                                    '  WHEN PI.TIPO_OS = ''OC'' THEN PI.TIPO_OS ' +
                                    '  WHEN PI.TIPO_OS = ''OP'' THEN PI.TIPO_OS ' +
                                    '  WHEN PI.TIPO_OS = ''RE'' THEN PI.TIPO_OS ' +
                                    '  ELSE ''''' +
                                    '  END DESC_TIPO_OS, PRO.QTD_POR_ROTULO QTD_POR_ROTULO_PROD, ' +
                                    '  PRO.QTD_EMBALAGEM QTD_EMBALAGEM_PROD, PRO.MEDIDA, UNI.mostrar_grosa, ' +
                                    '  corp.nome nome_cor_perfil, CORV.nome NOME_COR_VIDRO, ' +
                                    '  PT.preco_cor_perfil, PT.preco_cor_vidro, ' +
                                    'case ' +
                                    '  when coalesce(PI.vlr_unitario_ipi,0) > 0 THEN (pi.vlr_unitario_ipi * pi.qtd) - (coalesce(pi.vlr_desconto,0) + coalesce(pi.vlr_descontorateio,0)) ' +
                                    '  else pi.vlr_total ' +
                                    '  end vlr_total_com_ipi ' +
                                    'FROM PEDIDO_ITEM PI ' +
                                    'inner JOIN PRODUTO PRO ON (PI.ID_PRODUTO = PRO.ID) ' +
                                    'LEFT JOIN MARCA ON (PRO.ID_MARCA = MARCA.ID) ' +
                                    'LEFT JOIN PEDIDO_ITEM_TIPO PT ON (PI.ID = PT.ID AND PI.ITEM = PT.ITEM) ' +
                                    'LEFT JOIN TAB_NCM NCM ON (PRO.ID_NCM = NCM.ID) ' +
                                    'LEFT JOIN COMBINACAO COMB ON (PI.ID_COR = COMB.ID) ' +
                                    'LEFT JOIN PRODUTO_TAM PTAM ON (PI.id_produto = PTAM.id AND PI.tamanho = PTAM.tamanho) ' +
                                    'LEFT JOIN PESSOA ATE ON (PI.id_atelier = ATE.CODIGO ) ' +
                                    'LEFT JOIN PRODUTO_LOTE PLOTE ON (PI.ID_PRODUTO = PLOTE.ID AND PI.NUM_LOTE_CONTROLE = PLOTE.NUM_LOTE_CONTROLE) ' +
                                    'LEFT JOIN TIPO_MATERIAL TMAT ON (PT.ID_TIPO_MATERIAL = TMAT.ID) ' +
                                    'LEFT JOIN MATRIZ_PRECO MP ON MP.ID = PT.ID_ACABAMENTO ' +
                                    'LEFT JOIN UNIDADE UNI ON PI.UNIDADE = UNI.unidade ' +
                                    'LEFT JOIN COMBINACAO CORP ON PT.id_cor_perfil = CORP.ID ' +
                                    'LEFT JOIN COMBINACAO CORV ON PT.id_cor_vidro = CORV.ID ' +
                                    'WHERE PI.ID = :ID AND ((PI.TIPO_ACESSORIO = ''N'') OR (PI.TIPO_ACESSORIO IS NULL))';


  fDMCadPedido.qFilial_Rel.Close;
  fDMCadPedido.qFilial_Rel.ParamByName('ID').AsInteger      := 1;
  fDMCadPedido.qFilial_Rel.ParamByName('TIPO').AsInteger    := 2;
  fDMCadPedido.qFilial_Rel.ParamByName('POSICAO').AsInteger := 1;
  fDMCadPedido.qFilial_Rel.Open;
  vArq := fDMCadPedido.qFilial_RelCAMINHO.AsString;
  if FileExists(vArq) then
    fDMCadPedido.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;

  fDmCadPedido.cdsPedido_Consulta.First;
  while not fDmCadPedido.cdsPedido_Consulta.Eof do
  begin
    prc_prepara_print;       

    fDMCadPedido.frxReport1.ShowReport;
    fDmCadPedido.cdsPedido_Consulta.Next;
  end;
end;

procedure TfrmCadPedidoSimples.SpeedButton2Click(Sender: TObject);
begin
  ffrmCadCondPgto := TfrmCadCondPgto.Create(self);
  ffrmCadCondPgto.ShowModal;
  FreeAndNil(ffrmCadCondPgto);
  fDmCadPedido.cdsCondPgto.Close;
  fDmCadPedido.cdsCondPgto.Open;
end;

procedure TfrmCadPedidoSimples.btnExcluirClick(Sender: TObject);
begin
  if not fnc_Verifica_Registro then
    Exit;

  prc_Posiciona_Pedido;
  if fDMCadPedido.cdsPedido.IsEmpty then
    Exit;
  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    Exit;

  if fDMCadPedido.fnc_Existe_Fat(fDMCadPedido.cdsPedidoID.AsInteger) > 0 then
  begin
    MessageDlg('*** Pedido não excluído pois já foi faturado!', mtError, [mbOk], 0);
    Exit;
  end;

  prc_Excluir_Registro;

  btnConsultarClick(Sender);
end;

function TfrmCadPedidoSimples.fnc_Verifica_Registro: Boolean;
begin
  Result := False;
  if not(fDMCadPedido.cdsPedido_Consulta.Active) or (fDMCadPedido.cdsPedido_Consulta.IsEmpty) or
        (fDMCadPedido.cdsPedido_ConsultaID.AsInteger < 1) then
    Exit;

  Result := True;
end;

procedure TfrmCadPedidoSimples.btnGerarClick(Sender: TObject);
begin
  if uUtilPadrao.fnc_Selecionar_Filial <= 0 then
    exit;

  fDMCadPedido.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]);
  lblNome_Filial.Caption := vFilial_Nome;

  frmCadPedidoSimples_Geracao := TfrmCadPedidoSimples_Geracao.Create(Self);
  frmCadPedidoSimples_Geracao.fDmCadPedido := fDmCadPedido;
  frmCadPedidoSimples_Geracao.ShowModal;

  DateEdit1.Date := Date;
  btnConsultarClick(Sender);
end;

procedure TfrmCadPedidoSimples.RxDBLookupCombo1Change(Sender: TObject);
begin
  fDmCadPedido.cdsRegiao_Venda.IndexFieldNames := 'NOME';
end;

procedure TfrmCadPedidoSimples.prc_Scroll(DataSet: TDataSet);
begin
  if fDmCadPedido.cdsPedido_ItensQTD.AsCurrency > 0 then
  begin
    fDmCadPedido.cdsPedido_Itens.Edit;
    fDmCadPedido.cdsPedido_ItensVLR_TOTAL.AsCurrency := fDmCadPedido.cdsPedido_ItensQTD.AsCurrency *
                                                        fDmCadPedido.cdsPedido_ItensVLR_UNITARIO.AsCurrency;
    fDmCadPedido.cdsPedido_Itens.Post;
  end;
end;

end.

