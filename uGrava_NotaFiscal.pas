unit uGrava_NotaFiscal;

interface

uses
  Classes, SysUtils, DB, Dialogs, Variants, SqlExpr, DmdDatabase, UDMCadNotaFiscal, dbXPress,
  uDMCadExtComissao, UDMGravarFinanceiro;

procedure prc_Gravar(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo: string = 'ALT');

procedure prc_Gravar_Comissao(fDMCadNotaFiscal: TDMCadNotaFiscal; Prazo: string = '');

procedure Gravar_Duplicata(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo, TransfICMS: string; Parcela: Integer; Valor: Real; Data: TDateTime; Prazo: string; Perc_Base_Comissao: Real);
                                               //Tipo  P= Contas a Pagar   R= Contas a Receber
                                               //Prazo = ENT=Entrada  AVI=Avista

procedure Gravar_Dupicata_Hist(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo: string);

procedure prc_Gravar_Financeiro(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo: string);//ENT=Entrada   AVI= Avista

procedure prc_Ajustar_Comissao_Itens(fDMCadNotaFiscal: TDMCadNotaFiscal);

function fnc_Calcula_PercComissao(fDMCadNotaFiscal: TDMCadNotaFiscal): Boolean;

procedure prc_Ajustar_ExtComissao(fDMCadNotaFiscal: TDMCadNotaFiscal);

procedure prc_Ajustar_Itens(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo: String); //AT= Atualiza todos   AI= Somente os que tem o iten de origem igual
                                                                                //ET= Excluir Todos    EI= Excluir os que tem o item de origem igual

procedure prc_Verificar_Consumo(fDMCadNotaFiscal: TDMCadNotaFiscal);

function fnc_Busca_Vend_Int_Ped(ID_Ped: Integer): Integer;

function fnc_Existe_Est_Baixado_LoteMat(ID: Integer): Boolean;  //07/10/2019

function fnc_Possui_Erro(fDMCadNotaFiscal: TDMCadNotaFiscal; NaoContDupl: Boolean = False): Boolean;

function fnc_verifica_tit_pago(ID : Integer) : Boolean;

implementation

uses
  DateUtils, uUtilPadrao;

procedure prc_Gravar(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo: string = 'ALT');
var
  sds: TSQLDataSet;
  ID: TTransactionDesc;
  vSerie: string;
  vNumNota: Integer;
  vAux: Integer;
  vGravar: Boolean;
  vID_ClienteAux: Integer;
  vNomeAux: string;
  Flag: Boolean;
  vID_NotaAux : Integer;
  vRefazer_Titulo : String;
  vTipo_ESAux : String;
begin
  vGravar := False;
  vID_ClienteAux  := fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger;
  vID_NotaAux     := fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger;
  vRefazer_Titulo := fDMCadNotaFiscal.cdsNotaFiscalREFAZER_TITULOS.AsString;
  vTipo_ESAux     := fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString;
  
  if fDMCadNotaFiscal.cdsNotaFiscalNUMNOTA.AsInteger < 1 then
  begin
    sds := TSQLDataSet.Create(nil);

    ID.TransactionID := 1;
    ID.IsolationLevel := xilREADCOMMITTED;
    dmDatabase.scoDados.StartTransaction(ID);

    try
      try
        vNomeAux := 'NOTAFISCAL';
        sds.SQLConnection := dmDatabase.scoDados;

        vAux := dmDatabase.ProximaTabelaLoc(vNomeAux);

        sds.NoMetadata := True;
        sds.GetMetadata := False;
        sds.CommandText := ' UPDATE TABELALOC SET FLAG = ' + IntToStr(vAux) + ' WHERE TABELA = ' + QuotedStr(vNomeAux);
        //sds.CommandText   := ' UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr(vNomeAux);
        Flag := False;
        while not Flag do
        begin
          try
            sds.Close;
            sds.ExecSQL;
            Flag := True;
          except
            on E: Exception do
              Flag := False;
          end;
        end;
        //sds.ExecSQL();
      except
        raise
      end;

      if fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE' then
      begin

      end
      else if fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS' then
      begin
        //12/11/2015
        vSerie := '';
        if (fDMCadNotaFiscal.cdsParametrosCONTROLAR_SERIE_OPERACAO.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscalID_OPERACAO_NOTA.AsInteger > 0) then
        begin
          if fDMCadNotaFiscal.cdsOperacao_Nota.Locate('ID', fDMCadNotaFiscal.cdsNotaFiscalID_OPERACAO_NOTA.AsInteger, [loCaseInsensitive]) then
            vSerie := trim(fDMCadNotaFiscal.cdsOperacao_NotaSERIE_NFE.AsString);
        end;
        //12/11/2015
        if trim(vSerie) = '' then
        begin
          if (copy(Tipo, 1, 1) = '1') or (copy(Tipo, 1, 1) = '2') then
            vSerie := fDMCadNotaFiscal.cdsFilialSERIENORMAL.AsString
          else
            vSerie := fDMCadNotaFiscal.cdsParametrosSERIECONTINGENCIA.AsString;
        end;
        fDMCadNotaFiscal.cdsFilial.Locate('ID', fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger, [loCaseInsensitive]);
        if fDMCadNotaFiscal.cdsFilialNUM_NOTA_RAMIRO.AsInteger > 0 then
        begin
          fDMCadNotaFiscal.qProximaNotaRamiro.Close;
          fDMCadNotaFiscal.qProximaNotaRamiro.ParamByName('FILIAL').AsInteger := fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger;
          fDMCadNotaFiscal.qProximaNotaRamiro.ParamByName('SERIE').AsString := vSerie;
          fDMCadNotaFiscal.qProximaNotaRamiro.ParamByName('NUM_NOTA_RAMIRO').AsInteger := fDMCadNotaFiscal.cdsFilialNUM_NOTA_RAMIRO.AsInteger;
          fDMCadNotaFiscal.qProximaNotaRamiro.Open;
          vNumNota := fDMCadNotaFiscal.qProximaNotaRamiroNUMNOTA.AsInteger + 1;
        end
        else
        begin
          fDMCadNotaFiscal.qProximaNota.Close;
          fDMCadNotaFiscal.qProximaNota.ParamByName('FILIAL').AsInteger := fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger;
          fDMCadNotaFiscal.qProximaNota.ParamByName('SERIE').AsString := vSerie;
          fDMCadNotaFiscal.qProximaNota.Open;
          vNumNota := fDMCadNotaFiscal.qProximaNotaNUMNOTA.AsInteger + 1;
        end;

        fDMCadNotaFiscal.cdsNotaFiscalSERIE.AsString := vSerie;
        fDMCadNotaFiscal.cdsNotaFiscalNUMNOTA.AsInteger := vNumNota;
        fDMCadNotaFiscal.cdsNotaFiscalTIPO_ENVIONFE.AsString := Tipo;
        fDMCadNotaFiscal.cdsNotaFiscalNFEVERSAO.AsString := fDMCadNotaFiscal.cdsParametrosVERSAONFE.AsString;
        fDMCadNotaFiscal.cdsNotaFiscalNFEVERSAOEMISSAO.AsString := fDMCadNotaFiscal.cdsParametrosVERSAOEMISSAONFE.AsString;

        vAux := fDMCadNotaFiscal.cdsNotaFiscal_Itens.RecordCount;
        fDMCadNotaFiscal.cdsNotaFiscalQTDTOTAL_ITENS.AsInteger := vAux;
      end;
      fDMCadNotaFiscal.cdsNotaFiscal.Post;

      //17/08/2016
      if (fDMCadNotaFiscal.qParametros_GeralGRAVAR_HIST_SENHA.AsString = 'S') then
        fDMCadNotaFiscal.prc_Gravar_cdsHist_Senha;
      //****************
      fDMCadNotaFiscal.cdsNotaFiscal.ApplyUpdates(0);

      dmDatabase.scoDados.Commit(ID);

      vGravar := True;

      fDMCadNotaFiscal.mSenha.EmptyDataSet;
    except
      vGravar := fALSE;
      dmDatabase.scoDados.Rollback(ID);
      raise;
    end;
    FreeAndNil(sds);
  end
  else
  begin
    fDMCadNotaFiscal.cdsNotaFiscal.Post;

    if (fDMCadNotaFiscal.qParametros_GeralGRAVAR_HIST_SENHA.AsString = 'S') then
      fDMCadNotaFiscal.prc_Gravar_cdsHist_Senha;

    fDMCadNotaFiscal.cdsNotaFiscal.ApplyUpdates(0);
    vGravar := True;
  end;

  if vGravar then
  begin
    //27/06/2016
    fDMCadNotaFiscal.sdsPRC_Atualiza_DtNota.Close;
    fDMCadNotaFiscal.sdsPRC_Atualiza_DtNota.ParamByName('C_ID').AsInteger := vID_ClienteAux;
    fDMCadNotaFiscal.sdsPRC_Atualiza_DtNota.ExecSQL;

    if (vTipo_ESAux = 'S') and (vRefazer_Titulo = 'S') then
    begin
      sds := TSQLDataSet.Create(nil);
      try
        vNomeAux := 'NOTAFISCAL';
        sds.SQLConnection := dmDatabase.scoDados;
        sds.NoMetadata := True;
        sds.GetMetadata := False;
        sds.Close;
        sds.CommandType := ctStoredProc;
        sds.CommandText := 'PRC_EXCLUI_DUP_PEDIDO';
        sds.ParamByName('P_ID').AsInteger := vID_NotaAux;
        sds.ExecSQL;
      finally
        FreeAndNil(sds);
      end;

    end;
    
  end;

