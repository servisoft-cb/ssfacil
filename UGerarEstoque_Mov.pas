unit UGerarEstoque_Mov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, NxCollection, ToolEdit,
  FMTBcd, UDMCadNotaFiscal, UDMCadNotaServico, SqlExpr, DB, NxPageControl, RzStatus, StdCtrls, RzLabel, Mask, DBClient, Provider,
  UDMCadRecibo, UDMEstoque;

type
  TfrmGerarEstoque_Mov = class(TForm)
    btnNotaFiscal: TNxButton;
    RzProgressStatus1: TRzProgressStatus;
    RzLabel1: TRzLabel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    btnCupom: TNxButton;
    sdsCupomFiscal: TSQLDataSet;
    dspCupomFiscal: TDataSetProvider;
    cdsCupomFiscal: TClientDataSet;
    qFilial: TSQLQuery;
    qFilialID: TIntegerField;
    qFilialNOME: TStringField;
    qFilialNOME_INTERNO: TStringField;
    qFilialENDERECO: TStringField;
    qFilialCOMPLEMENTO_END: TStringField;
    qFilialNUM_END: TStringField;
    qFilialBAIRRO: TStringField;
    qFilialCEP: TStringField;
    qFilialID_CIDADE: TIntegerField;
    qFilialCIDADE: TStringField;
    qFilialUF: TStringField;
    qFilialDDD1: TIntegerField;
    qFilialFONE1: TStringField;
    qFilialDDD2: TIntegerField;
    qFilialFONE: TStringField;
    qFilialDDDFAX: TIntegerField;
    qFilialFAX: TStringField;
    qFilialPESSOA: TStringField;
    qFilialCNPJ_CPF: TStringField;
    qFilialINSCR_EST: TStringField;
    qFilialSIMPLES: TStringField;
    qFilialENDLOGO: TStringField;
    qFilialCALCULAR_IPI: TStringField;
    qFilialINATIVO: TStringField;
    qFilialINSCMUNICIPAL: TStringField;
    qFilialCNAE: TStringField;
    qFilialHOMEPAGE: TStringField;
    qFilialID_REGIME_TRIB: TIntegerField;
    qFilialID_PIS: TIntegerField;
    qFilialID_COFINS: TIntegerField;
    qFilialTIPO_PIS: TStringField;
    qFilialTIPO_COFINS: TStringField;
    qFilialPERC_PIS: TFloatField;
    qFilialPERC_COFINS: TFloatField;
    qFilialID_CSTICMS: TIntegerField;
    qFilialID_CSTIPI: TIntegerField;
    qFilialEMAIL_NFE: TStringField;
    qFilialDTESTOQUE: TDateField;
    qFilialPRINCIPAL: TStringField;
    qFilialLIBERADO_ATE: TStringField;
    qFilialULTIMO_ACESSO: TStringField;
    qFilialUSARICMSSIMPLES: TStringField;
    qFilialSERIENORMAL: TStringField;
    qFilialID_REGIME_TRIB_NFSE: TIntegerField;
    qFilialINCENTIVO_CULTURAL: TStringField;
    qFilialSERIE_NFSE: TStringField;
    qFilialID_NATUREZA: TIntegerField;
    qFilialID_SERVICO_SINT: TIntegerField;
    qFilialID_SERVICO_PAD: TIntegerField;
    qFilialPERC_IR: TFloatField;
    qFilialVLR_IR_MINIMO: TFloatField;
    qFilialPERC_ISS: TFloatField;
    qFilialCOD_TRIBUTACAO_MUNICIPIO: TStringField;
    qFilialNUMLOTE: TIntegerField;
    qFilialENDLOGO_NFSE: TStringField;
    qFilialPERC_CSLL: TFloatField;
    qFilialCNAE_NFSE: TStringField;
    qFilialPERC_INSS: TFloatField;
    qFilialID_ATIVIDADE_CID: TIntegerField;
    qFilialNFSE_HOMOLOGACAO: TStringField;
    qFilialPERC_CSRF: TFloatField;
    qFilialVLR_FATURAMENTO_MES_CSRF: TFloatField;
    qFilialPERC_TRIB_SERV: TFloatField;
    qFilialPERC_TRIB_NTS_IND: TFloatField;
    qFilialPERC_TRIB_NTS_VEN: TFloatField;
    qFilialPERC_TRIB_NTS_IND_EXP: TFloatField;
    qFilialPERC_TRIB_NTS_VEN_EXP: TFloatField;
    qFilialPERC_LISTA_CAMEX: TFloatField;
    qFilialIMPRESSAO_MATRICIAL: TStringField;
    qFilialID_CONTABILISTA: TIntegerField;
    qFilialINSCR_SUFRAMA: TStringField;
    qFilialSPED_PERFIL: TStringField;
    qFilialSPED_ATIVIDADE: TStringField;
    qFilialEMAIL: TStringField;
    qFilialLICENCA_FEPAM: TStringField;
    qProduto: TSQLQuery;
    qProdutoID: TIntegerField;
    qProdutoTIPO_REG: TStringField;
    qProdutoNOME: TStringField;
    qProdutoREFERENCIA: TStringField;
    qParametros: TSQLQuery;
    qParametrosUSA_CUPOM_FISCAL: TStringField;
    btnDocEstoque: TNxButton;
    sdsNota: TSQLDataSet;
    dspNota: TDataSetProvider;
    cdsNota: TClientDataSet;
    dsNota: TDataSource;
    cdsNotaID: TIntegerField;
    cdsNotaTIPO_REG: TStringField;
    cdsNotaFILIAL: TIntegerField;
    cdsNotaSERIE: TStringField;
    cdsNotaNUMNOTA: TIntegerField;
    cdsNotaDTEMISSAO: TDateField;
    cdsNotaID_CFOP: TIntegerField;
    cdsNotaID_CLIENTE: TIntegerField;
    cdsNotaID_CONDPGTO: TIntegerField;
    cdsNotaID_VENDEDOR: TIntegerField;
    cdsNotaBASE_ICMS: TFloatField;
    cdsNotaVLR_ICMS: TFloatField;
    cdsNotaVLR_IPI: TFloatField;
    cdsNotaVLR_NOTA: TFloatField;
    cdsNotaVLR_ITENS: TFloatField;
    cdsNotaVLR_DUPLICATA: TFloatField;
    cdsNotaVLR_ENTRADA: TFloatField;
    cdsNotaPERC_DESCONTO: TFloatField;
    cdsNotaVLR_DESCONTO: TFloatField;
    cdsNotaVLR_FRETE: TFloatField;
    cdsNotaVLR_SEGURO: TFloatField;
    cdsNotaVLR_OUTRASDESP: TFloatField;
    cdsNotaBASE_ICMSTRANSF: TFloatField;
    cdsNotaPERC_TRANSF: TFloatField;
    cdsNotaVLR_TRANSF: TFloatField;
    cdsNotaVLR_PIS: TFloatField;
    cdsNotaVLR_COFINS: TFloatField;
    cdsNotaVLR_TAXACISCOMEX: TFloatField;
    cdsNotaVLR_OUTROS: TFloatField;
    cdsNotaBASE_ICMSSIMPLES: TFloatField;
    cdsNotaVLR_ICMSSIMPLES: TFloatField;
    cdsNotaPERC_ICMSSIMPLES: TFloatField;
    cdsNotaVLR_IMPORTACAO: TFloatField;
    cdsNotaBASE_ICMSSUBST: TFloatField;
    cdsNotaVLR_ICMSSUBST: TFloatField;
    cdsNotaBASE_ICMSOUTROS: TFloatField;
    cdsNotaVLR_ICMSOUTROS: TFloatField;
    cdsNotaVLR_DUPLICATAOUTROS: TFloatField;
    cdsNotaVLR_ADUANEIRA: TFloatField;
    cdsNotaPERC_ICMS_PISCOFINS: TFloatField;
    cdsNotaPERC_ICMS_OUTROSVALORES: TFloatField;
    cdsNotaPERC_ICMS_FRETE: TFloatField;
    cdsNotaPERC_DESCONTOORIG: TFloatField;
    cdsNotaQTDVOLUME: TIntegerField;
    cdsNotaESPECIE: TStringField;
    cdsNotaMARCA: TStringField;
    cdsNotaNUMEROVOLUME: TStringField;
    cdsNotaPESOBRUTO: TFloatField;
    cdsNotaPESOLIQUIDO: TFloatField;
    cdsNotaPLACA: TStringField;
    cdsNotaUFPLACA: TStringField;
    cdsNotaTIPO_FRETE: TStringField;
    cdsNotaID_TRANSPORTADORA: TIntegerField;
    cdsNotaID_REDESPACHO: TIntegerField;
    cdsNotaTIPO_NOTA: TStringField;
    cdsNotaCANCELADA: TStringField;
    cdsNotaMOTIVO_CANCELADA: TStringField;
    cdsNotaDTSAIDAENTRADA: TDateField;
    cdsNotaHRSAIDAENTRADA: TTimeField;
    cdsNotaID_BANCO: TIntegerField;
    cdsNotaLOCALENTREGA: TStringField;
    cdsNotaID_EXTCOMISSAO: TIntegerField;
    cdsNotaDESCRICAO_DESC: TStringField;
    cdsNotaID_CLIENTETRIANG: TIntegerField;
    cdsNotaQTDTOTAL_ITENS: TIntegerField;
    cdsNotaNFERECIBO: TStringField;
    cdsNotaNFEPROTOCOLO: TStringField;
    cdsNotaNFECHAVEACESSO: TStringField;
    cdsNotaNFEPROTOCOLO_CANCELADA: TStringField;
    cdsNotaTIPO_ENVIONFE: TStringField;
    cdsNotaNFECODBARRA_CONTINGENCIA: TStringField;
    cdsNotaNFEVERSAO: TStringField;
    cdsNotaNFEFINALIDADE: TStringField;
    cdsNotaNFEAMBIENTE: TStringField;
    cdsNotaNUMNOTACOPIADA: TIntegerField;
    cdsNotaSERIECOPIADA: TStringField;
    cdsNotaDTCONTINGENCIA: TDateField;
    cdsNotaHRCONTINGENCIA: TTimeField;
    cdsNotaMOTIVO_CONTINGENCIA: TStringField;
    cdsNotaNFEVERSAOEMISSAO: TStringField;
    cdsNotaID_REGIMETRIB: TIntegerField;
    cdsNotaRNTC: TStringField;
    cdsNotaVAGAOBALSA_IDENTIF: TStringField;
    cdsNotaVAGAOBALSA_TIPOIDENTIF: TStringField;
    cdsNotaUFEMBEXPORTACAO: TStringField;
    cdsNotaLOCALEMBEXPORTACAO: TStringField;
    cdsNotaPISCOFINS_SOMAROUTRASDESP: TStringField;
    cdsNotaTIPO_DESCONTO: TStringField;
    cdsNotaGERARDUPL_OUTROSVALORES: TStringField;
    cdsNotaGERARDUPL_FRETE: TStringField;
    cdsNotaGERARDUPL_SEGURO: TStringField;
    cdsNotaINFORMADO_NUMNOTAMANUAL: TStringField;
    cdsNotaNFEDENEGADA: TStringField;
    cdsNotaMOTIVO_DENEGADA: TStringField;
    cdsNotaDADOS_ADICIONAIS: TMemoField;
    cdsNotaDTINICIO_DUPLICATA: TDateField;
    cdsNotaTIPO_PRAZO: TStringField;
    cdsNotaPERC_COMISSAO: TFloatField;
    cdsNotaSIMPLES_FILIAL: TStringField;
    cdsNotaID_OPERACAO_NOTA: TIntegerField;
    cdsNotaFINALIDADE: TStringField;
    cdsNotaID_VARIACAO: TIntegerField;
    cdsNotaSTATUS_MANIFESTO: TStringField;
    cdsNotaID_CONTA: TIntegerField;
    cdsNotaID_TIPO_COBRANCA: TIntegerField;
    cdsNotaCALCULAR_IMP_ITEM: TStringField;
    cdsNotaGRAVOU_DADOSADICIONAIS: TStringField;
    cdsNotaVLR_TRIBUTOS: TFloatField;
    cdsNotaUSA_TRANSFICMS: TStringField;
    cdsNotaID_NOTACOPIADA: TIntegerField;
    cdsNotaID_CONTA_ORCAMENTO: TIntegerField;
    cdsNotaNOTA_ESTORNO: TStringField;
    cdsNotaCOD_MODELO: TStringField;
    cdsNotaCOD_CONS_EE: TStringField;
    cdsNotaCOD_CONS_AGUA: TStringField;
    cdsNotaVLR_ICMSSUBST_PROPRIO: TFloatField;
    cdsNotaBASE_ICMSSUBST_PROPRIO: TFloatField;
    cdsNotaHREMISSAO: TTimeField;
    cdsNotaTIPO_DESTINO_OPERACAO: TSmallintField;
    cdsNotaTIPO_CONSUMIDOR: TSmallintField;
    cdsNotaTIPO_ATENDIMENTO: TSmallintField;
    cdsNotaLOCALDESPEXPORTACAO: TStringField;
    cdsNotaVLR_ICMSDESONERADO: TFloatField;
    cdsNotaVLR_TRIBUTOS_ESTADUAL: TFloatField;
    cdsNotaVLR_TRIBUTOS_MUNICIPAL: TFloatField;
    cdsNotaFONTE_TRIBUTOS: TStringField;
    cdsNotaVERSAO_TRIBUTOS: TStringField;
    cdsNotaVLR_TRIBUTOS_FEDERAL: TFloatField;
    cdsNotaPERC_COMISSAO_PAGAR_NOTA: TFloatField;
    cdsNotaNFEENVIADA: TStringField;
    cdsNotaSELECIONADO: TStringField;
    cdsNotaID_LOCAL_ESTOQUE: TIntegerField;
    cdsNotaVLR_ADIANTAMENTO: TFloatField;
    cdsNotaVLR_ICMS_FCP: TFloatField;
    cdsNotaVLR_ICMS_UF_DEST: TFloatField;
    cdsNotaVLR_ICMS_UF_REMET: TFloatField;
    cdsNotaVLR_BASE_COMISSAO: TFloatField;
    cdsNotaNOTIFICACAO: TIntegerField;
    cdsNotaVLR_PIS_COFINS_SUFRAMA: TFloatField;
    cdsNotaVLR_DESC_SUFRAMA: TFloatField;
    cdsNotaIBPT_CHAVE: TStringField;
    cdsNotaVLR_AFRMM: TFloatField;
    cdsNotaGEROU_MDFE: TStringField;
    cdsNotaQTD_TOTAL_PRODUTOS: TFloatField;
    qParametrosATUALIZAR_PRECO_DOC: TStringField;
    btnInventario: TNxButton;
    cdsCupomFiscalID: TIntegerField;
    sdsCupomFiscal_Itens: TSQLDataSet;
    dspCupomFiscal_Itens: TDataSetProvider;
    cdsCupomFiscal_Itens: TClientDataSet;
    cdsCupomFiscal_ItensID: TIntegerField;
    cdsCupomFiscal_ItensITEM: TIntegerField;
    cdsCupomFiscal_ItensID_PRODUTO: TIntegerField;
    cdsCupomFiscal_ItensQTD: TFloatField;
    cdsCupomFiscal_ItensPERC_ICMS: TFloatField;
    cdsCupomFiscal_ItensVLR_UNITARIO: TFloatField;
    cdsCupomFiscal_ItensPERC_DESCONTO: TFloatField;
    cdsCupomFiscal_ItensVLR_DESCONTO: TFloatField;
    cdsCupomFiscal_ItensBASE_ICMS: TFloatField;
    cdsCupomFiscal_ItensVLR_ICMS: TFloatField;
    cdsCupomFiscal_ItensVLR_TOTAL: TFloatField;
    cdsCupomFiscal_ItensID_CFOP: TIntegerField;
    cdsCupomFiscal_ItensID_MOVESTOQUE: TIntegerField;
    cdsCupomFiscal_ItensUNIDADE: TStringField;
    cdsCupomFiscal_ItensCANCELADO: TStringField;
    cdsCupomFiscal_ItensSITTRIB: TStringField;
    cdsCupomFiscal_ItensTAMANHO: TStringField;
    cdsCupomFiscal_ItensID_MOVIMENTO: TIntegerField;
    cdsCupomFiscal_ItensREFERENCIA: TStringField;
    cdsCupomFiscal_ItensPERC_TRIBUTO: TFloatField;
    cdsCupomFiscal_ItensVLR_TRIBUTO: TFloatField;
    cdsCupomFiscal_ItensID_NCM: TIntegerField;
    cdsCupomFiscal_ItensORIGEM_PROD: TStringField;
    cdsCupomFiscal_ItensPERC_TRIBUTO_ESTADUAL: TFloatField;
    cdsCupomFiscal_ItensPERC_TRIBUTO_MUNICIPAL: TFloatField;
    cdsCupomFiscal_ItensPERC_TRIBUTO_FEDERAL: TFloatField;
    cdsCupomFiscal_ItensFONTE_TRIBUTO: TStringField;
    cdsCupomFiscal_ItensVERSAO_TRIBUTO: TStringField;
    cdsCupomFiscal_ItensVLR_TRIBUTO_FEDERAL: TFloatField;
    cdsCupomFiscal_ItensVLR_TRIBUTO_ESTADUAL: TFloatField;
    cdsCupomFiscal_ItensVLR_TRIBUTO_MUNICIPAL: TFloatField;
    cdsCupomFiscal_ItensID_CSTICMS: TIntegerField;
    cdsCupomFiscal_ItensID_CSTIPI: TIntegerField;
    cdsCupomFiscal_ItensID_COFINS: TIntegerField;
    cdsCupomFiscal_ItensID_PIS: TIntegerField;
    cdsCupomFiscal_ItensPERC_TRIBICMS: TFloatField;
    cdsCupomFiscal_ItensID_VARIACAO: TIntegerField;
    cdsCupomFiscal_ItensPERC_PIS: TFloatField;
    cdsCupomFiscal_ItensPERC_COFINS: TFloatField;
    cdsCupomFiscal_ItensPERC_IPI: TFloatField;
    cdsCupomFiscal_ItensTIPO_PIS: TStringField;
    cdsCupomFiscal_ItensTIPO_COFINS: TStringField;
    cdsCupomFiscal_ItensVLR_PIS: TFloatField;
    cdsCupomFiscal_ItensVLR_COFINS: TFloatField;
    cdsCupomFiscal_ItensVLR_IPI: TFloatField;
    cdsCupomFiscal_ItensVLR_DESCONTORATEIO: TFloatField;
    cdsCupomFiscal_ItensNOME_PRODUTO: TStringField;
    cdsCupomFiscal_ItensITEM_ORIGINAL: TIntegerField;
    cdsCupomFiscal_ItensID_PEDIDO: TIntegerField;
    cdsCupomFiscal_ItensITEM_PEDIDO: TIntegerField;
    cdsCupomFiscal_ItensNUM_PEDIDO: TIntegerField;
    cdsCupomFiscal_ItensITEM_CLIENTE: TIntegerField;
    cdsCupomFiscal_ItensNUMERO_OC: TStringField;
    cdsCupomFiscal_ItensNUMERO_OS: TStringField;
    cdsCupomFiscal_ItensID_ENQIPI: TIntegerField;
    cdsCupomFiscal_ItensQTD_DEVOLVIDA: TFloatField;
    cdsCupomFiscal_ItensID_COR_COMBINACO: TIntegerField;
    cdsCupomFiscal_ItensVLR_ACRESCIMO: TFloatField;
    cdsCupomFiscal_ItensVLR_UNIT_ORIGINAL: TFloatField;
    cdsCupomFiscal_ItensBASE_ICMSSUBST_RET: TFloatField;
    cdsCupomFiscal_ItensVLR_ICMSSUBST_RET: TFloatField;
    cdsCupomFiscal_ItensVLR_BASE_EFET: TFloatField;
    cdsCupomFiscal_ItensVLR_ICMS_EFE: TFloatField;
    cdsCupomFiscal_ItensPERC_ST: TFloatField;
    cdsCupomFiscal_ItensPERC_ICMS_EFET: TFloatField;
    cdsCupomFiscal_ItensPERC_BASE_RED_EFET: TFloatField;
    cdsCupomFiscal_ItensVLR_JUROS: TFloatField;
    cdsCupomFiscal_ItensVLR_ICMS_SUBSTITUTO: TFloatField;
    cdsCupomFiscal_ItensCOD_CBENEF: TStringField;
    cdsCupomFiscal_ItensQTD_TROCA: TFloatField;
    cdsCupomFiscal_ItensOBSERVACAO: TStringField;
    cdsCupomFiscal_ItensID_COMANDA: TIntegerField;
    cdsCupomFiscal_ItensITEM_COMANDA: TIntegerField;
    cdsCupomFiscal_ItensSTATUS: TStringField;
    cdsCupomFiscal_ItensDATA_HORA_PEDIDO: TSQLTimeStampField;
    cdsCupomFiscal_ItensITEM_PRINCIPAL: TIntegerField;
    cdsCupomFiscal_ItensVALOR_RATEIO_RECIBO: TFloatField;
    cdsCupomFiscal_ItensVALOR_RATEIO_TROCA: TFloatField;
    cdsCupomFiscal_ItensVALOR_RATEIO_RECIBO_TROCA: TFloatField;
    sdsCupomFiscal_ItensID: TIntegerField;
    sdsCupomFiscal_ItensITEM: TIntegerField;
    sdsCupomFiscal_ItensID_PRODUTO: TIntegerField;
    sdsCupomFiscal_ItensQTD: TFloatField;
    sdsCupomFiscal_ItensPERC_ICMS: TFloatField;
    sdsCupomFiscal_ItensVLR_UNITARIO: TFloatField;
    sdsCupomFiscal_ItensPERC_DESCONTO: TFloatField;
    sdsCupomFiscal_ItensVLR_DESCONTO: TFloatField;
    sdsCupomFiscal_ItensBASE_ICMS: TFloatField;
    sdsCupomFiscal_ItensVLR_ICMS: TFloatField;
    sdsCupomFiscal_ItensVLR_TOTAL: TFloatField;
    sdsCupomFiscal_ItensID_CFOP: TIntegerField;
    sdsCupomFiscal_ItensID_MOVESTOQUE: TIntegerField;
    sdsCupomFiscal_ItensUNIDADE: TStringField;
    sdsCupomFiscal_ItensCANCELADO: TStringField;
    sdsCupomFiscal_ItensSITTRIB: TStringField;
    sdsCupomFiscal_ItensTAMANHO: TStringField;
    sdsCupomFiscal_ItensID_MOVIMENTO: TIntegerField;
    sdsCupomFiscal_ItensREFERENCIA: TStringField;
    sdsCupomFiscal_ItensPERC_TRIBUTO: TFloatField;
    sdsCupomFiscal_ItensVLR_TRIBUTO: TFloatField;
    sdsCupomFiscal_ItensID_NCM: TIntegerField;
    sdsCupomFiscal_ItensORIGEM_PROD: TStringField;
    sdsCupomFiscal_ItensPERC_TRIBUTO_ESTADUAL: TFloatField;
    sdsCupomFiscal_ItensPERC_TRIBUTO_MUNICIPAL: TFloatField;
    sdsCupomFiscal_ItensPERC_TRIBUTO_FEDERAL: TFloatField;
    sdsCupomFiscal_ItensFONTE_TRIBUTO: TStringField;
    sdsCupomFiscal_ItensVERSAO_TRIBUTO: TStringField;
    sdsCupomFiscal_ItensVLR_TRIBUTO_FEDERAL: TFloatField;
    sdsCupomFiscal_ItensVLR_TRIBUTO_ESTADUAL: TFloatField;
    sdsCupomFiscal_ItensVLR_TRIBUTO_MUNICIPAL: TFloatField;
    sdsCupomFiscal_ItensID_CSTICMS: TIntegerField;
    sdsCupomFiscal_ItensID_CSTIPI: TIntegerField;
    sdsCupomFiscal_ItensID_COFINS: TIntegerField;
    sdsCupomFiscal_ItensID_PIS: TIntegerField;
    sdsCupomFiscal_ItensPERC_TRIBICMS: TFloatField;
    sdsCupomFiscal_ItensID_VARIACAO: TIntegerField;
    sdsCupomFiscal_ItensPERC_PIS: TFloatField;
    sdsCupomFiscal_ItensPERC_COFINS: TFloatField;
    sdsCupomFiscal_ItensPERC_IPI: TFloatField;
    sdsCupomFiscal_ItensTIPO_PIS: TStringField;
    sdsCupomFiscal_ItensTIPO_COFINS: TStringField;
    sdsCupomFiscal_ItensVLR_PIS: TFloatField;
    sdsCupomFiscal_ItensVLR_COFINS: TFloatField;
    sdsCupomFiscal_ItensVLR_IPI: TFloatField;
    sdsCupomFiscal_ItensVLR_DESCONTORATEIO: TFloatField;
    sdsCupomFiscal_ItensNOME_PRODUTO: TStringField;
    sdsCupomFiscal_ItensITEM_ORIGINAL: TIntegerField;
    sdsCupomFiscal_ItensID_PEDIDO: TIntegerField;
    sdsCupomFiscal_ItensITEM_PEDIDO: TIntegerField;
    sdsCupomFiscal_ItensNUM_PEDIDO: TIntegerField;
    sdsCupomFiscal_ItensITEM_CLIENTE: TIntegerField;
    sdsCupomFiscal_ItensNUMERO_OC: TStringField;
    sdsCupomFiscal_ItensNUMERO_OS: TStringField;
    sdsCupomFiscal_ItensID_ENQIPI: TIntegerField;
    sdsCupomFiscal_ItensQTD_DEVOLVIDA: TFloatField;
    sdsCupomFiscal_ItensID_COR_COMBINACO: TIntegerField;
    sdsCupomFiscal_ItensVLR_ACRESCIMO: TFloatField;
    sdsCupomFiscal_ItensVLR_UNIT_ORIGINAL: TFloatField;
    sdsCupomFiscal_ItensBASE_ICMSSUBST_RET: TFloatField;
    sdsCupomFiscal_ItensVLR_ICMSSUBST_RET: TFloatField;
    sdsCupomFiscal_ItensVLR_BASE_EFET: TFloatField;
    sdsCupomFiscal_ItensVLR_ICMS_EFE: TFloatField;
    sdsCupomFiscal_ItensPERC_ST: TFloatField;
    sdsCupomFiscal_ItensPERC_ICMS_EFET: TFloatField;
    sdsCupomFiscal_ItensPERC_BASE_RED_EFET: TFloatField;
    sdsCupomFiscal_ItensVLR_JUROS: TFloatField;
    sdsCupomFiscal_ItensVLR_ICMS_SUBSTITUTO: TFloatField;
    sdsCupomFiscal_ItensCOD_CBENEF: TStringField;
    sdsCupomFiscal_ItensQTD_TROCA: TFloatField;
    sdsCupomFiscal_ItensOBSERVACAO: TStringField;
    sdsCupomFiscal_ItensID_COMANDA: TIntegerField;
    sdsCupomFiscal_ItensITEM_COMANDA: TIntegerField;
    sdsCupomFiscal_ItensSTATUS: TStringField;
    sdsCupomFiscal_ItensDATA_HORA_PEDIDO: TSQLTimeStampField;
    sdsCupomFiscal_ItensITEM_PRINCIPAL: TIntegerField;
    sdsCupomFiscal_ItensVALOR_RATEIO_RECIBO: TFloatField;
    sdsCupomFiscal_ItensVALOR_RATEIO_TROCA: TFloatField;
    sdsCupomFiscal_ItensVALOR_RATEIO_RECIBO_TROCA: TFloatField;
    cdsCupomFiscalFILIAL: TIntegerField;
    cdsCupomFiscalDTEMISSAO: TDateField;
    cdsCupomFiscalID_CLIENTE: TIntegerField;
    cdsCupomFiscalNUMCUPOM: TIntegerField;
    cdsCupomFiscalID_LOCALESTOQUE: TIntegerField;
    cdsCupomFiscalSERIE: TStringField;
    dspDocEstoque: TDataSetProvider;
    cdsDocEstoque: TClientDataSet;
    sdsDocEstoque_Itens: TSQLDataSet;
    dspDocEstoque_Itens: TDataSetProvider;
    cdsDocEstoque_Itens: TClientDataSet;
    sdsDocEstoque: TSQLDataSet;
    cdsDocEstoqueID: TIntegerField;
    cdsDocEstoqueDTMOVIMENTO: TDateField;
    cdsDocEstoqueFILIAL: TIntegerField;
    cdsDocEstoqueVLR_TOTAL: TFloatField;
    cdsDocEstoqueTIPO_ES: TStringField;
    cdsDocEstoqueID_PESSOA: TIntegerField;
    cdsDocEstoqueOBS: TMemoField;
    cdsDocEstoqueID_FUNCIONARIO: TIntegerField;
    cdsDocEstoqueTIPO_REG: TStringField;
    cdsDocEstoqueID_LOCAL_ESTOQUE: TIntegerField;
    cdsDocEstoqueID_LOCAL_DESTINO: TIntegerField;
    cdsDocEstoqueINF_CODBARRA: TStringField;
    cdsDocEstoqueNUM_REQUISICAO: TIntegerField;
    cdsDocEstoqueID_FUNCIONARIO_ENTR: TIntegerField;
    cdsDocEstoqueNUM_LOTE: TIntegerField;
    cdsDocEstoqueNUM_PEDIDO: TIntegerField;
    cdsDocEstoqueCOD_ANT: TIntegerField;
    cdsDocEstoqueFILIAL_DESTINO: TIntegerField;
    cdsDocEstoqueUSUARIO: TStringField;
    cdsDocEstoqueDTUSUARIO: TDateField;
    cdsDocEstoqueHRUSUARIO: TTimeField;
    sdsDocEstoque_ItensID: TIntegerField;
    sdsDocEstoque_ItensITEM: TIntegerField;
    sdsDocEstoque_ItensID_PRODUTO: TIntegerField;
    sdsDocEstoque_ItensQTD: TFloatField;
    sdsDocEstoque_ItensVLR_UNITARIO: TFloatField;
    sdsDocEstoque_ItensVLR_TOTAL: TFloatField;
    sdsDocEstoque_ItensPERC_IPI: TFloatField;
    sdsDocEstoque_ItensID_MOVESTOQUE: TIntegerField;
    sdsDocEstoque_ItensMOTIVO: TStringField;
    sdsDocEstoque_ItensUNIDADE: TStringField;
    sdsDocEstoque_ItensID_CENTROCUSTO: TIntegerField;
    sdsDocEstoque_ItensTAMANHO: TStringField;
    sdsDocEstoque_ItensID_COR: TFMTBCDField;
    sdsDocEstoque_ItensID_MOVESTOQUE_DESTINO: TIntegerField;
    sdsDocEstoque_ItensNUM_LOTE_CONTROLE: TStringField;
    sdsDocEstoque_ItensGERAR_CUSTO: TStringField;
    sdsDocEstoque_ItensPRECO_CUSTO_TOTAL: TFloatField;
    sdsDocEstoque_ItensLOCALIZACAO: TStringField;
    sdsDocEstoque_ItensLARGURA: TFloatField;
    sdsDocEstoque_ItensCOMPRIMENTO: TFloatField;
    sdsDocEstoque_ItensESPESSURA: TFloatField;
    sdsDocEstoque_ItensTIPO_ES: TStringField;
    cdsDocEstoque_ItensID: TIntegerField;
    cdsDocEstoque_ItensITEM: TIntegerField;
    cdsDocEstoque_ItensID_PRODUTO: TIntegerField;
    cdsDocEstoque_ItensQTD: TFloatField;
    cdsDocEstoque_ItensVLR_UNITARIO: TFloatField;
    cdsDocEstoque_ItensVLR_TOTAL: TFloatField;
    cdsDocEstoque_ItensPERC_IPI: TFloatField;
    cdsDocEstoque_ItensID_MOVESTOQUE: TIntegerField;
    cdsDocEstoque_ItensMOTIVO: TStringField;
    cdsDocEstoque_ItensUNIDADE: TStringField;
    cdsDocEstoque_ItensID_CENTROCUSTO: TIntegerField;
    cdsDocEstoque_ItensTAMANHO: TStringField;
    cdsDocEstoque_ItensID_COR: TFMTBCDField;
    cdsDocEstoque_ItensID_MOVESTOQUE_DESTINO: TIntegerField;
    cdsDocEstoque_ItensNUM_LOTE_CONTROLE: TStringField;
    cdsDocEstoque_ItensGERAR_CUSTO: TStringField;
    cdsDocEstoque_ItensPRECO_CUSTO_TOTAL: TFloatField;
    cdsDocEstoque_ItensLOCALIZACAO: TStringField;
    cdsDocEstoque_ItensLARGURA: TFloatField;
    cdsDocEstoque_ItensCOMPRIMENTO: TFloatField;
    cdsDocEstoque_ItensESPESSURA: TFloatField;
    cdsDocEstoque_ItensTIPO_ES: TStringField;
    qParametrosUSA_LOCAL_ESTOQUE: TStringField;
    sdsInventario: TSQLDataSet;
    dspInventario: TDataSetProvider;
    cdsInventario: TClientDataSet;
    sdsInventario_Itens: TSQLDataSet;
    dspInventario_Itens: TDataSetProvider;
    cdsInventario_Itens: TClientDataSet;
    cdsInventarioID: TIntegerField;
    cdsInventarioDATA: TDateField;
    cdsInventarioGERADO_ESTOQUE: TStringField;
    cdsInventarioNUM_INVENTARIO: TIntegerField;
    cdsInventarioDTUSUARIO: TDateField;
    cdsInventarioHRUSUARIO: TTimeField;
    cdsInventarioFILIAL: TIntegerField;
    cdsInventarioTIPO_REG: TStringField;
    cdsInventarioID_LOCAL_ESTOQUE: TIntegerField;
    sdsInventario_ItensID: TIntegerField;
    sdsInventario_ItensITEM: TIntegerField;
    sdsInventario_ItensID_PRODUTO: TIntegerField;
    sdsInventario_ItensTAMANHO: TStringField;
    sdsInventario_ItensQTD_ESTOQUE: TFloatField;
    sdsInventario_ItensQTD_INVENTARIO: TFloatField;
    sdsInventario_ItensQTD_AJUSTE: TFloatField;
    sdsInventario_ItensTIPO_AJUSTE: TStringField;
    sdsInventario_ItensVLR_UNITARIO: TFloatField;
    sdsInventario_ItensPERC_IPI: TFloatField;
    sdsInventario_ItensPERC_ICMS: TFloatField;
    sdsInventario_ItensID_MOVESTOQUE: TIntegerField;
    sdsInventario_ItensID_COR: TFMTBCDField;
    sdsInventario_ItensNUM_LOTE_CONTROLE: TStringField;
    cdsInventario_ItensID: TIntegerField;
    cdsInventario_ItensITEM: TIntegerField;
    cdsInventario_ItensID_PRODUTO: TIntegerField;
    cdsInventario_ItensTAMANHO: TStringField;
    cdsInventario_ItensQTD_ESTOQUE: TFloatField;
    cdsInventario_ItensQTD_INVENTARIO: TFloatField;
    cdsInventario_ItensQTD_AJUSTE: TFloatField;
    cdsInventario_ItensTIPO_AJUSTE: TStringField;
    cdsInventario_ItensVLR_UNITARIO: TFloatField;
    cdsInventario_ItensPERC_IPI: TFloatField;
    cdsInventario_ItensPERC_ICMS: TFloatField;
    cdsInventario_ItensID_MOVESTOQUE: TIntegerField;
    cdsInventario_ItensID_COR: TFMTBCDField;
    cdsInventario_ItensNUM_LOTE_CONTROLE: TStringField;
    qProdutoUNIDADE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnNotaFiscalClick(Sender: TObject);
    procedure btnCupomClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dspMovGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure btnDocEstoqueClick(Sender: TObject);
    procedure btnInventarioClick(Sender: TObject);
    procedure dspDocEstoque_ItensGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspInventario_ItensGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
  private
    { Private declarations }
    fDMCadNotaServico: TDMCadNotaServico;
    fDMCadNotaFiscal: TDMCadNotaFiscal;
    fDMCadRecibo: TDMCadRecibo;
    fDMEstoque: TDMEstoque;
    ctCupomFiscal: String;
    ctNota: String;
    ctDocEstoque: String;
    ctInventario: String;

    procedure prc_Le_NotaFiscal_Ref;
    function fnc_Gravar_Estoque(ID_Local_Estoque, ID_Mov_Estoque: Integer ; Tipo_ES: String ; Filial : Integer): Integer;

  public
    { Public declarations }
  end;

