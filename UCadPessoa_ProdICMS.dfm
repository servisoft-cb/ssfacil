object frmCadPessoa_ProdICMS: TfrmCadPessoa_ProdICMS
  Left = 257
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadPessoa_ProdICMS'
  ClientHeight = 449
  ClientWidth = 920
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
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 79
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 22
      Top = 17
      Width = 54
      Height = 13
      Caption = 'ID.Produto:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 23
      Top = 40
      Width = 53
      Height = 13
      Caption = 'CST ICMS:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 159
      Top = 4
      Width = 55
      Height = 13
      Caption = 'Refer'#234'ncia:'
    end
    object Label4: TLabel
      Left = 159
      Top = 19
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label5: TLabel
      Left = 266
      Top = 37
      Width = 8
      Height = 13
      Caption = '%'
      Transparent = True
    end
    object Label6: TLabel
      Left = 182
      Top = 61
      Width = 17
      Height = 13
      Caption = 'Lei:'
      Transparent = True
    end
    object Label7: TLabel
      Left = 4
      Top = 61
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'C.Benef. Fiscal:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object SpeedButton4: TSpeedButton
      Left = 227
      Top = 33
      Width = 23
      Height = 22
      Hint = 'Atualiza tabela Cidade'
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFDF9FAFBF2
        F1F1EEEEEEEBEBEBE9EAECE4E8E9E2E4E7E3E4E6E4E6E7E6E9EAEBECF0F2F4F7
        F2F6F5F7F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF1EBE9D0C5BADBDEE2C9CC
        CEC1C3C4B6B0AEB1A397AA876AA6764FA87044AC754BB39174C7BCB3D5D6DBE5
        E7E8EFEFEEFDFDFDFFFFFFFFFFFFFFFFFFEBE5DC9F6B46DBDBDEC9C8CAB9A796
        B68861C18451D29861CD9460CE945CCC9258C58346B26E36C09E83E3E1E3EFF1
        F2FBFBFBFFFFFFFFFFFFFFFFFFF5F0EEBC8A63C3A48CC3A58CC68F61CF9B68C8
        9565CA9361CD9364C18951BF864FC18853C6884FB8763BCEB3A1F7FCFFFEFEFE
        FFFFFFFFFFFFFFFFFFF7F3EFBD916CD5B493D6AD8BD8AA84CB9668CB9664BA85
        53BA8A61C6A281BF926DBB814EC08F67B47437BE8C5EEDE6DFFFFFFFFFFFFFFF
        FFFFFFFFFFF6F2EEB98F69E3C2A3DDB99AE0BF9CCA9C72BD9473E2CFC0E5D9D0
        F1EEECEFE7E3E1CAB1DCC3AACFB193A96B33E4D1BFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F2EFBA9069DFBB9BDEBD9DC79F7BD8C4B1F1EDEAFFFFFFFFFFFFFFFFFFFF
        FFFFF7F3EEEAD6C4FEFEFEB58560D7BDA9FFFFFFFFFFFFFFFFFFFFFFFFF7F3EF
        BD946CDFBC9CD9B996D8B694C8AE97F6F6F6FFFFFFFEFFFFFFFEFFFFFFFFFBF9
        F7F4EBE5FFFFFFC1A287D9C5B5FFFFFFFFFFFFFFFFFFFFFFFFF5EEEAB07E53E0
        BD9FDCB793E2BE9FCE9E73D0B499FCFAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE2D6CBEBE3DCFFFFFFFFFFFFFFFFFFFFFFFFF9F9F5BEA994C2A797BFA1
        92BB9E8CB99C89B39983F7F5F2FFFFFFAB7957BB967BB79676B89778B89777B9
        997EECE3DCFFFFFFFFFFFFFFFFFFFFFFFFF5F0E8CAB09BFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC9B7A7D3A679DBB088D9AA84DCAD87C7986EE9DB
        CDFFFFFFFFFFFFFFFFFFFFFFFFE6D8CEB67B50E8D0BCDFC7B7F3EFEBFFFFFFFE
        FFFEFEFFFEFFFFFFFFFFFFBA9F8CD6A57DCF9B6ECD9B6CBF9164E9DDD2FFFFFF
        FFFFFFFFFFFFFFFFFFEDE4DCA86B3BBF865CC29776EAE2DBFFFFFFFFFFFFFFFF
        FFFDFFFFDED0C4D4B8A3C79B71D1A478CD9E70BF9265E8DDD0FFFFFFFFFFFFFF
        FFFFFFFFFFF9F5F2BD8F6DBC8A639D5F2DB58968E0D2C8E7DCD3DAC8B8DECBBA
        C09A77D4A882D0A479D2A478D3A77CBF8E64E8DBCFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F5F2CAAB93E5CCB7CCA788C29471CDAC8ED9BDA3CAA98AD7B094E8CEB2DB
        BEA1DDB995C99D76C0946FC39168EADACFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF
        E1D2C6C5A284F6E3D0F0DCC9E6CEB7E6CCB5E5CBB6E7CCB5E5CCB2E3C2A4C299
        78CFB9A6D2BEADB58257E7D5C6FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFDFEFEDA
        C9BBBA9675D4B193EDD1B8EED3BCECCEB6D1AF8EBE916DC2A386EEE6E2F9F8F6
        FFFFFFBD9A80DBC9BAFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFDFEFEF6F2
        EFD9C8BDBFA38CC3A388B99D83CFBEACFAF6F4F7F4F2FFFFFFFFFFFFFFFFFFF8
        F7F5F8F7F4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFF
        FFFEFEFFFFFFFFFFFFFF}
      Margin = 0
      OnClick = SpeedButton4Click
    end
    object Label8: TLabel
      Left = 626
      Top = 61
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Finalidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 79
      Top = 9
      Width = 78
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 0
      OnChange = CurrencyEdit1Change
      OnExit = CurrencyEdit1Exit
      OnKeyDown = CurrencyEdit1KeyDown
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 79
      Top = 32
      Width = 145
      Height = 21
      DropDownCount = 8
      DropDownWidth = 700
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'COD_CST;PERCENTUAL;NOME'
      LookupSource = DMCadPessoa.dsTab_CSTICMS
      ParentCtl3D = False
      TabOrder = 1
      OnChange = RxDBLookupCombo1Change
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 202
      Top = 55
      Width = 274
      Height = 19
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMCadPessoa.dsOBS_Lei
      ParentCtl3D = False
      TabOrder = 3
      OnChange = RxDBLookupCombo1Change
    end
    object CheckBox1: TCheckBox
      Left = 488
      Top = 57
      Width = 97
      Height = 17
      Caption = 'DrawBack'
      TabOrder = 4
    end
    object edtCBenef: TEdit
      Left = 80
      Top = 55
      Width = 96
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 8
      ParentCtl3D = False
      TabOrder = 2
      OnExit = edtCBenefExit
      OnKeyDown = edtCBenefKeyDown
    end
    object cbFinalidade: TNxComboBox
      Left = 679
      Top = 53
      Width = 141
      Height = 21
      Cursor = crArrow
      TabOrder = 5
      Text = 'A=Ambos'
      ReadOnly = True
      HideFocus = False
      Style = dsDropDownList
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        'A=Ambos'
        'C=Consumo'
        'R=Revenda'
        'I=Industrializacao'
        'O=Outros')
    end
  end
  object NxPanel2: TNxPanel
    Left = 0
    Top = 79
    Width = 920
    Height = 32
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 1
    object btnConfirmar: TNxButton
      Left = 73
      Top = 5
      Width = 75
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnExcluir: TNxButton
      Left = 151
      Top = 6
      Width = 75
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnExcluirClick
    end
  end
  object SMDBGrid9: TSMDBGrid
    Left = 0
    Top = 111
    Width = 920
    Height = 262
    Align = alClient
    Ctl3D = False
    DataSource = DMCadPessoa.dsPessoa_ProdICMS
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 2
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
    ExOptions = [eoBooleanAsCheckBox, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    FixedCols = 1
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
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Title.Caption = 'Item'
        Title.Color = 16760962
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_PRODUTO'
        Title.Alignment = taCenter
        Title.Caption = 'ID Produto'
        Title.Color = 16760962
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_CSTICMS'
        Title.Alignment = taCenter
        Title.Caption = 'ID CST ICMS'
        Title.Color = 16760962
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clCod_CSTICMS'
        Title.Alignment = taCenter
        Title.Caption = 'CST ICMS'
        Title.Color = 16760962
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_BENEF'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Benef. Fiscal'
        Title.Color = 16760962
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_LEI'
        Title.Alignment = taCenter
        Title.Caption = 'ID Lei'
        Title.Color = 16760962
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clNomeLei'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Lei'
        Title.Color = 16760962
        Width = 226
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DRAWBACK'
        Title.Alignment = taCenter
        Title.Caption = 'DrawBack'
        Title.Color = 16760962
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FINALIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'Finalidade'
        Title.Color = 16760962
        Width = 61
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 373
    Width = 920
    Height = 76
    Align = alBottom
    Color = 13290186
    Ctl3D = False
    DataField = 'clLei'
    DataSource = DMCadPessoa.dsPessoa_ProdICMS
    ParentCtl3D = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
