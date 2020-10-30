object frmBaixaPedido_Processo: TfrmBaixaPedido_Processo
  Left = 141
  Top = 46
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Baixa Pedido por Processo'
  ClientHeight = 543
  ClientWidth = 1049
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
  object gbxDuplicata: TRzGroupBox
    Left = 0
    Top = 41
    Width = 1049
    Height = 502
    Align = alClient
    BorderColor = clMaroon
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    BorderWidth = 1
    Caption = ' C'#243'digo de Barras '
    Color = 14402992
    Ctl3D = True
    FlatColor = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    VisualStyle = vsGradient
    object Shape1: TShape
      Left = 11
      Top = 16
      Width = 338
      Height = 174
      Brush.Color = 14402992
    end
    object Label2: TLabel
      Left = 21
      Top = 85
      Width = 93
      Height = 18
      Caption = 'C'#243'd. Barra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 25
      Top = 388
      Width = 260
      Height = 36
      Caption = 'PEDIDO ITEM N'#195'O ENCONTRADO'#13#10'TESTE'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 123
      Top = 74
      Width = 213
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object SMDBGrid1: TSMDBGrid
      Left = 358
      Top = 16
      Width = 673
      Height = 174
      Color = 14402992
      Ctl3D = False
      DataSource = DMConferencia.dsConsPedido_Item_Proc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -12
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
      GridStyle.OddColor = clBtnFace
      GridStyle.EvenColor = clBtnFace
      GridStyle.Bands.StartColor = clBtnFace
      GridStyle.Footer.StartColor = clBtnFace
      TitleHeight.PixelCount = 24
      FooterColor = clBtnFace
      ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoTitleWordWrap]
      OnGetCellParams = SMDBGrid1GetCellParams
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 19
      ScrollBars = ssHorizontal
      ColCount = 7
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_PROCESSO'
          Title.Alignment = taCenter
          Title.Caption = 'Processo'
          Title.Color = 12582847
          Width = 266
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTENTRADA'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Entrada'
          Title.Color = 12582847
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HRENTRADA'
          Title.Alignment = taCenter
          Title.Caption = 'Hr. Entrada'
          Title.Color = 12582847
          Width = 64
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTBAIXA'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Baixa'
          Title.Color = 12582847
          Width = 69
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HRSAIDA'
          Title.Alignment = taCenter
          Title.Caption = 'Hr. Baixa'
          Title.Color = 12582847
          Width = 64
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'LER_TALAO'
          Title.Alignment = taCenter
          Title.Caption = 'Ler'
          Title.Color = 12582847
          Width = 37
          Visible = True
        end>
    end
    object btnConsultarSaldoSMS: TNxButton
      Left = 850
      Top = 385
      Width = 197
      Height = 30
      Caption = 'Consultar Saldo SMS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        76060000424D760600000000000036000000280000001A000000140000000100
        1800000000004006000000000000000000000000000000000000F6F9FDFAFBFC
        FBFCFBF9FBF9F8FDFCF4F9FBFAFCFFF7F7F9F9FBFBF7FEFBF7FEFBF7F9FCFAFA
        FDF5FEFAF3FCF1F6FCF1F5FEF8EDFFFDEBFFFFD2F4F69DCACCC9EFEEEBFFFEF5
        FDFAFAFEF9FCFDF90000EEFFFFF0FEFEF5FFFFEDF9F9EEFEFDF0FFFFF0FDFEF5
        FDFCF5FDFAF4FDFBEDFBF7F4FFFFEFFBFFEDFEFEEEFBF7F8FEFBEEFBF9EAFFFE
        E7FFFFC8F3F699CED3BCEDEDE1FFFFEFFCFDF5FCFCFBFBFD0000D8FBF8C9EAEA
        D1EFF5D1F4FBCFF5FAC5ECF0D3F0EFE6F9F6EDF9F6EFFEFCE9FFFDD9F6F9CCEE
        F4D0F1F5E1FAFDEDFCFEEBFFFFDEFAFDC9ECF4ABE2EB7FC3CA98DADEC6F5F8E0
        FCFFEDF9FEF7F9FE0000C0F0F178AFB77EC0D170C0D471C4D776B9C78DBBC0DC
        F3F4EEF9FEECFDFFD1F4F99DCFDC81BCCA83BBC5A8D5DCDDFDFFC9EDF39FCAD3
        84B3C17FC1CF6BBAC672C3CB7DC0C7A9D8E1D7F6FDE6FCFF0000CBFBFC89CBD9
        5AB5CC4ABAD844B3CF66BED1A8DCE9DFF8FDEFFDFFE0FAFF9FD3E276BECF5EAE
        C176BCC799D4DDB7E7EE96C8CF6CA2AA9DD6E3A1E6F379CAD690E2EA8BD4DB70
        ADB6A4D7E4D1FDFF0000E8FFFFC4F6FF85D9F34EBCDD4AB8D4A2EFFED6FFFFE5
        FDFCE3FFFFB0E8ED75C6CE64C2CE65C3CEAEF4FBC9FFFFB1E5E583BEBD94D5D3
        D0FFFFC0F8FC95CDD6B2E9EECCFFFF96D2D568ABAFADF4F70000F0F9FDD7FBFF
        98E0F654BED753BDD4ADEEFCD7FAFEE5FDFED8FFFF7FCAD26DCCD854B1C18EDE
        ECCFFFFFD5FFFFC6EFEF6EA1A2CDFFFFD7FFFFC7F4F494C9CABBEEEECFFFFFAB
        E6E966B0B796ECF40000F5F8FFDBF7FE9DDDEE5DC3D458BECEB5EFFBE0FEFFE7
        FFFFB0E8ED68C2D354B9CC6CBFD4BBF3FFE3FFFFE9FCFEE2F7F88DADB1E2FFFF
        E5FBFCD2F6F592CAC8B1ECE9C3FDFD9DDEE86AB9C984E2F20000EEFEFFD8FCFF
        9CE0EF5CC4D54EBACAB1F2FDD3FEFFDDFFFF73BCC876D5E656B4C79FE3F0D7FF
        FFEDFAFFF5FBFEF1F8FBE1F1F4E8FBFEEEFDFECFF1F79BD4DBA9F2F995E5F078
        CCDF57ACC390EAF50000E3FCF4CFF9FB9CE1F257C3DA50C6DAB3FFFFD2FFFF8E
        CECFA1FAFC3D9FB667BDCFB8EFF4E5FFFDF1F6FFFBF9FFFBFDFFF9FFFFE6F8FB
        ECFFFFD4FFFF81BFD55CB0C57BDAF26ECEE74EA3BA95E5F60000FCFFFEE1FAFF
        9BD9F256C6E630B0CD46A5B84899A666BCC235A5B847B8D088DFEFC9FFFFE5FE
        FCFFFDFFFEF6FAFCF9FAF2FAFFD5F7F883C4CF50A1B867C2E27DE0FE50B1CC45
        9CB38AD1E2C4FEFF0000FAF9F9E0F7FFA3DFF555C2E13DBAD46FC8D887CED687
        CCD26ACCD84BB5CA6DC6DCADEBF3DAFCF9F5FDFAFBFDFCF4FCFDD9F1F37DB4C2
        6EC5D466CDE357BEDD4CABC763B3C992D1E1C8F9FED5FEFE0000FBFFFFDDF7FF
        A2E0F252BDD548BDD1A9F5FFD3FFFFDBFFFFBAFFFF7CD6E257B3C26AB5C0BFF1
        F3EDFFFBEEFDF8E7FEFD97C5D08AD6E657BBCC4AB6CC55BAD484D5E8B5EEF6DA
        FFFFE3FFFFE6FEF90000F4FBFDDDFBFF9CDCEE5BC1D850BCD1ACF2FDD9FFFFE6
        FDFAD5FFFFA7F2FB6DCBDD5FB4C49ADBE6E7FFFFE5FEFCCEF2F5A2E1ED65B8C8
        6BC3D08FE6F77BCBDCACECF5D8FFFFD0EDF1DBF3F4E9FFFB0000F0FDFDD2F5FE
        A0E1F55EBFD853B8D0B1F1FDDFFFFFEAF8F7E2FFFFB0F4FA6ECCDF61B8CE8ED0
        E2E3FFFFE4FFFFCEF6FA8AD1DA5AB2BDB3FAFFB5F7FC8BC9D4ACE3E5D4FFFFB2
        D4D8BEDADBE9FFFE0000EAFFFCCDFCFE92E1F157BED857B7D2B5F2FFD9FBFEEE
        FFFFD3FBFF8ED9E767CCDF5BB0C39FD6E5EAFFFFEEFFFFE5FFFF8FCED55BAAB1
        C3FFFFBEF8FE8CC7D6B3F2F8C4FEFF9BD2D798C1C6D9FAFC0000DDFFFFB8F3F8
        77D2E44EBED749B0CDA1EAFACAFCFFD0FBFCACE8F271C2D359B7CB6FB6CABFE8
        F4F3FFFFF2F9FDF0FFFFC8F6FA6CAFB690CBD0A7E5F086CAD999E0E990CFD881
        B6BD9DC4CADEFBFC0000ACD7E071B3BE4EAEBF40B3C841ABC569B9CF81C7D583
        C6D061AEB95BACBD6EBACDABDEEFE5FCFFF5FAFDFBFBFBF3FAFAE6FFFFB8E8EB
        90C6CB7FC1CC6DB8C673BBC588C4CCA3CFD9D0EEF1E9FFFD0000B4D8E89ACCD9
        9BDFE98EDDE895DEED9BD0E29DD3E08CC8CE95D4D8A2D8E1C6F3FCDAFCFFE3FA
        FBF8FEFFF6F9F8F6FCFBEFFBFEE6FCFED6FBFCB1E6EB84C5CCA8E4E9CAF5F9E2
        F9FEEEFDFFEDFBF90000DEFAFFD9FDFFD3FEFFD0FFFFD1FEFFDEFDFFD6FEFFCB
        FBFDD4FFFFDFFFFFE5FBFCE9FCFDECFFFCF1FAFBF4FBFBF1FAF9F7F9FDF9FEFE
        EAFFFFCBF5F797CED2BAECECE2FFFFF1F9FCF7FBFDF5FBFA0000}
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 2
      Transparent = True
      OnClick = btnConsultarSaldoSMSClick
    end
    object NxPanel1: TNxPanel
      Left = 11
      Top = 198
      Width = 1020
      Height = 145
      UseDockManager = False
      ParentBackground = False
      TabOrder = 3
      object Label1: TLabel
        Left = 17
        Top = 16
        Width = 668
        Height = 120
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 1049
    Height = 41
    Align = alTop
    BorderColor = clBlack
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    Caption = ' Funcion'#225'rio '
    Color = 16755370
    Ctl3D = True
    FlatColor = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    VisualStyle = vsGradient
    object Label4: TLabel
      Left = 32
      Top = 19
      Width = 49
      Height = 13
      Caption = 'N'#186' Cart'#227'o:'
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 82
      Top = 14
      Width = 80
      Height = 19
      AutoSize = False
      Color = 16755370
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 0
      OnExit = CurrencyEdit2Exit
      OnKeyDown = CurrencyEdit2KeyDown
    end
    object Edit2: TEdit
      Left = 164
      Top = 14
      Width = 475
      Height = 19
      CharCase = ecUpperCase
      Color = 16755370
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
  end
end
