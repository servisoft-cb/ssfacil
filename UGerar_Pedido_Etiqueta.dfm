object frmGerar_Pedido_Etiqueta: TfrmGerar_Pedido_Etiqueta
  Left = 263
  Top = 132
  Width = 928
  Height = 480
  Caption = 'frmGerar_Pedido_Etiqueta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 45
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 87
      Height = 13
      Caption = 'N'#186' Pedido Interno:'
    end
    object Label4: TLabel
      Left = 352
      Top = 8
      Width = 8
      Height = 14
      Caption = '..'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 114
      Top = 27
      Width = 94
      Height = 13
      Caption = 'F2 Pesquisa Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 112
      Top = 5
      Width = 97
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = CurrencyEdit1KeyDown
    end
    object btnConsultar: TNxButton
      Left = 210
      Top = 4
      Width = 127
      Caption = 'Efetuar Pesquisa'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 45
    Width = 912
    Height = 396
    ActivePage = TS_Talao
    ActivePageDefault = TS_Itens
    Align = alClient
    TabIndex = 1
    TabOrder = 1
    FixedDimension = 19
    object TS_Itens: TRzTabSheet
      Caption = 'Itens do Pedido'
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 28
        Width = 908
        Height = 345
        Align = alClient
        Ctl3D = False
        DataSource = DMCadPedido.dsPedidoImp_Itens
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        TabOrder = 0
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
        WidthOfIndicator = 27
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 12
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ITEM'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Width = 38
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'REFERENCIA'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_PENDENTE_TAL'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. N'#227'o Gerada Etiqueta'
            Width = 73
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_POR_ROTULO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Por R'#243'tulo'
            Title.Color = 8454143
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEPRODUTO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Nome Produto'
            Width = 298
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_COMBINACAO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cor'
            Width = 217
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_PRODUTO'
            ReadOnly = True
            Title.Caption = 'ID Produto'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cor Cliente'
            Width = 333
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAMANHO_CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Tam. Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_COR_CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Cor Cliente'
            Width = 93
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 908
        Height = 28
        Align = alTop
        TabOrder = 1
        object Shape1: TShape
          Left = 344
          Top = 8
          Width = 32
          Height = 16
          Brush.Color = 10485663
        end
        object Label2: TLabel
          Left = 379
          Top = 9
          Width = 99
          Height = 13
          Caption = 'Gerou R'#243'tulo (Tal'#227'o)'
        end
        object Label3: TLabel
          Left = 184
          Top = 11
          Width = 20
          Height = 13
          Caption = 'Qtd:'
        end
        object Shape3: TShape
          Left = 495
          Top = 7
          Width = 32
          Height = 16
          Brush.Color = 16777119
        end
        object Label6: TLabel
          Left = 530
          Top = 10
          Width = 99
          Height = 13
          Caption = 'Gerou R'#243'tulo (Tal'#227'o)'
        end
        object btnGerar: TNxButton
          Left = 2
          Top = 4
          Width = 151
          Caption = 'Gerar Selecionados '
          TabOrder = 0
          OnClick = btnGerarClick
        end
        object CurrencyEdit2: TCurrencyEdit
          Left = 206
          Top = 3
          Width = 73
          Height = 21
          AutoSize = False
          Ctl3D = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          ParentCtl3D = False
          TabOrder = 1
          OnKeyDown = CurrencyEdit2KeyDown
        end
      end
    end
    object TS_Talao: TRzTabSheet
      Caption = 'Etiquetas Geradas (Tal'#227'o)'
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 28
        Width = 908
        Height = 345
        Align = alClient
        Ctl3D = False
        DataSource = DMCadPedido.dsmEtiqueta_Nav
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        TabOrder = 0
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
        ExOptions = [eoCheckBoxSelect, eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 27
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 7
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Pedido_Cliente'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Pedido'
            Title.Color = 16777164
            Width = 109
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Referencia'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = 16777164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Produto'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Nome Produto'
            Title.Color = 16777164
            Width = 300
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Item_Ped'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Title.Color = 16777164
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtd'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Qtde.'
            Title.Color = 16777164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Medida'
            Title.Caption = 'Obs.'
            Title.Color = 16777164
            Width = 184
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 908
        Height = 28
        Align = alTop
        TabOrder = 1
        object Label5: TLabel
          Left = 379
          Top = 9
          Width = 39
          Height = 13
          Caption = 'J'#225' Lidas'
        end
        object Shape2: TShape
          Left = 344
          Top = 8
          Width = 32
          Height = 16
          Brush.Color = 10485663
        end
        object btnReimprimir: TNxButton
          Left = 2
          Top = 4
          Width = 151
          Caption = 'Imprimir'
          TabOrder = 0
          OnClick = btnReimprimirClick
        end
        object ckReimprimir_Baixado: TCheckBox
          Left = 592
          Top = 8
          Width = 153
          Height = 17
          Caption = 'Reimprimir baixado'
          TabOrder = 1
          Visible = False
        end
      end
    end
  end
end
