unit uGrava_Pedido;

interface

uses
  Classes, SysUtils, DB, Dialogs, Variants, SqlExpr, DmdDatabase, UDMCadPedido, dbXPress, UDMAprovacao_Ped, UDMEstoque,
  UDMGravarFinanceiro, Forms;

procedure prc_Gravar(fDMCadPedido: TDMCadPedido; Tipo: String = '');
procedure Gravar_Duplicata(fDMCadPedido: TDMCadPedido; Tipo, TransfICMS: String; Parcela: Integer; Valor: Real; Data: TDateTime; Prazo: String = '');
                                               //Tipo  P= Contas a Pagar   R= Contas a Receber
                                               //Prazo = ENT=Entrada  AVI=Avista
procedure Gravar_Dupicata_Hist(fDMCadPedido: TDMCadPedido; Tipo: String);

procedure prc_Excluir_Pedido(fDMCadPedido: TDMCadPedido);
procedure Excluir_Duplicata_Ped(ID: Integer);
procedure prc_Excluir_Item_Ped(fDMCadPedido: TDMCadPedido);
procedure prc_Gravar_cdsHist_Senha(fDMCadPedido: TDMCadPedido);
procedure prc_Inserir_Ped(fDMCadPedido: TDMCadPedido);
procedure prc_Alterar_Item_Tam(fDMCadPedido: TDMCadPedido; ID_Cor, Item, Item_Original: Integer; Preco, Perc_IPI, Perc_ICMS: Real;
                               DtEntrega: TDateTime; Carimbo,Caixinha: String);

procedure prc_Gravar_Financeiro(fDMCadPedido: TDMCadPedido; Tipo: string);//ENT=Entrada   AVI= Avista
procedure prc_Gravar_mProcesso_Sel(fDMCadPedido: TDMCadPedido);
procedure prc_Gravar_Pedido_Item_Processo(fDMCadPedido: TDMCadPedido);

function fnc_Existe_OC(fDMCadPedido: TDMCadPedido): Integer;
function fnc_Verificar_Vendedor_Int(fDMCadPedido: TDMCadPedido; ID: Integer): Integer;


implementation

uses
  DateUtils, uUtilPadrao, uCalculo_Pedido;

procedure Gravar_Dupicata_Hist(fDMCadPedido: TDMCadPedido; Tipo: String);
var
  vItemAux: Integer;
begin
  fDMCadPedido.cdsDuplicata_Hist.Last;
  vItemAux := fDMCadPedido.cdsDuplicata_HistITEM.AsInteger;
  vItemAux := vItemAux + 1;

  fDMCadPedido.cdsDuplicata_Hist.Insert;
  fDMCadPedido.cdsDuplicata_HistID.AsInteger               := fDMCadPedido.cdsDuplicataID.AsInteger;
  fDMCadPedido.cdsDuplicata_HistITEM.AsInteger             := vItemAux;
  fDMCadPedido.cdsDuplicata_HistTIPO_HISTORICO.AsString    := 'ENT';
  fDMCadPedido.cdsDuplicata_HistID_HISTORICO.AsInteger     := 0;
  fDMCadPedido.cdsDuplicata_HistVLR_LANCAMENTO.AsFloat     := fDMCadPedido.cdsDuplicataVLR_PARCELA.AsFloat;
  fDMCadPedido.cdsDuplicata_HistVLR_JUROSPAGOS.AsFloat     := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicata_HistVLR_MULTA.AsFloat          := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicata_HistVLR_DESCONTOS.AsFloat      := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicata_HistVLR_DESPESAS.AsFloat       := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicata_HistVLR_DEVOLUCAO.AsFloat      := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicata_HistVLR_JUROSCALCULADO.AsFloat := StrToFloat(FormatFloat('0.00',0));
  if Tipo = 'ENT' then
  begin
    fDMCadPedido.cdsDuplicata_HistCOMPLEMENTO.AsString  := 'ENTRADA DO T�TULO';
    fDMCadPedido.cdsDuplicata_HistVLR_PAGAMENTO.AsFloat := StrToFloat(FormatFloat('0.00',0));
  end
  else if Tipo = 'PAG' then
  begin
    fDMCadPedido.cdsDuplicata_HistTIPO_HISTORICO.AsString      := 'PAG';
    fDMCadPedido.cdsDuplicata_HistCOMPLEMENTO.AsString         := 'PAGAMENTO DO T�TULO';
    fDMCadPedido.cdsDuplicata_HistVLR_PAGAMENTO.AsFloat        := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsDuplicataVLR_PARCELA.AsFloat));
    fDMCadPedido.cdsDuplicata_HistVLR_LANCAMENTO.AsFloat       := 0;
    fDMCadPedido.cdsDuplicata_HistID_FORMA_PAGAMENTO.AsInteger := fDMCadPedido.cdsDuplicataID_TIPOCOBRANCA.AsInteger;
  end;
  fDMCadPedido.cdsDuplicata_HistDTHISTORICO.AsDateTime  := Date;
  fDMCadPedido.cdsDuplicata_HistDTLANCAMENTO.AsDateTime := fDMCadPedido.cdsDuplicataDTEMISSAO.AsDateTime;
  fDMCadPedido.cdsDuplicata_HistNUMCHEQUE.AsInteger     := 0;
  fDMCadPedido.cdsDuplicata_HistDTPREVISAO_CHEQUE.Clear;
  if fDMCadPedido.cdsDuplicataID_CONTA.AsInteger > 0 then
    fDMCadPedido.cdsDuplicata_HistID_CONTA.AsInteger := fDMCadPedido.cdsDuplicataID_CONTA.AsInteger;
  fDMCadPedido.cdsDuplicata_HistID_COMISSAO.AsInteger   := 0;
  fDMCadPedido.cdsDuplicata_HistTIPO_ES.AsString        := fDMCadPedido.cdsDuplicataTIPO_ES.AsString;
  fDMCadPedido.cdsDuplicata_Hist.Post;

  if Tipo = 'PAG' then
  begin
    if fDMCadPedido.cdsCondPgtoTIPO.AsString = 'V' then
    begin
      //prc_Gravar_Comissao(fDMCadPedido,'AVI');
      prc_Gravar_Financeiro(fDMCadPedido,'AVI');
    end
    else
    begin
      //prc_Gravar_Comissao(fDMCadPedido,'ENT');
      prc_Gravar_Financeiro(fDMCadPedido,'ENT');
    end
  end;                                              
end;     

procedure Gravar_Duplicata(fDMCadPedido: TDMCadPedido; Tipo, TransfICMS: String; Parcela: Integer; Valor: Real; Data: TDateTime; Prazo: String = '');
var
  vAux: Integer;
