object frmConsProduto_Vendedor_Fat: TfrmConsProduto_Vendedor_Fat
  Left = 214
  Top = 156
  Width = 928
  Height = 493
  Caption = 'Consulta Produto Faturado Por Vendedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 52
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label6: TLabel
      Left = 38
      Top = 12
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Representante:'
    end
    object Label1: TLabel
      Left = 25
      Top = 30
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Emiss'#227'o Inicial:'
    end
    object Label2: TLabel
      Left = 253
      Top = 32
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
    end
    object btnConsultar: TNxButton
      Left = 382
      Top = 26
      Width = 111
      Height = 26
      Caption = 'Efetuar Pesquisa'
      TabOrder = 3
      OnClick = btnConsultarClick
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 111
      Top = 4
      Width = 267
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = DMComissaoVend.dsVendedor
      ParentCtl3D = False
      TabOrder = 0
    end
    object DateEdit1: TDateEdit
      Left = 112
      Top = 24
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 279
      Top = 24
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 2
    end
    object btnExcel: TNxButton
      Left = 494
      Top = 26
      Width = 111
      Height = 26
      Caption = 'Excel'
      TabOrder = 4
      OnClick = btnExcelClick
    end
    object ckVendedor: TCheckBox
      Left = 411
      Top = 3
      Width = 152
      Height = 17
      Caption = 'Sem Vendedor'
      TabOrder = 5
      OnClick = ckVendedorClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 52
    Width = 920
    Height = 304
    Align = alClient
    Ctl3D = False
    DataSource = DMComissaoVend.dsConsProdFat
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 15
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 20
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FILIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Filial'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCFOP'
        Title.Alignment = taCenter
        Title.Caption = 'CFOP'
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMNOTA'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Title.Alignment = taCenter
        Title.Caption = 'S'#233'rie'
        Width = 31
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTEMISSAO'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. do Item'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERC_NOTA'
        Title.Alignment = taCenter
        Title.Caption = '% Informado na Nota'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERC_ITEM_NOTA'
        Title.Alignment = taCenter
        Title.Caption = '% Informado no  Produto da Nota'
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERC_CADASTRADO'
        Title.Alignment = taCenter
        Title.Caption = '% Cadastro do Produto'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_PRODUTO_CLI'
        Title.Alignment = taCenter
        Title.Caption = '% Cadastrado do Produto Cliente'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_PRODUTO'
        Title.Alignment = taCenter
        Title.Caption = 'ID Produto'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTO'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Width = 370
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cliente'
        Width = 233
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_VENDEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Vendedor'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_FILIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Filial'
        Width = 129
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_CLIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'ID Cliente'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_VENDEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'ID Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_REG'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 356
    Width = 920
    Height = 106
    Align = alBottom
    Color = clSilver
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 13
      Width = 111
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Total Faturado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 379
      Top = 13
      Width = 147
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. a Pagar de Comiss'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ceVlr_Total: TCurrencyEdit
      Left = 124
      Top = 5
      Width = 121
      Height = 21
      AutoSize = False
      Color = clSilver
      Ctl3D = False
      DisplayFormat = '###,###,##0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object ceVlr_Comissao: TCurrencyEdit
      Left = 527
      Top = 5
      Width = 121
      Height = 21
      AutoSize = False
      Color = clSilver
      Ctl3D = False
      DisplayFormat = '###,###,##0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object NxButton1: TNxButton
      Left = 693
      Top = 73
      Width = 75
      Caption = 'Recalcular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = NxButton1Click
    end
    object gbxVendedor: TRzGroupBox
      Left = 18
      Top = 34
      Width = 235
      Height = 64
      BorderColor = clNavy
      BorderInner = fsButtonUp
      BorderOuter = fsBump
      Caption = '  Valores da Nota Fiscal '
      Color = clSilver
      Ctl3D = True
      FlatColor = clNavy
      FlatColorAdjustment = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      VisualStyle = vsGradient
      object Label4: TLabel
        Left = 24
        Top = 25
        Width = 75
        Height = 13
        Caption = 'Base Comiss'#227'o:'
      end
      object Label5: TLabel
        Left = 9
        Top = 45
        Width = 90
        Height = 13
        Caption = 'Vlr. Sem Comiss'#227'o:'
      end
      object ceBase_Comissao: TCurrencyEdit
        Left = 100
        Top = 17
        Width = 116
        Height = 21
        AutoSize = False
        Color = clSilver
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 0
      end
      object ceVlr_Sem_Comissao: TCurrencyEdit
        Left = 100
        Top = 37
        Width = 116
        Height = 21
        AutoSize = False
        Color = clSilver
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 1
      end
    end
    object RzGroupBox1: TRzGroupBox
      Left = 389
      Top = 34
      Width = 294
      Height = 64
      BorderColor = clRed
      BorderInner = fsButtonUp
      BorderOuter = fsBump
      Caption = '  Valores Conforme Percentuais Informados no Produto '
      Color = clSilver
      Ctl3D = True
      FlatColor = clRed
      FlatColorAdjustment = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      VisualStyle = vsGradient
      object Label8: TLabel
        Left = 24
        Top = 25
        Width = 75
        Height = 13
        Caption = 'Base Comiss'#227'o:'
      end
      object Label9: TLabel
        Left = 9
        Top = 45
        Width = 90
        Height = 13
        Caption = 'Vlr. Sem Comiss'#227'o:'
      end
      object ceBase_Comissao_Prod: TCurrencyEdit
        Left = 100
        Top = 17
        Width = 116
        Height = 21
        AutoSize = False
        Color = clSilver
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 0
      end
      object ceVlr_Sem_Comissao_Prod: TCurrencyEdit
        Left = 100
        Top = 37
        Width = 116
        Height = 21
        AutoSize = False
        Color = clSilver
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 1
      end
    end
  end
end
