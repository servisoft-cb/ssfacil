object frmCadInventario_Prod: TfrmCadInventario_Prod
  Left = 203
  Top = 28
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadInventario_Prod'
  ClientHeight = 617
  ClientWidth = 1079
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
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 1079
    Height = 617
    ActivePage = TS_Arquivo
    ActivePageDefault = TS_Produto
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    FixedDimension = 19
    object TS_Produto: TRzTabSheet
      Caption = 'Por Produto'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1075
        Height = 85
        Align = alTop
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 32
          Top = 68
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object Label2: TLabel
          Left = 9
          Top = 44
          Width = 54
          Height = 13
          Caption = 'ID Produto:'
        end
        object Label3: TLabel
          Left = 229
          Top = 44
          Width = 55
          Height = 13
          Caption = 'Refer'#234'ncia:'
        end
        object Label4: TLabel
          Left = 294
          Top = 9
          Width = 331
          Height = 18
          Caption = 'Saldo do Estoque at'#233' dia 08/01/2021'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object NxButton3: TNxButton
          Left = 413
          Top = 56
          Width = 149
          Height = 27
          Caption = 'Efetuar Pesquisa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = NxButton3Click
        end
        object RadioGroup1: TRadioGroup
          Left = 7
          Top = 1
          Width = 251
          Height = 32
          Caption = ' Op'#231#227'o '
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Ambos'
            'Com Saldo'
            'Negativo')
          TabOrder = 0
          OnClick = RadioGroup1Click
        end
        object Edit1: TEdit
          Left = 64
          Top = 60
          Width = 347
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object CurrencyEdit1: TCurrencyEdit
          Left = 64
          Top = 37
          Width = 76
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 1
        end
        object Edit2: TEdit
          Left = 291
          Top = 37
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
        end
      end
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 85
        Width = 1075
        Height = 342
        Align = alClient
        Ctl3D = False
        DataSource = DMCadInventario.dsProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
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
        ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 27
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 11
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Alignment = taCenter
            Title.Caption = 'Nome'
            Width = 348
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Unid.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAMANHO'
            Title.Alignment = taCenter
            Title.Caption = 'Tamanho'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cor'
            Width = 204
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_CUSTO'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o Custo'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Atual'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_GERAL'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Geral'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_GRUPO'
            Title.Alignment = taCenter
            Title.Caption = 'Grupo'
            Width = 64
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 557
        Width = 1075
        Height = 37
        Align = alBottom
        Color = 8404992
        TabOrder = 2
        object btnConfirmar: TNxButton
          Left = 2
          Top = 1
          Width = 291
          Height = 30
          Hint = 'Importar os produtos selecionados'
          Caption = 'Copiar os Selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Glyph.Data = {
            AE060000424DAE06000000000000360000002800000017000000170000000100
            1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
            224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
            3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
            5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
            4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
            402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
            4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
            4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
            0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
            0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
            04550500550505560707540B065309065008044D06034D050042002F65312860
            2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
            54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
            044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
            0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
            550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
            2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
            C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
            00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
            FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
            002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
            FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
            07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
            DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
            C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
            5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
            FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
            000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
            056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
            022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
            9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
            B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
            8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
            FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
            B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
            2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
            0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
            5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
            299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
            C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
            36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
            4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
            984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
            FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
            7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
            B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
            CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OnClick = btnConfirmarClick
        end
        object ProgressBar1: TProgressBar
          Left = 412
          Top = 8
          Width = 545
          Height = 17
          TabOrder = 1
          Visible = False
        end
      end
      object NxFlipPanel1: TNxFlipPanel
        Left = 0
        Top = 427
        Width = 1075
        Height = 130
        Align = alBottom
        Caption = 
          'Produtos n'#227'o gravados no invent'#225'rio atual, pois j'#225' constam em in' +
          'vent'#225'rios n'#227'o encerrados'
        CollapseGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFFFFF0
          F0FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF8FFFFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        Color = clSilver
        ExpandGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FF604830FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FF604830FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFF6048
          30FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFF604830FFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clRed
        HeaderFont.Height = -13
        HeaderFont.Name = 'Verdana'
        HeaderFont.Style = [fsBold]
        ParentFont = False
        ParentHeaderFont = False
        FullHeight = 0
        object SMDBGrid2: TSMDBGrid
          Left = 0
          Top = 18
          Width = 1075
          Height = 112
          Align = alClient
          Ctl3D = False
          DataSource = DMCadInventario.dsmNaoGravados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Verdana'
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
          DefaultRowHeight = 16
          ScrollBars = ssHorizontal
          ColCount = 6
          RowCount = 2
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ID Produto'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 76
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_Cor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ID Cor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Tamanho'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Num_Inventario'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Invent'#225'rio'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 99
              Visible = True
            end>
        end
      end
    end
    object TS_Arquivo: TRzTabSheet
      Caption = 'Por Arquivo'
      object NxPanel1: TNxPanel
        Left = 0
        Top = 0
        Width = 1075
        Height = 152
        Align = alTop
        UseDockManager = False
        ParentBackground = False
        TabOrder = 0
        object NxLabel1: TNxLabel
          Left = 16
          Top = 13
          Width = 46
          Height = 13
          Caption = '1'#186' Coluna'
          Transparent = True
          HorizontalPosition = hpLeft
          InnerHorizontal = True
          InnerVertical = False
          InnerMargins.Horizontal = 0
          InnerMargins.Vertical = 2
          VerticalPosition = vpTop
        end
        object NxLabel2: TNxLabel
          Left = 140
          Top = 13
          Width = 46
          Height = 13
          Caption = '2'#186' Coluna'
          Transparent = True
          HorizontalPosition = hpLeft
          InnerHorizontal = True
          InnerVertical = False
          InnerMargins.Horizontal = 0
          InnerMargins.Vertical = 2
          VerticalPosition = vpTop
        end
        object NxLabel3: TNxLabel
          Left = 263
          Top = 13
          Width = 46
          Height = 13
          Caption = '3'#186' Coluna'
          Transparent = True
          HorizontalPosition = hpLeft
          InnerHorizontal = True
          InnerVertical = False
          InnerMargins.Horizontal = 0
          InnerMargins.Vertical = 2
          VerticalPosition = vpTop
        end
        object NxLabel4: TNxLabel
          Left = 386
          Top = 13
          Width = 46
          Height = 13
          Caption = '4'#186' Coluna'
          Transparent = True
          HorizontalPosition = hpLeft
          InnerHorizontal = True
          InnerVertical = False
          InnerMargins.Horizontal = 0
          InnerMargins.Vertical = 2
          VerticalPosition = vpTop
        end
        object NxLabel5: TNxLabel
          Left = 16
          Top = 61
          Width = 67
          Height = 13
          Caption = 'Separado por:'
          Transparent = True
          HorizontalPosition = hpLeft
          InnerHorizontal = True
          InnerVertical = False
          InnerMargins.Horizontal = 0
          InnerMargins.Vertical = 2
          VerticalPosition = vpTop
        end
        object NxLabel6: TNxLabel
          Left = 25
          Top = 81
          Width = 58
          Height = 13
          Caption = 'Quantidade:'
          Transparent = True
          HorizontalPosition = hpLeft
          InnerHorizontal = True
          InnerVertical = False
          InnerMargins.Horizontal = 0
          InnerMargins.Vertical = 2
          VerticalPosition = vpTop
        end
        object NxLabel7: TNxLabel
          Left = 44
          Top = 102
          Width = 39
          Height = 13
          Caption = 'Arquivo:'
          Transparent = True
          HorizontalPosition = hpLeft
          InnerHorizontal = True
          InnerVertical = False
          InnerMargins.Horizontal = 0
          InnerMargins.Vertical = 2
          VerticalPosition = vpTop
        end
        object NxComboBox1: TNxComboBox
          Left = 16
          Top = 30
          Width = 121
          Height = 21
          Cursor = crArrow
          TabOrder = 0
          ReadOnly = True
          HideFocus = False
          Style = dsDropDownList
          AutoCompleteDelay = 0
          ItemIndex = 0
          Items.Strings = (
            ''
            'Cod.Barra'
            'ID Produto'
            'Refer'#234'ncia'
            'Qtd'
            'Pre'#231'o Custo'
            'Pre'#231'o Venda')
        end
        object NxComboBox2: TNxComboBox
          Left = 140
          Top = 30
          Width = 121
          Height = 21
          Cursor = crArrow
          TabOrder = 1
          ReadOnly = True
          HideFocus = False
          Style = dsDropDownList
          AutoCompleteDelay = 0
          ItemIndex = 0
          Items.Strings = (
            ''
            'Cod.Barra'
            'ID Produto'
            'Refer'#234'ncia'
            'Qtd'
            'Pre'#231'o Custo'
            'Pre'#231'o Venda')
        end
        object NxComboBox3: TNxComboBox
          Left = 263
          Top = 30
          Width = 121
          Height = 21
          Cursor = crArrow
          TabOrder = 2
          ReadOnly = True
          HideFocus = False
          Style = dsDropDownList
          AutoCompleteDelay = 0
          ItemIndex = 0
          Items.Strings = (
            ''
            'Cod.Barra'
            'ID Produto'
            'Refer'#234'ncia'
            'Qtd'
            'Pre'#231'o Custo'
            'Pre'#231'o Venda')
        end
        object NxComboBox4: TNxComboBox
          Left = 386
          Top = 30
          Width = 121
          Height = 21
          Cursor = crArrow
          TabOrder = 3
          ReadOnly = True
          HideFocus = False
          Style = dsDropDownList
          AutoCompleteDelay = 0
          ItemIndex = 0
          Items.Strings = (
            ''
            'Cod.Barra'
            'ID Produto'
            'Refer'#234'ncia'
            'Qtd'
            'Pre'#231'o Custo'
            'Pre'#231'o Venda')
        end
        object Edit3: TEdit
          Left = 86
          Top = 53
          Width = 29
          Height = 19
          Color = clSilver
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '  ;'
        end
        object NxComboBox5: TNxComboBox
          Left = 86
          Top = 73
          Width = 191
          Height = 21
          Cursor = crArrow
          TabOrder = 5
          Text = 'Conforme Registros Lan'#231'ados'
          ReadOnly = True
          HideFocus = False
          Style = dsDropDownList
          AutoCompleteDelay = 0
          ItemIndex = 1
          Items.Strings = (
            'Informar no arquivo'
            'Conforme Registros Lan'#231'ados')
        end
        object btnGerarAuxiliar: TNxButton
          Left = 86
          Top = 118
          Width = 145
          Height = 30
          Caption = 'Gerar Auxiliar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnClick = btnGerarAuxiliarClick
        end
        object FilenameEdit1: TFilenameEdit
          Left = 86
          Top = 93
          Width = 496
          Height = 21
          Ctl3D = False
          NumGlyphs = 1
          ParentCtl3D = False
          TabOrder = 6
        end
        object btnGravarInventario: TNxButton
          Left = 246
          Top = 118
          Width = 145
          Height = 30
          Caption = 'Gravar Invent'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnClick = btnGravarInventarioClick
        end
        object gbxVendedor: TRzGroupBox
          Left = 777
          Top = 10
          Width = 244
          Height = 124
          BorderColor = clNavy
          BorderInner = fsButtonUp
          BorderOuter = fsBump
          Caption = ' Registros '
          Ctl3D = True
          FlatColor = clNavy
          FlatColorAdjustment = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
          VisualStyle = vsGradient
          object NxLabel9: TNxLabel
            Left = 90
            Top = 18
            Width = 55
            Height = 13
            Caption = 'Total Geral:'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object lblTotal: TNxLabel
            Left = 151
            Top = 17
            Width = 6
            Height = 13
            Caption = '0'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object lblGravados: TNxLabel
            Left = 151
            Top = 50
            Width = 6
            Height = 13
            Caption = '0'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object NxLabel12: TNxLabel
            Left = 29
            Top = 50
            Width = 116
            Height = 13
            Caption = 'Total Gravados (Linhas):'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object lblErro: TNxLabel
            Left = 151
            Top = 66
            Width = 6
            Height = 13
            Caption = '0'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object NxLabel14: TNxLabel
            Left = 32
            Top = 66
            Width = 113
            Height = 13
            Caption = 'Total Com Erro (Linhas):'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object NxLabel8: TNxLabel
            Left = 90
            Top = 34
            Width = 55
            Height = 13
            Caption = 'Total Lidos:'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object lblLidos: TNxLabel
            Left = 151
            Top = 34
            Width = 6
            Height = 13
            Caption = '0'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object NxLabel10: TNxLabel
            Left = 9
            Top = 90
            Width = 136
            Height = 13
            Caption = 'Total de Produtos Gravados:'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object lblProdutosGravados: TNxLabel
            Left = 151
            Top = 90
            Width = 6
            Height = 13
            Caption = '0'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object NxLabel13: TNxLabel
            Left = 12
            Top = 106
            Width = 133
            Height = 13
            Caption = 'Total de Produtos Com Erro:'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
          object lblProdutosErro: TNxLabel
            Left = 151
            Top = 106
            Width = 6
            Height = 13
            Caption = '0'
            Transparent = True
            HorizontalPosition = hpLeft
            InnerHorizontal = True
            InnerVertical = False
            InnerMargins.Horizontal = 0
            InnerMargins.Vertical = 2
            VerticalPosition = vpTop
          end
        end
      end
      object SMDBGrid3: TSMDBGrid
        Left = 0
        Top = 152
        Width = 1075
        Height = 236
        Align = alClient
        Ctl3D = False
        DataSource = DMCadInventario.dsmAuxInventario
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
        ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 8
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CodBarra'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Referencia'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Produto'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qtd'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Preco_Custo'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Preco_Venda'
            Width = 92
            Visible = True
          end>
      end
      object NxFlipPanel2: TNxFlipPanel
        Left = 0
        Top = 388
        Width = 1075
        Height = 206
        Align = alBottom
        Caption = 'C'#243'digos N'#227'o Encontrados no Cadastro do Produtos'
        CollapseGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFFFFF0
          F0FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF8FFFFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        Color = clSilver
        ExpandGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FF604830FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FF604830FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFF6048
          30FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFF604830FFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clRed
        HeaderFont.Height = -11
        HeaderFont.Name = 'Verdana'
        HeaderFont.Style = [fsBold]
        ParentFont = False
        FullHeight = 0
        object SMDBGrid4: TSMDBGrid
          Left = 0
          Top = 18
          Width = 579
          Height = 188
          Align = alLeft
          Ctl3D = False
          DataSource = DMCadInventario.dsmAuxErro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clRed
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
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
          ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          RowCount = 2
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Codigo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ID'
              Title.Color = 8454143
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Cod_Barra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Barra'
              Title.Color = 8454143
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 152
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Referencia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Refer'#234'ncia'
              Title.Color = 8454143
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 183
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Qtd'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Qtde.'
              Title.Color = 8454143
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = []
              Width = 57
              Visible = True
            end>
        end
        object SMDBGrid5: TSMDBGrid
          Left = 618
          Top = 18
          Width = 457
          Height = 188
          Align = alRight
          Ctl3D = False
          DataSource = DMCadInventario.dsmAuxErroLinha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clRed
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
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
          ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
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
              FieldName = 'Numero_Linha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'N'#186' da Linha'
              Title.Color = 11064319
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Linha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Color = 11064319
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
    end
  end
end
