unit UConsProduto_Vendedor_Fat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMComissaoVend, StdCtrls, ExtCtrls, RxLookup, NxCollection,
  Mask, ToolEdit, CurrEdit, Grids, DBGrids, SMDBGrid, DB, ComObj, RzPanel;

type
  TfrmConsProduto_Vendedor_Fat = class(TForm)
    Panel2: TPanel;
    Label6: TLabel;
    btnConsultar: TNxButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    btnExcel: TNxButton;
    Panel1: TPanel;
    Label3: TLabel;
    ceVlr_Total: TCurrencyEdit;
    Label7: TLabel;
    ceVlr_Comissao: TCurrencyEdit;
    NxButton1: TNxButton;
    gbxVendedor: TRzGroupBox;
    Label4: TLabel;
    ceBase_Comissao: TCurrencyEdit;
    Label5: TLabel;
    ceVlr_Sem_Comissao: TCurrencyEdit;
    RzGroupBox1: TRzGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ceBase_Comissao_Prod: TCurrencyEdit;
    ceVlr_Sem_Comissao_Prod: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
    fDMComissaoVend: TDMComissaoVend;

    procedure prc_Consulta;
    procedure prc_CriaExcel(vDados: TDataSource);

  public
    { Public declarations }
  end;

var
  frmConsProduto_Vendedor_Fat: TfrmConsProduto_Vendedor_Fat;

implementation

uses rsDBUtils, uUtilPadrao;

{$R *.dfm}

procedure TfrmConsProduto_Vendedor_Fat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsProduto_Vendedor_Fat.FormShow(Sender: TObject);
begin
  fDMComissaoVend := TDMComissaoVend.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMComissaoVend);
end;

procedure TfrmConsProduto_Vendedor_Fat.btnConsultarClick(Sender: TObject);
begin
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** É obrigatório informar a data inicial e final!', mtError, [mbOk], 0);
    exit;
  end;
  prc_Consulta;
end;

procedure TfrmConsProduto_Vendedor_Fat.prc_Consulta;
var
  vComando : String;
begin
  fDMComissaoVend.cdsConsProdFat.Close;
  vComando := '';
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND N.ID_VENDEDOR = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND N.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND N.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  fDMComissaoVend.sdsConsProdFat.CommandText := fDMComissaoVend.ctConsProdFat + vComando;
  fDMComissaoVend.cdsConsProdFat.Open;
end;

procedure TfrmConsProduto_Vendedor_Fat.btnExcelClick(Sender: TObject);
begin
  prc_CriaExcel(SMDBGrid1.DataSource);
end;

procedure TfrmConsProduto_Vendedor_Fat.prc_CriaExcel(vDados: TDataSource);
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

  prc_Preencher_Excel2(planilha, vDados, SMDBGrid1);

  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  vTexto := vTexto + Name + '_Produto_Vendedor_Fat';

  Planilha.ActiveWorkBook.SaveAs(vTexto);
  Screen.Cursor := crDefault;
end;

procedure TfrmConsProduto_Vendedor_Fat.NxButton1Click(Sender: TObject);
var
  vVlrTotal: Real;
  vBase_Comissao: Real;
  vVlr_Sem_Comissao: Real;
  vVlr_Comissao: Real;
  vPerc : Real;
  vVlrAux : Real;
  vBase_Comissao_Prod, vVlr_Sem_Comissao_Prod : Real;
begin
  vVlrTotal              := 0;
  vBase_Comissao         := 0;
  vVlr_Sem_Comissao      := 0;
  vVlr_Comissao          := 0;
  vBase_Comissao_Prod    := 0;
  vVlr_Sem_Comissao_Prod := 0;
  SMDBGrid1.DisableScroll;
  try
    fDMComissaoVend.cdsConsProdFat.First;
    while not fDMComissaoVend.cdsConsProdFat.Eof do
    begin
      vVlrTotal := vVlrTotal + fDMComissaoVend.cdsConsProdFatVLR_TOTAL.AsFloat;
      vPerc     := 0;
      if StrToFloat(FormatFloat('0.00',fDMComissaoVend.cdsConsProdFatPERC_ITEM_NOTA.AsFloat)) > 0 then
        vPerc := StrToFloat(FormatFloat('0.00',fDMComissaoVend.cdsConsProdFatPERC_ITEM_NOTA.AsFloat))
      else
      if StrToFloat(FormatFloat('0.00',fDMComissaoVend.cdsConsProdFatPERC_NOTA.AsFloat)) > 0 then
        vPerc := StrToFloat(FormatFloat('0.00',fDMComissaoVend.cdsConsProdFatPERC_NOTA.AsFloat));
      if StrToFloat(FormatFloat('0.00',vPerc)) > 0 then
        vBase_Comissao := vBase_Comissao + fDMComissaoVend.cdsConsProdFatVLR_TOTAL.AsFloat
      else
        vVlr_Sem_Comissao := vVlr_Sem_Comissao + fDMComissaoVend.cdsConsProdFatVLR_TOTAL.AsFloat;
      vVlrAux := 0;
      if StrToFloat(formatFloat('0.00',fDMComissaoVend.cdsConsProdFatPERC_PRODUTO_CLI.AsFloat)) > 0 then
        vVlrAux := StrToFloat(FormatFloat('0.00',((fDMComissaoVend.cdsConsProdFatVLR_TOTAL.AsFloat * fDMComissaoVend.cdsConsProdFatPERC_PRODUTO_CLI.AsFloat) / 100)))
      else
      if StrToFloat(formatFloat('0.00',fDMComissaoVend.cdsConsProdFatPERC_CADASTRADO.AsFloat)) > 0 then
        vVlrAux := StrToFloat(FormatFloat('0.00',((fDMComissaoVend.cdsConsProdFatVLR_TOTAL.AsFloat * fDMComissaoVend.cdsConsProdFatPERC_CADASTRADO.AsFloat) / 100)));
      if StrToFloat(FormatFloat('0.00',vVlrAux)) > 0 then
      begin
        vVlr_Comissao := StrToFloat(FormatFloat('0.00',vVlr_Comissao + vVlrAux));
        vBase_Comissao_Prod := vBase_Comissao_Prod + fDMComissaoVend.cdsConsProdFatVLR_TOTAL.AsFloat;
      end
      else
        vVlr_Sem_Comissao_Prod := vVlr_Sem_Comissao_Prod + fDMComissaoVend.cdsConsProdFatVLR_TOTAL.AsFloat;
      fDMComissaoVend.cdsConsProdFat.Next;
    end;
  finally
    SMDBGrid1.EnableScroll;
  end;

  ceVlr_Total.Value        := vVlrTotal;
  ceBase_Comissao.Value    := vBase_Comissao;
  ceVlr_Sem_Comissao.Value := vVlr_Sem_Comissao;

  ceVlr_Comissao.Value          := vVlr_Comissao;
  ceBase_Comissao_Prod.Value    := vBase_Comissao_Prod;
  ceVlr_Sem_Comissao_Prod.Value := vVlr_Sem_Comissao_Prod;
end;

end.
