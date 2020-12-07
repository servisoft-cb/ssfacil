object frmEtiqueta_RFID: TfrmEtiqueta_RFID
  Left = 111
  Top = 53
  Width = 1190
  Height = 595
  Caption = 'frmEtiqueta_RFID'
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
    Width = 1182
    Height = 53
    Align = alTop
    Color = 13619151
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 24
      Width = 160
      Height = 13
      Caption = 'Informe a Quantidade por Pacote:'
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 182
      Top = 14
      Width = 87
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 0
    end
    object btnGerar: TNxButton
      Left = 280
      Top = 11
      Width = 101
      Height = 26
      Caption = 'Gerar'
      TabOrder = 1
      OnClick = btnGerarClick
    end
    object btnImprimir: TNxButton
      Left = 381
      Top = 11
      Width = 101
      Height = 26
      Caption = 'Imprimir'
      TabOrder = 2
      OnClick = btnImprimirClick
    end
    object CheckBox1: TCheckBox
      Left = 743
      Top = 21
      Width = 97
      Height = 17
      Caption = 'Teste'
      TabOrder = 3
      Visible = False
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 53
    Width = 1182
    Height = 511
    Align = alClient
    Ctl3D = False
    DataSource = DMEtiqueta.dsmEtiqueta_Nav
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 13
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CNPJ_Filial'
        Title.Alignment = taCenter
        Title.Caption = 'CNPJ Empresa'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Sequencia_RFID'
        Title.Alignment = taCenter
        Title.Caption = 'Sequencia RFID'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Item_Nota'
        Title.Alignment = taCenter
        Title.Caption = 'Item Nota'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Referencia'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Produto'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Width = 221
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pedido_Cliente'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' OC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prod_Cliente'
        Title.Alignment = taCenter
        Title.Caption = 'Prod. Cliente'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Unidade'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Num_Nota'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Cod_Cor_Cliente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cor Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Cor_Cliente'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cor Clente'
        Width = 340
        Visible = True
      end>
  end
end
