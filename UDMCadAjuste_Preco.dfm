object DMCadAjuste_Preco: TDMCadAjuste_Preco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 247
  Top = 40
  Height = 649
  Width = 1001
  object sdsAjuste_Preco: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM AJUSTE_PRECO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 128
    Top = 5
    object sdsAjuste_PrecoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsAjuste_PrecoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsAjuste_PrecoDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsAjuste_PrecoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sdsAjuste_PrecoPERC_AJUSTE: TFloatField
      FieldName = 'PERC_AJUSTE'
    end
    object sdsAjuste_PrecoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsAjuste_PrecoDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object sdsAjuste_PrecoHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
  end
  object dspAjuste_Preco: TDataSetProvider
    DataSet = sdsAjuste_Preco
    Options = [poCascadeDeletes]
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspAjuste_PrecoUpdateError
    Left = 200
    Top = 5
  end
  object cdsAjuste_Preco: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspAjuste_Preco'
    Left = 259
    Top = 8
    object cdsAjuste_PrecoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAjuste_PrecoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsAjuste_PrecoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsAjuste_PrecoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsAjuste_PrecoPERC_AJUSTE: TFloatField
      FieldName = 'PERC_AJUSTE'
    end
    object cdsAjuste_PrecoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsAjuste_PrecoDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsAjuste_PrecoHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsAjuste_PrecosdsAjuste_Preco_Itens: TDataSetField
      FieldName = 'sdsAjuste_Preco_Itens'
    end
  end
  object dsAjuste_Preco: TDataSource
    DataSet = cdsAjuste_Preco
    Left = 336
    Top = 5
  end
  object dsAjuste_Preco_Mestre: TDataSource
    DataSet = sdsAjuste_Preco
    Left = 64
    Top = 41
  end
  object sdsAjuste_Preco_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM AJUSTE_PRECO_ITENS'#13#10'WHERE ID = :ID'
    DataSource = dsAjuste_Preco_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 128
    Top = 88
    object sdsAjuste_Preco_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsAjuste_Preco_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsAjuste_Preco_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsAjuste_Preco_ItensPRECO_NOVO: TFloatField
      FieldName = 'PRECO_NOVO'
    end
    object sdsAjuste_Preco_ItensPRECO_ANT: TFloatField
      FieldName = 'PRECO_ANT'
    end
  end
  object cdsAjuste_Preco_Itens: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsAjuste_PrecosdsAjuste_Preco_Itens
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    OnCalcFields = cdsAjuste_Preco_ItensCalcFields
    Left = 193
    Top = 88
    object cdsAjuste_Preco_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAjuste_Preco_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAjuste_Preco_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsAjuste_Preco_ItensPRECO_NOVO: TFloatField
      FieldName = 'PRECO_NOVO'
      DisplayFormat = '0.00####'
    end
    object cdsAjuste_Preco_ItensPRECO_ANT: TFloatField
      FieldName = 'PRECO_ANT'
      DisplayFormat = '0.00####'
    end
    object cdsAjuste_Preco_ItensclNome_Produto: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Produto'
      Size = 60
      Calculated = True
    end
  end
  object dsAjuste_Preco_Itens: TDataSource
    DataSet = cdsAjuste_Preco_Itens
    Left = 257
    Top = 88
  end
  object sdsConsulta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select P.*,'#13#10'       case'#13#10'         when P.TIPO = '#39'A'#39' then '#39'Aumen' +
      'to'#39#13#10'         when P.TIPO = '#39'D'#39' then '#39'Redu'#231#231'ao'#39#13#10'         else '#39 +
      #39#13#10'       end DESC_TIPO'#13#10'from AJUSTE_PRECO P  '#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 474
    Top = 10
  end
  object dspConsulta: TDataSetProvider
    DataSet = sdsConsulta
    Left = 504
    Top = 8
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 544
    Top = 8
    object cdsConsultaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsConsultaDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsConsultaTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaPERC_AJUSTE: TFloatField
      FieldName = 'PERC_AJUSTE'
    end
    object cdsConsultaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsConsultaDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsConsultaHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsConsultaDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
      Required = True
      FixedChar = True
      Size = 8
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 584
    Top = 8
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select P.ID ID_PRODUTO, P.NOME NOME_PRODUTO, P.REFERENCIA, P.PRE' +
      'CO_VENDA, G.NOME NOME_GRUPO, G.ID ID_GRUPO, G.SUPERIOR,'#13#10'       ' +
      'P.ID_MARCA, M.NOME NOME_MARCA'#13#10'from PRODUTO P'#13#10'left join GRUPO G' +
      ' on P.ID_GRUPO = G.ID'#13#10'left join MARCA M on P.ID_MARCA = M.ID'#13#10'w' +
      'here P.INATIVO = '#39'N'#39' '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 476
    Top = 266
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 512
    Top = 264
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PRODUTO'
    Params = <>
    ProviderName = 'dspProduto'
    Left = 551
    Top = 264
    object cdsProdutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsProdutoNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProdutoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      DisplayFormat = '0.00###'
    end
    object cdsProdutoNOME_GRUPO: TStringField
      FieldName = 'NOME_GRUPO'
      Size = 40
    end
    object cdsProdutoID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
    object cdsProdutoSUPERIOR: TStringField
      FieldName = 'SUPERIOR'
    end
    object cdsProdutoID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
    end
    object cdsProdutoNOME_MARCA: TStringField
      FieldName = 'NOME_MARCA'
      Size = 40
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 592
    Top = 264
  end
  object qProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ID, NOME'
      'FROM PRODUTO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 155
    Top = 194
    object qProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
  object qGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select G.ID, G.NOME, G.SUPERIOR, G.COD_PRINCIPAL, G.CODIGO, G.TI' +
        'PO'
      'from GRUPO G'
      'where G.ID = :ID   ')
    SQLConnection = dmDatabase.scoDados
    Left = 227
    Top = 202
    object qGrupoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qGrupoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object qGrupoSUPERIOR: TStringField
      FieldName = 'SUPERIOR'
    end
    object qGrupoCOD_PRINCIPAL: TIntegerField
      FieldName = 'COD_PRINCIPAL'
    end
    object qGrupoCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object qGrupoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object qUltimo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(ID) ID'
      'FROM AJUSTE_PRECO')
    SQLConnection = dmDatabase.scoDados
    Left = 557
    Top = 136
    object qUltimoID: TIntegerField
      FieldName = 'ID'
    end
  end
end
