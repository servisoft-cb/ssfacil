unit UConsPedidoItemProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsPedidoProc, NxCollection, Grids, DBGrids, SMDBGrid,
  RzTabs, ExtCtrls, AdvPanel, CurrEdit, StdCtrls, RxLookup, Mask, ToolEdit,
  NxEdit, SqlExpr, DB, ComObj;

type
  TfrmConsPedidoItemProc = class(TForm)
    NxPanel1: TNxPanel;
    RzPageControl1: TRzPageControl;
    Label5: TLabel;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    Label9: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    Edit1: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Label12: TLabel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    NxComboBox1: TNxComboBox;
    Label3: TLabel;
    NxButton1: TNxButton;
    TS_Pedidos: TRzTabSheet;
    AdvPanel1: TAdvPanel;
    SMDBGrid2: TSMDBGrid;
    Shape5: TShape;
    Label30: TLabel;
    ShapeConf: TShape;
    Label68: TLabel;
    btnExcel: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid2DblClick(Sender: TObject);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsPedidoProc: TDMConsPedidoProc;

    procedure prc_Consultar_Pedido;
    procedure prc_Excel(vDados: TDataSource);

  public
    { Public declarations }
  end;

var
  frmConsPedidoItemProc: TfrmConsPedidoItemProc;

implementation

uses rsDBUtils, DmdDatabase, UConsPedidoItemProc_Itens, uUtilPadrao;

{$R *.dfm}

procedure TfrmConsPedidoItemProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedidoItemProc.FormShow(Sender: TObject);
var
  i: Integer;
begin
  fDMConsPedidoProc := TDMConsPedidoProc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedidoProc);

 fDMConsPedidoProc.cdsVendedor.Open;
 fDMConsPedidoProc.cdsFilial.Open;

  for i := 0 to SMDBGrid2.ColCount - 2 do
  begin
    if (copy(SMDBGrid2.Columns[i].FieldName,1,9) = 'PROCESSO_') then
       SMDBGrid2.Columns[i].Visible := False;
  end;

end;

procedure TfrmConsPedidoItemProc.NxButton1Click(Sender: TObject);
var
  sds: TSQLDataSet;
  i: Integer;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select PROC.ID, PROC.NOME, PROC.ORDEM_MAPA ORDEM  from PROCESSO PROC order by PROC.ORDEM_MAPA ';
    sds.Open;
    while not sds.Eof do
    begin
      for i := 0 to SMDBGrid2.ColCount - 2 do
      begin
        if (SMDBGrid2.Columns[i].FieldName = 'PROCESSO_'+FormatFloat('00',sds.FieldByName('ORDEM').AsInteger)) then
        begin
          SMDBGrid2.Columns[i].Title.Caption := sds.FieldByName('NOME').AsString;
          SMDBGrid2.Columns[i].Visible       := True;
        end;
      end;
      sds.Next;
    end;
  finally
    FreeAndNil(sds);
  end;

  fDMConsPedidoProc.cdsConsPedido.IndexFieldNames := 'NUM_PEDIDO';
  prc_Consultar_Pedido;
end;

procedure TfrmConsPedidoItemProc.prc_Consultar_Pedido;
var
  vComando : String;
begin
  vComando := '';
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND PED.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND PED.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND PED.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if RxDBLookupCombo5.Text <> '' then
    vComando := vComando + ' AND PED.ID_VENDEDOR = ' + IntToStr(RxDBLookupCombo5.KeyValue);
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND PED.PEDIDO_CLIENTE = ' + QuotedStr(Edit1.Text);
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + ' AND PED.NUM_PEDIDO = ' + IntToStr(CurrencyEdit1.AsInteger);
  case NxComboBox1.ItemIndex of
    1 : vComando := vComando + ' AND PED.FATURADO <> ' + QuotedStr('S');
    2 : vComando := vComando + ' AND PED.FATURADO = ' + QuotedStr('S');
  end;
  fDMConsPedidoProc.cdsConsPedido.Close;
  fDMConsPedidoProc.sdsConsPedido.CommandText := fDMConsPedidoProc.ctConsPedido + vComando;
  fDMConsPedidoProc.cdsConsPedido.Open;
end;

procedure TfrmConsPedidoItemProc.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if copy(Field.Name,1,22) = 'cdsConsPedidoPROCESSO_' then
  begin
    if Field.AsInteger <= 0 then
    begin
      Background  := clGray;
      AFont.Color := clGray;
    end
    else
    begin
      if (fDMConsPedidoProc.cdsConsPedido.FieldByName(Field.FieldName+'_A').AsInteger > 0) then
      begin
        if (fDMConsPedidoProc.cdsConsPedido.FieldByName(Field.FieldName).AsInteger <> fDMConsPedidoProc.cdsConsPedido.FieldByName(Field.FieldName+'_A').AsInteger) then
          Background  := clAqua
        else
          Background  := $000080FF
      end;
    end
  end;
end;

procedure TfrmConsPedidoItemProc.SMDBGrid2DblClick(Sender: TObject);
begin
  frmConsPedidoItemProc_Itens := TfrmConsPedidoItemProc_Itens.Create(self);
  frmConsPedidoItemProc_Itens.fDMConsPedidoProc := fDMConsPedidoProc;
  frmConsPedidoItemProc_Itens.ShowModal;
  FreeAndNil(frmConsPedidoItemProc_Itens);
end;

procedure TfrmConsPedidoItemProc.SMDBGrid2TitleClick(Column: TColumn);
var
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsPedidoProc.cdsConsPedido.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsPedidoItemProc.btnExcelClick(Sender: TObject);
begin
  prc_Excel(SMDBGrid2.DataSource);
end;

procedure TfrmConsPedidoItemProc.prc_Excel(vDados: TDataSource);
var
  planilha: variant;
  vTexto: string;
begin
  Screen.Cursor := crHourGlass;
  vDados.DataSet.First;

  planilha := CreateOleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do tela para o Excel';
  planilha.visible := true;

  prc_Preencher_Excel2(planilha, vDados, SMDBGrid2);

  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  vTexto := vTexto + Name + '_ConsPedido_Processos' ;

  Planilha.ActiveWorkBook.SaveAs(vTexto);
  Screen.Cursor := crDefault;
end;

end.
