object DMConsPedidoCom: TDMConsPedidoCom
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 416
  Top = 168
  Height = 406
  Width = 546
  object sdsConsPedido: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select PED.ID ID_PEDIDO, PED.ID_CLIENTE, PED.DTEMISSAO, PED.DTEN' +
      'TREGA, PED.ID_CONDPGTO, PED.ID_TIPO_COBRANCA,'#13#10'       CLI.NOME N' +
      'OME_CLIENTE, CLI.FANTASIA, PED.FILIAL, COND.NOME NOME_CONDPAGTO,' +
      ' TCOB.NOME NOME_TIPO_COBRANCA,'#13#10'       coalesce(PED.AMOSTRA,'#39'N'#39')' +
      ' AMOSTRA, PED.NUM_PEDIDO, COND.TIPO TIPO_PRAZO, PED.QTD, PED.VLR' +
      '_ITENS, PED.VLR_DESCONTO, PED.VLR_TOTAL,'#13#10'       case'#13#10'         ' +
      'when COND.TIPO = '#39'V'#39' then '#39'A Vista'#39#13#10'         when COND.TIPO = '#39 +
      'P'#39' then '#39'A Prazo'#39#13#10'         else '#39#39#13#10'       end DESC_PRAZO'#13#10'from' +
      ' PEDIDO PED'#13#10'left join PESSOA CLI on PED.ID_CLIENTE = CLI.CODIGO' +
      #13#10'left join CONDPGTO COND on (PED.ID_CONDPGTO = COND.ID)'#13#10'left j' +
      'oin TIPOCOBRANCA TCOB on PED.ID_TIPO_COBRANCA = TCOB.ID  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 38
    Top = 45
  end
  object dspConsPedido: TDataSetProvider
    DataSet = sdsConsPedido
    Left = 72
    Top = 45
  end
  object cdsConsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPedido'
    Left = 121
    Top = 45
    object cdsConsPedidoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsConsPedidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsConsPedidoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsPedidoDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsPedidoID_CONDPGTO: TIntegerField
      FieldName = 'ID_CONDPGTO'
    end
    object cdsConsPedidoID_TIPO_COBRANCA: TIntegerField
      FieldName = 'ID_TIPO_COBRANCA'
    end
    object cdsConsPedidoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsPedidoFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object cdsConsPedidoFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsPedidoNOME_CONDPAGTO: TStringField
      FieldName = 'NOME_CONDPAGTO'
      Size = 40
    end
    object cdsConsPedidoNOME_TIPO_COBRANCA: TStringField
      FieldName = 'NOME_TIPO_COBRANCA'
      Size = 30
    end
    object cdsConsPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsPedidoTIPO_PRAZO: TStringField
      FieldName = 'TIPO_PRAZO'
      FixedChar = True
      Size = 1
    end
    object cdsConsPedidoDESC_PRAZO: TStringField
      FieldName = 'DESC_PRAZO'
      Required = True
      FixedChar = True
      Size = 7
    end
    object cdsConsPedidoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsPedidoVLR_ITENS: TFloatField
      FieldName = 'VLR_ITENS'
    end
    object cdsConsPedidoVLR_DESCONTO: TFloatField
      FieldName = 'VLR_DESCONTO'
    end
    object cdsConsPedidoVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsConsPedidoAMOSTRA: TStringField
      FieldName = 'AMOSTRA'
      Size = 1
    end
  end
  object dsConsPedido: TDataSource
    DataSet = cdsConsPedido
    Left = 161
    Top = 45
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
    ReportOptions.CreateDate = 42052.436473541700000000
    ReportOptions.LastChange = 44062.674145925930000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 226
    Top = 166
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
    Left = 289
    Top = 178
  end
  object frxConsPedido: TfrxDBDataset
    UserName = 'frxConsPedido'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PEDIDO=ID_PEDIDO'
      'ID_CLIENTE=ID_CLIENTE'
      'DTEMISSAO=DTEMISSAO'
      'DTENTREGA=DTENTREGA'
      'ID_CONDPGTO=ID_CONDPGTO'
      'ID_TIPO_COBRANCA=ID_TIPO_COBRANCA'
      'NOME_CLIENTE=NOME_CLIENTE'
      'FANTASIA=FANTASIA'
      'FILIAL=FILIAL'
      'NOME_CONDPAGTO=NOME_CONDPAGTO'
      'NOME_TIPO_COBRANCA=NOME_TIPO_COBRANCA'
      'AMOSTRA=AMOSTRA'
      'NUM_PEDIDO=NUM_PEDIDO'
      'TIPO_PRAZO=TIPO_PRAZO'
      'DESC_PRAZO=DESC_PRAZO'
      'QTD=QTD'
      'VLR_ITENS=VLR_ITENS'
      'VLR_DESCONTO=VLR_DESCONTO'
      'VLR_TOTAL=VLR_TOTAL')
    DataSource = dsConsPedido
    BCDToCurrency = False
    Left = 217
    Top = 223
  end
end
