object frmCadPedido_TipoItem: TfrmCadPedido_TipoItem
  Left = 329
  Top = 103
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadPedido_TipoItem'
  ClientHeight = 540
  ClientWidth = 747
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 747
    Height = 506
    ActivePage = TS_Chapas
    ActivePageDefault = TS_Chapas
    Align = alClient
    BackgroundColor = 8404992
    BoldCurrentTab = True
    UseColoredTabs = True
    ParentBackgroundColor = False
    ShowShadow = False
    TabIndex = 0
    TabOrder = 0
    TextColors.DisabledShadow = clActiveCaption
    TextColors.Selected = 8404992
    OnChange = RzPageControl1Change
    FixedDimension = 19
    object TS_Chapas: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'Chapas'
      object Label1: TLabel
        Left = 39
        Top = 16
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome Produto:'
      end
      object Label3: TLabel
        Left = 21
        Top = 37
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comprimento (mm):'
      end
      object Label4: TLabel
        Left = 46
        Top = 58
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Largura (mm):'
      end
      object Label5: TLabel
        Left = 33
        Top = 79
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Espessura (mm):'
      end
      object Label6: TLabel
        Left = 61
        Top = 100
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pre'#231'o KG:'
      end
      object Label7: TLabel
        Left = 66
        Top = 120
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Peso P'#199':'
      end
      object Label8: TLabel
        Left = 53
        Top = 209
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Unit'#225'rio:'
      end
      object Label9: TLabel
        Left = 58
        Top = 231
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sub. Total:'
      end
      object Label10: TLabel
        Left = 9
        Top = 148
        Width = 101
        Height = 13
        Alignment = taRightJustify
        Caption = 'Quantidade de Pe'#231'a:'
      end
      object Label32: TLabel
        Left = 60
        Top = 179
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Dobra:'
      end
      object Label47: TLabel
        Left = 288
        Top = 30
        Width = 56
        Height = 13
        Caption = 'F5 Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label48: TLabel
        Left = 218
        Top = 99
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fator C'#225'lculo Peso:'
      end
      object Label62: TLabel
        Left = 415
        Top = 252
        Width = 280
        Height = 13
        Caption = 'Informe 1 para SIM e 0 Para n'#227'o   ter o Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 112
        Top = 6
        Width = 393
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO_NOME'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 1
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyDown = DBEdit40KeyDown
      end
      object DBEdit2: TDBEdit
        Left = 112
        Top = 28
        Width = 100
        Height = 21
        DataField = 'COMPRIMENTO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 2
        OnExit = DBEdit2Exit
        OnKeyDown = DBEdit2KeyDown
      end
      object DBEdit3: TDBEdit
        Left = 112
        Top = 49
        Width = 100
        Height = 21
        DataField = 'LARGURA'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 3
        OnExit = DBEdit2Exit
        OnKeyDown = DBEdit3KeyDown
      end
      object DBEdit4: TDBEdit
        Left = 112
        Top = 71
        Width = 100
        Height = 21
        DataField = 'ESPESSURA'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 4
        OnExit = DBEdit2Exit
        OnKeyDown = DBEdit4KeyDown
      end
      object DBEdit5: TDBEdit
        Left = 112
        Top = 91
        Width = 100
        Height = 21
        DataField = 'VLR_KG'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 5
        OnExit = DBEdit2Exit
      end
      object DBEdit6: TDBEdit
        Left = 112
        Top = 111
        Width = 100
        Height = 21
        Color = clSilver
        DataField = 'PESO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 7
        OnExit = DBEdit6Exit
      end
      object DBEdit8: TDBEdit
        Left = 112
        Top = 222
        Width = 100
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'VLR_TOTAL'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        ReadOnly = True
        TabOrder = 11
      end
      object DBEdit9: TDBEdit
        Left = 112
        Top = 139
        Width = 100
        Height = 21
        DataField = 'QTD'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 8
        OnExit = DBEdit9Exit
      end
      object DBEdit7: TDBEdit
        Left = 112
        Top = 200
        Width = 100
        Height = 21
        DataField = 'VLR_UNITARIO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 10
        OnExit = DBEdit7Exit
        OnKeyDown = DBEdit7KeyDown
      end
      object DBEdit39: TDBEdit
        Left = 112
        Top = 171
        Width = 100
        Height = 21
        DataField = 'VLR_DOBRA'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 9
        OnExit = DBEdit39Exit
      end
      object DBEdit40: TDBEdit
        Left = 624
        Top = 6
        Width = 25
        Height = 21
        DataField = 'ID_CHAPA'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 0
        Visible = False
        OnEnter = DBEdit40Enter
        OnExit = DBEdit40Exit
        OnKeyDown = DBEdit40KeyDown
      end
      object DBEdit41: TDBEdit
        Left = 312
        Top = 91
        Width = 100
        Height = 21
        DataField = 'FATOR_CALCULO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 6
        OnExit = DBEdit2Exit
      end
      object btnProcesso: TNxButton
        Left = 363
        Top = 196
        Width = 98
        Height = 29
        Cursor = crHandPoint
        Caption = 'Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        Visible = False
        OnClick = btnProcessoClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 272
        Width = 745
        Height = 213
        Align = alBottom
        TabOrder = 13
        OnEnter = Panel1Enter
        object SMDBGrid2: TSMDBGrid
          Left = 1
          Top = 1
          Width = 743
          Height = 211
          Align = alClient
          Ctl3D = False
          DataSource = DMCadPedido.dsmProcesso_Sel
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
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
          GridStyle.Style = gsCustom
          GridStyle.OddColor = clWindow
          GridStyle.EvenColor = clWindow
          TitleHeight.PixelCount = 24
          FooterColor = clBtnFace
          ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          FixedCols = 1
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
              FieldName = 'Nome'
              ReadOnly = True
              Width = 229
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Qtd_Dobra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = 'Processo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 114
              Visible = True
            end>
        end
      end
    end
    object TS_Redondos: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'Redondos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object Label2: TLabel
        Left = 39
        Top = 16
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome Produto:'
      end
      object Label11: TLabel
        Left = 21
        Top = 60
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comprimento (mm):'
      end
      object Label12: TLabel
        Left = 40
        Top = 39
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Di'#226'metro (mm):'
      end
      object Label14: TLabel
        Left = 61
        Top = 81
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pre'#231'o KG:'
      end
      object Label15: TLabel
        Left = 66
        Top = 101
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Peso P'#199':'
      end
      object Label16: TLabel
        Left = 53
        Top = 158
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Unit'#225'rio:'
      end
      object Label17: TLabel
        Left = 58
        Top = 180
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sub. Total:'
      end
      object Label18: TLabel
        Left = 9
        Top = 129
        Width = 101
        Height = 13
        Alignment = taRightJustify
        Caption = 'Quantidade de Pe'#231'a:'
      end
      object DBEdit10: TDBEdit
        Left = 112
        Top = 8
        Width = 489
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO_NOME'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 0
      end
      object DBEdit11: TDBEdit
        Left = 112
        Top = 51
        Width = 100
        Height = 21
        DataField = 'COMPRIMENTO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 2
        OnExit = DBEdit11Exit
      end
      object DBEdit12: TDBEdit
        Left = 112
        Top = 30
        Width = 100
        Height = 21
        DataField = 'DIAMETRO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 1
        OnExit = DBEdit12Exit
      end
      object DBEdit14: TDBEdit
        Left = 112
        Top = 72
        Width = 100
        Height = 21
        DataField = 'VLR_KG'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 3
        OnExit = DBEdit14Exit
      end
      object DBEdit15: TDBEdit
        Left = 112
        Top = 92
        Width = 100
        Height = 21
        Color = clSilver
        DataField = 'PESO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 4
        OnExit = DBEdit15Exit
      end
      object DBEdit16: TDBEdit
        Left = 112
        Top = 171
        Width = 100
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'VLR_TOTAL'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit17: TDBEdit
        Left = 112
        Top = 120
        Width = 100
        Height = 21
        DataField = 'QTD'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 5
        OnExit = DBEdit17Exit
      end
      object DBEdit18: TDBEdit
        Left = 112
        Top = 149
        Width = 100
        Height = 21
        DataField = 'VLR_UNITARIO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 6
        OnExit = DBEdit18Exit
      end
    end
    object TS_Tubos: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'Tubos'
      object Label13: TLabel
        Left = 47
        Top = 16
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome Produto:'
      end
      object Label19: TLabel
        Left = 12
        Top = 60
        Width = 106
        Height = 13
        Alignment = taRightJustify
        Caption = 'Di'#226'metro Interno (mm):'
      end
      object Label20: TLabel
        Left = 9
        Top = 39
        Width = 109
        Height = 13
        Alignment = taRightJustify
        Caption = 'Di'#226'metro Externo (mm):'
      end
      object Label21: TLabel
        Left = 69
        Top = 125
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pre'#231'o KG:'
      end
      object Label22: TLabel
        Left = 74
        Top = 145
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Peso P'#199':'
      end
      object Label23: TLabel
        Left = 61
        Top = 201
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Unit'#225'rio:'
      end
      object Label24: TLabel
        Left = 66
        Top = 223
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sub. Total:'
      end
      object Label25: TLabel
        Left = 17
        Top = 172
        Width = 101
        Height = 13
        Alignment = taRightJustify
        Caption = 'Quantidade de Pe'#231'a:'
      end
      object Label26: TLabel
        Left = 56
        Top = 82
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Parede (mm):'
      end
      object Label27: TLabel
        Left = 29
        Top = 104
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comprimento (mm):'
      end
      object DBEdit13: TDBEdit
        Left = 120
        Top = 8
        Width = 489
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO_NOME'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 0
      end
      object DBEdit19: TDBEdit
        Left = 120
        Top = 52
        Width = 100
        Height = 21
        DataField = 'DIAMETRO_INT'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 2
        OnExit = DBEdit19Exit
      end
      object DBEdit20: TDBEdit
        Left = 120
        Top = 30
        Width = 100
        Height = 21
        DataField = 'DIAMETRO_EXT'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 1
        OnExit = DBEdit20Exit
      end
      object DBEdit21: TDBEdit
        Left = 120
        Top = 116
        Width = 100
        Height = 21
        DataField = 'VLR_KG'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 5
        OnExit = DBEdit21Exit
      end
      object DBEdit22: TDBEdit
        Left = 120
        Top = 136
        Width = 100
        Height = 21
        Color = clSilver
        DataField = 'PESO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 6
        OnExit = DBEdit22Exit
      end
      object DBEdit23: TDBEdit
        Left = 120
        Top = 214
        Width = 100
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'VLR_TOTAL'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        ReadOnly = True
        TabOrder = 9
      end
      object DBEdit24: TDBEdit
        Left = 120
        Top = 163
        Width = 100
        Height = 21
        DataField = 'QTD'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 7
        OnExit = DBEdit24Exit
      end
      object DBEdit25: TDBEdit
        Left = 120
        Top = 192
        Width = 100
        Height = 21
        DataField = 'VLR_UNITARIO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 8
        OnExit = DBEdit25Exit
      end
      object DBEdit26: TDBEdit
        Left = 120
        Top = 73
        Width = 100
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'PAREDE'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit27: TDBEdit
        Left = 120
        Top = 95
        Width = 100
        Height = 21
        DataField = 'COMPRIMENTO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 4
        OnExit = DBEdit27Exit
      end
    end
    object TS_Vidro: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'Vidro'
      object Label28: TLabel
        Left = 40
        Top = 24
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Acabamento:'
      end
      object Label29: TLabel
        Left = 4
        Top = 91
        Width = 99
        Height = 13
        Alignment = taRightJustify
        Caption = 'Redondo/Modelado:'
      end
      object Label30: TLabel
        Left = 57
        Top = 113
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'C.Moeda:'
      end
      object Label31: TLabel
        Left = 74
        Top = 135
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Furos:'
      end
      object Label35: TLabel
        Left = 83
        Top = 273
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = 'Qtd.'
      end
      object Label36: TLabel
        Left = 46
        Top = 305
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Unit'#225'rio:'
      end
      object Label37: TLabel
        Left = 58
        Top = 327
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Total:'
      end
      object Label46: TLabel
        Left = 51
        Top = 157
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Qtd. Furos:'
      end
      object Label57: TLabel
        Left = 57
        Top = 47
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cor Vidro:'
      end
      object Label58: TLabel
        Left = 40
        Top = 69
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Cor Vidro:'
      end
      object Label60: TLabel
        Left = 79
        Top = 376
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Foto:'
      end
      object Image2: TImage
        Left = 415
        Top = 16
        Width = 313
        Height = 305
        Stretch = True
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 105
        Top = 16
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_ACABAMENTO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsAcabamento
        TabOrder = 0
        OnExit = RxDBLookupCombo1Exit
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 105
        Top = 82
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_REDONDO_MOD'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsRedondoMod
        TabOrder = 3
        OnExit = RxDBLookupCombo2Exit
      end
      object RxDBLookupCombo3: TRxDBLookupCombo
        Left = 105
        Top = 104
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_CMOEDA'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsCMoeda
        TabOrder = 4
        OnExit = RxDBLookupCombo3Exit
      end
      object RxDBLookupCombo4: TRxDBLookupCombo
        Left = 105
        Top = 126
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_FUROS'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsFuros
        TabOrder = 5
        OnExit = RxDBLookupCombo4Exit
      end
      object DBEdit31: TDBEdit
        Left = 104
        Top = 265
        Width = 81
        Height = 21
        DataField = 'QTD'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 8
        OnExit = DBEdit31Exit
      end
      object DBEdit32: TDBEdit
        Left = 104
        Top = 297
        Width = 81
        Height = 21
        DataField = 'VLR_UNITARIO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 9
      end
      object DBEdit33: TDBEdit
        Left = 104
        Top = 319
        Width = 81
        Height = 21
        DataField = 'VLR_TOTAL'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 10
      end
      object DBEdit28: TDBEdit
        Left = 105
        Top = 149
        Width = 81
        Height = 21
        DataField = 'QTD_FUROS'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 6
        OnExit = DBEdit29Exit
      end
      object RzGroupBox1: TRzGroupBox
        Left = 27
        Top = 175
        Width = 376
        Height = 82
        Caption = 'Medidas'
        Color = clMoneyGreen
        FlatColor = clRed
        TabOrder = 7
        object Label49: TLabel
          Left = 20
          Top = 55
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Altura Corte:'
        end
        object Label50: TLabel
          Left = 182
          Top = 52
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Largura Corte:'
        end
        object Label33: TLabel
          Left = 48
          Top = 28
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Altura:'
        end
        object Label34: TLabel
          Left = 210
          Top = 28
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Largura:'
        end
        object DBEdit42: TDBEdit
          Left = 78
          Top = 47
          Width = 81
          Height = 21
          DataField = 'ALTURA_CORTE'
          DataSource = DMCadPedido.dsPedido_Item_Tipo
          TabOrder = 2
          OnExit = DBEdit29Exit
        end
        object DBEdit43: TDBEdit
          Left = 253
          Top = 44
          Width = 81
          Height = 21
          DataField = 'LARGURA_CORTE'
          DataSource = DMCadPedido.dsPedido_Item_Tipo
          TabOrder = 3
          OnExit = DBEdit30Exit
        end
        object DBEdit29: TDBEdit
          Left = 79
          Top = 20
          Width = 81
          Height = 21
          DataField = 'ALTURA'
          DataSource = DMCadPedido.dsPedido_Item_Tipo
          TabOrder = 0
          OnExit = DBEdit29Exit
        end
        object DBEdit30: TDBEdit
          Left = 252
          Top = 20
          Width = 81
          Height = 21
          DataField = 'LARGURA'
          DataSource = DMCadPedido.dsPedido_Item_Tipo
          TabOrder = 1
          OnExit = DBEdit30Exit
        end
      end
      object RxDBLookupCombo10: TRxDBLookupCombo
        Left = 105
        Top = 39
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_COR_VIDRO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsCor
        TabOrder = 1
        OnEnter = RxDBLookupCombo9Enter
        OnExit = RxDBLookupCombo9Exit
      end
      object DBEdit48: TDBEdit
        Left = 105
        Top = 60
        Width = 81
        Height = 21
        DataField = 'PRECO_COR_VIDRO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 2
        OnExit = DBEdit47Exit
      end
      object FilenameEdit2: TFilenameEdit
        Left = 104
        Top = 368
        Width = 297
        Height = 21
        NumGlyphs = 1
        TabOrder = 11
        OnChange = FilenameEdit1Change
      end
    end
    object TS_Porta: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'Porta'
      object Label38: TLabel
        Left = 77
        Top = 24
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Perfil:'
      end
      object Label39: TLabel
        Left = 76
        Top = 92
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vidro:'
      end
      object Label40: TLabel
        Left = 61
        Top = 181
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fura'#231#227'o:'
      end
      object Label43: TLabel
        Left = 83
        Top = 324
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = 'Qtd.'
      end
      object Label44: TLabel
        Left = 46
        Top = 354
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Unit'#225'rio:'
      end
      object Label45: TLabel
        Left = 58
        Top = 376
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Total:'
      end
      object Label53: TLabel
        Left = 58
        Top = 46
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cor Perfil:'
      end
      object Label54: TLabel
        Left = 41
        Top = 69
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Cor Perfil:'
      end
      object Label55: TLabel
        Left = 40
        Top = 136
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Cor Vidro:'
      end
      object Label56: TLabel
        Left = 57
        Top = 114
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cor Vidro:'
      end
      object Label59: TLabel
        Left = 79
        Top = 398
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Foto:'
      end
      object Image1: TImage
        Left = 415
        Top = 16
        Width = 313
        Height = 305
        Stretch = True
      end
      object Label61: TLabel
        Left = 40
        Top = 159
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Acabamento:'
      end
      object DBEdit36: TDBEdit
        Left = 104
        Top = 316
        Width = 81
        Height = 21
        DataField = 'QTD'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 9
        OnExit = DBEdit36Exit
      end
      object DBEdit37: TDBEdit
        Left = 104
        Top = 346
        Width = 81
        Height = 21
        DataField = 'VLR_UNITARIO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 10
      end
      object DBEdit38: TDBEdit
        Left = 104
        Top = 368
        Width = 81
        Height = 21
        DataField = 'VLR_TOTAL'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 11
      end
      object RzGroupBox2: TRzGroupBox
        Left = 38
        Top = 211
        Width = 335
        Height = 96
        Caption = 'Medidas'
        Color = clMoneyGreen
        FlatColor = clRed
        TabOrder = 8
        object Label51: TLabel
          Left = 7
          Top = 61
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Altura Corte:'
        end
        object Label52: TLabel
          Left = 166
          Top = 61
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Largura Corte:'
        end
        object Label41: TLabel
          Left = 35
          Top = 33
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Altura:'
        end
        object Label42: TLabel
          Left = 194
          Top = 33
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Largura:'
        end
        object DBEdit44: TDBEdit
          Left = 68
          Top = 53
          Width = 81
          Height = 21
          DataField = 'ALTURA_CORTE'
          DataSource = DMCadPedido.dsPedido_Item_Tipo
          TabOrder = 2
          OnExit = DBEdit29Exit
        end
        object DBEdit45: TDBEdit
          Left = 237
          Top = 53
          Width = 81
          Height = 21
          DataField = 'LARGURA_CORTE'
          DataSource = DMCadPedido.dsPedido_Item_Tipo
          TabOrder = 3
          OnExit = DBEdit30Exit
        end
        object DBEdit34: TDBEdit
          Left = 67
          Top = 26
          Width = 81
          Height = 21
          DataField = 'ALTURA'
          DataSource = DMCadPedido.dsPedido_Item_Tipo
          TabOrder = 0
          OnExit = DBEdit34Exit
        end
        object DBEdit35: TDBEdit
          Left = 237
          Top = 25
          Width = 81
          Height = 21
          DataField = 'LARGURA'
          DataSource = DMCadPedido.dsPedido_Item_Tipo
          TabOrder = 1
          OnExit = DBEdit35Exit
        end
      end
      object RxDBLookupCombo5: TRxDBLookupCombo
        Left = 104
        Top = 16
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_PERFIL'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsPerfil
        TabOrder = 0
        OnExit = RxDBLookupCombo5Exit
      end
      object RxDBLookupCombo6: TRxDBLookupCombo
        Left = 104
        Top = 83
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_VIDRO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsVidro
        TabOrder = 3
        OnExit = RxDBLookupCombo6Exit
      end
      object RxDBLookupCombo7: TRxDBLookupCombo
        Left = 104
        Top = 173
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_FURACAO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsFuracao
        TabOrder = 7
        OnExit = RxDBLookupCombo7Exit
      end
      object RxDBLookupCombo8: TRxDBLookupCombo
        Left = 104
        Top = 38
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_COR_PERFIL'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsCor
        TabOrder = 1
        OnEnter = RxDBLookupCombo8Enter
        OnExit = RxDBLookupCombo8Exit
      end
      object DBEdit46: TDBEdit
        Left = 104
        Top = 61
        Width = 81
        Height = 21
        DataField = 'PRECO_COR_PERFIL'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 2
        OnExit = DBEdit46Exit
      end
      object DBEdit47: TDBEdit
        Left = 104
        Top = 128
        Width = 81
        Height = 21
        DataField = 'PRECO_COR_VIDRO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        TabOrder = 5
        OnExit = DBEdit47Exit
      end
      object RxDBLookupCombo9: TRxDBLookupCombo
        Left = 104
        Top = 106
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_COR_VIDRO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsCor
        TabOrder = 4
        OnEnter = RxDBLookupCombo9Enter
        OnExit = RxDBLookupCombo9Exit
      end
      object FilenameEdit1: TFilenameEdit
        Left = 104
        Top = 390
        Width = 297
        Height = 21
        NumGlyphs = 1
        TabOrder = 12
        OnChange = FilenameEdit1Change
      end
      object RxDBLookupCombo11: TRxDBLookupCombo
        Left = 104
        Top = 151
        Width = 300
        Height = 21
        DropDownCount = 8
        DataField = 'ID_ACABAMENTO'
        DataSource = DMCadPedido.dsPedido_Item_Tipo
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMCadPedido.dsAcabamento
        TabOrder = 6
        OnExit = RxDBLookupCombo11Exit
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 506
    Width = 747
    Height = 34
    Align = alBottom
    Color = 8404992
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 222
      Top = 5
      Width = 98
      Height = 25
      Caption = '&Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn4: TBitBtn
      Left = 329
      Top = 5
      Width = 98
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
    end
  end
end
