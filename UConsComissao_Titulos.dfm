object frmConsComissao_Titulos: TfrmConsComissao_Titulos
  Left = 313
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta T'#237'tulos/Notas'
  ClientHeight = 449
  ClientWidth = 920
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
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 50
    Width = 920
    Height = 399
    Align = alClient
    Ctl3D = False
    DataSource = DMCadExtComissao.dsConsTitulos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
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
    GridStyle.Style = gsAquaBlue
    GridStyle.OddColor = 16774361
    GridStyle.EvenColor = 16768959
    TitleHeight.PixelCount = 24
    FooterColor = 13041606
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 16
    ScrollBars = ssHorizontal
    ColCount = 10
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO_REG'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Reg'
        Title.Color = 11206655
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SERIE'
        Title.Alignment = taCenter
        Title.Caption = 'S'#233'rie'
        Title.Color = 11206655
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUM_NOTA'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota'
        Title.Color = 11206655
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PARCELA'
        Title.Alignment = taCenter
        Title.Caption = 'Parcela'
        Title.Color = 11206655
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTBASE'
        Title.Alignment = taCenter
        Title.Caption = 'Data Base'
        Title.Color = 11206655
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_COMISSAO'
        Title.Alignment = taCenter
        Title.Caption = '% Comiss'#227'o'
        Title.Color = 11206655
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_COMISSAO'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Comiss'#227'o'
        Title.Color = 11206655
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_COMISSAO'
        Title.Alignment = taCenter
        Title.Caption = 'Base Comiss'#227'o'
        Title.Color = 11206655
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Alignment = taCenter
        Title.Caption = 'Obs'
        Title.Color = 11206655
        Width = 365
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 15391952
    TabOrder = 1
    object Label6: TLabel
      Left = 14
      Top = 8
      Width = 65
      Height = 14
      Alignment = taRightJustify
      Caption = 'Vendedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblVendedor: TLabel
      Left = 85
      Top = 8
      Width = 65
      Height = 14
      Caption = 'Vendedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 20
      Top = 26
      Width = 59
      Height = 14
      Alignment = taRightJustify
      Caption = 'M'#234's/Ano:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblMesAno: TLabel
      Left = 85
      Top = 26
      Width = 65
      Height = 14
      Caption = 'Vendedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
  end
end
