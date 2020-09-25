unit UCadDuplicata_Dev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, UDMCadDuplicata, RzPanel, 
  StdCtrls, Buttons, RxLookup, DBCtrls, DB, Mask, RxDBComb, ToolEdit, RXDBCtrl, UCadContas, CurrEdit, UCadTipoCobranca,
  NxCollection, Menus, dbXpress;

type
  TfrmCadDuplicata_Dev = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    ceVlrDevolucao: TCurrencyEdit;
    edtHistorico: TEdit;
    DtDevolucao: TDateEdit;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    Edit2: TEdit;
    Label19: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label59: TLabel;
    RxDBLookupCombo12: TRxDBLookupCombo;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ceVlrDevolucaoExit(Sender: TObject);
    procedure ceVlrDevolucaoKeyPress(Sender: TObject; var Key: Char);
    procedure ceVlrDevolucaoEnter(Sender: TObject);
    procedure DtDevolucaoExit(Sender: TObject);
    procedure ceAdtoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    ffrmCadContas: TfrmCadContas;
    ffrmCadTipoCobranca: TfrmCadTipoCobranca;
    vVlrSaldo_Adto : Real;
    
    function fnc_Erro: Boolean;
    procedure prc_Calcular_Total;
    procedure prc_Le_qContas;

  public
    { Public declarations }
    fDMCadDuplicata: TDMCadDuplicata;
  end;

var
  frmCadDuplicata_Dev: TfrmCadDuplicata_Dev;

implementation

uses rsDBUtils, uUtilPadrao, UDMUtil, DmdDatabase, UCadDuplicata_Cheque,
  USel_Cheque, uUtilCliente;

{$R *.dfm}

procedure TfrmCadDuplicata_Dev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMCadDuplicata.cdsDuplicata.State in [dsEdit,dsInsert] then
    fDMCadDuplicata.cdsDuplicata.Cancel;
  Action := Cafree;
end;

procedure TfrmCadDuplicata_Dev.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadDuplicata);
  fDMCadDuplicata.mCheque.EmptyDataSet;
  if fDMCadDuplicata.cdsDuplicataID_TIPOCOBRANCA.AsInteger > 0 then
    RxDBLookupCombo1.KeyValue := fDMCadDuplicata.cdsDuplicataID_TIPOCOBRANCA.AsInteger;
  if (fDMCadDuplicata.cdsDuplicataID_VENDEDOR.AsInteger > 0) and (fDMCadDuplicata.cdsVendedor.Locate('CODIGO',fDMCadDuplicata.cdsDuplicataID_VENDEDOR.AsInteger,[loCaseInsensitive])) then
    Edit2.Text := fDMCadDuplicata.cdsVendedorNOME.AsString;
  fDMCadDuplicata.mCheque.EmptyDataSet;
  cePagamento.Value := fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat;
  prc_Calcular_Total;
  Label25.Visible        := (fDMCadDuplicata.cdsDuplicataTIPO_ES.AsString = 'E');
  ceTaxaBancaria.Visible := (fDMCadDuplicata.cdsDuplicataTIPO_ES.AsString = 'E');
  if (fDMCadDuplicata.cdsDuplicataID_CONTA.AsInteger <= 0) and (fDMCadDuplicata.cdsDuplicataID_CONTA_BOLETO.AsInteger > 0) then
  begin
    fDMCadDuplicata.cdsDuplicata.Edit;
    fDMCadDuplicata.cdsDuplicataID_CONTA.AsInteger := fDMCadDuplicata.cdsDuplicataID_CONTA_BOLETO.AsInteger;
  end;
  Label1.Visible  := (fDMCadDuplicata.qParametros_FinMOSTRAR_VLR_MULTA_DUP.AsString = 'S');
  ceMulta.Visible := (fDMCadDuplicata.qParametros_FinMOSTRAR_VLR_MULTA_DUP.AsString = 'S');
  //*****************
  vVlrSaldo_Adto := 0;
end;

function TfrmCadDuplicata_Dev.fnc_Erro: Boolean;
var
  vMsgErro: String;