var
  frmGerarEstoque_Mov: TfrmGerarEstoque_Mov;

const
  cTerminal: Integer = 1;


implementation

uses DmdDatabase, UDMCadPessoa, DateUtils;

{$R *.dfm}

procedure TfrmGerarEstoque_Mov.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMEstoque);
  FreeAndNil(fDMCadNotaServico);
  FreeAndNil(fDMCadNotaFiscal);
  FreeAndNil(fDMCadRecibo);
  Action := Cafree;
end;

procedure TfrmGerarEstoque_Mov.FormShow(Sender: TObject);
begin
  ctCupomFiscal     := sdsCupomFiscal.CommandText;
  ctDocEstoque      := sdsDocEstoque.CommandText;
  ctInventario      := sdsInventario.CommandText;
  fDMCadNotaServico := TDMCadNotaServico.Create(Self);
  fDMCadNotaFiscal  := TDMCadNotaFiscal.Create(Self);
  fDMEstoque        := TDMEstoque.Create(Self);
  fDMCadRecibo      := TDMCadRecibo.Create(Self);
  qParametros.Close;
  qParametros.Open;
end;

procedure TfrmGerarEstoque_Mov.btnNotaFiscalClick(Sender: TObject);
var
  sds: TSQLDataSet;
  vGeraCusto : String;
  vID_Estoque : Integer;
