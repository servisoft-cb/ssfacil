unit UConsSaldo_Conta_Data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, UDMCadFinanceiro,
  StdCtrls, Buttons, Mask, RxDBComb, CurrEdit, Grids, SMDBGrid, DBGrids,
  NxCollection, ToolEdit, DateUtils, SqlExpr;

type
  TfrmConsSaldo_Conta_Data = class(TForm)
    Panel2: TPanel;
    NxPanel1: TNxPanel;
    btnConsultar: TNxButton;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    fDMCadFinanceiro : TDMCadFinanceiro;

    procedure prc_Consultar;
    procedure prc_Le_Conta;

  public
    { Public declarations }
    vIDFilial_Local : Integer;
    vIDConta_Local : Integer;

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
  prc_Le_Conta;
  fDMCadFinanceiro.mSaldo_Conta.IndexFieldNames := 'Nome_Conta';
  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'VLR_ENTRADA') then
    begin
      if trim(fDMCadFinanceiro.mSaldo_ContaagTotal_Entrada.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadFinanceiro.mSaldo_ContaagTotal_Entrada.Value);

    end;
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'VLR_SAIDA') then
    begin
      if trim(fDMCadFinanceiro.mSaldo_ContaagTotal_Saida.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadFinanceiro.mSaldo_ContaagTotal_Saida.Value);
    end;
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'VLR_SALDO') then
    begin
      if trim(fDMCadFinanceiro.mSaldo_ContaagSaldo.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadFinanceiro.mSaldo_ContaagSaldo.Value);
    end;
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'VLR_CHEQUE_ABERTO') then
    begin
      if trim(fDMCadFinanceiro.mSaldo_ContaagTotal_Cheque.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadFinanceiro.mSaldo_ContaagTotal_Cheque.Value);
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
  if DateEdit2.Date > 10 then
    vComandoAux2 := vComandoAux2 + ' AND F.DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if vIDFilial_Local > 0 then
    vComandoAux2 := vComandoAux2 + ' AND F.FILIAL = ' + IntToStr(vIDFilial_Local);
  if vIDConta_Local > 0 then
    vComandoAux2 := vComandoAux2 + ' AND F.ID_CONTA = ' + IntToStr(vIDConta_Local);
  fDMCadFinanceiro.sdsSaldo_Data.CommandText := vComandoAux2 + vComandoAux;
  fDMCadFinanceiro.cdsSaldo_Data.Open;
end;

procedure TfrmConsSaldo_Conta_Data.prc_Le_Conta;
var
  sds: TSQLDataSet;
begin
  fDMCadFinanceiro.mSaldo_Conta.EmptyDataSet;
  fDMCadFinanceiro.cdsContas.Close;
  fDMCadFinanceiro.cdsContas.Open;
  sds  := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata  := True;
    sds.GetMetadata := False;
    fDMCadFinanceiro.cdsContas.First;
    while not fDMCadFinanceiro.cdsContas.Eof do
    begin
      if (vIDConta_Local <= 0) or (vIDConta_Local = fDMCadFinanceiro.cdsContasID.AsInteger) then
      begin
        fDMCadFinanceiro.mSaldo_Conta.Insert;
        fDMCadFinanceiro.mSaldo_ContaID_Conta.AsInteger  := fDMCadFinanceiro.cdsContasID.AsInteger;
        fDMCadFinanceiro.mSaldo_ContaNome_Conta.AsString := fDMCadFinanceiro.cdsContasNOME.AsString;
        if fDMCadFinanceiro.cdsSaldo_Data.Locate('ID',fDMCadFinanceiro.cdsContasID.AsInteger,[loCaseInsensitive]) then
        begin
          fDMCadFinanceiro.mSaldo_ContaVlr_Entrada.AsFloat := fDMCadFinanceiro.cdsSaldo_DataVLR_ENTRADA.AsFloat;
          fDMCadFinanceiro.mSaldo_ContaVlr_Saida.AsFloat   := fDMCadFinanceiro.cdsSaldo_DataVLR_SAIDA.AsFloat;
          fDMCadFinanceiro.mSaldo_ContaVlr_Saldo.AsFloat   := fDMCadFinanceiro.cdsSaldo_DataclSaldo.AsFloat;
        end;
        sds.Close;
        sds.CommandText := 'select sum(ch.valor) VLR_CHEQUE from cheque ch WHERE CH.id_conta = ' + IntToStr(fDMCadFinanceiro.cdsContasID.AsInteger)
                         + ' AND CH.dtcompensado IS NULL ';
        if DateEdit2.Date > 10 then
        begin
          sds.CommandText := sds.CommandText + ' AND CH.dtbom_para <= :DTCHEQUE ';
          sds.ParamByName('DTCHEQUE').AsDate := DateEdit2.Date;
        end;
        sds.Open;
        fDMCadFinanceiro.mSaldo_ContaVlr_Cheque_Aberto.AsFloat := sds.FieldByName('VLR_CHEQUE').AsFloat;
        fDMCadFinanceiro.mSaldo_Conta.Post;
      end;

      fDMCadFinanceiro.cdsContas.Next;
    end;

  finally
    FreeAndNil(sds);
  end;



end;

end.