end;

procedure prc_Gravar_Comissao(fDMCadNotaFiscal: TDMCadNotaFiscal; Prazo: string = '');
var
  fDMCadExtComissao: TDMCadExtComissao;
  vAux: Integer;
  vVlrBase: Real;
  vID_Duplicata: Integer;
  vItem_Hist: Integer;
  vID_Nota: Integer;
  vParcela: Integer;
  vPercAux: Real;
begin
  if ((StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.vPerc_Comissao_Rateio)) <= 0)) and
     (fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString = 'S') and
     (StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) > 0) then
    exit;

  if ((fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger <= 0) or (fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.IsNull)) and
     ((fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR_INT.AsInteger <= 0) or (fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR_INT.IsNull)) then
    exit;

  if not fDMCadNotaFiscal.cdsVendedor.Locate('CODIGO', fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger, [loCaseInsensitive]) then
    if not fDMCadNotaFiscal.cdsVendedor.Locate('CODIGO', fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR_INT.AsInteger, [loCaseInsensitive]) then
      exit;

  if fDMCadNotaFiscal.cdsVendedorTIPO_COMISSAO.AsString = 'P' then
  begin
    if Prazo <> '' then
      exit;
  end
  else
  begin
    if ((fDMCadNotaFiscal.cdsVendedorTIPO_COMISSAO.AsString <> 'N') and (Prazo = '')) then
      exit;
    if ((fDMCadNotaFiscal.cdsVendedorTIPO_COMISSAO.AsString = 'N') and (Prazo <> '')) then
      exit;
  end;

  if (fDMCadNotaFiscal.cdsVendedorTIPO_COMISSAO.AsString = 'N') or (fDMCadNotaFiscal.cdsVendedorTIPO_COMISSAO.AsString = 'P') then
  begin
    vID_Nota := fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger;
    vID_Duplicata := 0;
    vParcela := 0;
    vItem_Hist := 0;
    if fDMCadNotaFiscal.cdsVendedorTIPO_COMISSAO.AsString = 'N' then
    begin
      //15/09/2016
      //vVlrBase      := cdsNotaFiscalVLR_DUPLICATA.AsFloat
      //08/05/2019 incluido qParametros_ComUSA_CONFIG_IND
      if ((fDMCadNotaFiscal.qParametros_ComUSA_CONFIG_IND.AsString = 'N') and
         ((fDMCadNotaFiscal.qParametros_ComCOMISSAO_DESCONTAR.AsString = 'S') or
         (fDMCadNotaFiscal.qParametros_ComCOMISSAO_DESCONTAR_PIS.AsString = 'S'))) then
        vVlrBase := fDMCadNotaFiscal.cdsNotaFiscalVLR_BASE_COMISSAO.AsFloat
      else
      if (fDMCadNotaFiscal.qParametros_ComUSA_CONFIG_IND.AsString = 'S') and (uUtilPadrao.fnc_Vendedor_Desc_Com(fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger)) then
        vVlrBase := fDMCadNotaFiscal.cdsNotaFiscalVLR_BASE_COMISSAO.AsFloat
      else
        vVlrBase := fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat;
    end
    else
    begin
      //08/05/2019
      if ((fDMCadNotaFiscal.qParametros_ComUSA_CONFIG_IND.AsString = 'N') and
         ((fDMCadNotaFiscal.qParametros_ComCOMISSAO_DESCONTAR.AsString = 'S') or
         (fDMCadNotaFiscal.qParametros_ComCOMISSAO_DESCONTAR_PIS.AsString = 'S'))) then
        vVlrBase := StrToFloat(FormatFloat('0.00', (fDMCadNotaFiscal.cdsNotaFiscalVLR_BASE_COMISSAO.AsFloat *
                    fDMCadNotaFiscal.cdsParametrosPERC_COMISSAO_PAGA_NOTA.AsFloat) / 100))
      else
      if (fDMCadNotaFiscal.qParametros_ComUSA_CONFIG_IND.AsString = 'S') and
         (uUtilPadrao.fnc_Vendedor_Desc_Com(fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger)) then
        vVlrBase := StrToFloat(FormatFloat('0.00',(fDMCadNotaFiscal.cdsNotaFiscalVLR_BASE_COMISSAO.AsFloat *
                    fDMCadNotaFiscal.cdsParametrosPERC_COMISSAO_PAGA_NOTA.AsFloat) / 100))
      else
        vVlrBase := StrToFloat(FormatFloat('0.00',(fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat *
                    fDMCadNotaFiscal.cdsParametrosPERC_COMISSAO_PAGA_NOTA.AsFloat) / 100));
    end;
  end
  else if (fDMCadNotaFiscal.cdsVendedorTIPO_COMISSAO.AsString = 'D') then
  begin
    vID_Nota := 0;
    vID_Duplicata := fDMCadNotaFiscal.cdsDuplicataID.AsInteger;
    vParcela := fDMCadNotaFiscal.cdsDuplicataPARCELA.AsInteger;
    vItem_Hist := fDMCadNotaFiscal.cdsDuplicata_HistITEM.AsInteger;
    if (StrToCurr(FormatCurr('0.0000',fDMCadNotaFiscal.cdsDuplicataPERC_BASE_COMISSAO.AsFloat)) = 0)
      or (StrToCurr(FormatCurr('0.0000',fDMCadNotaFiscal.cdsDuplicataPERC_BASE_COMISSAO.AsFloat)) >= 100) then
      vVlrBase := fDMCadNotaFiscal.cdsDuplicataVLR_PARCELA.AsFloat
    else
      vVlrBase := StrToCurr(FormatCurr('0.0000',(fDMCadNotaFiscal.cdsDuplicataVLR_PARCELA.AsFloat *
                  fDMCadNotaFiscal.cdsDuplicataPERC_BASE_COMISSAO.AsFloat) / 100));
  end;

  fDMCadExtComissao := TDMCadExtComissao.Create(fDMCadExtComissao);
  try
    if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString <> 'I') then
      vPercAux := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO.AsFloat))
    else if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I') then
      vPercAux := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.vPerc_Comissao_Rateio));

    vAux := fDMCadExtComissao.fnc_Mover_Comissao(0,'ENT',fDMCadNotaFiscal.cdsNotaFiscalSERIE.AsString,
            '', 0, fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime,fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger,
            fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger, vID_Nota,vID_Duplicata,vItem_Hist,
            fDMCadNotaFiscal.cdsNotaFiscalNUMNOTA.AsInteger,fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger, vParcela,
            0, 0, 0, StrToFloat(FormatFloat('0.00', vVlrBase)), 0, StrToFloat(FormatFloat('0.0000', vPercAux)), 0, 0);
  except
    raise;
  end;
  FreeAndNil(fDMCadExtComissao);
end;

procedure Gravar_Duplicata(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo, TransfICMS: string; Parcela: Integer; Valor: Real; Data: TDateTime; Prazo: string; Perc_Base_Comissao: Real);
var
  vAux: Integer;
