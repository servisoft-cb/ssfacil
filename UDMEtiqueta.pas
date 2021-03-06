unit UDMEtiqueta;

interface

uses
  SysUtils, Classes, DB, DBClient, FMTBcd, SqlExpr, Provider, Dialogs,
  frxClass, frxDBSet, frxRich, frxExportMail, frxExportPDF;

type
  TDMEtiqueta = class(TDataModule)
    mEtiqueta_Nav: TClientDataSet;
    mEtiqueta_NavNome_Empresa: TStringField;
    mEtiqueta_NavFone: TStringField;
    mEtiqueta_NavNome_Etiqueta: TStringField;
    mEtiqueta_NavTamanho: TStringField;
    mEtiqueta_NavReferencia: TStringField;
    mEtiqueta_NavNome_Produto: TStringField;
    mEtiqueta_NavNome_Cliente: TStringField;
    mEtiqueta_NavPedido_Cliente: TStringField;
    mEtiqueta_NavFantasia_Cli: TStringField;
    mEtiqueta_NavDtEmissao: TDateField;
    mEtiqueta_NavProd_Cliente: TStringField;
    mEtiqueta_NavNumOS: TStringField;
    mEtiqueta_NavEncerado: TStringField;
    mEtiqueta_NavItem_Ped: TIntegerField;
    mEtiqueta_NavUnidade: TStringField;
    dsmEtiqueta_Nav: TDataSource;
    qPessoa: TSQLQuery;
    qPessoaCODIGO: TIntegerField;
    qPessoaNOME: TStringField;
    qPessoaFANTASIA: TStringField;
    qPessoaENDERECO: TStringField;
    qPessoaCOMPLEMENTO_END: TStringField;
    qPessoaNUM_END: TStringField;
    qPessoaBAIRRO: TStringField;
    qPessoaID_CIDADE: TIntegerField;
    qPessoaCIDADE: TStringField;
    qPessoaUF: TStringField;
    qPessoaCEP: TStringField;
    qPessoaDDDFONE1: TIntegerField;
    qPessoaTELEFONE1: TStringField;
    qPessoaDDDFONE2: TIntegerField;
    qPessoaTELEFONE2: TStringField;
    qPessoaDDDFAX: TIntegerField;
    qPessoaFAX: TStringField;
    qPessoaPESSOA: TStringField;
    qPessoaCNPJ_CPF: TStringField;
    qPessoaINSCR_EST: TStringField;
    qPessoaENDERECO_ENT: TStringField;
    qPessoaCOMPLEMENTO_END_ENT: TStringField;
    qPessoaNUM_END_ENT: TStringField;
    qPessoaBAIRRO_ENT: TStringField;
    qPessoaID_CIDADE_ENT: TIntegerField;
    qPessoaCIDADE_ENT: TStringField;
    qPessoaCEP_ENT: TStringField;
    qPessoaUF_ENT: TStringField;
    qPessoaPESSOA_ENT: TStringField;
    qPessoaCNPJ_CPF_ENT: TStringField;
    qPessoaINSC_EST_ENT: TStringField;
    qPessoaENDERECO_PGTO: TStringField;
    qPessoaCOMPLEMENTO_END_PGTO: TStringField;
    qPessoaNUM_END_PGTO: TStringField;
    qPessoaBAIRRO_PGTO: TStringField;
    qPessoaID_CIDADE_PGTO: TIntegerField;
    qPessoaCIDADE_PGTO: TStringField;
    qPessoaCEP_PGTO: TStringField;
    qPessoaUF_PGTO: TStringField;
    qPessoaUSUARIO: TStringField;
    qPessoaDTCADASTRO: TDateField;
    qPessoaHRCADASTRO: TTimeField;
    qPessoaOBS: TMemoField;
    qPessoaCAIXAPOSTAL: TStringField;
    qPessoaRG: TStringField;
    qPessoaID_VENDEDOR: TIntegerField;
    qPessoaID_CONDPGTO: TIntegerField;
    qPessoaID_CONTABOLETO: TIntegerField;
    qPessoaID_TRANSPORTADORA: TIntegerField;
    qPessoaID_TIPOCOBRANCA: TIntegerField;
    qPessoaID_REDESPACHO: TIntegerField;
    qPessoaID_PAIS: TIntegerField;
    qPessoaID_REGIME_TRIB: TIntegerField;
    qPessoaPERC_COMISSAO: TFloatField;
    qPessoaDDD_ENT: TIntegerField;
    qPessoaFONE_ENT: TStringField;
    qPessoaDDD_PGTO: TIntegerField;
    qPessoaFONE_PGTO: TStringField;
    qPessoaINATIVO: TStringField;
    qPessoaHOMEPAGE: TStringField;
    qPessoaTIPO_FRETE: TStringField;
    qPessoaNOME_ENTREGA: TStringField;
    qPessoaEMAIL_NFE: TStringField;
    qPessoaEMAIL_PGTO: TStringField;
    qPessoaEMAIL_NFE2: TStringField;
    qPessoaPESSOA_PGTO: TStringField;
    qPessoaCNPJ_CPG_PGTO: TStringField;
    qPessoaINSC_EST_PGTO: TStringField;
    qPessoaUF_PLACA: TStringField;
    qPessoaPLACA: TStringField;
    qPessoaTP_CLIENTE: TStringField;
    qPessoaTP_FORNECEDOR: TStringField;
    qPessoaTP_TRANSPORTADORA: TStringField;
    qPessoaTP_VENDEDOR: TStringField;
    qPessoaTIPO_ICMS: TStringField;
    qPessoaID_TAB_PRECO: TIntegerField;
    qPessoaTP_ATELIER: TStringField;
    qPessoaTIPO_COMISSAO: TStringField;
    qPessoaPERC_COMISSAO_VEND: TFloatField;
    qPessoaNOME_CONTATO: TStringField;
    qPessoaINSC_MUNICIPAL: TStringField;
    qPessoaDT_CONTRATO_INI: TDateField;
    qPessoaDT_CONTRATO_FIN: TDateField;
    qPessoaID_SERVICO: TIntegerField;
    qPessoaID_SERVICO_INT: TIntegerField;
    qPessoaVLR_SERVICO: TFloatField;
    qPessoaCLIENTE_CONTA_ID: TIntegerField;
    qPessoaFORNECEDOR_CONTA_ID: TIntegerField;
    qPessoaVENDEDOR_CONTA_ID: TIntegerField;
    qPessoaTRANSPORTADORA_CONTA_ID: TIntegerField;
    qPessoaATELIER_CONTA_ID: TIntegerField;
    qPessoaRETEM_ISS: TStringField;
    qPessoaRETEM_CSLL: TStringField;
    qPessoaRETEM_PISCOFINS: TStringField;
    qPessoaRETEM_INSS: TStringField;
    qPessoaEMAIL_COMPRAS: TStringField;
    qPessoaCONTATO_COMPRAS: TStringField;
    qPessoaORGAO_PUBLICO: TStringField;
    qPessoaID_NATUREZA: TIntegerField;
    qPessoaDIMINUIR_RETENCAO: TStringField;
    qPessoaPERC_REDUCAO_INSS: TFloatField;
    qPessoaUSA_TRANSFICMS: TStringField;
    qPessoaCLIENTE_ESTOQUE: TStringField;
    qPessoaUSA_TAMANHO_AGRUPADO_NFE: TStringField;
    qPessoaCOD_ANT: TIntegerField;
    qPessoaID_EDI: TIntegerField;
    qPessoaPAI_NOME: TStringField;
    qPessoaMAE_NOME: TStringField;
    qPessoaTP_ALUNO: TStringField;
    qPessoaCOBRAR_TAXA_BANCO: TStringField;
    qPessoaVLR_LIMITE_CREDITO: TFloatField;
    qPessoaINSC_EST_ST: TStringField;
    qPessoaUF_ST: TStringField;
    qPessoaTIPO_CONSUMIDOR: TSmallintField;
    qPessoaTIPO_CONTRIBUINTE: TSmallintField;
    qPessoaINSC_SUFRAMA: TStringField;
    qPessoaCOD_ALFA: TStringField;
    qPessoaTP_PREPOSTO: TStringField;
    qPessoaTP_EXPORTACAO: TStringField;
    qPessoaCARIMBO: TStringField;
    qPessoaDTPEDIDO: TDateField;
    qPessoaDTNOTA: TDateField;
    qPessoaPERC_DESC_SUFRAMA: TFloatField;
    qPessoaVLR_LIMITE_COMPRA: TFloatField;
    qPessoaID_GRUPO: TIntegerField;
    qPessoaTP_FUNCIONARIO: TStringField;
    qPessoaIMP_COD_PRODUTO_CLI: TStringField;
    qPessoaFILIAL: TIntegerField;
    qPessoaVLR_ULT_FATURAMENTO: TFloatField;
    qPessoaQTD_ULT_FATURAMENTO: TFloatField;
    qPessoaCOD_CONTABIL_CLIENTE: TIntegerField;
    qPessoaCOD_CONTABIL_FORNECEDOR: TIntegerField;
    qPessoaID_REGIAO_VENDA: TIntegerField;
    qPessoaTIPO_CREDITO: TStringField;
    qPessoaUSUARIO_LOG: TStringField;
    qPessoaPROTESTAR: TStringField;
    qPessoaID_CARTEIRA: TIntegerField;
    qPessoaCELULAR: TStringField;
    qPessoaDDDCELULAR: TIntegerField;
    qPessoaCONT_CUSTO_LIQ: TStringField;
    qPessoaUSA_OC_XML: TStringField;
    qPessoaIMP_COR_CLIENTE: TStringField;
    qPessoaOBS_AVISO: TStringField;
    qPessoaMOSTRAR_AVISO: TStringField;
    qPessoaID_ROTA: TIntegerField;
    sdsNotaFiscal_Itens: TSQLDataSet;
    dspNotaFiscal_Itens: TDataSetProvider;
    cdsNotaFiscal_Itens: TClientDataSet;
    cdsNotaFiscal_ItensID: TIntegerField;
    cdsNotaFiscal_ItensITEM: TIntegerField;
    cdsNotaFiscal_ItensID_PRODUTO: TIntegerField;
    cdsNotaFiscal_ItensID_COR: TIntegerField;
    cdsNotaFiscal_ItensTAMANHO: TStringField;
    cdsNotaFiscal_ItensNOME_PRODUTO: TStringField;
    cdsNotaFiscal_ItensREFERENCIA: TStringField;
    cdsNotaFiscal_ItensUNIDADE: TStringField;
    cdsNotaFiscal_ItensQTD: TFloatField;
    cdsNotaFiscal_ItensNUMERO_OC: TStringField;
    cdsNotaFiscal_ItensNUMERO_OS: TStringField;
    cdsNotaFiscal_ItensNUM_PEDIDO: TIntegerField;
    cdsNotaFiscal_ItensCOD_PRODUTO_FORN: TStringField;
    cdsNotaFiscal_ItensCOD_BARRA: TStringField;
    cdsNotaFiscal_ItensCOD_PRODUTO_CLIENTE: TStringField;
    cdsNotaFiscal_ItensCOD_COR_CLIENTE: TStringField;
    cdsNotaFiscal_ItensNOME_COR_CLIENTE: TStringField;
    cdsNotaFiscal_ItensTAMANHO_CLIENTE: TStringField;
    cdsNotaFiscal_ItensNOME_COR: TStringField;
    qNotaFiscal: TSQLQuery;
    qNotaFiscalID: TIntegerField;
    qNotaFiscalNUMNOTA: TIntegerField;
    qNotaFiscalID_CLIENTE: TIntegerField;
    qNotaFiscalNOME_CLIENTE: TStringField;
    qNotaFiscalIMP_COR_CLIENTE: TStringField;
    cdsNotaFiscal_ItensENCERADO: TStringField;
    qNotaFiscalDTEMISSAO: TDateField;
    qNotaFiscalFANTASIA: TStringField;
    qNotaFiscalNOME_INTERNO: TStringField;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    frxmEtiqueta_Nav: TfrxDBDataset;
    mEtiqueta_NavNum_Nota: TIntegerField;
    mEtiqueta_NavCod_Cor_Cliente: TStringField;
    mEtiqueta_NavNome_Cor_Cliente: TStringField;
    mEtiqueta_NavSequencia_RFID: TLargeintField;
    mEtiqueta_NavCNPJ_Filial: TStringField;
    qNotaFiscalFILIAL: TIntegerField;
    mEtiqueta_NavID_Nota: TIntegerField;
    mEtiqueta_NavItem_Nota: TIntegerField;
    mEtiqueta_NavFilial: TIntegerField;
    mEtiqueta_NavNUM_RFID: TStringField;
    mEtiqueta_NavFantasia_Filial: TStringField;
    mEtiqueta_NavSelecionado: TStringField;
    sdsParametros_Fin: TSQLDataSet;
    dspParametros_Fin: TDataSetProvider;
    cdsParametros_Fin: TClientDataSet;
    dsParametros_Fin: TDataSource;
    sdsParametros_FinID: TIntegerField;
    sdsParametros_FinZEBRA_TEMPERATURA: TIntegerField;
    sdsParametros_FinZEBRA_VELOCIDADE: TIntegerField;
    cdsParametros_FinID: TIntegerField;
    cdsParametros_FinZEBRA_TEMPERATURA: TIntegerField;
    cdsParametros_FinZEBRA_VELOCIDADE: TIntegerField;
    sdsParametros_FinZEBRA_ENDERECO: TStringField;
    cdsParametros_FinZEBRA_ENDERECO: TStringField;
    mEtiqueta_NavEnviado: TStringField;
    sdsConsNotaFiscal_RFID: TSQLDataSet;
    dspConsNotaFiscal_RFID: TDataSetProvider;
    cdsConsNotaFiscal_RFID: TClientDataSet;
    cdsConsNotaFiscal_RFIDID: TIntegerField;
    cdsConsNotaFiscal_RFIDITEM_NOTA: TIntegerField;
    cdsConsNotaFiscal_RFIDITEM_RFID: TIntegerField;
    cdsConsNotaFiscal_RFIDFILIAL: TIntegerField;
    cdsConsNotaFiscal_RFIDCNPJ_FILIAL: TStringField;
    cdsConsNotaFiscal_RFIDSEQUENCIA: TFMTBCDField;
    cdsConsNotaFiscal_RFIDQTD: TFloatField;
    cdsConsNotaFiscal_RFIDUNIDADE: TStringField;
    cdsConsNotaFiscal_RFIDNUM_RFID: TStringField;
    cdsConsNotaFiscal_RFIDENVIADO: TStringField;
    mEtiqueta_NavQtd: TFloatField;
    cdsNotaFiscal_ItensQTD_POR_ROTULO: TFloatField;
    sdsItemSemQtdRotulo: TSQLDataSet;
    dspItemSemQtdRotulo: TDataSetProvider;
    cdsItemSemQtdRotulo: TClientDataSet;
    dsItemSemQtdRotulo: TDataSource;
    cdsItemSemQtdRotuloID_PRODUTO: TIntegerField;
    cdsItemSemQtdRotuloREFERENCIA: TStringField;
    cdsItemSemQtdRotuloNOME_PRODUTO: TStringField;
    cdsItemSemQtdRotuloQTD_POR_ROTULO: TFloatField;
    cdsItemSemQtdRotuloUNIDADE: TStringField;
    sdsNotaFiscal_Agr: TSQLDataSet;
    dspNotaFiscal_Agr: TDataSetProvider;
    cdsNotaFiscal_Agr: TClientDataSet;
    cdsNotaFiscal_AgrID: TIntegerField;
    cdsNotaFiscal_AgrID_PRODUTO: TIntegerField;
    cdsNotaFiscal_AgrID_COR: TIntegerField;
    cdsNotaFiscal_AgrTAMANHO: TStringField;
    cdsNotaFiscal_AgrNOME_PRODUTO: TStringField;
    cdsNotaFiscal_AgrREFERENCIA: TStringField;
    cdsNotaFiscal_AgrUNIDADE: TStringField;
    cdsNotaFiscal_AgrQTD: TFloatField;
    cdsNotaFiscal_AgrCOD_PRODUTO_FORN: TStringField;
    cdsNotaFiscal_AgrCOD_PRODUTO_CLIENTE: TStringField;
    cdsNotaFiscal_AgrCOD_COR_CLIENTE: TStringField;
    cdsNotaFiscal_AgrTAMANHO_CLIENTE: TStringField;
    cdsNotaFiscal_AgrENCERADO: TStringField;
    cdsNotaFiscal_AgrQTD_POR_ROTULO: TFloatField;
    qNumOC: TSQLQuery;
    qNumOCNUMERO_OC: TStringField;
    qNumOCITEM: TIntegerField;
    cdsNotaFiscal_AgrNOME_COR: TStringField;
    mEtiqueta_NavID_Produto: TIntegerField;
    mEtiqueta_NavID_Cor: TIntegerField;
    mEtiqueta_NavID_Cliente: TIntegerField;
    mEtiqueta_NavNome_Cor: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mEtiqueta_NavNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    vCod_Cor_Cli, vProd_Cliente : String;
    procedure prc_Busca_Produto_Cliente(ID_Produto, ID_Cor : Integer);

  public
    { Public declarations }
    vProd_Cliente_Exite : Boolean;

    procedure prc_Monta_Etiqueta_Calcado(Tipo: String; ID: Integer; Qtd : Integer ; RFID : Boolean); //D= DOS   A=A4 em windows

    procedure prc_Monta_Etiqueta_RFID(ID: Integer; Qtd : Real);
    procedure prc_Monta_Etiqueta_RFID_Agr(ID: Integer; Qtd : Real);

    procedure prc_Le_NotaFiscal_RFID(ID : Integer);

    function fnc_Verifica_Enviado_BeiraRio(Sequencial : Int64; Filial : Integer) : String;

  end;

