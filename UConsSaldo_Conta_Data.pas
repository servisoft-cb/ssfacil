unit UConsSaldo_Conta_Data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, UDMCadFinanceiro,
  StdCtrls, Buttons, Mask, RxDBComb, CurrEdit, Grids, SMDBGrid, DBGrids,
  NxCollection, ToolEdit, DateUtils;

type
  TfrmConsSaldo_Conta_Data = class(TForm)
    Panel2: TPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel1: TNxPanel;
    btnConsultar: TNxButton;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    fDMCadFinanceiro : TDMCadFinanceiro;

    procedure prc_Consultar;

  public
    { Public declarations }

  end;

var
  frmConsSaldo_Conta_Data: TfrmConsSaldo_Conta_Data;

implementation

uses rsDBUtils, uUtilPadrao, UDMUtil, DmdDatabase, StrUtils, DB;

{$R *.dfm}

procedure TfrmConsSaldo_Conta_Data.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCadFinanceiro);
  Action := Cafree;
end;

procedure TfrmConsSaldo_Conta_Data.FormShow(Sender: TObject);
var
  vData : TDateTime;
begin
  fDMCadFinanceiro := TDMCadFinanceiro.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadFinanceiro);

  vData := EncodeDate(YearOf(Date),MonthOf(Date),01);
  DateEdit1.Date := vData;
  DateEdit2.Date := Date;
end;

procedure TfrmConsSaldo_Conta_Data.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F10) then
    Close;
end;


procedure TfrmConsSaldo_Conta_Data.btnConsultarClick(Sender: TObject);
var
  i : Integer;
begin
  prc_Consultar;
  fDMCadFinanceiro.cdsSaldo_Data.IndexFieldNames := 'NOME_CONTA';
  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'VLR_ENTRADA') then
    begin
      if fDMCadFinanceiro.cdsSaldo_DataagTotal_Entrada.IsNull then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadFinanceiro.cdsSaldo_DataagTotal_Entrada.Value);
    end;
    if (SMDBGrid1.Columns[i].FieldName = 'VLR_SAIDA') then
    begin
      if fDMCadFinanceiro.cdsSaldo_DataagTotal_Saida.IsNull then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadFinanceiro.cdsSaldo_DataagTotal_Saida.Value);
    end;
    if (SMDBGrid1.Columns[i].FieldName = 'clSaldo') then
    begin
      if fDMCadFinanceiro.cdsSaldo_DataagSaldo.IsNull then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadFinanceiro.cdsSaldo_DataagSaldo.Value);
    end;
  end;
  SMDBGrid1.Refresh;

end;

procedure TfrmConsSaldo_Conta_Data.prc_Consultar;
var
  vQtdAux, vQtdAux2: Real;
  vComandoAux, vComandoAux2: String;
  i: Integer;
  vTamAux: String;
begin
  fDMCadFinanceiro.cdsSaldo_Data.Close;
  i := PosEx('GROUP',fDMCadFinanceiro.ctSaldo_Data,0);
  vComandoAux  := copy(fDMCadFinanceiro.ctSaldo_Data,i,Length(fDMCadFinanceiro.ctSaldo_Data) - i + 1);
  vComandoAux2 := copy(fDMCadFinanceiro.ctSaldo_Data,1,i-1);
  if DateEdit1.Date > 10 then
    vComandoAux2 := vComandoAux2 + ' AND F.DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComandoAux2 := vComandoAux2 + ' AND F.DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  fDMCadFinanceiro.sdsSaldo_Data.CommandText := vComandoAux2 + vComandoAux;
  fDMCadFinanceiro.cdsSaldo_Data.Open;
end;

end.