begin
  Result   := True;
  vMsgErro := '';
  if DtDevolucao.Date <= 10 then
    vMsgErro := vMsgErro + #13 + '*** Data de devolução não informada!';
  if DtDevolucao.Date <= fDMCadDuplicata.cdsDuplicataDTEMISSAO.AsDateTime then
    vMsgErro := vMsgErro + #13 + '*** Data de devolução não pode ser menor que a data de emissão!';
  if (ceVlrDevolucao.Value <= 0) then
    vMsgErro := vMsgErro + #13 + '*** Valor de Devolução não informada!';
  if vMsgErro <> '' then
  begin
    MessageDlg(vMsgErro, mtError, [mbOk], 0);
    exit;
  end;
  Result := False;
end;

procedure TfrmCadDuplicata_Dev.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F10) then
    BitBtn4Click(Sender);
end;


procedure TfrmCadDuplicata_Dev.ceVlrDevolucaoExit(Sender: TObject);
var
  vDif : Real;
begin
  if fDMCadDuplicata.qContasID.AsInteger <> fDMCadDuplicata.cdsDuplicataID_CONTA.AsInteger then
    prc_Le_qContas;
  if fDMCadDuplicata.qContasTIPO_CONTA.AsString = 'A' then
  begin
    if StrToFloat(FormatFloat('0.00',cePagamento.Value)) > StrToFloat(FormatFloat('0.00',vVlrSaldo_Adto)) then
    begin
      MessageDlg('*** Valor de pagamento maior que o saldo de crédito!', mtError, [mbOk], 0);
      cePagamento.SetFocus;
      exit;
    end;
  end;

  if StrToFloat(FormatFloat('0.00',cePagamento.Value)) < StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat)) then
    ceDesconto.Value := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat - cePagamento.Value))
  else
  if StrToFloat(FormatFloat('0.00',cePagamento.Value)) > StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat)) then
  begin
    ceJuros.Value  := StrToFloat(FormatFloat('0.00',cePagamento.Value - fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat));
    cePagamento.Value := StrToFloat(FormatFloat('0.00',cePagamento.Value - ceJuros.Value));
  end
  else
  if StrToFloat(FormatFloat('0.00',fDMCadDuplicata.qParametrosPERC_JUROS_PADRAO.AsFloat)) <= 0 then
    ceJuros.Value     := StrToFloat(FormatFloat('0.00',0))
  else
    ceJuros.Value     := StrToFloat(FormatFloat('0.00',ceJuros_Calculado.Value));
  prc_Calcular_Total;
end;

procedure TfrmCadDuplicata_Dev.ceVlrDevolucaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '.' then
    key := ',';
end;

procedure TfrmCadDuplicata_Dev.ceVlrDevolucaoEnter(Sender: TObject);
begin
  cePagamento.ReadOnly := not(fDMCadDuplicata.mCheque.IsEmpty);
end;

procedure TfrmCadDuplicata_Dev.DtDevolucaoExit(Sender: TObject);
var
  vQtd_Dias: Integer;
  vVlr_Juros_Aux: Real;
begin
  vQtd_Dias := fDMCadDuplicata.fnc_Qtd_Dias(fDMCadDuplicata.cdsDuplicataDTVENCIMENTO.AsDateTime,DtPagamento.date);
  if vQtd_Dias > 0 then
    vVlr_Juros_Aux := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.fnc_Calcular_Juros(vQtd_Dias,fDMCadDuplicata.qParametrosPERC_JUROS_PADRAO.AsFloat,fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat)))
  else
    vVlr_Juros_Aux := StrToFloat(FormatFloat('0.00',0));
  ceJuros.Value           := vVlr_Juros_Aux;
  ceJuros_Calculado.Value := vVlr_Juros_Aux;
  ceMulta.Value           := 0;
  if vQtd_Dias > 0 then
    Label20.Caption := IntToStr(vQtd_Dias) + ' Dia(s) em atraso     ' + FormatFloat('0.00',fDMCadDuplicata.qParametrosPERC_JUROS_PADRAO.AsFloat) + '% de juros';
  Label20.Visible := (vQtd_Dias >  0);
  prc_Calcular_Total;