begin
  if not fDMCadNotaFiscal.cdsDuplicata.Active then
    fDMCadNotaFiscal.Abrir_cdsDuplicata(0);

  vAux := dmDatabase.ProximaSequencia('DUPLICATA', 0);
  if Parcela = 0 then
    Prazo := 'ENT';

  fDMCadNotaFiscal.cdsDuplicata.Insert;
  fDMCadNotaFiscal.cdsDuplicataID.AsInteger := vAux;
  if Tipo = 'R' then
    fDMCadNotaFiscal.cdsDuplicataTIPO_ES.AsString := 'E'
  else
    fDMCadNotaFiscal.cdsDuplicataTIPO_ES.AsString := 'S';
  fDMCadNotaFiscal.cdsDuplicataFILIAL.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger;
  fDMCadNotaFiscal.cdsDuplicataID_NOTA.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger;
  fDMCadNotaFiscal.cdsDuplicataPARCELA.AsInteger := Parcela;
  fDMCadNotaFiscal.cdsDuplicataNUMDUPLICATA.AsString := fDMCadNotaFiscal.cdsNotaFiscalNUMNOTA.AsString;
  if fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'RNF' then
    fDMCadNotaFiscal.cdsDuplicataNUMNOTA.AsInteger := 0
  else
    fDMCadNotaFiscal.cdsDuplicataNUMNOTA.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalNUMNOTA.AsInteger;
  fDMCadNotaFiscal.cdsDuplicataSERIE.AsString := fDMCadNotaFiscal.cdsNotaFiscalSERIE.AsString;
  fDMCadNotaFiscal.cdsDuplicataDTVENCIMENTO.AsDateTime := Data;
  fDMCadNotaFiscal.cdsDuplicataVLR_PARCELA.AsFloat := StrToFloat(FormatFloat('0.00', Valor));
  fDMCadNotaFiscal.cdsDuplicataVLR_RESTANTE.AsFloat := StrToFloat(FormatFloat('0.00', Valor));
  fDMCadNotaFiscal.cdsDuplicataVLR_PAGO.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  fDMCadNotaFiscal.cdsDuplicataVLR_DEVOLUCAO.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  fDMCadNotaFiscal.cdsDuplicataVLR_DESPESAS.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  fDMCadNotaFiscal.cdsDuplicataVLR_DESCONTO.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  fDMCadNotaFiscal.cdsDuplicataVLR_JUROSPAGOS.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  fDMCadNotaFiscal.cdsDuplicataVLR_MULTA.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  fDMCadNotaFiscal.cdsDuplicataVLR_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.00', 0));
  if fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I' then
    fDMCadNotaFiscal.cdsDuplicataPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.0000', fDMCadNotaFiscal.vPerc_Comissao_Rateio))
  else
    fDMCadNotaFiscal.cdsDuplicataPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.0000', fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO.AsFloat));
  fDMCadNotaFiscal.cdsDuplicataDTULTPAGAMENTO.Clear;
  fDMCadNotaFiscal.cdsDuplicataID_PESSOA.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger;
  if fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger > 0 then
    fDMCadNotaFiscal.cdsDuplicataID_VENDEDOR.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger;
  if fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR_INT.AsInteger > 0 then
  begin
    fDMCadNotaFiscal.cdsDuplicataID_VENDEDOR_INT.AsInteger    := fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR_INT.AsInteger;
    fDMCadNotaFiscal.cdsDuplicataPERC_COMISSAO_INT.AsCurrency := fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO_INT.AsCurrency;
  end;

  if ((Prazo = 'AVI') and (fDMCadNotaFiscal.cdsParametrosQUITAR_AVISTA_AUT.AsString = 'S')) then
  begin
    if fDMCadNotaFiscal.cdsNotaFiscalID_CONTA.AsInteger > 0 then
      fDMCadNotaFiscal.cdsDuplicataID_CONTA.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_CONTA.AsInteger;
    if fDMCadNotaFiscal.cdsNotaFiscalID_TIPO_COBRANCA.AsInteger > 0 then
      fDMCadNotaFiscal.cdsDuplicataID_TIPOCOBRANCA.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_TIPO_COBRANCA.AsInteger;
    if fDMCadNotaFiscal.cdsNotaFiscalID_CONTA.AsInteger > 0 then
      fDMCadNotaFiscal.cdsDuplicataID_CONTA_BOLETO.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_CONTA.AsInteger;
    fDMCadNotaFiscal.cdsDuplicataDTULTPAGAMENTO.AsDateTime := Date;
    fDMCadNotaFiscal.cdsDuplicataVLR_RESTANTE.AsFloat := StrToFloat(FormatFloat('0.00', 0));
    fDMCadNotaFiscal.cdsDuplicataVLR_PAGO.AsFloat := StrToFloat(FormatFloat('0.00', Valor));
  end
  else
  begin
    if fDMCadNotaFiscal.cdsNotaFiscal_ParcID_CONTA.AsInteger > 0 then
      fDMCadNotaFiscal.cdsDuplicataID_CONTA.AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ParcID_CONTA.AsInteger
    else if fDMCadNotaFiscal.cdsNotaFiscalID_CONTA.AsInteger > 0 then
      fDMCadNotaFiscal.cdsDuplicataID_CONTA.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_CONTA.AsInteger;
    if fDMCadNotaFiscal.cdsNotaFiscal_ParcID_TIPOCOBRANCA.AsInteger > 0 then
      fDMCadNotaFiscal.cdsDuplicataID_TIPOCOBRANCA.AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ParcID_TIPOCOBRANCA.AsInteger
    else if fDMCadNotaFiscal.cdsNotaFiscalID_TIPO_COBRANCA.AsInteger > 0 then
      fDMCadNotaFiscal.cdsDuplicataID_TIPOCOBRANCA.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_TIPO_COBRANCA.AsInteger;
    if fDMCadNotaFiscal.cdsDuplicataID_CONTA.AsInteger > 0 then
      fDMCadNotaFiscal.cdsDuplicataID_CONTA_BOLETO.AsInteger := fDMCadNotaFiscal.cdsDuplicataID_CONTA.AsInteger;
    if (Prazo = 'ENT') then
    begin
      fDMCadNotaFiscal.cdsDuplicataDTULTPAGAMENTO.AsDateTime := Date;
      fDMCadNotaFiscal.cdsDuplicataVLR_RESTANTE.AsFloat := StrToFloat(FormatFloat('0.00', 0));
      fDMCadNotaFiscal.cdsDuplicataVLR_PAGO.AsFloat := StrToFloat(FormatFloat('0.00', Valor));
    end;
  end;
  //aqui 29/11/2016
  //cdsDuplicataID_CONTA_BOLETO.AsInteger := 99;
  fDMCadNotaFiscal.cdsDuplicataID_COMISSAO.AsInteger := 0;
  fDMCadNotaFiscal.cdsDuplicataQTD_DIASATRASO.AsInteger := 0;
  fDMCadNotaFiscal.cdsDuplicataDTRECEBIMENTO_TITULO.Clear;
  fDMCadNotaFiscal.cdsDuplicataDTEMISSAO.AsDateTime := fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime;
  fDMCadNotaFiscal.cdsDuplicataPAGO_CARTORIO.AsString := 'N';
  fDMCadNotaFiscal.cdsDuplicataPROTESTADO.AsString := 'N';
  fDMCadNotaFiscal.cdsDuplicataTIPO_LANCAMENTO.AsString := fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString;
  fDMCadNotaFiscal.cdsDuplicataARQUIVO_GERADO.AsString := 'N';
  fDMCadNotaFiscal.cdsDuplicataTRANSFERENCIA_ICMS.AsString := TransfICMS;
  fDMCadNotaFiscal.cdsDuplicataNOSSONUMERO.AsString := '';
  fDMCadNotaFiscal.cdsDuplicataDTFINANCEIRO.Clear;
  fDMCadNotaFiscal.cdsDuplicataNUMCHEQUE.AsInteger := 0;
  fDMCadNotaFiscal.cdsDuplicataACEITE.AsString := '';
  fDMCadNotaFiscal.cdsDuplicataPERC_COMISSAO_PAGAR_NOTA.AsFloat := StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO_PAGAR_NOTA.AsFloat));
  //08/02/2016
  fDMCadNotaFiscal.cdsDuplicataPERC_BASE_COMISSAO.AsFloat := Perc_Base_Comissao;
  if fDMCadNotaFiscal.cdsNotaFiscalID_CONTA_ORCAMENTO.AsInteger > 0 then
    fDMCadNotaFiscal.cdsDuplicataID_CONTA_ORCAMENTO.AsInteger := fDMCadNotaFiscal.cdsNotaFiscalID_CONTA_ORCAMENTO.AsInteger
  else
    fDMCadNotaFiscal.cdsDuplicataID_CONTA_ORCAMENTO.Clear;
  if Tipo = 'P' then
  begin
    fDMCadNotaFiscal.cdsDuplicataANO_REF.AsInteger := YearOf(fDMCadNotaFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime);
    fDMCadNotaFiscal.cdsDuplicataMES_REF.AsInteger := MonthOf(fDMCadNotaFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime);
  end;
  fDMCadNotaFiscal.cdsDuplicataTITULO_CARTORIO.AsString := 'N';
  //12/07/2016
  if vTerminal <= 0 then
    fDMCadNotaFiscal.cdsDuplicataID_TERMINAL.Clear
  else
    fDMCadNotaFiscal.cdsDuplicataID_TERMINAL.AsInteger := vTerminal;
  fDMCadNotaFiscal.cdsDuplicata.Post;

  Gravar_Dupicata_Hist(fDMCadNotaFiscal, 'ENT');
  if (Prazo = 'ENT') or ((Prazo = 'AVI') and (fDMCadNotaFiscal.cdsParametrosQUITAR_AVISTA_AUT.AsString = 'S')) then
    Gravar_Dupicata_Hist(fDMCadNotaFiscal, 'PAG');

  fDMCadNotaFiscal.cdsDuplicata.ApplyUpdates(0);
end;

procedure Gravar_Dupicata_Hist(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo: string);
var
  vItemAux: Integer;