begin
  if not fDMCadPedido.cdsDuplicata.Active then
    fDMCadPedido.Abrir_cdsDuplicata(0);

  vAux := dmDatabase.ProximaSequencia('DUPLICATA',0);

  fDMCadPedido.cdsDuplicata.Insert;
  fDMCadPedido.cdsDuplicataID.AsInteger := vAux;
  fDMCadPedido.cdsDuplicataTIPO_ES.AsString := 'E';
  fDMCadPedido.cdsDuplicataFILIAL.AsInteger        := fDMCadPedido.cdsPedidoFILIAL.AsInteger;
  fDMCadPedido.cdsDuplicataID_PEDIDO.AsInteger     := fDMCadPedido.cdsPedidoID.AsInteger;
  fDMCadPedido.cdsDuplicataPARCELA.AsInteger       := Parcela;
  fDMCadPedido.cdsDuplicataNUMDUPLICATA.AsString   := 'PED.' + fDMCadPedido.cdsPedidoNUM_PEDIDO.AsString;
  fDMCadPedido.cdsDuplicataDTVENCIMENTO.AsDateTime := Data;
  fDMCadPedido.cdsDuplicataVLR_PARCELA.AsFloat     := StrToFloat(FormatFloat('0.00',Valor));
  fDMCadPedido.cdsDuplicataVLR_RESTANTE.AsFloat    := StrToFloat(FormatFloat('0.00',Valor));
  fDMCadPedido.cdsDuplicataVLR_PAGO.AsFloat        := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicataVLR_DEVOLUCAO.AsFloat   := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicataVLR_DESPESAS.AsFloat    := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicataVLR_DESCONTO.AsFloat    := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicataVLR_JUROSPAGOS.AsFloat  := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicataVLR_MULTA.AsFloat       := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicataVLR_COMISSAO.AsFloat    := StrToFloat(FormatFloat('0.00',0));
  fDMCadPedido.cdsDuplicataPERC_BASE_COMISSAO.AsFloat := 100;
  //10/11/2015
  //fDMCadPedido.cdsDuplicataPERC_COMISSAO.AsFloat   := StrToFloat(FormatFloat('0.00',cdsPedidoPERC_COMISSAO.AsFloat));
  fDMCadPedido.cdsDuplicataPERC_COMISSAO.AsFloat   := StrToFloat(FormatFloat('0.00000',fDMCadPedido.vPerc_Comissao_Rateio));
  fDMCadPedido.cdsDuplicataDTULTPAGAMENTO.Clear;
  fDMCadPedido.cdsDuplicataID_PESSOA.AsInteger     := fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger;
  if fDMCadPedido.cdsPedidoID_VENDEDOR.AsInteger > 0 then
    fDMCadPedido.cdsDuplicataID_VENDEDOR.AsInteger := fDMCadPedido.cdsPedidoID_VENDEDOR.AsInteger;

  if ((Prazo = 'AVI') and (fDMCadPedido.cdsParametrosQUITAR_AVISTA_AUT.AsString = 'S')) then
  begin
    if fDMCadPedido.cdsPedidoID_CONTA.AsInteger > 0 then
      fDMCadPedido.cdsDuplicataID_CONTA.AsInteger := fDMCadPedido.cdsPedidoID_CONTA.AsInteger;
    if fDMCadPedido.cdsPedidoID_TIPO_COBRANCA.AsInteger > 0 then
      fDMCadPedido.cdsDuplicataID_TIPOCOBRANCA.AsInteger := fDMCadPedido.cdsPedidoID_TIPO_COBRANCA.AsInteger;
    if fDMCadPedido.cdsPedidoID_CONTA.AsInteger > 0 then
      fDMCadPedido.cdsDuplicataID_CONTA_BOLETO.AsInteger := fDMCadPedido.cdsPedidoID_CONTA.AsInteger;
    fDMCadPedido.cdsDuplicataDTULTPAGAMENTO.AsDateTime := Date;
    fDMCadPedido.cdsDuplicataVLR_RESTANTE.AsFloat := StrToFloat(FormatFloat('0.00', 0));
    fDMCadPedido.cdsDuplicataVLR_PAGO.AsFloat := StrToFloat(FormatFloat('0.00', Valor));
  end
  else
  begin
    if fDMCadPedido.cdsPedido_ParcID_CONTA.AsInteger > 0 then
      fDMCadPedido.cdsDuplicataID_CONTA.AsInteger        := fDMCadPedido.cdsPedido_ParcID_CONTA.AsInteger;
    if fDMCadPedido.cdsPedido_ParcID_TIPOCOBRANCA.AsInteger > 0 then
      fDMCadPedido.cdsDuplicataID_TIPOCOBRANCA.AsInteger := fDMCadPedido.cdsPedido_ParcID_TIPOCOBRANCA.AsInteger;
    if fDMCadPedido.cdsPedido_ParcID_CONTA.AsInteger > 0 then
      fDMCadPedido.cdsDuplicataID_CONTA_BOLETO.AsInteger := fDMCadPedido.cdsPedido_ParcID_CONTA.AsInteger;
    if (Prazo = 'ENT') then
    begin
      fDMCadPedido.cdsDuplicataDTULTPAGAMENTO.AsDateTime := Date;
      fDMCadPedido.cdsDuplicataVLR_RESTANTE.AsFloat      := StrToFloat(FormatFloat('0.00', 0));
      fDMCadPedido.cdsDuplicataVLR_PAGO.AsFloat          := StrToFloat(FormatFloat('0.00', Valor));
    end;
  end;

  fDMCadPedido.cdsDuplicataID_COMISSAO.AsInteger       := 0;
  fDMCadPedido.cdsDuplicataQTD_DIASATRASO.AsInteger    := 0;
  fDMCadPedido.cdsDuplicataDTRECEBIMENTO_TITULO.Clear;
  fDMCadPedido.cdsDuplicataDTEMISSAO.AsDateTime        := fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime;
  fDMCadPedido.cdsDuplicataPAGO_CARTORIO.AsString      := 'N';
  fDMCadPedido.cdsDuplicataPROTESTADO.AsString         := 'N';
  fDMCadPedido.cdsDuplicataTIPO_LANCAMENTO.AsString    := 'PED';
  fDMCadPedido.cdsDuplicataARQUIVO_GERADO.AsString     := 'N';
  fDMCadPedido.cdsDuplicataTRANSFERENCIA_ICMS.AsString := TransfICMS;
  fDMCadPedido.cdsDuplicataNOSSONUMERO.AsString        := '';
  fDMCadPedido.cdsDuplicataDTFINANCEIRO.Clear;
  fDMCadPedido.cdsDuplicataNUMCHEQUE.AsInteger         := 0;
  fDMCadPedido.cdsDuplicataACEITE.AsString             := '';
  if fDMCadPedido.cdsPedidoID_CONTA_ORCAMENTO.AsInteger > 0 then
    fDMCadPedido.cdsDuplicataID_CONTA_ORCAMENTO.AsInteger :=  fDMCadPedido.cdsPedidoID_CONTA_ORCAMENTO.AsInteger
  else
    fDMCadPedido.cdsDuplicataID_CONTA_ORCAMENTO.Clear;
  fDMCadPedido.cdsDuplicataTITULO_CARTORIO.AsString := 'N';
  if fDMCadPedido.cdsDuplicataID_CONTA.AsInteger > 0 then
  begin
    if not fDMCadPedido.cdsContas.Locate('ID',fDMCadPedido.cdsDuplicataID_CONTA.AsInteger,([Locaseinsensitive])) then
      fDMCadPedido.cdsDuplicataID_CONTA.Clear;
  end;
  if fDMCadPedido.cdsDuplicataID_BANCO.AsInteger > 0 then
  begin
    if not fDMCadPedido.cdsContas.Locate('ID',fDMCadPedido.cdsDuplicataID_BANCO.AsInteger,([Locaseinsensitive])) then
      fDMCadPedido.cdsDuplicataID_BANCO.Clear;
  end;
  //12/07/2016
  if vTerminal <= 0 then
    fDMCadPedido.cdsDuplicataID_TERMINAL.Clear
  else
    fDMCadPedido.cdsDuplicataID_TERMINAL.AsInteger := vTerminal;
  fDMCadPedido.cdsDuplicata.Post;

  Gravar_Dupicata_Hist(fDMCadPedido,'ENT');
  //02/12/2019 Foi incluido para quitar o a vista
  if (Prazo = 'ENT') or ((Prazo = 'AVI') and (fDMCadPedido.cdsParametrosQUITAR_AVISTA_AUT.AsString = 'S')) then
    Gravar_Dupicata_Hist(fDMCadPedido, 'PAG');
  //********************
  fDMCadPedido.cdsDuplicata.ApplyUpdates(0);
end;

function fnc_Existe_OC(fDMCadPedido: TDMCadPedido): Integer;
begin
  Result := 0;
  if fDMCadPedido.cdsParametrosPERMITE_MESMA_OC.AsString = 'S' then
    exit;
  if trim(fDMCadPedido.cdsPedidoPEDIDO_CLIENTE.AsString) = '' then
    exit;
  if fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger <= 0 then
    exit;
  fDMCadPedido.qVerifica_OC.Close;
  fDMCadPedido.qVerifica_OC.ParamByName('PEDIDO_CLIENTE').AsString := fDMCadPedido.cdsPedidoPEDIDO_CLIENTE.AsString;
  fDMCadPedido.qVerifica_OC.ParamByName('ID_CLIENTE').AsInteger    := fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger;
  fDMCadPedido.qVerifica_OC.Open;
  if not(fDMCadPedido.qVerifica_OC.IsEmpty) and (fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger > 0) and (fDMCadPedido.cdsPedidoID.AsInteger <> fDMCadPedido.qVerifica_OCID.AsInteger) then
    Result := fDMCadPedido.qVerifica_OCNUM_PEDIDO.AsInteger;
end;

procedure prc_Gravar(fDMCadPedido: TDMCadPedido; Tipo: String = '');
var
  sds: TSQLDataSet;
  ID: TTransactionDesc;
  vSerie: String;
  vNumAux: Integer;
  vAux: Integer;
  vID_Estoque,vVerificaCampos: Integer;
  vDescAux: Real;
  vQtdAux: Real;
  vQtdOriAux: Real;
  vUnidade: String;
  vVlrAux: Real;
  vComissaoAux: Real;
  vFlag: Boolean;
  vPercAux: Real;
  fDMAprovacao_Ped: TDMAprovacao_Ped;
  fDMEstoque: TDMEstoque;
  vGravou: Boolean;
  vID: Integer;
  Flag: Boolean;
  Form: TForm;
