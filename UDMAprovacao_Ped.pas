unit UDMAprovacao_Ped;

interface

uses
  SysUtils, Classes, LogTypes, FMTBcd, DB, DBClient, Provider, SqlExpr, Dialogs, Controls;

type
  TDMAprovacao_Ped = class(TDataModule)
    sdsAprovacao_Ped: TSQLDataSet;
    dspAprovacao_Ped: TDataSetProvider;
    cdsAprovacao_Ped: TClientDataSet;
    dsAprovacao_Ped: TDataSource;
    cdsAprovacao_PedID: TIntegerField;
    cdsAprovacao_PedPEDIDO_CLIENTE: TStringField;
    cdsAprovacao_PedNUM_PEDIDO: TIntegerField;
    cdsAprovacao_PedVLR_TOTAL: TFloatField;
    cdsAprovacao_PedID_CLIENTE: TIntegerField;
    cdsAprovacao_PedDTEMISSAO: TDateField;
    cdsAprovacao_PedNOME_CLIENTE: TStringField;
    cdsAprovacao_PedCNPJ_CPF: TStringField;
    cdsAprovacao_PedCIDADE: TStringField;
    cdsAprovacao_PedVLR_LIMITE_CREDITO: TFloatField;
    cdsAprovacao_PedVLR_RESTANTE: TFloatField;
    sdsCliente_Pend: TSQLDataSet;
    dspCliente_Pend: TDataSetProvider;
    cdsCliente_Pend: TClientDataSet;
    dsCliente_Pend: TDataSource;
    cdsCliente_PendCODIGO: TIntegerField;
    cdsCliente_PendNOME_CLIENTE: TStringField;
    cdsCliente_PendCNPJ_CPF: TStringField;
    cdsCliente_PendVLR_LIMITE_CREDITO: TFloatField;
    cdsCliente_PendVLR_TOTAL_PEND_APROV: TFloatField;
    cdsCliente_PendVLR_RESTANTE_DUP: TFloatField;
    cdsCliente_PendVLR_TOTAL_PED: TFloatField;
    mPedidoAux: TClientDataSet;
    mPedidoAuxID_Pedido: TIntegerField;
    mPedidoAuxNum_Pedido: TIntegerField;
    mPedidoAuxPedido_Cliente: TStringField;
    mPedidoAuxVlr_Total: TFloatField;
    mPedidoAuxDtEmissao: TDateField;
    dsmPedidoAux: TDataSource;
    sdsPedido_Pend: TSQLDataSet;
    dspPedido_Pend: TDataSetProvider;
    cdsPedido_Pend: TClientDataSet;
    dsPedido_Pend: TDataSource;
    cdsPedido_PendID_PEDIDO: TIntegerField;
    cdsPedido_PendPEDIDO_CLIENTE: TStringField;
    cdsPedido_PendNUM_PEDIDO: TIntegerField;
    cdsPedido_PendVLR_TOTAL: TFloatField;
    cdsPedido_PendDTEMISSAO: TDateField;
    mPedidoAuxID_Cliente: TIntegerField;
    cdsPedido_PendID_CLIENTE: TIntegerField;
    sdsPedido_Aprov: TSQLDataSet;
    dspPedido_Aprov: TDataSetProvider;
    cdsPedido_Aprov: TClientDataSet;
    dsPedido_Aprov: TDataSource;
    sdsPedido_AprovID: TIntegerField;
    sdsPedido_AprovAPROVADO: TStringField;
    sdsPedido_AprovDATA: TDateField;
    sdsPedido_AprovMOTIVO_NAO_APROV: TMemoField;
    sdsPedido_AprovUSUARIO: TStringField;
    sdsPedido_AprovDTUSUARIO: TDateField;
    sdsPedido_AprovHRUSUARIO: TTimeField;
    sdsPedido_AprovAPROVADO_PELO_LIMITE: TStringField;
    cdsPedido_AprovID: TIntegerField;
    cdsPedido_AprovAPROVADO: TStringField;
    cdsPedido_AprovDATA: TDateField;
    cdsPedido_AprovMOTIVO_NAO_APROV: TMemoField;
    cdsPedido_AprovUSUARIO: TStringField;
    cdsPedido_AprovDTUSUARIO: TDateField;
    cdsPedido_AprovHRUSUARIO: TTimeField;
    cdsPedido_AprovAPROVADO_PELO_LIMITE: TStringField;
    sdsPedido: TSQLDataSet;
    dspPedido: TDataSetProvider;
    cdsPedido: TClientDataSet;
    dsPedido: TDataSource;
    sdsPedidoID: TIntegerField;
    sdsPedidoAPROVADO_PED: TStringField;
    cdsPedidoID: TIntegerField;
    cdsPedidoAPROVADO_PED: TStringField;
    cdsCliente_PendVLR_ATRASADO: TFloatField;
    sdsFornecedor_Pend: TSQLDataSet;
    mPedidoAuxVlr_Entrada: TFloatField;
    cdsPedido_PendVLR_ADIANTAMENTO: TFloatField;
    mPedidoAuxNome_CondPgto: TStringField;
    qCondPgto: TSQLQuery;
    qCondPgtoID: TIntegerField;
    qCondPgtoNOME: TStringField;
    cdsPedido_PendID_CONDPGTO: TIntegerField;
    cdsCliente_PendVLR_ULTIMA_COMPRA: TFloatField;
    cdsCliente_PendDT_ULTIMA_COMPRA: TDateField;
    qBuscaPed: TSQLQuery;
    qBuscaPedID: TIntegerField;
    qBuscaPedID_CLIENTE: TIntegerField;
    qBuscaPedNUM_PEDIDO: TIntegerField;
    qBuscaPedTIPO_REG: TStringField;
    qBuscaPedCANCELADO: TStringField;
    qBuscaPedAPROVADO_PED: TStringField;
    cdsCliente_PendCONTADOR_PED: TIntegerField;
    cdsCliente_PendVLR_PAGO_EM_ATRASO: TFloatField;
    cdsCliente_PendCONTADOR_PED_CANC: TIntegerField;
    cdsCliente_PendCONTADOR_PED_NAO_APROV: TIntegerField;
    cdsCliente_PendQTD_TITULOS_PAGOS: TIntegerField;
    cdsCliente_PendQTD_TITULOS_PAGOS_EM_ATRASO: TIntegerField;
    sdsPedido_Processo: TSQLDataSet;
    sdsPedido_ProcessoID: TIntegerField;
    sdsPedido_ProcessoITEM: TIntegerField;
    sdsPedido_ProcessoTIPO_STATUS: TStringField;
    sdsPedido_ProcessoDTPROCESSO: TDateField;
    sdsPedido_ProcessoID_TRANSPORTADORA: TIntegerField;
    dspPedido_Processo: TDataSetProvider;
    cdsPedido_Processo: TClientDataSet;
    cdsPedido_ProcessoID: TIntegerField;
    cdsPedido_ProcessoITEM: TIntegerField;
    cdsPedido_ProcessoTIPO_STATUS: TStringField;
    cdsPedido_ProcessoDTPROCESSO: TDateField;
    cdsPedido_ProcessoID_TRANSPORTADORA: TIntegerField;
    dsPedido_Processo: TDataSource;
    sdsConsulta_Processo: TSQLDataSet;
    dspConsulta_Processo: TDataSetProvider;
    cdsConsulta_Processo: TClientDataSet;
    dsConsulta_Processo: TDataSource;
    cdsConsulta_ProcessoID: TIntegerField;
    cdsConsulta_ProcessoITEM: TIntegerField;
    cdsConsulta_ProcessoTIPO_STATUS: TStringField;
    cdsConsulta_ProcessoDTPROCESSO: TDateField;
    cdsConsulta_ProcessoID_TRANSPORTADORA: TIntegerField;
    cdsConsulta_ProcessoNOME_TRANSPORTADORA: TStringField;
    cdsConsulta_ProcessoDESCRICAO_STATUS: TStringField;
    sdsPedido_ProcessoEMAIL_ENVIADO: TStringField;
    cdsPedido_ProcessoEMAIL_ENVIADO: TStringField;
    qPedido2: TSQLQuery;
    qPedido2ID: TIntegerField;
    qPedido2ID_CLIENTE: TIntegerField;
    qPedido2NOME_CLIENTE: TStringField;
    qPedido2EMAIL_COMPRAS: TStringField;
    qPedido2FILIAL: TIntegerField;
    qPedido2NUM_PEDIDO: TIntegerField;
    qPedido2PEDIDO_CLIENTE: TStringField;
    qPedido2VLR_TOTAL: TFloatField;
    qPedido2CNPJ_CPF: TStringField;
    cdsConsulta_ProcessoEMAIL_ENVIADO: TStringField;
    sdsPedido_ProcessoCOD_RASTREAMENTO: TStringField;
    cdsPedido_ProcessoCOD_RASTREAMENTO: TStringField;
    cdsConsulta_ProcessoCOD_RASTREAMENTO: TStringField;
    qParametros_Ped: TSQLQuery;
    qParametros_PedDESCRICAO_PHP: TStringField;
    qParametros_PedENVIAR_EMAIL_PROC_PED: TStringField;
    qParametros_PedENVIAR_EMAIL_PROC_EXP: TStringField;
    qParametros_PedENVIAR_EMAIL_PROC_FAT: TStringField;
    qParametros_PedENVIAR_EMAIL_PROC_TRANSP: TStringField;
    qParametros_PedUSA_EMAIL_NO_PED: TStringField;
    qParametros_PedUSA_EMAIL_NFECONFIG_CONF: TStringField;
    qFilial_Email: TSQLQuery;
    qFilial_EmailID_FILIAL: TIntegerField;
    qFilial_EmailID_CONFIG_EMAIL: TIntegerField;
    qFilial_EmailNOME_CONFIG: TStringField;
    qFilial_EmailREMETENTE_NOME: TStringField;
    qFilial_EmailREMETENTE_EMAIL: TStringField;
    qFilial_EmailSMTP_CLIENTE: TStringField;
    qFilial_EmailSMTP_PORTA: TIntegerField;
    qFilial_EmailSMTP_REQUER_SSL: TStringField;
    qFilial_EmailSMTP_USUARIO: TStringField;
    qFilial_EmailSMTP_SENHA: TStringField;
    qFilial_EmailSOLICITAR_CONFIRMACAO: TStringField;
    qFilial_EmailBASE: TSmallintField;
    qFilial_EmailCNPJ_CPF_FILIAL: TStringField;
    sdsPedidoFILIAL: TIntegerField;
    cdsPedidoFILIAL: TIntegerField;
    qParametros: TSQLQuery;
    qParametrosLOCALSERVIDORNFE: TStringField;
    qParametros_PedENVIA_SMS: TStringField;
    sdsPedido_ProcessoSMS_ENVIADO: TStringField;
    cdsPedido_ProcessoSMS_ENVIADO: TStringField;
    qPedido2DDD: TIntegerField;
    qPedido2FONE: TStringField;
    qFilial_SMS: TSQLQuery;
    qFilial_SMSID: TIntegerField;
    qFilial_SMSLOGIN: TStringField;
    qFilial_SMSSENHA: TStringField;
    qFilial_SMSTOKEN: TStringField;
    qFilial_SMSFONE_ORIGEM: TStringField;
    qPedido2NOME_CONSUMIDOR: TStringField;
    qParametrosID_CLIENTE_CONSUMIDOR: TIntegerField;
    qParametros_Geral: TSQLQuery;
    qParametros_GeralFILIAL_PADRAO_PEDWEB: TIntegerField;
    sdsConsultaPedWeb: TSQLDataSet;
    sdsConsultaPedWebID: TIntegerField;
    sdsConsultaPedWebID_USUARIO: TIntegerField;
    sdsConsultaPedWebID_PESSOA: TIntegerField;
    sdsConsultaPedWebHORA_EMISSAO: TStringField;
    sdsConsultaPedWebID_FORMA_PAGAMENTO: TIntegerField;
    sdsConsultaPedWebVLR_DESCONTO: TFMTBCDField;
    sdsConsultaPedWebVLR_TOTAL: TFMTBCDField;
    sdsConsultaPedWebTIPO_OPERACAO: TIntegerField;
    sdsConsultaPedWebCOND_PAGAMENTO: TIntegerField;
    sdsConsultaPedWebGERADO: TStringField;
    sdsConsultaPedWebNOME_CLIENTE: TStringField;
    sdsConsultaPedWebNOME_USUARIO: TStringField;
    sdsConsultaPedWebOBS: TStringField;
    sdsConsultaPedWebDATA_APROVADO: TDateField;
    sdsConsultaPedWebDATA_EMISSAO: TDateField;
    sdsConsultaPedWebPRAZO_PEDIDO: TStringField;
    dspConsultaPedWeb: TDataSetProvider;
    cdsConsultaPedWeb: TClientDataSet;
    cdsConsultaPedWebID: TIntegerField;
    cdsConsultaPedWebID_USUARIO: TIntegerField;
    cdsConsultaPedWebID_PESSOA: TIntegerField;
    cdsConsultaPedWebHORA_EMISSAO: TStringField;
    cdsConsultaPedWebID_FORMA_PAGAMENTO: TIntegerField;
    cdsConsultaPedWebVLR_DESCONTO: TFMTBCDField;
    cdsConsultaPedWebVLR_TOTAL: TFMTBCDField;
    cdsConsultaPedWebTIPO_OPERACAO: TIntegerField;
    cdsConsultaPedWebCOND_PAGAMENTO: TIntegerField;
    cdsConsultaPedWebGERADO: TStringField;
    cdsConsultaPedWebNOME_CLIENTE: TStringField;
    cdsConsultaPedWebNOME_USUARIO: TStringField;
    cdsConsultaPedWebOBS: TStringField;
    cdsConsultaPedWebDATA_APROVADO: TDateField;
    cdsConsultaPedWebDATA_EMISSAO: TDateField;
    cdsConsultaPedWebPRAZO_PEDIDO: TStringField;
    dsConsultaPedWeb: TDataSource;
    sdsPedWeb: TSQLDataSet;
    sdsPedWebID: TIntegerField;
    sdsPedWebID_USUARIO: TIntegerField;
    sdsPedWebID_PESSOA: TIntegerField;
    sdsPedWebHORA_EMISSAO: TStringField;
    sdsPedWebID_FORMA_PAGAMENTO: TIntegerField;
    sdsPedWebVLR_DESCONTO: TFMTBCDField;
    sdsPedWebTIPO_OPERACAO: TIntegerField;
    sdsPedWebCOND_PAGAMENTO: TIntegerField;
    sdsPedWebGERADO: TStringField;
    sdsPedWebVLR_TOTAL: TFMTBCDField;
    sdsPedWebOBS: TStringField;
    sdsPedWebDATA_APROVADO: TDateField;
    sdsPedWebDATA_EMISSAO: TDateField;
    sdsPedWebPRAZO_PEDIDO: TStringField;
    dspPedWeb: TDataSetProvider;
    cdsPedWeb: TClientDataSet;
    dsPedWeb: TDataSource;
    dsMestre: TDataSource;
    sdsPedWeb_Item: TSQLDataSet;
    sdsPedWeb_ItemID_PEDIDO: TIntegerField;
    sdsPedWeb_ItemID_PRODUTO: TIntegerField;
    sdsPedWeb_ItemQUANTIDADE: TIntegerField;
    sdsPedWeb_ItemVLR_UNITARIO: TFloatField;
    sdsPedWeb_ItemVLR_DESCONTO: TFloatField;
    sdsPedWeb_ItemVLR_TOTAL: TFloatField;
    sdsPedWeb_ItemOBS: TStringField;
    cdsPedWeb_Item: TClientDataSet;
    cdsPedWeb_ItemID_PEDIDO: TIntegerField;
    cdsPedWeb_ItemID_PRODUTO: TIntegerField;
    cdsPedWeb_ItemQUANTIDADE: TIntegerField;
    cdsPedWeb_ItemVLR_UNITARIO: TFloatField;
    cdsPedWeb_ItemVLR_DESCONTO: TFloatField;
    cdsPedWeb_ItemVLR_TOTAL: TFloatField;
    cdsPedWeb_ItemOBS: TStringField;
    dsPedWeb_Item: TDataSource;
    qParametros_PedUSA_APROVACAO_ITEM: TStringField;
    sdsPedido_Item: TSQLDataSet;
    dspPedido_Item: TDataSetProvider;
    cdsPedido_Item: TClientDataSet;
    dsPedido_Item: TDataSource;
    sdsPedido_ItemID: TIntegerField;
    sdsPedido_ItemITEM: TIntegerField;
    sdsPedido_ItemAPROVADO_ITEM: TStringField;
    cdsPedido_ItemID: TIntegerField;
    cdsPedido_ItemITEM: TIntegerField;
    cdsPedido_ItemAPROVADO_ITEM: TStringField;
    sdsPedido_Item_Aprov: TSQLDataSet;
    dspPedido_Item_Aprov: TDataSetProvider;
    cdsPedido_Item_Aprov: TClientDataSet;
    dsPedido_Item_Aprov: TDataSource;
    sdsPedido_Item_AprovID: TIntegerField;
    sdsPedido_Item_AprovITEM: TIntegerField;
    sdsPedido_Item_AprovITEM_APROV: TIntegerField;
    sdsPedido_Item_AprovUSUARIO: TStringField;
    sdsPedido_Item_AprovDTUSUARIO: TDateField;
    sdsPedido_Item_AprovHRUSUARIO: TTimeField;
    sdsPedido_Item_AprovID_FUNCIONARIO: TIntegerField;
    cdsPedWebID: TIntegerField;
    cdsPedWebID_USUARIO: TIntegerField;
    cdsPedWebID_PESSOA: TIntegerField;
    cdsPedWebHORA_EMISSAO: TStringField;
    cdsPedWebID_FORMA_PAGAMENTO: TIntegerField;
    cdsPedWebVLR_DESCONTO: TFMTBCDField;
    cdsPedWebTIPO_OPERACAO: TIntegerField;
    cdsPedWebCOND_PAGAMENTO: TIntegerField;
    cdsPedWebGERADO: TStringField;
    cdsPedWebVLR_TOTAL: TFMTBCDField;
    cdsPedWebOBS: TStringField;
    cdsPedWebDATA_APROVADO: TDateField;
    cdsPedWebDATA_EMISSAO: TDateField;
    cdsPedWebPRAZO_PEDIDO: TStringField;
    cdsPedWebsdsPedWeb_Item: TDataSetField;
    cdsPedido_Item_AprovID: TIntegerField;
    cdsPedido_Item_AprovITEM: TIntegerField;
    cdsPedido_Item_AprovITEM_APROV: TIntegerField;
    cdsPedido_Item_AprovUSUARIO: TStringField;
    cdsPedido_Item_AprovDTUSUARIO: TDateField;
    cdsPedido_Item_AprovHRUSUARIO: TTimeField;
    cdsPedido_Item_AprovID_FUNCIONARIO: TIntegerField;
    sdsPedido_ItemID_PRODUTO: TIntegerField;
    sdsPedido_ItemREFERENCIA: TStringField;
    sdsPedido_ItemNOMEPRODUTO: TStringField;
    cdsPedido_ItemID_PRODUTO: TIntegerField;
    cdsPedido_ItemREFERENCIA: TStringField;
    cdsPedido_ItemNOMEPRODUTO: TStringField;
    sdsPedido_Item_AprovNOME_FUNCIONARIO: TStringField;
    cdsPedido_Item_AprovNOME_FUNCIONARIO: TStringField;
    sdsPedido_ItemCANCELADO: TStringField;
    cdsPedido_ItemCANCELADO: TStringField;
    sdsPedido_Item_AprovAPROVADO: TStringField;
    cdsPedido_Item_AprovAPROVADO: TStringField;
    qFuncionario: TSQLQuery;
    qFuncionarioCODIGO: TIntegerField;
    qFuncionarioNOME: TStringField;
    qFuncionarioUSUARIO_LOG: TStringField;
    sdsPedido_Item_AprovMOTIVO_NAO_APROV: TStringField;
    cdsPedido_Item_AprovMOTIVO_NAO_APROV: TStringField;
    sdsPrc_Atualiza_Aprov_Ped: TSQLDataSet;
    qParametros_OC: TSQLQuery;
    qParametros_OCUSA_APROVACAO_ITEM: TStringField;
    sdsPedido_Item_AprovDATA: TDateField;
    cdsPedido_Item_AprovDATA: TDateField;
    sdsPedido_ItemQTD: TFloatField;
    cdsPedido_ItemQTD: TFloatField;
    mPedidoAuxOBS: TMemoField;
    cdsPedido_PendOBS: TMemoField;
    sdsPedido_ItemVLR_UNITARIO: TFloatField;
    sdsPedido_ItemVLR_TOTAL: TFloatField;
    cdsPedido_ItemVLR_UNITARIO: TFloatField;
    cdsPedido_ItemVLR_TOTAL: TFloatField;
    sdsPedidoID_REGIMETRIB: TIntegerField;
    sdsPedidoSIMPLES_FILIAL: TStringField;
    sdsPedidoID_LOCAL_ESTOQUE: TIntegerField;
    sdsPedidoFATURADO: TStringField;
    sdsPedidoIMPRESSO: TStringField;
    sdsPedidoTIPO_STATUS: TStringField;
    sdsPedidoID_OPERACAO_NOTA: TIntegerField;
    sdsPedidoFINALIDADE: TStringField;
    sdsPedidoCONTROLA_RESERVA: TStringField;
    sdsPedidoTIPO_ATENDIMENTO: TSmallintField;
    cdsPedidoID_REGIMETRIB: TIntegerField;
    cdsPedidoSIMPLES_FILIAL: TStringField;
    cdsPedidoID_LOCAL_ESTOQUE: TIntegerField;
    cdsPedidoFATURADO: TStringField;
    cdsPedidoIMPRESSO: TStringField;
    cdsPedidoTIPO_STATUS: TStringField;
    cdsPedidoID_OPERACAO_NOTA: TIntegerField;
    cdsPedidoFINALIDADE: TStringField;
    cdsPedidoCONTROLA_RESERVA: TStringField;
    cdsPedidoTIPO_ATENDIMENTO: TSmallintField;
    sdsPedidoUSUARIO: TStringField;
    sdsPedidoDTUSUARIO: TDateField;
    sdsPedidoHRUSUARIO: TTimeField;
    cdsPedidoUSUARIO: TStringField;
    cdsPedidoDTUSUARIO: TDateField;
    cdsPedidoHRUSUARIO: TTimeField;
    cdsCliente_PendPESSOA: TStringField;
    sdsPedidoVLR_TOTAL: TFloatField;
    sdsPedidoVLR_ITENS: TFloatField;
    cdsPedidoVLR_TOTAL: TFloatField;
    cdsPedidoVLR_ITENS: TFloatField;
    cdsCliente_PendUSA_PRECO_VAREJO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsPedido_ProcessoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    ctCommand : String;
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
    //function fnc_Enviar_URL(Nome_Transportadora : String) : String;
  public
    { Public declarations }
    ctAprovacao_Ped : String;
    ctPedido_Pend : String;
    ctCliente_Pend : String;
    ctFornecedor_Pend : String;
    procedure prc_Gravar_Pedido_Processo(Email : String; ID, ID_Transportadora : Integer ; Tipo_Status, Nome_Transportadora,
              Cod_Rastreameto : String ; DtProcesso : TDateTime ; Opcao : String = 'G');
    procedure prc_Saldo_SMS;
    procedure prc_Consultar_PedWeb;
    procedure prc_Localiza_PedWeb(ID : Integer);

    function fnc_Verifica_Aprov(ID, Item : Integer; Tipo : String): Boolean;

  end;

