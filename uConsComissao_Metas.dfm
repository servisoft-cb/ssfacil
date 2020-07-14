object frmConsComissao_Metas: TfrmConsComissao_Metas
  Left = 173
  Top = 37
  Width = 1087
  Height = 643
  Caption = 'Consulta Comiss'#227'o por Metas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1079
    Height = 89
    Align = alTop
    TabOrder = 0
    object AdvPanel1: TAdvPanel
      Left = 1
      Top = 1
      Width = 1077
      Height = 86
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UseDockManager = True
      Version = '1.6.0.3'
      AutoHideChildren = False
      BorderColor = clGray
      BorderShadow = True
      Caption.Color = clWhite
      Caption.ColorTo = clNone
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -11
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.GradientDirection = gdVertical
      Caption.Indent = 4
      Caption.ShadeLight = 255
      Caption.ShadeType = stRMetal
      Caption.Visible = True
      CollapsColor = clBtnFace
      CollapsDelay = 0
      ColorTo = 15000804
      HoverColor = clBlack
      HoverFontColor = clBlack
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = clWhite
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clBlack
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 14606046
      StatusBar.ColorTo = 11119017
      URLColor = clTeal
      FullHeight = 62
      object Label1: TLabel
        Left = 10
        Top = 52
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dt.Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 164
        Top = 52
        Width = 26
        Height = 13
        Caption = 'Final:'
      end
      object Label4: TLabel
        Left = 5
        Top = 30
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vendedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dtInicial: TDateEdit
        Left = 57
        Top = 44
        Width = 100
        Height = 21
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 1
      end
      object dtFinal: TDateEdit
        Left = 192
        Top = 44
        Width = 100
        Height = 21
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 2
      end
      object btnConsultar: TNxButton
        Left = 299
        Top = 35
        Width = 145
        Height = 30
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        TabOrder = 3
        Transparent = True
        OnClick = btnConsultarClick
      end
      object ComboVendedor: TRxDBLookupCombo
        Left = 57
        Top = 22
        Width = 235
        Height = 21
        DropDownCount = 8
        Ctl3D = False
        DisplayEmpty = '[Todos]'
        LookupField = 'CODIGO'
        LookupDisplay = 'NOME'
        LookupSource = DMComissao.dsVendedor
        ParentCtl3D = False
        TabOrder = 0
      end
      object btnReimprimir: TNxButton
        Left = 445
        Top = 35
        Width = 149
        Height = 30
        Caption = 'Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000000000000000000000000000000000004DAF3A4DAF3A
          4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF
          3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4DAF3A4D
          AF3A49A03849A038FFFFFF49A03849A03849A03849A03849A03849A03849A038
          49A038FFFFFFFFFFFFFFFFFF49A03849A038FFFFFFFFFFFF49A038FFFFFF49A0
          3849A03849A03849A038438E36FFFFFF438E36FFFFFF438E36438E36438E3643
          8E36438E36438E36438E36FFFFFF438E36438E36438E36FFFFFF438E36438E36
          438E36FFFFFF438E36438E36438E36438E363E7A33FFFFFF3E7A33FFFFFF3E7A
          333E7A33FFFFFFFFFFFFFFFFFF3E7A333E7A33FFFFFFFFFFFFFFFFFF3E7A33FF
          FFFF3E7A333E7A333E7A33FFFFFFFFFFFFFFFFFF3E7A333E7A33386831FFFFFF
          386831386831FFFFFF386831386831386831386831386831386831FFFFFF3868
          31386831386831FFFFFF386831386831386831FFFFFF38683138683138683138
          683134592FFFFFFF34592F34592FFFFFFF34592F34592F34592F34592F34592F
          34592FFFFFFFFFFFFFFFFFFF34592F34592FFFFFFFFFFFFF34592FFFFFFFFFFF
          FFFFFFFF34592F34592F314E2E314E2E314E2E314E2E314E2E314E2E314E2E31
          4E2E314E2E314E2E314E2E314E2E314E2E314E2E314E2E314E2E314E2E314E2E
          314E2E314E2E314E2E314E2E314E2E314E2EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE8E8E89B9B9B8382828D8C8C8E8D8D8E8D8D8E8D
          8D8B8B8B8A8A8A828181979696E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEB9B8B8818181CACACADDDDDD
          D7D7D7D8D7D7D8D7D7D8D7D7D9D9D9CDCCCC848383AEAEAEFCFCFCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B2B29E
          9D9DF1F1F1CBCBCBB4B4B4B7B6B6BCBBBBEDEDEDFFFFFFFDFDFD9D9C9CA5A5A5
          FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
          F6D1D0D0959595A0A0A0E6E5E5ACABAB909090959494999999CFCFCFF5F5F5F4
          F4F49F9F9F8F8F8FCCCCCCF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFB2B1B17B7A7A727171A7A6A6E9E9E9AAA9A98E8D8D9494949494
          948E8D8DA1A0A0E2E1E1AEAEAE7271717A7979A8A8A8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF807F7F727171727171AAA9A9F8F8F8D1D0D0
          BCBCBCC1C0C0C0C0C0B8B8B8C5C5C5F4F4F4B3B2B27271717271717E7D7DFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8281817271717271718F
          8E8EC8C8C8D2D1D1CFCFCFCFCFCFCFCFCFCFCFCFD2D2D2CBCBCB929191727171
          727171838282FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8483
          837271717271717473737978787C7B7B7D7C7C7D7C7C7D7C7C7D7C7C7D7C7C79
          78787B7A7A807F7F747373848383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF807F7F7271717271717271717271717271717271717271717271
          71727171727171727171BDBDBDECECEC8D8C8C7B7A7AFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A727171727171727171727171727171
          727171727171727171727171727171727171A8A8A8C9C9C9818181807F7FFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF9291917B7A7A77
          76768988888B8B8B8A89898A89898A89898A89898C8B8B888787767575767575
          8E8D8DC7C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFECECECA7A6A68F8F8FDCDCDCE7E7E7E4E4E4E4E4E4E4E4E4E4E4E4E7E7E7E0
          E0E0908F8F989797E7E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFB7B7B79A9999F8F8F8FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFD9E9E9EABAAAAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBADADAD999898F8F8F8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD9E9E9EA1A0A0F7F7F7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEBAB9B97F
          7E7EBDBDBDCFCFCFCACACACACACACACACACACACACECECEC1C1C1807F7FB2B1B1
          FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFEDEDEDA5A4A4807F7F8584848686868685858685858686868584847F
          7E7E9F9E9EE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 4
        Transparent = True
        OnClick = btnReimprimirClick
      end
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 89
    Width = 1079
    Height = 523
    ActivePage = TS_Vendedor
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    FixedDimension = 19
    object TS_Vendedor: TRzTabSheet
      Caption = 'Vendedor'
      object Panel1: TPanel
        Left = 544
        Top = 5
        Width = 185
        Height = 32
        TabOrder = 0
        object ckImpCupom: TCheckBox
          Left = 16
          Top = 8
          Width = 151
          Height = 17
          Caption = 'Imprimir com os Cupons'
          TabOrder = 0
        end
      end
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 0
        Width = 1075
        Height = 500
        Align = alClient
        Ctl3D = False
        DataSource = DMComissao.dsComissao
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
        GridStyle.Style = gsBrick
        GridStyle.OddColor = 13623263
        GridStyle.EvenColor = 10534847
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_VENDEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'ID Vendedor'
            Title.Color = 16777136
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_VENDEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Vendedor'
            Title.Color = 16777136
            Width = 407
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Base Comiss'#227'o'
            Title.Color = 16777136
            Width = 113
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PERC_COMISSAO'
            Title.Alignment = taCenter
            Title.Caption = '% Comiss'#227'o'
            Title.Color = 16777136
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clVlr_Comissao'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Comiss'#227'o'
            Title.Color = 16777136
            Width = 85
            Visible = True
          end>
      end
    end
    object TS_Vendedor_Det: TRzTabSheet
      Caption = 'Detalhado'
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 0
        Width = 1075
        Height = 500
        Align = alClient
        Ctl3D = False
        DataSource = DMComissao.dsComissao_Det
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        GridStyle.Style = gsBrick
        GridStyle.OddColor = 13623263
        GridStyle.EvenColor = 10534847
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 10
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_VENDEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'ID Vendedor'
            Title.Color = 13303754
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_VENDEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Vendedor'
            Title.Color = 13303754
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Total'
            Title.Color = 13303754
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUMCUPOM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Cupom'
            Title.Color = 13303754
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SERIE'
            Title.Alignment = taCenter
            Title.Caption = 'S'#233'rie'
            Title.Color = 13303754
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTEMISSAO'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Emiss'#227'o'
            Title.Color = 13303754
            Width = 82
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIPO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Title.Color = 13303754
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cliente'
            Title.Color = 13303754
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TERMINAL_ID'
            Title.Alignment = taCenter
            Title.Caption = 'Terminal'
            Title.Color = 13303754
            Visible = True
          end>
      end
    end
  end
end