begin
  fDMCadPedido.vMSGErro := '';
  vGravou  := False;
  vVerificaCampos := 0;
  if fDMCadPedido.cdsCondPgtoID.AsInteger <> fDMCadPedido.cdsPedidoID_CONDPGTO.AsInteger then
    fDMCadPedido.cdsCondPgto.Locate('ID',fDMCadPedido.cdsPedidoID_CONDPGTO.AsInteger,([Locaseinsensitive]));
  if (trim(fDMCadPedido.cdsPedidoPEDIDO_CLIENTE.AsString) = '') and (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P')
    and (fDMCadPedido.qParametros_PedEXIGE_PEDIDO_CLI.AsString = 'S') then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Pedido cliente n�o informado!';
  if (fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger < 1) and (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P') then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Cliente n�o informado!';
  if (fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger < 1) and (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'C') then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Fornecedor n�o informado!';
  if (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'O') and (trim(fDMCadPedido.cdsPedidoNOME_CLIENTE.AsString) = '') then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Cliente n�o informado!';
  if fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime < 10 then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Data de Emiss�o n�o informada!';
  if (Tipo <> 'ORC') and (fDMCadPedido.cdsPedido_Itens.IsEmpty) and (fDMCadPedido.cdsPedido_Ace.IsEmpty) and (fDMCadPedido.cdsPedido_Rol.IsEmpty) then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Itens n�o informados!';
  if fDMCadPedido.cdsPedidoVLR_ADIANTAMENTO.AsFloat > fDMCadPedido.cdsPedidoVLR_TOTAL.AsFloat then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Valor do adiantamento � maior que o valor do pedido!';
  if (StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoPERC_COMISSAO.AsFloat)) > 0) and (fDMCadPedido.cdsPedidoID_VENDEDOR.AsInteger <= 0) and
     (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P') then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Pedido com % de comiss�o e o vendedor n�o informado!';
  if (fDMCadPedido.qParametros_PedEXIGIR_NUM_PED_CLIENTE.AsString = 'S') and (trim(fDMCadPedido.cdsPedidoPEDIDO_CLIENTE.AsString) = '')
    and (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P') then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** N� Pedido Cliente (OC) n�o informado!';
  if (fDMCadPedido.qParametros_GeralEMPRESA_VAREJO.AsString = 'S') and (fDMCadPedido.cdsPedidoTIPO_ATENDIMENTO.AsInteger = 4)
    and (fDMCadPedido.cdsPedidoID_TRANSPORTADORA.AsInteger <= 0) then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Quando for entrega a domic�lio � obrigado informar a transportadora!';
  //Condi��o inclu�da 20/01/2020  
  if (fDMCadPedido.cdsParametrosCONTROLAR_DUP_PEDIDO.AsString = 'S') and (fDMCadPedido.cdsPedidoID_CONTA.AsInteger <= 0) and
     (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P') and (fDMCadPedido.cdsCondPgtoTIPO_CONDICAO.AsString = 'V') and
     (fDMCadPedido.cdsPedidoID_CONDPGTO.AsInteger > 0)   then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Conta n�o informada para a condi��o a vista!';
  if ((fDMCadPedido.cdsParametrosUSA_ADIANTAMENTO_PEDIDO.AsString = 'S') or (fDMCadPedido.cdsPedidoGERA_ENTRADA_NO_PEDIDO.AsString = 'S'))  and
     ((StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_ADIANTAMENTO.AsFloat)) > 0) or
       (StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_ENTRADA.AsFloat)) > 0)) and (fDMCadPedido.cdsPedidoID_CONTA.AsInteger <= 0)  then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Conta n�o informada para lan�ar a Entrada/Adiantamento!';
  //**********************
  if (fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger < 1) and (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P') then
    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Cliente n�o informado!';
  if  fDMCadPedido.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger <> fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger then
  begin
    if (fDMCadPedido.qParametros_PedUSA_EMAIL_NO_PED.AsString = 'S') and (fDMCadPedido.qParametros_PedENVIA_SMS.AsString = 'S') then
      vVerificaCampos := 1
    else
    if (fDMCadPedido.qParametros_PedUSA_EMAIL_NO_PED.AsString = 'S') then
      vVerificaCampos := 2
    else
    if (fDMCadPedido.qParametros_PedENVIA_SMS.AsString = 'S') then
      vVerificaCampos := 3;
  end;

  case vVerificaCampos of
    1: begin
          if (fDMCadPedido.cdsPedidoEMAIL_COMPRAS.AsString = '') and (fDMCadPedido.cdsPedidoDDD.AsInteger <= 0) and (fDMCadPedido.cdsPedidoFONE.AsString = '') then
            fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** E-mail ou Telefone com DDD devem ser informados!'
        end ;
    2: begin
          if (fDMCadPedido.cdsPedidoEMAIL_COMPRAS.AsString = '') then
            fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** E-mail deve ser informado!'
         end;
    3: begin
          if (fDMCadPedido.cdsPedidoDDD.AsInteger <= 0) or (fDMCadPedido.cdsPedidoFONE.AsString = '') then
            fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Telefone com DDD devem ser informados!'
        end;
  end;

//  if vVerificaCampos > 0 then
//  begin
//  if (fDMCadPedido.cdsPedidoEMAIL_COMPRAS.AsString = '') and (fDMCadPedido.cdsPedidoDDD.AsInteger <= 0) and (fDMCadPedido.cdsPedidoFONE.AsString = '') then
//    fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** E-mail ou Telefone com DDD devem ser informado!';
//  end;

  if fDMCadPedido.cdsParametrosOPCAO_DTENTREGAPEDIDO.AsString = 'P' then
  begin
    if (fDMCadPedido.cdsPedidoDTENTREGA.AsDateTime > 10) and (fDMCadPedido.cdsPedidoDTENTREGA.AsDateTime < fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime) then
      fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Data de entrega menor que a data de emiss�o!';
  end
  else
  begin
    vFlag := True;
    if fDMCadPedido.qParametros_FinCONTROLAR_BANCO_REM_DEP.AsString = 'S' then
    begin
      if (fDMCadPedido.cdsPedidoID_CONTA.AsInteger > 0) and (fDMCadPedido.cdsPedidoID_TIPO_COBRANCA.AsInteger > 0) then
      begin
        if (fDMCadPedido.cdsPedidoID_CONTA.AsInteger <> fDMCadPedido.cdsContasID.AsInteger) then
          fDMCadPedido.cdsContas.Locate('ID',fDMCadPedido.cdsPedidoID_CONTA.AsInteger,([Locaseinsensitive]));
        if (fDMCadPedido.cdsPedidoID_TIPO_COBRANCA.AsInteger <> fDMCadPedido.cdsTipoCobrancaID.AsInteger) then
          fDMCadPedido.cdsTipoCobranca.Locate('ID',fDMCadPedido.cdsPedidoID_TIPO_COBRANCA.AsInteger,([Locaseinsensitive]));
        if (fDMCadPedido.cdsTipoCobrancaGERARBOLETO.AsString = 'S') and (fDMCadPedido.cdsContasGERAR_BOLETO.AsString <> 'S') then
          fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Banco ' + fDMCadPedido.cdsContasNOME.AsString + ', n�o est� marcado para gerar boleto!'
        else
        if (fDMCadPedido.cdsTipoCobrancaDEPOSITO.AsString = 'S') and (fDMCadPedido.cdsContasGERAR_DEPOSITO.AsString <> 'S') then
          fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Banco ' + fDMCadPedido.cdsContasNOME.AsString + ', n�o est� marcado para usar o tipo de cobran�a dep�sito!';
      end;
      fDMCadPedido.cdsPedido_Parc.First;
      while not fDMCadPedido.cdsPedido_Parc.Eof do
      begin
        if fDMCadPedido.cdsPedido_ParcID_CONTA.AsInteger > 0 then
        begin
          if fDMCadPedido.cdsPedido_ParcID_CONTA.AsInteger <> fDMCadPedido.cdsContasID.AsInteger then
            fDMCadPedido.cdsContas.Locate('ID',fDMCadPedido.cdsPedido_ParcID_CONTA.AsInteger,([Locaseinsensitive]));
          if (fDMCadPedido.cdsPedido_ParclkGerarBoleto.AsString = 'S') and (fDMCadPedido.cdsContasGERAR_BOLETO.AsString <> 'S' ) then
          begin
            vFlag := False;
            fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Banco ' + fDMCadPedido.cdsContasNOME.AsString + ', n�o est� marcado para gerar boleto!';
            fDMCadPedido.cdsPedido_Parc.Last;
          end
          else
          if (fDMCadPedido.cdsPedido_ParclkDeposito.AsString = 'S') and (fDMCadPedido.cdsContasGERAR_DEPOSITO.AsString <> 'S' ) then
          begin
            vFlag := False;
            fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Banco ' + fDMCadPedido.cdsContasNOME.AsString + ', n�o est� marcado para usar o tipo de cobran�a dep�sito!';
            fDMCadPedido.cdsPedido_Parc.Last;
          end
        end;
        fDMCadPedido.cdsPedido_Parc.Next;
      end;
    end;
    fDMCadPedido.cdsPedido_Itens.First;
    while not fDMCadPedido.cdsPedido_Itens.Eof do
    begin
      if (fDMCadPedido.cdsPedido_ItensDTENTREGA.AsDateTime > 10) and (fDMCadPedido.cdsPedido_ItensDTENTREGA.AsDateTime < fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime) then
        fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** Data de entrega menor que a data de emiss�o!';
      fDMCadPedido.cdsPedido_Itens.Next;
    end;
  end;
  if fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P' then
  begin
    vAux := uGrava_Pedido.fnc_Existe_OC(fDMCadPedido);
    if vAux > 0 then
      fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + '*** N� Pedido do cliente j� foi digitado, est� no pedido interno ' + IntToStr(vAux);
  end;
  if fDMCadPedido.vMSGErro <> '' then
    exit;

  if fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger <> fDMCadPedido.cdsClienteCODIGO.AsInteger then
    fDMCadPedido.cdsCliente.Locate('CODIGO',fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger,([Locaseinsensitive]));

  vID := fDMCadPedido.cdsPedidoID.AsInteger;

  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);

  fDMEstoque := TDMEstoque.Create(fDMEstoque);

  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);

  try
    try
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := 'UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('PEDIDO');
      Flag := False;
      while not Flag do
      begin
        try
          sds.Close;
          sds.ExecSQL;
          Flag := True;
        except
          on E: Exception do
          begin
            Flag := False;
          end;
        end;
      end;
    except
      raise
    end;

    //10/11/2015  if do adiatamento incluida
    if (fDMCadPedido.cdsParametrosCONTROLAR_DUP_PEDIDO.AsString = 'S') or (fDMCadPedido.cdsParametrosUSA_ADIANTAMENTO_PEDIDO.AsString = 'S') then
      uGrava_Pedido.Excluir_Duplicata_Ped(fDMCadPedido.cdsPedidoID.AsInteger);
    //***************

    if ((fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'O') and (fDMCadPedido.cdsPedidoNUM_ORCAMENTO.AsInteger <= 0)) or
       ((fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P') and (fDMCadPedido.cdsPedidoNUM_PEDIDO.AsInteger <= 0)) or
       ((fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'S') and (fDMCadPedido.cdsPedidoNUM_PEDIDO.AsInteger <= 0)) or
       ((fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'C') and (fDMCadPedido.cdsPedidoNUM_PEDIDO.AsInteger <= 0)) then
    begin
      vFilial := fDMCadPedido.cdsPedidoFILIAL.AsInteger;
      if fDMCadPedido.cdsFilialID.AsInteger <> fDMCadPedido.cdsPedidoFILIAL.AsInteger then
        fDMCadPedido.cdsFilial.Locate('ID',fDMCadPedido.cdsPedidoFILIAL.AsInteger,([Locaseinsensitive]));
      if fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'O' then
        vNumAux :=  uCalculo_Pedido.fnc_Proximo_Num_Pedido(fDMCadPedido.cdsPedidoTIPO_REG.AsString,fDMCadPedido.qParametros_PedUSA_NUM_PEDIDO_POR_FILIAL.AsString,fDMCadPedido.cdsFilialNUM_ORCAMENTO_ULT.AsInteger)
      else
      if fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P' then
        vNumAux := uCalculo_Pedido.fnc_Proximo_Num_Pedido(fDMCadPedido.cdsPedidoTIPO_REG.AsString,fDMCadPedido.qParametros_PedUSA_NUM_PEDIDO_POR_FILIAL.AsString,fDMCadPedido.cdsFilialNUM_PEDIDO_ULT.AsInteger)
      else
        vNumAux := uCalculo_Pedido.fnc_Proximo_Num_Pedido(fDMCadPedido.cdsPedidoTIPO_REG.AsString,fDMCadPedido.qParametros_PedUSA_NUM_PEDIDO_POR_FILIAL.AsString,fDMCadPedido.cdsFilialNUM_OC_ULT.AsInteger);
      vNumAux := vNumAux + 1;
      if fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'O' then
      begin
        //vNumAux := qProximoPedidoNUM_ORCAMENTO.AsInteger + 1;
        fDMCadPedido.cdsPedidoNUM_ORCAMENTO.AsInteger := vNumAux;
      end
      else
      begin
        //vNumAux := qProximoPedidoNUM_PEDIDO.AsInteger + 1;
        fDMCadPedido.cdsPedidoNUM_PEDIDO.AsInteger := vNumAux;
      end;
    end;
    if trim(fDMCadPedido.cdsPedidoPEDIDO_CLIENTE.AsString) = '' then
    begin
      //25/05/2018
      if fDMCadPedido.qParametros_PedUSA_NUM_PEDIDO_POR_VEND.AsString = 'S' then
      begin
        fDMCadPedido.cdsPedidoPEDIDO_CLIENTE.AsString   := fnc_Num_Pedido_Vend(fDMCadPedido.cdsPedidoID_VENDEDOR.AsInteger);
        fDMCadPedido.cdsPedidoNUM_PEDIDO_VEND.AsInteger := vNum_Pedido_Vend;
      end
      else
        fDMCadPedido.cdsPedidoPEDIDO_CLIENTE.AsString := fDMCadPedido.cdsPedidoNUM_PEDIDO.AsString;
    end;

    //10/11/2015
    if fDMCadPedido.cdsParametrosUSA_ADIANTAMENTO_PEDIDO.AsString <> 'S' then
      fDMCadPedido.cdsPedidoVLR_ADIANTAMENTO.AsFloat := StrToFloat(FormatFloat('0.00',0));

    if (fDMCadPedido.cdsParametrosCONTROLAR_DUP_PEDIDO.AsString = 'S') then
    begin
      //02/12/2019
      if fDMCadPedido.cdsCondPgtoID.AsInteger <> fDMCadPedido.cdsPedidoID_CONDPGTO.AsInteger then
        fDMCadPedido.cdsCondPgto.Locate('ID',fDMCadPedido.cdsPedidoID_CONDPGTO.AsInteger,([Locaseinsensitive]));
      //*************************
      //02/12/2019   IF para gravar o avista
      if (fDMCadPedido.cdsPedido_Parc.IsEmpty) and (fDMCadPedido.cdsCondPgtoTIPO.AsString = 'V') then
        Gravar_Duplicata(fDMCadPedido,'R','N',1,fDMCadPedido.cdsPedidoVLR_TOTAL.AsFloat,fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime,'AVI')
      else
      begin
        fDMCadPedido.cdsPedido_Parc.First;
        while not fDMCadPedido.cdsPedido_Parc.Eof do
        begin
          if StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ParcVLR_VENCIMENTO.AsFloat)) > 0 then
            Gravar_Duplicata(fDMCadPedido,'R','N',fDMCadPedido.cdsPedido_ParcITEM.AsInteger,fDMCadPedido.cdsPedido_ParcVLR_VENCIMENTO.AsFloat,fDMCadPedido.cdsPedido_ParcDTVENCIMENTO.AsDateTime,'');
          fDMCadPedido.cdsPedido_Parc.Next;
        end;
      end;
    end;
    if (fDMCadPedido.cdsParametrosUSA_ADIANTAMENTO_PEDIDO.AsString = 'S') and (StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_ADIANTAMENTO.AsFloat)) > 0) then
      Gravar_Duplicata(fDMCadPedido,'R','N',1,StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_ADIANTAMENTO.AsFloat)),fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime,'');

    if (fDMCadPedido.qParametros_PedCONTROLAR_VLR_ENTRADA.AsString = 'S') and (StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_ENTRADA.AsFloat)) > 0) and
      (fDMCadPedido.cdsPedidoGERA_ENTRADA_NO_PEDIDO.AsString = 'S') then
      Gravar_Duplicata(fDMCadPedido,'R','N',1,StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedidoVLR_ENTRADA.AsFloat)),fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime,'');

    //08/03/2015  quando for pedido e for para descontar do estoque
    //19/09/2016 Quando empresa for Sucata
    if (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P') and (fDMCadPedido.cdsParametrosTIPO_ESTOQUE.AsString = 'P')  then
    begin
      fDMCadPedido.cdsPedido_Itens.First;
      while not fDMCadPedido.cdsPedido_Itens.Eof do
      begin
        if fDMCadPedido.cdsParametrosTIPO_ESTOQUE.AsString = 'P' then
        begin
          vID_Estoque := 0;
          if fDMCadPedido.cdsPedido_ItensGERAR_ESTOQUE.AsString = 'S' then
          begin
            //gravar estoque aqui;
            //11/09/2015 Feito para a empresa JW
            vUnidade := fDMCadPedido.cdsPedido_ItensUNIDADE.AsString;
            if (fDMCadPedido.cdsParametrosEMPRESA_SUCATA.AsString = 'S') and (StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsPedido_ItensQTD_LANCAR_ESTOQUE.AsFloat)) > 0) then
            begin
              if fDMCadPedido.cdsPedido_ItensID_PRODUTO.AsInteger <> fDMCadPedido.cdsProdutoID.AsInteger then
              begin
                if fDMCadPedido.qParametros_PedPEDIDO_LOJA.AsString = 'S' then
                   fDMCadPedido.prc_Abrir_ProdutoLoja(fDMCadPedido.cdsPedido_ItensID_PRODUTO.AsInteger,'','')
                else
                  (fDMCadPedido.cdsProduto.Locate('ID',fDMCadPedido.cdsPedido_ItensID_PRODUTO.AsInteger,([Locaseinsensitive])));
              end;
              vUnidade := fDMCadPedido.cdsProdutoUNIDADE.AsString;
              vQtdAux := StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsPedido_ItensQTD_LANCAR_ESTOQUE.AsFloat * fDMCadPedido.cdsPedido_ItensQTD.AsFloat));
            end
            else
              vQtdAux  := StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsPedido_ItensQTD.AsFloat + fDMCadPedido.cdsPedido_ItensQTD_CANCELADO.AsFloat));

            vDescAux := StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsPedido_ItensVLR_DESCONTO.AsFloat + fDMCadPedido.cdsPedido_ItensVLR_DESCONTORATEIO.AsFloat));

            vQtdOriAux := StrToFloat(FormatFloat('0.0000',vQtdAux));
            vVlrAux := StrToFloat(FormatFloat('0.000000',fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat));
            if (fDMCadPedido.qParametros_PedUSA_UNIDADE_VENDA.AsString = 'S') and (trim(fDMCadPedido.cdsPedido_ItensUNIDADE_PROD.AsString) <> '') and
               (fDMCadPedido.cdsPedido_ItensUNIDADE_PROD.AsString <> fDMCadPedido.cdsPedido_ItensUNIDADE.AsString) and (StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsPedido_ItensCONV_UNIDADE.AsFloat)) <> 1) then
            begin
              vQtdAux := StrToFloat(FormatFloat('0.0000',vQtdAux * fDMCadPedido.cdsPedido_ItensCONV_UNIDADE.AsFloat));
              vVlrAux := StrToFloat(FormatFloat('0.000000',fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat / fDMCadPedido.cdsPedido_ItensCONV_UNIDADE.AsFloat));
            end;

            vID_Estoque := fDMEstoque.fnc_Gravar_Estoque(fDMCadPedido.cdsPedido_ItensID_MOVESTOQUE.AsInteger,
                                                         fDMCadPedido.cdsPedidoFILIAL.AsInteger,
                                                         fDMCadPedido.cdsPedidoID_LOCAL_ESTOQUE.AsInteger, //aqui verificar o local do estoque
                                                         fDMCadPedido.cdsPedido_ItensID_PRODUTO.AsInteger,
                                                         fDMCadPedido.cdsPedidoNUM_PEDIDO.AsInteger,
                                                         fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger,
                                                         fDMCadPedido.cdsPedidoID_CFOP.AsInteger,
                                                         fDMCadPedido.cdsPedidoID.AsInteger,0,
                                                         'S','PED',
                                                         vUnidade,
                                                         vUnidade,
                                                         '',
                                                         fDMCadPedido.cdsPedido_ItensTAMANHO.AsString,
                                                         fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime,
                                                         //fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat,
                                                         vVlrAux,
                                                         //fDMCadPedido.cdsPedido_ItensQTD.AsFloat,
                                                         vQtdAux,
                                                         fDMCadPedido.cdsPedido_ItensPERC_ICMS.AsFloat,
                                                         fDMCadPedido.cdsPedido_ItensPERC_IPI.AsFloat,
                                                         vDescAux,
                                                         fDMCadPedido.cdsPedido_ItensPERC_TRIBICMS.AsFloat,
                                                         fDMCadPedido.cdsPedido_ItensVLR_FRETE.AsFloat,
                                                         //fDMCadPedido.cdsPedido_ItensQTD.AsFloat,
                                                         //vQtdAux,
                                                         vQtdOriAux,
                                                         fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat,
                                                         0,0,'',
                                                         fDMCadPedido.cdsPedido_ItensID_COR.AsInteger,
                                                         fDMCadPedido.cdsPedido_ItensNUM_LOTE_CONTROLE.AsString,'N',
                                                         vVlrAux,0,0,0,
                                                         fDMCadPedido.cdsPedidoID_OPERACAO_NOTA.AsInteger,0,0);
          end;
          if fDMCadPedido.cdsPedido_ItensID_MOVESTOQUE.AsInteger <> vID_Estoque then
          begin
            if not(fDMCadPedido.cdsPedido_Itens.State in [dsEdit]) then
              fDMCadPedido.cdsPedido_Itens.Edit;
            fDMCadPedido.cdsPedido_ItensID_MOVESTOQUE.AsInteger := vID_Estoque;
          end;
          if fDMCadPedido.cdsPedido_Itens.State in [dsEdit] then
            fDMCadPedido.cdsPedido_Itens.Post;
        end;
        fDMCadPedido.cdsPedido_Itens.Next;
      end;
    end;

    if (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P') and (fDMCadPedido.cdsParametrosUSA_APROVACAO_PED.AsString <> 'S') then
      fDMCadPedido.cdsPedidoAPROVADO_PED.AsString := 'A'
    else
    if (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'C') and (fDMCadPedido.cdsParametrosUSA_APROVACAO_OC_FORN.AsString <> 'S') then
      fDMCadPedido.cdsPedidoAPROVADO_PED.AsString := 'A';

    //18/07/2017

    if (Length(fDMCadPedido.cdsClienteEMAIL_COMPRAS.AsString) <= 10) and (Length(fDMCadPedido.cdsPedidoEMAIL_COMPRAS.AsString) > 10) and
    //if ( fDMCadPedido.cdsClienteEMAIL_COMPRAS.AsString = '') and (fDMCadPedido.cdsPedidoEMAIL_COMPRAS.AsString <> '') and
       (fDMCadPedido.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger <> fDMCadPedido.cdsPedidoID_CLIENTE.asInteger) and
       (fDMCadPedido.qParametros_PedUSA_EMAIL_NO_PED.AsString = 'S') then
    begin
       fDMCadPedido.prc_Gravar_Email_Pessoa(fDMCadPedido.cdsClienteCODIGO.AsInteger,fDMCadPedido.cdsPedidoEMAIL_COMPRAS.AsString);
    end;

    //if (Length(fDMCadPedido.cdsClienteCELULAR.AsString) <= 10) and (Length(fDMCadPedido.cdsPedidoFONE.AsString <> '') and
    if (Length(fDMCadPedido.cdsClienteCELULAR.AsString) <= 3) and (Length(fDMCadPedido.cdsPedidoFONE.AsString) > 3) and
       (fDMCadPedido.cdsParametrosID_CLIENTE_CONSUMIDOR.AsInteger <> fDMCadPedido.cdsPedidoID_CLIENTE.asInteger) and
       (fDMCadPedido.qParametros_PedENVIA_SMS.AsString = 'S') then
    begin
       fDMCadPedido.prc_Gravar_Telefone(fDMCadPedido.cdsClienteCODIGO.AsInteger,fDMCadPedido.cdsPedidoDDD.AsInteger,fDMCadPedido.cdsPedidoFONE.AsString);
    end;

    //28/11/2019
    if (fDMCadPedido.cdsParametrosUSA_APROVACAO_PED.AsString = 'S') then
    begin
      if (fDMCadPedido.cdsPedidoAPROVADO_PED.AsString <> 'A') and (fDMCadPedido.cdsPedidoAPROVADO_PED.AsString <> 'N') then
      begin
        fDMCadPedido.cdsPedidoAPROVADO_PED.AsString := 'P';
        if (fDMCadPedido.qParametros_GeralFILIAL_PADRAO_PEDWEB.AsInteger > 0) and (fDMCadPedido.qParametros_PedAPROVAR_PEDIDO_WEB.AsString = 'W')
          and (fDMCadPedido.cdsPedidoID_PEDWEB.AsInteger <= 0) then
          fDMCadPedido.cdsPedidoAPROVADO_PED.AsString := 'A'
        else
        if (fDMCadPedido.qParametros_GeralFILIAL_PADRAO_PEDWEB.AsInteger > 0) and (fDMCadPedido.qParametros_PedAPROVAR_PEDIDO_WEB.AsString = 'L')
          and (fDMCadPedido.cdsPedidoID_PEDWEB.AsInteger > 0) then
          fDMCadPedido.cdsPedidoAPROVADO_PED.AsString := 'A';
      end;
    end
    else
      fDMCadPedido.cdsPedidoAPROVADO_PED.AsString := 'A';
    //********************

    fDMCadPedido.cdsPedido.Post;

    //11/08/2016
    if (fDMCadPedido.qParametros_GeralGRAVAR_HIST_SENHA.AsString = 'S') and (Tipo = 'ALT') then
      prc_Gravar_cdsHist_Senha(fDMCadPedido);
    //********************    

    fDMCadPedido.cdsPedido.ApplyUpdates(0);

    fDMCadPedido.sdsPrc_Atualiza_Status_Ped.Close;
    fDMCadPedido.sdsPrc_Atualiza_Status_Ped.ParamByName('P_ID').AsInteger := fDMCadPedido.cdsPedidoID.AsInteger;
    fDMCadPedido.sdsPrc_Atualiza_Status_Ped.ExecSQL;

    //25/06/2015
    fDMCadPedido.sdsPrc_Atualiza_DtCompra.Close;
    fDMCadPedido.sdsPrc_Atualiza_DtCompra.ParamByName('C_ID').AsInteger := fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger;
    fDMCadPedido.sdsPrc_Atualiza_DtCompra.ExecSQL;

    //10/08/2015
    if (fDMCadPedido.cdsParametrosOPCAO_DTENTREGAPEDIDO.AsString = 'P') OR (fDMCadPedido.qParametros_PedMOSTRAR_TERCEIRO.AsString = 'P') then
    begin
      fDMCadPedido.sdsPrc_Atualiza_DtEntrega.Close;
      fDMCadPedido.sdsPrc_Atualiza_DtEntrega.ParamByName('P_ID').AsInteger := fDMCadPedido.cdsPedidoID.AsInteger;
      if (fDMCadPedido.cdsParametrosOPCAO_DTENTREGAPEDIDO.AsString = 'P') then
      begin
        if fDMCadPedido.cdsPedidoDTENTREGA.AsDateTime > 10 then
          fDMCadPedido.sdsPrc_Atualiza_DtEntrega.ParamByName('P_DATA').AsDate  := fDMCadPedido.cdsPedidoDTENTREGA.AsDateTime
        else
          fDMCadPedido.sdsPrc_Atualiza_DtEntrega.ParamByName('P_DATA').Clear; //aqui foi colocado 26/08/2020  Cleomar
      end;
      if (fDMCadPedido.qParametros_PedMOSTRAR_TERCEIRO.AsString = 'P') then
      begin
        if fDMCadPedido.cdsPedidoID_ATELIER.AsInteger > 0 then
          fDMCadPedido.sdsPrc_Atualiza_DtEntrega.ParamByName('P_ID_ATELIER').AsInteger := fDMCadPedido.cdsPedidoID_ATELIER.AsInteger;
      end;
      fDMCadPedido.sdsPrc_Atualiza_DtEntrega.ExecSQL;
    end;

    //Gravar as chapas, JW vai usar    19/09/2016
    if (fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P') and (fDMCadPedido.cdsParametrosEMPRESA_SUCATA.AsString = 'S') then
    begin
    //aqui gravar chapa
    end;        

    dmDatabase.scoDados.Commit(ID);

    vGravou := True;
    fDMCadPedido.mSenha.EmptyDataSet;
  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);
  FreeAndNil(fDMEstoque);

  FreeAndNil(Form);

  if vGravou then
  begin
    if vID <> fDMCadPedido.cdsPedidoID.AsInteger then
      fDMCadPedido.prc_Localizar(vID);
    if fDMCadPedido.cdsPedidoTIPO_REG.AsString = 'P' then
    begin
      if fDMCadPedido.qParametros_PedUSA_PROCESSO.AsString = 'S' then
        fDMAprovacao_Ped := TDMAprovacao_Ped.Create(fDMAprovacao_Ped);
      try
        if (fDMCadPedido.qParametros_PedUSA_PROCESSO.AsString = 'S')  then
          fDMAprovacao_Ped.prc_Gravar_Pedido_Processo('',fDMCadPedido.cdsPedidoID.AsInteger,0,'C','','',Date);
      except
        on e: Exception do
          ShowMessage('Ocorreu o seguinte erro ao gravar Processo: ' + #13 + e.Message);
      end;
      FreeAndNil(fDMAprovacao_Ped);
    end;
  end;
end;

procedure prc_Gravar_cdsHist_Senha(fDMCadPedido: TDMCadPedido);
var
  vItemAux: Integer;
  vCampoSenha: String;
  vAux: Integer;
begin
  fDMCadPedido.sdsHist_Senha.CommandText := fDMCadPedido.ctHistSenha;
  fDMCadPedido.cdsHist_Senha.Close;
  fDMCadPedido.sdsHist_Senha.CommandText := fDMCadPedido.sdsHist_Senha.CommandText + ' WHERE ID = 0 ';
  fDMCadPedido.cdsHist_Senha.Open;

  fDMCadPedido.mSenha.First;
  while not fDMCadPedido.mSenha.Eof do
  begin
    vAux := dmDatabase.ProximaSequencia('HIST_SENHA',0);
    fDMCadPedido.cdsHist_Senha.Insert;
    fDMCadPedido.cdsHist_SenhaID.AsInteger := vAux;
    fDMCadPedido.cdsHist_SenhaID_DOC.AsInteger := fDMCadPedido.cdsPedidoID.AsInteger;
    fDMCadPedido.cdsHist_SenhaITEM_DOC.AsInteger := fDMCadPedido.mSenhaItem.AsInteger;
    fDMCadPedido.cdsHist_SenhaNUM_DOC.AsInteger  := fDMCadPedido.cdsPedidoNUM_PEDIDO.AsInteger;
    fDMCadPedido.cdsHist_SenhaTIPO_ARQ.AsString := 'PED';
    fDMCadPedido.cdsHist_SenhaTIPO_DOC.AsString  := fDMCadPedido.mSenhaTipo_Doc.AsString;
    fDMCadPedido.cdsHist_SenhaTIPO_HIST.AsString := fDMCadPedido.mSenhaTipo_Alt.AsString;
    fDMCadPedido.cdsHist_SenhaSENHA.AsString     := fDMCadPedido.mSenhaSenha.AsString;
    fDMCadPedido.cdsHist_SenhaUSUARIO.AsString   := vUsuario;
    fDMCadPedido.cdsHist_SenhaDATA.AsDateTime    := Date;
    fDMCadPedido.cdsHist_SenhaHORA.AsDateTime    := Now;
    fDMCadPedido.cdsHist_SenhaSENHA_PERTENCE_AO_USUARIO.AsString := fDMCadPedido.mSenhaSenha_Pertence.AsString;
    fDMCadPedido.cdsHist_Senha.Post;
    fDMCadPedido.cdsHist_Senha.ApplyUpdates(0);
    fDMCadPedido.mSenha.Delete;
  end;
end;

procedure prc_Excluir_Item_Ped(fDMCadPedido: TDMCadPedido);
begin
  fDMCadPedido.cdsPedido_Cli.First;
  while not fDMCadPedido.cdsPedido_Cli.Eof do
    fDMCadPedido.cdsPedido_Cli.Delete;
  fDMCadPedido.cdsPedido_Item_Tipo.First;
  while not fDMCadPedido.cdsPedido_Item_Tipo.Eof do
    fDMCadPedido.cdsPedido_Item_Tipo.Delete;
  fDMCadPedido.cdsPedido_Material.First;
  while not fDMCadPedido.cdsPedido_Material.Eof do
  begin
    fDMCadPedido.cdsPedido_Etiqueta.First;
    while not fDMCadPedido.cdsPedido_Etiqueta.Eof do
      fDMCadPedido.cdsPedido_Etiqueta.Delete;
    fDMCadPedido.cdsPedido_Material.Delete;
  end;
  fDMCadPedido.cdsPedido_Item_Processo.First;
  while not fDMCadPedido.cdsPedido_Item_Processo.Eof do
    fDMCadPedido.cdsPedido_Item_Processo.Delete;
  fDMCadPedido.cdsPedido_Itens.Delete;
end;

procedure Excluir_Duplicata_Ped(ID: Integer);
var
  sds: TSQLDataSet;
begin
  if ID <= 0 then
    exit;
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.GetMetadata   := False;
  sds.NoMetadata    := True;
  sds.CommandText   := 'DELETE FROM DUPLICATA WHERE ID_PEDIDO = ' + IntToStr(ID);
  sds.ExecSQL;
  FreeAndNil(sds);
end;

procedure prc_Excluir_Pedido(fDMCadPedido: TDMCadPedido);
var
  ID: TTransactionDesc;
  vFlag: Boolean;
  vID_CliAux: Integer;
  vIDAux: Integer;
begin
  if not(fDMCadPedido.cdsPedido.Active) or (fDMCadPedido.cdsPedido.IsEmpty) then
    exit;

  vFlag  := True;
  vIDAux := 0;
  fDMCadPedido.cdsPedido_Itens.First;
  while not fDMCadPedido.cdsPedido_Itens.Eof do
  begin
    if fDMCadPedido.cdsPedido_ItensAPROVADO_ORC.AsString = 'A' then
      vFlag := False;
    fDMCadPedido.cdsPedido_Itens.Next;
  end;
  fDMCadPedido.vMSGErro := '';
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    fDMCadPedido.cdsPedido_Itens.First;
    while not fDMCadPedido.cdsPedido_Itens.Eof do
      prc_Excluir_Item_Ped(fDMCadPedido);

    fDMCadPedido.cdsPedido_Desconto.First;
    while not fDMCadPedido.cdsPedido_Desconto.Eof do
      fDMCadPedido.cdsPedido_Desconto.Delete;

    fDMCadPedido.cdsPedido_Parc.First;
    while not fDMCadPedido.cdsPedido_Parc.eof do
      fDMCadPedido.cdsPedido_Parc.Delete;

    if fDMCadPedido.cdsPedido_Ace.Active then
    begin
      fDMCadPedido.cdsPedido_Ace.First;
      while not fDMCadPedido.cdsPedido_Ace.Eof do
        fDMCadPedido.cdsPedido_Ace.Delete;
    end;
    if fDMCadPedido.cdsPedido_Rol.Active then
    begin
      fDMCadPedido.cdsPedido_Rol.First;
      while not fDMCadPedido.cdsPedido_Rol.Eof do
        fDMCadPedido.cdsPedido_Rol.Delete;
    end;

    Excluir_Duplicata_Ped(fDMCadPedido.cdsPedidoID.AsInteger);

    vID_CliAux := fDMCadPedido.cdsPedidoID_CLIENTE.AsInteger;

    //11/08/2016
    if (fDMCadPedido.qParametros_GeralGRAVAR_HIST_SENHA.AsString = 'S') then
      prc_Gravar_cdsHist_Senha(fDMCadPedido);
    //****************

    if not fDMCadPedido.cdsPedido_Cupom.IsEmpty then
      fDMCadPedido.cdsPedido_Cupom.Delete;

    vIDAux := fDMCadPedido.cdsPedidoID.AsInteger;

    fDMCadPedido.qPedOS.Close;
    fDMCadPedido.qPedOS.ParamByName('ID').AsInteger := vIDAux;
    fDMCadPedido.qPedOS.Open;

    fDMCadPedido.cdsPedido.Delete;
    fDMCadPedido.cdsPedido.ApplyUpdates(0);

    fDMCadPedido.sdsPrc_Atualiza_DtCompra.Close;
    fDMCadPedido.sdsPrc_Atualiza_DtCompra.ParamByName('C_ID').AsInteger := vID_CliAux;
    fDMCadPedido.sdsPrc_Atualiza_DtCompra.ExecSQL;

    //23/06/2018 Supercrom
    if fDMCadPedido.qParametros_PedUSAR_COPIA_OS.AsString = 'S' then
    begin
      while not fDMCadPedido.qPedOS.Eof do
      begin
        fDMCadPedido.sdsprc_Atualiza_OS_Fat.Close;
        fDMCadPedido.sdsprc_Atualiza_OS_Fat.ParamByName('P_ID').AsInteger := fDMCadPedido.qPedOSID_OS_SERV.AsInteger;
        fDMCadPedido.sdsprc_Atualiza_OS_Fat.ExecSQL;
        fDMCadPedido.qPedOS.Next;
      end;
      fDMCadPedido.qPedOS.Close;
    end;
    //****************

    dmDatabase.scoDados.Commit(ID);

  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
end;

procedure prc_Inserir_Ped(fDMCadPedido: TDMCadPedido);
var
  vAux: Integer;
  vNumAux: Integer;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  Flag: Boolean;
  vIDPed: Integer;
begin
  sds := TSQLDataSet.Create(nil);

  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);

  try
    try
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := 'UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('PEDIDO');

      Flag := False;
      while not Flag do
      begin
        try
          sds.Close;
          sds.ExecSQL;
          Flag := True;
        except
          on E: Exception do
          begin
            Flag := False;
          end;
        end;
        dmDatabase.scoDados.Commit(ID);
      end;
    except
      dmDatabase.scoDados.Rollback(ID);
      raise;
    end;
  finally
    FreeAndNil(sds);
  end;

  {ID.TransactionID  := 5;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try

    if not fDMCadPedido.cdsPedido.Active then
      fDMCadPedido.prc_Localizar(-1);
    vAux := dmDatabase.ProximaSequencia('PEDIDO',0);

    fDMCadPedido.mSenha.EmptyDataSet;

    fDMCadPedido.cdsPedido.Insert;
    fDMCadPedido.cdsPedidoID.AsInteger         := vAux;
    fDMCadPedido.cdsPedidoFILIAL.AsInteger     := vFilial;
    fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime := Date;
    fDMCadPedido.cdsPedido.Post;

    vIDPed := fDMCadPedido.cdsPedidoID.AsInteger;
    fDMCadPedido.cdsPedido.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

    fDMCadPedido.cdsPedido.Locate('ID',vIDPed,([Locaseinsensitive]));

    fDMCadPedido.cdsPedido.Edit;

  except
    on e: Exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao inserir o Pedido: ' + #13 + e.Message);
    end;
  end;}

  if not fDMCadPedido.cdsPedido.Active then
    fDMCadPedido.prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('PEDIDO',0);

  fDMCadPedido.mSenha.EmptyDataSet;

  fDMCadPedido.cdsPedido.Insert;
  fDMCadPedido.cdsPedidoID.AsInteger         := vAux;
  fDMCadPedido.cdsPedidoFILIAL.AsInteger     := vFilial;
  fDMCadPedido.cdsPedidoDTEMISSAO.AsDateTime := Date;
end;

procedure prc_Alterar_Item_Tam(fDMCadPedido: TDMCadPedido; ID_Cor, Item, Item_Original: Integer; Preco, Perc_IPI, Perc_ICMS: Real;
                               DtEntrega: TDateTime; Carimbo, Caixinha: String);
var
  vFlag: Boolean;                               
begin
  vFlag := False;
  fDMCadPedido.cdsPedido_Itens.First;
  fDMCadPedido.cdsPedido_Itens.Locate('ITEM_ORIGINAL',Item_Original,([Locaseinsensitive]));
  while not fDMCadPedido.cdsPedido_Itens.Eof do
  begin
    if (fDMCadPedido.cdsPedido_ItensITEM_ORIGINAL.AsInteger = Item_Original) and (fDMCadPedido.cdsPedido_ItensITEM.AsInteger <> Item) then
    begin
      if fDMCadPedido.cdsPedido_ItensID_COR.AsInteger <> ID_Cor then
      begin
        if not(fDMCadPedido.cdsPedido_Itens.State in [dsEdit]) then
          fDMCadPedido.cdsPedido_Itens.Edit;
        fDMCadPedido.cdsPedido_ItensID_COR.AsInteger := ID_Cor;
      end;
      if StrToFloat(FormatFloat('0.000000',fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat)) <> StrToFloat(FormatFloat('0.000000',Preco)) then
      begin
        if not(fDMCadPedido.cdsPedido_Itens.State in [dsEdit]) then
          fDMCadPedido.cdsPedido_Itens.Edit;
        fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.000000',Preco));
      end;
      if StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensPERC_IPI.AsFloat)) <> StrToFloat(FormatFloat('0.00',Perc_IPI)) then
      begin
        if not(fDMCadPedido.cdsPedido_Itens.State in [dsEdit]) then
          fDMCadPedido.cdsPedido_Itens.Edit;
        fDMCadPedido.cdsPedido_ItensPERC_IPI.AsFloat := StrToFloat(FormatFloat('0.00',Perc_IPI));
      end;
      if StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensPERC_ICMS.AsFloat)) <> StrToFloat(FormatFloat('0.00',Perc_ICMS)) then
      begin
        if not(fDMCadPedido.cdsPedido_Itens.State in [dsEdit]) then
          fDMCadPedido.cdsPedido_Itens.Edit;
        fDMCadPedido.cdsPedido_ItensPERC_ICMS.AsFloat := StrToFloat(FormatFloat('0.00',Perc_ICMS));
      end;
      if fDMCadPedido.cdsPedido_ItensDTENTREGA.AsDateTime <> DtEntrega then
      begin
        if not(fDMCadPedido.cdsPedido_Itens.State in [dsEdit]) then
          fDMCadPedido.cdsPedido_Itens.Edit;
        fDMCadPedido.cdsPedido_ItensDTENTREGA.AsFloat := DtEntrega;
      end;
      if trim(fDMCadPedido.cdsPedido_ItensCARIMBO.AsString) <> trim(Carimbo) then
      begin
        if not(fDMCadPedido.cdsPedido_Itens.State in [dsEdit]) then
          fDMCadPedido.cdsPedido_Itens.Edit;
        fDMCadPedido.cdsPedido_ItensCARIMBO.AsString := Carimbo;
      end;
      if trim(fDMCadPedido.cdsPedido_ItensCAIXINHA.AsString) <> trim(Caixinha) then
      begin
        if not(fDMCadPedido.cdsPedido_Itens.State in [dsEdit]) then
          fDMCadPedido.cdsPedido_Itens.Edit;
        fDMCadPedido.cdsPedido_ItensCAIXINHA.AsString := Caixinha;
      end;
      if (fDMCadPedido.cdsPedido_Itens.State in [dsEdit]) then
        fDMCadPedido.cdsPedido_Itens.Post;
      vFlag := True;
    end
    else
    if vFlag then
      fDMCadPedido.cdsPedido_Itens.Last;
    fDMCadPedido.cdsPedido_Itens.Next;
  end;
