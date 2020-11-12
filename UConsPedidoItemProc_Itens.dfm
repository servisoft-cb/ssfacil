object frmConsPedidoItemProc_Itens: TfrmConsPedidoItemProc_Itens
  Left = 149
  Top = 141
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmConsPedidoItemProc_Itens'
  ClientHeight = 469
  ClientWidth = 1061
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
    Width = 1061
    Height = 32
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Shape5: TShape
      Left = 125
      Top = 5
      Width = 30
      Height = 16
      Brush.Color = clAqua
    end
    object Label30: TLabel
      Left = 157
      Top = 8
      Width = 86
      Height = 13
      Caption = 'Iniciada Produ'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object ShapeConf: TShape
      Left = 273
      Top = 7
      Width = 30
      Height = 16
      Brush.Color = 33023
    end
    object Label68: TLabel
      Left = 305
      Top = 8
      Width = 98
      Height = 13
      Caption = 'Encerrada Produ'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object NxButton1: TNxButton
      Left = 19
      Top = 5
      Width = 76
      Caption = 'Fechar'
      TabOrder = 0
    end
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 32
    Width = 1061
    Height = 437
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
    object SMDBGrid2: TSMDBGrid
      Left = 10
      Top = 10
      Width = 1041
      Height = 417
      Align = alClient
      Ctl3D = False
      DataSource = DMConsPedidoProc.dsConsItens
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
      OnGetCellParams = SMDBGrid2GetCellParams
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 22
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_01'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_02'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_03'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_04'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_05'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_06'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_07'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_08'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_09'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROCESSO_10'
          Title.Alignment = taCenter
          Title.Color = 8454016
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ITEM'
          Title.Alignment = taCenter
          Title.Caption = 'Item'
          Title.Color = 8454016
          Width = 32
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'ID Produto'
          Title.Color = 8454016
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Title.Color = 8454016
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Produto'
          Title.Color = 8454016
          Width = 401
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ESPESSURA'
          Title.Alignment = taCenter
          Title.Caption = 'Espessura'
          Title.Color = 8454016
          Width = 57
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd.'
          Title.Color = 8454016
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD_RESTANTE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. N'#227'o Faturada'
          Title.Color = 8454016
          Width = 57
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD_FATURADO'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Faturado'
          Title.Color = 8454016
          Width = 51
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'COMPRIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Comprimento'
          Title.Color = 8454016
          Width = 68
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'LARGURA'
          Title.Alignment = taCenter
          Title.Caption = 'Largura'
          Title.Color = 8454016
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_REDUZIDA'
          Title.Alignment = taCenter
          Title.Caption = 'Obs'
          Title.Color = 8454016
          Width = 300
          Visible = True
        end>
    end
  end
end