begin
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** Data não informada!', mtError, [mbOk], 0);
    exit;
  end;

  if MessageDlg('Deseja carregar as notas de entrada e saída para o Estoque_Mov?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  RzLabel1.Caption := 'Aguarde, excluindo Estoque_Mov...';
  RzLabel1.Refresh;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'DELETE FROM ESTOQUE_MOV WHERE ((TIPO_MOV = ' + QuotedStr('NTS') + ') OR (TIPO_MOV = ' + QuotedStr('NTE') + '))'
                     + ' AND DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                     + ' AND DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  sds.ExecSQL;

  FreeAndNil(sds);
  RzLabel1.Caption := 'Aguarde, incluindo notas no estoque_mov';
  RzLabel1.Refresh;

  fDMCadNotaFiscal.cdsProduto.Close;
  fDMCadNotaFiscal.cdsProduto.Open;
  fDMCadNotaFiscal.cdsFilial.Close;
  fDMCadNotaFiscal.cdsFilial.Open;

  cdsNota.Close;
  sdsNota.CommandText := ctNota + ' AND DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                                + ' AND DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  cdsNota.Open;

  RzProgressStatus1.TotalParts    := cdsNota.RecordCount;
  RzProgressStatus1.PartsComplete := 0;
  RzProgressStatus1.Percent       := 0;

  cdsNota.First;
  while not cdsNota.Eof do
  begin
    RzProgressStatus1.PartsComplete := RzProgressStatus1.PartsComplete + 1;

    fDMCadNotaFiscal.prc_Localizar(cdsNotaID.AsInteger);
    if fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger <= 0 then
    begin
      cdsNota.Next;
      Continue;
    end;

    fDMCadNotaFiscal.cdsNotaFiscal_Itens.Close;
    fDMCadNotaFiscal.cdsNotaFiscal_Itens.Open;
    if fDMCadNotaFiscal.cdsFilialID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger then
      fDMCadNotaFiscal.cdsFilial.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger,[loCaseInsensitive]);
    fDMCadNotaFiscal.cdsNotaFiscal_Itens.First;
    while not fDMCadNotaFiscal.cdsNotaFiscal_Itens.Eof do
    begin
      if fDMCadNotaFiscal.cdsCFOPID.AsInteger <> fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger then
        fDMCadNotaFiscal.cdsCFOP.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscalID_CFOP.AsInteger,[loCaseInsensitive]);
      if (fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString = 'E') and (fDMCadNotaFiscal.cdsCFOPGERAR_CUSTO_MEDIO.AsString = 'S') then
        vGeraCusto := 'S';

      vID_Estoque := fDMEstoque.fnc_Gravar_Estoque(0,
                                                   fDMCadNotaFiscal.cdsNotaFiscalFILIAL.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscalID_LOCAL_ESTOQUE.AsInteger, //aqui verificar o local do estoque
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscalNUMNOTA.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscalID.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensCENTRO_CUSTO_ID.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscalTIPO_NOTA.AsString,'NTS',
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensUNIDADE.AsString,
                                                   fDMCadNotaFiscal.cdsNotaFiscalSERIE.AsString,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensTAMANHO.AsString,
                                                   fDMCadNotaFiscal.cdsNotaFiscalDTEMISSAO.AsDateTime,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_IPI.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DESCONTO.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_TRIBICMS.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_FRETE.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensQTD.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_UNITARIO.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_DESCONTO.AsFloat,0,'',
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensID_COR.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensNUM_LOTE_CONTROLE.AsString,
                                                   vGeraCusto,fDMCadNotaFiscal.cdsNotaFiscal_ItensPRECO_CUSTO_TOTAL.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensCOMPRIMENTO.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensLARGURA.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensESPESSURA.AsFloat,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensID_OPERACAO_NOTA.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PEDIDO.AsInteger,
                                                   fDMCadNotaFiscal.cdsNotaFiscal_ItensITEM_PEDIDO.AsInteger); 

      fDMCadNotaFiscal.cdsNotaFiscal_Itens.Edit;
      fDMCadNotaFiscal.cdsNotaFiscal_ItensID_MOVESTOQUE.AsInteger := vID_Estoque;
      fDMCadNotaFiscal.cdsNotaFiscal_Itens.Post;

      fDMCadNotaFiscal.cdsNotaFiscal_Itens.Next;
    end;
    fDMCadNotaFiscal.cdsNotaFiscal_Itens.ApplyUpdates(0);
    cdsNota.Next;

  end;

  RzLabel1.Caption := 'Processo de geração do estoque finalizado...';
  RzLabel1.Refresh;

  MessageDlg('*** Notas Carregadas no Estoque !', mtConfirmation, [mbOk], 0);