end;

function fnc_Verificar_Vendedor_Int(fDMCadPedido: TDMCadPedido; ID: Integer): Integer;
var
  sds: TSQLDataSet;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT P.id_vendedor_int FROM PESSOA P WHERE P.CODIGO = :CODIGO ';
    sds.ParamByName('CODIGO').AsInteger := ID;
    sds.Open;
    Result := sds.FieldByName('id_vendedor_int').AsInteger;
  finally
    FreeAndNil(sds);
  end;
end;

procedure prc_Gravar_Financeiro(fDMCadPedido: TDMCadPedido; Tipo: string);//ENT=Entrada   AVI= Avista
var
  fDMGravarFinanceiro: TDMGravarFinanceiro;
begin
  fDMGravarFinanceiro := TDMGravarFinanceiro.Create(fDMGravarFinanceiro);

  fDMCadPedido.cdsCliente.Locate('CODIGO', fDMCadPedido.cdsDuplicataID_PESSOA.AsInteger, ([Locaseinsensitive]));

  fDMGravarFinanceiro.vTipo_ES := 'E';
  if Tipo = 'ENT' then
    fDMGravarFinanceiro.vHistorico_Compl := 'Recto.Entrada ref. Doc n� ' + fDMCadPedido.cdsDuplicataNUMDUPLICATA.AsString + ' de ' + fDMCadPedido.cdsClienteNOME.AsString
  else if Tipo = 'AVI' then
    fDMGravarFinanceiro.vHistorico_Compl := 'Recto.A Vista ref. Doc n� ' + fDMCadPedido.cdsDuplicataNUMDUPLICATA.AsString + ' de ' + fDMCadPedido.cdsClienteNOME.AsString;

  fDMGravarFinanceiro.vID_Conta           := fDMCadPedido.cdsDuplicataID_CONTA.AsInteger;
  fDMGravarFinanceiro.vID_ModDuplicata    := fDMCadPedido.cdsDuplicataID.AsInteger;
  fDMGravarFinanceiro.vItem_MovDuplicata  := fDMCadPedido.cdsDuplicata_HistITEM.AsInteger;
  fDMGravarFinanceiro.vID_Historico       := 0;
  fDMGravarFinanceiro.vID_Pessoa          := fDMCadPedido.cdsDuplicataID_PESSOA.AsInteger;
  fDMGravarFinanceiro.vID_Forma_Pagamento := fDMCadPedido.cdsDuplicataID_TIPOCOBRANCA.AsInteger;
  fDMGravarFinanceiro.vID_ExtComissao     := 0;
  fDMGravarFinanceiro.vDtMovimento        := fDMCadPedido.cdsDuplicata_HistDTLANCAMENTO.AsDateTime;
  fDMGravarFinanceiro.vVlr_Movimento      := StrToFloat(FormatFloat('0.00', fDMCadPedido.cdsDuplicata_HistVLR_PAGAMENTO.AsFloat));
  fDMGravarFinanceiro.vFilial_Fin         := fDMCadPedido.cdsDuplicataFILIAL.AsInteger;
  if fDMCadPedido.cdsDuplicataID_CONTA_ORCAMENTO.AsInteger > 0 then
    fDMGravarFinanceiro.vID_Conta_Orcamento := fDMCadPedido.cdsDuplicataID_CONTA_ORCAMENTO.AsInteger
  else
    fDMGravarFinanceiro.vID_Conta_Orcamento := 0;
  fDMGravarFinanceiro.vFilial_Fin         := fDMCadPedido.cdsDuplicataFILIAL.AsInteger;

  fDMGravarFinanceiro.prc_Gravar;

  FreeAndNil(fDMGravarFinanceiro);
