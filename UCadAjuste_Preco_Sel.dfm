object frmCadAjuste_Preco_Sel: TfrmCadAjuste_Preco_Sel
  Left = 191
  Top = 154
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Seleciona Produtos Para o Ajustes de Pre'#231'os'
  ClientHeight = 471
  ClientWidth = 982
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
    Width = 982
    Height = 91
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label2: TLabel
      Left = 6
      Top = 31
      Width = 80
      Height = 13
      Caption = 'Pesquisar Nome:'
    end
    object Label68: TLabel
      Left = 20
      Top = 12
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Registro:'
    end
    object Label1: TLabel
      Left = 41
      Top = 52
      Width = 45
      Height = 13
      Caption = 'Estrutura:'
    end
    object lblNomeGrupo: TLabel
      Left = 160
      Top = 49
      Width = 3
      Height = 13
      Caption = '.'
    end
    object Label4: TLabel
      Left = 88
      Top = 70
      Width = 93
      Height = 13
      Caption = 'F2 Pesquisar Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 634
      Top = 58
      Width = 347
      Height = 25
      Caption = 'Transferir Produtos selecionados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object Edit1: TEdit
      Left = 89
      Top = 25
      Width = 289
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyDown = Edit1KeyDown
    end
    object ComboBox2: TComboBox
      Left = 88
      Top = 4
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Produto'
      Items.Strings = (
        'Produto'
        'Material'
        'Semiacabado')
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 89
      Top = 46
      Width = 66
      Height = 20
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 3
      OnExit = CurrencyEdit1Exit
      OnKeyDown = CurrencyEdit1KeyDown
    end
    object btnConsulta: TNxButton
      Left = 253
      Top = 67
      Width = 124
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnConsultaClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 91
    Width = 982
    Height = 380
    Align = alClient
    Ctl3D = False
    DataSource = DMCadAjuste_Preco.dsProduto
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
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
        Expanded = False
        FieldName = 'ID_PRODUTO'
        Title.Alignment = taCenter
        Title.Caption = 'ID Prod.'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTO'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Width = 369
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_MARCA'
        Title.Caption = 'Marca'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VENDA'
        Title.Alignment = taCenter
        Title.Caption = 'Pre'#231'o Venda'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_GRUPO'
        Title.Alignment = taCenter
        Title.Caption = 'Estrutura'
        Visible = True
      end>
  end
end
