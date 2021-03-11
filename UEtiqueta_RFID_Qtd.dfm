object frmEtiqueta_RFID_Qtd: TfrmEtiqueta_RFID_Qtd
  Left = 287
  Top = 164
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmEtiqueta_RFID_Qtd'
  ClientHeight = 449
  ClientWidth = 839
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
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 41
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 212
      Top = 4
      Width = 381
      Height = 32
      Caption = 
        'Itens sem quantidade por etiqueta'#13#10'Informar a qtde no campo "Qtd' +
        '. Por Etiqueta" e confirmar'
      Color = 12582911
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object NxButton1: TNxButton
      Left = 667
      Top = 11
      Width = 93
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = NxButton1Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 41
    Width = 839
    Height = 408
    Align = alClient
    Ctl3D = False
    DataSource = DMEtiqueta.dsItemSemQtdRotulo
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
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
    ColCount = 6
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PRODUTO'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'ID Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTO'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Width = 418
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Unid.'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_POR_ROTULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Por Etiqueta'
        Title.Color = 8453888
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end>
  end
end
