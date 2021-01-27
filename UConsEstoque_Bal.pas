unit UConsEstoque_Bal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, Mask,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, UDMConsEstoque, RxLookup, UCBase, NxCollection, ToolEdit, DBFilter,
  RzTabs, CurrEdit, UDMEstoque, RzLstBox, RzChkLst, Menus, ComObj;

type
  TfrmConsEstoque_Bal = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RadioGroup1: TRadioGroup;
    btnConsultar: TNxButton;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    btnImprimir_Est: TNxButton;
    StaticText1: TStaticText;
    RzPageControl1: TRzPageControl;
    TS_Balanco: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    TS_Verificar: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    Panel2: TPanel;
    btnVerificar: TNxButton;
    Shape1: TShape;
    Label3: TLabel;
    Panel3: TPanel;
    Shape2: TShape;
    Label4: TLabel;
    NxButton1: TNxButton;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    ComboBox1: TComboBox;
    Label6: TLabel;
    btnTipoCadastro: TNxButton;
    btnTipoSped: TNxButton;
    RadioGroup2: TRadioGroup;
    btnImpGrade: TNxButton;
    ckImpressora: TCheckBox;
    btnExcel: TNxButton;
    PopupMenu1: TPopupMenu;
    Excel1: TMenuItem;
    CSV1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimir_EstClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnVerificarClick(Sender: TObject);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure SMDBGrid2DblClick(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure NxButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTipoCadastroClick(Sender: TObject);
    procedure btnTipoSpedClick(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure btnImpGradeClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure CSV1Click(Sender: TObject);
  private
    { Private declarations }
    fDMConsEstoque: TDMConsEstoque;
    fDMEstoque: TDMEstoque;
    ColunaOrdenada: String;

    procedure prc_Consultar;
    procedure prc_Gravar_Estoque;
    procedure prc_CriaExcel(vDados: TDataSource);

  public
    { Public declarations }
  end;

var
  frmConsEstoque_Bal: TfrmConsEstoque_Bal;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, URelEstoque_Bal, UConsEstoque_Bal_Det, USel_Balanco,
  UInformeEndereco, DateUtils;

{$R *.dfm}

procedure TfrmConsEstoque_Bal.prc_Consultar;
var
  vQtdAux: Integer;
  vCampo: String;
begin
  vQtdAux := 0;

  fDMConsEstoque.cdsBalanco.Close;
  fDMConsEstoque.sdsBalanco.CommandText := fDMConsEstoque.ctBalanco;
  case ComboBox1.ItemIndex of
    0 : vCampo := 'PRO.TIPO_REG';
    1 : vCampo := 'PRO.SPED_TIPO_ITEM'
  end;

  fDMConsEstoque.sdsBalanco.CommandText := fDMConsEstoque.sdsBalanco.CommandText + ' ' +
                                           ' WHERE EM.FILIAL = :FILIAL ' +
                                           ' AND EM.DTMOVIMENTO <= :DTMOVIMENTO ' +
                                           ' AND ' + vCampo + ' IN (' + vSelPesquisa + ') ' +
                                           ' AND PRO.INATIVO = ''N'' ' +
                                           ' AND PRO.ESTOQUE = ''S'' ' +
                                           ' GROUP BY EM.ID_PRODUTO, EM.TAMANHO, PRO.REFERENCIA, PRO.NOME, PRO.UNIDADE, ' +
                                           'EM.id_cor, COMB.NOME, PRO.sped_tipo_item, PRO.PERC_IPI, PRO.TIPO_REG, NCM.NCM';

  fDMConsEstoque.sdsBalanco.ParamByName('FILIAL').AsInteger   := RxDBLookupCombo1.KeyValue;
  fDMConsEstoque.sdsBalanco.ParamByName('DTMOVIMENTO').AsDate := DateEdit1.Date;
  fDMConsEstoque.cdsBalanco.IndexFieldNames := 'NOME_PRODUTO;NOME_COMBINACAO;TAMANHO';

  fDMConsEstoque.cdsBalanco.Open;

{  if ComboBox1.ItemIndex = 0 then
  begin
    case ComboBox2.ItemIndex of
      0: begin
           fDMConsEstoque.sdsBalanco.ParamByName('TIPO_REG').AsString  := 'P';
           fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '-';
         end;
      1: begin
           fDMConsEstoque.sdsBalanco.ParamByName('TIPO_REG').AsString  := 'M';
           fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '-';
         end;
      2: begin
           fDMConsEstoque.sdsBalanco.ParamByName('TIPO_REG').AsString  := 'C';
           fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '-';
         end;
      3: begin
           fDMConsEstoque.sdsBalanco.ParamByName('TIPO_REG').AsString  := 'S';
           fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '-';
         end;
    end;
  end
  else
  begin
    case ComboBox3.ItemIndex of
      0: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '00';
      1: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '01';
      2: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '02';
      3: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '03';
      4: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '04';
      5: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '05';
      6: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '06';
      7: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '07';
      8: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '08';
      9: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '10';
     10: fDMConsEstoque.sdsBalanco.ParamByName('SPED_TIPO_ITEM').AsString := '99';
    end;
    fDMConsEstoque.sdsBalanco.ParamByName('TIPO_REG').AsString := '-';
  end;
  fDMConsEstoque.sdsBalanco.ParamByName('FILIAL').AsInteger   := RxDBLookupCombo1.KeyValue;
  fDMConsEstoque.sdsBalanco.ParamByName('DTMOVIMENTO').AsDate := DateEdit1.Date;
  fDMConsEstoque.cdsBalanco.IndexFieldNames := 'NOME_PRODUTO;NOME_COMBINACAO;TAMANHO';
  fDMConsEstoque.cdsBalanco.Open;}
end;

procedure TfrmConsEstoque_Bal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMConsEstoque.qParametros_EstGRAVAR_ESTMOV_BAL.AsString = 'S' then
    FreeAndNil(fDMEstoque);
  Action := Cafree;
end;

procedure TfrmConsEstoque_Bal.FormShow(Sender: TObject);
begin
  fDMConsEstoque := TDMConsEstoque.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsEstoque);
  vSelPesquisa := '';
  ComboBox2Exit(Sender);
  fDMConsEstoque.cdsFilial.First;
  if (fDMConsEstoque.cdsFilial.RecordCount < 2) and (fDMConsEstoque.cdsFilialID.AsInteger > 0) then
    RxDBLookupCombo1.KeyValue := fDMConsEstoque.cdsFilialID.AsInteger;
  StaticText1.Caption := 'Duplo clique para mostrar o movimento do estoque do produto selecionado';
  if fDMConsEstoque.qParametros_EstGRAVAR_ESTMOV_BAL.AsString = 'S' then
  begin
    fDMEstoque := TDMEstoque.Create(Self);
    StaticText1.Caption := StaticText1.Caption + '    F5= Gravar Estoque Mov';
  end;
end;

procedure TfrmConsEstoque_Bal.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsEstoque.cdsBalanco.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsEstoque_Bal.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmConsEstoque_Bal.RxDBLookupCombo2Enter(Sender: TObject);
begin
  fDMConsEstoque.cdsMarca.IndexFieldNames := 'NOME';
end;

procedure TfrmConsEstoque_Bal.RxDBLookupCombo3Enter(Sender: TObject);
begin
  fDMConsEstoque.cdsGrupo.IndexFieldNames := 'NOME';
end;

procedure TfrmConsEstoque_Bal.RxDBLookupCombo4Enter(Sender: TObject);
begin
  fDMConsEstoque.cdsSubGrupo.IndexFieldNames := 'NOME';
end;

procedure TfrmConsEstoque_Bal.btnConsultarClick(Sender: TObject);
begin
  fDMConsEstoque.cdsBalanco.Filtered := False;
  if trim(RxDBLookupCombo1.Text) = '' then
  begin
    MessageDlg('*** Filial n�o informada!', mtError, [mbOk], 0);
    RxDBLookupCombo1.SetFocus;
    exit;
  end;
  if trim(vSelPesquisa) = '' then
  begin
    MessageDlg('*** N�o foi escolhido nenhum tipo!', mtError, [mbOk], 0);
    exit;
  end;

  if DateEdit1.Date <= 10 then
  begin
    MessageDlg('*** Data Refer�ncia n�o informada!', mtError, [mbOk], 0);
    DateEdit1.SetFocus;
    exit;
  end;
  prc_Consultar;

  fDMConsEstoque.cdsBalanco.Filter   := '';
  if RadioGroup2.ItemIndex = 0 then
  begin
    fDMConsEstoque.cdsBalanco.Filter   := 'QTD_ESTOQUE > '''+'0'+'''';
    fDMConsEstoque.cdsBalanco.Filtered := True;
  end;
end;

procedure TfrmConsEstoque_Bal.btnImprimir_EstClick(Sender: TObject);
var
  vArq: String;
begin
  SMDBGrid1.DisableScroll;
  vTipo_Config_Email := 4;
  fDMConsEstoque.cdsFilial.Locate('ID',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
  if ComboBox1.ItemIndex = 0 then
  begin
    case RadioGroup1.ItemIndex of
      0: fDMConsEstoque.cdsBalanco.IndexFieldNames := 'DESC_TIPO_REG;REFERENCIA;NOME_COMBINACAO;TAMANHO';
      1: fDMConsEstoque.cdsBalanco.IndexFieldNames := 'DESC_TIPO_REG;NOME_PRODUTO;NOME_COMBINACAO;TAMANHO';
    end;
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Balanco2.fr3';
  end
  else
  begin
    case RadioGroup1.ItemIndex of
      0: fDMConsEstoque.cdsBalanco.IndexFieldNames := 'TIPO_SPED;REFERENCIA;NOME_COMBINACAO;TAMANHO';
      1: fDMConsEstoque.cdsBalanco.IndexFieldNames := 'TIPO_SPED;NOME_PRODUTO;NOME_COMBINACAO;TAMANHO';
    end;
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Balanco.fr3';
  end;

  if (ckImpressora.Checked) and (FileExists(vArq)) then
  begin
    fDMConsEstoque.frxReport1.Report.LoadFromFile(vArq);
    fDMConsEstoque.cdsBalanco.First;
    fDMConsEstoque.frxReport1.variables['Empresa'] := QuotedStr(fDMConsEstoque.cdsFilialNOME.AsString);
    fDMConsEstoque.frxReport1.variables['DataReferencia'] := QuotedStr(FormatDateTime('DD/MM/YYYY',DateEdit1.date));
    fDMConsEstoque.frxReport1.ShowReport;
  end
  else
  begin
    fRelEstoque_Bal := TfRelEstoque_Bal.Create(Self);
    try
      fRelEstoque_Bal.fDMConsEstoque := fDMConsEstoque;
      fRelEstoque_Bal.vDataRef       := DateEdit1.Date;
      fRelEstoque_Bal.vNumPagIni     := CurrencyEdit1.AsInteger;
      fRelEstoque_Bal.RLReport1.PreviewModal;
      fRelEstoque_Bal.RLReport1.Free;
    finally
      FreeAndNil(fRelEstoque_Bal);
    end;
  end;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmConsEstoque_Bal.SMDBGrid1DblClick(Sender: TObject);
var
  ffrmConsEstoque_Bal_Det: TfrmConsEstoque_Bal_Det;
begin
  if not(fDMConsEstoque.cdsBalanco.Active) or (fDMConsEstoque.cdsBalancoID_PRODUTO.AsInteger <= 0) then
    exit;
  fDMConsEstoque.cdsEstoque_Mov.Close;
  fDMConsEstoque.sdsEstoque_Mov.CommandText := fDMConsEstoque.ctEstoque_Mov
                                             + '  AND EM.ID_PRODUTO = ' + IntToStr(fDMConsEstoque.cdsBalancoID_PRODUTO.AsInteger)
                                             + '  AND EM.DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if fDMConsEstoque.cdsBalancoID_COR.AsInteger > 0 then
    fDMConsEstoque.sdsEstoque_Mov.CommandText := fDMConsEstoque.sdsEstoque_Mov.CommandText + '   AND EM.ID_COR = ' + IntToStr(fDMConsEstoque.cdsBalancoID_COR.AsInteger);
  fDMConsEstoque.cdsEstoque_Mov.Open;

  ffrmConsEstoque_Bal_Det := TfrmConsEstoque_Bal_Det.Create(self);
  ffrmConsEstoque_Bal_Det.fDMConsEstoque := fDMConsEstoque;
  ffrmConsEstoque_Bal_Det.ShowModal;
  FreeAndNil(ffrmConsEstoque_Bal_Det);
end;

procedure TfrmConsEstoque_Bal.btnVerificarClick(Sender: TObject);
var
  sds: TSQLDataSet;
  vAux : Real;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;

    SMDBGrid1.DisableScroll;
    fDMConsEstoque.cdsBalanco.First;
    while not fDMConsEstoque.cdsBalanco.Eof do
    begin
      sds.Close;
      sds.CommandText := 'SELECT M.id_produto, M.dtmovimento, M.vlr_unitario, P.referencia, P.nome NOME_PRODUTO, P.UNIDADE UNIDADE_PROD, M.UNIDADE UNIDADE_EST '
                       + ' FROM ESTOQUE_MOV M '
                       + ' INNER JOIN PRODUTO P '
                       + ' ON M.id_produto = P.id '
                       + ' WHERE M.DTMOVIMENTO <= :DTMOVIMENTO '
                       + ' AND M.tipo_es = ' + QuotedStr('E')
                       + ' AND M.gerar_custo = ' + QuotedStr('S')
                       + ' AND M.ID_PRODUTO = :ID_PRODUTO ';
      sds.ParamByName('ID_PRODUTO').AsInteger := fDMConsEstoque.cdsBalancoID_PRODUTO.AsInteger;
      sds.ParamByName('DTMOVIMENTO').AsDate   := DateEdit1.Date;
      sds.Open;
      while not sds.Eof do
      begin
        if not fDMConsEstoque.mBalanco_Ver.Locate('ID_PRODUTO',sds.FieldByName('ID_Produto').AsInteger,[loCaseInsensitive]) then
        begin
          fDMConsEstoque.mBalanco_Ver.Insert;
          fDMConsEstoque.mBalanco_VerID_Produto.AsInteger := sds.FieldByName('ID_Produto').AsInteger;
          fDMConsEstoque.mBalanco_VerPreco_Menor.AsFloat  := StrToFloat(FormatFloat('0.000000',sds.FieldByName('Vlr_Unitario').AsFloat));
          fDMConsEstoque.mBalanco_VerPreco_Maior.AsFloat  := StrToFloat(FormatFloat('0.000000',sds.FieldByName('Vlr_Unitario').AsFloat));
          fDMConsEstoque.mBalanco_VerDtPreco_Menor.AsDateTime := sds.FieldByName('DtMovimento').AsDateTime;
          fDMConsEstoque.mBalanco_VerDtPreco_Maior.AsDateTime := sds.FieldByName('DtMovimento').AsDateTime;
          fDMConsEstoque.mBalanco_VerPerc_Diferenca.AsFloat   := 0;
          fDMConsEstoque.mBalanco_VerReferencia.AsString      := sds.FieldByName('Referencia').AsString;
          fDMConsEstoque.mBalanco_VerNome_Produto.AsString    := sds.FieldByName('Nome_Produto').AsString;
          fDMConsEstoque.mBalanco_VerUnidade.AsString         := sds.FieldByName('UNIDADE_PROD').AsString;
          if trim(fDMConsEstoque.mBalanco_VerUnidade.AsString) <> trim(sds.FieldByName('UNIDADE_EST').AsString) then
            fDMConsEstoque.mBalanco_VerPossui_Unid_dif.AsString := 'S'
          else
            fDMConsEstoque.mBalanco_VerPossui_Unid_dif.AsString := 'N';
          fDMConsEstoque.mBalanco_Ver.Post;
        end
        else
        begin
          fDMConsEstoque.mBalanco_Ver.Edit;
          if StrToFloat(FormatFloat('0.000000',fDMConsEstoque.mBalanco_VerPreco_Menor.AsFloat)) > StrToFloat(FormatFloat('0.000000',sds.FieldByName('VLR_UNITARIO').AsFloat)) then
          begin
            fDMConsEstoque.mBalanco_VerPreco_Menor.AsFloat := StrToFloat(FormatFloat('0.000000',sds.FieldByName('VLR_UNITARIO').AsFloat));
            fDMConsEstoque.mBalanco_VerDtPreco_Menor.AsDateTime := sds.FieldByName('DTMOVIMENTO').AsDateTime;
          end;
          if StrToFloat(FormatFloat('0.000000',fDMConsEstoque.mBalanco_VerPreco_Maior.AsFloat)) < StrToFloat(FormatFloat('0.000000',sds.FieldByName('VLR_UNITARIO').AsFloat)) then
          begin
            fDMConsEstoque.mBalanco_VerPreco_Maior.AsFloat := StrToFloat(FormatFloat('0.000000',sds.FieldByName('VLR_UNITARIO').AsFloat));
            fDMConsEstoque.mBalanco_VerDtPreco_Maior.AsDateTime := sds.FieldByName('DTMOVIMENTO').AsDateTime;
          end;
          if StrToFloat(FormatFloat('0.000000',fDMConsEstoque.mBalanco_VerPreco_Menor.AsFloat)) <> StrToFloat(FormatFloat('0.000000',fDMConsEstoque.mBalanco_VerPreco_Maior.AsFloat)) then
          begin
            vAux := StrToFloat(FormatFloat('0.0000',(fDMConsEstoque.mBalanco_VerPreco_Menor.AsFloat / fDMConsEstoque.mBalanco_VerPreco_Maior.AsFloat) * 100));
            vAux := StrToFloat(FormatFloat('0.0000',100 - vAux));
            fDMConsEstoque.mBalanco_VerPerc_Diferenca.AsFloat := StrToFloat(FormatFloat('0.0000',vAux));
          end;
          if trim(fDMConsEstoque.mBalanco_VerUnidade.AsString) <> trim(sds.FieldByName('UNIDADE_EST').AsString) then
            fDMConsEstoque.mBalanco_VerPossui_Unid_dif.AsString := 'S'
          else
            fDMConsEstoque.mBalanco_VerPossui_Unid_dif.AsString := 'N';
          fDMConsEstoque.mBalanco_Ver.Post;
        end;
        sds.Next;
      end;

      fDMConsEstoque.cdsBalanco.Next;
    end;
  except
  on e: Exception do
    begin
      FreeAndNil(sds);
      raise Exception.Create('Erro ao gravar o mBalanco_Ver : ' + #13 + e.Message);
    end;
  end;
  SMDBGrid1.EnableScroll;
end;


procedure TfrmConsEstoque_Bal.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
begin           
  ColunaOrdenada := Column.FieldName;
  fDMConsEstoque.mBalanco_Ver.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsEstoque_Bal.SMDBGrid2DblClick(Sender: TObject);
var
  ffrmConsEstoque_Bal_Det: TfrmConsEstoque_Bal_Det;
begin
  if (fDMConsEstoque.mBalanco_Ver.IsEmpty) or (fDMConsEstoque.mBalanco_VerID_Produto.AsInteger <= 0) then
    exit;

  fDMConsEstoque.cdsBalanco.Locate('ID_PRODUTO',fDMConsEstoque.mBalanco_VerID_Produto.AsInteger,[loCaseInsensitive]);

  fDMConsEstoque.cdsEstoque_Mov.Close;
  fDMConsEstoque.sdsEstoque_Mov.CommandText := fDMConsEstoque.ctEstoque_Mov
                                             + ' WHERE EM.ID_PRODUTO = ' + IntToStr(fDMConsEstoque.mBalanco_VerID_Produto.AsInteger)
                                             + '   AND EM.DTMOVIMENTO < ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  fDMConsEstoque.cdsEstoque_Mov.Open;

  ffrmConsEstoque_Bal_Det := TfrmConsEstoque_Bal_Det.Create(self);
  ffrmConsEstoque_Bal_Det.fDMConsEstoque := fDMConsEstoque;
  ffrmConsEstoque_Bal_Det.vMostrar       := CheckBox1.Checked;
  ffrmConsEstoque_Bal_Det.ShowModal;
  FreeAndNil(ffrmConsEstoque_Bal_Det);
end;

procedure TfrmConsEstoque_Bal.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMConsEstoque.mBalanco_VerPossui_Unid_dif.AsString = 'S' then
  begin
    Background  := clYellow;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmConsEstoque_Bal.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (fDMConsEstoque.cdsBalancoclPreco_Medio.AsFloat <= 0) then
  begin
    Background  := clYellow;
    AFont.Color := clBlack;
  end;

end;

procedure TfrmConsEstoque_Bal.NxButton1Click(Sender: TObject);
var
  vArq : String;
begin
  SMDBGrid2.DisableScroll;
  fDMConsEstoque.mBalanco_Ver.First;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Balanco_Verificacao.fr3';
  if FileExists(vArq) then
    fDMConsEstoque.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relat�rio n�o localizado: ' + vArq);
    Exit;
  end;
  SMDBGrid2.EnableScroll;
  fDMConsEstoque.frxReport1.ShowReport;
end;

procedure TfrmConsEstoque_Bal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
    CheckBox1.Visible    := not(CheckBox1.Visible);
    ckImpressora.Visible := not(ckImpressora.Visible);
  end;
end;

procedure TfrmConsEstoque_Bal.ComboBox1Change(Sender: TObject);
begin
  btnTipoCadastro.Enabled := (ComboBox1.ItemIndex = 0);
  btnTipoSped.Enabled     := (ComboBox1.ItemIndex = 1);
end;

procedure TfrmConsEstoque_Bal.ComboBox2Exit(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'TAMANHO') then
      SMDBGrid1.Columns[i].Visible := (fDMConsEstoque.qParametrosUSA_GRADE.AsString = 'S');
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_COR') then
      SMDBGrid1.Columns[i].Visible := ((fDMConsEstoque.qParametrosINFORMAR_COR_MATERIAL.AsString = 'S') or
                                      (fDMConsEstoque.qParametrosINFORMAR_COR_PROD.AsString = 'C'));
  end;
end;

procedure TfrmConsEstoque_Bal.SMDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F5) and (fDMConsEstoque.qParametros_EstGRAVAR_ESTMOV_BAL.AsString = 'S')  then
    prc_Gravar_Estoque;
end;

procedure TfrmConsEstoque_Bal.prc_Gravar_Estoque;
var
  vID_Estoque : Integer;
  sds: TSQLDataSet;
  vID_Cor : Integer;
  vTamamho : String;
  vQtd : Real;
  vTipo_ES : String;
begin
  if not(fDMConsEstoque.cdsBalanco.Active) or (fDMConsEstoque.cdsBalancoID_PRODUTO.AsInteger <= 0) then
    exit;

  vID_Cor  := fDMConsEstoque.cdsBalancoID_COR.AsInteger;
  vTamamho := fDMConsEstoque.cdsBalancoTAMANHO.AsString;
  if fDMConsEstoque.cdsBalancoID_COR.AsInteger <= 0 then
    vID_Cor := 0;
  if trim(fDMConsEstoque.cdsBalancoTAMANHO.AsString) = '' then
    vTamamho := '';

  vQtd := StrToFloat(FormatFloat('0.0000',0));

  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;

    sds.Close;
    sds.CommandText := 'SELECT SUM(M.QTD2) QTD'
                     + ' FROM ESTOQUE_MOV M '
                     + ' WHERE M.DTMOVIMENTO <= :DTMOVIMENTO '
                     + ' AND M.ID_PRODUTO = :ID_PRODUTO '
                     + ' AND M.TAMANHO = :TAMANHO '
                     + ' AND M.ID_COR = :ID_COR '
                     + ' AND M.FILIAL = :FILIAL ';
    sds.ParamByName('ID_PRODUTO').AsInteger := fDMConsEstoque.cdsBalancoID_PRODUTO.AsInteger;
    sds.ParamByName('DTMOVIMENTO').AsDate   := DateEdit1.Date;
    sds.ParamByName('TAMANHO').AsString     := vTamamho;
    sds.ParamByName('ID_COR').AsInteger     := vID_Cor;
    sds.ParamByName('FILIAL').AsInteger     := RxDBLookupCombo1.KeyValue;
    sds.Open;

    vQtd := StrToFloat(FormatFloat('0.0000',sds.FieldByName('QTD').AsFloat));

  finally
    FreeAndNil(sds);
  end;

  if StrToFloat(FormatFloat('0.0000',vQtd)) = StrToFloat(FormatFloat('0.0000',0)) then
    exit;

  if StrToFloat(FormatFloat('0.0000',vQtd)) < StrToFloat(FormatFloat('0.0000',0)) then
  begin
    vTipo_ES := 'E';
    vQtd     := StrToFloat(FormatFloat('0.0000',vQtd * -1));
  end
  else
    vTipo_ES := 'S';

  vID_Estoque := fDMEstoque.fnc_Gravar_Estoque(0,
                                               RxDBLookupCombo1.KeyValue,
                                               1, //aqui verificar o local do estoque
                                               fDMConsEstoque.cdsBalancoID_PRODUTO.AsInteger,
                                               0,
                                               0,
                                               0,
                                               0,0,
                                               vTipo_ES,
                                               'BAL',
                                               fDMConsEstoque.cdsBalancoUNIDADE.AsString,
                                               fDMConsEstoque.cdsBalancoUNIDADE.AsString,
                                               '',
                                               vTamamho,
                                               DateEdit1.Date,
                                               fDMConsEstoque.cdsBalancoclPreco_Medio.AsFloat,
                                               vQtd,
                                               0,
                                               0,
                                               0,
                                               0,
                                               0,
                                               vQtd,
                                               fDMConsEstoque.cdsBalancoclPreco_Medio.AsFloat,
                                               0,0,
                                               fDMConsEstoque.cdsBalancoUNIDADE.AsString,
                                               vID_Cor,
                                               '',
                                               'N',0,0,0,0,0,0,0); //29/04/2020
  MessageDlg('*** Gravou a Quantidade no Estoque!', mtConfirmation, [mbOk], 0);
end;

procedure TfrmConsEstoque_Bal.btnTipoCadastroClick(Sender: TObject);
begin
  frmSel_Balanco := TfrmSel_Balanco.Create(self);
  frmSel_Balanco.vTipo_Pesquisa := 'P';
  frmSel_Balanco.ShowModal;
  FreeAndNil(frmSel_Balanco);
end;

procedure TfrmConsEstoque_Bal.btnTipoSpedClick(Sender: TObject);
begin
  frmSel_Balanco := TfrmSel_Balanco.Create(self);
  frmSel_Balanco.vTipo_Pesquisa := 'S';
  frmSel_Balanco.ShowModal;
  FreeAndNil(frmSel_Balanco);
end;

procedure TfrmConsEstoque_Bal.ComboBox1Click(Sender: TObject);
begin
  btnTipoCadastro.Enabled := (ComboBox1.ItemIndex = 0);
  btnTipoSped.Enabled     := (ComboBox1.ItemIndex = 1);
end;

procedure TfrmConsEstoque_Bal.btnImpGradeClick(Sender: TObject);
var
  vArq: String;
begin
  SMDBGrid1.DisableScroll;
  vTipo_Config_Email := 4;
  fDMConsEstoque.cdsFilial.Locate('ID',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
  if ComboBox1.ItemIndex = 0 then
  begin
    case RadioGroup1.ItemIndex of
      0: fDMConsEstoque.cdsBalanco.IndexFieldNames := 'TIPO_REG;REFERENCIA;NOME_COMBINACAO;TAMANHO';
      1: fDMConsEstoque.cdsBalanco.IndexFieldNames := 'TIPO_REG;NOME_PRODUTO;NOME_COMBINACAO;TAMANHO';
    end;
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Balanco_grade.fr3';
  end;

  if FileExists(vArq) then
  begin
    fDMConsEstoque.frxReport1.Report.LoadFromFile(vArq);
    fDMConsEstoque.cdsBalanco.First;
    fDMConsEstoque.frxReport1.variables['Empresa'] := QuotedStr(fDMConsEstoque.cdsFilialNOME.AsString);
    fDMConsEstoque.frxReport1.variables['DataReferencia'] := QuotedStr(FormatDateTime('DD/MM/YYYY',DateEdit1.date));
    fDMConsEstoque.frxReport1.ShowReport;
  end;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmConsEstoque_Bal.Excel1Click(Sender: TObject);
begin
  prc_CriaExcel(SMDBGrid1.DataSource);
end;

procedure TfrmConsEstoque_Bal.prc_CriaExcel(vDados: TDataSource);
var
  planilha: variant;
  vTexto: string;
begin
  Screen.Cursor := crHourGlass;
  vDados.DataSet.First;
  SMDBGrid1.DisableScroll;

  try
    planilha := CreateOleObject('Excel.Application');
    planilha.WorkBooks.add(1);
    planilha.caption := 'Exportando dados do tela para o Excel';
    planilha.visible := true;

    prc_Preencher_Excel2(planilha, vDados, SMDBGrid1);

    planilha.columns.Autofit;
    vTexto := ExtractFilePath(Application.ExeName);

    vTexto := vTexto + Name + '_' + RzPageControl1.ActivePage.Caption;

    Planilha.ActiveWorkBook.SaveAs(vTexto);
  finally
    begin
      Screen.Cursor := crDefault;
      SMDBGrid1.EnableScroll;
    end;
  end;
end;

procedure TfrmConsEstoque_Bal.CSV1Click(Sender: TObject);
var
  ffrmInformeEndereco: TfrmInformeEndereco;
  vAno,vMes : Integer;
begin
  ffrmInformeEndereco := TfrmInformeEndereco.Create(self);
  ffrmInformeEndereco.ShowModal;
  FreeAndNil(ffrmInformeEndereco);

  if copy(vEndereco_Arq,Length(vEndereco_Arq),1) <> '\' then
    vEndereco_Arq := vEndereco_Arq + '\';

  vAno := YearOf(DateEdit1.Date);
  vMes := MonthOf(DateEdit1.Date);

  SMDBGrid1.DisableScroll;
  try
    prc_Preencher_CSV(SMDBGrid1.DataSource, SMDBGrid1,'BALANCO_' + FormatFloat('0000',vAno) + '_' + FormatFloat('00',vMes) + '.CSV');
  finally
    SMDBGrid1.EnableScroll;
  end;

  MessageDlg('*** Arquivo gerado  ' + vEndereco_Arq + 'BALANCO_' + FormatFloat('0000',vAno) + '_' + FormatFloat('00',vMes) + '.CSV', mtConfirmation, [mbOk], 0);
end;

end.
