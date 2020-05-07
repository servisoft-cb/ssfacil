object DMComissao: TDMComissao
  OldCreateOrder = False
  Left = 274
  Top = 199
  Height = 311
  Width = 885
  object sdsComissao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select AUX.*,'#13#10'       (select first 1 M.PERC_COMISSAO'#13#10'        f' +
      'rom METAS_COMISSAO M'#13#10'        where AUX.VLR_TOTAL < M.VALOR) PER' +
      'C_COMISSAO'#13#10'from (select C.ID_VENDEDOR, sum(C.VLR_TOTAL) VLR_TOT' +
      'AL, VEND.NOME NOME_VENDEDOR'#13#10'      from CUPOMFISCAL C'#13#10'      lef' +
      't join PESSOA VEND on C.ID_VENDEDOR = VEND.CODIGO'#13#10'      where (' +
      'C.TIPO = '#39'NFC'#39' or C.TIPO = '#39'CNF'#39') and'#13#10'            C.DTEMISSAO b' +
      'etween :DATA1 and :DATA2 and'#13#10'            C.CANCELADO = '#39'N'#39' and'#13 +
      #10'            coalesce(C.NFEDENEGADA, '#39'N'#39') = '#39'N'#39' and'#13#10'           ' +
      ' (C.ID_VENDEDOR = :ID_VENDEDOR or :ID_VENDEDOR = 0)'#13#10'      group' +
      ' by C.ID_VENDEDOR, VEND.NOME) AUX'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_VENDEDOR'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 8
  end
  object dspComissao: TDataSetProvider
    DataSet = sdsComissao
    Left = 104
    Top = 8
  end
  object cdsComissao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissao'
    OnCalcFields = cdsComissaoCalcFields
    Left = 145
    Top = 8
    object cdsComissaoID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsComissaoVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsComissaoNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 60
    end
    object cdsComissaoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object cdsComissaoclVlr_Comissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'clVlr_Comissao'
      Calculated = True
    end
  end
  object dsComissao: TDataSource
    DataSet = cdsComissao
    Left = 184
    Top = 8
  end
  object sdsVendedor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select V.CODIGO, V.NOME'#13#10'from PESSOA V'#13#10'where V.TP_VENDEDOR = '#39'S' +
      #39'   '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 64
  end
  object dspVendedor: TDataSetProvider
    DataSet = sdsVendedor
    Left = 104
    Top = 64
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedor'
    OnCalcFields = cdsComissaoCalcFields
    Left = 144
    Top = 64
    object cdsVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 184
    Top = 64
  end
  object sdsComissao_Det: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select C.ID_VENDEDOR, C.VLR_TOTAL, VEND.NOME NOME_VENDEDOR, C.NU' +
      'MCUPOM, C.DTEMISSAO, C.TIPO,'#13#10'       case'#13#10'         when C.CLIEN' +
      'TE_NOME is null then '#39'CONSUMIDOR'#39#13#10'         else C.CLIENTE_NOME'#13 +
      #10'       end NOME_CLIENTE, C.ID, C.serie, C.terminal_id'#13#10'from CUP' +
      'OMFISCAL C'#13#10'left join PESSOA VEND on C.ID_VENDEDOR = VEND.CODIGO' +
      #13#10'where (C.TIPO = '#39'NFC'#39' or C.TIPO = '#39'CNF'#39') and'#13#10'      C.DTEMISSA' +
      'O between :DATA1 and :DATA2 and'#13#10'      C.CANCELADO = '#39'N'#39' and'#13#10'  ' +
      '    coalesce(C.NFEDENEGADA, '#39'N'#39') = '#39'N'#39' and'#13#10'      (C.ID_VENDEDOR' +
      ' = :ID_VENDEDOR or :ID_VENDEDOR = 0)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_VENDEDOR'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 120
  end
  object dspComissao_Det: TDataSetProvider
    DataSet = sdsComissao_Det
    Left = 96
    Top = 120
  end
  object cdsComissao_Det: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComissao_Det'
    OnCalcFields = cdsComissaoCalcFields
    Left = 136
    Top = 120
    object cdsComissao_DetID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsComissao_DetVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsComissao_DetNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 60
    end
    object cdsComissao_DetNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object cdsComissao_DetDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsComissao_DetTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsComissao_DetNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 30
    end
    object cdsComissao_DetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsComissao_DetSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsComissao_DetTERMINAL_ID: TSmallintField
      FieldName = 'TERMINAL_ID'
    end
  end
  object dsComissao_Det: TDataSource
    DataSet = cdsComissao_Det
    Left = 176
    Top = 120
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
    ReportOptions.CreateDate = 43918.638275659700000000
    ReportOptions.LastChange = 43918.683245219910000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 456
    Top = 120
  end
  object frxComissao: TfrxDBDataset
    UserName = 'frxComissao'
    OnFirst = frxComissaoFirst
    OnNext = frxComissaoFirst
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_VENDEDOR=ID_VENDEDOR'
      'VLR_TOTAL=VLR_TOTAL'
      'NOME_VENDEDOR=NOME_VENDEDOR'
      'PERC_COMISSAO=PERC_COMISSAO'
      'clVlr_Comissao=clVlr_Comissao')
    DataSource = dsComissao
    BCDToCurrency = False
    Left = 456
    Top = 168
  end
  object frxComissao_Det: TfrxDBDataset
    UserName = 'frxComissao_Det'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_VENDEDOR=ID_VENDEDOR'
      'VLR_TOTAL=VLR_TOTAL'
      'NOME_VENDEDOR=NOME_VENDEDOR'
      'NUMCUPOM=NUMCUPOM'
      'DTEMISSAO=DTEMISSAO'
      'TIPO=TIPO'
      'NOME_CLIENTE=NOME_CLIENTE'
      'ID=ID'
      'SERIE=SERIE'
      'TERMINAL_ID=TERMINAL_ID')
    DataSource = dsComissao_Det
    BCDToCurrency = False
    Left = 504
    Top = 168
  end
end