end;

procedure prc_Gravar_mProcesso_Sel(fDMCadPedido: TDMCadPedido);
begin
  fDMCadPedido.mProcesso_Sel.EmptyDataSet;
  fDMCadPedido.qParametros_Ped.Close;
  fDMCadPedido.qParametros_Ped.Open;
  fDMCadPedido.cdsProcesso.Close;
  fDMCadPedido.cdsProcesso.Open;
  fDMCadPedido.cdsProcesso.First;
  while not fDMCadPedido.cdsProcesso.Eof do
  begin
    fDMCadPedido.mProcesso_Sel.Insert;
    fDMCadPedido.mProcesso_SelID.AsInteger           := fDMCadPedido.cdsProcessoID.AsInteger;
    fDMCadPedido.mProcesso_SelNome.AsString          := fDMCadPedido.cdsProcessoNOME.AsString;
    if fDMCadPedido.cdsProcessoID.AsInteger = fDMCadPedido.qParametros_PedID_PROCESSO_FINAL.AsInteger then
      fDMCadPedido.mProcesso_SelQtd_Dobra.AsInteger := 1
    else
      fDMCadPedido.mProcesso_SelQtd_Dobra.AsInteger := 0;
    fDMCadPedido.mProcesso_SelOrdem.AsInteger        := fDMCadPedido.cdsProcessoORDEM_MAPA.AsInteger;
    fDMCadPedido.mProcesso_SelUsa_Qtd_Dobra.AsString := fDMCadPedido.cdsProcessoUSAR_QTD_DOBRA.AsString;
    fDMCadPedido.mProcesso_Sel.Post;
    fDMCadPedido.cdsProcesso.Next;
  end;

  fDMCadPedido.cdsPedido_Item_Processo.First;
  while not fDMCadPedido.cdsPedido_Item_Processo.eof do
  begin
    if fDMCadPedido.mProcesso_Sel.Locate('ID',fDMCadPedido.cdsPedido_Item_ProcessoID_PROCESSO.AsInteger,([Locaseinsensitive])) then
    begin
      fDMCadPedido.mProcesso_Sel.Edit;
      fDMCadPedido.mProcesso_SelQtd_Dobra.AsInteger    := fDMCadPedido.cdsPedido_Item_ProcessoQTD_DOBRA.AsInteger;
      fDMCadPedido.mProcesso_Sel.Post;
    end;
    fDMCadPedido.cdsPedido_Item_Processo.Next;
  end;