var
  DMEtiqueta: TDMEtiqueta;

implementation

uses DmdDatabase, uUtilPadrao, Math;

{$R *.dfm}

{ TDMEtiqueta }

procedure TDMEtiqueta.prc_Busca_Produto_Cliente(ID_Produto, ID_Cor : Integer);
var
  sds: TSQLDataSet;
begin
  vCod_Cor_Cli  := '';
  vProd_Cliente := '';
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.GetMetadata   := False;
    sds.NoMetadata    := True;
    sds.CommandText   := 'select P.COD_MATERIAL_FORN, P.COD_COR_FORN, P.TAMANHO_CLIENTE '
                       + 'from PRODUTO_FORN P '
                       + 'where P.ID = :ID and P.ID_FORNECEDOR = :ID_FORNECEDOR ';
    if ID_Cor > 0 then
    begin
      sds.CommandText := sds.CommandText + ' AND P.ID_COR = :ID_COR ';
      sds.ParamByName('ID_COR').AsInteger := ID_Cor;
    end;
    sds.ParamByName('ID').AsInteger := ID_Produto;
    sds.ParamByName('ID_FORNECEDOR').AsInteger := qNotaFiscalID_CLIENTE.AsInteger;
    sds.Open;

    vProd_Cliente := sds.FieldByName('COD_MATERIAL_FORN').AsString;
    vCod_Cor_Cli  := sds.FieldByName('COD_COR_FORN').AsString;

  finally
    FreeAndNil(sds);
  end;
