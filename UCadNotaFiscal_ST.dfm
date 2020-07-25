object frmCadNotaFiscal_ST: TfrmCadNotaFiscal_ST
  Left = 239
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Substitui'#231#227'o Tribut'#225'ria'
  ClientHeight = 442
  ClientWidth = 979
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
  object SMDBGrid2: TSMDBGrid
    Left = 0
    Top = 0
    Width = 979
    Height = 344
    Align = alClient
    DataSource = DMCadNotaFiscal.dsNotaFiscal_Itens
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
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
    ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 16
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Title.Color = 16763025
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Title.Color = 16763025
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODCFOP'
        Title.Alignment = taCenter
        Title.Caption = 'CFOP'
        Title.Color = 16763025
        Width = 46
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NCM'
        Title.Alignment = taCenter
        Title.Color = 16763025
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Title.Alignment = taCenter
        Title.Caption = 'QTD.'
        Title.Color = 16763025
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_UNITARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Unit'#225'rio'
        Title.Color = 16763025
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERC_ICMSSUBST_INTERNO'
        Title.Alignment = taCenter
        Title.Caption = '% ICMS Interno'
        Title.Color = 16763025
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_ICMSSUBST_INTERNO'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Icms Interno'
        Title.Color = 16763025
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERC_MVA'
        Title.Alignment = taCenter
        Title.Caption = '% MVA'
        Title.Color = 16763025
        Width = 38
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERC_IPI'
        Title.Alignment = taCenter
        Title.Caption = '% IPI'
        Title.Color = 16763025
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_ICMSSUBST_PROPRIO'
        Title.Alignment = taCenter
        Title.Caption = 'Base Icms Pr'#243'prio'
        Title.Color = 16763025
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_ICMSSUBST_PROPRIO'
        Title.Alignment = taCenter
        Title.Caption = '% ICMS Pr'#243'prio'
        Title.Color = 16763025
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_ICMSSUBST_PROPRIO'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Icms Pr'#243'prio'
        Title.Color = 16763025
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_ICMSSUBST'
        Title.Alignment = taCenter
        Title.Caption = 'Base ST'
        Title.Color = 16763025
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_ICMSSUBST'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. ST'
        Title.Color = 16763025
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 78
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 979
    Height = 98
    Align = alBottom
    Color = clSilver
    TabOrder = 1
    object Label1: TLabel
      Left = 64
      Top = 8
      Width = 110
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Total dos Produtos:'
    end
    object DBText1: TDBText
      Left = 180
      Top = 7
      Width = 89
      Height = 14
      DataField = 'VLR_ITENS'
      DataSource = DMCadNotaFiscal.dsNotaFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 67
      Top = 24
      Width = 107
      Height = 13
      Alignment = taRightJustify
      Caption = 'Base de ICMS Pr'#243'prio:'
    end
    object DBText2: TDBText
      Left = 180
      Top = 23
      Width = 89
      Height = 14
      DataField = 'BASE_ICMSSUBST_PROPRIO'
      DataSource = DMCadNotaFiscal.dsNotaFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 76
      Top = 40
      Width = 98
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. de ICMS Pr'#243'prio:'
    end
    object DBText3: TDBText
      Left = 180
      Top = 39
      Width = 89
      Height = 14
      DataField = 'VLR_ICMSSUBST_PROPRIO'
      DataSource = DMCadNotaFiscal.dsNotaFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 64
      Top = 64
      Width = 135
      Height = 13
      Alignment = taRightJustify
      Caption = 'Base Substitui'#231#227'o Tribut'#225'ria:'
    end
    object DBText4: TDBText
      Left = 204
      Top = 63
      Width = 89
      Height = 14
      DataField = 'BASE_ICMSSUBST'
      DataSource = DMCadNotaFiscal.dsNotaFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 64
      Top = 80
      Width = 135
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Substitui'#231#227'o Tribut'#225'ria:'
    end
    object DBText5: TDBText
      Left = 204
      Top = 79
      Width = 89
      Height = 14
      DataField = 'VLR_ICMSSUBST'
      DataSource = DMCadNotaFiscal.dsNotaFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 644
      Top = 8
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. IPI:'
    end
    object Label7: TLabel
      Left = 633
      Top = 24
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Frete:'
    end
    object DBText6: TDBText
      Left = 681
      Top = 24
      Width = 89
      Height = 14
      DataField = 'VLR_FRETE'
      DataSource = DMCadNotaFiscal.dsNotaFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText7: TDBText
      Left = 681
      Top = 8
      Width = 89
      Height = 14
      DataField = 'VLR_IPI'
      DataSource = DMCadNotaFiscal.dsNotaFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 581
      Top = 40
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Outras Despesa:'
    end
    object DBText8: TDBText
      Left = 681
      Top = 40
      Width = 89
      Height = 14
      DataField = 'VLR_OUTRASDESP'
      DataSource = DMCadNotaFiscal.dsNotaFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 623
      Top = 56
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Seguro:'
    end
    object DBText9: TDBText
      Left = 681
      Top = 56
      Width = 89
      Height = 14
      DataField = 'VLR_SEGURO'
      DataSource = DMCadNotaFiscal.dsNotaFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSubstTributaria: TNxButton
      Left = 833
      Top = 67
      Width = 128
      Height = 29
      Caption = 'Mostrar Regra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F2F0F5F2F0FCFDFDFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B778D2D52869876
        72B0A3A1FCFDFE000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7780
        0055B812A5FA5E90BDBBA29FFAF5F4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF5C6377004EAD29BEFFA9ECFFA3F7FF3A89BFF6F5F6000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF75737F0051AC17B1FFA4E7FDD5FFFF12A6E45E90B5FFFCFC00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFD6C6C7D0057BB25BAFFA5E7FEC7FFFF099DDF6A8A
        A8FFFFFDFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54657D0057B120B5FFA1E5FECFFFFF
        109CDD4D7EA5FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFCFEFEDADDDDDAD9D9CFCFCFEDEFEFFFFFFFFFFFFFFFFFFF00024A21BCFFA5
        EAFFCAFFFF11A7E86587A9FFFFFCFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFDDE0E0958E8D7A63657D60628467678065658D77799C9393D3D1D1ADAA
        A749343776B3E0B4FFFF19A4DF5A84A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFD2D8D84C3334846269967570A39388A99E9AAB9E99AE9890
        B69DA4A28E8F867070E7D0CC806B6E005499467EA7FFFFFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFC2C2C2533638A27B799D80649A9A7C94988895
        97979498949198849E9478C4AFA8C8B5B7AFA1A1B6B3B1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FBFBFB816D6E8A66679C6F4A987D
        5A978F7499978499998D99998C989783948769987854C9B1A9C1B4B6DED8D8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000E0DCDB74575C
        98634797653998765499876899927799977F99967F99907799826295704B9B64
        3AD4CFD8A39C9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000887F83865B54984D1A945C319969439A77559A7F5F998365998364997F5F
        99735095673F81400DC9A391B2ACB0ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000BDAFB38C57459140079352258D562D875732885D3A8D
        6744946E4B92694587532D91572CBB753CCA906BADAAB0CECDCDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6B7BB8F56428528008B3D08A766
        34CA9765D0A272BC8D5F9E6940A06B3ECB9867EFB984FFCB8ACD8A5FBBB8C0DD
        DBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000B8AEB1906152
        AD5529ECB177FFD29AFED7A5FCDEAEFEE7B6FFEABBFFE8B8FDDCABF7D09CFCCB
        90CF9675AEAAB2CBCBCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00009B96988F6B68EAA769FFD19BF4CD9BF4D8AAF4E0B4F4E4BBF4E5BDF4E4BB
        F4DDB1F6DBABF8C98AC6A399A8A6A9F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000D2D0D07E6B73B47F67FED295F6DBADF4E4BAF5E5C2F5
        E7C8F5E9CAF4E7C8F5E8C3F9E9B9D29E73DDDEE8A6A2A1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FCFEFE9B8F91B6A0A5CD9972FDE8
        B2F6EDC7F5E9CCF4EDD4F5EED9F5EED6F9EFCDE4C299F3E4DD867F80D7D8D8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFD4D6D6
        574849C3AEB2CDA88FF0D9B4F6ECD0F6F3E3F6F1E5F4E8D3E2C2ABE1D0CF9E95
        96C6C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFD3D5D59F969797888CC0A6A1D1B6ACD5BEB2D7C0B7D5BDB8
        C1B4B8ADA7AAC0BFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFCFDFDD2D0D0A3A0A2CEC5C7E1
        D7D8DCD3D4A09C9EE7E5E5F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 0
      Transparent = True
      OnClick = btnSubstTributariaClick
    end
  end
end
