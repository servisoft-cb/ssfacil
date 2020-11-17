object frmConsEstoque_Transf: TfrmConsEstoque_Transf
  Left = 282
  Top = 176
  Width = 928
  Height = 480
  Caption = 'Consulta Transfer'#234'ncia'
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
    Height = 72
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 54
      Top = 34
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Inicial:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 231
      Top = 34
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 78
      Top = 14
      Width = 23
      Height = 13
      Caption = 'Filial:'
      Transparent = True
    end
    object Label4: TLabel
      Left = 47
      Top = 54
      Width = 55
      Height = 13
      Caption = 'Refer'#234'ncia:'
      Transparent = True
    end
    object DateEdit1: TDateEdit
      Left = 103
      Top = 26
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 259
      Top = 26
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 2
    end
    object btnConsultar: TNxButton
      Left = 362
      Top = 44
      Width = 114
      Caption = 'Efetuar Pesquisa'
      TabOrder = 4
      OnClick = btnConsultarClick
    end
    object btnImprimir: TNxButton
      Left = 476
      Top = 44
      Width = 114
      Caption = 'Imprimir'
      TabOrder = 5
      OnClick = btnImprimirClick
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 103
      Top = 6
      Width = 361
      Height = 21
      DropDownCount = 15
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME_INTERNO'
      LookupSource = DMConsEstoque.dsFilial
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtRef: TEdit
      Left = 103
      Top = 46
      Width = 126
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
  end
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 72
    Width = 920
    Height = 377
    Align = alClient
    BevelWidth = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
      Height = 317
      Align = alClient
      Ctl3D = False
      DataSource = DMConsEstoque.dsEstoque_Transf
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
          FieldName = 'REFERENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'ID Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 483
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Custo'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Total Custo'
          Visible = True
        end>
    end
    object NxPanel2: TNxPanel
      Left = 10
      Top = 327
      Width = 900
      Height = 40
      Align = alBottom
      ColorScheme = csBlue2010
      UseDockManager = False
      ParentBackground = False
      TabOrder = 1
      object NxLabel1: TNxLabel
        Left = 564
        Top = 14
        Width = 126
        Height = 14
        Caption = 'Vlr. Total do Custo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object NxLabel2: TNxLabel
        Left = 254
        Top = 14
        Width = 70
        Height = 14
        Caption = 'Qtd. Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        HorizontalPosition = hpLeft
        InnerHorizontal = True
        InnerVertical = False
        InnerMargins.Horizontal = 0
        InnerMargins.Vertical = 2
        VerticalPosition = vpTop
      end
      object DBEdit1: TDBEdit
        Left = 696
        Top = 7
        Width = 141
        Height = 22
        TabStop = False
        Ctl3D = False
        DataField = 'Vlr_Total'
        DataSource = DMConsEstoque.dsEstoque_Transf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 328
        Top = 7
        Width = 141
        Height = 22
        TabStop = False
        Ctl3D = False
        DataField = 'Qtd_Total'
        DataSource = DMConsEstoque.dsEstoque_Transf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
end
