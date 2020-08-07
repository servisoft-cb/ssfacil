unit UConsCSTxCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, NxCollection, UDMConsFat,
  Grids, DBGrids, SMDBGrid, RzTabs, SqlExpr;

type
  TfrmConsCSTxCFOP = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Usadas: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    btnLeis: TNxButton;
    SMDBGrid2: TSMDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    cbxEmpresa: TComboBox;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    cbxEntradaSaida: TComboBox;
    btnImprimir_Lei: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnLeisClick(Sender: TObject);
    procedure btnImprimir_LeiClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsFat: TDMConsFat;
    vOpcaoImp : String;

    procedure prc_Consultar;
    procedure prc_Monta_Cab;
    procedure prc_Gerar_Leis;

  public
    { Public declarations }
  end;

var
  frmConsCSTxCFOP: TfrmConsCSTxCFOP;

implementation

uses rsDBUtils, DmdDatabase, DB;


{$R *.dfm}

procedure TfrmConsCSTxCFOP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsCSTxCFOP.FormShow(Sender: TObject);
begin
  fDMConsFat := TDMConsFat.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsFat);
end;

procedure TfrmConsCSTxCFOP.btnConsultarClick(Sender: TObject);
begin
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('É obrigatório informar a data de inicio e fim!',mtInformation,[mbOk],0);
    Exit;
  end;

  prc_Consultar;
end;

procedure TfrmConsCSTxCFOP.prc_Consultar;
var
  vComando : String;
begin
  vComando := '';
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND N.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND N.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND N.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case cbxEmpresa.ItemIndex of
    1 : vComando := vComando + ' AND ICMS.TIPO = ' + QuotedStr('N');
    2 : vComando := vComando + ' AND ICMS.TIPO = ' + QuotedStr('S');
  end;
  case cbxEntradaSaida.ItemIndex of
    1 : vComando := vComando + ' AND N.TIPO_NOTA = ' + QuotedStr('E');
    2 : vComando := vComando + ' AND N.TIPO_NOTA = ' + QuotedStr('S');
  end;
  fDMConsFat.cdsCSTICMS_CFOP.Close;
  fDMConsFat.sdsCSTICMS_CFOP.CommandText := fDMConsFat.ctCSTICMS_CFOP + vComando;
  fDMConsFat.cdsCSTICMS_CFOP.Open;
end;

procedure TfrmConsCSTxCFOP.btnImprimirClick(Sender: TObject);
var
  vArq: string;
begin
  prc_Monta_Cab;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CSTICMSxCFOP.fr3';
  if FileExists(vArq) then
    fDMConsFat.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMConsFat.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  fDMConsFat.frxReport1.ShowReport;
end;

procedure TfrmConsCSTxCFOP.prc_Monta_Cab;
begin
  vOpcaoImp := '';
  if RxDBLookupCombo1.Text <> '' then
    vOpcaoImp := vOpcaoImp + '(Filial:' + RxDBLookupCombo1.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt.Inicial: ' + DateEdit1.Text + '  Final: ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt.Inicial: ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt.Final: ' + DateEdit2.Text + ')';
  case cbxEmpresa.ItemIndex of
    1: vOpcaoImp := vOpcaoImp + '(Empresa do Geral)';
    2: vOpcaoImp := vOpcaoImp + '(Empresa do Simples)';
  end;
  case cbxEntradaSaida.ItemIndex of
    1: vOpcaoImp := vOpcaoImp + '(Notas de Entradas)';
    2: vOpcaoImp := vOpcaoImp + '(Notas de Saídas)';
  end;
end;

procedure TfrmConsCSTxCFOP.btnLeisClick(Sender: TObject);
begin
  prc_Gerar_Leis;
  fDMConsFat.mAuxiliarICMS.IndexFieldNames := 'Tipo;Cod_CFOP;Nome';
end;

procedure TfrmConsCSTxCFOP.prc_Gerar_Leis;
var
  sds: TSQLDataSet;