var
  DMAprovacao_Ped: TDMAprovacao_Ped;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao, IdHTTP, SOAPHTTPTrans,
  uNFeComandos, ApiDirectcall;

{$R *.dfm}

procedure TDMAprovacao_Ped.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMAprovacao_Ped.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctAprovacao_Ped   := sdsAprovacao_Ped.CommandText;
  ctPedido_Pend     := sdsPedido_Pend.CommandText;
  ctCliente_Pend    := sdsCliente_Pend.CommandText;
  ctFornecedor_Pend := sdsFornecedor_Pend.CommandText;
  ctCommand         := sdsPedWeb.CommandText;
  qParametros.Open;
  qParametros_Ped.Open;
  qParametros_OC.Open;
  //*** Logs Implantado na vers�o .353
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
  //***********************
end;

procedure TDMAprovacao_Ped.prc_Gravar_Pedido_Processo(Email : String; ID, ID_Transportadora : Integer ; Tipo_Status,
Nome_Transportadora, Cod_Rastreameto : String ; DtProcesso : TDateTime ; Opcao : String = 'G');
var
  vItem : Integer;
  vEmail_Aux : String;

  function fnc_Enviar_URL : String;
  var
    vMSG : WideString;
    vTextoDt : String;
    vTextoOutros : String;
    vNomeCliAux : String;
    vNomeTraAux : String;
    i : Integer;

    {Resposta: TStringStream;
    TSConsulta : TStringList;
    post : TIdHTTP;}
    oHttp: THTTPReqResp;
    //msg: string;
    oStr: TStringStream;
    MemStream: TMemoryStream;
    Context: Integer;
    iTimeOut: Integer; //variavel adicionada para configurar o tempo do timeout
  begin
    Result := 'N';

    qPedido2.Close;
    qPedido2.ParamByName('ID').AsInteger := cdsPedido_ProcessoID.AsInteger;
    qPedido2.Open;

    //17/07/2017  Foi incluido para ajustar o da JW (pois vende para consumidor e este n�o possui cadastro, e com isso
    //            o Email vai no pedido
    if (qParametros_PedUSA_EMAIL_NO_PED.AsString = 'S') then
      vEmail_Aux := Email
    else
      vEmail_Aux := qPedido2EMAIL_COMPRAS.AsString;
    //if trim(qPedido2EMAIL_COMPRAS.AsString) = '' then
    if trim(vEmail_Aux) = '' then
    begin
      MessageDlg('*** Cliente ' + qPedido2NOME_CLIENTE.AsString + ' sem email!' , mtInformation, [mbOk], 0);
      exit;
    end;

    if MessageDlg('Deseja enviar email para notificar o Cliente ' + qPedido2NOME_CLIENTE.AsString  + ' sobre o Status do Pedido ' + qPedido2NUM_PEDIDO.AsString + ' ?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
    Result := 'S';

    vNomeCliAux := Replace(qPedido2NOME_CLIENTE.AsString,'&','e');
    vNomeTraAux := Replace(Nome_Transportadora,'&','e');

    if Tipo_Status = 'C' then
      vTextoDt := '&data_emissao='
    else
    if Tipo_Status = 'E' then
      vTextoDt := '&data_expedicao='
    else
    if Tipo_Status = 'F' then
      vTextoDt := '&data_faturado='
    else
    if Tipo_Status = 'T' then
      vTextoDt := '&data_transportadora=';
    vTextoOutros := '';
    if Tipo_Status = 'C' then
      vTextoOutros := '&id_cliente=' + qPedido2ID_CLIENTE.AsString
                    + '&nome_cliente=' + vNomeCliAux
                    + '&cnpj_cliente=' + qPedido2CNPJ_CPF.AsString
                    + '&valor_total=' + FormatFloat('###,###,##0.00',qPedido2VLR_TOTAL.AsFloat)
    else
    if Tipo_Status = 'T' then
      vTextoOutros := '&nome_transportadora=' + vNomeTraAux
                    + '&codigo_rastreamento=' + Cod_Rastreameto;
    if Tipo_Status <> 'C' then
      vTextoOutros := vTextoOutros + '&nome_cliente=' + vNomeCliAux;

    //vMSG := 'http://servisoft.kinghost.net/phpmailer/email.php?status=' + cdsPedido_ProcessoTIPO_STATUS.AsString
    //vMSG := 'http://ssfacil.safirasistemas.com.br/phpmailer/email.php?status=' + cdsPedido_ProcessoTIPO_STATUS.AsString
    //vMSG := 'http://ssfacil.safirasistemas.com.br/'
    //alterado pelo Edson 12/03/2018
      vMSG := 'http://sendemail.servisoft.kinghost.net/'
         // + qParametros_PedDESCRICAO_PHP.AsString
          + '/email.php?status=' + cdsPedido_ProcessoTIPO_STATUS.AsString
          //+ '&email_cliente=' + qPedido2EMAIL_COMPRAS.AsString
          + '&email_cliente=' + vEmail_Aux
          + '&filial=' + qPedido2FILIAL.AsString
          + '&id_pedido=' + qPedido2ID.AsString
          + '&num_pedido=' + qPedido2NUM_PEDIDO.AsString
          + '&pedido_cliente=' + qPedido2PEDIDO_CLIENTE.AsString
          + vTextoDt + DateToStr(DtProcesso);
    vMSG := vMSG + vTextoOutros;

    oHttp := THTTPReqResp.Create(nil);
    oStr := TStringStream.Create('');

    oHttp.SendTimeout    := 120000;
    oHttp.ReceiveTimeout := 120000;    
    oHttp.ConnectTimeout := 120000;

    MemStream := TMemoryStream.Create;
    try
      oHttp.UseUTF8InHeader := True;

      oHttp.Proxy    := '';
      oHttp.UserName := '';
      oHttp.Password := '';

      oHttp.URL := vmsg;

      context := oHttp.Send(oStr);
      oHttp.Receive(Context, MemStream, True);

      oStr.CopyFrom(MemStream, 0);
      ShowMessage(oStr.DataString);
    finally
      FreeAndNil(MemStream);
      FreeAndNil(oStr);
      FreeAndNil(oHttp);
    end;
  end;

  //Feito para a JW
  function fnc_Enviar_Email : String;
  var
    vMSG : WideString;
    vTextoDt : String;
    vTextoOutros : String;
    vNomeCliAux : String;
    vNomeTraAux : String;
    vSenhaEmail: String;
    i : Integer;
    texto : String;
    lista_Anexo: TStringList;

    oHttp: THTTPReqResp;
    oStr: TStringStream;
    MemStream: TMemoryStream;
    Context: Integer;
    iTimeOut: Integer; //variavel adicionada para configurar o tempo do timeout
  begin
    Result := 'N';

    qPedido2.Close;
    qPedido2.ParamByName('ID').AsInteger := cdsPedido_ProcessoID.AsInteger;
    qPedido2.Open;

    if (qParametros_PedUSA_EMAIL_NO_PED.AsString = 'S') then
      vEmail_Aux := Email
    else
      vEmail_Aux := qPedido2EMAIL_COMPRAS.AsString;
    //if trim(qPedido2EMAIL_COMPRAS.AsString) = '' then
    if trim(vEmail_Aux) = '' then
    begin
      vNomeCliAux := qPedido2NOME_CLIENTE.AsString;
      if qPedido2ID_CLIENTE.AsInteger = qParametrosID_CLIENTE_CONSUMIDOR.AsInteger then
        vNomeCliAux := qPedido2NOME_CONSUMIDOR.AsString;
      MessageDlg('*** Cliente ' + vNomeCliAux + ' sem email!' , mtInformation, [mbOk], 0);
      exit;
    end;

    if MessageDlg('Deseja enviar email para notificar o Cliente ' + vNomeCliAux  + ' sobre o Status do Pedido ' + qPedido2NUM_PEDIDO.AsString + ' ?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
    Result := 'S';

    //vNomeCliAux := Replace(qPedido2NOME_CLIENTE.AsString,'&','e');
    //vNomeTraAux := Replace(Nome_Transportadora,'&','e');

    vMSG := '   Ola, ' + vNomeCliAux + #13 + #13
            + '  Se voc� est� recebendo esse email, � porque o seu pedido N� ' + qPedido2PEDIDO_CLIENTE.AsString
            + ' (Ped.Interno: ' + qPedido2NUM_PEDIDO.AsString + ')'
            + '  j� est� dispon�vel pra coleta. ' +#13
            + '  Se tiver qualquer d�vida, liga pra gente 51 3594 1465.' + #13 + #13 + #13
            + ' N�o precisa responder esse email. '
            + ' Nosso sistema � automatizado e ele mesmo te avisa quando o produto est� pronto. ';

    {if Tipo_Status = 'C' then
      vTextoDt := ' Data Emiss�o: '
    else
    if Tipo_Status = 'E' then
      vTextoDt := ' Data Expedi��o :'
    else
    if Tipo_Status = 'F' then
      vTextoDt := '&data_faturado='
    else
    if Tipo_Status = 'T' then
      vTextoDt := '&data_transportadora=';}
    {vTextoOutros := '';
    if Tipo_Status = 'C' then
      vTextoOutros := '&id_cliente=' + qPedido2ID_CLIENTE.AsString
                    + '&nome_cliente=' + vNomeCliAux
                    + '&cnpj_cliente=' + qPedido2CNPJ_CPF.AsString
                    + '&valor_total=' + FormatFloat('###,###,##0.00',qPedido2VLR_TOTAL.AsFloat)
    else
    if Tipo_Status = 'T' then
      vTextoOutros := '&nome_transportadora=' + vNomeTraAux
                    + '&codigo_rastreamento=' + Cod_Rastreameto;
    if Tipo_Status <> 'C' then
      vTextoOutros := vTextoOutros + '&nome_cliente=' + vNomeCliAux;}

    //vMSG := 'http://servisoft.kinghost.net/phpmailer/email.php?status=' + cdsPedido_ProcessoTIPO_STATUS.AsString
    //vMSG := 'http://ssfacil.safirasistemas.com.br/phpmailer/email.php?status=' + cdsPedido_ProcessoTIPO_STATUS.AsString
    {vMSG := 'http://ssfacil.safirasistemas.com.br/'
          + qParametros_PedDESCRICAO_PHP.AsString
          + '/email.php?status=' + cdsPedido_ProcessoTIPO_STATUS.AsString
          //+ '&email_cliente=' + qPedido2EMAIL_COMPRAS.AsString
          + '&email_cliente=' + vEmail_Aux
          + '&filial=' + qPedido2FILIAL.AsString
          + '&id_pedido=' + qPedido2ID.AsString
          + '&num_pedido=' + qPedido2NUM_PEDIDO.AsString
          + '&pedido_cliente=' + qPedido2PEDIDO_CLIENTE.AsString
          + vTextoDt + DateToStr(DtProcesso);}
    //vMSG := vMSG + vTextoOutros;

    Lista_Anexo := TStringList.Create;

    qFilial_Email.Close;
    qFilial_Email.ParamByName('ID').AsInteger := qPedido2FILIAL.AsInteger;
    qFilial_Email.Open;

    vSenhaEmail := Descriptografar( qFilial_EmailBASE.AsInteger
                               , 'ssfacil'
                               , qFilial_EmailSMTP_SENHA.AsString );

    texto := Monta_Texto(qFilial_EmailCNPJ_CPF_FILIAL.AsString,14);


    try
      EnviarEmail2(Trim(qParametrosLOCALSERVIDORNFE.AsString),
                   texto,
                   qFilial_EmailREMETENTE_EMAIL.AsString,
                   qFilial_EmailREMETENTE_NOME.AsString,
                   qFilial_EmailSMTP_CLIENTE.AsString,
                   qFilial_EmailSMTP_PORTA.AsString,
                   qFilial_EmailSMTP_REQUER_SSL.AsString,
                   qFilial_EmailSMTP_USUARIO.AsString,
                   vSenhaEmail,
                   qFilial_EmailSOLICITAR_CONFIRMACAO.AsString,
                   vEmail_Aux,
                   '',
                   'Aviso de Pedido dispon�vel para coleta de JW Metais',
                   vMSG,
                   lista_Anexo);

      Result := 'S';

    finally
      FreeAndNil(lista_Anexo);
      //FreeAndNil(MemStream);
      //FreeAndNil(oStr);
      //FreeAndNil(oHttp);
    end;
  end;


  //Feito para a JW
  function fnc_Enviar_SMS : String;
  var
    vMSG : WideString;
    //vTextoDt : String;
    //vTextoOutros : String;
    vNomeCliAux : String;
    //vNomeTraAux : String;
    //i : Integer;

    api: TApiDirectCall;
    vFone : String;

    //oHttp: THTTPReqResp;
    //oStr: TStringStream;
    //MemStream: TMemoryStream;
    //Context: Integer;
    //iTimeOut: Integer; //variavel adicionada para configurar o tempo do timeout
  begin
    Result := 'N';

    qPedido2.Close;
    qPedido2.ParamByName('ID').AsInteger := cdsPedido_ProcessoID.AsInteger;
    qPedido2.Open;

    vFone := Monta_Numero(qPedido2FONE.AsString,0);
    //if (qPedido2DDD.AsInteger <= 0) or (trim(qPedido2FONE.AsString) = '') then
    if (qPedido2DDD.AsInteger <= 0) or (trim(vFone) = '') then
    begin
      vNomeCliAux := qPedido2NOME_CLIENTE.AsString;
      if qPedido2ID_CLIENTE.AsInteger = qParametrosID_CLIENTE_CONSUMIDOR.AsInteger then
        vNomeCliAux := qPedido2NOME_CONSUMIDOR.AsString;
      MessageDlg('*** Cliente ' + qPedido2NOME_CLIENTE.AsString + ' sem fone para enviar!' , mtInformation, [mbOk], 0);
      exit;
    end;

    if MessageDlg('Deseja enviar SMS para notificar o Cliente ' + vNomeCliAux  + ' sobre o Status do Pedido ' + qPedido2NUM_PEDIDO.AsString + ' ?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;

    qFilial_SMS.Close;
    qFilial_SMS.ParamByName('ID').AsInteger := qPedido2FILIAL.AsInteger;
    qFilial_SMS.Open;

    Result := 'S';
    //********************************  Api em Delphi do directCall

    api := TApiDirectCall.Create;
    try
      api.User := qFilial_SMSLOGIN.AsString;
      api.Password := qFilial_SMSSENHA.Text;
      //ShowMessage( api.sendSms(de_sms.Text, para_sms.Text, sms.Text) );
      vMSG := 'JW Laser informa que seu pedido ' + qPedido2PEDIDO_CLIENTE.AsString + ' (Ped.Int: ' + qPedido2NUM_PEDIDO.AsString + ') ja esta diponivel para coleta ';
      //ShowMessage( api.sendSms(qFilial_SMSFONE_ORIGEM.AsString, qPedido2DDD.AsString + qPedido2FONE.AsString, vMSG) );
      ShowMessage( api.sendSms(qFilial_SMSFONE_ORIGEM.AsString, qPedido2DDD.AsString + vFone, vMSG) );
      Result := 'S';
    finally
      FreeAndNil(api);
    end;

    //********************************

    {vMSG := 'http://31.220.58.130/sms.php?&destino=55' + qPedido2DDD.AsString + qPedido2FONE.AsString
          + '&texto='+ 'Joao Wiest (JW) Informa que seu Pedido: ' + qPedido2NUM_PEDIDO.AsString + ' Ja pode ser retirado';

    oHttp := THTTPReqResp.Create(nil);
    oStr := TStringStream.Create('');

    oHttp.SendTimeout    := 120000;
    oHttp.ReceiveTimeout := 120000;
    oHttp.ConnectTimeout := 120000;

    MemStream := TMemoryStream.Create;
    try
      oHttp.UseUTF8InHeader := True;

      oHttp.Proxy    := '';
      oHttp.UserName := '';
      oHttp.Password := '';

      oHttp.URL := vmsg;

      context := oHttp.Send(oStr);
      oHttp.Receive(Context, MemStream, True);

      oStr.CopyFrom(MemStream, 0);
      oStr.Position := 0;
      ShowMessage(oStr.DataString);
    finally
      FreeAndNil(MemStream);
      FreeAndNil(oStr);
      FreeAndNil(oHttp);
    end;}

  end;

begin
  qParametros_Ped.Close;
  qParametros_Ped.Open;
  if Tipo_Status = 'C' then
    vItem := 1
  else
  if Tipo_Status = 'E' then
    vItem := 5
  else
  if Tipo_Status = 'F' then
    vItem := 10
  else
  if Tipo_Status = 'T' then
    vItem := 15;
  if (Tipo_Status = 'C') and (qParametros_PedENVIAR_EMAIL_PROC_PED.AsString <> 'S') then
    exit;
  if (Tipo_Status = 'E') and (qParametros_PedENVIAR_EMAIL_PROC_EXP.AsString <> 'S') then
    exit;
  if (Tipo_Status = 'F') and (qParametros_PedENVIAR_EMAIL_PROC_FAT.AsString <> 'S') then
    exit;
  if (Tipo_Status = 'T') and (qParametros_PedENVIAR_EMAIL_PROC_TRANSP.AsString <> 'S') then
    exit;

  cdsPedido_Processo.Close;
  sdsPedido_Processo.ParamByName('ID').AsInteger   := ID;
  sdsPedido_Processo.ParamByName('ITEM').AsInteger := vItem;
  cdsPedido_Processo.Open;
  if cdsPedido_Processo.IsEmpty then
  begin
    if Opcao = 'G' then
    begin
      cdsPedido_Processo.Insert;
      cdsPedido_ProcessoID.AsInteger                := ID;
      cdsPedido_ProcessoITEM.AsInteger              := vItem;
      cdsPedido_ProcessoTIPO_STATUS.AsString        := Tipo_Status;
      cdsPedido_ProcessoDTPROCESSO.AsDateTime       := DtProcesso;
      cdsPedido_ProcessoID_TRANSPORTADORA.AsInteger := ID_Transportadora;
      cdsPedido_ProcessoCOD_RASTREAMENTO.AsString   := Cod_Rastreameto;
      if qParametros_PedENVIA_SMS.AsString = 'S' then
        cdsPedido_ProcessoSMS_ENVIADO.AsString := fnc_Enviar_SMS;
      if qParametros_PedUSA_EMAIL_NFECONFIG_CONF.AsString = 'S' then
        cdsPedido_ProcessoEMAIL_ENVIADO.AsString      := fnc_Enviar_Email
      else
        cdsPedido_ProcessoEMAIL_ENVIADO.AsString      := fnc_Enviar_URL;
      cdsPedido_Processo.Post;
      cdsPedido_Processo.ApplyUpdates(0);
    end;
  end
  else
  if (Opcao = 'E') and (cdsPedido_ProcessoEMAIL_ENVIADO.AsString = 'N') then
  begin
    cdsPedido_Processo.Edit;
    cdsPedido_ProcessoEMAIL_ENVIADO.AsString := fnc_Enviar_URL;
    cdsPedido_Processo.Post;
    cdsPedido_Processo.ApplyUpdates(0);
  end;
end;

procedure TDMAprovacao_Ped.cdsPedido_ProcessoNewRecord(DataSet: TDataSet);
begin
  cdsPedido_ProcessoSMS_ENVIADO.AsString := 'N';
end;

procedure TDMAprovacao_Ped.prc_Saldo_SMS;
var
  api: TApiDirectCall;
begin
  qFilial_SMS.Close;
  qFilial_SMS.ParamByName('ID').AsInteger := vFilial;
  qFilial_SMS.Open;

  api := TApiDirectCall.Create;
  try
    api.User := qFilial_SMSLOGIN.AsString;
    api.Password := qFilial_SMSSENHA.AsString;
    ShowMessage( api.consultarSaldo );
  finally
    FreeAndNil(api);
  end;
end;

procedure TDMAprovacao_Ped.prc_Consultar_PedWeb;
begin
  cdsConsultaPedWeb.Close;
  cdsConsultaPedWeb.Open;
end;

procedure TDMAprovacao_Ped.prc_Localiza_PedWeb(ID: Integer);
begin
  cdsPedWeb.Close;
  sdsPedWeb.CommandText := ctCommand;
  if ID <> 0 then
  begin
    sdsPedWeb.CommandText := sdsPedWeb.CommandText + ' WHERE ID = :ID ';
    sdsPedWeb.ParamByName('ID').AsInteger := ID;
  end;
  cdsPedWeb.Open;
  cdsPedWeb_Item.Close;
  cdsPedWeb_Item.Open;
end;

function TDMAprovacao_Ped.fnc_Verifica_Aprov(ID, Item: Integer; Tipo : String): Boolean;
var
  sds: TSQLDataSet;
  vDif : String;
begin
  //vDif := '<>';
  //if Tipo = '1' then
    vDif := '=';
  Result := False;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText := 'SELECT COUNT(1) CONTADOR FROM PEDIDO_ITEM_APROV I WHERE I.ID = :ID AND I.ITEM = :ITEM '
                     + ' AND coalesce(I.aprovado,''N'') ' + vDif + QuotedStr(Tipo);
    sds.ParamByName('ID').AsInteger   := ID;
    sds.ParamByName('ITEM').AsInteger := ITEM;
    sds.Open;
    if sds.FieldByName('CONTADOR').AsInteger > 0 then
      Result := True;
  finally
    FreeAndNil(sds);
  end;
end;

end.