end;

procedure TDMEtiqueta.prc_Monta_Etiqueta_Calcado(Tipo: String; ID: Integer; Qtd : Integer ; RFID : Boolean); //D= DOS   A=A4 em windows
var
  i: Integer;
  vQtdDiv: Integer;
  vTexto: String;
  vQtdAux: Integer;
  vQtdPac: Integer;
begin
  vTexto := '1';
  if (Tipo = 'A') then
  begin
    if Qtd <= 0 then
      vTexto := InputBox('','Informar a Quantidade por Pacote','72')
    else
      vTexto := IntToStr(Qtd);
  end;
  vTexto := Monta_Numero(vTexto,0);
  if trim(vTexto) <> '' then
    vQtdDiv := StrToInt(vTexto)
  else
    vQtdDiv := 1;
  vQtdPac := vQtdDiv;

  qNotaFiscal.Close;
  qNotaFiscal.ParamByName('ID').AsInteger := ID;
  qNotaFiscal.Open;

  cdsNotaFiscal_Itens.Close;
  sdsNotaFiscal_Itens.ParamByName('ID').AsInteger := ID;
  cdsNotaFiscal_Itens.Open;

  mEtiqueta_Nav.EmptyDataSet;
  cdsNotaFiscal_Itens.First;
  while not cdsNotaFiscal_Itens.Eof do
  begin
    //for i := 1 to fDMCadPedido.cdsPedidoImp_ItensQTD.AsInteger do
    vQtdAux := cdsNotaFiscal_ItensQTD.AsInteger;
    if Tipo = 'A' then
    begin
      vQtdDiv := cdsNotaFiscal_ItensQTD.AsInteger div vQtdPac;
      if cdsNotaFiscal_ItensQTD.AsInteger mod vQtdPac > 0 then
        vQtdDiv := vQtdDiv + 1;
    end;

    if Tipo <> 'A' then
      vQtdDiv := vQtdAux;
    for i := 1 to vQtdDiv do
    begin
      mEtiqueta_Nav.Insert;
      mEtiqueta_NavNum_Nota.AsInteger        := qNotaFiscalNUMNOTA.AsInteger;
      mEtiqueta_NavID_Nota.AsInteger         := qNotaFiscalID.AsInteger;
      mEtiqueta_NavItem_Nota.AsInteger       := cdsNotaFiscal_ItensITEM.AsInteger;
      mEtiqueta_NavFilial.AsInteger          := qNotaFiscalFILIAL.AsInteger;
      mEtiqueta_NavReferencia.AsString       := cdsNotaFiscal_ItensREFERENCIA.AsString;
      mEtiqueta_NavNome_Produto.AsString     := cdsNotaFiscal_ItensNOME_PRODUTO.AsString;
      mEtiqueta_NavItem_Ped.AsInteger        := cdsNotaFiscal_ItensITEM.AsInteger;
      mEtiqueta_NavCod_Cor_Cliente.AsString  := cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString;
      vProd_Cliente := '';
      if (RFID) and (trim(cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString) = '') then
      begin
        prc_Busca_Produto_Cliente(cdsNotaFiscal_ItensID_PRODUTO.AsInteger,cdsNotaFiscal_ItensID_COR.AsInteger);
        mEtiqueta_NavCod_Cor_Cliente.AsString := vCod_Cor_Cli;
      end;
      mEtiqueta_NavNome_Cor_Cliente.AsString := cdsNotaFiscal_ItensNOME_COR_CLIENTE.AsString;
      mEtiqueta_NavCNPJ_Filial.AsString      := SQLLocate('FILIAL','ID','CNPJ_CPF',qNotaFiscalFILIAL.AsString);
      if (qNotaFiscalIMP_COR_CLIENTE.AsString = 'S') and (cdsNotaFiscal_ItensID_COR.AsInteger > 0) and
         (cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString <> '') then
      begin
        //mEtiqueta_NavNome_Produto.AsString := cdsNotaFiscal_ItensNOME_PRODUTO.AsString + ' ' + cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString
        //                  + ' ' + cdsNotaFiscal_ItensNOME_COR_CLIENTE.AsString;
        if (trim(cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString) <> '') and (trim(cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString) <> '0') then
          mEtiqueta_NavNome_Produto.AsString := mEtiqueta_NavNome_Produto.AsString + ' TAM. ' + cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString;
      end
      else
      if cdsNotaFiscal_ItensID_COR.AsInteger > 0 then
        mEtiqueta_NavNome_Produto.AsString := mEtiqueta_NavNome_Produto.AsString + ' ' + cdsNotaFiscal_ItensNOME_COR.AsString;
      mEtiqueta_NavTamanho.AsString      := cdsNotaFiscal_ItensTAMANHO.AsString;
      mEtiqueta_NavNumOS.AsString        := cdsNotaFiscal_ItensNUMERO_OS.AsString;
      mEtiqueta_NavUnidade.AsString      := cdsNotaFiscal_ItensUNIDADE.AsString;
      if cdsNotaFiscal_ItensENCERADO.AsString = 'S' then
      begin
        mEtiqueta_NavEncerado.AsString   := 'encerado';
        mEtiqueta_NavReferencia.AsString := mEtiqueta_NavReferencia.AsString + '-E';
      end
      else
        mEtiqueta_NavEncerado.AsString     := '';
      if Tipo = 'A' then
      begin
        if trim(cdsNotaFiscal_ItensCOD_PRODUTO_CLIENTE.AsString) <> '' then
          mEtiqueta_NavProd_Cliente.AsString := cdsNotaFiscal_ItensCOD_PRODUTO_CLIENTE.AsString
        else
        begin
          mEtiqueta_NavProd_Cliente.AsString := fnc_Busca_CodProduto_Cliente(cdsNotaFiscal_ItensID_PRODUTO.AsInteger,
                                                                             qNotaFiscalID_CLIENTE.AsInteger,
                                                                             cdsNotaFiscal_ItensID_COR.AsInteger,'',
                                                                             cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString);
        end;
        if (RFID) and (trim(mEtiqueta_NavProd_Cliente.AsString) = '') then
          mEtiqueta_NavProd_Cliente.AsString := vProd_Cliente;

        mEtiqueta_NavDtEmissao.AsDateTime    := qNotaFiscalDTEMISSAO.AsDateTime;
        mEtiqueta_NavNome_Empresa.AsString   := qNotaFiscalNOME_INTERNO.AsString;
        mEtiqueta_NavNome_Cliente.AsString   := qNotaFiscalNOME_CLIENTE.AsString;
        mEtiqueta_NavFantasia_Cli.AsString   := qNotaFiscalFANTASIA.AsString;
        mEtiqueta_NavPedido_Cliente.AsString := cdsNotaFiscal_ItensNUMERO_OC.AsString;
        if vQtdAux > vQtdPac then
          mEtiqueta_NavQtd.AsInteger := vQtdPac
        else
          mEtiqueta_NavQtd.AsInteger := vQtdAux;
        vQtdAux := vQtdAux - vQtdPac;
        if vQtdAux <= 0 then
          vQtdDiv := i;
      end;
      if mEtiqueta_Nav.State in [dsEdit,dsInsert] then
        mEtiqueta_Nav.Post;
    end;
    cdsNotaFiscal_Itens.Next;
  end;
