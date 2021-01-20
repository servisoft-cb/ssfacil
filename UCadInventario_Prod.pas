unit UCadInventario_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDMCadInventario, Grids, DBGrids, Mask, 
  SMDBGrid, ExtCtrls, NxCollection, ComCtrls, StdCtrls, ToolEdit, CurrEdit, SqlExpr,
  NxEdit, RzTabs, RzPanel;

type
  TfrmCadInventario_Prod = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Produto: TRzTabSheet;
    TS_Arquivo: TRzTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    NxButton3: TNxButton;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Edit2: TEdit;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    btnConfirmar: TNxButton;
    ProgressBar1: TProgressBar;
    NxFlipPanel1: TNxFlipPanel;
    SMDBGrid2: TSMDBGrid;
    NxPanel1: TNxPanel;
    NxLabel1: TNxLabel;
    NxLabel2: TNxLabel;
    NxLabel3: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel5: TNxLabel;
    NxLabel6: TNxLabel;
    NxComboBox1: TNxComboBox;
    NxComboBox2: TNxComboBox;
    NxComboBox3: TNxComboBox;
    NxComboBox4: TNxComboBox;
    Edit3: TEdit;
    NxComboBox5: TNxComboBox;
    btnGerarAuxiliar: TNxButton;
    FilenameEdit1: TFilenameEdit;
    SMDBGrid3: TSMDBGrid;
    btnGravarInventario: TNxButton;
    NxFlipPanel2: TNxFlipPanel;
    NxLabel7: TNxLabel;
    SMDBGrid4: TSMDBGrid;
    SMDBGrid5: TSMDBGrid;
    gbxVendedor: TRzGroupBox;
    NxLabel9: TNxLabel;
    lblTotal: TNxLabel;
    lblGravados: TNxLabel;
    NxLabel12: TNxLabel;
    lblErro: TNxLabel;
    NxLabel14: TNxLabel;
    NxLabel8: TNxLabel;
    lblLidos: TNxLabel;
    NxLabel10: TNxLabel;
    lblProdutosGravados: TNxLabel;
    NxLabel13: TNxLabel;
    lblProdutosErro: TNxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NxButton3Click(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnGerarAuxiliarClick(Sender: TObject);
    procedure btnGravarInventarioClick(Sender: TObject);
  private
    { Private declarations }
    vVazio: Boolean;
    vItem_Inventario: Integer;
    vMSGProd : String;
    vArquivo_Str : TStringList;
    vPreco_Custo, vPreco_Venda, vQtd : Real;
    vID_Produto : Integer;
    vCodBarra : String;
    vReferencia: String;
    vCampos : array [1..7] of string;
    vExiste_Prod : Boolean;
    vLinha_Reg : String;
    vLinha_Cont : Integer;

    procedure prc_Gravar_Itens(Arquivo : Boolean = False);
    procedure prc_Filtrar;

    function fnc_existe_prod : Boolean;
    procedure prc_Ler_Produto(Cod_Barra, Referencia : String ; ID : Integer);
    procedure prc_Gravar_Erro;
    procedure prc_Gravar_ErroLinha;

  public
    { Public declarations }
    fDMCadInventario: TDMCadInventario;
  end;

var
  frmCadInventario_Prod: TfrmCadInventario_Prod;

implementation

uses DB, rsDBUtils, DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfrmCadInventario_Prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fDMCadInventario.cdsProduto.Filtered := False;
  Action := Cafree;
end;

procedure TfrmCadInventario_Prod.btnConfirmarClick(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fDMCadInventario.mNaoGravados.EmptyDataSet;
  NxFlipPanel1.Expanded := False;
  vVazio := False;
  fDMCadInventario.cdsInventario_Itens.Last;
  vItem_Inventario := fDMCadInventario.cdsInventario_ItensITEM.AsInteger;
  if fDMCadInventario.cdsInventario_Itens.RecordCount <= 0 then
    vVazio := True;
  ProgressBar1.Visible  := True;
  ProgressBar1.Max      := fDMCadInventario.cdsProduto.RecordCount;
  ProgressBar1.Position := 0;
  fDMCadInventario.cdsInventario_Itens.IndexFieldNames := 'ID;ITEM';
  fDMCadInventario.cdsProduto.First;
  while not fDMCadInventario.cdsProduto.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1; 
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) and not(fnc_existe_prod) then
      prc_Gravar_Itens(False);
    fDMCadInventario.cdsProduto.Next;
  end;
  SMDBGrid1.EnableScroll;
  if fDMCadInventario.mNaoGravados.RecordCount > 0 then
    NxFlipPanel1.Expanded := True;
end;

procedure TfrmCadInventario_Prod.prc_Gravar_Itens(Arquivo : Boolean);
var
  vTam: String;
  vExiste : Boolean;
begin
  if (trim(fDMCadInventario.cdsProdutoTAMANHO.AsString) = '') or (fDMCadInventario.cdsProdutoTAMANHO.IsNull) then
    vTam := ''
  else
    vTam := fDMCadInventario.cdsProdutoTAMANHO.AsString;
  vExiste := False;
  if not vVazio then
  begin
    if fDMCadInventario.cdsProdutoID_COR_COMBINACAO.AsInteger > 0 then
    begin
      if fDMCadInventario.cdsInventario_Itens.Locate('ID_PRODUTO;TAMANHO;ID_COR',VarArrayOf([fDMCadInventario.cdsProdutoID.AsInteger,vTam,fDMCadInventario.cdsProdutoID_COR_COMBINACAO.AsInteger]),[locaseinsensitive]) then
        vExiste := True;
    end
    else
    begin
      if fDMCadInventario.cdsInventario_Itens.Locate('ID_PRODUTO;TAMANHO',VarArrayOf([fDMCadInventario.cdsProdutoID.AsInteger,vTam]),[locaseinsensitive]) then
        vExiste := True;
    end;
  end;
  if not(Arquivo) and (vExiste) then
    exit;

  if vExiste then
  begin
    fDMCadInventario.cdsInventario_Itens.Edit;
  end
  else
  begin
    vItem_Inventario := vItem_Inventario + 1;
    fDMCadInventario.cdsInventario_Itens.Insert;
    fDMCadInventario.cdsInventario_ItensID.AsInteger         := fDMCadInventario.cdsInventarioID.AsInteger;
    fDMCadInventario.cdsInventario_ItensITEM.AsInteger       := vItem_Inventario;
    fDMCadInventario.cdsInventario_ItensID_PRODUTO.AsInteger := fDMCadInventario.cdsProdutoID.AsInteger;
    fDMCadInventario.cdsInventario_ItensTAMANHO.AsString     := fDMCadInventario.cdsProdutoTAMANHO.AsString;
  end;
  fDMCadInventario.cdsInventario_ItensQTD_ESTOQUE.AsFloat  := StrToFloat(FormatFloat('0.000000',fDMCadInventario.cdsProdutoQTD.AsFloat));
  if Arquivo then
  begin
    fDMCadInventario.cdsInventario_ItensQTD_INVENTARIO.AsFloat := StrToFloat(FormatFloat('0.000000',fDMCadInventario.mAuxInventarioQtd.AsFloat));
  end
  else
  begin
    if fDMCadInventario.qParametrosINV_TRAZER_QTD_ZERADA.AsString = 'S' then
      fDMCadInventario.cdsInventario_ItensQTD_INVENTARIO.AsFloat := StrToFloat(FormatFloat('0.000000',0))
    else
      fDMCadInventario.cdsInventario_ItensQTD_INVENTARIO.AsFloat := StrToFloat(FormatFloat('0.000000',fDMCadInventario.cdsProdutoQTD.AsFloat));
  end;
  fDMCadInventario.cdsInventario_ItensQTD_AJUSTE.AsFloat   := 0;
  fDMCadInventario.cdsInventario_ItensTIPO_AJUSTE.AsString := 'N';
  fDMCadInventario.cdsInventario_ItensPERC_IPI.AsFloat     := StrToFloat(FormatFloat('0.00000',fDMCadInventario.cdsProdutoPERC_IPI.AsFloat));
  if Arquivo then
    fDMCadInventario.cdsInventario_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.00000',fDMCadInventario.mAuxInventarioPreco_Custo.AsFloat))
  else
    fDMCadInventario.cdsInventario_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.00000',fDMCadInventario.cdsProdutoPRECO_CUSTO.AsFloat));
  fDMCadInventario.cdsInventario_ItensPERC_ICMS.AsFloat    := StrToFloat(FormatFloat('0.00000',0));
  fDMCadInventario.cdsInventario_ItensREFERENCIA.AsString  := fDMCadInventario.cdsProdutoREFERENCIA.AsString;
  fDMCadInventario.cdsInventario_ItensNOME.AsString        := fDMCadInventario.cdsProdutoNOME.AsString;
  fDMCadInventario.cdsInventario_ItensUNIDADE.AsString     := fDMCadInventario.cdsProdutoUNIDADE.AsString;
  if fDMCadInventario.cdsProdutoID_COR_COMBINACAO.AsInteger > 0 then
    fDMCadInventario.cdsInventario_ItensID_COR.AsInteger        := fDMCadInventario.cdsProdutoID_COR_COMBINACAO.AsInteger;
  fDMCadInventario.cdsInventario_ItensNOME_COR_COMBINACAO.AsString := fDMCadInventario.cdsProdutoNOME_COR.AsString;
  fDMCadInventario.cdsInventario_Itens.Post;
end;

procedure TfrmCadInventario_Prod.FormShow(Sender: TObject);
var
  i: Integer;
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadInventario);
  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'NOME_COR') then
      SMDBGrid1.Columns[i].Visible := ((fDMCadInventario.qParametrosINFORMAR_COR_MATERIAL.AsString = 'S') or (fDMCadInventario.qParametrosINFORMAR_COR_PROD.AsString = 'C'))
    else
    if (SMDBGrid1.Columns[i].FieldName = 'QTD_GERAL') then
      SMDBGrid1.Columns[i].Visible := (fDMCadInventario.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S') and (trim(fDMCadInventario.qParametros_EstINVENTARIO_ESTMOV.AsString) <> 'S');
  end;
  //RadioGroup1.Visible := (fDMCadInventario.qParametros_EstINVENTARIO_ESTMOV.AsString = 'S'); 08/10/2020
  NxFlipPanel1.Expanded := False;
  if fDMCadInventario.qParametros_EstINVENTARIO_ESTMOV.AsString = 'S' then
    Label4.Caption := 'Saldo do Estoque até dia ' + fDMCadInventario.cdsInventarioDATA.AsString
  else
    Label4.Caption := 'Saldo do Estoque até dia ' + DateToStr(Date)  + ' (Saldo Atual)';
  NxFlipPanel2.Expanded := False;
end;

procedure TfrmCadInventario_Prod.NxButton3Click(Sender: TObject);
begin
  fDMCadInventario.cdsProduto.Filtered := False;
  fDMCadInventario.prc_Abrir_Produto(fDMCadInventario.cdsInventarioTIPO_REG.AsString,Edit2.Text,Edit1.Text,CurrencyEdit1.AsInteger);
  prc_Filtrar;
end;

procedure TfrmCadInventario_Prod.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;                                                                          
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadInventario.cdsProduto.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

function TfrmCadInventario_Prod.fnc_existe_prod: Boolean;
var
  sds: TSQLDataSet;
begin
  Result := False;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select V.ID, V.FILIAL, V.DATA, V.NUM_INVENTARIO from INVENTARIO V '
                       + 'inner join INVENTARIO_ITENS I on V.ID = I.ID '
                       + 'where I.ID_PRODUTO = :ID_PRODUTO and '
                       + 'V.FILIAL = :FILIAL and '
                       + '(I.ID_COR = :ID_COR or :ID_COR = 0) and '
                       + '(coalesce(I.TAMANHO, ' + QuotedStr('') + ') = :TAMANHO) and '
                       + 'coalesce(V.GERADO_ESTOQUE, ' +QuotedStr('N') + ') = ' +QuotedStr('N');
    sds.ParamByName('ID_PRODUTO').AsInteger := fDMCadInventario.cdsProdutoID.AsInteger;
    sds.ParamByName('FILIAL').AsInteger     := fDMCadInventario.cdsInventarioFILIAL.AsInteger;
    if fDMCadInventario.cdsProdutoID_COR_COMBINACAO.AsInteger > 0 then
      sds.ParamByName('ID_COR').AsInteger := fDMCadInventario.cdsProdutoID_COR_COMBINACAO.AsInteger
    else
      sds.ParamByName('ID_COR').AsInteger := 0;
    if trim(fDMCadInventario.cdsProdutoTAMANHO.AsString) <> '' then
      sds.ParamByName('TAMANHO').AsString := fDMCadInventario.cdsProdutoTAMANHO.AsString
    else
      sds.ParamByName('TAMANHO').AsString := '';
    sds.Open;
    if sds.FieldByName('ID').AsInteger > 0 then
    begin
      Result := True;
      fDMCadInventario.mNaoGravados.Insert;
      fDMCadInventario.mNaoGravadosID_Produto.AsInteger     := fDMCadInventario.cdsProdutoID.AsInteger;
      fDMCadInventario.mNaoGravadosID_Cor.AsInteger         := fDMCadInventario.cdsProdutoID_COR_COMBINACAO.AsInteger;
      fDMCadInventario.mNaoGravadosTamanho.AsString         := fDMCadInventario.cdsProdutoTAMANHO.AsString;
      fDMCadInventario.mNaoGravadosData.AsDateTime          := sds.FieldByName('DATA').AsDateTime;
      fDMCadInventario.mNaoGravadosNum_Inventario.AsInteger := sds.FieldByName('NUM_INVENTARIO').AsInteger;
      fDMCadInventario.mNaoGravados.Post;
    end;

  finally
    FreeAndNil(sds);
  end;

end;

procedure TfrmCadInventario_Prod.RadioGroup1Click(Sender: TObject);
begin
  if fDMCadInventario.cdsProduto.Active then
    prc_Filtrar;
end;

procedure TfrmCadInventario_Prod.prc_Filtrar;
begin
  fDMCadInventario.cdsProduto.Filtered := False;
  if RadioGroup1.ItemIndex > 0 then
  begin
    if RadioGroup1.ItemIndex = 1 then
      fDMCadInventario.cdsProduto.Filter := 'QTD > 0,00000'
    else
    if RadioGroup1.ItemIndex = 2 then
      fDMCadInventario.cdsProduto.Filter := 'QTD < 0,00000';
    fDMCadInventario.cdsProduto.Filtered := True;
  end;
end;

procedure TfrmCadInventario_Prod.btnGerarAuxiliarClick(Sender: TObject);
var
  i : Integer;
  Texto1 : String;
  Form: TForm;
  vGravado : Integer;
  vLidos   : Integer;
begin
  if (NxComboBox1.ItemIndex = 0) and (NxComboBox2.ItemIndex = 0) and (NxComboBox3.ItemIndex = 0) and (NxComboBox4.ItemIndex = 0) then
  begin
    MessageDlg('*** É obrigatório informar uma coluna!', mtError, [mbOk], 0);
    exit;
  end;
  if ((NxComboBox1.ItemIndex = 0) or (NxComboBox1.ItemIndex > 3)) and
     ((NxComboBox2.ItemIndex = 0) or (NxComboBox2.ItemIndex > 3)) and
     ((NxComboBox3.ItemIndex = 0) or (NxComboBox3.ItemIndex > 3)) and
     ((NxComboBox4.ItemIndex = 0) or (NxComboBox4.ItemIndex > 3)) then
  begin
    MessageDlg('*** É obrigatório informar uma coluna com (Cod.Barra, ID ou Referência)!', mtError, [mbOk], 0);
    exit;
  end;
  if (NxComboBox1.ItemIndex > 0) and ((NxComboBox1.ItemIndex = NxComboBox2.ItemIndex) or
     (NxComboBox1.ItemIndex = NxComboBox3.ItemIndex) or
     (NxComboBox1.ItemIndex = NxComboBox4.ItemIndex)) then
  begin
    MessageDlg('*** Coluna 1 esta se repetindo!', mtError, [mbOk], 0);
    exit;
  end;
  if (NxComboBox2.ItemIndex > 0) and ((NxComboBox2.ItemIndex = NxComboBox3.ItemIndex) or
     (NxComboBox2.ItemIndex = NxComboBox4.ItemIndex)) then
  begin
    MessageDlg('*** Coluna 2 esta se repetindo!', mtError, [mbOk], 0);
    exit;
  end;
  if (NxComboBox3.ItemIndex > 0) and (NxComboBox3.ItemIndex = NxComboBox4.ItemIndex) then
  begin
    MessageDlg('*** Coluna 3 esta se repetindo!', mtError, [mbOk], 0);
    exit;
  end;

  SMDBGrid3.DataSource  := nil;
  NxFlipPanel2.Expanded := False;

  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);

  fDMCadInventario.mAuxInventario.EmptyDataSet;
  fDMCadInventario.mAuxErro.EmptyDataSet;
  fDMCadInventario.mAuxErroLinha.EmptyDataSet;
  for i := 1 to 7 do
    vCampos[i] := '';
  lblErro.Caption     := '0';
  lblGravados.Caption := '0';
  lblLidos.Caption    := '0';
  lblTotal.Caption    := '0';
  vGravado            := 0;
  vLidos              := 0;
  
  vArquivo_Str := TStringList.Create;
  try
    vArquivo_Str.LoadFromFile(FilenameEdit1.Text);
    i := vArquivo_Str.Count;
    if i > 0 then
      lblTotal.Caption := IntToStr(i);
    for i := 0 to vArquivo_Str.Count - 1 do
    begin
      vRegistro_CSV  := vArquivo_Str.Strings[i];
      vRegistro_CSV2 := vArquivo_Str.Strings[i];
      vLinha_Reg     := vArquivo_Str.Strings[i];
      vLinha_Cont    := i;
      lblLidos.Caption := IntToStr(i + 1);
      //vLidos           := vLidos + 1;
      Refresh;
      lblLidos.Refresh;

      Texto1 := fnc_Montar_Campo(';',vRegistro_CSV);
      if Texto1 <> '' then
        vCampos[NxComboBox1.ItemIndex] := Texto1;
      Texto1 := fnc_Montar_Campo(';',vRegistro_CSV);
      if Texto1 <> '' then
        vCampos[NxComboBox2.ItemIndex] := Texto1;
      Texto1 := fnc_Montar_Campo(';',vRegistro_CSV);
      if Texto1 <> '' then
        vCampos[NxComboBox3.ItemIndex] := Texto1;
      Texto1 := fnc_Montar_Campo(';',vRegistro_CSV);
      if Texto1 <> '' then
        vCampos[NxComboBox4.ItemIndex] := Texto1;
      if vCampos[1] <> '' then
        prc_Ler_Produto(vCampos[1],'',0)
      else
      if vCampos[2] <> '' then
        prc_Ler_Produto('','',StrToInt(vCampos[2]))
      else
      if vCampos[3] <> '' then
        prc_Ler_Produto('',vCampos[3],0);
      if NxComboBox5.ItemIndex = 1 then
        vCampos[4] := '1';

      if vID_Produto <= 0 then
        prc_Gravar_Erro
      else
      begin
        try
          if fDMCadInventario.mAuxInventario.Locate('ID',StrToInt(vCampos[2]),[loCaseInsensitive]) then
            fDMCadInventario.mAuxInventario.Edit
          else
          begin
            fDMCadInventario.mAuxInventario.Insert;
            fDMCadInventario.mAuxInventarioID.AsInteger          := StrToInt(vCampos[2]);
            fDMCadInventario.mAuxInventarioCodBarra.AsString     := vCampos[1];
            fDMCadInventario.mAuxInventarioReferencia.AsString   := vCampos[3];
            fDMCadInventario.mAuxInventarioNome_Produto.AsString := vCampos[7];
            fDMCadInventario.mAuxInventarioPreco_Custo.AsString  := vCampos[5];
            fDMCadInventario.mAuxInventarioPreco_Venda.AsString  := vCampos[6];
            fDMCadInventario.mAuxInventarioQtd.AsFloat           := 0;
          end;
          fDMCadInventario.mAuxInventarioQtd.AsFloat := fDMCadInventario.mAuxInventarioQtd.AsFloat + StrToFloat(vCampos[4]);
          fDMCadInventario.mAuxInventario.Post;
          vGravado := vGravado + 1;
        except
          prc_Gravar_ErroLinha;
          //on e: Exception do
          //  MessageDlg('(Cód. ' + fDMCadInventario.mAuxInventarioID.AsString + ')  Ocorreu o seguinte erro ao executar: ' + #13 + e.Message, mtError, [mbOk], 0);
        end;
      end;
    end;


  finally
    begin
      FreeAndNil(vArquivo_Str);
      FreeAndNil(Form);
    end;
  end;

  if (fDMCadInventario.mAuxErro.RecordCount > 0) or (fDMCadInventario.mAuxErroLinha.RecordCount > 0) then
    NxFlipPanel2.Expanded := True;

  lblErro.Caption     := IntToStr(fDMCadInventario.mAuxErroLinha.RecordCount);
  lblGravados.Caption := IntToStr(vGravado);
  lblProdutosGravados.Caption := IntToStr(fDMCadInventario.mAuxInventario.RecordCount);
  lblProdutosErro.Caption     := IntToStr(fDMCadInventario.mAuxErro.RecordCount);

  SMDBGrid3.DataSource := fDMCadInventario.dsmAuxInventario;

