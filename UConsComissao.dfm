object frmConsComissao: TfrmConsComissao
  Left = 229
  Top = 166
  Width = 928
  Height = 480
  Caption = 'frmConsComissao'
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
    BevelOuter = bvNone
    Color = 15391952
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 36
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'M'#234's Inicial:'
    end
    object Label2: TLabel
      Left = 217
      Top = 36
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ano Inicial:'
    end
    object Label3: TLabel
      Left = 31
      Top = 56
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'M'#234's Final:'
    end
    object Label4: TLabel
      Left = 222
      Top = 56
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ano Final:'
    end
    object Label5: TLabel
      Left = 30
      Top = 76
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor:'
    end
    object Label6: TLabel
      Left = 54
      Top = 12
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
    end
    object NxComboBox1: TNxComboBox
      Left = 82
      Top = 28
      Width = 121
      Height = 21
      TabOrder = 1
      HideFocus = False
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        ''
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 271
      Top = 28
      Width = 53
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 2
    end
    object NxComboBox2: TNxComboBox
      Left = 82
      Top = 48
      Width = 121
      Height = 21
      Cursor = crArrow
      TabOrder = 3
      ReadOnly = True
      HideFocus = False
      Style = dsDropDownList
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        ''
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 271
      Top = 48
      Width = 53
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 4
    end
    object Edit1: TEdit
      Left = 82
      Top = 68
      Width = 242
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object btnConsultar: TNxButton
      Left = 328
      Top = 64
      Width = 118
      Height = 25
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnConsultarClick
    end
    object btnImprimir: TNxButton
      Left = 447
      Top = 64
      Width = 118
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btnImprimirClick
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 82
      Top = 8
      Width = 242
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME_INTERNO'
      LookupSource = DMCadExtComissao.dsFilial
      ParentCtl3D = False
      TabOrder = 0
    end
    object ckImpTitulos: TNxCheckBox
      Left = 350
      Top = 8
      Width = 184
      Height = 21
      TabOrder = 8
      Text = 'ckImpTitulos'
      Caption = 'Imprimir os T'#237'tulos/Notas'
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 96
    Width = 920
    Height = 336
    Align = alClient
    Ctl3D = False
    DataSource = DMCadExtComissao.dsConsComissao_AnoMes
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsAquaBlue
    GridStyle.OddColor = 16774361
    GridStyle.EvenColor = 16768959
    TitleHeight.PixelCount = 24
    FooterColor = 13041606
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoShowFooter, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 16
    ScrollBars = ssHorizontal
    ColCount = 11
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ANO'
        Title.Alignment = taCenter
        Title.Caption = 'Ano'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_MES'
        Title.Alignment = taCenter
        Title.Caption = 'M'#234's'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_VENDEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'ID Vendedor'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_VENDEDOR'
        Title.Caption = 'Nome Vendedor'
        Width = 286
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_COMISSAO'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Base'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_ANTERIOR'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Anterior'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_ENTRADA'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Entrada'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Pago'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO_MES'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo M'#234's'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Geral'
        Width = 83
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 432
    Width = 920
    Height = 17
    Align = alBottom
    Caption = 'Duplo Clique para mostrar os T'#237'tulos/Notas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