end;

procedure TDMEtiqueta.DataModuleCreate(Sender: TObject);
begin
  cdsParametros_Fin.Open;
end;

procedure TDMEtiqueta.mEtiqueta_NavNewRecord(DataSet: TDataSet);
begin
  mEtiqueta_NavEnviado.AsString := 'N';
end;

procedure TDMEtiqueta.prc_Le_NotaFiscal_RFID(ID: Integer);
begin
  qNotaFiscal.Close;
  qNotaFiscal.ParamByName('ID').AsInteger := ID;
  qNotaFiscal.Open;
  cdsNotaFiscal_Itens.Close;
  sdsNotaFiscal_Itens.ParamByName('ID').AsInteger := ID;
  cdsNotaFiscal_Itens.Open;
  mEtiqueta_Nav.EmptyDataSet;
  cdsNotaFiscal_Itens.First;
  while not cdsNotaFiscal_Itens.Eof do
  begin
    cdsConsNotaFiscal_RFID.Close;
    sdsConsNotaFiscal_RFID.ParamByName('ID').AsInteger        := cdsNotaFiscal_ItensID.AsInteger;
    sdsConsNotaFiscal_RFID.ParamByName('ITEM_NOTA').AsInteger := cdsNotaFiscal_ItensITEM.AsInteger;
    cdsConsNotaFiscal_RFID.Open;
    cdsConsNotaFiscal_RFID.First;
    while not cdsConsNotaFiscal_RFID.Eof do
    begin
      mEtiqueta_Nav.Insert;
      mEtiqueta_NavNum_Nota.AsInteger        := qNotaFiscalNUMNOTA.AsInteger;
      mEtiqueta_NavID_Nota.AsInteger         := qNotaFiscalID.AsInteger;
      mEtiqueta_NavItem_Nota.AsInteger       := cdsNotaFiscal_ItensITEM.AsInteger;
      mEtiqueta_NavFilial.AsInteger          := qNotaFiscalFILIAL.AsInteger;
      mEtiqueta_NavID_Cliente.AsInteger      := qNotaFiscalID_CLIENTE.AsInteger;
      mEtiqueta_NavReferencia.AsString       := cdsNotaFiscal_ItensREFERENCIA.AsString;
      mEtiqueta_NavNome_Produto.AsString     := cdsNotaFiscal_ItensNOME_PRODUTO.AsString;
      mEtiqueta_NavItem_Ped.AsInteger        := cdsNotaFiscal_ItensITEM.AsInteger;
      mEtiqueta_NavCod_Cor_Cliente.AsString  := cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString;
      mEtiqueta_NavID_Produto.AsInteger      := cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
      mEtiqueta_NavID_Cor.AsInteger          := cdsNotaFiscal_ItensID_COR.AsInteger;
      if cdsNotaFiscal_ItensID_COR.IsNull then
        mEtiqueta_NavID_Cor.AsInteger := 0;
      vProd_Cliente := '';
      if (trim(cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString) = '') then
      begin
        prc_Busca_Produto_Cliente(cdsNotaFiscal_ItensID_PRODUTO.AsInteger,cdsNotaFiscal_ItensID_COR.AsInteger) ;
        mEtiqueta_NavCod_Cor_Cliente.AsString := vCod_Cor_Cli;
      end;
      mEtiqueta_NavNome_Cor_Cliente.AsString := cdsNotaFiscal_ItensNOME_COR_CLIENTE.AsString;
      mEtiqueta_NavCNPJ_Filial.AsString      := SQLLocate('FILIAL','ID','CNPJ_CPF',qNotaFiscalFILIAL.AsString);
      if (qNotaFiscalIMP_COR_CLIENTE.AsString = 'S') and (cdsNotaFiscal_ItensID_COR.AsInteger > 0) and
         (cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString <> '') then
      begin
        if (trim(cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString) <> '') and (trim(cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString) <> '0') then
          mEtiqueta_NavNome_Produto.AsString := mEtiqueta_NavNome_Produto.AsString + ' TAM. ' + cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString;
      end
      else
      if cdsNotaFiscal_ItensID_COR.AsInteger > 0 then
        mEtiqueta_NavNome_Produto.AsString := mEtiqueta_NavNome_Produto.AsString + ' ' + cdsNotaFiscal_ItensNOME_COR.AsString;
      mEtiqueta_NavTamanho.AsString      := cdsNotaFiscal_ItensTAMANHO.AsString;
      mEtiqueta_NavNumOS.AsString        := cdsNotaFiscal_ItensNUMERO_OS.AsString;
      mEtiqueta_NavUnidade.AsString      := cdsNotaFiscal_ItensUNIDADE.AsString;
      mEtiqueta_NavEncerado.AsString     := '';
      if trim(cdsNotaFiscal_ItensCOD_PRODUTO_CLIENTE.AsString) <> '' then
        mEtiqueta_NavProd_Cliente.AsString := cdsNotaFiscal_ItensCOD_PRODUTO_CLIENTE.AsString
      else
      begin
        mEtiqueta_NavProd_Cliente.AsString := fnc_Busca_CodProduto_Cliente(cdsNotaFiscal_ItensID_PRODUTO.AsInteger,
                                                                           qNotaFiscalID_CLIENTE.AsInteger,
                                                                           cdsNotaFiscal_ItensID_COR.AsInteger,'',
                                                                           cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString);
      end;
      if (trim(mEtiqueta_NavProd_Cliente.AsString) = '') then
        mEtiqueta_NavProd_Cliente.AsString := vProd_Cliente;

      mEtiqueta_NavDtEmissao.AsDateTime      := qNotaFiscalDTEMISSAO.AsDateTime;
      mEtiqueta_NavNome_Empresa.AsString     := qNotaFiscalNOME_INTERNO.AsString;
      mEtiqueta_NavNome_Cliente.AsString     := qNotaFiscalNOME_CLIENTE.AsString;
      mEtiqueta_NavFantasia_Cli.AsString     := qNotaFiscalFANTASIA.AsString;
      mEtiqueta_NavPedido_Cliente.AsString   := cdsNotaFiscal_ItensNUMERO_OC.AsString;
      mEtiqueta_NavQtd.AsFloat               := StrToFloat(FormatFloat('0.0000',cdsConsNotaFiscal_RFIDQTD.AsFloat));
      mEtiqueta_NavSequencia_RFID.AsLargeInt := cdsConsNotaFiscal_RFIDSEQUENCIA.AsInteger;
      mEtiqueta_NavNUM_RFID.AsString         := cdsConsNotaFiscal_RFIDNUM_RFID.AsString;
      mEtiqueta_NavEnviado.AsString          := cdsConsNotaFiscal_RFIDENVIADO.AsString;
      mEtiqueta_Nav.Post;
      cdsConsNotaFiscal_RFID.Next;
    end;
    cdsNotaFiscal_Itens.Next;
  end;
