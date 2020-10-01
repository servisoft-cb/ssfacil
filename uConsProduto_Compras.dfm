object frmConsProduto_Compras: TfrmConsProduto_Compras
  Left = 54
  Top = 116
  Width = 1166
  Height = 511
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'frmConsProduto_Compras'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1158
    Height = 41
    Align = alTop
    Color = clActiveCaption
    TabOrder = 0
    object Label1: TLabel
      Left = 240
      Top = 17
      Width = 207
      Height = 13
      Caption = 'Data da '#250'ltima altera'#231#227'o do pre'#231'o de custo:'
    end
    object lblUltPreco: TLabel
      Left = 456
      Top = 8
      Width = 100
      Height = 22
      AutoSize = False
      Caption = '88/88/8888'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 17
      Width = 14
      Height = 13
      Caption = 'ID:'
    end
    object lblID: TLabel
      Left = 56
      Top = 8
      Width = 100
      Height = 22
      AutoSize = False
      Caption = '0000000000000000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 41
    Width = 1158
    Height = 439
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
      Width = 1138
      Height = 419
      Align = alClient
      Ctl3D = False
      DataSource = DMConsEstoque.dsCompras
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
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
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 11
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'DTMOVIMENTO'
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMNOTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_MATERIAL_FORN'
          Title.Caption = 'C'#211'D. FORNECEDOR'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_MATERIAL_FORN'
          Title.Caption = 'NOME FORNECEDOR'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_COR'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_UNITARIO'
          Title.Caption = 'VLR. UNIT.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_FRETE'
          Title.Caption = 'FRETE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_DESCONTO'
          Title.Caption = 'DESCONTO'
          Width = 70
          Visible = True
        end>
    end
  end
end
