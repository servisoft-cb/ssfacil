object DMComissaoVend: TDMComissaoVend
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 285
  Top = 205
  Height = 394
  Width = 984
  object sdsProduto_Comissao_Vend: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'select *'#13#10'from PRODUTO_COMISSAO_VEND'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 76
    Top = 43
    object sdsProduto_Comissao_VendID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProduto_Comissao_VendITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProduto_Comissao_VendID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object sdsProduto_Comissao_VendPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
  end
  object dspProduto_Comissao_Vend: TDataSetProvider
    DataSet = sdsProduto_Comissao_Vend
    UpdateMode = upWhereKeyOnly
    Left = 137
    Top = 43
  end
  object cdsProduto_Comissao_Vend: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspProduto_Comissao_Vend'
    Left = 192
    Top = 43
    object cdsProduto_Comissao_VendID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProduto_Comissao_VendITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProduto_Comissao_VendID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsProduto_Comissao_VendPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
  end
  object dsProduto_Comissao_Vend: TDataSource
    DataSet = cdsProduto_Comissao_Vend
    Left = 255
    Top = 43
  end
  object sdsVendedor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.codigo, P.nome,  P.perc_comissao'#13#10'FROM PESSOA P'#13#10'WHERE ' +
      'P.tp_vendedor = '#39'S'#39#13#10'  AND P.inativo = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 451
    Top = 38
  end
  object dspVendedor: TDataSetProvider
    DataSet = sdsVendedor
    UpdateMode = upWhereKeyOnly
    Left = 512
    Top = 38
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspVendedor'
    Left = 565
    Top = 37
    object cdsVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsVendedorPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 630
    Top = 38
  end
  object dspConsProduto: TDataSetProvider
    DataSet = sdsConsProduto
    UpdateMode = upWhereKeyOnly
    Left = 512
    Top = 94
  end
  object cdsConsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspConsProduto'
    Left = 565
    Top = 93
    object cdsConsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsConsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsProdutoTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      FixedChar = True
      Size = 12
    end
    object cdsConsProdutoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
  end
  object dsConsProduto: TDataSource
    DataSet = cdsConsProduto
    Left = 631
    Top = 94
  end
  object qVerProdVend: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_VENDEDOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(1) CONTADOR'
      'FROM produto_comissao_vend P'
      'WHERE P.ID = :ID'
      '  AND P.ID_VENDEDOR = :ID_VENDEDOR')
    SQLConnection = dmDatabase.scoDados
    Left = 748
    Top = 147
    object qVerProdVendCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object sdsConsProduto: TSQLDataSet
    CommandText = 
      'SELECT P.ID, P.NOME, P.REFERENCIA,'#13#10'case'#13#10'  when P.TIPO_REG = '#39'P' +
      #39' Then '#39'Produto'#39#13#10'  when P.TIPO_REG = '#39'S'#39' Then '#39'Semiacabado'#39#13#10'  ' +
      'end Tipo_Produto, PV.PERC_COMISSAO'#13#10'FROM PRODUTO P'#13#10'left join pr' +
      'oduto_comissao_vend pv'#13#10'on p.id = pv.id'#13#10'WHERE P.INATIVO = '#39'N'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 457
    Top = 95
  end
  object sdsVendCons: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.codigo, P.nome,  P.perc_comissao'#13#10'FROM PESSOA P'#13#10'WHERE ' +
      'P.tp_vendedor = '#39'S'#39#13#10'  AND P.inativo = '#39'N'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 350
    Top = 182
  end
  object dspVendCons: TDataSetProvider
    DataSet = sdsVendCons
    UpdateMode = upWhereKeyOnly
    Left = 412
    Top = 181
  end
  object cdsVendCons: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODIGO'
    Params = <>
    ProviderName = 'dspVendCons'
    Left = 465
    Top = 180
    object cdsVendConsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendConsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsVendConsPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
  end
  object dsVendCons: TDataSource
    DataSet = cdsVendCons
    Left = 529
    Top = 181
  end
  object sdsProdCons: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.ID, P.NOME, P.REFERENCIA,'#13#10'case'#13#10'  when P.TIPO_REG = '#39'P' +
      #39' Then '#39'Produto'#39#13#10'  when P.TIPO_REG = '#39'S'#39' Then '#39'Semiacabado'#39#13#10'  ' +
      'end Tipo_Produto, PV.PERC_COMISSAO, PV.id_vendedor, p.tipo_reg'#13#10 +
      'FROM PRODUTO P'#13#10'left join produto_comissao_vend pv'#13#10'on p.id = pv' +
      '.id'#13#10' and (pv.id_vendedor = :id_vendedor)'#13#10'WHERE P.INATIVO = '#39'N'#39 +
      #13#10'  and (p.tipo_reg = :Tipo_REG or p.tipo_reg = :TIPO_REG2)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id_vendedor'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Tipo_REG'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_REG2'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 342
    Top = 256
  end
  object dspProdCons: TDataSetProvider
    DataSet = sdsProdCons
    UpdateMode = upWhereKeyOnly
    Left = 406
    Top = 256
  end
  object cdsProdCons: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'PERC_COMISSAO'
    Params = <>
    ProviderName = 'dspProdCons'
    Left = 457
    Top = 255
    object cdsProdConsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdConsNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsProdConsREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProdConsTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      FixedChar = True
      Size = 11
    end
    object cdsProdConsPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object cdsProdConsID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
  end
  object dsProdCons: TDataSource
    DataSet = cdsProdCons
    Left = 522
    Top = 256
  end
  object frxReport1: TfrxReport
    Tag = 1
    Version = '5.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44020.936356018500000000
    ReportOptions.LastChange = 44020.965749224540000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 758
    Top = 224
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
    Left = 800
    Top = 223
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
    Left = 831
    Top = 223
  end
  object frxVendCons: TfrxDBDataset
    UserName = 'frxVendCons'
    OnNext = frxVendConsNext
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'NOME=NOME'
      'PERC_COMISSAO=PERC_COMISSAO')
    OnOpen = frxVendConsOpen
    DataSource = dsVendCons
    BCDToCurrency = False
    Left = 760
    Top = 268
  end
  object frxProdCons: TfrxDBDataset
    UserName = 'frxProdCons'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NOME=NOME'
      'REFERENCIA=REFERENCIA'
      'TIPO_PRODUTO=TIPO_PRODUTO'
      'PERC_COMISSAO=PERC_COMISSAO'
      'ID_VENDEDOR=ID_VENDEDOR')
    DataSource = dsProdCons
    BCDToCurrency = False
    Left = 801
    Top = 267
  end
end