end;

function TDMEtiqueta.fnc_Verifica_Enviado_BeiraRio(Sequencial: Int64;
  Filial: Integer): String;
var
  sds: TSQLDataSet;
begin
  Result := 'N';
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.GetMetadata   := False;
    sds.NoMetadata    := True;
    sds.CommandText   := 'select count(1) CONTADOR from NOTAFISCAL_RFID R '
                       + 'where R.FILIAL = :FILIAL and '
                       + '      R.SEQUENCIA = :SEQUENCIA and '
                       + '      coalesce(R.ENVIADO, ' + QuotedStr('N') + ') = ' + QuotedStr('N');
    sds.ParamByName('FILIAL').AsInteger    := Filial;
    sds.ParamByName('SEQUENCIA').AsInteger := Sequencial;
    sds.Open;
    if sds.FieldByName('CONTADOR').AsInteger <= 0 then
      Result := 'S';
  finally
    FreeAndNil(sds);
  end;
end;

procedure TDMEtiqueta.prc_Monta_Etiqueta_RFID(ID: Integer; Qtd : Real);
var
  vFlag: Boolean;
  vQtdRest: Real;
  vUsaQtdRotulo : String;
begin
  vProd_Cliente_Exite := True;
  vUsaQtdRotulo := SQLLocate('PARAMETROS_PROD','ID','USA_QTD_ROTULO_RFID','1');

  qNotaFiscal.Close;
  qNotaFiscal.ParamByName('ID').AsInteger := ID;
  qNotaFiscal.Open;

  cdsNotaFiscal_Itens.Close;
  sdsNotaFiscal_Itens.ParamByName('ID').AsInteger := ID;
  cdsNotaFiscal_Itens.Open;

  mEtiqueta_Nav.EmptyDataSet;
  cdsNotaFiscal_Itens.First;
  while not cdsNotaFiscal_Itens.Eof do
  begin
    vQtdRest := StrToFloat(FormatFloat('0.0000',cdsNotaFiscal_ItensQTD.AsFloat));
    if vUsaQtdRotulo = 'S' then
    begin
      if StrToFloat(FormatFloat('0.0000',cdsNotaFiscal_ItensQTD_POR_ROTULO.AsFloat)) <= 0 then
        Qtd := StrToFloat(FormatFloat('0.0000',cdsNotaFiscal_ItensQTD.AsFloat))
      else
        Qtd := StrToFloat(FormatFloat('0.0000',cdsNotaFiscal_ItensQTD_POR_ROTULO.AsFloat));
    end;
    vFlag    := False;
    while not vFlag do
    begin
      mEtiqueta_Nav.Insert;
      mEtiqueta_NavNum_Nota.AsInteger        := qNotaFiscalNUMNOTA.AsInteger;
      mEtiqueta_NavID_Nota.AsInteger         := qNotaFiscalID.AsInteger;
      mEtiqueta_NavItem_Nota.AsInteger       := cdsNotaFiscal_ItensITEM.AsInteger;
      mEtiqueta_NavFilial.AsInteger          := qNotaFiscalFILIAL.AsInteger;
      mEtiqueta_NavID_Cliente.AsInteger      := qNotaFiscalID_CLIENTE.AsInteger;
      mEtiqueta_NavID_Produto.AsInteger      := cdsNotaFiscal_ItensID_PRODUTO.AsInteger;
      mEtiqueta_NavID_Cor.AsInteger          := cdsNotaFiscal_ItensID_COR.AsInteger;
      if cdsNotaFiscal_ItensID_COR.IsNull then
        mEtiqueta_NavID_Cor.AsInteger := 0;
      mEtiqueta_NavNome_Cor.AsString := cdsNotaFiscal_ItensNOME_COR.AsString;
      mEtiqueta_NavReferencia.AsString       := cdsNotaFiscal_ItensREFERENCIA.AsString;
      mEtiqueta_NavNome_Produto.AsString     := cdsNotaFiscal_ItensNOME_PRODUTO.AsString;
      mEtiqueta_NavItem_Ped.AsInteger        := cdsNotaFiscal_ItensITEM.AsInteger;
      mEtiqueta_NavCod_Cor_Cliente.AsString  := cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString;
      vProd_Cliente := '';
      if (trim(cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString) = '') then
      begin
        prc_Busca_Produto_Cliente(cdsNotaFiscal_ItensID_PRODUTO.AsInteger,cdsNotaFiscal_ItensID_COR.AsInteger);
        mEtiqueta_NavCod_Cor_Cliente.AsString := vCod_Cor_Cli;
      end;
      mEtiqueta_NavNome_Cor_Cliente.AsString := cdsNotaFiscal_ItensNOME_COR_CLIENTE.AsString;
      mEtiqueta_NavCNPJ_Filial.AsString      := SQLLocate('FILIAL','ID','CNPJ_CPF',qNotaFiscalFILIAL.AsString);
      if (qNotaFiscalIMP_COR_CLIENTE.AsString = 'S') and (cdsNotaFiscal_ItensID_COR.AsInteger > 0) and
         (cdsNotaFiscal_ItensCOD_COR_CLIENTE.AsString <> '') then
      begin
        if (trim(cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString) <> '') and (trim(cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString) <> '0') then
          mEtiqueta_NavNome_Produto.AsString := mEtiqueta_NavNome_Produto.AsString + ' TAM. ' + cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString;
      end
      else
      if cdsNotaFiscal_ItensID_COR.AsInteger > 0 then
        mEtiqueta_NavNome_Produto.AsString := mEtiqueta_NavNome_Produto.AsString + ' ' + cdsNotaFiscal_ItensNOME_COR.AsString;
      mEtiqueta_NavTamanho.AsString      := cdsNotaFiscal_ItensTAMANHO.AsString;
      mEtiqueta_NavNumOS.AsString        := cdsNotaFiscal_ItensNUMERO_OS.AsString;
      mEtiqueta_NavUnidade.AsString      := cdsNotaFiscal_ItensUNIDADE.AsString;
      mEtiqueta_NavEncerado.AsString     := '';
      if trim(cdsNotaFiscal_ItensCOD_PRODUTO_CLIENTE.AsString) <> '' then
        mEtiqueta_NavProd_Cliente.AsString := cdsNotaFiscal_ItensCOD_PRODUTO_CLIENTE.AsString
      else
      begin
        mEtiqueta_NavProd_Cliente.AsString := fnc_Busca_CodProduto_Cliente(cdsNotaFiscal_ItensID_PRODUTO.AsInteger,
                                                                           qNotaFiscalID_CLIENTE.AsInteger,
                                                                           cdsNotaFiscal_ItensID_COR.AsInteger,'',
                                                                           cdsNotaFiscal_ItensTAMANHO_CLIENTE.AsString);
      end;
      if (trim(mEtiqueta_NavProd_Cliente.AsString) = '') then
        mEtiqueta_NavProd_Cliente.AsString := vProd_Cliente;

      mEtiqueta_NavDtEmissao.AsDateTime    := qNotaFiscalDTEMISSAO.AsDateTime;
      mEtiqueta_NavNome_Empresa.AsString   := qNotaFiscalNOME_INTERNO.AsString;
      mEtiqueta_NavNome_Cliente.AsString   := qNotaFiscalNOME_CLIENTE.AsString;
      mEtiqueta_NavFantasia_Cli.AsString   := qNotaFiscalFANTASIA.AsString;
      mEtiqueta_NavPedido_Cliente.AsString := cdsNotaFiscal_ItensNUMERO_OC.AsString;
      if vQtdRest > qtd then
        mEtiqueta_NavQtd.AsFloat := StrToFloat(FormatFloat('0.0000',Qtd))
      else
        mEtiqueta_NavQtd.AsFloat := StrToFloat(FormatFloat('0.0000',vQtdRest));
      vQtdRest := StrToFloat(FormatFloat('0.0000',vQtdRest - mEtiqueta_NavQtd.AsFloat));
      if StrToFloat(FormatFloat('0.0000',vQtdRest)) <= 0 then
        vFlag := True;
      mEtiqueta_Nav.Post;
    end;
    cdsNotaFiscal_Itens.Next;
  end;
