object frmConsPedido_Rep: TfrmConsPedido_Rep
  Left = 261
  Top = 160
  Width = 985
  Height = 496
  Caption = 'Consulta Pedido para comiss'#227'o'
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
    Top = 72
    Width = 977
    Height = 393
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
      Width = 957
      Height = 373
      Align = alClient
      Ctl3D = False
      DataSource = DMConsPedidoCom.dsConsPedido
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
      ColCount = 12
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'AMOSTRA'
          Title.Alignment = taCenter
          Title.Caption = 'Amostra'
          Title.Color = clActiveCaption
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CLIENTE'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Cliente'
          Title.Color = clActiveCaption
          Width = 339
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_PEDIDO'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Pedido'
          Title.Color = clActiveCaption
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTEMISSAO'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Emiss'#227'o'
          Title.Color = clActiveCaption
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTENTREGA'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Entrega'
          Title.Color = clActiveCaption
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DESC_PRAZO'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo Cond.'
          Title.Color = clActiveCaption
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CONDPAGTO'
          Title.Alignment = taCenter
          Title.Caption = 'Cond. Pagamento'
          Title.Color = clActiveCaption
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_TIPO_COBRANCA'
          Title.Alignment = taCenter
          Title.Caption = 'Forma Pagamento'
          Title.Color = clActiveCaption
          Width = 168
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_CONDPGTO'
          Title.Alignment = taCenter
          Title.Caption = 'ID Cond.'
          Title.Color = clActiveCaption
          Width = 56
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_TIPO_COBRANCA'
          Title.Alignment = taCenter
          Title.Caption = 'ID Cobran'#231'a'
          Title.Color = clActiveCaption
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FANTASIA'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Fantasia'
          Title.Color = clActiveCaption
          Width = 175
          Visible = True
        end>
    end
  end
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 977
    Height = 72
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 16
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Emiss'#227'o Inicial:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 231
      Top = 16
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 65
      Top = 35
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
      Transparent = True
    end
    object Label4: TLabel
      Left = 62
      Top = 53
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Mostrar:'
      Transparent = True
    end
    object DateEdit1: TDateEdit
      Left = 103
      Top = 8
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 259
      Top = 8
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 103
      Top = 28
      Width = 256
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object btnConsultar: TNxButton
      Left = 362
      Top = 44
      Width = 114
      Caption = 'Efetuar Pesquisa'
      TabOrder = 3
      OnClick = btnConsultarClick
    end
    object cbBoxTipo: TNxComboBox
      Left = 103
      Top = 46
      Width = 148
      Height = 21
      Cursor = crArrow
      TabOrder = 4
      Text = 'Ambos'
      ReadOnly = True
      HideFocus = False
      Style = dsDropDownList
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'N'#227'o Mostrar Amostras'
        'Somente Amostras')
    end
    object btnImprimir: TNxButton
      Left = 476
      Top = 44
      Width = 114
      Caption = 'Imprimir'
      TabOrder = 5
      OnClick = btnImprimirClick
    end
  end
end