end;

procedure TfrmGerarEstoque_Mov.prc_Le_NotaFiscal_Ref;
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  fDMCadNotaFiscal.cdsNotaFiscal_Ref.First;
  while not fDMCadNotaFiscal.cdsNotaFiscal_Ref.Eof do
  begin
    if trim(fDMCadNotaFiscal.cdsNotaFiscal_RefNFECHAVEACESSO_REF.AsString) <> '' then
    begin
      sds.Close;
      sds.CommandText   := 'SELECT ID FROM NOTAFISCAL WHERE NFECHAVEACESSO = ' + QuotedStr(fDMCadNotaFiscal.cdsNotaFiscal_RefNFECHAVEACESSO_REF.AsString);
      sds.Open;
      if not(sds.IsEmpty) and (sds.FieldByName('ID').AsInteger > 0) then
      begin
        fDMCadNotaFiscal.Excluir_Duplicata(sds.FieldByName('ID').AsInteger);
        fDMCadNotaFiscal.Excluir_ExtComissao(sds.FieldByName('ID').AsInteger);
        fDMCadNotaFiscal.prc_Excluir_Financeiro(sds.FieldByName('ID').AsInteger);
        fDMCadNotaFiscal.prc_Cancelar_Movimento(sds.FieldByName('ID').AsInteger);
      end;
    end;
    fDMCadNotaFiscal.cdsNotaFiscal_Ref.Next;
  end;
  FreeAndNil(sds);
