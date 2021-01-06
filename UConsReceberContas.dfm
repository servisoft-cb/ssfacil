object frmConsReceberContas: TfrmConsReceberContas
  Left = 229
  Top = 168
  Width = 928
  Height = 480
  Caption = 'frmConsReceberContas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 87
    Align = alTop
    BorderPen.Style = psClear
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 31
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Emiss'#227'o Inicial:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 252
      Top = 32
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      Transparent = True
    end
    object Label4: TLabel
      Left = 408
      Top = 8
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Op'#231#227'o:'
      Transparent = True
    end
    object Label5: TLabel
      Left = 103
      Top = 12
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 48
      Top = 51
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Vecto Inicial:'
      Transparent = True
    end
    object Label6: TLabel
      Left = 252
      Top = 52
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      Transparent = True
    end
    object Label7: TLabel
      Left = 60
      Top = 71
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Cliente:'
      Transparent = True
    end
    object btnConsultar: TNxButton
      Left = 418
      Top = 55
      Width = 114
      Caption = 'Efetuar Pesquisa'
      TabOrder = 7
      OnClick = btnConsultarClick
    end
    object btnImprimir: TNxButton
      Left = 532
      Top = 54
      Width = 114
      Caption = 'Imprimir'
      TabOrder = 8
      OnClick = btnImprimirClick
    end
    object DateEdit1: TDateEdit
      Left = 127
      Top = 24
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 279
      Top = 24
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 2
    end
    object cbOpcao: TNxComboBox
      Left = 444
      Top = 2
      Width = 100
      Height = 21
      Cursor = crArrow
      TabOrder = 6
      Text = 'Ambos'
      ReadOnly = True
      HideFocus = False
      Style = dsDropDownList
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'Em Aberto'
        'Quitados')
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 127
      Top = 4
      Width = 252
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMConsDuplicata.dsFilial
      ParentCtl3D = False
      TabOrder = 0
    end
    object DateEdit3: TDateEdit
      Left = 127
      Top = 44
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 3
    end
    object DateEdit4: TDateEdit
      Left = 279
      Top = 44
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 4
    end
    object Edit1: TEdit
      Left = 127
      Top = 64
      Width = 252
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object NxCheckBox1: TNxCheckBox
      Left = 443
      Top = 25
      Width = 134
      Height = 21
      TabOrder = 9
      Text = 'NxCheckBox1'
      Caption = 'Somente com conta'
    end
  end
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 87
    Width = 920
    Height = 362
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
      Width = 900
      Height = 342
      Align = alClient
      Ctl3D = False
      DataSource = DMConsDuplicata.dsReceberContas
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
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
      ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 15
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUMDUPLICATA'
          Title.Caption = 'N'#186' T'#237'tulo'
          Title.Color = 14402992
          Width = 77
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'Parc.'
          Title.Color = 14402992
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CONTA'
          Title.Alignment = taCenter
          Title.Caption = 'Conta'
          Title.Color = 14402992
          Width = 158
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Parcela'
          Title.Color = 14402992
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_PAGO'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Pago'
          Title.Color = 14402992
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_RESTANTE'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Restante'
          Title.Color = 14402992
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTEMISSAO'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Emiss'#227'o'
          Title.Color = 14402992
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTVENCIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Vencimento'
          Title.Color = 14402992
          Width = 72
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOSSONUMERO'
          Title.Alignment = taCenter
          Title.Caption = 'Nosso N'#250'mero'
          Title.Color = 14402992
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PESSOA'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Cliente'
          Title.Color = 14402992
          Width = 334
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTULTPAGAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Pagto'
          Title.Color = 14402992
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FILIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Filial'
          Title.Color = 14402992
          Width = 37
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTREMESSA'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Remessa'
          Title.Color = 14402992
          Width = 64
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_CONTA_BOLETO'
          Title.Alignment = taCenter
          Title.Caption = 'ID Conta'
          Title.Color = 14402992
          Width = 45
          Visible = True
        end>
    end
  end
end
