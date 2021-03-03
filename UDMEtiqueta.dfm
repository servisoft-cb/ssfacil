object DMEtiqueta: TDMEtiqueta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 359
  Top = 208
  Height = 430
  Width = 758
  object mEtiqueta_Nav: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nome_Empresa'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Fone'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Nome_Etiqueta'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Tamanho'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome_Produto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Nome_Cliente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Pedido_Cliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Fantasia_Cli'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DtEmissao'
        DataType = ftDate
      end
      item
        Name = 'Prod_Cliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumOS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Encerado'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Item_Ped'
        DataType = ftInteger
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Num_Nota'
        DataType = ftInteger
      end
      item
        Name = 'Cod_Cor_Cliente'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nome_Cor_Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Sequencia_RFID'
        DataType = ftLargeint
      end
      item
        Name = 'CNPJ_Filial'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ID_Nota'
        DataType = ftInteger
      end
      item
        Name = 'Item_Nota'
        DataType = ftInteger
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'NUM_RFID'
        DataType = ftString
        Size = 24
      end
      item
        Name = 'Fantasia_Filial'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Selecionado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Enviado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'Nome_Etiqueta;Tamanho'
    Params = <>
    StoreDefs = True
    OnNewRecord = mEtiqueta_NavNewRecord
    Left = 151
    Top = 40
    Data = {
      190300009619E0BD01000000180000001C00000000000300000019030C4E6F6D
      655F456D70726573610100490000000100055749445448020002000F0004466F
      6E650100490000000100055749445448020002000C000D4E6F6D655F45746971
      7565746101004900000001000557494454480200020019000754616D616E686F
      0100490000000100055749445448020002000A000A5265666572656E63696101
      004900000001000557494454480200020014000C4E6F6D655F50726F6475746F
      01004900000001000557494454480200020064000C4E6F6D655F436C69656E74
      650100490000000100055749445448020002003C000E50656469646F5F436C69
      656E746501004900000001000557494454480200020014000C46616E74617369
      615F436C690100490000000100055749445448020002002800094474456D6973
      73616F04000600000000000C50726F645F436C69656E74650100490000000100
      055749445448020002001400054E756D4F530100490000000100055749445448
      020002001E0008456E63657261646F0100490000000100055749445448020002
      000A00084974656D5F506564040001000000000007556E696461646501004900
      00000100055749445448020002000C00084E756D5F4E6F746104000100000000
      000F436F645F436F725F436C69656E7465010049000000010005574944544802
      0002000A00104E6F6D655F436F725F436C69656E746501004900000001000557
      494454480200020064000E53657175656E6369615F5246494408000100000000
      000B434E504A5F46696C69616C01004900000001000557494454480200020012
      000749445F4E6F74610400010000000000094974656D5F4E6F74610400010000
      0000000646696C69616C0400010000000000084E554D5F524649440100490000
      0001000557494454480200020018000F46616E74617369615F46696C69616C01
      004900000001000557494454480200020019000B53656C6563696F6E61646F01
      0049000000010005574944544802000200010007456E766961646F0100490000
      0001000557494454480200020001000351746408000400000000000000}
    object mEtiqueta_NavNome_Empresa: TStringField
      FieldName = 'Nome_Empresa'
      Size = 15
    end
    object mEtiqueta_NavFone: TStringField
      FieldName = 'Fone'
      Size = 12
    end
    object mEtiqueta_NavNome_Etiqueta: TStringField
      FieldName = 'Nome_Etiqueta'
      Size = 25
    end
    object mEtiqueta_NavTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mEtiqueta_NavReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mEtiqueta_NavNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 100
    end
    object mEtiqueta_NavNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 60
    end
    object mEtiqueta_NavPedido_Cliente: TStringField
      FieldName = 'Pedido_Cliente'
    end
    object mEtiqueta_NavFantasia_Cli: TStringField
      FieldName = 'Fantasia_Cli'
      Size = 40
    end
    object mEtiqueta_NavDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mEtiqueta_NavProd_Cliente: TStringField
      FieldName = 'Prod_Cliente'
    end
    object mEtiqueta_NavNumOS: TStringField
      FieldName = 'NumOS'
      Size = 30
    end
    object mEtiqueta_NavEncerado: TStringField
      FieldName = 'Encerado'
      Size = 10
    end
    object mEtiqueta_NavItem_Ped: TIntegerField
      FieldName = 'Item_Ped'
    end
    object mEtiqueta_NavUnidade: TStringField
      FieldName = 'Unidade'
      Size = 12
    end
    object mEtiqueta_NavNum_Nota: TIntegerField
      FieldName = 'Num_Nota'
    end
    object mEtiqueta_NavCod_Cor_Cliente: TStringField
      FieldName = 'Cod_Cor_Cliente'
      Size = 10
    end
    object mEtiqueta_NavNome_Cor_Cliente: TStringField
      FieldName = 'Nome_Cor_Cliente'
      Size = 100
    end
    object mEtiqueta_NavSequencia_RFID: TLargeintField
      FieldName = 'Sequencia_RFID'
    end
    object mEtiqueta_NavCNPJ_Filial: TStringField
      FieldName = 'CNPJ_Filial'
      Size = 18
    end
    object mEtiqueta_NavID_Nota: TIntegerField
      FieldName = 'ID_Nota'
    end
    object mEtiqueta_NavItem_Nota: TIntegerField
      FieldName = 'Item_Nota'
    end
    object mEtiqueta_NavFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mEtiqueta_NavNUM_RFID: TStringField
      FieldName = 'NUM_RFID'
      Size = 24
    end
    object mEtiqueta_NavFantasia_Filial: TStringField
      FieldName = 'Fantasia_Filial'
      Size = 25
    end
    object mEtiqueta_NavSelecionado: TStringField
      FieldName = 'Selecionado'
      Size = 1
    end
    object mEtiqueta_NavEnviado: TStringField
      FieldName = 'Enviado'
      Size = 1
    end
    object mEtiqueta_NavQtd: TFloatField
      FieldName = 'Qtd'
      DisplayFormat = '0.####'
    end
  end
  object dsmEtiqueta_Nav: TDataSource
    DataSet = mEtiqueta_Nav
    Left = 177
    Top = 39
  end
  object qPessoa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM PESSOA'
      'WHERE CODIGO = :CODIGO')
    SQLConnection = dmDatabase.scoDados
    Left = 432
    Top = 16
    object qPessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qPessoaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object qPessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object qPessoaCOMPLEMENTO_END: TStringField
      FieldName = 'COMPLEMENTO_END'
      Size = 60
    end
    object qPessoaNUM_END: TStringField
      FieldName = 'NUM_END'
    end
    object qPessoaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qPessoaID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
    end
    object qPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object qPessoaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qPessoaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qPessoaDDDFONE1: TIntegerField
      FieldName = 'DDDFONE1'
    end
    object qPessoaTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Size = 15
    end
    object qPessoaDDDFONE2: TIntegerField
      FieldName = 'DDDFONE2'
    end
    object qPessoaTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Size = 15
    end
    object qPessoaDDDFAX: TIntegerField
      FieldName = 'DDDFAX'
    end
    object qPessoaFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object qPessoaPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object qPessoaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
    object qPessoaINSCR_EST: TStringField
      FieldName = 'INSCR_EST'
      Size = 18
    end
    object qPessoaENDERECO_ENT: TStringField
      FieldName = 'ENDERECO_ENT'
      Size = 40
    end
    object qPessoaCOMPLEMENTO_END_ENT: TStringField
      FieldName = 'COMPLEMENTO_END_ENT'
      Size = 60
    end
    object qPessoaNUM_END_ENT: TStringField
      FieldName = 'NUM_END_ENT'
    end
    object qPessoaBAIRRO_ENT: TStringField
      FieldName = 'BAIRRO_ENT'
      Size = 26
    end
    object qPessoaID_CIDADE_ENT: TIntegerField
      FieldName = 'ID_CIDADE_ENT'
    end
    object qPessoaCIDADE_ENT: TStringField
      FieldName = 'CIDADE_ENT'
      Size = 40
    end
    object qPessoaCEP_ENT: TStringField
      FieldName = 'CEP_ENT'
      Size = 10
    end
    object qPessoaUF_ENT: TStringField
      FieldName = 'UF_ENT'
      FixedChar = True
      Size = 2
    end
    object qPessoaPESSOA_ENT: TStringField
      FieldName = 'PESSOA_ENT'
      FixedChar = True
      Size = 1
    end
    object qPessoaCNPJ_CPF_ENT: TStringField
      FieldName = 'CNPJ_CPF_ENT'
      Size = 18
    end
    object qPessoaINSC_EST_ENT: TStringField
      FieldName = 'INSC_EST_ENT'
      Size = 18
    end
    object qPessoaENDERECO_PGTO: TStringField
      FieldName = 'ENDERECO_PGTO'
      Size = 40
    end
    object qPessoaCOMPLEMENTO_END_PGTO: TStringField
      FieldName = 'COMPLEMENTO_END_PGTO'
      Size = 60
    end
    object qPessoaNUM_END_PGTO: TStringField
      FieldName = 'NUM_END_PGTO'
    end
    object qPessoaBAIRRO_PGTO: TStringField
      FieldName = 'BAIRRO_PGTO'
      Size = 26
    end
    object qPessoaID_CIDADE_PGTO: TIntegerField
      FieldName = 'ID_CIDADE_PGTO'
    end
    object qPessoaCIDADE_PGTO: TStringField
      FieldName = 'CIDADE_PGTO'
      Size = 40
    end
    object qPessoaCEP_PGTO: TStringField
      FieldName = 'CEP_PGTO'
      Size = 10
    end
    object qPessoaUF_PGTO: TStringField
      FieldName = 'UF_PGTO'
      FixedChar = True
      Size = 2
    end
    object qPessoaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object qPessoaDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object qPessoaHRCADASTRO: TTimeField
      FieldName = 'HRCADASTRO'
    end
    object qPessoaOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object qPessoaCAIXAPOSTAL: TStringField
      FieldName = 'CAIXAPOSTAL'
      Size = 10
    end
    object qPessoaRG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object qPessoaID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object qPessoaID_CONDPGTO: TIntegerField
      FieldName = 'ID_CONDPGTO'
    end
    object qPessoaID_CONTABOLETO: TIntegerField
      FieldName = 'ID_CONTABOLETO'
    end
    object qPessoaID_TRANSPORTADORA: TIntegerField
      FieldName = 'ID_TRANSPORTADORA'
    end
    object qPessoaID_TIPOCOBRANCA: TIntegerField
      FieldName = 'ID_TIPOCOBRANCA'
    end
    object qPessoaID_REDESPACHO: TIntegerField
      FieldName = 'ID_REDESPACHO'
    end
    object qPessoaID_PAIS: TIntegerField
      FieldName = 'ID_PAIS'
    end
    object qPessoaID_REGIME_TRIB: TIntegerField
      FieldName = 'ID_REGIME_TRIB'
    end
    object qPessoaPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object qPessoaDDD_ENT: TIntegerField
      FieldName = 'DDD_ENT'
    end
    object qPessoaFONE_ENT: TStringField
      FieldName = 'FONE_ENT'
      Size = 15
    end
    object qPessoaDDD_PGTO: TIntegerField
      FieldName = 'DDD_PGTO'
    end
    object qPessoaFONE_PGTO: TStringField
      FieldName = 'FONE_PGTO'
      Size = 15
    end
    object qPessoaINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object qPessoaHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 200
    end
    object qPessoaTIPO_FRETE: TStringField
      FieldName = 'TIPO_FRETE'
      FixedChar = True
      Size = 1
    end
    object qPessoaNOME_ENTREGA: TStringField
      FieldName = 'NOME_ENTREGA'
      Size = 60
    end
    object qPessoaEMAIL_NFE: TStringField
      FieldName = 'EMAIL_NFE'
      Size = 250
    end
    object qPessoaEMAIL_PGTO: TStringField
      FieldName = 'EMAIL_PGTO'
      Size = 150
    end
    object qPessoaEMAIL_NFE2: TStringField
      FieldName = 'EMAIL_NFE2'
      Size = 150
    end
    object qPessoaPESSOA_PGTO: TStringField
      FieldName = 'PESSOA_PGTO'
      FixedChar = True
      Size = 1
    end
    object qPessoaCNPJ_CPG_PGTO: TStringField
      FieldName = 'CNPJ_CPG_PGTO'
      Size = 18
    end
    object qPessoaINSC_EST_PGTO: TStringField
      FieldName = 'INSC_EST_PGTO'
      Size = 18
    end
    object qPessoaUF_PLACA: TStringField
      FieldName = 'UF_PLACA'
      Size = 2
    end
    object qPessoaPLACA: TStringField
      FieldName = 'PLACA'
      Size = 10
    end
    object qPessoaTP_CLIENTE: TStringField
      FieldName = 'TP_CLIENTE'
      Size = 1
    end
    object qPessoaTP_FORNECEDOR: TStringField
      FieldName = 'TP_FORNECEDOR'
      Size = 1
    end
    object qPessoaTP_TRANSPORTADORA: TStringField
      FieldName = 'TP_TRANSPORTADORA'
      Size = 1
    end
    object qPessoaTP_VENDEDOR: TStringField
      FieldName = 'TP_VENDEDOR'
      Size = 1
    end
    object qPessoaTIPO_ICMS: TStringField
      FieldName = 'TIPO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qPessoaID_TAB_PRECO: TIntegerField
      FieldName = 'ID_TAB_PRECO'
    end
    object qPessoaTP_ATELIER: TStringField
      FieldName = 'TP_ATELIER'
      Size = 1
    end
    object qPessoaTIPO_COMISSAO: TStringField
      FieldName = 'TIPO_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object qPessoaPERC_COMISSAO_VEND: TFloatField
      FieldName = 'PERC_COMISSAO_VEND'
    end
    object qPessoaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 40
    end
    object qPessoaINSC_MUNICIPAL: TStringField
      FieldName = 'INSC_MUNICIPAL'
      Size = 15
    end
    object qPessoaDT_CONTRATO_INI: TDateField
      FieldName = 'DT_CONTRATO_INI'
    end
    object qPessoaDT_CONTRATO_FIN: TDateField
      FieldName = 'DT_CONTRATO_FIN'
    end
    object qPessoaID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
    end
    object qPessoaID_SERVICO_INT: TIntegerField
      FieldName = 'ID_SERVICO_INT'
    end
    object qPessoaVLR_SERVICO: TFloatField
      FieldName = 'VLR_SERVICO'
    end
    object qPessoaCLIENTE_CONTA_ID: TIntegerField
      FieldName = 'CLIENTE_CONTA_ID'
    end
    object qPessoaFORNECEDOR_CONTA_ID: TIntegerField
      FieldName = 'FORNECEDOR_CONTA_ID'
    end
    object qPessoaVENDEDOR_CONTA_ID: TIntegerField
      FieldName = 'VENDEDOR_CONTA_ID'
    end
    object qPessoaTRANSPORTADORA_CONTA_ID: TIntegerField
      FieldName = 'TRANSPORTADORA_CONTA_ID'
    end
    object qPessoaATELIER_CONTA_ID: TIntegerField
      FieldName = 'ATELIER_CONTA_ID'
    end
    object qPessoaRETEM_ISS: TStringField
      FieldName = 'RETEM_ISS'
      FixedChar = True
      Size = 1
    end
    object qPessoaRETEM_CSLL: TStringField
      FieldName = 'RETEM_CSLL'
      FixedChar = True
      Size = 1
    end
    object qPessoaRETEM_PISCOFINS: TStringField
      FieldName = 'RETEM_PISCOFINS'
      FixedChar = True
      Size = 1
    end
    object qPessoaRETEM_INSS: TStringField
      FieldName = 'RETEM_INSS'
      FixedChar = True
      Size = 1
    end
    object qPessoaEMAIL_COMPRAS: TStringField
      FieldName = 'EMAIL_COMPRAS'
      Size = 200
    end
    object qPessoaCONTATO_COMPRAS: TStringField
      FieldName = 'CONTATO_COMPRAS'
      Size = 60
    end
    object qPessoaORGAO_PUBLICO: TStringField
      FieldName = 'ORGAO_PUBLICO'
      FixedChar = True
      Size = 1
    end
    object qPessoaID_NATUREZA: TIntegerField
      FieldName = 'ID_NATUREZA'
    end
    object qPessoaDIMINUIR_RETENCAO: TStringField
      FieldName = 'DIMINUIR_RETENCAO'
      FixedChar = True
      Size = 1
    end
    object qPessoaPERC_REDUCAO_INSS: TFloatField
      FieldName = 'PERC_REDUCAO_INSS'
    end
    object qPessoaUSA_TRANSFICMS: TStringField
      FieldName = 'USA_TRANSFICMS'
      FixedChar = True
      Size = 1
    end
    object qPessoaCLIENTE_ESTOQUE: TStringField
      FieldName = 'CLIENTE_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object qPessoaUSA_TAMANHO_AGRUPADO_NFE: TStringField
      FieldName = 'USA_TAMANHO_AGRUPADO_NFE'
      FixedChar = True
      Size = 1
    end
    object qPessoaCOD_ANT: TIntegerField
      FieldName = 'COD_ANT'
    end
    object qPessoaID_EDI: TIntegerField
      FieldName = 'ID_EDI'
    end
    object qPessoaPAI_NOME: TStringField
      FieldName = 'PAI_NOME'
      Size = 60
    end
    object qPessoaMAE_NOME: TStringField
      FieldName = 'MAE_NOME'
      Size = 60
    end
    object qPessoaTP_ALUNO: TStringField
      FieldName = 'TP_ALUNO'
      FixedChar = True
      Size = 1
    end
    object qPessoaCOBRAR_TAXA_BANCO: TStringField
      FieldName = 'COBRAR_TAXA_BANCO'
      FixedChar = True
      Size = 1
    end
    object qPessoaVLR_LIMITE_CREDITO: TFloatField
      FieldName = 'VLR_LIMITE_CREDITO'
    end
    object qPessoaINSC_EST_ST: TStringField
      FieldName = 'INSC_EST_ST'
      Size = 14
    end
    object qPessoaUF_ST: TStringField
      FieldName = 'UF_ST'
      Size = 2
    end
    object qPessoaTIPO_CONSUMIDOR: TSmallintField
      FieldName = 'TIPO_CONSUMIDOR'
    end
    object qPessoaTIPO_CONTRIBUINTE: TSmallintField
      FieldName = 'TIPO_CONTRIBUINTE'
    end
    object qPessoaINSC_SUFRAMA: TStringField
      FieldName = 'INSC_SUFRAMA'
      Size = 9
    end
    object qPessoaCOD_ALFA: TStringField
      FieldName = 'COD_ALFA'
      Size = 15
    end
    object qPessoaTP_PREPOSTO: TStringField
      FieldName = 'TP_PREPOSTO'
      Size = 1
    end
    object qPessoaTP_EXPORTACAO: TStringField
      FieldName = 'TP_EXPORTACAO'
      Size = 1
    end
    object qPessoaCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object qPessoaDTPEDIDO: TDateField
      FieldName = 'DTPEDIDO'
    end
    object qPessoaDTNOTA: TDateField
      FieldName = 'DTNOTA'
    end
    object qPessoaPERC_DESC_SUFRAMA: TFloatField
      FieldName = 'PERC_DESC_SUFRAMA'
    end
    object qPessoaVLR_LIMITE_COMPRA: TFloatField
      FieldName = 'VLR_LIMITE_COMPRA'
    end
    object qPessoaID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
    object qPessoaTP_FUNCIONARIO: TStringField
      FieldName = 'TP_FUNCIONARIO'
      FixedChar = True
      Size = 1
    end
    object qPessoaIMP_COD_PRODUTO_CLI: TStringField
      FieldName = 'IMP_COD_PRODUTO_CLI'
      FixedChar = True
      Size = 1
    end
    object qPessoaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object qPessoaVLR_ULT_FATURAMENTO: TFloatField
      FieldName = 'VLR_ULT_FATURAMENTO'
    end
    object qPessoaQTD_ULT_FATURAMENTO: TFloatField
      FieldName = 'QTD_ULT_FATURAMENTO'
    end
    object qPessoaCOD_CONTABIL_CLIENTE: TIntegerField
      FieldName = 'COD_CONTABIL_CLIENTE'
    end
    object qPessoaCOD_CONTABIL_FORNECEDOR: TIntegerField
      FieldName = 'COD_CONTABIL_FORNECEDOR'
    end
    object qPessoaID_REGIAO_VENDA: TIntegerField
      FieldName = 'ID_REGIAO_VENDA'
    end
    object qPessoaTIPO_CREDITO: TStringField
      FieldName = 'TIPO_CREDITO'
      Size = 1
    end
    object qPessoaUSUARIO_LOG: TStringField
      FieldName = 'USUARIO_LOG'
      Size = 15
    end
    object qPessoaPROTESTAR: TStringField
      FieldName = 'PROTESTAR'
      FixedChar = True
      Size = 1
    end
    object qPessoaID_CARTEIRA: TIntegerField
      FieldName = 'ID_CARTEIRA'
    end
    object qPessoaCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 10
    end
    object qPessoaDDDCELULAR: TIntegerField
      FieldName = 'DDDCELULAR'
    end
    object qPessoaCONT_CUSTO_LIQ: TStringField
      FieldName = 'CONT_CUSTO_LIQ'
      Size = 1
    end
    object qPessoaUSA_OC_XML: TStringField
      FieldName = 'USA_OC_XML'
      FixedChar = True
      Size = 1
    end
    object qPessoaIMP_COR_CLIENTE: TStringField
      FieldName = 'IMP_COR_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qPessoaOBS_AVISO: TStringField
      FieldName = 'OBS_AVISO'
      Size = 150
    end
    object qPessoaMOSTRAR_AVISO: TStringField
      FieldName = 'MOSTRAR_AVISO'
      FixedChar = True
      Size = 1
    end
    object qPessoaID_ROTA: TIntegerField
      FieldName = 'ID_ROTA'
    end
  end
  object sdsNotaFiscal_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select I.ID, I.ITEM, I.ID_PRODUTO, I.ID_COR, I.TAMANHO, I.NOME_P' +
      'RODUTO, I.REFERENCIA, I.UNIDADE, I.QTD, I.NUMERO_OC,'#13#10'       I.N' +
      'UMERO_OS, I.NUM_PEDIDO, I.COD_PRODUTO_FORN, I.COD_BARRA, I2.COD_' +
      'PRODUTO_CLIENTE, I2.COD_COR_CLIENTE,'#13#10'       I2.NOME_COR_CLIENTE' +
      ', I2.TAMANHO_CLIENTE, C.NOME NOME_COR, I2.ENCERADO,'#13#10'       coal' +
      'esce(P.QTD_POR_ROTULO, 0) QTD_POR_ROTULO'#13#10'from NOTAFISCAL_ITENS ' +
      'I'#13#10'inner join PRODUTO P on I.ID_PRODUTO = P.ID'#13#10'inner join COMBI' +
      'NACAO C on (I.ID_COR = C.ID)'#13#10'inner join TAB_CFOP CFOP on I.ID_C' +
      'FOP = CFOP.ID'#13#10'left join PEDIDO_ITEM I2 on (I.ID_PEDIDO = I2.ID ' +
      'and I.ITEM_PEDIDO = I2.ITEM)'#13#10'where I.ID = :ID and'#13#10'      CFOP.F' +
      'ATURAMENTO = '#39'S'#39'   '#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 303
    Top = 137
  end
  object dspNotaFiscal_Itens: TDataSetProvider
    DataSet = sdsNotaFiscal_Itens
    Left = 344
    Top = 136
  end
  object cdsNotaFiscal_Itens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNotaFiscal_Itens'
    Left = 385
    Top = 136
    object cdsNotaFiscal_ItensID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNotaFiscal_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsNotaFiscal_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsNotaFiscal_ItensID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsNotaFiscal_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsNotaFiscal_ItensNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsNotaFiscal_ItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsNotaFiscal_ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsNotaFiscal_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsNotaFiscal_ItensNUMERO_OC: TStringField
      FieldName = 'NUMERO_OC'
    end
    object cdsNotaFiscal_ItensNUMERO_OS: TStringField
      FieldName = 'NUMERO_OS'
      Size = 30
    end
    object cdsNotaFiscal_ItensNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsNotaFiscal_ItensCOD_PRODUTO_FORN: TStringField
      FieldName = 'COD_PRODUTO_FORN'
    end
    object cdsNotaFiscal_ItensCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 14
    end
    object cdsNotaFiscal_ItensCOD_PRODUTO_CLIENTE: TStringField
      FieldName = 'COD_PRODUTO_CLIENTE'
      Size = 15
    end
    object cdsNotaFiscal_ItensCOD_COR_CLIENTE: TStringField
      FieldName = 'COD_COR_CLIENTE'
      Size = 10
    end
    object cdsNotaFiscal_ItensNOME_COR_CLIENTE: TStringField
      FieldName = 'NOME_COR_CLIENTE'
      Size = 100
    end
    object cdsNotaFiscal_ItensTAMANHO_CLIENTE: TStringField
      FieldName = 'TAMANHO_CLIENTE'
      Size = 10
    end
    object cdsNotaFiscal_ItensNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
    object cdsNotaFiscal_ItensENCERADO: TStringField
      FieldName = 'ENCERADO'
      FixedChar = True
      Size = 1
    end
    object cdsNotaFiscal_ItensQTD_POR_ROTULO: TFloatField
      FieldName = 'QTD_POR_ROTULO'
    end
  end
  object qNotaFiscal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT N.ID, N.NUMNOTA, N.ID_CLIENTE, CLI.NOME NOME_CLIENTE,'
      
        'CLI.IMP_COR_CLIENTE, N.DTEMISSAO, CLI.FANTASIA, F.NOME_INTERNO, ' +
        'N.FILIAL'
      'FROM NOTAFISCAL N'
      'INNER JOIN PESSOA CLI'
      'ON N.ID_CLIENTE = CLI.CODIGO'
      'INNER JOIN FILIAL F'
      'ON N.FILIAL = F.ID'
      'WHERE N.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 344
    Top = 40
    object qNotaFiscalID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qNotaFiscalNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object qNotaFiscalID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object qNotaFiscalNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object qNotaFiscalIMP_COR_CLIENTE: TStringField
      FieldName = 'IMP_COR_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qNotaFiscalDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object qNotaFiscalFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object qNotaFiscalNOME_INTERNO: TStringField
      FieldName = 'NOME_INTERNO'
      Size = 30
    end
    object qNotaFiscalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object frxReport1: TfrxReport
    Tag = 1
    Version = '5.6.8'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41928.578144409700000000
    ReportOptions.LastChange = 44218.395941666700000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 472
    Top = 233
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 512
    Top = 231
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = SMTP
    MAPISendFlag = 0
    Left = 552
    Top = 231
  end
  object frxRichObject1: TfrxRichObject
    Left = 584
    Top = 231
  end
  object frxmEtiqueta_Nav: TfrxDBDataset
    UserName = 'frxmEtiqueta_Nav'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Nome_Empresa=Nome_Empresa'
      'Fone=Fone'
      'Nome_Etiqueta=Nome_Etiqueta'
      'Tamanho=Tamanho'
      'Referencia=Referencia'
      'Nome_Produto=Nome_Produto'
      'Nome_Cliente=Nome_Cliente'
      'Qtd=Qtd'
      'Pedido_Cliente=Pedido_Cliente'
      'Fantasia_Cli=Fantasia_Cli'
      'DtEmissao=DtEmissao'
      'Prod_Cliente=Prod_Cliente'
      'NumOS=NumOS'
      'Encerado=Encerado'
      'Item_Ped=Item_Ped'
      'Unidade=Unidade'
      'Num_Nota=Num_Nota'
      'Cod_Cor_Cliente=Cod_Cor_Cliente'
      'Nome_Cor_Cliente=Nome_Cor_Cliente'
      'Sequencia_RFID=Sequencia_RFID'
      'CNPJ_Filial=CNPJ_Filial'
      'ID_Nota=ID_Nota'
      'Item_Nota=Item_Nota'
      'Filial=Filial'
      'NUM_RFID=NUM_RFID')
    DataSource = dsmEtiqueta_Nav
    BCDToCurrency = False
    Left = 472
    Top = 276
  end
  object sdsParametros_Fin: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select ID, ZEBRA_TEMPERATURA, ZEBRA_VELOCIDADE, ZEBRA_ENDERECO'#13#10 +
      'from PARAMETROS_ETIQ'#13#10'where ID = 1'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 122
    Top = 199
    object sdsParametros_FinID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsParametros_FinZEBRA_TEMPERATURA: TIntegerField
      FieldName = 'ZEBRA_TEMPERATURA'
    end
    object sdsParametros_FinZEBRA_VELOCIDADE: TIntegerField
      FieldName = 'ZEBRA_VELOCIDADE'
    end
    object sdsParametros_FinZEBRA_ENDERECO: TStringField
      FieldName = 'ZEBRA_ENDERECO'
      Size = 200
    end
  end
  object dspParametros_Fin: TDataSetProvider
    DataSet = sdsParametros_Fin
    Left = 161
    Top = 200
  end
  object cdsParametros_Fin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametros_Fin'
    Left = 203
    Top = 199
    object cdsParametros_FinID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsParametros_FinZEBRA_TEMPERATURA: TIntegerField
      FieldName = 'ZEBRA_TEMPERATURA'
    end
    object cdsParametros_FinZEBRA_VELOCIDADE: TIntegerField
      FieldName = 'ZEBRA_VELOCIDADE'
    end
    object cdsParametros_FinZEBRA_ENDERECO: TStringField
      FieldName = 'ZEBRA_ENDERECO'
      Size = 200
    end
  end
  object dsParametros_Fin: TDataSource
    DataSet = cdsParametros_Fin
    Left = 239
    Top = 200
  end
  object sdsConsNotaFiscal_RFID: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select R.*'#13#10'from NOTAFISCAL_RFID R'#13#10'where R.ID = :ID and'#13#10'      ' +
      'R.ITEM_NOTA = :ITEM_NOTA'#13#10#13#10'  '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM_NOTA'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 231
    Top = 339
  end
  object dspConsNotaFiscal_RFID: TDataSetProvider
    DataSet = sdsConsNotaFiscal_RFID
    Left = 270
    Top = 339
  end
  object cdsConsNotaFiscal_RFID: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsNotaFiscal_RFID'
    Left = 312
    Top = 339
    object cdsConsNotaFiscal_RFIDID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsNotaFiscal_RFIDITEM_NOTA: TIntegerField
      FieldName = 'ITEM_NOTA'
      Required = True
    end
    object cdsConsNotaFiscal_RFIDITEM_RFID: TIntegerField
      FieldName = 'ITEM_RFID'
      Required = True
    end
    object cdsConsNotaFiscal_RFIDFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsNotaFiscal_RFIDCNPJ_FILIAL: TStringField
      FieldName = 'CNPJ_FILIAL'
      Size = 18
    end
    object cdsConsNotaFiscal_RFIDSEQUENCIA: TFMTBCDField
      FieldName = 'SEQUENCIA'
      Precision = 15
      Size = 0
    end
    object cdsConsNotaFiscal_RFIDQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsNotaFiscal_RFIDUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsNotaFiscal_RFIDNUM_RFID: TStringField
      FieldName = 'NUM_RFID'
      Size = 24
    end
    object cdsConsNotaFiscal_RFIDENVIADO: TStringField
      FieldName = 'ENVIADO'
      FixedChar = True
      Size = 1
    end
  end
  object sdsItemSemQtdRotulo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select distinct I.id_produto, i.referencia, i.nome_produto, P.qt' +
      'd_por_rotulo, I.UNIDADE'#13#10'from NOTAFISCAL_ITENS I'#13#10'inner join PRO' +
      'DUTO P on I.ID_PRODUTO = P.ID'#13#10'inner join TAB_CFOP CFOP on I.ID_' +
      'CFOP = CFOP.ID'#13#10'where I.ID = :ID and'#13#10'      CFOP.FATURAMENTO = '#39 +
      'S'#39'    and'#13#10'      coalesce(p.qtd_por_rotulo,0) <= 0'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 548
    Top = 76
  end
  object dspItemSemQtdRotulo: TDataSetProvider
    DataSet = sdsItemSemQtdRotulo
    Left = 589
    Top = 74
  end
  object cdsItemSemQtdRotulo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemSemQtdRotulo'
    Left = 630
    Top = 74
    object cdsItemSemQtdRotuloID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsItemSemQtdRotuloREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsItemSemQtdRotuloNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsItemSemQtdRotuloQTD_POR_ROTULO: TFloatField
      FieldName = 'QTD_POR_ROTULO'
    end
    object cdsItemSemQtdRotuloUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
  end
  object dsItemSemQtdRotulo: TDataSource
    DataSet = cdsItemSemQtdRotulo
    Left = 670
    Top = 76
  end
end
