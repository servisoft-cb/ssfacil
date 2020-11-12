object frmCadOrcamento_Aprov: TfrmCadOrcamento_Aprov
  Left = 194
  Top = 53
  Width = 984
  Height = 596
  Caption = 'frmCadOrcamento_Aprov'
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
    Width = 976
    Height = 33
    Align = alTop
    Color = clSilver
    TabOrder = 0
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 89
    Width = 976
    Height = 362
    Hint = 'Click bot'#227'o direto para selecionar todos'
    Align = alClient
    Ctl3D = False
    DataSource = DMCadPedido.dsmOrcamento_Itens
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
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
    ExOptions = [eoBooleanAsCheckBox, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 13
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_Orcamento'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'ID Orcamento'
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Item'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_Produto'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'ID Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Grupo'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Grupo'
        Width = 133
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Espessura'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Produto'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vlr_Unitario'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Unit'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vlr_Desconto'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Desconto'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vlr_Total'
        ReadOnly = True
        Title.Caption = 'Vlr. Total'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Aprovar'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reprovar'
        Width = 52
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 976
    Height = 56
    Align = alTop
    Color = clSilver
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Cliente:'
    end
    object DBText1: TDBText
      Left = 54
      Top = 8
      Width = 387
      Height = 13
      DataField = 'NOME_CLIENTE'
      DataSource = DMCadPedido.dsPedido
    end
    object Label2: TLabel
      Left = 66
      Top = 24
      Width = 139
      Height = 25
      Caption = 'Sem Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnConfirmar: TNxButton
      Left = 596
      Top = 20
      Width = 153
      Height = 30
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
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
  end
  object gbxDuplicata: TRzGroupBox
    Left = 0
    Top = 451
    Width = 976
    Height = 114
    Align = alBottom
    BorderColor = clMaroon
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    BorderWidth = 1
    Caption = ' Dados da Reprova'#231#227'o'
    Ctl3D = True
    FlatColor = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    VisualStyle = vsGradient
    object Label3: TLabel
      Left = 104
      Top = 24
      Width = 26
      Height = 13
      Caption = 'Data:'
    end
    object Label4: TLabel
      Left = 7
      Top = 32
      Width = 35
      Height = 13
      Caption = 'Motivo:'
    end
    object DateEdit1: TDateEdit
      Left = 136
      Top = 16
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 6
      Top = 45
      Width = 964
      Height = 63
      Align = alBottom
      Ctl3D = False
      ParentCtl3D = False
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 408
    Top = 49
    object SelecionarTodos1: TMenuItem
      Caption = 'Selecionar Todos'
      OnClick = SelecionarTodos1Click
    end
  end
end
