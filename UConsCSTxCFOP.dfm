object frmConsCSTxCFOP: TfrmConsCSTxCFOP
  Left = 284
  Top = 147
  Width = 928
  Height = 480
  Caption = 'frmConsCSTxCFOP'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 96
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 33
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Emiss'#227'o Inicial:'
    end
    object Label2: TLabel
      Left = 242
      Top = 34
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
    end
    object Label3: TLabel
      Left = 77
      Top = 11
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
    end
    object Label4: TLabel
      Left = 21
      Top = 56
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Op'#231#227'o Empresa:'
    end
    object Label5: TLabel
      Left = 21
      Top = 77
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Entrada/Sa'#237'das:'
    end
    object DateEdit1: TDateEdit
      Left = 100
      Top = 25
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 267
      Top = 26
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 100
      Top = 3
      Width = 287
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMConsFat.dsFilial
      TabOrder = 0
    end
    object cbxEmpresa: TComboBox
      Left = 100
      Top = 47
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 3
      Text = 'Empresa do Geral'
      Items.Strings = (
        'Ambos'
        'Empresa do Geral'
        'Empresa do Simples')
    end
    object btnConsultar: TNxButton
      Left = 263
      Top = 63
      Width = 132
      Height = 27
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnConsultarClick
    end
    object btnImprimir: TNxButton
      Left = 396
      Top = 63
      Width = 132
      Height = 27
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnImprimirClick
    end
    object cbxEntradaSaida: TComboBox
      Left = 100
      Top = 69
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 6
      Text = 'Sa'#237'das'
      Items.Strings = (
        'Ambos'
        'Entradas'
        'Sa'#237'das')
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 96
    Width = 920
    Height = 353
    Align = alClient
    Ctl3D = False
    DataSource = DMConsFat.dsCSTICMS_CFOP
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
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODCFOP'
        Title.Alignment = taCenter
        Title.Caption = 'CFOP'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_CST'
        Title.Alignment = taCenter
        Title.Caption = 'CST ICMS'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_TRIBICMS'
        Title.Alignment = taCenter
        Title.Caption = '% Tributa'#231#227'o'
        Width = 111
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERC_DIFERIMENTO'
        Title.Alignment = taCenter
        Title.Caption = '% Diferimento'
        Width = 155
        Visible = True
      end>
  end
end
