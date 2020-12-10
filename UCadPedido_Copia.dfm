object frmCadPedido_Copia: TfrmCadPedido_Copia
  Left = 198
  Top = 102
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Copiar Pedido'
  ClientHeight = 454
  ClientWidth = 933
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 8
    Width = 3
    Height = 13
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 437
    Width = 933
    Height = 17
    Align = alBottom
    TabOrder = 0
  end
  object NxPanel1: TNxPanel
    Left = 0
    Top = 396
    Width = 933
    Height = 41
    Align = alBottom
    UseDockManager = False
    ParentBackground = False
    TabOrder = 1
    object btnCopiar: TNxButton
      Left = 354
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Copiar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnCopiarClick
    end
    object btnCancelar: TNxButton
      Left = 472
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 60
    Width = 933
    Height = 287
    Align = alClient
    Ctl3D = False
    DataSource = DMCopiaPedido.dsPedido_Itens
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    TabOrder = 2
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
    ExOptions = [eoCheckBoxSelect, eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 23
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 7
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Item'
        Title.Color = 8454143
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_PRODUTO'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'ID Produto'
        Title.Color = 8454143
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEPRODUTO'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Title.Color = 8454143
        Width = 368
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Title.Alignment = taCenter
        Title.Caption = 'Quantidade'
        Title.Color = 8454143
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Unidade'
        Title.Color = 8454143
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTENTREGA'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Entrega'
        Title.Color = 8454143
        Width = 95
        Visible = True
      end>
  end
  object SMDBGrid6: TSMDBGrid
    Left = 0
    Top = 347
    Width = 933
    Height = 49
    Align = alBottom
    Ctl3D = False
    DataSource = DMCopiaPedido.dsPedido_Item_Tipo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlue
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
    DefaultRowHeight = 16
    ScrollBars = ssHorizontal
    ColCount = 10
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO_TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Title.Color = 16764831
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPLEMENTO_NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Title.Color = 16764831
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAMETRO'
        Title.Alignment = taCenter
        Title.Caption = #216
        Title.Color = 16764831
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAMETRO_EXT'
        Title.Alignment = taCenter
        Title.Caption = #216' Ext.'
        Title.Color = 16764831
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAMETRO_INT'
        Title.Alignment = taCenter
        Title.Caption = #216' Int.'
        Title.Color = 16764831
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAREDE'
        Title.Alignment = taCenter
        Title.Color = 16764831
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPRIMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'X (mm)'
        Title.Color = 16764831
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LARGURA'
        Title.Alignment = taCenter
        Title.Caption = 'Y (mm)'
        Title.Color = 16764831
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESPESSURA'
        Title.Alignment = taCenter
        Title.Caption = '# (mm)'
        Title.Color = 16764831
        Width = 68
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 933
    Height = 60
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 4
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 159
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Pedido Origem da C'#243'pia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 376
      Top = 40
      Width = 66
      Height = 13
      Caption = 'Data Entrega:'
      Visible = False
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 188
      Top = 8
      Width = 97
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clSilver
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 184
      Top = 36
      Width = 153
      Height = 17
      Caption = 'Usar nova data de entrega'
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object DateEdit1: TDateEdit
      Left = 444
      Top = 32
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      Visible = False
    end
  end
end