{Cod.Barra
ID Produto
Referência
Qtd
Preço Custo
Preço Venda}


end;

procedure TfrmCadInventario_Prod.prc_Ler_Produto(Cod_Barra, Referencia: String; ID: Integer);
var
  sds: TSQLDataSet;
begin
  vExiste_Prod := False;
  vID_Produto := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT P.ID, P.REFERENCIA, P.cod_barra, P.NOME, P.preco_custo, P.preco_custo_total, P.preco_venda FROM PRODUTO P ';
    if trim(Cod_Barra) <> '' then
      sds.CommandText := sds.CommandText + ' WHERE P.COD_BARRA = ' + QuotedStr(Cod_Barra)
    else
    if trim(Referencia) <> '' then
      sds.CommandText := sds.CommandText + ' WHERE P.REFERENCIA = ' + QuotedStr(Referencia)
    else
    if ID > 0 then
      sds.CommandText := sds.CommandText + ' WHERE P.ID = ' + IntToStr(ID);
    sds.Open;
    vID_Produto  := sds.FieldByName('ID').AsInteger;
    vCampos[2]   := sds.FieldByName('ID').AsString;
    vCampos[3]   := sds.FieldByName('REFERENCIA').AsString;
    if StrToFloat(FormatFloat('0.0000',sds.FieldByName('PRECO_CUSTO_TOTAL').AsFloat)) > 0 then
      vPreco_Custo := StrToFloat(FormatFloat('0.0000',sds.FieldByName('PRECO_CUSTO_TOTAL').AsFloat))
    else
      vPreco_Custo := StrToFloat(FormatFloat('0.0000',sds.FieldByName('PRECO_CUSTO').AsFloat));
    vCampos[5] := FormatFloat('0.0000',vPreco_Custo);
    vCampos[6] := FormatFloat('0.0000',sds.FieldByName('PRECO_VENDA').AsFloat);
    vPreco_Venda := StrToFloat(FormatFloat('0.0000',sds.FieldByName('PRECO_VENDA').AsFloat));
    vCampos[7] := sds.FieldByName('NOME').AsString;

  finally
    FreeAndNil(sds);
  end;
  
