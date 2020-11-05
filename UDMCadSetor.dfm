object DmCadSetor: TDmCadSetor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 350
  Top = 135
  Height = 532
  Width = 871
  object sdsSetor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT S.*'#13#10'FROM SETOR S'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 32
    object sdsSetorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsSetorNOME: TStringField
      FieldName = 'NOME'
    end
    object sdsSetorDESPESA_RATEIO: TFloatField
      FieldName = 'DESPESA_RATEIO'
    end
    object sdsSetorGERAR_TALAO: TStringField
      FieldName = 'GERAR_TALAO'
      FixedChar = True
      Size = 1
    end
    object sdsSetorLIMITE_POR_TALAO: TStringField
      FieldName = 'LIMITE_POR_TALAO'
      FixedChar = True
      Size = 1
    end
    object sdsSetorQTD_LIMITE_POR_TALAO: TIntegerField
      FieldName = 'QTD_LIMITE_POR_TALAO'
    end
    object sdsSetorMOSTRAR_ORC: TStringField
      FieldName = 'MOSTRAR_ORC'
      FixedChar = True
      Size = 1
    end
    object sdsSetorORDEM_ORC: TIntegerField
      FieldName = 'ORDEM_ORC'
    end
    object sdsSetorENTRADA_AUT: TStringField
      FieldName = 'ENTRADA_AUT'
      FixedChar = True
      Size = 1
    end
    object sdsSetorIMP_MAPA: TStringField
      FieldName = 'IMP_MAPA'
      FixedChar = True
      Size = 1
    end
    object sdsSetorENCERRA_PROD: TStringField
      FieldName = 'ENCERRA_PROD'
      FixedChar = True
      Size = 1
    end
    object sdsSetorLER_CBARRA1: TStringField
      FieldName = 'LER_CBARRA1'
      FixedChar = True
      Size = 1
    end
    object sdsSetorTIPO_SETOR: TStringField
      FieldName = 'TIPO_SETOR'
      Size = 1
    end
    object sdsSetorID_SETOR_PRINCIPAL: TIntegerField
      FieldName = 'ID_SETOR_PRINCIPAL'
    end
    object sdsSetorTIPO_LEITURA: TStringField
      FieldName = 'TIPO_LEITURA'
      FixedChar = True
      Size = 1
    end
    object sdsSetorORDEM_ESTEIRA: TIntegerField
      FieldName = 'ORDEM_ESTEIRA'
    end
    object sdsSetorAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 6
    end
    object sdsSetorESTEIRA_PADRAO: TStringField
      FieldName = 'ESTEIRA_PADRAO'
      FixedChar = True
      Size = 1
    end
    object sdsSetorIMP_MAT_ANT: TStringField
      FieldName = 'IMP_MAT_ANT'
      FixedChar = True
      Size = 1
    end
    object sdsSetorIMP_MAT_CUSTO: TStringField
      FieldName = 'IMP_MAT_CUSTO'
      FixedChar = True
      Size = 1
    end
  end
  object dspSetor: TDataSetProvider
    DataSet = sdsSetor
    OnUpdateError = dspSetorUpdateError
    Left = 136
    Top = 32
  end
  object cdsSetor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspSetor'
    OnNewRecord = cdsSetorNewRecord
    Left = 192
    Top = 32
    object cdsSetorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSetorNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsSetorDESPESA_RATEIO: TFloatField
      FieldName = 'DESPESA_RATEIO'
    end
    object cdsSetorGERAR_TALAO: TStringField
      FieldName = 'GERAR_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsSetorLIMITE_POR_TALAO: TStringField
      FieldName = 'LIMITE_POR_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsSetorQTD_LIMITE_POR_TALAO: TIntegerField
      FieldName = 'QTD_LIMITE_POR_TALAO'
    end
    object cdsSetorMOSTRAR_ORC: TStringField
      FieldName = 'MOSTRAR_ORC'
      FixedChar = True
      Size = 1
    end
    object cdsSetorsdsSetor_Proc: TDataSetField
      FieldName = 'sdsSetor_Proc'
    end
    object cdsSetorORDEM_ORC: TIntegerField
      FieldName = 'ORDEM_ORC'
    end
    object cdsSetorENTRADA_AUT: TStringField
      FieldName = 'ENTRADA_AUT'
      FixedChar = True
      Size = 1
    end
    object cdsSetorIMP_MAPA: TStringField
      FieldName = 'IMP_MAPA'
      FixedChar = True
      Size = 1
    end
    object cdsSetorENCERRA_PROD: TStringField
      FieldName = 'ENCERRA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsSetorLER_CBARRA1: TStringField
      FieldName = 'LER_CBARRA1'
      FixedChar = True
      Size = 1
    end
    object cdsSetorTIPO_SETOR: TStringField
      FieldName = 'TIPO_SETOR'
      Size = 1
    end
    object cdsSetorID_SETOR_PRINCIPAL: TIntegerField
      FieldName = 'ID_SETOR_PRINCIPAL'
    end
    object cdsSetorTIPO_LEITURA: TStringField
      FieldName = 'TIPO_LEITURA'
      FixedChar = True
      Size = 1
    end
    object cdsSetorORDEM_ESTEIRA: TIntegerField
      FieldName = 'ORDEM_ESTEIRA'
    end
    object cdsSetorAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 6
    end
    object cdsSetorESTEIRA_PADRAO: TStringField
      FieldName = 'ESTEIRA_PADRAO'
      FixedChar = True
      Size = 1
    end
    object cdsSetorIMP_MAT_ANT: TStringField
      FieldName = 'IMP_MAT_ANT'
      FixedChar = True
      Size = 1
    end
    object cdsSetorIMP_MAT_CUSTO: TStringField
      FieldName = 'IMP_MAT_CUSTO'
      FixedChar = True
      Size = 1
    end
  end
  object dsSetor: TDataSource
    DataSet = cdsSetor
    Left = 248
    Top = 32
  end
  object sdsFuncionario: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CODIGO, NOME, DTADMISSAO, DTDEMISSAO, VLR_SALARIO, HRSEMA' +
      'NAIS'#13#10'FROM FUNCIONARIO'#13#10'WHERE SETOR_ID = :SETOR_ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SETOR_ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 104
    Top = 208
    object sdsFuncionarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsFuncionarioDTADMISSAO: TDateField
      FieldName = 'DTADMISSAO'
    end
    object sdsFuncionarioDTDEMISSAO: TDateField
      FieldName = 'DTDEMISSAO'
    end
    object sdsFuncionarioVLR_SALARIO: TFloatField
      FieldName = 'VLR_SALARIO'
    end
    object sdsFuncionarioHRSEMANAIS: TFloatField
      FieldName = 'HRSEMANAIS'
    end
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncionario'
    Left = 216
    Top = 208
    object cdsFuncionarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsFuncionarioDTADMISSAO: TDateField
      FieldName = 'DTADMISSAO'
    end
    object cdsFuncionarioDTDEMISSAO: TDateField
      FieldName = 'DTDEMISSAO'
    end
    object cdsFuncionarioVLR_SALARIO: TFloatField
      FieldName = 'VLR_SALARIO'
      DisplayFormat = '0.00'
    end
    object cdsFuncionarioHRSEMANAIS: TFloatField
      FieldName = 'HRSEMANAIS'
    end
  end
  object dsFuncionario: TDataSource
    DataSet = cdsFuncionario
    Left = 272
    Top = 208
  end
  object sdsFolhaEncargo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FOLHA_ENCARGOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 104
    Top = 256
    object sdsFolhaEncargoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFolhaEncargoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsFolhaEncargoVALOR_PERC: TFloatField
      FieldName = 'VALOR_PERC'
    end
    object sdsFolhaEncargoSIMPLES: TStringField
      FieldName = 'SIMPLES'
      FixedChar = True
      Size = 1
    end
    object sdsFolhaEncargoHORISTA: TStringField
      FieldName = 'HORISTA'
      FixedChar = True
      Size = 1
    end
  end
  object dspFolhaEncargo: TDataSetProvider
    DataSet = sdsFolhaEncargo
    Left = 160
    Top = 256
  end
  object cdsFolhaEncargo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFolhaEncargo'
    Left = 216
    Top = 256
    object cdsFolhaEncargoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFolhaEncargoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsFolhaEncargoVALOR_PERC: TFloatField
      FieldName = 'VALOR_PERC'
    end
    object cdsFolhaEncargoSIMPLES: TStringField
      FieldName = 'SIMPLES'
      FixedChar = True
      Size = 1
    end
    object cdsFolhaEncargoHORISTA: TStringField
      FieldName = 'HORISTA'
      FixedChar = True
      Size = 1
    end
  end
  object dsFolhaEncargo: TDataSource
    DataSet = cdsFolhaEncargo
    Left = 272
    Top = 256
  end
  object dspFuncionario: TDataSetProvider
    DataSet = sdsFuncionario
    Left = 160
    Top = 208
  end
  object sdsProcesso: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.*,'#13#10' case'#13#10'   WHEN P.TIPO = '#39'S'#39' THEN '#39'Semi Acabado'#39#13#10'  ' +
      ' WHEN P.TIPO = '#39'P'#39' THEN '#39'Somente no Pedido'#39#13#10'   WHEN P.TIPO = '#39'T' +
      #39' THEN '#39'Lote/Tal'#227'o'#39#13#10'   WHEN P.TIPO = '#39'O'#39' THEN '#39'OS Servi'#231'o'#39#13#10'   ' +
      'end DESCRICAO_TIPO'#13#10'FROM PROCESSO P'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 331
    object sdsProcessoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProcessoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object sdsProcessoLIMITE_POR_TALAO: TStringField
      FieldName = 'LIMITE_POR_TALAO'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoQTD_LIMITE_POR_TALAO: TIntegerField
      FieldName = 'QTD_LIMITE_POR_TALAO'
    end
    object sdsProcessoAGRUPAR_PEDIDOS: TStringField
      FieldName = 'AGRUPAR_PEDIDOS'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object sdsProcessoQTD_DIAS_PRAZO: TIntegerField
      FieldName = 'QTD_DIAS_PRAZO'
    end
    object sdsProcessoTERCEIRO: TStringField
      FieldName = 'TERCEIRO'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoENCERADO: TStringField
      FieldName = 'ENCERADO'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoENTRADA_AUTO: TStringField
      FieldName = 'ENTRADA_AUTO'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoIMP_TALAO: TStringField
      FieldName = 'IMP_TALAO'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoCALCULA_AREA: TStringField
      FieldName = 'CALCULA_AREA'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoORDEM_MAPA: TIntegerField
      FieldName = 'ORDEM_MAPA'
    end
    object sdsProcessoIMP_CLIENTE: TStringField
      FieldName = 'IMP_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoRETRABALHO: TStringField
      FieldName = 'RETRABALHO'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoID_POSICAO_IMP: TIntegerField
      FieldName = 'ID_POSICAO_IMP'
    end
    object sdsProcessoID_POSICAO_IMP2: TIntegerField
      FieldName = 'ID_POSICAO_IMP2'
    end
    object sdsProcessoESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      Size = 1
    end
    object sdsProcessoESTOQUE_CRU: TStringField
      FieldName = 'ESTOQUE_CRU'
      Size = 1
    end
    object sdsProcessoESTOQUE_DT_ES: TStringField
      FieldName = 'ESTOQUE_DT_ES'
      Size = 1
    end
    object sdsProcessoCONTROLE_MAQUINA: TStringField
      FieldName = 'CONTROLE_MAQUINA'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoMATERIAL_KG: TStringField
      FieldName = 'MATERIAL_KG'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoUSA_CARGA: TStringField
      FieldName = 'USA_CARGA'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object sdsProcessoGERAR_ESTOQUE_TING: TStringField
      FieldName = 'GERAR_ESTOQUE_TING'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoLER_TALAO: TStringField
      FieldName = 'LER_TALAO'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoUSAR_QTD_DOBRA: TStringField
      FieldName = 'USAR_QTD_DOBRA'
      FixedChar = True
      Size = 1
    end
    object sdsProcessoLER_UMAVEZ: TStringField
      FieldName = 'LER_UMAVEZ'
      FixedChar = True
      Size = 1
    end
  end
  object dspProcesso: TDataSetProvider
    DataSet = sdsProcesso
    Options = [poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspProcessoUpdateError
    Left = 112
    Top = 331
  end
  object cdsProcesso: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspProcesso'
    OnCalcFields = cdsProcessoCalcFields
    OnNewRecord = cdsProcessoNewRecord
    Left = 144
    Top = 331
    object cdsProcessoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProcessoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsProcessoLIMITE_POR_TALAO: TStringField
      FieldName = 'LIMITE_POR_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoQTD_LIMITE_POR_TALAO: TIntegerField
      FieldName = 'QTD_LIMITE_POR_TALAO'
    end
    object cdsProcessoAGRUPAR_PEDIDOS: TStringField
      FieldName = 'AGRUPAR_PEDIDOS'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 17
    end
    object cdsProcessoCALCULA_AREA: TStringField
      FieldName = 'CALCULA_AREA'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoQTD_DIAS_PRAZO: TIntegerField
      FieldName = 'QTD_DIAS_PRAZO'
    end
    object cdsProcessoTERCEIRO: TStringField
      FieldName = 'TERCEIRO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoENCERADO: TStringField
      FieldName = 'ENCERADO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoENTRADA_AUTO: TStringField
      FieldName = 'ENTRADA_AUTO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoIMP_TALAO: TStringField
      FieldName = 'IMP_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoORDEM_MAPA: TIntegerField
      FieldName = 'ORDEM_MAPA'
    end
    object cdsProcessoIMP_CLIENTE: TStringField
      FieldName = 'IMP_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoRETRABALHO: TStringField
      FieldName = 'RETRABALHO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoID_POSICAO_IMP: TIntegerField
      FieldName = 'ID_POSICAO_IMP'
    end
    object cdsProcessoclNome_Posicao_Imp: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Posicao_Imp'
      ProviderFlags = []
      Size = 40
      Calculated = True
    end
    object cdsProcessoID_POSICAO_IMP2: TIntegerField
      FieldName = 'ID_POSICAO_IMP2'
    end
    object cdsProcessoclNOme_Posicao_Imp2: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNOme_Posicao_Imp2'
      Size = 40
      Calculated = True
    end
    object cdsProcessoESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      Size = 1
    end
    object cdsProcessoESTOQUE_CRU: TStringField
      FieldName = 'ESTOQUE_CRU'
      Size = 1
    end
    object cdsProcessoESTOQUE_DT_ES: TStringField
      FieldName = 'ESTOQUE_DT_ES'
      Size = 1
    end
    object cdsProcessoCONTROLE_MAQUINA: TStringField
      FieldName = 'CONTROLE_MAQUINA'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoMATERIAL_KG: TStringField
      FieldName = 'MATERIAL_KG'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoUSA_CARGA: TStringField
      FieldName = 'USA_CARGA'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProcessoGERAR_ESTOQUE_TING: TStringField
      FieldName = 'GERAR_ESTOQUE_TING'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoLER_TALAO: TStringField
      FieldName = 'LER_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoUSAR_QTD_DOBRA: TStringField
      FieldName = 'USAR_QTD_DOBRA'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoLER_UMAVEZ: TStringField
      FieldName = 'LER_UMAVEZ'
      FixedChar = True
      Size = 1
    end
  end
  object dsProcesso: TDataSource
    DataSet = cdsProcesso
    Left = 176
    Top = 331
  end
  object qParametros_Ser: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_SER'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 400
    Top = 304
    object qParametros_SerUSA_PROCESSO_OS: TStringField
      FieldName = 'USA_PROCESSO_OS'
      FixedChar = True
      Size = 1
    end
    object qParametros_SerUSA_PROCESSO_SETOR: TStringField
      FieldName = 'USA_PROCESSO_SETOR'
      FixedChar = True
      Size = 1
    end
  end
  object sdsSetor_Proc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM SETOR_PROC'#13#10'WHERE ID = :ID'
    DataSource = dsSetor_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 72
    Top = 120
    object sdsSetor_ProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsSetor_ProcITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsSetor_ProcORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object sdsSetor_ProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object sdsSetor_ProcVLR_HORA: TFloatField
      FieldName = 'VLR_HORA'
    end
    object sdsSetor_ProcUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
  end
  object cdsSetor_Proc: TClientDataSet
    Aggregates = <>
    DataSetField = cdsSetorsdsSetor_Proc
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    OnCalcFields = cdsSetor_ProcCalcFields
    Left = 160
    Top = 120
    object cdsSetor_ProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSetor_ProcITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsSetor_ProcORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object cdsSetor_ProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsSetor_ProcVLR_HORA: TFloatField
      FieldName = 'VLR_HORA'
      DisplayFormat = '0.00'
    end
    object cdsSetor_ProcclNome_Processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Processo'
      Size = 60
      Calculated = True
    end
    object cdsSetor_ProcUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
  end
  object dsSetor_Proc: TDataSource
    DataSet = cdsSetor_Proc
    Left = 232
    Top = 120
  end
  object dsSetor_Mestre: TDataSource
    DataSet = sdsSetor
    Left = 40
    Top = 72
  end
  object qProcesso: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.ID, P.NOME'
      'FROM PROCESSO P'
      'WHERE P.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 600
    Top = 144
    object qProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProcessoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object qParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT USA_LOTE, EMPRESA_SUCATA'
      'FROM PARAMETROS'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 448
    Top = 216
    object qParametrosUSA_LOTE: TStringField
      FieldName = 'USA_LOTE'
      FixedChar = True
      Size = 1
    end
    object qParametrosEMPRESA_SUCATA: TStringField
      FieldName = 'EMPRESA_SUCATA'
      FixedChar = True
      Size = 1
    end
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT LOTE_TEXTIL, TIPO_PROCESSO, LOTE_CALCADO_NOVO'
      'FROM PARAMETROS_LOTE'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 536
    Top = 272
    object qParametros_LoteLOTE_TEXTIL: TStringField
      FieldName = 'LOTE_TEXTIL'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteTIPO_PROCESSO: TStringField
      FieldName = 'TIPO_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteLOTE_CALCADO_NOVO: TStringField
      FieldName = 'LOTE_CALCADO_NOVO'
      FixedChar = True
      Size = 1
    end
  end
  object sdsConsulta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM SETOR '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 488
    Top = 48
  end
  object dspConsulta: TDataSetProvider
    DataSet = sdsConsulta
    Left = 536
    Top = 48
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 600
    Top = 48
    object cdsConsultaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsultaNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsConsultaDESPESA_RATEIO: TFloatField
      FieldName = 'DESPESA_RATEIO'
    end
    object cdsConsultaGERAR_TALAO: TStringField
      FieldName = 'GERAR_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaLIMITE_POR_TALAO: TStringField
      FieldName = 'LIMITE_POR_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaQTD_LIMITE_POR_TALAO: TIntegerField
      FieldName = 'QTD_LIMITE_POR_TALAO'
    end
    object cdsConsultaMOSTRAR_ORC: TStringField
      FieldName = 'MOSTRAR_ORC'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaORDEM_ORC: TIntegerField
      FieldName = 'ORDEM_ORC'
    end
    object cdsConsultaENTRADA_AUT: TStringField
      FieldName = 'ENTRADA_AUT'
      FixedChar = True
      Size = 1
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 656
    Top = 48
  end
  object qParametros_Geral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT EMPRESA_CALCADOS'
      'FROM PARAMETROS_GERAL'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 448
    Top = 160
    object qParametros_GeralEMPRESA_CALCADOS: TStringField
      FieldName = 'EMPRESA_CALCADOS'
      FixedChar = True
      Size = 1
    end
  end
  object qSetor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT FIRST (1) *'
      'FROM SETOR'
      'WHERE ENCERRA_PROD = '#39'S'#39' AND ID <> :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 488
    Top = 384
    object qSetorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qSetorNOME: TStringField
      FieldName = 'NOME'
    end
    object qSetorENCERRA_PROD: TStringField
      FieldName = 'ENCERRA_PROD'
      FixedChar = True
      Size = 1
    end
  end
  object sdsPosicao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME'#13#10'FROM POSICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 608
    Top = 360
  end
  object dspPosicao: TDataSetProvider
    DataSet = sdsPosicao
    Left = 664
    Top = 360
  end
  object cdsPosicao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspPosicao'
    Left = 720
    Top = 360
    object cdsPosicaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPosicaoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object dsPosicao: TDataSource
    DataSet = cdsPosicao
    Left = 776
    Top = 360
  end
  object sdsSetorPrincipal: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME FROM SETOR WHERE COALESCE(TIPO_SETOR,'#39#39') <> '#39'E'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 379
  end
  object dspSetorPrincipal: TDataSetProvider
    DataSet = sdsSetorPrincipal
    Options = [poCascadeUpdates]
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspProcessoUpdateError
    Left = 112
    Top = 379
  end
  object cdsSetorPrincipal: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspSetorPrincipal'
    OnCalcFields = cdsProcessoCalcFields
    OnNewRecord = cdsProcessoNewRecord
    Left = 144
    Top = 379
    object cdsSetorPrincipalID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSetorPrincipalNOME: TStringField
      FieldName = 'NOME'
    end
  end
  object dsSetorPrincipal: TDataSource
    DataSet = cdsSetorPrincipal
    Left = 176
    Top = 379
  end
  object sdsUnidade: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT UNIDADE, NOME FROM UNIDADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 432
  end
  object cdsUnidade: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'UNIDADE'
    Params = <>
    ProviderName = 'dspUnidade'
    Left = 144
    Top = 432
    object cdsUnidadeUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Required = True
      Size = 6
    end
    object cdsUnidadeNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object dsUnidade: TDataSource
    DataSet = cdsUnidade
    Left = 176
    Top = 432
  end
  object dspUnidade: TDataSetProvider
    DataSet = sdsUnidade
    Left = 112
    Top = 432
  end
end
