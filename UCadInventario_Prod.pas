unit UCadInventario_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDMCadInventario, Grids, DBGrids, Mask, 
  SMDBGrid, ExtCtrls, NxCollection, ComCtrls, StdCtrls, ToolEdit, CurrEdit, SqlExpr;

type
  TfrmCadInventario_Prod = class(TForm)
    PageControl1: TPageControl;
    TS_Produto: TTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    btnConfirmar: TNxButton;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    NxButton3: TNxButton;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    Edit2: TEdit;
    NxFlipPanel1: TNxFlipPanel;
    SMDBGrid2: TSMDBGrid;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NxButton3Click(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    vVazio: Boolean;
    vItem_Inventario: Integer;
    vMSGProd : String;

    procedure prc_Gravar_Itens;
    procedure prc_Filtrar;

    function fnc_existe_prod : Boolean;

  public
    { Public declarations }
    fDMCadInventario: TDMCadInventario;
  end;

var
  frmCadInventario_Prod: TfrmCadInventario_Prod;

implementation

uses DB, rsDBUtils, DmdDatabase;

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
      prc_Gravar_Itens;
    fDMCadInventario.cdsProduto.Next;
  end;
  SMDBGrid1.EnableScroll;
  if fDMCadInventario.mNaoGravados.RecordCount > 0 then
    NxFlipPanel1.Expanded := True;
end;

procedure TfrmCadInventario_Prod.prc_Gravar_Itens;
var
  //vItem: Integer;
  vTam: String;
begin
  if (trim(fDMCadInventario.cdsProdutoTAMANHO.AsString) = '') or (fDMCadInventario.cdsProdutoTAMANHO.IsNull) then
    vTam := ''
  else
    vTam := fDMCadInventario.cdsProdutoTAMANHO.AsString;
  if not vVazio then
  begin
    if fDMCadInventario.cdsProdutoID_COR_COMBINACAO.AsInteger > 0 then
    begin
      if fDMCadInventario.cdsInventario_Itens.Locate('ID_PRODUTO;TAMANHO;ID_COR',VarArrayOf([fDMCadInventario.cdsProdutoID.AsInteger,vTam,fDMCadInventario.cdsProdutoID_COR_COMBINACAO.AsInteger]),[locaseinsensitive]) then
        exit;
    end
    else
    begin
      if fDMCadInventario.cdsInventario_Itens.Locate('ID_PRODUTO;TAMANHO',VarArrayOf([fDMCadInventario.cdsProdutoID.AsInteger,vTam]),[locaseinsensitive]) then
        exit;
    end;
  end;
  vItem_Inventario := vItem_Inventario + 1;
  fDMCadInventario.cdsInventario_Itens.Insert;
  fDMCadInventario.cdsInventario_ItensID.AsInteger         := fDMCadInventario.cdsInventarioID.AsInteger;
  fDMCadInventario.cdsInventario_ItensITEM.AsInteger       := vItem_Inventario;
  fDMCadInventario.cdsInventario_ItensID_PRODUTO.AsInteger := fDMCadInventario.cdsProdutoID.AsInteger;
  fDMCadInventario.cdsInventario_ItensTAMANHO.AsString     := fDMCadInventario.cdsProdutoTAMANHO.AsString;
  //fDMCadInventario.cdsInventario_ItensQTD_ESTOQUE.AsFloat  := StrToFloat(FormatFloat('0.000000',fDMCadInventario.cdsProdutoclQtd.AsFloat));
  fDMCadInventario.cdsInventario_ItensQTD_ESTOQUE.AsFloat  := StrToFloat(FormatFloat('0.000000',fDMCadInventario.cdsProdutoQTD.AsFloat));
  if fDMCadInventario.qParametrosINV_TRAZER_QTD_ZERADA.AsString = 'S' then
    fDMCadInventario.cdsInventario_ItensQTD_INVENTARIO.AsFloat := StrToFloat(FormatFloat('0.000000',0))
  else
    fDMCadInventario.cdsInventario_ItensQTD_INVENTARIO.AsFloat := StrToFloat(FormatFloat('0.000000',fDMCadInventario.cdsProdutoQTD.AsFloat));
  fDMCadInventario.cdsInventario_ItensQTD_AJUSTE.AsFloat   := 0;
  fDMCadInventario.cdsInventario_ItensTIPO_AJUSTE.AsString := 'N';
  fDMCadInventario.cdsInventario_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.00000',fDMCadInventario.cdsProdutoPRECO_CUSTO.AsFloat));
  fDMCadInventario.cdsInventario_ItensPERC_IPI.AsFloat     := StrToFloat(FormatFloat('0.00000',fDMCadInventario.cdsProdutoPERC_IPI.AsFloat));
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

end.