end;

procedure TfrmCadInventario_Prod.btnGravarInventarioClick(Sender: TObject);
begin
  if (fDMCadInventario.mAuxErro.RecordCount > 0) or (fDMCadInventario.mAuxErroLinha.RecordCount > 0) then
  begin
    if MessageDlg('Existe Produtos Com erro! ' + #13 + 'Esses produtos não vão ser gravados no inventário' +#13+#13 + ' Deseja gerar assim mesmo?' , mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;
  end;

  vVazio := False;
  fDMCadInventario.cdsInventario_Itens.Last;
  vItem_Inventario := fDMCadInventario.cdsInventario_ItensITEM.AsInteger;
  if fDMCadInventario.cdsInventario_Itens.RecordCount <= 0 then
    vVazio := True;
  fDMCadInventario.mAuxInventario.First;
  while not fDMCadInventario.mAuxInventario.Eof do
  begin
    fDMCadInventario.prc_Abrir_Produto(fDMCadInventario.cdsInventarioTIPO_REG.AsString,'','',fDMCadInventario.mAuxInventarioID.AsInteger);
    prc_Gravar_Itens(True);

    fDMCadInventario.mAuxInventario.Next;
  end;

end;

procedure TfrmCadInventario_Prod.prc_Gravar_Erro;
begin
  if vCampos[1] <> '' then
  begin
    if fDMCadInventario.mAuxErro.Locate('Cod_Barra',vCampos[1],[loCaseInsensitive]) then
      fDMCadInventario.mAuxErro.Edit;
  end
  else
  if vCampos[2] <> '' then
  begin
    if fDMCadInventario.mAuxErro.Locate('Codigo',vCampos[2],[loCaseInsensitive]) then
      fDMCadInventario.mAuxErro.Edit;
  end
  else
  if vCampos[3] <> '' then
  begin
    if fDMCadInventario.mAuxErro.Locate('Referencia',vCampos[3],[loCaseInsensitive]) then
      fDMCadInventario.mAuxErro.Edit;
  end;
  if not (fDMCadInventario.mAuxErro.State in [dsEdit]) then
  begin
    fDMCadInventario.mAuxErro.Insert;
    fDMCadInventario.mAuxErroCodigo.AsString     := vCampos[2];
    fDMCadInventario.mAuxErroCod_Barra.AsString  := vCampos[1];
    fDMCadInventario.mAuxErroReferencia.AsString := vCampos[3];
    fDMCadInventario.mAuxErroQtd.AsFloat         := 0;
  end;
  fDMCadInventario.mAuxErroQtd.AsFloat := fDMCadInventario.mAuxErroQtd.AsFloat + StrToFloat(vCampos[4]);
  fDMCadInventario.mAuxErro.Post;
  prc_Gravar_ErroLinha;
end;

procedure TfrmCadInventario_Prod.prc_Gravar_ErroLinha;
begin
  fDMCadInventario.mAuxErroLinha.Insert;
  fDMCadInventario.mAuxErroLinhaLinha.AsString := vLinha_Reg;
  fDMCadInventario.mAuxErroLinhaNumero_Linha.AsInteger := vLinha_Cont;
  fDMCadInventario.mAuxErroLinha.Post;
end;

end.