begin
  fDMCadNotaFiscal.cdsDuplicata_Hist.Last;
  vItemAux := fDMCadNotaFiscal.cdsDuplicata_HistITEM.AsInteger;
  vItemAux := vItemAux + 1;

  fDMCadNotaFiscal.cdsDuplicata_Hist.Insert;
  fDMCadNotaFiscal.cdsDuplicata_HistID.AsInteger := fDMCadNotaFiscal.cdsDuplicataID.AsInteger;
  fDMCadNotaFiscal.cdsDuplicata_HistITEM.AsInteger := vItemAux;
  fDMCadNotaFiscal.cdsDuplicata_HistTIPO_HISTORICO.AsString := 'ENT';
  fDMCadNotaFiscal.cdsDuplicata_HistID_HISTORICO.AsInteger := 0;
  fDMCadNotaFiscal.cdsDuplicata_HistVLR_LANCAMENTO.AsFloat := fDMCadNotaFiscal.cdsDuplicataVLR_PARCELA.AsFloat;
  fDMCadNotaFiscal.cdsDuplicata_HistVLR_JUROSPAGOS.AsFloat := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsDuplicata_HistVLR_MULTA.AsFloat := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsDuplicata_HistVLR_DESCONTOS.AsFloat := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsDuplicata_HistVLR_DESPESAS.AsFloat := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsDuplicata_HistVLR_DEVOLUCAO.AsFloat := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsDuplicata_HistVLR_JUROSCALCULADO.AsFloat := StrToFloat(FormatFloat('0.00',0));
  if Tipo = 'ENT' then
  begin
    fDMCadNotaFiscal.cdsDuplicata_HistCOMPLEMENTO.AsString := 'ENTRADA DO T�TULO';
    fDMCadNotaFiscal.cdsDuplicata_HistVLR_PAGAMENTO.AsFloat := StrToFloat(FormatFloat('0.00',0));
  end
  else if Tipo = 'PAG' then
  begin
    fDMCadNotaFiscal.cdsDuplicata_HistTIPO_HISTORICO.AsString := 'PAG';
    fDMCadNotaFiscal.cdsDuplicata_HistCOMPLEMENTO.AsString    := 'PAGAMENTO DO T�TULO';
    fDMCadNotaFiscal.cdsDuplicata_HistVLR_PAGAMENTO.AsFloat   := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsDuplicataVLR_PARCELA.AsFloat));
    fDMCadNotaFiscal.cdsDuplicata_HistVLR_LANCAMENTO.AsFloat  := StrToFloat(FormatFloat('0.00',0));
    fDMCadNotaFiscal.cdsDuplicata_HistID_FORMA_PAGAMENTO.AsInteger := fDMCadNotaFiscal.cdsDuplicataID_TIPOCOBRANCA.AsInteger;
  end;
  fDMCadNotaFiscal.cdsDuplicata_HistDTHISTORICO.AsDateTime  := Date;
  fDMCadNotaFiscal.cdsDuplicata_HistDTLANCAMENTO.AsDateTime := fDMCadNotaFiscal.cdsDuplicataDTEMISSAO.AsDateTime;
  fDMCadNotaFiscal.cdsDuplicata_HistNUMCHEQUE.AsInteger := 0;
  fDMCadNotaFiscal.cdsDuplicata_HistDTPREVISAO_CHEQUE.Clear;
  if fDMCadNotaFiscal.cdsDuplicataID_CONTA.AsInteger > 0 then
    fDMCadNotaFiscal.cdsDuplicata_HistID_CONTA.AsInteger := fDMCadNotaFiscal.cdsDuplicataID_CONTA.AsInteger;
  fDMCadNotaFiscal.cdsDuplicata_HistID_COMISSAO.AsInteger := 0;
  fDMCadNotaFiscal.cdsDuplicata_HistTIPO_ES.AsString := fDMCadNotaFiscal.cdsDuplicataTIPO_ES.AsString;
  fDMCadNotaFiscal.cdsDuplicata_Hist.Post;

  if Tipo = 'PAG' then
  begin
    if fDMCadNotaFiscal.cdsNotaFiscalTIPO_PRAZO.AsString = 'V' then
    begin
      prc_Gravar_Comissao(fDMCadNotaFiscal,'AVI');
      prc_Gravar_Financeiro(fDMCadNotaFiscal,'AVI');
    end
    else
    begin
      prc_Gravar_Comissao(fDMCadNotaFiscal,'ENT');
      prc_Gravar_Financeiro(fDMCadNotaFiscal,'ENT');
    end
  end;
end;

procedure prc_Gravar_Financeiro(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo: string);//ENT=Entrada   AVI= Avista
var
  fDMGravarFinanceiro: TDMGravarFinanceiro;
begin
  fDMGravarFinanceiro := TDMGravarFinanceiro.Create(fDMGravarFinanceiro);

  fDMCadNotaFiscal.cdsCliente.Locate('CODIGO', fDMCadNotaFiscal.cdsDuplicataID_PESSOA.AsInteger, ([Locaseinsensitive]));

  fDMGravarFinanceiro.vTipo_ES := 'E';
  if Tipo = 'ENT' then
    fDMGravarFinanceiro.vHistorico_Compl := 'Recto.Entrada ref. Doc n� ' + fDMCadNotaFiscal.cdsDuplicataNUMDUPLICATA.AsString + ' de ' + fDMCadNotaFiscal.cdsClienteNOME.AsString
  else if Tipo = 'AVI' then
    fDMGravarFinanceiro.vHistorico_Compl := 'Recto.A Vista ref. Doc n� ' + fDMCadNotaFiscal.cdsDuplicataNUMDUPLICATA.AsString + ' de ' + fDMCadNotaFiscal.cdsClienteNOME.AsString;

  fDMGravarFinanceiro.vID_Conta := fDMCadNotaFiscal.cdsDuplicataID_CONTA.AsInteger;
  fDMGravarFinanceiro.vID_ModDuplicata := fDMCadNotaFiscal.cdsDuplicataID.AsInteger;
  fDMGravarFinanceiro.vItem_MovDuplicata := fDMCadNotaFiscal.cdsDuplicata_HistITEM.AsInteger;
  fDMGravarFinanceiro.vID_Historico := 0;
  fDMGravarFinanceiro.vID_Pessoa    := fDMCadNotaFiscal.cdsDuplicataID_PESSOA.AsInteger;
  fDMGravarFinanceiro.vID_Forma_Pagamento := fDMCadNotaFiscal.cdsDuplicataID_TIPOCOBRANCA.AsInteger;
  fDMGravarFinanceiro.vID_ExtComissao     := 0;
  fDMGravarFinanceiro.vDtMovimento        := fDMCadNotaFiscal.cdsDuplicata_HistDTLANCAMENTO.AsDateTime;
  fDMGravarFinanceiro.vVlr_Movimento      := StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsDuplicata_HistVLR_PAGAMENTO.AsFloat));
  fDMGravarFinanceiro.vFilial_Fin         := fDMCadNotaFiscal.cdsDuplicataFILIAL.AsInteger;
  if fDMCadNotaFiscal.cdsDuplicataID_CONTA_ORCAMENTO.AsInteger > 0 then
    fDMGravarFinanceiro.vID_Conta_Orcamento := fDMCadNotaFiscal.cdsDuplicataID_CONTA_ORCAMENTO.AsInteger
  else
    fDMGravarFinanceiro.vID_Conta_Orcamento := 0;
  fDMGravarFinanceiro.vFilial_Fin         := fDMCadNotaFiscal.cdsDuplicataFILIAL.AsInteger;

  fDMGravarFinanceiro.prc_Gravar;

  FreeAndNil(fDMGravarFinanceiro);
end;

procedure prc_Ajustar_Comissao_Itens(fDMCadNotaFiscal: TDMCadNotaFiscal);
begin
  fDMCadNotaFiscal.cdsNotaFiscal_Consulta.First;
  while not fDMCadNotaFiscal.cdsNotaFiscal_Consulta.Eof do
  begin
    if (fDMCadNotaFiscal.cdsNotaFiscal_ConsultaTIPO_NOTA.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscal_ConsultaID_VENDEDOR.AsInteger
      > 0) and (StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsNotaFiscal_ConsultaVLR_DUPLICATA.AsFloat)) > 0) then
    begin
      fDMCadNotaFiscal.prc_Localizar(fDMCadNotaFiscal.cdsNotaFiscal_ConsultaID.AsInteger);
      if not fDMCadNotaFiscal.cdsNotaFiscal.IsEmpty then
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_Itens.Close;
        fDMCadNotaFiscal.cdsNotaFiscal_Itens.Open;
        fDMCadNotaFiscal.vPerc_Comissao_Rateio := 0;
        if fnc_Calcula_PercComissao(fDMCadNotaFiscal) then
          prc_Ajustar_ExtComissao(fDMCadNotaFiscal);
      end;
    end;
    fDMCadNotaFiscal.cdsNotaFiscal_Consulta.Next;
  end;
  ShowMessage('Ajustado!');
end;

function fnc_Calcula_PercComissao(fDMCadNotaFiscal: TDMCadNotaFiscal): Boolean;
var
  vPercAux: Real;
  vVlrAux: Real;
  vComissaoAux: Real;
  sds: TSQLDataSet;
  vPerc1: Real;
  vTexto: string;
  vPercMaior: Real;
