object frmConsEstoque_Compras: TfrmConsEstoque_Compras
  Left = 225
  Top = 156
  Width = 928
  Height = 478
  Caption = 'Consulta Estoque x Compras x Pedidos'
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
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 91
    Width = 920
    Height = 356
    Align = alClient
    BevelWidth = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '1.6.0.3'
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    FullHeight = 0
    object SMDBGrid1: TSMDBGrid
      Left = 10
      Top = 10
      Width = 900
      Height = 336
      Align = alClient
      Ctl3D = False
      DataSource = DMCompras.dsEstoque_Compras
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = SMDBGrid1TitleClick
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
      OnGetCellParams = SMDBGrid1GetCellParams
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 14
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'ID Produto'
          Title.Color = clActiveCaption
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Produto'
          Title.Color = clActiveCaption
          Width = 243
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Unid.'
          Title.Color = clActiveCaption
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_COR'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Cor'
          Title.Color = clActiveCaption
          Width = 188
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_FORNECEDOR'
          Title.Alignment = taCenter
          Title.Caption = 'ID Forn.'
          Title.Color = clActiveCaption
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FORNECEDOR'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Fornecedor'
          Title.Color = clActiveCaption
          Width = 215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAMANHO'
          Title.Alignment = taCenter
          Title.Caption = 'Tamanho'
          Title.Color = clActiveCaption
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_ESTOQUE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Estoque'
          Title.Color = clActiveCaption
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_OC'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. OC Pendente'
          Title.Color = clActiveCaption
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_PEDIDO'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Pedido Pendente'
          Title.Color = clActiveCaption
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'Saldo'
          Title.Color = clMoneyGreen
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_ESTOQUE_MIN'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. M'#237'nima'
          Title.Color = clActiveCaption
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO_MIN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'Saldo Seguran'#231'a (M'#237'nimo)'
          Title.Color = clMoneyGreen
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 106
          Visible = True
        end>
    end
  end
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 91
    Align = alTop
    BorderPen.Style = psClear
    UseDockManager = False
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 91
      Top = 18
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
      Transparent = True
    end
    object Label4: TLabel
      Left = 60
      Top = 37
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'ID Produto:'
      Transparent = True
    end
    object Label1: TLabel
      Left = 43
      Top = 56
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Produto:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 88
      Top = 74
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo:'
      Transparent = True
    end
    object Label5: TLabel
      Left = 198
      Top = 33
      Width = 98
      Height = 13
      Caption = 'F2 Pesquisa Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Shape1: TShape
      Left = 778
      Top = 6
      Width = 28
      Height = 18
      Brush.Color = clRed
    end
    object Label6: TLabel
      Left = 810
      Top = 10
      Width = 73
      Height = 13
      Caption = 'Saldo Negativo'
      Transparent = True
    end
    object Shape2: TShape
      Left = 778
      Top = 23
      Width = 28
      Height = 18
      Brush.Color = clYellow
    end
    object Label7: TLabel
      Left = 810
      Top = 27
      Width = 85
      Height = 13
      Caption = 'Abaixo do M'#237'nimo'
      Transparent = True
    end
    object btnConsultar: TNxButton
      Left = 394
      Top = 64
      Width = 114
      Caption = 'Efetuar Pesquisa'
      TabOrder = 4
      OnClick = btnConsultarClick
    end
    object btnImprimir: TNxButton
      Left = 508
      Top = 64
      Width = 114
      Caption = 'Imprimir'
      TabOrder = 5
      OnClick = btnImprimirClick
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 116
      Top = 9
      Width = 246
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME_INTERNO'
      LookupSource = DMCompras.dsFilial
      ParentCtl3D = False
      TabOrder = 0
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 116
      Top = 29
      Width = 69
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 1
      OnEnter = CurrencyEdit1Enter
      OnExit = CurrencyEdit1Exit
      OnKeyDown = CurrencyEdit1KeyDown
    end
    object Edit1: TEdit
      Left = 116
      Top = 49
      Width = 246
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnKeyDown = Edit1KeyDown
    end
    object btnGerarOC: TNxButton
      Left = 623
      Top = 64
      Width = 114
      Caption = 'Gerar OC'
      TabOrder = 6
      OnClick = btnGerarOCClick
    end
    object NxComboBox1: TNxComboBox
      Left = 116
      Top = 67
      Width = 137
      Height = 21
      Cursor = crArrow
      TabOrder = 3
      Text = 'Produto'
      ReadOnly = True
      HideFocus = False
      Style = dsDropDownList
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        'Produto'
        'Material'
        'Material Consumo')
    end
  end
end
