object fProcessoC: TfProcessoC
  Left = 325
  Top = 216
  Width = 610
  Height = 459
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'fProcessoC'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 34
    Align = alTop
    TabOrder = 0
    object BitBtn4: TBitBtn
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Incluir'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object BitBtn1: TBitBtn
      Left = 79
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Consultar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn5: TBitBtn
      Left = 154
      Top = 4
      Width = 75
      Height = 25
      Caption = 'E&xcluir'
      TabOrder = 2
      OnClick = BitBtn5Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 34
    Width = 594
    Height = 387
    Align = alClient
    DataSource = dmProcesso.dsProcessoCons
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
    Flat = False
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
    ColCount = 4
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACA'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FICHA_TEC'
        Title.Caption = 'FICHA T'#201'CNICA'
        Width = 330
        Visible = True
      end>
  end
end