begin
  Result := False;
  vPerc1 := -1;
  vPercMaior := StrToFloat(FormatFloat('0', 0));
  fDMCadNotaFiscal.cdsNotaFiscal_Itens.First;
  while not fDMCadNotaFiscal.cdsNotaFiscal_Itens.Eof do
  begin
    if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I') and (fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger
      > 0) and (StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) > 0) then
    begin
      if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I') and (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat)) <= 0) then
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_Itens.Edit;
        fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat := fnc_Buscar_Comissao_Prod(fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,
          fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger, fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger);
        fDMCadNotaFiscal.cdsNotaFiscal_Itens.Post;
        Result := True;
      end;
      if StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat)) > 0 then
        vPercAux := StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat))
      else
        vPercAux := StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO.AsFloat));
      if StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DUPLICATA.AsFloat)) > 0 then
      begin
        vVlrAux := StrToFloat(FormatFloat('0.00', (fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DUPLICATA.AsFloat * vPercAux) / 100));
        vComissaoAux := StrToFloat(FormatFloat('0.00', vComissaoAux + vVlrAux));
      end;
      if (vPerc1 <> -1) and (StrToFloat(FormatFloat('0.00', vPerc1)) <> StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat))) then
        vPerc1 := -2
      else if StrToFloat(FormatFloat('0.00', vPerc1)) <> -2 then
        vPerc1 := StrToFloat(FormatFloat('0.00', fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat));
      //11/05/2017
      if StrToFloat(FormatFloat('0.00000', fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat)) > StrToFloat(FormatFloat('0.00000', vPercMaior)) then
        vPercMaior := StrToFloat(FormatFloat('0.00000', fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat));
      //*****************
    end;
    fDMCadNotaFiscal.cdsNotaFiscal_Itens.Next;
  end;
  if not Result then
    exit;

  fDMCadNotaFiscal.cdsNotaFiscal_Itens.ApplyUpdates(0);

  if (StrToFloat(FormatFloat('0.00', vComissaoAux)) > 0) and (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I') then
  begin
    vComissaoAux := StrToFloat(FormatFloat('0.00', vComissaoAux));
    if (StrToFloat(FormatFloat('0.00', vPerc1)) <> -2) and (StrToFloat(FormatFloat('0.00', vPerc1)) <> -1) then
      fDMCadNotaFiscal.vPerc_Comissao_Rateio := StrToFloat(FormatFloat('0.00', vPerc1))
    else
    begin
      fDMCadNotaFiscal.vPerc_Comissao_Rateio := StrToFloat(FormatFloat('0.00000', (vComissaoAux / (fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) * 100));
      if StrToFloat(FormatFloat('0.00000', fDMCadNotaFiscal.vPerc_Comissao_Rateio)) > StrToFloat(FormatFloat('0.00000', vPercMaior)) then
        fDMCadNotaFiscal.vPerc_Comissao_Rateio := StrToFloat(FormatFloat('0.00000', vPercMaior));
    end;
  end
  else if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString <> 'I') then
    fDMCadNotaFiscal.vPerc_Comissao_Rateio := StrToFloat(FormatFloat('0.000', fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO.AsFloat));

  sds := TSQLDataSet.Create(nil);
  try
    if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString <> 'I') then
      vPercAux := StrToFloat(FormatFloat('0.0000', fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO.AsFloat))
    else if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I') then
      vPercAux := StrToFloat(FormatFloat('0.0000', fDMCadNotaFiscal.vPerc_Comissao_Rateio));

    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata := True;
    sds.GetMetadata := False;
    vTexto := Replace2(FormatFloat('0.0000', vPercAux), ',', '.');
    sds.CommandText := ' UPDATE DUPLICATA SET PERC_COMISSAO = ' + vTexto + ' WHERE ID_NOTA = ' + IntToStr(fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger);
    sds.ExecSQL;
  except
  end;
  FreeAndNil(sds);
end;

procedure prc_Ajustar_ExtComissao(fDMCadNotaFiscal: TDMCadNotaFiscal);
var
  fDMCadExtComissao: TDMCadExtComissao;
  sds: TSQLDataSet;
begin
  fDMCadExtComissao := TDMCadExtComissao.Create(nil);

  sds := TSQLDataSet.Create(nil);

  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata := True;
    sds.GetMetadata := False;

    fDMCadExtComissao.cdsDupAux.Close;
    fDMCadExtComissao.sdsDupAux.ParamByName('ID_NOTA').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ConsultaID.AsInteger;
    fDMCadExtComissao.cdsDupAux.Open;
    fDMCadExtComissao.cdsDupAux.First;
    while not fDMCadExtComissao.cdsDupAux.Eof do
    begin
      sds.Close;
      sds.CommandText := 'select E.id from extcomissao E  WHERE E.id_duplicata = :ID_DUPLICATA ';
      SDS.ParamByName('ID_DUPLICATA').AsInteger := fDMCadExtComissao.cdsDupAuxID.AsInteger;
      sds.Open;
      if not (sds.IsEmpty) then
      begin
        fDMCadExtComissao.prc_Localizar(sds.FieldByName('ID').AsInteger);
        if not (fDMCadExtComissao.cdsExtComissao.IsEmpty) and (StrToFloat(FormatFloat('0.00000',
          fDMCadExtComissao.cdsExtComissaoPERC_COMISSAO.AsFloat)) <> StrToFloat(FormatFloat('0.00000', fDMCadExtComissao.cdsDupAuxPERC_COMISSAO.AsFloat))) then
        begin
          fDMCadExtComissao.cdsExtComissao.Edit;
          fDMCadExtComissao.cdsExtComissaoPERC_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.00000', fDMCadExtComissao.cdsDupAuxPERC_COMISSAO.AsFloat));
          fDMCadExtComissao.cdsExtComissaoVLR_COMISSAO.AsFloat := StrToFloat(FormatFloat('0.00',
            fDMCadExtComissao.cdsExtComissaoBASE_COMISSAO.AsFloat * fDMCadExtComissao.cdsExtComissaoPERC_COMISSAO.AsFloat / 100));
          fDMCadExtComissao.cdsExtComissao.Post;
          fDMCadExtComissao.cdsExtComissao.ApplyUpdates(0);
        end;
      end;
      fDMCadExtComissao.cdsDupAux.Next;
    end;
  except
  end;
  FreeAndNil(fDMCadExtComissao);
end;

function fnc_Busca_Vend_Int_Ped(ID_Ped: Integer): Integer;
var
  sds: TSQLDataSet;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select P.id_vendedor_int from PEDIDO P WHERE P.ID = :ID ';
    sds.ParamByName('ID').AsInteger := ID_Ped;
    sds.Open;
    Result := sds.FieldByName('id_vendedor_int').AsInteger;
  finally
    FreeAndNil(sds);
  end;
end;

procedure prc_Ajustar_Itens(fDMCadNotaFiscal: TDMCadNotaFiscal; Tipo: String); //AT= Atualiza todos   AI= Somente os que tem o iten de origem igual
                                                                                //ET= Excluir Todos    EI= Excluir os que tem o item de origem igual
var
  vItemOri: Integer;
  vItem_Draw: Integer;
  vNum_Draw: String;
  vNum_Reg_Exportacao: String;
  vNum_Chave_Acesso: String;
begin
  if fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.RecordCount <= 0 then
    exit;
  vItemOri := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_ORIGINAL.AsInteger;
  vItem_Draw := 0;
  vNum_Draw  := fDMCadNotaFiscal.cdsNotaFiscal_DrawBackNUM_DRAWBACK.AsString;
  vNum_Reg_Exportacao := fDMCadNotaFiscal.cdsNotaFiscal_DrawBackNUM_REG_EXPORTACAO.AsString;
  vNum_Chave_Acesso   := fDMCadNotaFiscal.cdsNotaFiscal_DrawBackNUM_CHAVE_ACESSO_NFE.AsString;
  fDMCadNotaFiscal.cdsNotaFiscal_Itens.First;
  while not fDMCadNotaFiscal.cdsNotaFiscal_Itens.Eof do
  begin
    if ((Tipo = 'ET') or ((Tipo = 'EI') and (vItemOri = fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_ORIGINAL.AsInteger)))
      or ((Tipo = 'AT') or ((Tipo = 'AI') and (vItemOri = fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_ORIGINAL.AsInteger))) then
    begin
      fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.First;
      while not fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.Eof do
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.Delete;
      fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.First;
      if (Tipo = 'AT') or ((Tipo = 'AI') and (vItemOri = fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_ORIGINAL.AsInteger)) then
      begin
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.Insert;
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBackID.AsInteger   := fDMCadNotaFiscal.cdsNotaFiscal_ItensID.AsInteger;
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBackITEM.AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM.AsInteger;
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBackITEM_DRAWBACK.AsInteger := 1;
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBackNUM_DRAWBACK.AsString := vNum_Draw;
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBackNUM_REG_EXPORTACAO.AsString   := vNum_Reg_Exportacao;
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBackNUM_CHAVE_ACESSO_NFE.AsString := vNum_Chave_Acesso;
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBackQTD.AsFloat                   := fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat;
        fDMCadNotaFiscal.cdsNotaFiscal_DrawBack.Post;
      end;
    end;
    fDMCadNotaFiscal.cdsNotaFiscal_Itens.Next;
  end;