end;

procedure TfrmGerarEstoque_Mov.btnCupomClick(Sender: TObject);
var
  sds: TSQLDataSet;
  vCancelada: String;
  vMotivo_CD: String;
begin
  if MessageDlg('Deseja carregar os cupons para o movimento?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  RzLabel1.Caption := 'Aguarde, excluindo movimento...';
  RzLabel1.Refresh;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'DELETE FROM ESTOQUE_MOV WHERE TIPO_MOV = ' + QuotedStr('CFI')
                     + ' AND DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                     + ' AND DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  sds.ExecSQL;

  FreeAndNil(sds);

  RzLabel1.Caption := 'Aguarde, incluindo cupons no ESTOQUE_MOV';
  RzLabel1.Refresh;

  cdsCupomFiscal.Close;
  sdsCupomFiscal.CommandText := ctCupomFiscal
                              + ' AND DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                              + ' AND DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  cdsCupomFiscal.Open;

  RzProgressStatus1.TotalParts    := cdsCupomFiscal.RecordCount;
  RzProgressStatus1.PartsComplete := 0;
  RzProgressStatus1.Percent       := 0;

  cdsCupomFiscal.IndexFieldNames := 'ID';
  cdsCupomFiscal.First;
  while not cdsCupomFiscal.Eof do
  begin
    RzProgressStatus1.PartsComplete := RzProgressStatus1.PartsComplete + 1;
    if not(qFilial.Active) or (qFilialID.AsInteger <> cdsCupomFiscalFILIAL.AsInteger) then
    begin
      qFilial.Close;
      qFilial.ParamByName('ID').AsInteger := cdsCupomFiscalFILIAL.AsInteger;
      qFilial.Open;
    end;
    vMotivo_CD := '';
    cdsCupomFiscal_Itens.Close;
    sdsCupomFiscal_Itens.ParamByName('ID').AsInteger := cdsCupomFiscalID.AsInteger;
    cdsCupomFiscal_Itens.Open;
    cdsCupomFiscal_Itens.First;
    while not cdsCupomFiscal_Itens.Eof do
    begin
      qProduto.Close;
      qProduto.ParamByName('ID').AsInteger := cdsCupomFiscal_ItensID_PRODUTO.AsInteger;
      qProduto.Open;
      if qProdutoTIPO_REG.AsString <> 'N' then
      begin
        cdsCupomFiscal_Itens.Edit;
        cdsCupomFiscal_ItensID_MOVESTOQUE.AsInteger := fDMEstoque.fnc_Gravar_Estoque(0,
                                                 cdsCupomFiscalFILIAL.AsInteger,
                                                 cdsCupomFiscalID_LOCALESTOQUE.AsInteger,
                                                   cdsCupomFiscal_ItensID_PRODUTO.AsInteger,
                                                   cdsCupomFiscalNUMCUPOM.AsInteger,
                                                   cdsCupomFiscalID_CLIENTE.AsInteger,
                                                   cdsCupomFiscal_ItensID_CFOP.AsInteger,
                                                   cdsCupomFiscalID.AsInteger,0,
                                                   'S','CFI',
                                                   cdsCupomFiscal_ItensUNIDADE.AsString,
                                                   cdsCupomFiscal_ItensUNIDADE.AsString,
                                                   cdsCupomFiscalSERIE.AsString,
                                                   cdsCupomFiscal_ItensTAMANHO.AsString,
                                                   cdsCupomFiscalDTEMISSAO.AsDateTime,
                                                   cdsCupomFiscal_ItensVLR_UNITARIO.AsFloat,
                                                   cdsCupomFiscal_ItensQTD.AsFloat,
                                                   cdsCupomFiscal_ItensPERC_ICMS.AsFloat,
                                                   0,
                                                   0,
                                                   0,
                                                   0,
                                                   cdsCupomFiscal_ItensQTD.AsFloat,
                                                   cdsCupomFiscal_ItensVLR_UNITARIO.AsFloat,
                                                   0,0,'',
                                                   cdsCupomFiscal_ItensID_COR_COMBINACO.AsInteger,'','N',0,0,0,0,0,0,0);
        cdsCupomFiscal_Itens.Post;
      end;
      cdsCupomFiscal_Itens.Next;
    end;
    cdsCupomFiscal_Itens.ApplyUpdates(0);
    cdsCupomFiscal.Next;
  end;
  RzLabel1.Caption := 'Processo de inclusão de cupons finalizado...';
  RzLabel1.Refresh;

  MessageDlg('*** Cupons Carregados no Estoque_Mov!', mtConfirmation, [mbOk], 0);
end;

procedure TfrmGerarEstoque_Mov.FormCreate(Sender: TObject);
begin
  ctNota := sdsNota.CommandText;
end;

procedure TfrmGerarEstoque_Mov.dspMovGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'MOVIMENTO';

end;

procedure TfrmGerarEstoque_Mov.btnDocEstoqueClick(Sender: TObject);
var
  sds: TSQLDataSet;
  vCancelada: String;
  vMotivo_CD: String;
  vID_Estoque: Integer;
begin
  if MessageDlg('Deseja carregar os documentos de ajuste do estoque?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  RzLabel1.Caption := 'Aguarde, excluindo estoque_mov..';
  RzLabel1.Refresh;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'DELETE FROM ESTOQUE_MOV WHERE (TIPO_MOV = ' + QuotedStr('DOC') + ' OR TIPO_MOV = ' + QuotedStr('TRA') + ' OR TIPO_MOV = ' + QuotedStr('DPR') + ')'
                     + ' AND DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                     + ' AND DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  sds.ExecSQL;

  FreeAndNil(sds);

  RzLabel1.Caption := 'Aguarde, incluindo Documento Ajuste no ESTOQUE_MOV';
  RzLabel1.Refresh;

  cdsDocEstoque.Close;
  sdsDocEstoque.CommandText := ctDocEstoque
                              + ' WHERE DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                              + ' AND DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  cdsDocEstoque.Open;

  RzProgressStatus1.TotalParts    := cdsDocEstoque.RecordCount;
  RzProgressStatus1.PartsComplete := 0;
  RzProgressStatus1.Percent       := 0;

  cdsDocEstoque.IndexFieldNames := 'ID';
  cdsDocEstoque.First;
  while not cdsDocEstoque.Eof do
  begin
    RzProgressStatus1.PartsComplete := RzProgressStatus1.PartsComplete + 1;
    if not(qFilial.Active) or (qFilialID.AsInteger <> cdsDocEstoqueFILIAL.AsInteger) then
    begin
      qFilial.Close;
      qFilial.ParamByName('ID').AsInteger := cdsDocEstoqueFILIAL.AsInteger;
      qFilial.Open;
    end;
    vMotivo_CD := '';
    cdsDocEstoque_Itens.Close;
    sdsDocEstoque_Itens.ParamByName('ID').AsInteger := cdsDocEstoqueID.AsInteger;
    cdsDocEstoque_Itens.Open;
    cdsDocEstoque_Itens.First;
    while not cdsDocEstoque_Itens.Eof do
    begin
      vID_Estoque := fnc_Gravar_Estoque(cdsDocEstoqueID_LOCAL_ESTOQUE.AsInteger,
                     cdsDocEstoque_ItensID_MOVESTOQUE.AsInteger,cdsDocEstoqueTIPO_ES.AsString,cdsDocEstoqueFILIAL.AsInteger);
      cdsDocEstoque_Itens.Edit;
      cdsDocEstoque_ItensID_MOVESTOQUE.AsInteger := vID_Estoque;
      if (cdsDocEstoqueTIPO_REG.AsString = 'T') then
      begin
        if (qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S') then
          vID_Estoque := fnc_Gravar_Estoque(cdsDocEstoqueID_LOCAL_DESTINO.AsInteger,cdsDocEstoque_ItensID_MOVESTOQUE_DESTINO.AsInteger,'E',cdsDocEstoqueFILIAL.AsInteger)
        else
          vID_Estoque := fnc_Gravar_Estoque(cdsDocEstoqueID_LOCAL_DESTINO.AsInteger,cdsDocEstoque_ItensID_MOVESTOQUE_DESTINO.AsInteger,'E',cdsDocEstoqueFILIAL_DESTINO.AsInteger);
        cdsDocEstoque_ItensID_MOVESTOQUE_DESTINO.AsInteger := vID_Estoque;
      end;
      cdsDocEstoque_Itens.Post;
      cdsDocEstoque_Itens.Next;
    end;
    cdsDocEstoque_Itens.ApplyUpdates(0);
    cdsDocEstoque.Next;
  end;
  RzLabel1.Caption := 'Processo de inclusão dos Documentos de Ajustes finalizado...';
  RzLabel1.Refresh;

  MessageDlg('*** Documentos de Ajuste Carregados no Estoque_Mov!', mtConfirmation, [mbOk], 0);
end;

function TfrmGerarEstoque_Mov.fnc_Gravar_Estoque(ID_Local_Estoque,
  ID_Mov_Estoque: Integer; Tipo_ES: String; Filial: Integer): Integer;
var
  vTipoAux: String;
begin
  if cdsDocEstoqueTIPO_REG.AsString = 'D' then
    vTipoAux := 'DOC'
  else
  if cdsDocEstoqueTIPO_REG.AsString = 'T' then
    vTipoAux := 'TRA'
  else
    vTipoAux := 'DPR';
  Result := fDMEstoque.fnc_Gravar_Estoque(0,
                                          Filial,
                                          ID_Local_Estoque,
                                          cdsDocEstoque_ItensID_PRODUTO.AsInteger,
                                          cdsDocEstoqueID.AsInteger,cdsDocEstoqueID_PESSOA.AsInteger,0,
                                          cdsDocEstoqueID.AsInteger,cdsDocEstoque_ItensID_CENTROCUSTO.AsInteger,
                                          Tipo_ES,vTipoAux,
                                          cdsDocEstoque_ItensUNIDADE.AsString,
                                          cdsDocEstoque_ItensUNIDADE.AsString,'',
                                          cdsDocEstoque_ItensTAMANHO.AsString,
                                          cdsDocEstoqueDTMOVIMENTO.AsDateTime,
                                          cdsDocEstoque_ItensVLR_UNITARIO.AsFloat,
                                          cdsDocEstoque_ItensQTD.AsFloat,0,0,0,0,0,
                                          cdsDocEstoque_ItensQTD.AsFloat,
                                          cdsDocEstoque_ItensVLR_UNITARIO.AsFloat,0,0,'',
                                          cdsDocEstoque_ItensID_COR.AsInteger,
                                          cdsDocEstoque_ItensNUM_LOTE_CONTROLE.AsString,
                                          cdsDocEstoque_ItensGERAR_CUSTO.AsString,
                                          cdsDocEstoque_ItensPRECO_CUSTO_TOTAL.AsFloat,
                                          cdsDocEstoque_ItensCOMPRIMENTO.AsFloat,
                                          cdsDocEstoque_ItensLARGURA.AsFloat,
                                          cdsDocEstoque_ItensESPESSURA.AsFloat,
                                          0,0,0); 
end;

procedure TfrmGerarEstoque_Mov.btnInventarioClick(Sender: TObject);
var
  sds: TSQLDataSet;
  vID_Estoque: Integer;
  vQtd: Real;
  vTipo_ES : String;
  vGerar_Custo : String;
begin
  if MessageDlg('Deseja carregar os inventário?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  RzLabel1.Caption := 'Aguarde, excluindo estoque_mov..';
  RzLabel1.Refresh;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'DELETE FROM ESTOQUE_MOV WHERE TIPO_MOV = ' + QuotedStr('INV')
                     + ' AND DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                     + ' AND DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  sds.ExecSQL;

  FreeAndNil(sds);

  RzLabel1.Caption := 'Aguarde, incluindo Inventário no ESTOQUE_MOV';
  RzLabel1.Refresh;

  cdsInventario.Close;
  sdsInventario.CommandText := ctInventario
                              + ' AND DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date))
                              + ' AND DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  cdsInventario.Open;

  RzProgressStatus1.TotalParts    := cdsInventario.RecordCount;
  RzProgressStatus1.PartsComplete := 0;
  RzProgressStatus1.Percent       := 0;

  cdsInventario.IndexFieldNames := 'ID';
  cdsInventario.First;
  while not cdsInventario.Eof do
  begin
    RzProgressStatus1.PartsComplete := RzProgressStatus1.PartsComplete + 1;
    if not(qFilial.Active) or (qFilialID.AsInteger <> cdsInventarioFILIAL.AsInteger) then
    begin
      qFilial.Close;
      qFilial.ParamByName('ID').AsInteger := cdsInventarioFILIAL.AsInteger;
      qFilial.Open;
    end;
    qProduto.Close;
    qProduto.ParamByName('ID').AsInteger := cdsInventario_ItensID_PRODUTO.AsInteger;
    qProduto.Open;
    
    cdsInventario_Itens.Close;
    sdsInventario_Itens.ParamByName('ID').AsInteger := cdsInventarioID.AsInteger;
    cdsInventario_Itens.Open;
    cdsInventario_Itens.First;
    while not cdsInventario_Itens.Eof do
    begin
      if StrToFloat(FormatFloat('0.00000',cdsInventario_ItensQTD_AJUSTE.AsFloat)) > 0 then
      begin
        vQtd     := StrToFloat(FormatFloat('0.00000',cdsInventario_ItensQTD_AJUSTE.AsFloat));
        vTipo_ES := cdsInventario_ItensTIPO_AJUSTE.AsString;
        if vTipo_ES = 'E' then
          vGerar_Custo := 'S'
        else
          vGerar_Custo := 'N';
        vID_Estoque := fDMEstoque.fnc_Gravar_Estoque(0,
                                                     cdsInventarioFILIAL.AsInteger,
                                                     cdsInventarioID_LOCAL_ESTOQUE.AsInteger,
                                                     cdsInventario_ItensID_PRODUTO.AsInteger,
                                                     cdsInventarioNUM_INVENTARIO.AsInteger,
                                                     0,0,0,0,vTipo_ES,'INV',
                                                     qProdutoUNIDADE.AsString,
                                                     qProdutoUNIDADE.AsString,
                                                     '',
                                                     cdsInventario_ItensTAMANHO.AsString,
                                                     cdsInventarioDATA.AsDateTime,
                                                     cdsInventario_ItensVLR_UNITARIO.AsFloat,
                                                     vQtd,0,
                                                     cdsInventario_ItensPERC_IPI.AsFloat,
                                                     0,0,0,vQtd,
                                                     cdsInventario_ItensVLR_UNITARIO.AsFloat,
                                                     0,0,'',cdsInventario_ItensID_COR.AsInteger,
                                                     cdsInventario_ItensNUM_LOTE_CONTROLE.AsString,
                                                     vGerar_Custo,
                                                     cdsInventario_ItensVLR_UNITARIO.AsFloat,0,0,0,0,0,0); //29/04/2020
        cdsInventario_Itens.Edit;
        cdsInventario_ItensID_MOVESTOQUE.AsInteger := vID_Estoque;
        cdsInventario_ItensQTD_AJUSTE.AsFloat      := vQtd;
        cdsInventario_ItensTIPO_AJUSTE.AsString    := vTipo_ES;
        cdsInventario_Itens.Post;
      end;
      cdsInventario_Itens.Next;
    end;
    cdsInventario_Itens.ApplyUpdates(0);
    cdsInventario.Next;
  end;
  RzLabel1.Caption := 'Processo de inclusão dos Inventários finalizado...';
  RzLabel1.Refresh;

  MessageDlg('*** Inventários Carregados no Estoque_Mov!', mtConfirmation, [mbOk], 0);
end;

procedure TfrmGerarEstoque_Mov.dspDocEstoque_ItensGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
  TableName := 'DOCESTOQUE_ITENS';
end;

procedure TfrmGerarEstoque_Mov.dspInventario_ItensGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
  TableName := 'INVENTARIO_ITENS';
end;

end.