begin
  fDMConsFat.mAuxiliarICMS.EmptyDataSet;

  sds := TSQLDataSet.Create(nil);
  try
    //CFOP Variação
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText := 'select distinct c.id, c.codcfop, v.id_csticms, i.cod_cst, v.tipo_empresa, v.tipo_cliente, v.id_obs_lei, v.lei, l.obs, '
                     + 'i.historico, i.percentual, i.perc_diferimento '
                     + 'from tab_cfop c '
                     + 'inner join tab_cfop_variacao v on c.id = v.id '
                     + 'inner join tab_csticms i on v.id_csticms = i.id '
                     + 'left join obs_lei l on v.id_obs_lei = l.id '
                     + 'where i.tipo = ' + QuotedStr('N')
                     + '  and c.entradasaida = ' + QuotedStr('S');
    sds.Open;

    while not sds.Eof do
    begin
      fDMConsFat.mAuxiliarICMS.Insert;
      fDMConsFat.mAuxiliarICMSTipo.AsString     := '01 CFOP Variacao';
      fDMConsFat.mAuxiliarICMSCod_CFOP.AsString := sds.FieldByName('codcfop').AsString;
      fDMConsFat.mAuxiliarICMSID_Tipo.AsInteger := sds.FieldByName('ID').AsInteger;
      if (sds.FieldByName('tipo_empresa').AsString = 'G') and (sds.FieldByName('tipo_cliente').AsString = 'G') then
        fDMConsFat.mAuxiliarICMSNome.AsString     := 'Emitente do Geral e Destinatário do Geral'
      else
      if (sds.FieldByName('tipo_empresa').AsString = 'G') and (sds.FieldByName('tipo_cliente').AsString = 'S') then
        fDMConsFat.mAuxiliarICMSNome.AsString     := 'Emitente do Geral e Destinatário do Simples';
      fDMConsFat.mAuxiliarICMSID_CFOP.AsInteger    := sds.FieldByName('ID').AsInteger;
      fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger := sds.FieldByName('id_csticms').AsInteger;
      fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString := sds.FieldByName('cod_cst').AsString;
      if sds.FieldByName('id_obs_lei').AsInteger > 0 then
        fDMConsFat.mAuxiliarICMSID_Lei.AsInteger     := sds.FieldByName('id_obs_lei').AsInteger;
      if trim(sds.FieldByName('lei').AsString) <> '' then
        fDMConsFat.mAuxiliarICMSLei.AsString    := sds.FieldByName('lei').AsString;
      if (trim(sds.FieldByName('obs').AsString) <> '') then
        fDMConsFat.mAuxiliarICMSLei_Cadastro.AsString    := sds.FieldByName('obs').AsString;
      if (trim(sds.FieldByName('historico').AsString) <> '') then
        fDMConsFat.mAuxiliarICMSLei_CST.AsString    := sds.FieldByName('historico').AsString;
      fDMConsFat.mAuxiliarICMSPerc_Diferimento.AsFloat := sds.FieldByName('perc_diferimento').AsFloat;
      fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat        := sds.FieldByName('percentual').AsFloat;
      fDMConsFat.mAuxiliarICMS.Post;
      sds.Next;
    end;

    //Pessoa Fiscal
    sds.Close;
    sds.CommandText := 'select P.CODIGO, P.NOME, P.UF, PF.ID_CST_ICMS_SUFRAMA, PF.ID_CST_ICMS, I.COD_CST COD_CST_SUFRAMA, '
                     + 'I2.COD_CST COD_CST_ICMS, I.HISTORICO HISTORICO_SUFRAMA, I.COD_BENEF COD_BENEF_SUFRAMA, '
                     + 'I.PERCENTUAL, I.PERC_DIFERIMENTO, '
                     + '       I2.HISTORICO HISTORICO_ICMS, I2.COD_BENEF COD_BENEF_ICMS, '
                     + '       I2.PERCENTUAL PERCENTUAL_ICMS , I2.PERC_DIFERIMENTO PERC_DIFERIMENTO_ICMS '
                     + 'from PESSOA P '
                     + 'inner join PESSOA_FISCAL PF on P.CODIGO = PF.CODIGO '
                     + 'left join TAB_CSTICMS I on PF.ID_CST_ICMS_SUFRAMA = I.ID '
                     + 'left join TAB_CSTICMS I2 on PF.ID_CST_ICMS = I2.ID '
                     + 'where coalesce(PF.ID_CST_ICMS_SUFRAMA, 0) > 0 or (coalesce(PF.ID_CST_ICMS, 0) > 0) ';
    sds.Open;

    while not sds.Eof do
    begin
      fDMConsFat.mAuxiliarICMS.Insert;
      fDMConsFat.mAuxiliarICMSTipo.AsString        := '02 Pessoa Fiscal';
      fDMConsFat.mAuxiliarICMSID_Tipo.AsInteger    := sds.FieldByName('CODIGO').AsInteger;
      fDMConsFat.mAuxiliarICMSNome.AsString        := sds.FieldByName('NOME').AsString + '  (UF: ' + sds.FieldByName('UF').AsString + ')';
      fDMConsFat.mAuxiliarICMSUF.AsString          := sds.FieldByName('UF').AsString;
      if sds.FieldByName('id_cst_icms').AsInteger > 0 then
      begin
        fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger := sds.FieldByName('id_cst_icms').AsInteger;
        fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString := sds.FieldByName('COD_CST_ICMS').AsString;
        fDMConsFat.mAuxiliarICMSLei_CST.AsString     := sds.FieldByName('HISTORICO_ICMS').Value;
        fDMConsFat.mAuxiliarICMSPerc_Diferimento.AsFloat := sds.FieldByName('PERC_DIFERIMENTO_ICMS').AsFloat;
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat        := sds.FieldByName('PERCENTUAL_ICMS').AsFloat;
      end
      else
      begin
        fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger := sds.FieldByName('id_cst_icms_suframa').AsInteger;
        fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString := sds.FieldByName('COD_CST_SUFRAMA').AsString;
        fDMConsFat.mAuxiliarICMSLei_CST.AsString     := sds.FieldByName('HISTORICO_suframa').Value;
        fDMConsFat.mAuxiliarICMSPerc_Diferimento.AsFloat := sds.FieldByName('PERC_DIFERIMENTO').AsFloat;
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat        := sds.FieldByName('PERCENTUAL').AsFloat;
      end;
      fDMConsFat.mAuxiliarICMS.Post;
      sds.Next;
    end;

    //Pessoa Produto
    sds.Close;
    sds.CommandText := 'select P.CODIGO, P.NOME, P.UF, pf.id_csticms, pf.id_lei, pf.drawback, pf.cod_benef, pf.finalidade, '
                     + 'i.cod_cst, i.historico, lei.obs, pf.id_produto, prod.referencia, prod.nome nome_produto, '
                     + 'i.percentual, i.perc_diferimento '
                     + 'from PESSOA P '
                     + 'inner join pessoa_prodicms PF on P.CODIGO = PF.CODIGO '
                     + 'inner join TAB_CSTICMS I on PF.id_csticms = i.id '
                     + 'inner join produto prod on pf.id_produto = prod.id '
                     + 'left join obs_lei lei on pf.id_lei = lei.id ';
    sds.Open;
    while not sds.Eof do
    begin
      fDMConsFat.mAuxiliarICMS.Insert;
      fDMConsFat.mAuxiliarICMSTipo.AsString         := '03 Pessoa Produto';
      fDMConsFat.mAuxiliarICMSID_Tipo.AsInteger     := sds.FieldByName('CODIGO').AsInteger;
      fDMConsFat.mAuxiliarICMSNome.AsString         := sds.FieldByName('NOME').AsString;
      fDMConsFat.mAuxiliarICMSUF.AsString           := sds.FieldByName('UF').AsString;
      fDMConsFat.mAuxiliarICMSReferencia.AsString   := sds.FieldByName('REFERENCIA').AsString;
      fDMConsFat.mAuxiliarICMSNome_Produto.AsString := sds.FieldByName('NOME_PRODUTO').AsString;
      fDMConsFat.mAuxiliarICMSID_Produto.AsInteger  := sds.FieldByName('id_produto').AsInteger;
      fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger  := sds.FieldByName('id_csticms').AsInteger;
      fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString  := sds.FieldByName('cod_cst').AsString;
      fDMConsFat.mAuxiliarICMSLei_CST.AsString      := sds.FieldByName('Historico').Value;
      fDMConsFat.mAuxiliarICMSLei_Cadastro.AsString := sds.FieldByName('obs').Value;
      fDMConsFat.mAuxiliarICMSPerc_Diferimento.AsFloat := sds.FieldByName('perc_diferimento').AsFloat;
      fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat        := sds.FieldByName('percentual').AsFloat;
      fDMConsFat.mAuxiliarICMS.Post;
      sds.Next;
    end;

    //NCM
    sds.Close;
    sds.CommandText := 'select ncm.id, ncm.ncm, ncm.id_cfop, ncm.cod_benef, ncm.id_cst_icms, ncm.id_obs_lei, '
                     + 'i.cod_cst, lei.obs obs_lei, i.historico, ncm.perc_red_strib, i.perc_diferimento, i.percentual '
                     + 'from tab_ncm ncm '
                     + 'inner join TAB_CSTICMS I on ncm.id_cst_icms = i.id '
                     + 'left join OBS_LEI Lei on ncm.id_obs_lei = lei.id '
                     + 'where I.TIPO = ' + QuotedStr('N');
    sds.Open;
    while not sds.Eof do
    begin
      fDMConsFat.mAuxiliarICMS.Insert;
      fDMConsFat.mAuxiliarICMSTipo.AsString         := '04 NCM';
      fDMConsFat.mAuxiliarICMSID_Tipo.AsInteger     := sds.FieldByName('id').AsInteger;
      fDMConsFat.mAuxiliarICMSNome.AsString         := 'NCM: ' +  sds.FieldByName('NCM').AsString;
      fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger  := sds.FieldByName('id_cst_icms').AsInteger;
      fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString  := sds.FieldByName('cod_cst').AsString;
      fDMConsFat.mAuxiliarICMSLei_CST.AsString      := sds.FieldByName('Historico').Value;
      fDMConsFat.mAuxiliarICMSLei_Cadastro.AsString := sds.FieldByName('obs_lei').Value;
      if sds.FieldByName('PERC_RED_STRIB').AsFloat > 0 then
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat := 100 - sds.FieldByName('PERC_RED_STRIB').AsFloat
      else
      begin
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat := sds.FieldByName('percentual').AsFloat;
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat := sds.FieldByName('perc_diferimento').AsFloat;
      end;
      fDMConsFat.mAuxiliarICMS.Post;
      sds.Next;
    end;

    //NCM Por UF
    sds.Close;
    sds.CommandText := 'select n.id, n.uf, n.id_cst_icms, n.cod_benef, ncm.ncm, i.cod_cst, i.historico, i.perc_diferimento, i.percentual '
                     + 'from tab_ncm_cst n '
                     + 'inner join tab_ncm ncm '
                     + 'on n.id = ncm.id '
                     + 'inner join TAB_CSTICMS I on n.id_cst_icms = i.id '
                     + 'where I.TIPO = ' + QuotedStr('N');
    sds.Open;
    while not sds.Eof do
    begin
      fDMConsFat.mAuxiliarICMS.Insert;
      fDMConsFat.mAuxiliarICMSTipo.AsString         := '05 NCM Por UF';
      fDMConsFat.mAuxiliarICMSID_Tipo.AsInteger     := sds.FieldByName('id').AsInteger;
      fDMConsFat.mAuxiliarICMSNome.AsString         := 'NCM: ' +  sds.FieldByName('NCM').AsString;
      fDMConsFat.mAuxiliarICMSUF.AsString           := sds.FieldByName('UF').AsString;
      fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger  := sds.FieldByName('id_cst_icms').AsInteger;
      fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString  := sds.FieldByName('cod_cst').AsString;
      fDMConsFat.mAuxiliarICMSLei_CST.AsString      := sds.FieldByName('Historico').Value;
      fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat     := sds.FieldByName('percentual').AsFloat;
      fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat     := sds.FieldByName('perc_diferimento').AsFloat;
      fDMConsFat.mAuxiliarICMS.Post;
      sds.Next;
    end;

    //NCM Lei (CFOP/CST)
    sds.Close;
    sds.CommandText := 'select n.id, n.id_cfop, n.id_cst_icm, n.id_lei, n.complemento, ncm.ncm, i.cod_cst, i.historico, lei.obs obs_lei, '
                     + 'cfop.codcfop, i.perc_diferimento, i.percentual '
                     + 'from tab_ncm_lei n '
                     + 'inner join tab_ncm ncm on n.id = ncm.id '
                     + 'inner join TAB_CSTICMS I on n.id_cst_icm = i.id '
                     + 'left join obs_lei lei on n.id_lei = lei.id '
                     + 'left join tab_cfop cfop on n.id_cfop = cfop.id '
                     + 'where I.TIPO = ' + QuotedStr('N');
    sds.Open;
    while not sds.Eof do
    begin
      fDMConsFat.mAuxiliarICMS.Insert;
      fDMConsFat.mAuxiliarICMSTipo.AsString         := '06 NCM LEI (CFOP/CST)';
      fDMConsFat.mAuxiliarICMSID_Tipo.AsInteger     := sds.FieldByName('id').AsInteger;
      fDMConsFat.mAuxiliarICMSNome.AsString         := 'NCM: ' +  sds.FieldByName('NCM').AsString;
      fDMConsFat.mAuxiliarICMSCod_CFOP.AsString     := sds.FieldByName('codcfop').AsString;
      fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger  := sds.FieldByName('id_cst_icms').AsInteger;
      fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString  := sds.FieldByName('cod_cst').AsString;
      fDMConsFat.mAuxiliarICMSLei_CST.AsString      := sds.FieldByName('Historico').Value;
      fDMConsFat.mAuxiliarICMSLei_Cadastro.AsString := sds.FieldByName('obs_lei').Value;
      fDMConsFat.mAuxiliarICMSLei.AsString          := sds.FieldByName('complemento').Value;
      fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat     := sds.FieldByName('percentual').AsFloat;
      fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat     := sds.FieldByName('perc_diferimento').AsFloat;
      fDMConsFat.mAuxiliarICMS.Post;
      sds.Next;
    end;

    //Produto
    sds.Close;
    sds.CommandText := 'select p.id, p.referencia, p.nome, p.id_csticms_bred, p.id_csticms, i.cod_cst cod_cst_icms, i2.cod_cst cod_cst_bred, '
                     + 'i.historico, i2.historico historico_bred, p.perc_reducaoicms, i.percentual, i.perc_diferimento, '
                     + 'i2.percentual percentual_bred, i2.perc_diferimento perc_diferimento_bred '
                     + 'from produto p '
                     + 'left join TAB_CSTICMS I on p.id_csticms = i.id '
                     + 'left join TAB_CSTICMS I2 on p.id_csticms_bred = i2.id '
                     + 'where (coalesce(p.id_csticms_bred,0) > 0 '
                     + '       or coalesce(p.id_csticms,0) > 0) ';
    sds.Open;
    while not sds.Eof do
    begin
      fDMConsFat.mAuxiliarICMS.Insert;
      fDMConsFat.mAuxiliarICMSTipo.AsString         := '07 PRODUTO';
      fDMConsFat.mAuxiliarICMSID_Tipo.AsInteger     := sds.FieldByName('id').AsInteger;
      fDMConsFat.mAuxiliarICMSNome.AsString         := sds.FieldByName('nome').AsString;
      fDMConsFat.mAuxiliarICMSReferencia.AsString   := sds.FieldByName('referencia').AsString;
      if sds.FieldByName('id_csticms').AsInteger > 0 then
      begin
        fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger  := sds.FieldByName('id_csticms').AsInteger;
        fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString  := sds.FieldByName('cod_cst_icms').AsString;
        fDMConsFat.mAuxiliarICMSLei_CST.AsString      := sds.FieldByName('Historico').Value;
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat     := sds.FieldByName('percentual').AsFloat;
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat     := sds.FieldByName('perc_diferimento').AsFloat;
      end
      else
      begin
        fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger  := sds.FieldByName('id_csticms_bred').AsInteger;
        fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString  := sds.FieldByName('cod_cst_bred').AsString;
        fDMConsFat.mAuxiliarICMSLei_CST.AsString      := sds.FieldByName('Historico_bred').Value;
        if sds.FieldByName('perc_reducaoicms').AsFloat > 0 then
          fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat := sds.FieldByName('perc_reducaoicms').AsFloat
        else
          fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat := sds.FieldByName('percentual_bred').AsFloat;
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat     := sds.FieldByName('perc_diferimento_bred').AsFloat;
      end;
      fDMConsFat.mAuxiliarICMS.Post;
      sds.Next;
    end;


    //Produto UF
    sds.Close;
    sds.CommandText := 'select u.id, u.uf, u.id_cst_icms, p.referencia, p.nome, i.cod_cst, i.historico, '
                     + 'u.perc_reducao_icms, i.percentual, i.perc_diferimento '
                     + 'from produto_uf u '
                     + 'inner join produto p on u.id = p.id '
                     + 'inner join TAB_CSTICMS I on u.id_cst_icms = i.id ';
    sds.Open;
    while not sds.Eof do
    begin
      fDMConsFat.mAuxiliarICMS.Insert;
      fDMConsFat.mAuxiliarICMSTipo.AsString         := '08 PRODUTO UF';
      fDMConsFat.mAuxiliarICMSID_Tipo.AsInteger     := sds.FieldByName('id').AsInteger;
      fDMConsFat.mAuxiliarICMSNome.AsString         := sds.FieldByName('nome').AsString;
      fDMConsFat.mAuxiliarICMSUF.AsString           := sds.FieldByName('uf').AsString;
      fDMConsFat.mAuxiliarICMSReferencia.AsString   := sds.FieldByName('referencia').AsString;
      fDMConsFat.mAuxiliarICMSID_CSTICMS.AsInteger  := sds.FieldByName('id_cst_icms').AsInteger;
      fDMConsFat.mAuxiliarICMSCod_CSTICMS.AsString  := sds.FieldByName('cod_cst').AsString;
      fDMConsFat.mAuxiliarICMSLei_CST.AsString      := sds.FieldByName('Historico').Value;
      if sds.FieldByName('perc_reducao_icms').AsFloat > 0 then
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat := sds.FieldByName('perc_reducao_icms').AsFloat
      else
        fDMConsFat.mAuxiliarICMSPerc_Trib.AsFloat := sds.FieldByName('percentual').AsFloat;
      fDMConsFat.mAuxiliarICMSPerc_Diferimento.AsFloat := sds.FieldByName('perc_diferimento').AsFloat;

      fDMConsFat.mAuxiliarICMS.Post;
      sds.Next;
    end;


  finally
    FreeAndNil(sds);
  end;

end;

procedure TfrmConsCSTxCFOP.btnImprimir_LeiClick(Sender: TObject);
var
  vArq: string;
begin
  fDMConsFat.mAuxiliarICMS.IndexFieldNames := 'Tipo;Cod_CFOP;Nome';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CSTICMSxCFOP_Lei.fr3';
  if FileExists(vArq) then
    fDMConsFat.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMConsFat.frxReport1.ShowReport;
end;

end.