end;

function fnc_Existe_Est_Baixado_LoteMat(ID: Integer): Boolean; //07/10/2019
var
  sds: TSQLDataSet;
begin
  Result := False;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata := True;
    sds.GetMetadata := False;
    sds.CommandText := 'SELECT COUNT(1) CONTADOR from notafiscal_itens N '
                     + 'INNER JOIN PEDIDO_ITEM P ON N.id_pedido = P.ID AND N.item_pedido = P.ITEM '
                     + 'INNER JOIN LOTE_MAT LM ON P.ID = LM.id_oc AND P.ITEM = LM.item_oc '
                     + 'WHERE N.ID = :ID AND coalesce(LM.qtd_est_baixado,0) > 0 ';
    sds.ParamByName('ID').AsInteger   := ID;
    sds.Open;
    if sds.FieldByName('CONTADOR').AsInteger > 0 then
      Result := True;
  finally
    FreeAndNil(sds);
  end;
end;

function fnc_Possui_Erro(fDMCadNotaFiscal: TDMCadNotaFiscal; NaoContDupl: Boolean = False): Boolean;
var
  vVlrAux: Real;
  vTexto: String;
  vComissaoAux: Real;
  vPercAux: Real;
begin
  Result := True;
  fDMCadNotaFiscal.vPerc_Comissao_Rateio := 0;
  vComissaoAux := 0;
  fDMCadNotaFiscal.cdsParametros.Close;
  fDMCadNotaFiscal.cdsParametros.Open;

  fDMCadNotaFiscal.vMSGNotaFiscal  := '';
  vMSgNotificacao := '';
  if (fDMCadNotaFiscal.qParametros_FinEXIGIR_CONTA_ORC_DUP.AsString = 'S') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) > 0)
    and (fDMCadNotaFiscal.cdsNotaFiscalID_CONTA_ORCAMENTO.AsInteger <= 0) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Conta de or�amento n�o informada!';
  if fDMCadNotaFiscal.cdsNotaFiscal_Itens.IsEmpty then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Nota n�o pode ficar sem item (Produto)!';
  if ((fDMCadNotaFiscal.cdsClienteTIPO_CONTRIBUINTE.AsInteger = 1) and ((trim(fDMCadNotaFiscal.cdsClienteINSCR_EST.AsString) = '') or (trim(fDMCadNotaFiscal.cdsClienteINSCR_EST.AsString) = 'ISENTO')))
    and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Inscri��o estadual n�o informada para o cliente!';
  if fDMCadNotaFiscal.qParametros_GeralUSA_ISENTO_PESSOA.AsString <> 'S' then
  begin
    if ((fDMCadNotaFiscal.cdsClienteTIPO_CONTRIBUINTE.AsInteger = 2) and ((trim(fDMCadNotaFiscal.cdsClienteINSCR_EST.AsString) = '') or (trim(fDMCadNotaFiscal.cdsClienteINSCR_EST.AsString) <> 'ISENTO')))
      and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
      fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Inscri��o estadual informada incorretamente!';
  end;
  if ((fDMCadNotaFiscal.cdsClienteTIPO_CONTRIBUINTE.AsInteger = 9) and (trim(fDMCadNotaFiscal.cdsClienteINSCR_EST.AsString) <> ''))
    and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Inscri��o estadual informada incorretamente!';
  if (fDMCadNotaFiscal.cdsNotaFiscalLOCALENTREGA.AsString = 'E') and (trim(fDMCadNotaFiscal.cdsClienteENDERECO_ENT.AsString) = '') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Local de entrega n�o pode ser (Endere�o de Entrega)!';
  if (fDMCadNotaFiscal.qParametros_NFeENDERECO_ENTREGA_BRANCO.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscalLOCALENTREGA.AsString = '') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Local de entrega n�o pode ser branco!';
  if fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger = fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTETRIANG.AsInteger then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Cliente triangular n�o pode ser o mesmo da nota)!';
  if fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger < 0 then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Natureza n�o informada no cabe�alho da nota!';
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') and ((fDMCadNotaFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime > 10) and (fDMCadNotaFiscal.cdsNotaFiscalHRSAIDAENTRADA.AsDateTime <= 0)) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Hora de sa�da precisa ser informada quando a data estiver preenchida!';
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') and ((fDMCadNotaFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime < 10) and (fDMCadNotaFiscal.cdsNotaFiscalHRSAIDAENTRADA.AsDateTime > 0)) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Data de sa�da precisa ser informada quando a hora estiver preenchida!';
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE') and (fDMCadNotaFiscal.cdsNotaFiscalNUMNOTA.AsInteger <= 0) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** N�mero da nota n�o informado!';
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE') and (trim(fDMCadNotaFiscal.cdsNotaFiscalSERIE.AsString) = '') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** S�rie da nota n�o informado!';
  if (fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger < 1) and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Fornecedor n�o informado!';
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE') and (fDMCadNotaFiscal.cdsNotaFiscalDTSAIDAENTRADA.AsDateTime < fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Data de entrada n�o pode ser menor que data de emiss�o!';
  if (fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger < 1) and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Cliente n�o informado!';
  if fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime < 10 then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Data de Emiss�o n�o informada!';
  if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) > 0) and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_PRAZO.AsString = 'N') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Prazo de pagamento n�o pode ser nenhum!';
  if (trim(fDMCadNotaFiscal.cdsNotaFiscalTIPO_FRETE.AsString) = '') and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Tipo do frete n�o informado!';
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') and (StrToFloat(FormatFloat('0.00000',fDMCadNotaFiscal.cdsNotaFiscalPESOBRUTO.AsFloat)) < StrToFloat(FormatFloat('0.00000',fDMCadNotaFiscal.cdsNotaFiscalPESOLIQUIDO.AsFloat))) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Peso Bruto n�o pode ser menor que o l�quido!';
  if (length(fDMCadNotaFiscal.cdsNotaFiscalPLACA.AsString) > 1) and (length(fDMCadNotaFiscal.cdsNotaFiscalPLACA.AsString) <> 7) and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Placa inv�lida!';
  if (length(fDMCadNotaFiscal.cdsNotaFiscalPLACA.AsString) > 1) and (trim(fDMCadNotaFiscal.cdsNotaFiscalUFPLACA.AsString) = '') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Quando a placa for informada, � obrigat�rio informar a UF!';
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_PRAZO.AsString = 'V') and (fDMCadNotaFiscal.cdsNotaFiscalID_CONTA.AsInteger <= 0) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Nota � A Vista, precisa informar a conta/banco para lan�amento no financeiro!';
  if trim(fDMCadNotaFiscal.cdsFilialSERIENORMAL.AsString) = '' then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** S�rie n�o foi informada no cadastro da Filial/Empresa!';
  if ((fDMCadNotaFiscal.cdsNotaFiscalTIPO_ATENDIMENTO.AsInteger < 0) or (fDMCadNotaFiscal.cdsNotaFiscalTIPO_ATENDIMENTO.IsNull))
    and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Tipo de atendimento n�o informado!';
  if ((fDMCadNotaFiscal.cdsNotaFiscalNFEFINALIDADE.IsNull) or (trim(fDMCadNotaFiscal.cdsNotaFiscalNFEFINALIDADE.AsString) = ''))
    and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** NFE finalidade n�o informada!';
  if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO.AsFloat)) > 0) and (fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger <= 0) and
     (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Nota com % de comiss�o e o vendedor n�o informado!';
  if (fDMCadNotaFiscal.cdsNotaFiscalID_TRANSPORTADORA.AsInteger > 0) and (fDMCadNotaFiscal.vMSGNotaFiscal = '') and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
  begin
    if not fDMCadNotaFiscal.cdsTransportadora.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_TRANSPORTADORA.AsInteger,([Locaseinsensitive])) then
      fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Transportadora n�o encontrada!'
    else
    begin
      if (trim(fDMCadNotaFiscal.cdsTransportadoraENDERECO.AsString) = '') or (trim(fDMCadNotaFiscal.cdsTransportadoraNUM_END.AsString) = '') then
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Endere�o/N� da transportadora n�o informado!';
      if fDMCadNotaFiscal.cdsTransportadoraID_CIDADE.AsInteger <= 0 then
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Cidade da transportadora n�o informada!';
      if fDMCadNotaFiscal.cdsTransportadoraUF.AsString = '' then
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** UF da transportadora n�o informada!';
      vTexto := Monta_Numero(fDMCadNotaFiscal.cdsTransportadoraCNPJ_CPF.AsString,0);
      if trim(vTexto) = '' then
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CNPJ/CPF da transportadora n�o informado!';
      vTexto := Monta_Numero(fDMCadNotaFiscal.cdsTransportadoraCEP.AsString,0);
      if Length(vTexto) <> 8 then
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CEP da transportadora esta incorreto!';
    end;
  end;
  if (fDMCadNotaFiscal.vMSGNotaFiscal = '') and ((fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') or (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'RNF')) then
  begin
    if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
    begin
      if fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger <= 0 then
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Cliente n�o informado!'
      else
      if not fDMCadNotaFiscal.cdsCliente.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,([Locaseinsensitive])) then
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Cliente n�o encontrado!'
      else
      begin
        if (trim(fDMCadNotaFiscal.cdsClienteENDERECO.AsString) = '') or (trim(fDMCadNotaFiscal.cdsClienteNUM_END.AsString) = '') then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Endere�o/N� do cliente n�o informado!';
        if fDMCadNotaFiscal.cdsClienteID_CIDADE.AsInteger <= 0 then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Cidade do cliente n�o informada!';
        if fDMCadNotaFiscal.cdsClienteUF.AsString = '' then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** UF do cliente n�o informada!';
        vTexto := Monta_Numero(fDMCadNotaFiscal.cdsClienteCNPJ_CPF.AsString,0);
        if trim(vTexto) = '' then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CNPJ/CPF do cliente n�o informado!';
        vTexto := Monta_Numero(fDMCadNotaFiscal.cdsClienteCEP.AsString,0);
        if Length(vTexto) <> 8 then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CEP do cliente esta incorreto!';
        //Endere�o de Entrega
        if (trim(fDMCadNotaFiscal.cdsClienteENDERECO_ENT.AsString) <> '') and (fDMCadNotaFiscal.cdsParametrosMOSTRAR_END_ENTREGA_DADOS_ADI.AsString <> 'S') then
        begin
          if (trim(fDMCadNotaFiscal.cdsClienteNUM_END.AsString) = '') then
            fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** N� do endere�o de entrega do cliente n�o informado!';
          if fDMCadNotaFiscal.cdsClienteID_CIDADE_ENT.AsInteger <= 0 then
            fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Cidade do endere�o de entrega do cliente n�o informada!';
          if fDMCadNotaFiscal.cdsClienteUF_ENT.AsString = '' then
            fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** UF do endere�o de entrega do cliente n�o informada!';
          vTexto := Monta_Numero(fDMCadNotaFiscal.cdsClienteCNPJ_CPF_ENT.AsString,0);
          if trim(vTexto) = '' then
            fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CNPJ/CPF do endere�o de entrega do cliente n�o informado!';
          vTexto := Monta_Numero(fDMCadNotaFiscal.cdsClienteCEP_ENT.AsString,0);
          if Length(vTexto) <> 8 then
            fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CEP do endere�o de entrega do cliente esta incorreto!';
        end;
      end;
      if fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger,([Locaseinsensitive])) then
      begin
        if (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '7') and ((trim(fDMCadNotaFiscal.cdsNotaFiscalUFEMBEXPORTACAO.AsString) = '') or (Trim(fDMCadNotaFiscal.cdsNotaFiscalLOCALEMBEXPORTACAO.AsString) = '')) then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Nota Exporta��o, n�o foi informada a UF ou Local de Embarque!';
        if ((copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '1') or (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '2') or (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '3')) and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString <> 'E') then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CFOP � de entrada!';
        if ((copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '5') or (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '6') or (copy(fDMCadNotaFiscal.cdsCFOPCODCFOP.AsString,1,1) = '7')) and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString <> 'S') then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CFOP � de sa�da!';
        if (fDMCadNotaFiscal.cdsCFOPCOPIARNOTATRIANGULAR.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTETRIANG.AsInteger <= 0) then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Cliente triangular n�o foi informado!';
        if (fDMCadNotaFiscal.cdsCFOPCOPIARNOTATRIANGULAR.AsString = 'S') and (fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTETRIANG.AsInteger > 0) and (fDMCadNotaFiscal.cdsParametrosID_OPERACAO_TRIANGULAR.AsInteger <= 0) then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Opera��o triangular n�o foi configurada no novo padr�o das regras ' + #13
                           + '   (Ajustar nas Regras e depois informar nos par�metros)';
      end;
    end;
    fDMCadNotaFiscal.vExiste_MObra := '';
    fDMCadNotaFiscal.mPedAux.EmptyDataSet;
    fDMCadNotaFiscal.cdsNotaFiscal_Itens.First;
    while not fDMCadNotaFiscal.cdsNotaFiscal_Itens.Eof do
    begin
      if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') then
      begin
        if (copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '7') and ((trim(fDMCadNotaFiscal.cdsNotaFiscalUFEMBEXPORTACAO.AsString) = '') or (Trim(fDMCadNotaFiscal.cdsNotaFiscalLOCALEMBEXPORTACAO.AsString) = '')) then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Nota Exporta��o, n�o foi informada a UF ou Local de Embarque!';
        if ((copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '1') or (copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '2') or (copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '3')) and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString <> 'E') then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CFOP � de entrada (Itens)!';
        if ((copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '5') or (copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '6') or (copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) = '7')) and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString <> 'S') then
          fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** CFOP � de sa�da (Itens)!';
        if (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger > 0) or (fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VALE.AsInteger > 0) then
        begin
          if fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVACAO_COM_ERRO.AsString = 'CSI' then
            vMSgNotificacao := 'Existem itens com notifica��o de n�o ter calculado o icms simples!'
          else
          if fDMCadNotaFiscal.cdsNotaFiscal_ItensGRAVACAO_COM_ERRO.AsString = 'CST' then
            vMSgNotificacao := 'Existem itens com notifica��o de n�o ter calculado a Substitui��o Tribut�ria!';
        end;
        //08/08/2020
        if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger > 0 then
        begin
          if not fDMCadNotaFiscal.mPedAux.Locate('ID', fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger, [loCaseInsensitive]) then
          begin
            fDMCadNotaFiscal.mPedAux.Insert;
            fDMCadNotaFiscal.mPedAuxID.AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger;
            fDMCadNotaFiscal.mPedAux.Post;
          end;
        end;
        //*************
      end;
      if (fDMCadNotaFiscal.cdsParametrosUSA_CONSUMO.AsString = 'S') then
        prc_Verificar_Consumo(fDMCadNotaFiscal);
      if fDMCadNotaFiscal.cdsNotaFiscal_ItensMAOOBRA.AsString = 'S' then
        fDMCadNotaFiscal.vExiste_MObra := 'S';
      //10/02/2015
      if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I') and (fDMCadNotaFiscal.cdsNotaFiscalID_VENDEDOR.AsInteger > 0) and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) > 0)  then
      begin
        if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat)) > 0 then
          vPercAux := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_COMISSAO.AsFloat))
        else
          vPercAux := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO.AsFloat));
        if StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DUPLICATA.AsFloat)) > 0 then
        begin
          vVlrAux := StrToFloat(FormatFloat('0.0000',(fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DUPLICATA.AsFloat * vPercAux) / 100));
          vComissaoAux := StrToFloat(FormatFloat('0.0000',vComissaoAux + vVlrAux));
        end;
      end;
      fDMCadNotaFiscal.cdsNotaFiscal_Itens.Next;
    end;
    //08/08/2020
    fDMCadNotaFiscal.mPedAux.First;
    while not fDMCadNotaFiscal.mPedAux.Eof do
    begin
      if fnc_verifica_tit_pago(fDMCadNotaFiscal.mPedAuxID.AsInteger) then
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + '*** Existe t�tulo gerado no Pedido e j� esta pago!';
      fDMCadNotaFiscal.mPedAux.Next;
    end;
    fDMCadNotaFiscal.mPedAux.EmptyDataSet;
    //*******************

    //10/11/2015
    if (StrToFloat(FormatFloat('0.00',vComissaoAux)) > 0) and (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString = 'I') then
    begin
      vComissaoAux := StrToFloat(FormatFloat('0.0000',vComissaoAux));
      fDMCadNotaFiscal.vPerc_Comissao_Rateio := StrToFloat(FormatFloat('0.00000',(vComissaoAux / (fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat + fDMCadNotaFiscal.cdsNotaFiscalVLR_ADIANTAMENTO.AsFloat)) * 100));
    end
    else
    if (fDMCadNotaFiscal.cdsParametrosTIPO_COMISSAO_PROD.AsString <> 'I') then
      fDMCadNotaFiscal.vPerc_Comissao_Rateio := StrToFloat(FormatFloat('0.000',fDMCadNotaFiscal.cdsNotaFiscalPERC_COMISSAO.AsFloat));
    //***********************
    if fDMCadNotaFiscal.vExiste_MObra <> 'S' then
      fDMCadNotaFiscal.mMaterialConsumo.EmptyDataSet;

    if (fDMCadNotaFiscal.cdsNotaFiscalID_CONDPGTO.AsInteger > 0) and (fDMCadNotaFiscal.cdsCondPgto.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscalID_CONDPGTO.AsInteger,([Locaseinsensitive]))) then
    begin
      if (fDMCadNotaFiscal.cdsCondPgtoENTRADA.AsString = 'S') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_ENTRADA.AsFloat)) <= 0) and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_ADIANTAMENTO.AsFloat)) <= 0) then
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** A condi��o de pagamento informada exige valor da entrada!';
    end;
  end;
  //Tirado no dia 30/07/2013 pois o valor de entrada vai ser gravado na tabela NOTAFISCAL_PARC como parcela = 0
  //vVlrAux := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_ENTRADA.AsFloat));
  vVlrAux := StrToFloat(FormatFloat('0.00',0));
  fDMCadNotaFiscal.cdsNotaFiscal_Parc.First;
  while not fDMCadNotaFiscal.cdsNotaFiscal_Parc.Eof do
  begin
    if (fDMCadNotaFiscal.cdsNotaFiscal_ParcITEM.AsInteger = 0) and (fDMCadNotaFiscal.cdsNotaFiscal_ParcID_CONTA.AsInteger <= 0) then
      fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Nota possui valor de entrada, precisa informar a conta/banco para lan�amento no financeiro!';
    if YearOf(fDMCadNotaFiscal.cdsNotaFiscal_ParcDTVENCIMENTO.AsDateTime) < 2000 then
      fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Ano do vencimento inv�lido!';
    if fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime > fDMCadNotaFiscal.cdsNotaFiscal_ParcDTVENCIMENTO.AsDateTime then
      fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Data de vencimento menor que a data de emiss�o!';
    if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTE') and (fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime > fDMCadNotaFiscal.cdsNotaFiscal_ParcDTVENCIMENTO.AsDateTime) then
      fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Data de vencimento menor que a data de emiss�o!';
    if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ParcVLR_VENCIMENTO.AsFloat)) <= 0) then
      fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Valor Parcela esta zerado na nota, favor verificar!!';
    vVlrAux := StrToFloat(FormatFloat('0.00',vVlrAux + fDMCadNotaFiscal.cdsNotaFiscal_ParcVLR_VENCIMENTO.AsFloat));
    fDMCadNotaFiscal.cdsNotaFiscal_Parc.Next;
  end;
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_PRAZO.AsString = 'V') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) <= 0) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Vencimento informado � vista, mas o valor da duplicata � zerado!';
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_PRAZO.AsString = 'P') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) <= 0) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Vencimento informado a prazo, mas o valor da duplicata � zerado!';
  if ((fDMCadNotaFiscal.cdsNotaFiscalTIPO_PRAZO.AsString <> 'V') and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_PRAZO.AsString <> 'A')) and  (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) <> StrToFloat(FormatFloat('0.00',vVlrAux))) then
  begin
    if not(NaoContDupl) then
      fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Valor das parcelas diferente do valor de duplicata!';
  end;
  if fDMCadNotaFiscal.cdsNotaFiscalID_LOCAL_ESTOQUE.AsInteger <= 0 then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Local Estoque n�o informado!';
  if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_REG.AsString = 'NTS') and (fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString = 'S') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_DUPLICATA.AsFloat)) > 0)
    and (fDMCadNotaFiscal.cdsNotaFiscalID_TIPO_COBRANCA.AsInteger <= 0) then
    fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** Forma de Pagamento n�o informada!';
  if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscalVLR_SALDO_USADO.AsFloat)) > 0 then
  begin
    if fDMCadNotaFiscal.cdsNotaFiscalID_CONTA.AsInteger <= 0 then
    begin
      fDMCadNotaFiscal.qParametros_NFe.Close;
      fDMCadNotaFiscal.qParametros_NFe.Open;
      if fDMCadNotaFiscal.qParametros_NFeID_CONTA_ADTO.AsInteger > 0 then
        fDMCadNotaFiscal.cdsNotaFiscalID_CONTA.AsInteger := fDMCadNotaFiscal.qParametros_NFeID_CONTA_ADTO.AsInteger
      else
        fDMCadNotaFiscal.vMSGNotaFiscal := fDMCadNotaFiscal.vMSGNotaFiscal + #13 + '*** N�o informada a conta de adiantamento nos Par�metros da Nota Fiscal!';
    end;
  end;

  if fDMCadNotaFiscal.vMSGNotaFiscal <> '' then
    exit;
  Result := False;
