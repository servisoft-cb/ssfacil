unit UConsEstoque_Mov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, Mask, 
  DBGrids, SMDBGrid, Provider, DBClient, SqlExpr, UDMConsEstoque, RxLookup, UCBase, ToolEdit, RzTabs, RzPanel, FMTBcd, ComObj,
  NxCollection, StrUtils, CurrEdit, DB, ComCtrls;

type
  TfrmConsEstoque_Mov = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Label4: TLabel;
    DateEdit2: TDateEdit;
    RzPageControl1: TRzPageControl;
    TS_Produto_Det: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    RzGroupBox2: TRzGroupBox;
    Label5: TLabel;
    lblEntrada: TLabel;
    Label6: TLabel;
    lblSaida: TLabel;
    Label9: TLabel;
    lblSaldo: TLabel;
    TS_Produto_Acum: TRzTabSheet;
    Label7: TLabel;
    SMDBGrid2: TSMDBGrid;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    Panel2: TPanel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    rgTipo: TRadioGroup;
    RadioGroup1: TRadioGroup;
    rxdbGrupo: TRxDBLookupCombo;
    Label30: TLabel;
    ckEstruturado: TCheckBox;
    ckImpTotalEst: TCheckBox;
    Label10: TLabel;
    rxdbLocalEstoque: TRxDBLookupCombo;
    TS_Produto_Local: TRzTabSheet;
    SMDBGrid3: TSMDBGrid;
    Panel3: TPanel;
    ckImpValor: TCheckBox;
    TS_Reserva: TRzTabSheet;
    SMDBGrid4: TSMDBGrid;
    RzGroupBox1: TRzGroupBox;
    Label11: TLabel;
    lblEntrada_Res: TLabel;
    Label13: TLabel;
    lblSaida_Res: TLabel;
    Label15: TLabel;
    lblSaldo_Res: TLabel;
    Label12: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Panel4: TPanel;
    btnInserir_Itens: TNxButton;
    btnExcluir_Itens: TNxButton;
    btnAlterar_Itens: TNxButton;
    UCControls1: TUCControls;
    Panel5: TPanel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    btnExcel: TNxButton;
    Label1: TLabel;
    edtRef: TEdit;
    Label14: TLabel;
    ceIDProduto: TCurrencyEdit;
    Label16: TLabel;
    edtNome_Pessoa: TEdit;
    ceIDPessoa: TCurrencyEdit;
    ckSemCor: TCheckBox;
    NxButton1: TNxButton;
    DBGrid11: TDBGrid;
    ProgressBar1: TProgressBar;
    NxButton2: TNxButton;
    ckEstrutura: TCheckBox;
    ckInativo: TCheckBox;
    ckImpPrecoCusto: TCheckBox;
    ckImpPrecoCusto2: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure rgTipoClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure rxdbGrupoKeyDowno(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxdbGrupoDropDown(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ckEstruturadoClick(Sender: TObject);
    procedure SMDBGrid3TitleClick(Column: TColumn);
    procedure SMDBGrid4TitleClick(Column: TColumn);
    procedure RzPageControl1Change(Sender: TObject);
    procedure btnInserir_ItensClick(Sender: TObject);
    procedure btnAlterar_ItensClick(Sender: TObject);
    procedure btnExcluir_ItensClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure edtRefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ceIDProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ceIDPessoaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ceIDPessoaExit(Sender: TObject);
    procedure edtNome_PessoaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefExit(Sender: TObject);
    procedure ceIDProdutoExit(Sender: TObject);
    procedure edtNome_PessoaExit(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure rxdbGrupoChange(Sender: TObject);
    procedure ckImpPrecoCusto2Click(Sender: TObject);
  private
    { Private declarations }
    fDMConsEstoque: TDMConsEstoque;
    ColunaOrdenada: String;
    vComando: String;

    procedure prc_Consultar;
    procedure prc_Le_cdsEstoque_Mov(Gerar_CC: Boolean);
    procedure prc_Le_cdsEstoque_Mov_Res;
    procedure prc_Consultar_Acum;
    procedure prc_Consultar_Local;
    procedure prc_Consultar_Reserva;
    procedure prc_Consultar_Ant;

    procedure prc_Chamar_Sel_Produto(Tipo: String);

    procedure prc_Condicao(Saldo_Ant: Boolean = False);
    procedure prc_Monta_Cab;

    procedure prc_Imprimir_Produto_Det;
    procedure prc_Imprimir_Produto_Acum;
    procedure prc_Imprimir_Produto_Local;

    procedure prc_Excel_Det2;
    procedure prc_Excel_Acum;
    procedure prc_Excel_Local;
    procedure prc_Excel_Mov_Res;

    procedure prc_Chamar_Sel_Pessoa(Tipo: String);
  public
    { Public declarations }
    vID_Cor_Loc: Integer;         
  end;

var
  frmConsEstoque_Mov: TfrmConsEstoque_Mov;
  vControleExterno: Boolean = False;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, URelEstoqueMov_Prod, URelEstoqueMov_Prod2, URelEstoqueMov_Acum, USel_Produto,
  USel_Pessoa, Math, USel_Grupo, UCadEstoque_Mov_Res, UAltEstoque_Mov, DateUtils;

{$R *.dfm}

procedure TfrmConsEstoque_Mov.prc_Consultar;
begin
  fDMConsEstoque.cdsEstoque_Mov.Close;
  fDMConsEstoque.sdsEstoque_Mov.CommandText := fDMConsEstoque.ctEstoque_Mov + vComando;
  fDMConsEstoque.cdsEstoque_Mov.Open;
   //fdmConsEstoque.ClientDataSet1.Close;
   //fdmConsEstoque.ClientDataSet1.Open;
end;

procedure TfrmConsEstoque_Mov.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vID_Cor_Loc := 0;
  prc_Grava_Grid(SMDBGrid1, Name, fDMConsEstoque.qParametros_GeralENDGRIDS.AsString);
  fDMConsEstoque.cdsProduto.Filtered := False;
  Action := Cafree;
end;

procedure TfrmConsEstoque_Mov.FormShow(Sender: TObject);
var
  i: Integer;
  vDia, vMes, vAno: Word;
  vData: TDateTime;
begin
  vData := Date;
  vData := IncDay(vData,-20);
  vData := EncodeDate(YearOf(vData),MonthOf(vData),01);
  DateEdit1.Date := vData;

  fDMConsEstoque := TDMConsEstoque.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsEstoque);
  prc_le_Grid(SMDBGrid1, Name, fDMConsEstoque.qParametros_GeralENDGRIDS.AsString);

  ckImpPrecoCusto2Click(Sender);

  SMDBGrid1.ClearFilter;

  rgTipoClick(Sender);
  fDMConsEstoque.cdsFilial.First;
  if (fDMConsEstoque.cdsFilial.RecordCount < 2) and (fDMConsEstoque.cdsFilialID.AsInteger > 0) then
    RxDBLookupCombo1.KeyValue := fDMConsEstoque.cdsFilialID.AsInteger;
  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'TAMANHO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_GRADE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_COR') then
      SMDBGrid1.Columns[i].Visible := ((fDMConsEstoque.qParametrosINFORMAR_COR_MATERIAL.AsString = 'S') or (fDMConsEstoque.qParametrosINFORMAR_COR_PROD.AsString = 'C'));
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_LOCAL') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'COD_LOCAL') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'NUM_LOTE_CONTROLE') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_LOTE_CONTROLE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'PRECO_CUSTO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametros_EstMOSTRAR_PCUSTO_MOV.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'PRECO_CUSTO_TOTAL') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametros_EstMOSTRAR_PCUSTO_TOTAL_MOV.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'ESPESSURA') or (SMDBGrid1.Columns[i].FieldName = 'LARGURA') or (SMDBGrid1.Columns[i].FieldName = 'COMPRIMENTO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosEMPRESA_SUCATA.AsString = 'S');
  end;
  Label10.Visible             := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
  rxdbLocalEstoque.Visible    := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
  TS_Produto_Local.TabVisible := (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');

  if vControleExterno then
  begin
    rgTipo.ItemIndex := 5;
    if vID_Cor_Loc > 0 then
      RadioGroup1.ItemIndex := 2
    else
      RadioGroup1.ItemIndex := 0;
    btnConsultar.Click;
  end;
  DBGrid11.Visible := (fDMConsEstoque.qParametros_NTEUSA_CENTRO_CUSTO.AsString = 'S');
end;

procedure TfrmConsEstoque_Mov.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsEstoque.cdsEstoque_Mov.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsEstoque_Mov.rgTipoClick(Sender: TObject);
begin
  fDMConsEstoque.cdsProduto.Filtered := False;
  fDMConsEstoque.cdsProduto.Filter   := '';
  case rgTipo.ItemIndex of
   0: fDMConsEstoque.cdsProduto.Filter := 'TIPO_REG = '''+'P'+'''';
   1: fDMConsEstoque.cdsProduto.Filter := 'TIPO_REG = '''+'M'+'''';
   2: fDMConsEstoque.cdsProduto.Filter := 'TIPO_REG = '''+'C'+'''';
   3: fDMConsEstoque.cdsProduto.Filter := 'TIPO_REG = '''+'S'+'''';
   4: fDMConsEstoque.cdsProduto.Filter := 'TIPO_REG = '''+'I'+'''';
  end;
  if rgTipo.ItemIndex < 5 then
    fDMConsEstoque.cdsProduto.Filtered := True;
  TS_Reserva.TabVisible := ((rgTipo.ItemIndex = 1) and (fDMConsEstoque.qParametros_EstUSA_RESERVA.AsString = 'S'));
end;

procedure TfrmConsEstoque_Mov.prc_Le_cdsEstoque_Mov(Gerar_CC: Boolean);
var
  vQtdEntrada, vQtdSaida, vSaldo: Real;
begin
  SMDBGrid1.DisableScroll;
  vQtdEntrada := 0;
  vQtdSaida   := 0;
  fDMConsEstoque.mEstoque_CentroCusto.close;
  fDMConsEstoque.mEstoque_CentroCusto.CreateDataSet;
  fDMConsEstoque.mEstoque_CentroCusto.EmptyDataSet;
  ProgressBar1.Visible  := True;
  ProgressBar1.Refresh;
  ProgressBar1.Max      := fDMConsEstoque.cdsEstoque_Mov.RecordCount;
  ProgressBar1.Position := 0;

  fDMConsEstoque.cdsEstoque_Mov.First;
  while not fDMConsEstoque.cdsEstoque_Mov.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if fDMConsEstoque.cdsEstoque_MovTIPO_ES.AsString = 'E' then
      vQtdEntrada := vQtdEntrada + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat
    else
      vQtdSaida := vQtdSaida + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat;
    if Gerar_CC then
    begin
      //07/09/2019
      //if fDMConsEstoque.cdsEstoque_MovTIPO_ES.AsString = 'S' then
      //begin
       if not(fDMConsEstoque.mEstoque_CentroCusto.Locate('Id_Produto; Codigo_CentroCusto',VarArrayOf([fDMConsEstoque.cdsEstoque_MovID_PRODUTO.AsInteger,fDMConsEstoque.cdsEstoque_MovCODIGO_CCUSTO.AsString]),[loCaseInsensitive])) then
         fDMConsEstoque.mEstoque_CentroCusto.Insert
       else
         fDMConsEstoque.mEstoque_CentroCusto.Edit;
        fDMConsEstoque.mEstoque_CentroCustoId_Produto.AsInteger        := fDMConsEstoque.cdsEstoque_MovID_PRODUTO.AsInteger;
        fDMConsEstoque.mEstoque_CentroCustoNome_Produto.AsString       := fDMConsEstoque.cdsEstoque_MovNOMEPRODUTO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoCodigo_Grupo.AsString       := fDMConsEstoque.cdsEstoque_MovCODIGO_GRUPO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoNome_Grupo.AsString         := fDMConsEstoque.cdsEstoque_MovNOME_GRUPO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoCodigo_CentroCusto.AsString := fDMConsEstoque.cdsEstoque_MovCODIGO_CCUSTO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoNome_CentroCusto.AsString   := fDMConsEstoque.cdsEstoque_MovNOME_CENTROCUSTO.AsString;
        fDMConsEstoque.mEstoque_CentroCustoCodigo_Superior.AsString    := fDMConsEstoque.cdsEstoque_MovCODIGO_SUPERIOR.AsString;
        fDMConsEstoque.mEstoque_CentroCustoNome_Superior.AsString      := fDMConsEstoque.cdsEstoque_MovDESC_SUPERIOR.AsString;
        //06/09/2019
        if fDMConsEstoque.cdsEstoque_MovTIPO_ES.AsString = 'S' then
        begin
          fDMConsEstoque.mEstoque_CentroCustoQSai.AsFloat     := fDMConsEstoque.mEstoque_CentroCustoQSai.AsFloat + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat;
          //03/11/2020  colocado esse checkbox para o pre�o de custo
          if ckImpPrecoCusto.Checked then
            fDMConsEstoque.mEstoque_CentroCustoVlrTotal.AsFloat := fDMConsEstoque.mEstoque_CentroCustoVlrTotal.AsFloat + (fDMConsEstoque.cdsEstoque_MovPRECO_CUSTO.AsFloat * fDMConsEstoque.cdsEstoque_MovQTD.AsFloat)
          else
            fDMConsEstoque.mEstoque_CentroCustoVlrTotal.AsFloat := fDMConsEstoque.mEstoque_CentroCustoVlrTotal.AsFloat + (fDMConsEstoque.cdsEstoque_MovVLR_UNITARIO.AsFloat * fDMConsEstoque.cdsEstoque_MovQTD.AsFloat);
        end
        else
        begin
          fDMConsEstoque.mEstoque_CentroCustoQEnt.AsFloat       := fDMConsEstoque.mEstoque_CentroCustoQEnt.AsFloat + fDMConsEstoque.cdsEstoque_MovQTD.AsFloat;
          if ckImpPrecoCusto.Checked then
            fDMConsEstoque.mEstoque_CentroCustoVlrEntrada.AsFloat := fDMConsEstoque.mEstoque_CentroCustoVlrEntrada.AsFloat + (fDMConsEstoque.cdsEstoque_MovPRECO_CUSTO.AsFloat * fDMConsEstoque.cdsEstoque_MovQTD.AsFloat)
          else
            fDMConsEstoque.mEstoque_CentroCustoVlrEntrada.AsFloat := fDMConsEstoque.mEstoque_CentroCustoVlrEntrada.AsFloat + (fDMConsEstoque.cdsEstoque_MovVLR_UNITARIO.AsFloat * fDMConsEstoque.cdsEstoque_MovQTD.AsFloat);
        end;
        fDMConsEstoque.mEstoque_CentroCustoQSaldo.AsFloat       := fDMConsEstoque.mEstoque_CentroCustoQEnt.AsFloat - fDMConsEstoque.mEstoque_CentroCustoQSai.AsFloat;
        fDMConsEstoque.mEstoque_CentroCustoVlrSaldo.AsFloat     := fDMConsEstoque.mEstoque_CentroCustoVlrEntrada.AsFloat - fDMConsEstoque.mEstoque_CentroCustoVlrTotal.AsFloat;
        //************
        fDMConsEstoque.mEstoque_CentroCusto.Post;
      //end;
    end;
    fDMConsEstoque.cdsEstoque_Mov.Next;
  end;

  vSaldo := vQtdEntrada - vQtdSaida;
  lblEntrada.Caption := FormatFloat('###,###,##0.0000',vQtdEntrada);
  lblSaida.Caption   := FormatFloat('###,###,##0.0000',vQtdSaida);
  lblSaldo.Caption   := FormatFloat('###,###,##0.0000',vSaldo);
  SMDBGrid1.EnableScroll;
  ProgressBar1.Visible := False;
end;

procedure TfrmConsEstoque_Mov.btnConsultarClick(Sender: TObject);
var
  Form: TForm;
begin
  SMDBGrid1.DisableScroll;
  if (trim(edtRef.Text) = '') and (ceIDProduto.AsInteger <= 0) and
     (ceIDPessoa.AsInteger <= 0) and (trim(edtNome_Pessoa.Text) = '') and
     (trim(rxdbGrupo.Text) = '') and (DateEdit1.Date <= 10) and (DateEdit2.Date <= 10) and
     (CurrencyEdit1.AsInteger <= 0) then
  begin
    MessageDlg('*** Favor informar algum filtro!', mtError, [mbOk], 0);
    exit;
  end;

  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);

  try
    prc_Condicao;
    if RzPageControl1.ActivePage = TS_Produto_Det then
    begin
      prc_Consultar;
      //prc_Le_cdsEstoque_Mov;
    end
    else
    if RzPageControl1.ActivePage = TS_Produto_Acum then
      prc_Consultar_Acum
    else
    if RzPageControl1.ActivePage = TS_Produto_Local then
      prc_Consultar_Local
    else
    if RzPageControl1.ActivePage = TS_Reserva then
    begin
      prc_Consultar_Reserva;
      prc_Le_cdsEstoque_Mov_Res;
    end;
  finally
    FreeAndNil(Form);
  end;
  SMDBGrid1.EnableScroll;
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    Label9.Caption := 'Saldo de ' + DateEdit1.Text + ' at� ' + DateEdit2.Text
  else
  if (DateEdit1.Date > 10) then
    Label9.Caption := 'Saldo de ' + DateEdit1.Text + ' at� ' + DateToStr(Date)
  else
  if (DateEdit2.Date > 10) then
    Label9.Caption := 'Saldo at� ' + DateEdit2.Text
  else
    Label9.Caption := 'Saldo' + DateEdit2.Text;
end;

procedure TfrmConsEstoque_Mov.prc_Consultar_Acum;
var
  vComandoAux, vComandoAux2: String;
  i: Integer;
  vFilialAux: Integer;
begin
  fDMConsEstoque.cdsEstoque_Acum.Close;
  i := PosEx('GROUP',UpperCase(fDMConsEstoque.ctEstoque_Acum),0);
  vComandoAux  := copy(fDMConsEstoque.ctEstoque_Acum,i,Length(fDMConsEstoque.ctEstoque_Acum) - i + 1);
  vComandoAux2 := copy(fDMConsEstoque.ctEstoque_Acum,1,i-1);
  fDMConsEstoque.sdsEstoque_Acum.CommandText := vComandoAux2 + vComando + vComandoAux;
  fDMConsEstoque.cdsEstoque_Acum.Open;
  vFilialAux := 0;
  if RxDBLookupCombo1.Text <> '' then
    vFilialAux := RxDBLookupCombo1.KeyValue;
  fDMConsEstoque.mAuxEst_Acum.EmptyDataSet;
  SMDBGrid2.DataSource := nil;
  SMDBGrid2.ClearFilter;
  fDMConsEstoque.cdsEstoque_Acum.First;
  while not fDMConsEstoque.cdsEstoque_Acum.Eof do
  begin
    fDMConsEstoque.mAuxEst_Acum.Insert;
    fDMConsEstoque.mAuxEst_AcumID_Produto.AsInteger := fDMConsEstoque.cdsEstoque_AcumID_PRODUTO.AsInteger;
    fDMConsEstoque.mAuxEst_AcumReferencia.AsString  := fDMConsEstoque.cdsEstoque_AcumREFERENCIA.AsString;
    fDMConsEstoque.mAuxEst_AcumNomeProduto.AsString := fDMConsEstoque.cdsEstoque_AcumNOMEPRODUTO.AsString;
    fDMConsEstoque.mAuxEst_AcumQtd_Ant.AsFloat      := StrToFloat(FormatFloat('0.000000',0));
    fDMConsEstoque.mAuxEst_AcumQtd_Ent.AsFloat      := StrToFloat(FormatFloat('0.000000',fDMConsEstoque.cdsEstoque_AcumQTD_ENT.AsFloat));
    fDMConsEstoque.mAuxEst_AcumQtd_Sai.AsFloat      := StrToFloat(FormatFloat('0.000000',fDMConsEstoque.cdsEstoque_AcumQTD_SAI.AsFloat));
    fDMConsEstoque.mAuxEst_AcumSaldo.AsFloat        := StrToFloat(FormatFloat('0.000000',fDMConsEstoque.mAuxEst_AcumQtd_Ant.AsFloat + fDMConsEstoque.mAuxEst_AcumQtd_Ent.AsFloat - fDMConsEstoque.mAuxEst_AcumQtd_Sai.AsFloat));
    fDMConsEstoque.mAuxEst_AcumVlr_Entrada.AsFloat  := StrToFloat(FormatFloat('0.00##',fDMConsEstoque.cdsEstoque_AcumVLR_ENTRADA.AsFloat));
    fDMConsEstoque.mAuxEst_AcumVlr_Saida.AsFloat    := StrToFloat(FormatFloat('0.00##',fDMConsEstoque.cdsEstoque_AcumVLR_SAIDA.AsFloat));
    fDMConsEstoque.mAuxEst_AcumSaldo_Periodo.AsFloat := StrToFloat(FormatFloat('0.000000',fDMConsEstoque.mAuxEst_AcumQtd_Ent.AsFloat - fDMConsEstoque.mAuxEst_AcumQtd_Sai.AsFloat));
    fDMConsEstoque.mAuxEst_AcumUnidade.AsString      := fDMConsEstoque.cdsEstoque_AcumUnidade.AsString;
    fDMConsEstoque.mAuxEst_AcumPreco_Custo.AsFloat   := StrToFloat(FormatFloat('0.0000',fDMConsEstoque.cdsEstoque_AcumPRECO_CUSTO.AsFloat));
    
    fDMConsEstoque.mAuxEst_AcumVlr_Entrada_Custo.AsFloat := StrToFloat(FormatFloat('0.00',fDMConsEstoque.cdsEstoque_AcumVLR_ENTRADA_CUSTO.AsFloat));
    fDMConsEstoque.mAuxEst_AcumVlr_Saida_Custo.AsFloat   := StrToFloat(FormatFloat('0.00',fDMConsEstoque.cdsEstoque_AcumVLR_SAIDA_CUSTO.AsFloat));

    fDMConsEstoque.mAuxEst_Acum.Post;
    fDMConsEstoque.cdsEstoque_Acum.Next;
  end;
  if CheckBox2.Checked then
  begin
    prc_Condicao(True);
    prc_Consultar_Ant;
  end;

  fDMConsEstoque.mAuxEst_Acum.IndexFieldNames := 'Referencia;NomeProduto';
  SMDBGrid2.DataSource := fDMConsEstoque.dsmAuxEst_Acum;
end;

procedure TfrmConsEstoque_Mov.prc_Condicao(Saldo_Ant: Boolean = False);
begin
  vComando := '';
  if not ckInativo.Checked then
    vComando := vComando + ' AND PRO.INATIVO = ' + QuotedStr('N');
  if ceIDProduto.AsInteger > 0 then
    vComando := vComando + ' AND EM.ID_PRODUTO = ' + IntToStr(ceIDProduto.AsInteger)
  else
  if trim(edtRef.Text) <> '' then
    vComando := vComando + ' AND PRO.REFERENCIA LIKE ' + QuotedStr('%'+edtRef.Text+'%');
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND EM.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if (ceIDPessoa.AsInteger > 0) AND (RzPageControl1.ActivePage <> TS_Reserva) then
    vComando := vComando + ' AND EM.ID_PESSOA = ' + IntToStr(ceIDPessoa.AsInteger);
  if Trim(edtNome_Pessoa.Text) <> '' then
    vComando := vComando + ' AND PES.NOME LIKE (''%' + (edtNome_Pessoa.Text) + '%'')';
  if Saldo_Ant then
    vComando := vComando + ' AND EM.DTMOVIMENTO < ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
  else
  begin
    if (DateEdit1.Date > 10) and (RzPageControl1.ActivePage <> TS_Reserva) then
      vComando := vComando + ' AND EM.DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
    else
    if (DateEdit1.Date > 10) then
      vComando := vComando + ' AND EM.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
    if (DateEdit2.Date > 10) and (RzPageControl1.ActivePage <> TS_Reserva) then
      vComando := vComando + ' AND EM.DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date))
    else
    if (DateEdit2.Date > 10) then
      vComando := vComando + ' AND EM.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  end;
  case rgTipo.ItemIndex of
    0: vComando := vComando + ' AND PRO.TIPO_REG = ' + QuotedStr('P');
    1: vComando := vComando + ' AND PRO.TIPO_REG = ' + QuotedStr('M');
    2: vComando := vComando + ' AND PRO.TIPO_REG = ' + QuotedStr('C');
    3: vComando := vComando + ' AND PRO.TIPO_REG = ' + QuotedStr('S');
    4: vComando := vComando + ' AND PRO.TIPO_REG = ' + QuotedStr('I');
  end;
  case RadioGroup1.ItemIndex of
    0: vComando := vComando + ' AND EM.TIPO_ES = ' + QuotedStr('E');
    1: vComando := vComando + ' AND EM.TIPO_ES = ' + QuotedStr('S');
  end;
  if (rxdbLocalEstoque.Text <> '') and (RzPageControl1.ActivePage <> TS_Reserva) then
    vComando := vComando + ' AND EM.ID_LOCAL_ESTOQUE = ' + IntToStr(rxdbLocalEstoque.KeyValue);
  if (CurrencyEdit1.AsInteger > 0) and (RzPageControl1.ActivePage = TS_Reserva) then
    vComando := vComando + ' AND EM.NUM_ORDEM = ' + IntToStr(CurrencyEdit1.AsInteger);
  if vID_Cor_Loc > 0 then
    vComando := vComando + ' AND EM.ID_COR = ' + IntToStr(vID_Cor_Loc)
  else
  if ckSemCor.Checked then
    vComando := vComando + ' AND EM.ID_COR = 0 ';
  if (rxdbGrupo.Text <> '') and (ckEstrutura.Checked) then
  begin
    fDMConsEstoque.cdsGrupo.Locate('ID',rxdbGrupo.KeyValue,[loCaseInsensitive]);
    vComando := vComando + ' AND GR.CODIGO like ' + QuotedStr(fDMConsEstoque.cdsGrupoCODIGO.AsString+'%');
  end
  else
  if rxdbGrupo.Text <> '' then
    vComando := vComando + ' AND PRO.ID_GRUPO = ' + IntToStr(rxdbGrupo.KeyValue);
end;

procedure TfrmConsEstoque_Mov.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsEstoque.mAuxEst_Acum.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsEstoque_Mov.prc_Monta_Cab;
begin
  fDMConsEstoque.vDescOpcao_Rel := '';
  if RxDBLookupCombo1.Text <> '' then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Filial: ' + RxDBLookupCombo1.Text + ')';
  if ceIDPessoa.AsInteger > 0 then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Cli/Forn: ' + edtNome_Pessoa.Text + ')';
  if edtRef.Text <> '' then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Ref: ' + edtRef.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Per�odo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Dt.Inicial: ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Dt.Final: ' + DateEdit2.Text + ')';
  if (fDMConsEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S') and (rxdbLocalEstoque.Text <> '') then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Local: ' + rxdbLocalEstoque.Text + ')';
  if (RzPageControl1.ActivePage = TS_Produto_Det) and (ckImpPrecoCusto.Checked) then
    fDMConsEstoque.vDescOpcao_Rel := fDMConsEstoque.vDescOpcao_Rel + '(Usado Pre�o de Custo)';
end;

procedure TfrmConsEstoque_Mov.btnImprimirClick(Sender: TObject);
begin
  vTipo_Config_Email := 4;
  prc_Monta_Cab;
  if RzPageControl1.ActivePage = TS_Produto_Det then
    prc_Imprimir_Produto_Det
  else
  if RzPageControl1.ActivePage = TS_Produto_Acum then
    prc_Imprimir_Produto_Acum
  else
  if RzPageControl1.ActivePage = TS_Produto_Local then
    prc_Imprimir_Produto_Local;
end;

procedure TfrmConsEstoque_Mov.prc_Imprimir_Produto_Det;
var
  vArq: String;
begin
  if not(fDMConsEstoque.cdsEstoque_Mov.Active) then
  begin
    MessageDlg('*** Deve ser feita a consulta primeiro!', mtError, [mbOk], 0);
    exit;
  end;
  case ComboBox1.ItemIndex of
    0: fDMConsEstoque.cdsEstoque_Mov.IndexFieldNames := 'NOMEPRODUTO;TAMANHO;NOME_COR;DTMOVIMENTO;TIPO_ES;NOME_LOCAL;NOMEPESSOA;NUMNOTA';
    1: fDMConsEstoque.cdsEstoque_Mov.IndexFieldNames := 'NOMEPESSOA;NOMEPRODUTO;NOME_COR;TAMANHO;DTMOVIMENTO;TIPO_ES;NOME_LOCAL;NUMNOTA';
    3,4: fDMConsEstoque.mEstoque_CentroCusto.IndexFieldNames := 'Codigo_CentroCusto;Codigo_Grupo;Nome_Produto';
  end;
  if (ckEstruturado.Checked) and (ComboBox1.ItemIndex < 2) then
    fDMConsEstoque.cdsEstoque_Mov.IndexFieldNames := 'NOME_GRUPO;'+fDMConsEstoque.cdsEstoque_Mov.IndexFieldNames;
  SMDBGrid1.DisableScroll;
  if (ComboBox1.ItemIndex = 3) or (ComboBox1.ItemIndex = 4) then
  begin
    //20/05/2019
    prc_Le_cdsEstoque_Mov(True);
    if ComboBox1.ItemIndex = 4 then
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Estoque_CCusto2.fr3'
    else
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Estoque_CCusto.fr3';
    if FileExists(vArq) then
      fDMConsEstoque.frxReport1.Report.LoadFromFile(vArq)
    else
    begin
      ShowMessage('Relat�rio n�o localizado! ' + vArq);
      Exit;
    end;
    fDMConsEstoque.frxReport1.variables['Opcao_Imp'] := QuotedStr(fDMConsEstoque.vDescOpcao_Rel);
    fDMConsEstoque.frxReport1.ShowReport;
  end
  else
  if ComboBox1.ItemIndex = 2 then
  begin
    fRelEstoqueMov_Prod2                := TfRelEstoqueMov_Prod2.Create(Self);
    fRelEstoqueMov_Prod2.fDMConsEstoque := fDMConsEstoque;
    fRelEstoqueMov_Prod2.vImp_PrecoCusto := ckImpPrecoCusto.Checked;
    fRelEstoqueMov_Prod2.RLReport1.PreviewModal;
    fRelEstoqueMov_Prod2.RLReport1.Free;
    FreeAndNil(fRelEstoqueMov_Prod2);
  end
  else
  begin
    fRelEstoqueMov_Prod                := TfRelEstoqueMov_Prod.Create(Self);
    fRelEstoqueMov_Prod.vOrdenar       := ComboBox1.ItemIndex;
    fRelEstoqueMov_Prod.fDMConsEstoque := fDMConsEstoque;
    fRelEstoqueMov_Prod.vOpcao_Estruturado := ckEstruturado.Checked;
    fRelEstoqueMov_Prod.vImp_TotalEst      := ckImpTotalEst.Checked;
    fRelEstoqueMov_Prod.vImp_PrecoCusto    := ckImpPrecoCusto.Checked;
    fRelEstoqueMov_Prod.vDtInicial     := 0;
    if (ComboBox1.ItemIndex = 0) and (DateEdit1.Date > 10) then
      fRelEstoqueMov_Prod.vDtInicial := DateEdit1.Date;
    fRelEstoqueMov_Prod.RLReport1.PreviewModal;
    fRelEstoqueMov_Prod.RLReport1.Free;
    FreeAndNil(fRelEstoqueMov_Prod);
  end;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmConsEstoque_Mov.prc_Imprimir_Produto_Acum;
begin
  if not(fDMConsEstoque.cdsEstoque_Acum.Active) then
  begin
    MessageDlg('*** Deve ser feita a consulta primeiro!', mtError, [mbOk], 0);
    exit;
  end;
  SMDBGrid2.DisableScroll;
  fRelEstoqueMov_Acum                 := TfRelEstoqueMov_Acum.Create(Self);
  fRelEstoqueMov_Acum.fDMConsEstoque  := fDMConsEstoque;
  fRelEstoqueMov_Acum.vImp_PrecoCusto := ckImpPrecoCusto2.Checked;
  fRelEstoqueMov_Acum.RLReport1.PreviewModal;
  fRelEstoqueMov_Acum.RLReport1.Free;
  FreeAndNil(fRelEstoqueMov_Acum);
  SMDBGrid2.EnableScroll;
end;

procedure TfrmConsEstoque_Mov.rxdbGrupoKeyDowno(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if rxdbGrupo.Text <> '' then
      vID_Grupo_Pos := rxdbGrupo.KeyValue;
    frmSel_Grupo := TfrmSel_Grupo.Create(Self);
    frmSel_Grupo.ShowModal;
    if vID_Grupo_Pos > 0 then
    begin
      rxdbGrupo.KeyValue := vID_Grupo_Pos;
      rxdbGrupo.SetFocus;
    end;
  end;
end;

procedure TfrmConsEstoque_Mov.rxdbGrupoDropDown(Sender: TObject);
begin
  rxdbGrupo.LookupDisplay := 'NOME_AUX;CODIGO';
end;

procedure TfrmConsEstoque_Mov.ComboBox1Change(Sender: TObject);
begin
  ckEstruturado.Visible := (ComboBox1.ItemIndex < 2);
end;

procedure TfrmConsEstoque_Mov.ckEstruturadoClick(Sender: TObject);
begin
  ckImpTotalEst.Visible := ckEstruturado.Checked;
end;

procedure TfrmConsEstoque_Mov.prc_Consultar_Local;
var
  vComandoAux, vComandoAux2: String;
  i: Integer;
begin
  fDMConsEstoque.cdsEstoque_Local.Close;
  i := PosEx('GROUP',fDMConsEstoque.ctEstoque_Local,0);
  vComandoAux  := copy(fDMConsEstoque.ctEstoque_Local,i,Length(fDMConsEstoque.ctEstoque_Local) - i + 1);
  vComandoAux2 := copy(fDMConsEstoque.ctEstoque_Local,1,i-1);
  fDMConsEstoque.sdsEstoque_Local.CommandText := vComandoAux2 + ' WHERE 0 = 0 ' + vComando + vComandoAux;
  fDMConsEstoque.cdsEstoque_Local.Open;
end;

procedure TfrmConsEstoque_Mov.SMDBGrid3TitleClick(Column: TColumn);
var
  i: Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsEstoque.cdsEstoque_Local.IndexFieldNames := Column.FieldName;
  if (Column.FieldName = 'ID_PRODUTO') or (Column.FieldName = 'REFERENCIA') or (Column.FieldName = 'NOMEPRODUTO') then
    fDMConsEstoque.cdsEstoque_Local.IndexFieldNames := Column.FieldName + ';NOME_LOCAL';
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid3.Columns.Count - 1 do
    if not (SMDBGrid3.Columns.Items[I] = Column) then
      SMDBGrid3.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsEstoque_Mov.prc_Imprimir_Produto_Local;
var
  vArq: String;
begin
  if not(fDMConsEstoque.cdsEstoque_Local.Active) then
  begin
    MessageDlg('*** Deve ser feita a consulta primeiro!', mtError, [mbOk], 0);
    exit;
  end;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Estoque_Local.fr3';
  if FileExists(vArq) then
    fDMConsEstoque.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relat�rio n�o localizado! ' + vArq);
    Exit;
  end;
  if ckImpValor.Checked then
    fDMConsEstoque.frxReport1.variables['ImpValor'] := QuotedStr('S')
  else
    fDMConsEstoque.frxReport1.variables['ImpValor'] := QuotedStr('N');
  fDMConsEstoque.frxReport1.variables['ImpOpcao'] := QuotedStr(fDMConsEstoque.vDescOpcao_Rel);
  fDMConsEstoque.frxReport1.ShowReport;
end;

procedure TfrmConsEstoque_Mov.SMDBGrid4TitleClick(Column: TColumn);
var
  i: Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsEstoque.cdsEstoque_Mov_Res.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid4.Columns.Count - 1 do
    if not (SMDBGrid4.Columns.Items[I] = Column) then
      SMDBGrid4.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsEstoque_Mov.prc_Consultar_Reserva;
begin
  fDMConsEstoque.cdsEstoque_Mov_Res.Close;
  fDMConsEstoque.sdsEstoque_Mov_Res.CommandText := fDMConsEstoque.ctEstoque_Mov_Res + ' WHERE 0 = 0 ' + vComando;
  fDMConsEstoque.cdsEstoque_Mov_Res.Open;
  fDMConsEstoque.cdsEstoque_Mov_Res.IndexFieldNames := 'ID';
end;

procedure TfrmConsEstoque_Mov.prc_Le_cdsEstoque_Mov_Res;
var
  vQtdEntrada, vQtdSaida, vSaldo: Real;
begin
  vQtdEntrada := 0;
  vQtdSaida   := 0;

  SMDBGrid4.DisableScroll;
  fDMConsEstoque.cdsEstoque_Mov_Res.First;
  while not fDMConsEstoque.cdsEstoque_Mov_Res.Eof do
  begin
    if fDMConsEstoque.cdsEstoque_Mov_ResTIPO_ES.AsString = 'E' then
      vQtdEntrada := vQtdEntrada + fDMConsEstoque.cdsEstoque_Mov_ResQTD.AsFloat
    else
      vQtdSaida := vQtdSaida + fDMConsEstoque.cdsEstoque_Mov_ResQTD.AsFloat;
    fDMConsEstoque.cdsEstoque_Mov_Res.Next;
  end;
  vSaldo := vQtdEntrada - vQtdSaida;
  lblEntrada_Res.Caption := FormatFloat('###,###,##0.0000',vQtdEntrada);
  lblSaida_Res.Caption   := FormatFloat('###,###,##0.0000',vQtdSaida);
  lblSaldo_Res.Caption   := FormatFloat('###,###,##0.0000',vSaldo);
  SMDBGrid4.EnableScroll;
end;

procedure TfrmConsEstoque_Mov.RzPageControl1Change(Sender: TObject);
begin
  Label12.Visible       := (RzPageControl1.ActivePage = TS_Reserva);
  CurrencyEdit1.Visible := (RzPageControl1.ActivePage = TS_Reserva);
  if RzPageControl1.ActivePage = TS_Produto_Acum then
    CheckBox2Click(sender);
end;

procedure TfrmConsEstoque_Mov.btnInserir_ItensClick(Sender: TObject);
var
  ffrmCadEstoque_Mov_Res: TfrmCadEstoque_Mov_Res;
begin
  ffrmCadEstoque_Mov_Res := TfrmCadEstoque_Mov_Res.Create(self);
  ffrmCadEstoque_Mov_Res.vStatus := 'I';
  ffrmCadEstoque_Mov_Res.ShowModal;
  FreeAndNil(ffrmCadEstoque_Mov_Res);
end;

procedure TfrmConsEstoque_Mov.btnAlterar_ItensClick(Sender: TObject);
var
  ffrmCadEstoque_Mov_Res: TfrmCadEstoque_Mov_Res;
begin
  if not(fDMConsEstoque.cdsEstoque_Mov_Res.Active) and (fDMConsEstoque.cdsEstoque_Mov_Res.IsEmpty) then
    exit;
  if (fDMConsEstoque.cdsEstoque_Mov_ResTIPO_MOV.AsString <> 'NEC') and (fDMConsEstoque.cdsEstoque_Mov_ResTIPO_MOV.AsString <> 'MAN') then
  begin
    MessageDlg('*** Registro n�o pode ser alterado por este procedimento!', mtError, [mbOk], 0);
    exit;
  end;
    
  ffrmCadEstoque_Mov_Res := TfrmCadEstoque_Mov_Res.Create(self);
  ffrmCadEstoque_Mov_Res.vStatus := 'A';
  ffrmCadEstoque_Mov_Res.vID_MovEstoque_Res := fDMConsEstoque.cdsEstoque_Mov_ResID.AsInteger;
  ffrmCadEstoque_Mov_Res.ShowModal;
  FreeAndNil(ffrmCadEstoque_Mov_Res);
end;

procedure TfrmConsEstoque_Mov.btnExcluir_ItensClick(Sender: TObject);
var
  ffrmCadEstoque_Mov_Res: TfrmCadEstoque_Mov_Res;
begin
  if not(fDMConsEstoque.cdsEstoque_Mov_Res.Active) and (fDMConsEstoque.cdsEstoque_Mov_Res.IsEmpty) then
    exit;
  ffrmCadEstoque_Mov_Res := TfrmCadEstoque_Mov_Res.Create(self);
  ffrmCadEstoque_Mov_Res.vStatus := 'E';
  ffrmCadEstoque_Mov_Res.prc_Excluir(fDMConsEstoque.cdsEstoque_Mov_ResID.AsInteger);
  FreeAndNil(ffrmCadEstoque_Mov_Res);
  btnConsultarClick(Sender);
end;

procedure TfrmConsEstoque_Mov.SMDBGrid1DblClick(Sender: TObject);
var
  ffrmAltEstoque_Mov: TfrmAltEstoque_Mov;
  vIDAux: Integer;
begin
  if fDMConsEstoque.qParametros_UsuarioALT_ESTOQUE_MOV.AsString <> 'S' then
    exit;
  if not(fDMConsEstoque.cdsEstoque_Mov.Active) or (fDMConsEstoque.cdsEstoque_Mov.IsEmpty) then
    exit;

  vRefazer_Cons := False;
  vIDAux := fDMConsEstoque.cdsEstoque_MovID.AsInteger;  
  ffrmAltEstoque_Mov := TfrmAltEstoque_Mov.Create(self);
  ffrmAltEstoque_Mov.vID_Estoque_Mov_Local := fDMConsEstoque.cdsEstoque_MovID.AsInteger;
  ffrmAltEstoque_Mov.Label2.Caption := fDMConsEstoque.cdsEstoque_MovREFERENCIA.AsString;
  ffrmAltEstoque_Mov.Label4.Caption := fDMConsEstoque.cdsEstoque_MovNOMEPRODUTO.AsString;
  ffrmAltEstoque_Mov.Label6.Caption := fDMConsEstoque.cdsEstoque_MovNOME_LOCAL.AsString;
  ffrmAltEstoque_Mov.ShowModal;
  FreeAndNil(ffrmAltEstoque_Mov);

  if vRefazer_Cons then
    btnConsultarClick(Sender);
  if vIDAux > 0 then
    fDMConsEstoque.cdsEstoque_Mov.Locate('ID',vIDAux,[loCaseInsensitive]);
end;

procedure TfrmConsEstoque_Mov.CheckBox2Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to SMDBGrid2.ColCount - 2 do
  begin
    if (SMDBGrid2.Columns[i].FieldName = 'Qtd_Ant') then
      SMDBGrid2.Columns[i].Visible := CheckBox2.Checked;
  end;
  //14/09/2020  Verificar qual � essa funcionalidade do CheckBox3 ???
  //CheckBox3.Visible := CheckBox2.Checked;
end;

procedure TfrmConsEstoque_Mov.prc_Consultar_Ant;
var
  vComandoAux, vComandoAux2: String;
  i: Integer;
  vFilialAux: Integer;
begin
  fDMConsEstoque.cdsEstoque_Ant.Close;
  i := PosEx('GROUP',fDMConsEstoque.ctEstoque_Ant,0);
  vComandoAux  := copy(fDMConsEstoque.ctEstoque_Ant,i,Length(fDMConsEstoque.ctEstoque_Ant) - i + 1);
  vComandoAux2 := copy(fDMConsEstoque.ctEstoque_Ant,1,i-1);
  fDMConsEstoque.sdsEstoque_Ant.CommandText := vComandoAux2 + vComando + vComandoAux;
  fDMConsEstoque.cdsEstoque_Ant.Open;

  fDMConsEstoque.cdsEstoque_Ant.First;
  while not fDMConsEstoque.cdsEstoque_Ant.Eof do
  begin
    //14/09/2020  tirado pois estava dando diferen�a no c�lculo quando o saldo era negativo
    //if (StrToFloat(FormatFloat('0.00000',fDMConsEstoque.cdsEstoque_AntSALDO.AsFloat)) > 0) or (CheckBox3.Checked) then
    begin
      if fDMConsEstoque.mAuxEst_Acum.Locate('ID_Produto',fDMConsEstoque.cdsEstoque_AntID_PRODUTO.AsInteger,[loCaseInsensitive]) then
        fDMConsEstoque.mAuxEst_Acum.Edit
      else
      begin
        fDMConsEstoque.mAuxEst_Acum.Insert;
        fDMConsEstoque.mAuxEst_AcumID_Produto.AsInteger := fDMConsEstoque.cdsEstoque_AntID_PRODUTO.AsInteger;
        fDMConsEstoque.mAuxEst_AcumReferencia.AsString  := fDMConsEstoque.cdsEstoque_AntREFERENCIA.AsString;
        fDMConsEstoque.mAuxEst_AcumNomeProduto.AsString := fDMConsEstoque.cdsEstoque_AntNOMEPRODUTO.AsString;
        
        fDMConsEstoque.mAuxEst_AcumQtd_Ent.AsFloat      := StrToFloat(FormatFloat('0.00',0));
        fDMConsEstoque.mAuxEst_AcumQtd_Sai.AsFloat      := StrToFloat(FormatFloat('0.00',0));
        fDMConsEstoque.mAuxEst_AcumVlr_Entrada.AsFloat  := StrToFloat(FormatFloat('0.00',0));
        fDMConsEstoque.mAuxEst_AcumVlr_Saida.AsFloat    := StrToFloat(FormatFloat('0.00',0));
        fDMConsEstoque.mAuxEst_AcumSaldo_Periodo.AsFloat := StrToFloat(FormatFloat('0.00',0));
      end;
      fDMConsEstoque.mAuxEst_AcumQtd_Ant.AsFloat := StrToFloat(FormatFloat('0.000000',fDMConsEstoque.cdsEstoque_AntSALDO.AsFloat));
      fDMConsEstoque.mAuxEst_AcumSaldo.AsFloat   := StrToFloat(FormatFloat('0.000000',fDMConsEstoque.mAuxEst_AcumQtd_Ant.AsFloat + fDMConsEstoque.mAuxEst_AcumQtd_Ent.AsFloat - fDMConsEstoque.mAuxEst_AcumQtd_Sai.AsFloat));
      fDMConsEstoque.mAuxEst_Acum.Post;
    end;
    fDMConsEstoque.cdsEstoque_Ant.Next;
  end;
end;

procedure TfrmConsEstoque_Mov.btnExcelClick(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Produto_Det then
    prc_Excel_Det2
  else
  if RzPageControl1.ActivePage = TS_Produto_Acum then
    prc_Excel_Acum
  else
  if RzPageControl1.ActivePage = TS_Produto_Local then
    prc_Excel_Local
  else
  if RzPageControl1.ActivePage = TS_Reserva then
    prc_Excel_Mov_Res;
end;

procedure TfrmConsEstoque_Mov.prc_Excel_Det2;
  var linha, coluna: integer;
   planilha: variant;
   valorcampo: string;
  vTexto: String;
  ColunaP: Integer;
begin
  Screen.Cursor := crHourGlass;
  fDMConsEstoque.cdsEstoque_Mov.First;

  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do dbGrid para o Excel';
  planilha.visible := true;

  linha   := 2;
  ColunaP := 0;
  for coluna := 0 to SMDBGrid1.FieldCount - 1 do
  begin
    ColunaP    := ColunaP + 1;
    valorcampo := SMDBGrid1.Columns[coluna].FieldName;
    planilha.cells[Linha,colunaP] := valorcampo;
    planilha.cells[Linha,colunaP].font.bold := true; // Negrito
    planilha.cells[Linha,colunaP].Interior.Color := clRed;
    planilha.cells[Linha,colunaP].font.size := 11; // Tamanho da Fonte
    planilha.cells[Linha,colunaP].font.Color := clWhite;
  end;

  fDMConsEstoque.cdsEstoque_Mov.First;
  while not fDMConsEstoque.cdsEstoque_Mov.Eof do
  begin
    linha   := Linha + 1;
    ColunaP := 0;
    for coluna := 0 to SMDBGrid1.FieldCount - 1 do
    begin
      begin
        ColunaP := ColunaP + 1;
        vTexto  := fDMConsEstoque.cdsEstoque_Mov.FieldByName(SMDBGrid1.Columns[coluna].FieldName).AsString;

        if trim(vTexto) <> '' then
          valorcampo := fDMConsEstoque.cdsEstoque_Mov.FieldByName(SMDBGrid1.Columns[coluna].FieldName).Value
        else
          valorcampo := '';
        vTexto  := SMDBGrid1.Columns[coluna].FieldName;
        if (copy(vTexto,1,4) = 'VLR_') then
        begin
          if trim(valorcampo) = '' then valorcampo := '0';
            planilha.Cells[linha,colunaP].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,000##)';
          planilha.cells[linha,colunaP] := StrToFloat(valorCampo);
        end
        else
        begin
          vTexto := fDMConsEstoque.cdsEstoque_Mov.FieldByName(SMDBGrid1.Columns[coluna].FieldName).AsString;
          if trim(vTexto) <> '' then
            planilha.cells[linha,colunaP] := fDMConsEstoque.cdsEstoque_Mov.FieldByName(SMDBGrid1.Columns[coluna].FieldName).Value
          else
            planilha.cells[linha,colunaP] := '';
        end;
        planilha.cells[linha,colunaP].font.size := 11; // Tamanho da Fonte
      end;
    end;
    fDMConsEstoque.cdsEstoque_Mov.Next;
  end;
  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  Planilha.ActiveWorkBook.SaveAs(vTexto+ 'Estoque_Mov.XLS' );
  Screen.Cursor := crDefault;
end;

procedure TfrmConsEstoque_Mov.prc_Excel_Acum;
var
  linha, coluna: integer;
  planilha: variant;
  valorcampo: string;
  vTexto: String;
  ColunaP: Integer;
  DataSource: TDataSource;
  Tabela: TClientDataSet;
begin

  Screen.Cursor := crHourGlass;
  fDMConsEstoque.mAuxEst_Acum.First;

  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do dbGrid para o Excel';
  planilha.visible := true;

  linha   := 2;
  ColunaP := 0;
  for coluna := 0 to SMDBGrid2.FieldCount - 1 do
  begin
    ColunaP    := ColunaP + 1;
    valorcampo := SMDBGrid2.Columns[coluna].FieldName;
    planilha.cells[Linha,colunaP] := valorcampo;
    planilha.cells[Linha,colunaP].font.bold := true; // Negrito
    planilha.cells[Linha,colunaP].Interior.Color := clRed;
    planilha.cells[Linha,colunaP].font.size := 11; // Tamanho da Fonte
    planilha.cells[Linha,colunaP].font.Color := clWhite;
  end;

  fDMConsEstoque.mAuxEst_Acum.First;
  while not fDMConsEstoque.mAuxEst_Acum.Eof do
  begin
    linha   := Linha + 1;
    ColunaP := 0;
    for coluna := 0 to SMDBGrid2.FieldCount - 1 do
    begin
      begin
        ColunaP := ColunaP + 1;
        vTexto  := fDMConsEstoque.mAuxEst_Acum.FieldByName(SMDBGrid2.Columns[coluna].FieldName).AsString;
        if trim(vTexto) <> '' then
          valorcampo := fDMConsEstoque.mAuxEst_Acum.FieldByName(SMDBGrid2.Columns[coluna].FieldName).Value
        else
          valorcampo := '';
        vTexto  := SMDBGrid2.Columns[coluna].FieldName;
        if (copy(vTexto,1,4) = 'VLR_') then
        begin
          if trim(valorcampo) = '' then valorcampo := '0';
            planilha.Cells[linha,colunaP].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,000##)';
          planilha.cells[linha,colunaP] := StrToFloat(valorCampo);
        end
        else
        begin
          vTexto := fDMConsEstoque.mAuxEst_Acum.FieldByName(SMDBGrid2.Columns[coluna].FieldName).AsString;
          if trim(vTexto) <> '' then
            planilha.cells[linha,colunaP] := fDMConsEstoque.mAuxEst_Acum.FieldByName(SMDBGrid2.Columns[coluna].FieldName).Value
          else
            planilha.cells[linha,colunaP] := '';
        end;
        planilha.cells[linha,colunaP].font.size := 11; // Tamanho da Fonte
      end;
    end;
    fDMConsEstoque.mAuxEst_Acum.Next;
  end;
  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  Planilha.ActiveWorkBook.SaveAs(vTexto+ 'Estoque_Acum.XLS' );
  Screen.Cursor := crDefault;
end;

procedure TfrmConsEstoque_Mov.prc_Excel_Local;
  var linha, coluna: integer;
   planilha: variant;
   valorcampo: string;
  vTexto: String;
  ColunaP: Integer;
begin
  Screen.Cursor := crHourGlass;
  fDMConsEstoque.cdsEstoque_Local.First;

  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do dbGrid para o Excel';
  planilha.visible := true;

  linha   := 2;
  ColunaP := 0;
  for coluna := 0 to SMDBGrid3.FieldCount - 1 do
  begin
    ColunaP    := ColunaP + 1;
    valorcampo := SMDBGrid3.Columns[coluna].FieldName;
    planilha.cells[Linha,colunaP] := valorcampo;
    planilha.cells[Linha,colunaP].font.bold := true; // Negrito
    planilha.cells[Linha,colunaP].Interior.Color := clRed;
    planilha.cells[Linha,colunaP].font.size := 11; // Tamanho da Fonte
    planilha.cells[Linha,colunaP].font.Color := clWhite;
  end;

  fDMConsEstoque.cdsEstoque_Local.First;
  while not fDMConsEstoque.cdsEstoque_Local.Eof do
  begin
    linha   := Linha + 1;
    ColunaP := 0;
    for coluna := 0 to SMDBGrid3.FieldCount - 1 do
    begin
      begin
        ColunaP := ColunaP + 1;
        vTexto  := fDMConsEstoque.cdsEstoque_Local.FieldByName(SMDBGrid3.Columns[coluna].FieldName).AsString;
        if trim(vTexto) <> '' then
          valorcampo := fDMConsEstoque.cdsEstoque_Local.FieldByName(SMDBGrid3.Columns[coluna].FieldName).Value
        else
          valorcampo := '';
        vTexto  := SMDBGrid3.Columns[coluna].FieldName;
        if (copy(vTexto,1,4) = 'VLR_') then
        begin
          if trim(valorcampo) = '' then valorcampo := '0';
            planilha.Cells[linha,colunaP].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,000##)';
          planilha.cells[linha,colunaP] := StrToFloat(valorCampo);
        end
        else
        begin
          vTexto     := fDMConsEstoque.cdsEstoque_Local.FieldByName(SMDBGrid3.Columns[coluna].FieldName).AsString;
          if trim(vTexto) <> '' then
            planilha.cells[linha,colunaP] := fDMConsEstoque.cdsEstoque_Local.FieldByName(SMDBGrid3.Columns[coluna].FieldName).Value
          else
            planilha.cells[linha,colunaP] := '';
        end;
        planilha.cells[linha,colunaP].font.size := 11; // Tamanho da Fonte
      end;
    end;
    fDMConsEstoque.cdsEstoque_Local.Next;
  end;
  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  Planilha.ActiveWorkBook.SaveAs(vTexto+ 'Estoque_Local.XLS' );
  Screen.Cursor := crDefault;
end;

procedure TfrmConsEstoque_Mov.prc_Excel_Mov_Res;
var
  linha, coluna: integer;
  planilha: variant;
  valorcampo: string;
  vTexto: String;
  ColunaP: Integer;
begin
  Screen.Cursor := crHourGlass;
  fDMConsEstoque.cdsEstoque_Mov_Res.First;

  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do dbGrid para o Excel';
  planilha.visible := true;

  linha   := 2;
  ColunaP := 0;
  for coluna := 0 to SMDBGrid4.FieldCount - 1 do
  begin
    ColunaP    := ColunaP + 1;
    valorcampo := SMDBGrid4.Columns[coluna].FieldName;
    planilha.cells[Linha,colunaP] := valorcampo;
    planilha.cells[Linha,colunaP].font.bold := true; // Negrito
    planilha.cells[Linha,colunaP].Interior.Color := clRed;
    planilha.cells[Linha,colunaP].font.size := 11; // Tamanho da Fonte
    planilha.cells[Linha,colunaP].font.Color := clWhite;
  end;

  fDMConsEstoque.cdsEstoque_Mov_Res.First;
  while not fDMConsEstoque.cdsEstoque_Mov_Res.Eof do
  begin
    linha   := Linha + 1;
    ColunaP := 0;
    for coluna := 0 to SMDBGrid4.FieldCount - 1 do
    begin
      begin
        ColunaP := ColunaP + 1;
        vTexto  := fDMConsEstoque.cdsEstoque_Mov_Res.FieldByName(SMDBGrid4.Columns[coluna].FieldName).AsString;
        if trim(vTexto) <> '' then
          valorcampo := fDMConsEstoque.cdsEstoque_Mov_Res.FieldByName(SMDBGrid4.Columns[coluna].FieldName).Value
        else
          valorcampo := '';
        vTexto := SMDBGrid4.Columns[coluna].FieldName;
        if (copy(vTexto,1,4) = 'VLR_') then
        begin
          if trim(valorcampo) = '' then valorcampo := '0';
            planilha.Cells[linha,colunaP].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,000##)';
          planilha.cells[linha,colunaP] := StrToFloat(valorCampo);
        end
        else
        begin
          vTexto := fDMConsEstoque.cdsEstoque_Mov_Res.FieldByName(SMDBGrid4.Columns[coluna].FieldName).AsString;
          if trim(vTexto) <> '' then
            planilha.cells[linha,colunaP] := fDMConsEstoque.cdsEstoque_Mov_Res.FieldByName(SMDBGrid4.Columns[coluna].FieldName).Value
          else
            planilha.cells[linha,colunaP] := '';
        end;
        planilha.cells[linha,colunaP].font.size := 11; // Tamanho da Fonte
      end;
    end;
    fDMConsEstoque.cdsEstoque_Mov_Res.Next;
  end;
  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  Planilha.ActiveWorkBook.SaveAs(vTexto+ 'Estoque_Mov_Res.XLS' );
  Screen.Cursor := crDefault;
end;

procedure TfrmConsEstoque_Mov.edtRefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_Sel_Produto('R');
end;

procedure TfrmConsEstoque_Mov.ceIDProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_Sel_Produto('P');
end;

procedure TfrmConsEstoque_Mov.prc_Chamar_Sel_Produto(Tipo: String);
begin
  vCodProduto_Pos := 0;
  frmSel_Produto := TfrmSel_Produto.Create(Self);
  frmSel_Produto.ShowModal;
  FreeAndNil(frmSel_Produto);
  if vCodProduto_Pos > 0 then
  begin
    edtRef.Text := vReferencia_Pos;
    ceIDProduto.AsInteger := vCodProduto_Pos;
    if Tipo = 'R' then
      edtRef.SetFocus
    else
      ceIDProduto.SetFocus;
  end;
end;

procedure TfrmConsEstoque_Mov.ceIDPessoaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_Sel_Pessoa('C');
end;

procedure TfrmConsEstoque_Mov.ceIDPessoaExit(Sender: TObject);
begin
  if ceIDPessoa.AsInteger > 0 then
  begin
    fDMConsEstoque.prc_Posiciona_Pesssoa(ceIDPessoa.AsInteger);
    edtNome_Pessoa.Text := fDMConsEstoque.qPessoaNOME.AsString;
    if fDMConsEstoque.qPessoa.IsEmpty then
    begin
      ShowMessage('C�digo n�o encontrado!');
      ceIDPessoa.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmConsEstoque_Mov.prc_Chamar_Sel_Pessoa(Tipo: String);
begin
  frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
  if Tipo = 'N' then
    frmSel_Pessoa.Edit1.Text := edtNome_Pessoa.Text;
  frmSel_Pessoa.ShowModal;
  FreeAndNil(frmSel_Pessoa);
  if vCodPessoa_Pos > 0 then
  begin
    ceIDPessoa.AsInteger := vCodPessoa_Pos;
    fDMConsEstoque.prc_Posiciona_Pesssoa(ceIDPessoa.AsInteger);
    edtNome_Pessoa.Text := fDMConsEstoque.qPessoaNOME.AsString;
//    ceIDPessoa.SetFocus;
  end;
end;

procedure TfrmConsEstoque_Mov.edtNome_PessoaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
    prc_Chamar_Sel_Pessoa('N');
end;

procedure TfrmConsEstoque_Mov.edtRefExit(Sender: TObject);
begin
  if trim(edtRef.Text) <> '' then
  begin
    //30/11/2017  Foi colocado para limpar, pois vai usar o Like na refer�ncia
    ceIDProduto.Clear;
    //fDMConsEstoque.prc_Posiciona_Produto(ceIDProduto.AsInteger,edtRef.Text);
    //if (fDMConsEstoque.qProduto.Active) then
    //  ceIDProduto.AsInteger := fDMConsEstoque.qProdutoID.AsInteger;
  end;
end;

procedure TfrmConsEstoque_Mov.ceIDProdutoExit(Sender: TObject);
begin
  if ceIDProduto.AsInteger > 0 then
  begin
    //30/11/2017  Foi colocado para limpar
    edtRef.Clear;
    //fDMConsEstoque.prc_Posiciona_Produto(ceIDProduto.AsInteger,'');
    //if (fDMConsEstoque.qProduto.Active) then
    //  edtRef.Text := fDMConsEstoque.qProdutoREFERENCIA.AsString;
  end;
end;

procedure TfrmConsEstoque_Mov.edtNome_PessoaExit(Sender: TObject);
begin
  if (ceIDPessoa.AsInteger > 0) and (Trim(edtNome_Pessoa.Text) <> '') then
    ceIDPessoa.AsInteger := 0;
end;

procedure TfrmConsEstoque_Mov.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMConsEstoque.cdsEstoque_MovTIPO_ES.AsString = 'E' then
    AFont.Color := clMaroon
  else
    AFont.Color := clBlue;
end;

procedure TfrmConsEstoque_Mov.NxButton1Click(Sender: TObject);
begin
  prc_Le_cdsEstoque_Mov(False);
end;

procedure TfrmConsEstoque_Mov.NxButton2Click(Sender: TObject);
begin
  prc_Le_cdsEstoque_Mov_Res;
end;

procedure TfrmConsEstoque_Mov.rxdbGrupoChange(Sender: TObject);
begin
  ckEstrutura.Visible := (rxdbGrupo.Text <> '');
end;

procedure TfrmConsEstoque_Mov.ckImpPrecoCusto2Click(Sender: TObject);
var
  i: Integer;
  vCusto: String;
begin
  if ckImpPrecoCusto2.Checked then
    vCusto := '_Custo'
  else
    vCusto := '';
  for i := 1 to SMDBGrid2.ColCount - 2 do
  begin
    if (SMDBGrid2.Columns[i].FieldName = 'Vlr_Entrada' ) then
      SMDBGrid2.Columns[i].Visible := not(ckImpPrecoCusto2.Checked)
    else
    if (SMDBGrid2.Columns[i].FieldName = 'Vlr_Entrada_Custo' ) then
      SMDBGrid2.Columns[i].Visible := (ckImpPrecoCusto2.Checked)
    else
    if (SMDBGrid2.Columns[i].FieldName = 'Vlr_Saida' ) then
      SMDBGrid2.Columns[i].Visible := not(ckImpPrecoCusto2.Checked)
    else
    if (SMDBGrid2.Columns[i].FieldName = 'Vlr_Saida_Custo' ) then
      SMDBGrid2.Columns[i].Visible := (ckImpPrecoCusto2.Checked)
  end;

end;

end.
