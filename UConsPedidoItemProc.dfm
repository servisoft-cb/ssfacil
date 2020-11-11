object frmConsPedidoItemProc: TfrmConsPedidoItemProc
  Left = 218
  Top = 161
  Width = 928
  Height = 500
  Caption = 'frmConsPedidoItemProc'
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
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 83
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label5: TLabel
      Left = 20
      Top = 33
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Emiss'#227'o Ini:'
      Transparent = True
    end
    object Label6: TLabel
      Left = 193
      Top = 33
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      Transparent = True
    end
    object Label9: TLabel
      Left = 41
      Top = 53
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor:'
      Transparent = True
    end
    object Label1: TLabel
      Left = 354
      Top = 13
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pedido (OC):'
      Transparent = True
    end
    object Label12: TLabel
      Left = 342
      Top = 31
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pedido Interno:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 67
      Top = 13
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 379
      Top = 47
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Op'#231#227'o'
      Transparent = True
    end
    object DateEdit2: TDateEdit
      Left = 219
      Top = 25
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      StartOfWeek = Sun
      TabOrder = 2
    end
    object RxDBLookupCombo5: TRxDBLookupCombo
      Left = 91
      Top = 45
      Width = 228
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = DMConsPedidoProc.dsVendedor
      ParentCtl3D = False
      TabOrder = 3
    end
    object DateEdit1: TDateEdit
      Left = 91
      Top = 25
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      StartOfWeek = Sun
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 415
      Top = 5
      Width = 190
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 415
      Top = 23
      Width = 86
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 5
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 91
      Top = 5
      Width = 228
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = DMConsPedido.dsVendedor
      ParentCtl3D = False
      TabOrder = 0
    end
    object NxComboBox1: TNxComboBox
      Left = 415
      Top = 44
      Width = 190
      Height = 21
      TabOrder = 6
      Text = 'Ambos'
      HideFocus = False
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'Pendente'
        'Faturado')
    end
    object NxButton1: TNxButton
      Left = 607
      Top = 40
      Width = 133
      Height = 26
      Caption = 'Efetuar Pesquisa'
      TabOrder = 7
      OnClick = NxButton1Click
    end
    object NxComboBox2: TNxComboBox
      Left = 686
      Top = 5
      Width = 190
      Height = 21
      TabOrder = 8
      Text = 'Ambos'
      HideFocus = False
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'Pendente de Faturamento'
        'Pendente de Produ'#231#227'o'
        'Faturado'
        'Produzido'
        '')
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 83
    Width = 920
    Height = 386
    ActivePage = TS_Pedidos
    ActivePageDefault = TS_Pedidos
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    FixedDimension = 19
    object TS_Pedidos: TRzTabSheet
      Caption = 'Pedidos'
      object AdvPanel1: TAdvPanel
        Left = 0
        Top = 0
        Width = 916
        Height = 363
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
        object SMDBGrid2: TSMDBGrid
          Left = 10
          Top = 10
          Width = 896
          Height = 343
          Align = alClient
          Ctl3D = False
          DataSource = DMConsPedidoProc.dsConsPedido
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
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
          OnGetCellParams = SMDBGrid2GetCellParams
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 21
          RowCount = 2
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUM_PEDIDO'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Pedido'
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
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_CLIENTE'
              Title.Alignment = taCenter
              Title.Caption = 'ID Cliente'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLIENTE'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Cliente'
              Width = 217
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DTENTREGA'
              Title.Alignment = taCenter
              Title.Caption = 'Dt. Entrega'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO'
              Title.Alignment = taCenter
              Title.Caption = 'Usu'#225'rio'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_VENDEDOR'
              Title.Alignment = taCenter
              Title.Caption = 'Vendedor'
              Width = 137
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CONTADOR_ITENS'
              Title.Alignment = taCenter
              Title.Caption = 'Total Itens'
              Width = 45
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CONTADOR_INICIADO'
              Title.Alignment = taCenter
              Title.Caption = 'Itens Em Produ'#231#227'o'
              Width = 53
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CONTADOR_ENCERRADO'
              Title.Alignment = taCenter
              Title.Caption = 'Itens Encerrado'
              Width = 58
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_01'
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_02'
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_03'
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_04'
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_05'
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_06'
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_07'
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_08'
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_09'
              Width = 64
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROCESSO_10'
              Width = 64
              Visible = True
            end>
        end
      end
    end
    object TS_Processo: TRzTabSheet
      Caption = 'Processos'
      object pnlPrincipal: TAdvPanel
        Left = 0
        Top = 0
        Width = 916
        Height = 363
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
          Width = 896
          Height = 343
          Align = alClient
          Ctl3D = False
          DataSource = DMConsPedidoProc.dsConsPedidoProc
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
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
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 24
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Caption = 'ID Pedido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ITEM'
              Title.Alignment = taCenter
              Title.Caption = 'Item Pedido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ITEM_PROCESSO'
              Title.Alignment = taCenter
              Title.Caption = 'Item Proc.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_PROCESSO'
              Title.Alignment = taCenter
              Title.Caption = 'ID Processo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_PRODUTO'
              Title.Alignment = taCenter
              Title.Caption = 'ID Produto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REFERENCIA'
              Title.Alignment = taCenter
              Title.Caption = 'Refer'#234'ncia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMEPRODUTO'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Produto'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. Pe'#231'a'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPRIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Comp.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LARGURA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESPESSURA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALTURA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAMETRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPLEMENTO_NOME'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_MAT'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_ORCAMENTO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_PEDIDO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTEMISSAO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_UNITARIO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_TOTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLIENTE'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_PROCESSO'
              Width = 64
              Visible = True
            end>
        end
      end
    end
  end
end