end;

procedure prc_Verificar_Consumo(fDMCadNotaFiscal: TDMCadNotaFiscal);
var
  vConsumo: Real;
  vAux: Real;
begin
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensMAOOBRA.AsString <> 'S' then
  begin
    if (fDMCadNotaFiscal.mMaterialConsumo.FindKey([fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger])) then
      fDMCadNotaFiscal.mMaterialConsumo.Edit
    else
    begin
      fDMCadNotaFiscal.mMaterialConsumo.Insert;
      fDMCadNotaFiscal.mMaterialConsumoID_Material.AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
      fDMCadNotaFiscal.mMaterialConsumoNomeMaterial.AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensNOME_PRODUTO.AsString;
    end;
    fDMCadNotaFiscal.mMaterialConsumoQtdJaInformada.AsFloat := StrToFloat(FormatFloat('0.00000',fDMCadNotaFiscal.mMaterialConsumoQtdJaInformada.AsFloat + fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat));
    fDMCadNotaFiscal.mMaterialConsumo.Post;
  end
  else
  begin
    fDMCadNotaFiscal.qProduto_Consumo.Close;
    fDMCadNotaFiscal.qProduto_Consumo.ParamByName('ID').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
    fDMCadNotaFiscal.qProduto_Consumo.Open;
    while not fDMCadNotaFiscal.qProduto_Consumo.Eof do
    begin
      if (fDMCadNotaFiscal.mMaterialConsumo.FindKey([fDMCadNotaFiscal.qProduto_ConsumoID_MATERIAL.AsInteger])) then
        fDMCadNotaFiscal.mMaterialConsumo.Edit
      else
      begin
        fDMCadNotaFiscal.mMaterialConsumo.Insert;
        fDMCadNotaFiscal.mMaterialConsumoID_Material.AsInteger := fDMCadNotaFiscal.qProduto_ConsumoID_MATERIAL.AsInteger;
        fDMCadNotaFiscal.mMaterialConsumoNomeMaterial.AsString := copy(fDMCadNotaFiscal.qProduto_ConsumoNOMEMATERIAL.AsString,1,Length(fDMCadNotaFiscal.qProduto_ConsumoNOMEMATERIAL.AsString));
      end;
      if fDMCadNotaFiscal.qProduto_ConsumoTIPO_CONSUMO.AsString = 'T' then
      begin
        fDMCadNotaFiscal.qProduto_Consumo_Tam.Close;
        fDMCadNotaFiscal.qProduto_Consumo_Tam.ParamByName('ID').AsInteger     := fDMCadNotaFiscal.qProduto_ConsumoID.AsInteger;
        fDMCadNotaFiscal.qProduto_Consumo_Tam.ParamByName('ITEM').AsInteger   := fDMCadNotaFiscal.qProduto_ConsumoITEM.AsInteger;
        fDMCadNotaFiscal.qProduto_Consumo_Tam.ParamByName('TAMANHO').AsString := fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString;
        fDMCadNotaFiscal.qProduto_Consumo_Tam.Open;
        if fDMCadNotaFiscal.qProduto_Consumo_Tam.IsEmpty then
          vConsumo := 0
        else
          vConsumo := fDMCadNotaFiscal.qProduto_Consumo_TamQTD_CONSUMO.AsFloat;
      end
      else
        vConsumo := fDMCadNotaFiscal.qProduto_ConsumoQTD_CONSUMO.AsFloat;
      fDMCadNotaFiscal.mMaterialConsumoQtdProduto.AsFloat := fDMCadNotaFiscal.mMaterialConsumoQtdProduto.AsFloat + fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat;
      vAux := StrToFloat(FormatFloat('0.00000',fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat * vConsumo));
      //07/08/2014
      //fDMCadNotaFiscal.mMaterialConsumoQtdConsumo.AsFloat := StrToFloat(FormatFloat('0.00000',fDMCadNotaFiscal.mMaterialConsumoQtdConsumo.AsFloat + vAux));
      fDMCadNotaFiscal.mMaterialConsumoQtdConsumo.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.mMaterialConsumoQtdConsumo.AsFloat + vAux));
      fDMCadNotaFiscal.mMaterialConsumo.Post;
      fDMCadNotaFiscal.qProduto_Consumo.Next;
    end;
  end;

end;

function fnc_verifica_tit_pago(ID : Integer) : Boolean;
var
  sds: TSQLDataSet;
begin
  Result := False;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata := True;
    sds.GetMetadata := False;
    sds.CommandText := 'select count(1) CONTADOR from DUPLICATA D '
                     + 'where D.ID_PEDIDO = :ID and coalesce(D.VLR_PAGO, 0) > 0 ';
    sds.ParamByName('ID').AsInteger := ID;
    sds.Open;
    if sds.FieldByName('CONTADOR').AsInteger > 0 then
      Result := True;
  finally
    FreeAndNil(sds);
  end;
end;

end.