end;

procedure TDMEtiqueta.prc_Monta_Etiqueta_RFID_Agr(ID: Integer; Qtd: Real);
var
  vFlag: Boolean;
  vQtdRest: Real;
  vUsaQtdRotulo : String;
begin
  vProd_Cliente_Exite := True; 
  vUsaQtdRotulo := SQLLocate('PARAMETROS_PROD','ID','USA_QTD_ROTULO_RFID','1');

  qNotaFiscal.Close;
  qNotaFiscal.ParamByName('ID').AsInteger := ID;
  qNotaFiscal.Open;

  cdsNotaFiscal_Agr.Close;
  sdsNotaFiscal_Agr.ParamByName('ID').AsInteger := ID;
  cdsNotaFiscal_Agr.Open;

  mEtiqueta_Nav.EmptyDataSet;
  cdsNotaFiscal_Agr.First;
  while not cdsNotaFiscal_Agr.Eof do
  begin
    vQtdRest := StrToFloat(FormatFloat('0.0000',cdsNotaFiscal_AgrQTD.AsFloat));
    if vUsaQtdRotulo = 'S' then
    begin
      if StrToFloat(FormatFloat('0.0000',cdsNotaFiscal_AgrQTD_POR_ROTULO.AsFloat)) <= 0 then
        Qtd := StrToFloat(FormatFloat('0.0000',cdsNotaFiscal_AgrQTD.AsFloat))
      else
        Qtd := StrToFloat(FormatFloat('0.0000',cdsNotaFiscal_AgrQTD_POR_ROTULO.AsFloat));
    end;
    qNumOC.Close;
    qNumOC.ParamByName('ID').AsInteger         := cdsNotaFiscal_AgrID.AsInteger;
    qNumOC.ParamByName('ID_PRODUTO').AsInteger := cdsNotaFiscal_AgrID_PRODUTO.AsInteger;
    qNumOC.ParamByName('ID_COR').AsInteger     := cdsNotaFiscal_AgrID_COR.AsInteger;
    if trim(cdsNotaFiscal_AgrTAMANHO.AsString) = '' then
      qNumOC.ParamByName('TAMANHO').AsString := ''
    else
      qNumOC.ParamByName('TAMANHO').AsString := cdsNotaFiscal_AgrTAMANHO.AsString;
    if trim(cdsNotaFiscal_AgrCOD_PRODUTO_FORN.AsString) = '' then
      qNumOC.ParamByName('COD_PRODUTO_FORN').AsString := ''
    else
      qNumOC.ParamByName('COD_PRODUTO_FORN').AsString := cdsNotaFiscal_AgrCOD_PRODUTO_FORN.AsString;
    if trim(cdsNotaFiscal_AgrCOD_PRODUTO_CLIENTE.AsString) = '' then
      qNumOC.ParamByName('COD_PRODUTO_CLIENTE').AsString := ''
    else
      qNumOC.ParamByName('COD_PRODUTO_CLIENTE').AsString := cdsNotaFiscal_AgrCOD_PRODUTO_CLIENTE.AsString;
    if trim(cdsNotaFiscal_AgrCOD_COR_CLIENTE.AsString) = '' then
      qNumOC.ParamByName('COD_COR_CLIENTE').AsString := ''
    else
      qNumOC.ParamByName('COD_COR_CLIENTE').AsString := cdsNotaFiscal_AgrCOD_COR_CLIENTE.AsString;
    if cdsNotaFiscal_AgrTAMANHO_CLIENTE.AsString = '' then
      qNumOC.ParamByName('TAMANHO_CLIENTE').AsString := ''
    else
      qNumOC.ParamByName('TAMANHO_CLIENTE').AsString := cdsNotaFiscal_AgrTAMANHO_CLIENTE.AsString;
    if trim(cdsNotaFiscal_AgrENCERADO.AsString) = '' then
      qNumOC.ParamByName('ENCERADO').AsString := ''
    else
      qNumOC.ParamByName('ENCERADO').AsString := cdsNotaFiscal_AgrENCERADO.AsString;
    qNumOC.Open;
    vFlag    := False;
    while not vFlag do
    begin
      mEtiqueta_Nav.Insert;
      mEtiqueta_NavNum_Nota.AsInteger        := qNotaFiscalNUMNOTA.AsInteger;
      mEtiqueta_NavID_Nota.AsInteger         := qNotaFiscalID.AsInteger;
      mEtiqueta_NavItem_Nota.AsInteger       := qNumOCITEM.AsInteger;
      mEtiqueta_NavFilial.AsInteger          := qNotaFiscalFILIAL.AsInteger;
      mEtiqueta_NavID_Cliente.AsInteger      := qNotaFiscalID_CLIENTE.AsInteger;
      mEtiqueta_NavID_Produto.AsInteger      := cdsNotaFiscal_AgrID_PRODUTO.AsInteger;
      mEtiqueta_NavID_Cor.AsInteger          := cdsNotaFiscal_AgrID_COR.AsInteger;
      if cdsNotaFiscal_AgrID_COR.IsNull then
        mEtiqueta_NavID_Cor.AsInteger := 0;
      mEtiqueta_NavNome_Cor.AsString         := cdsNotaFiscal_AgrNOME_COR.AsString;
      mEtiqueta_NavReferencia.AsString       := cdsNotaFiscal_AgrREFERENCIA.AsString;
      mEtiqueta_NavNome_Produto.AsString     := cdsNotaFiscal_AgrNOME_PRODUTO.AsString;
      mEtiqueta_NavCod_Cor_Cliente.AsString  := cdsNotaFiscal_AgrCOD_COR_CLIENTE.AsString;
      vProd_Cliente := '';
      if (trim(cdsNotaFiscal_AgrCOD_COR_CLIENTE.AsString) = '') then
      begin
        prc_Busca_Produto_Cliente(cdsNotaFiscal_AgrID_PRODUTO.AsInteger,cdsNotaFiscal_AgrID_COR.AsInteger);
        mEtiqueta_NavCod_Cor_Cliente.AsString := vCod_Cor_Cli;
      end;
      
      //mEtiqueta_NavNome_Cor_Cliente.AsString := cdsNotaFiscal_Agrn ItensNOME_COR_CLIENTE.AsString;
      mEtiqueta_NavCNPJ_Filial.AsString      := SQLLocate('FILIAL','ID','CNPJ_CPF',qNotaFiscalFILIAL.AsString);
      if (qNotaFiscalIMP_COR_CLIENTE.AsString = 'S') and (cdsNotaFiscal_AgrID_COR.AsInteger > 0) and
         (cdsNotaFiscal_AgrCOD_COR_CLIENTE.AsString <> '') then
      begin
        if (trim(cdsNotaFiscal_AgrTAMANHO_CLIENTE.AsString) <> '') and (trim(cdsNotaFiscal_AgrTAMANHO_CLIENTE.AsString) <> '0') then
          mEtiqueta_NavNome_Produto.AsString := mEtiqueta_NavNome_Produto.AsString + ' TAM. ' + cdsNotaFiscal_AgrTAMANHO_CLIENTE.AsString;
      end
      else
      if cdsNotaFiscal_AgrID_COR.AsInteger > 0 then
        mEtiqueta_NavNome_Produto.AsString := mEtiqueta_NavNome_Produto.AsString + ' ' + cdsNotaFiscal_AgrNOME_COR.AsString;
      mEtiqueta_NavTamanho.AsString      := cdsNotaFiscal_AgrTAMANHO.AsString;
      //mEtiqueta_NavNumOS.AsString        := cdsNotaFiscal_ItensNUMERO_OS.AsString;
      mEtiqueta_NavUnidade.AsString      := cdsNotaFiscal_AgrUNIDADE.AsString;
      //mEtiqueta_NavEncerado.AsString     := '';
      if trim(cdsNotaFiscal_AgrCOD_PRODUTO_CLIENTE.AsString) <> '' then
        mEtiqueta_NavProd_Cliente.AsString := cdsNotaFiscal_AgrCOD_PRODUTO_CLIENTE.AsString
      else
      begin
        mEtiqueta_NavProd_Cliente.AsString := fnc_Busca_CodProduto_Cliente(cdsNotaFiscal_AgrID_PRODUTO.AsInteger,
                                                                           qNotaFiscalID_CLIENTE.AsInteger,
                                                                           cdsNotaFiscal_AgrID_COR.AsInteger,'',
                                                                           cdsNotaFiscal_AgrTAMANHO_CLIENTE.AsString);
      end;
      if (trim(mEtiqueta_NavProd_Cliente.AsString) = '') then
        mEtiqueta_NavProd_Cliente.AsString := vProd_Cliente;

      mEtiqueta_NavDtEmissao.AsDateTime    := qNotaFiscalDTEMISSAO.AsDateTime;
      mEtiqueta_NavNome_Empresa.AsString   := qNotaFiscalNOME_INTERNO.AsString;
      mEtiqueta_NavNome_Cliente.AsString   := qNotaFiscalNOME_CLIENTE.AsString;
      mEtiqueta_NavFantasia_Cli.AsString   := qNotaFiscalFANTASIA.AsString;
      mEtiqueta_NavPedido_Cliente.AsString := qNumOCNUMERO_OC.AsString;
      if vQtdRest > qtd then
        mEtiqueta_NavQtd.AsFloat := StrToFloat(FormatFloat('0.0000',Qtd))
      else
        mEtiqueta_NavQtd.AsFloat := StrToFloat(FormatFloat('0.0000',vQtdRest));
      vQtdRest := StrToFloat(FormatFloat('0.0000',vQtdRest - mEtiqueta_NavQtd.AsFloat));
      if StrToFloat(FormatFloat('0.0000',vQtdRest)) <= 0 then
        vFlag := True;
      mEtiqueta_Nav.Post;
    end;
    cdsNotaFiscal_Agr.Next;
  end;

end;

end.
