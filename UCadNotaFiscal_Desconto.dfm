object frmCadNotaFiscal_Desconto: TfrmCadNotaFiscal_Desconto
  Left = 494
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informa o desconto da nota'
  ClientHeight = 372
  ClientWidth = 382
  Color = clMoneyGreen
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
  object Label47: TLabel
    Left = 15
    Top = 275
    Width = 60
    Height = 13
    Caption = '% Desconto:'
  end
  object Label54: TLabel
    Left = 17
    Top = 227
    Width = 193
    Height = 13
    Caption = 'Descri'#231#227'o do desconto impresso na nota'
  end
  object Label48: TLabel
    Left = 192
    Top = 275
    Width = 89
    Height = 13
    Caption = 'Valor do desconto:'
  end
  object Label1: TLabel
    Left = 58
    Top = 16
    Width = 57
    Height = 13
    Caption = '% Desconto'
  end
  object Label2: TLabel
    Left = 144
    Top = 297
    Width = 137
    Height = 13
    Caption = 'Valor do desconto Nos Itens:'
  end
  object DBEdit23: TDBEdit
    Left = 16
    Top = 244
    Width = 352
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DESCRICAO_DESC'
    DataSource = DMCadNotaFiscal.dsNotaFiscal
    TabOrder = 4
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 78
    Top = 268
    Width = 73
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '0.0000'
    TabOrder = 5
    OnExit = CurrencyEdit1Exit
  end
  object ceVlrDesconto: TCurrencyEdit
    Left = 285
    Top = 268
    Width = 83
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 6
    OnExit = ceVlrDescontoExit
  end
  object SMDBGrid1: TSMDBGrid
    Left = 50
    Top = 56
    Width = 233
    Height = 145
    DataSource = DMCadNotaFiscal.dsNotaFiscal_Desconto
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
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
    ColCount = 3
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERC_DESCONTO'
        Title.Alignment = taCenter
        Width = 99
        Visible = True
      end>
  end
  object cePercentual: TCurrencyEdit
    Left = 50
    Top = 32
    Width = 81
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 0
  end
  object BitBtn7: TBitBtn
    Left = 133
    Top = 28
    Width = 75
    Height = 25
    Hint = 'Confirma o desconto'
    Caption = 'Confirmar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn7Click
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 208
    Top = 28
    Width = 75
    Height = 25
    Hint = 'Excluir o desconto selecionado'
    Caption = 'Excluir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtn3Click
    NumGlyphs = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 338
    Width = 382
    Height = 34
    Align = alBottom
    TabOrder = 7
    object BitBtn1: TBitBtn
      Left = 98
      Top = 5
      Width = 94
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 190
      Top = 5
      Width = 94
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object ceVlrDesconto_Itens: TCurrencyEdit
    Left = 285
    Top = 290
    Width = 83
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    DisplayFormat = '0.00'
    ReadOnly = True
    TabOrder = 8
  end
end
