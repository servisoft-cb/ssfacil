object frmCadMetas_Comissao: TfrmCadMetas_Comissao
  Left = 244
  Top = 188
  Width = 928
  Height = 480
  Caption = 'Metas de Comiss'#227'o'
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
    Height = 37
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object btnDigitar: TNxButton
      Left = 20
      Top = 6
      Width = 121
      Height = 24
      Caption = 'Digitar Metas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnDigitarClick
    end
    object btnConfirmar: TNxButton
      Left = 141
      Top = 6
      Width = 121
      Height = 24
      Caption = 'Cofirmar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TNxButton
      Left = 262
      Top = 7
      Width = 121
      Height = 24
      Caption = 'Cancelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 8
    Top = 43
    Width = 538
    Height = 350
    Ctl3D = False
    DataSource = DMCadMetas_Comissao.dsMetas_Comissao
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
    ColCount = 3
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'At'#233' esse Valor'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_COMISSAO'
        Title.Alignment = taCenter
        Title.Caption = '% Comiss'#227'o'
        Width = 150
        Visible = True
      end>
  end
  object UCControls1: TUCControls
    GroupName = 'Metas de Comiss'#227'o'
    UserControl = fMenu.UserControl1
    NotAllowed = naDisabled
    Left = 694
    Top = 150
  end
end