end;

procedure prc_Gravar_Pedido_Item_Processo(fDMCadPedido: TDMCadPedido);
var
  vItemAux : Integer;
begin
  vItemAux := 0;
  fDMCadPedido.mProcesso_Sel.First;
  while not fDMCadPedido.mProcesso_Sel.Eof do
  begin
    vItemAux := vItemAux + 1;
    
    if fDMCadPedido.mProcesso_SelQtd_Dobra.AsInteger <= 0 then
    begin
      if fDMCadPedido.cdsPedido_Item_Processo.Locate('ITEM_PROCESSO',vItemAux,([Locaseinsensitive])) then
        fDMCadPedido.cdsPedido_Item_Processo.Delete;
    end
    else
    if fDMCadPedido.mProcesso_SelQtd_Dobra.AsInteger > 0 then
    begin
      if fDMCadPedido.cdsPedido_Item_Processo.Locate('ITEM_PROCESSO',vItemAux,([Locaseinsensitive])) then
        fDMCadPedido.cdsPedido_Item_Processo.Edit
      else
      begin
        fDMCadPedido.cdsPedido_Item_Processo.Insert;
        fDMCadPedido.cdsPedido_Item_ProcessoID.AsInteger            := fDMCadPedido.cdsPedidoID.AsInteger;
        fDMCadPedido.cdsPedido_Item_ProcessoITEM.AsInteger          := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
        fDMCadPedido.cdsPedido_Item_ProcessoITEM_PROCESSO.AsInteger := vItemAux;
      end;
      fDMCadPedido.cdsPedido_Item_ProcessoID_PROCESSO.AsInteger   := fdmCadPedido.mProcesso_SelID.AsInteger;
      fDMCadPedido.cdsPedido_Item_ProcessoQTD_DOBRA.AsInteger     := fdmCadPedido.mProcesso_SelQtd_Dobra.AsInteger;
      fDMCadPedido.cdsPedido_Item_ProcessoQTD.AsFloat             := StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsPedido_ItensQTD.AsFloat));
      //if fDMCadPedido.mProcesso_SelUsa_Qtd_Dobra.AsString = 'S' then
        //fDMCadPedido.cdsPedido_Item_ProcessoNOME2.AsString := fDMCadPedido.cdsPedido_Item_ProcessoNOME2.AsString + ' Qtd.: ' + fdmCadPedido.mProcesso_SelQtd_Dobra.AsString;
      fDMCadPedido.cdsPedido_Item_ProcessoDTENTRADA.Clear;
      fDMCadPedido.cdsPedido_Item_ProcessoHRENTRADA.Clear;
      fDMCadPedido.cdsPedido_Item_ProcessoDTBAIXA.Clear;
      fDMCadPedido.cdsPedido_Item_ProcessoHRSAIDA.Clear;
      fDMCadPedido.cdsPedido_Item_Processo.Post;
    end;
    fDMCadPedido.mProcesso_Sel.Next;
  end;
end;


end.


