object frmConsEstoque_Prod_Mov: TfrmConsEstoque_Prod_Mov
  Left = 226
  Top = 106
  BorderStyle = bsSingle
  Caption = 'Consulta Estoque Movimento'
  ClientHeight = 518
  ClientWidth = 941
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 941
    Height = 106
    Align = alTop
    Color = clActiveCaption
    TabOrder = 0
    object Label3: TLabel
      Left = 37
      Top = 58
      Width = 72
      Height = 14
      Alignment = taRightJustify
      Caption = 'Data In'#237'cio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 220
      Top = 58
      Width = 34
      Height = 14
      Caption = 'Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 48
      Top = 27
      Width = 55
      Height = 14
      Alignment = taRightJustify
      Caption = 'Produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 72
      Top = 9
      Width = 32
      Height = 14
      Alignment = taRightJustify
      Caption = 'Filial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object DateEdit1: TDateEdit
      Left = 110
      Top = 50
      Width = 100
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      StartOfWeek = Sun
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 254
      Top = 50
      Width = 100
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      StartOfWeek = Sun
      TabOrder = 1
    end
    object btnConsultar: TNxButton
      Left = 110
      Top = 73
      Width = 175
      Height = 30
      Caption = 'Efetuar Pesquisa'
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
      TabOrder = 2
      Transparent = True
      OnClick = btnConsultarClick
    end
    object Edit1: TEdit
      Left = 110
      Top = 5
      Width = 429
      Height = 20
      TabStop = False
      AutoSize = False
      Color = clActiveCaption
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object Edit3: TEdit
      Left = 178
      Top = 24
      Width = 361
      Height = 20
      TabStop = False
      AutoSize = False
      Color = clActiveCaption
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 110
      Top = 24
      Width = 73
      Height = 20
      TabStop = False
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 5
      OnExit = CurrencyEdit1Exit
      OnKeyDown = CurrencyEdit1KeyDown
    end
  end
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 106
    Width = 941
    Height = 412
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
    object SMDBGrid1: TSMDBGrid
      Left = 10
      Top = 10
      Width = 921
      Height = 324
      Align = alClient
      Ctl3D = False
      DataSource = DMConsEstoque.dsEstoque_Mov
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
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
      ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
      OnGetCellParams = SMDBGrid1GetCellParams
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 16
      ScrollBars = ssHorizontal
      ColCount = 37
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FILIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Filial'
          Title.Color = 12910472
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_LOCAL'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Local'
          Title.Color = 12910472
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_LOCAL'
          Title.Alignment = taCenter
          Title.Caption = 'Local Estoque'
          Title.Color = 12910472
          Width = 138
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO_ES'
          Title.Alignment = taCenter
          Title.Caption = 'E / S'
          Title.Color = 12910472
          Width = 32
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO_MOV'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo Movim.'
          Title.Color = 12910472
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODCFOP'
          Title.Alignment = taCenter
          Title.Caption = 'CFOP'
          Title.Color = 12910472
          Width = 41
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUMNOTA'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Documento'
          Title.Color = 12910472
          Width = 84
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTMOVIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Data Movimento'
          Title.Color = 12910472
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Caption = 'Unidade'
          Title.Color = 12910472
          Width = 48
          Visible = True
        end
        item
          Color = 16777088
          Expanded = False
          FieldName = 'QTD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Title.Color = 12910472
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_UNITARIO'
          Title.Caption = 'Vlr. Unit'#225'rio'
          Title.Color = 12910472
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPRIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Comprimento'
          Title.Color = 12910472
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LARGURA'
          Title.Alignment = taCenter
          Title.Caption = 'Largura'
          Title.Color = 12910472
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ESPESSURA'
          Title.Alignment = taCenter
          Title.Caption = 'Espessura'
          Title.Color = 12910472
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAMANHO'
          Title.Alignment = taCenter
          Title.Caption = 'Tamanho'
          Title.Color = 12910472
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_COR'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Cor'
          Title.Color = 12910472
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Custo'
          Title.Color = 12910472
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_CUSTO_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Custo Total'
          Title.Color = 12910472
          Width = 64
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_LOTE_CONTROLE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Lote Controle'
          Title.Color = 12910472
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPESSOA'
          Title.Caption = 'Cliente / Fornecedor'
          Title.Color = 12910472
          Width = 227
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERC_ICMS'
          Title.Caption = '% ICMS'
          Title.Color = 12910472
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERC_IPI'
          Title.Caption = '% IPI'
          Title.Color = 12910472
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_DESCONTO'
          Title.Caption = 'Vlr. Desconto'
          Title.Color = 12910472
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_FRETE'
          Title.Caption = 'Vlr. Frete'
          Title.Color = 12910472
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Title.Alignment = taCenter
          Title.Caption = 'S'#233'rie Nota'
          Title.Color = 12910472
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_PESSOA'
          Title.Caption = 'ID Pessoa'
          Title.Color = 12910472
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE_ORIG'
          Title.Alignment = taCenter
          Title.Caption = 'Unid. da Nota'
          Title.Color = 12910472
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_ORIG'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. da Nota'
          Title.Color = 12910472
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_UNITARIOORIG'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Unit'#225'rio da Nota'
          Title.Color = 12910472
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_GRUPO'
          Title.Alignment = taCenter
          Title.Caption = 'Estrutura'
          Title.Color = 12910472
          Width = 183
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Title.Color = 12910472
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Produto'
          Title.Color = 12910472
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPRODUTO'
          Title.Caption = 'Nome Produto'
          Title.Color = 12910472
          Width = 178
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CENTROCUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Centro Custo'
          Title.Color = 12910472
          Width = 186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_COR'
          Title.Alignment = taCenter
          Title.Caption = 'ID Cor'
          Title.Color = 12910472
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'ID Estoque'
          Title.Color = 12910472
          Visible = True
        end>
    end
    object RzGroupBox2: TRzGroupBox
      Left = 10
      Top = 334
      Width = 921
      Height = 68
      Align = alBottom
      BorderColor = clBlue
      BorderInner = fsButtonUp
      BorderOuter = fsBump
      Caption = ' Total '
      Color = clActiveCaption
      Ctl3D = True
      FlatColor = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      VisualStyle = vsGradient
      object Label5: TLabel
        Left = 107
        Top = 18
        Width = 144
        Height = 13
        Alignment = taRightJustify
        Caption = 'Entradas Conforme Filtro:'
      end
      object lblEntrada: TLabel
        Left = 254
        Top = 18
        Width = 119
        Height = 13
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 115
        Top = 35
        Width = 134
        Height = 13
        Caption = 'Sa'#237'das Conforme Filtro:'
      end
      object lblSaida: TLabel
        Left = 253
        Top = 35
        Width = 119
        Height = 13
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 74
        Top = 49
        Width = 175
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saldo Conforme o Filtro Acima:'
      end
      object lblSaldo: TLabel
        Left = 254
        Top = 49
        Width = 149
        Height = 13
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 513
        Top = 10
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saldo Anterior:'
      end
      object Label7: TLabel
        Left = 603
        Top = 10
        Width = 149
        Height = 13
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 603
        Top = 35
        Width = 149
        Height = 13
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 522
        Top = 35
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Saldo F'#237'sico:'
      end
      object NxButton1: TNxButton
        Left = 836
        Top = 10
        Width = 75
        Caption = 'Calcular'
        TabOrder = 0
        OnClick = NxButton1Click
      end
    end
  end
end