end;

procedure TfrmCadDuplicata_Dev.prc_Calcular_Total;
var
  vAux: Real;
begin
  //vAux            := cePagamento.Value + ceJuros.Value + ceDespesas.Value - ceDesconto.Value - ceTaxaBancaria.Value;
  vAux            := cePagamento.Value + ceJuros.Value + ceMulta.Value + ceDespesas.Value - ceTaxaBancaria.Value;
  Label24.Caption := FormatFloat('###,##0.00',vAux);
end;

procedure TfrmCadDuplicata_Dev.ceAdtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '.' then
    key := ',';
end;

procedure TfrmCadDuplicata_Dev.prc_Le_qContas;
begin
  fDMCadDuplicata.qContas.Close;
  fDMCadDuplicata.qContas.ParamByName('ID').AsInteger := fDMCadDuplicata.cdsDuplicataID_CONTA.AsInteger;
  fDMCadDuplicata.qContas.Open;
end;

procedure TfrmCadDuplicata_Dev.btnConfirmarClick(Sender: TObject);
var
  ID: TTransactionDesc;
  vIDAux: Integer;
  vGravar_Fin: Boolean;
  vComDesconto: String;
  vVlrCheque: Real;
  vVlrAux: Real;
begin
  if fnc_Erro then
    exit;
  if (StrToFloat(FormatFloat('0.00',cePagamento.Value)) < StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat))) and
     (StrToFloat(FormatFloat('0.00',ceDesconto.Value)) > 0) then
    if MessageDlg('Confirmar duplicata com desconto?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;

  if fDMCadDuplicata.mCheque.RecordCount > 0 then
  begin
    vVlrCheque := 0;
    fDMCadDuplicata.mCheque.First;
    while not fDMCadDuplicata.mCheque.Eof do
    begin
      vVlrCheque := StrToFloat(FormatFloat('0.00',vVlrCheque + fDMCadDuplicata.mChequeVlr_Cheque.AsFloat));
      fDMCadDuplicata.mCheque.Next;
    end;
    vVlrAux := cePagamento.Value + ceJuros.Value + ceMulta.Value + ceDespesas.Value - ceTaxaBancaria.Value;
    if StrToFloat(FormatFloat('0.00',vVlrAux)) <> StrToFloat(FormatFloat('0.00',vVlrCheque)) then
    begin
      MessageDlg('*** Valores do Cheque diferente do valor da parcela!' + #13 +
                 '    Para confirmar Atualizar Valor Pagto.' , mtError, [mbOk], 0);
      exit;
    end;
  end;

  ID.TransactionID  := 2;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    if not(fDMCadDuplicata.cdsDuplicata.State in [dsEdit,dsInsert]) then
      fDMCadDuplicata.cdsDuplicata.Edit;
    if fDMCadDuplicata.cdsDuplicataID_CONTA.AsInteger <> fDMCadDuplicata.cdsContasID.AsInteger then
      fDMCadDuplicata.cdsContas.Locate('ID',fDMCadDuplicata.cdsDuplicataID_CONTA.AsInteger,[loCaseInsensitive]);
    prc_Le_qContas;
    if fDMCadDuplicata.cdsContasID_BANCO.AsInteger > 0 then
      fDMCadDuplicata.cdsDuplicataID_BANCO.AsInteger := fDMCadDuplicata.cdsContasID_BANCO.AsInteger
    else
      fDMCadDuplicata.cdsDuplicataID_BANCO.Clear;
    fDMCadDuplicata.cdsDuplicataDTULTPAGAMENTO.AsDateTime := DtPagamento.Date;
    fDMCadDuplicata.cdsDuplicataVLR_PAGO.AsFloat          := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_PAGO.AsFloat + cePagamento.Value));
    fDMCadDuplicata.cdsDuplicataVLR_JUROSPAGOS.AsFloat    := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_JUROSPAGOS.AsFloat + ceJuros.Value));
    fDMCadDuplicata.cdsDuplicataVLR_DESCONTO.AsFloat      := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_DESCONTO.AsFloat + ceDesconto.Value));
    fDMCadDuplicata.cdsDuplicataVLR_DESPESAS.AsFloat      := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_DESPESAS.AsFloat + ceDespesas.Value));
    fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat      := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat - cePagamento.Value - ceDesconto.Value));
    fDMCadDuplicata.cdsDuplicataVLR_TAXA_BANCARIA.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_TAXA_BANCARIA.AsFloat + ceTaxaBancaria.Value));
    fDMCadDuplicata.cdsDuplicataVLR_MULTA.AsFloat         := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_MULTA.AsFloat + ceMulta.Value));
    //05/06/2020
    if fDMCadDuplicata.qContasTIPO_CONTA.AsString = 'A' then
      fDMCadDuplicata.cdsDuplicataVLR_ADTO_USADO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_ADTO_USADO.AsFloat + cePagamento.Value + ceJuros.Value));
    //*****************

    if ckCartorio.Checked then
      fDMCadDuplicata.cdsDuplicataPAGO_CARTORIO.AsString := 'S'
    else
      fDMCadDuplicata.cdsDuplicataPAGO_CARTORIO.AsString := 'N';
    fDMCadDuplicata.cdsDuplicata.Post;
    if RxDBLookupCombo1.Text <> '' then
      vIDAux := RxDBLookupCombo1.KeyValue
    else
      vIDAux := 0;

    fDMCadDuplicata.prc_Gravar_Dupicata_Hist('PAG',Edit1.Text,cePagamento.Value,ceJuros.Value,ceDesconto.Value,ceDespesas.Value,ceTaxaBancaria.Value,ceMulta.Value,vIDAux);

    //Foi incluida na versão .390
    if ((fDMCadDuplicata.mCheque.RecordCount <= 0) or ((fDMCadDuplicata.mCheque.RecordCount > 0) and (fDMCadDuplicata.cdsDuplicataTIPO_ES.AsString = 'E'))) then
    begin
      vComDesconto := '';
      if ceDesconto.Value > 0 then
        vComDesconto := 'S';
      //IF colocado dia 05/06/2020 do tipo da conta
      if fDMCadDuplicata.qContasTIPO_CONTA.AsString = 'A' then
      begin
        if cePagamento.Value > 0 then
          fDMCadDuplicata.prc_Gravar_Financeiro(cePagamento.Value + ceJuros.Value,'P',vIDAux,vComDesconto);
      end
      else
      if (fDMCadDuplicata.qContasTIPO_CONTA.AsString <> 'A') then
      begin
        if cePagamento.Value > 0 then
          fDMCadDuplicata.prc_Gravar_Financeiro(cePagamento.Value,'P',vIDAux,vComDesconto);
        if ceJuros.Value > 0 then
          fDMCadDuplicata.prc_Gravar_Financeiro(ceJuros.Value,'J',vIDAux);
        if ceMulta.Value > 0 then
          fDMCadDuplicata.prc_Gravar_Financeiro(ceMulta.Value,'M',vIDAux);
        if ceDespesas.Value > 0 then
          fDMCadDuplicata.prc_Gravar_Financeiro(ceDespesas.Value,'D',vIDAux);
        if ceTaxaBancaria.Value > 0 then
          fDMCadDuplicata.prc_Gravar_Financeiro(ceTaxaBancaria.Value,'T',vIDAux);
      end;
    end;

    if fDMCadDuplicata.cdsDuplicata.State in [dsEdit,dsInsert] then
      fDMCadDuplicata.cdsDuplicata.Post;
    fDMCadDuplicata.cdsDuplicata.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

//    fDMCadDuplicata.mCheque.EmptyDataSet;
  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  Close;
end;

procedure TfrmCadDuplicata_Dev.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  Close;
end;

end.

