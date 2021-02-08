object frmConsQtdOS_Nota: TfrmConsQtdOS_Nota
  Left = 250
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmConsQtdOS_Nota'
  ClientHeight = 390
  ClientWidth = 941
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NxPanel1: TNxPanel
    Left = 0
    Top = 351
    Width = 941
    Height = 39
    Align = alBottom
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 12
      Width = 136
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtd. Lan'#231'ada nas OS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 160
      Top = 12
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 262
      Top = 12
      Width = 142
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtd. Lan'#231'ada na Nota:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 410
      Top = 12
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 0
    Width = 941
    Height = 351
    Align = alClient
    Ctl3D = False
    DataSource = dsConsTotalOS
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUM_OS'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' OS'
        Title.Color = 8454016
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTEMISSAO'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Emiss'#227'o'
        Title.Color = 8454016
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_PECAS'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Pe'#231'as'
        Title.Color = 8454016
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_NOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Nota'
        Title.Color = 8454016
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_PRODUTO'
        Title.Alignment = taCenter
        Title.Caption = 'ID Produto'
        Title.Color = 8454016
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Title.Color = 8454016
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTO'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Title.Color = 8454016
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 395
        Visible = True
      end>
  end
  object sdsConsTotalOS: TSQLDataSet
    CommandText = 
      'select O.ID, O.NUM_OS, O.DTEMISSAO, I.QTD QTD_PECAS, I.QTD_NOTA,' +
      ' I.ID_PRODUTO, I.REFERENCIA, I.NOME_PRODUTO'#13#10'from ORDEMSERVICO O' +
      #13#10'inner join ORDEMSERVICO_ITENS I on O.ID = I.ID'#13#10'where O.NUM_NO' +
      'TA = :NUM_NOTA and'#13#10'      O.SERIE_NOTA = :SERIE_NOTA and'#13#10'      ' +
      'O.ID_CLIENTE = :ID_CLIENTE'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERIE_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 227
    Top = 138
  end
  object dspConsTotalOS: TDataSetProvider
    DataSet = sdsConsTotalOS
    Left = 270
    Top = 137
  end
  object cdsConsTotalOS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspConsTotalOS'
    Left = 307
    Top = 136
    object cdsConsTotalOSID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsTotalOSNUM_OS: TIntegerField
      FieldName = 'NUM_OS'
    end
    object cdsConsTotalOSDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsTotalOSQTD_PECAS: TFloatField
      FieldName = 'QTD_PECAS'
    end
    object cdsConsTotalOSQTD_NOTA: TFloatField
      FieldName = 'QTD_NOTA'
    end
    object cdsConsTotalOSID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsTotalOSREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsTotalOSNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsTotalOSagTotal_Nota: TAggregateField
      FieldName = 'agTotal_Nota'
      Active = True
      Expression = 'SUM(QTD_NOTA)'
    end
  end
  object dsConsTotalOS: TDataSource
    DataSet = cdsConsTotalOS
    Left = 350
    Top = 135
  end
end
