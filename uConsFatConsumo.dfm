object frmConsFatConsumo: TfrmConsFatConsumo
  Left = 225
  Top = 156
  Width = 975
  Height = 478
  Caption = 'frmConsFatConsumo'
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
    Top = 56
    Width = 967
    Height = 391
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
      Width = 947
      Height = 354
      Align = alClient
      Ctl3D = False
      DataSource = DMConsFat.dsConsFatConsumo
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
      ColCount = 7
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_MATERIAL'
          Title.Alignment = taCenter
          Title.Caption = 'ID Material'
          Title.Color = clActiveCaption
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_MATERIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Material'
          Title.Color = clActiveCaption
          Width = 387
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_COR_MAT'
          Title.Alignment = taCenter
          Title.Caption = 'Cor'
          Title.Color = clActiveCaption
          Width = 184
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UNIDADE_MAT'
          Title.Alignment = taCenter
          Title.Caption = 'Unid.'
          Title.Color = clActiveCaption
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_MATERIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Material'
          Title.Color = clActiveCaption
          Width = 128
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO_REG'
          Title.Alignment = taCenter
          Title.Caption = 'Semi / Mat'
          Title.Color = clActiveCaption
          Width = 59
          Visible = True
        end>
    end
    object ProgressBar1: TProgressBar
      Left = 10
      Top = 364
      Width = 947
      Height = 17
      Align = alBottom
      TabOrder = 1
      Visible = False
    end
  end
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 56
    Align = alTop
    BorderPen.Style = psClear
    UseDockManager = False
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 16
      Width = 109
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Faturamento Inicial:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 280
      Top = 16
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 102
      Top = 34
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo:'
      Transparent = True
    end
    object btnConsultar: TNxButton
      Left = 418
      Top = 30
      Width = 114
      Caption = 'Efetuar Pesquisa'
      TabOrder = 3
      OnClick = btnConsultarClick
    end
    object btnImprimir: TNxButton
      Left = 532
      Top = 30
      Width = 114
      Caption = 'Imprimir'
      TabOrder = 4
      OnClick = btnImprimirClick
    end
    object DateEdit1: TDateEdit
      Left = 127
      Top = 9
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 307
      Top = 8
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
    end
    object cbTipo: TNxComboBox
      Left = 127
      Top = 28
      Width = 100
      Height = 21
      TabOrder = 2
      Text = 'Ambos'
      HideFocus = False
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'Tran'#231'adeira'
        'Tear')
    end
  end
end
