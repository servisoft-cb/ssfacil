object frmCadPedido_Copia: TfrmCadPedido_Copia
  Left = 308
  Top = 237
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Copiar Pedido'
  ClientHeight = 351
  ClientWidth = 702
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 8
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 24
    Top = 21
    Width = 159
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#186' Pedido Origem da C'#243'pia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 376
    Top = 37
    Width = 66
    Height = 13
    Caption = 'Data Entrega:'
    Visible = False
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 187
    Top = 13
    Width = 97
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    Ctl3D = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 334
    Width = 702
    Height = 17
    Align = alBottom
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 184
    Top = 40
    Width = 153
    Height = 17
    Caption = 'Usar nova data de entrega'
    TabOrder = 2
    OnClick = CheckBox1Click
  end
  object DateEdit1: TDateEdit
    Left = 444
    Top = 28
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
    Visible = False
  end
  object NxPanel1: TNxPanel
    Left = 0
    Top = 293
    Width = 702
    Height = 41
    Align = alBottom
    UseDockManager = False
    ParentBackground = False
    TabOrder = 4
    object btnCopiar: TNxButton
      Left = 240
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Copiar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnCopiarClick
    end
    object btnCancelar: TNxButton
      Left = 360
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 89
    Width = 702
    Height = 204
    Align = alBottom
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
    ColCount = 2
    RowCount = 2
  end
end
