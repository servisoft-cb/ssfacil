object frmCadDuplicata_Dev: TfrmCadDuplicata_Dev
  Left = 350
  Top = 188
  Width = 704
  Height = 286
  Caption = 'Devolu'#231#227'o de T'#237'tulos'
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
  object Panel3: TPanel
    Left = 0
    Top = 221
    Width = 696
    Height = 34
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object btnConfirmar: TNxButton
      Left = 216
      Top = 6
      Width = 107
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
    object btnCancelar: TNxButton
      Left = 324
      Top = 6
      Width = 107
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 96
    Width = 696
    Height = 125
    Align = alClient
    Color = clActiveCaption
    TabOrder = 0
    object Label4: TLabel
      Left = 48
      Top = 45
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Devolu'#231#227'o:'
    end
    object Label9: TLabel
      Left = 75
      Top = 94
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hist'#243'rico:'
    end
    object Label13: TLabel
      Left = 39
      Top = 25
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Devolu'#231#227'o:'
    end
    object Label59: TLabel
      Left = 75
      Top = 65
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Op.Baixa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ceVlrDevolucao: TCurrencyEdit
      Left = 122
      Top = 37
      Width = 100
      Height = 21
      AutoSize = False
      Ctl3D = False
      DisplayFormat = '0.00'
      ParentCtl3D = False
      TabOrder = 1
      OnEnter = ceVlrDevolucaoEnter
      OnExit = ceVlrDevolucaoExit
      OnKeyPress = ceVlrDevolucaoKeyPress
    end
    object edtHistorico: TEdit
      Left = 122
      Top = 86
      Width = 489
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 70
      ParentCtl3D = False
      TabOrder = 3
    end
    object DtDevolucao: TDateEdit
      Left = 122
      Top = 17
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      StartOfWeek = Sun
      TabOrder = 0
      OnExit = DtDevolucaoExit
    end
    object RxDBLookupCombo12: TRxDBLookupCombo
      Left = 122
      Top = 57
      Width = 259
      Height = 21
      DropDownCount = 15
      Ctl3D = False
      DataField = 'ID_CONTABIL_OPE_BAIXA'
      DataSource = DMCadDuplicata.dsDuplicata
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMCadDuplicata.dsContabil_Ope
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 96
    Align = alTop
    Color = clSilver
    Enabled = False
    TabOrder = 2
    object Label5: TLabel
      Left = 33
      Top = 10
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Duplicata:'
    end
    object Label14: TLabel
      Left = 40
      Top = 28
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Emiss'#227'o:'
    end
    object Label15: TLabel
      Left = 8
      Top = 77
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Vencimento:'
      Color = 15329769
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label16: TLabel
      Left = 255
      Top = 77
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr.Parcela:'
    end
    object Label17: TLabel
      Left = 435
      Top = 77
      Width = 90
      Height = 14
      Alignment = taRightJustify
      Caption = 'Vlr.Pendente:'
      Color = 11206570
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label18: TLabel
      Left = 47
      Top = 46
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor:'
    end
    object Label19: TLabel
      Left = 450
      Top = 46
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = '% Comiss'#227'o:'
    end
    object Label11: TLabel
      Left = 241
      Top = 10
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Parcela:'
    end
    object DBEdit1: TDBEdit
      Left = 99
      Top = 4
      Width = 115
      Height = 19
      Color = clSilver
      Ctl3D = False
      DataField = 'NUMDUPLICATA'
      DataSource = DMCadDuplicata.dsDuplicata
      ParentCtl3D = False
      TabOrder = 0
    end
    object DBEdit8: TDBEdit
      Left = 99
      Top = 22
      Width = 115
      Height = 19
      Color = clSilver
      Ctl3D = False
      DataField = 'DTEMISSAO'
      DataSource = DMCadDuplicata.dsDuplicata
      ParentCtl3D = False
      TabOrder = 1
    end
    object DBEdit9: TDBEdit
      Left = 99
      Top = 71
      Width = 115
      Height = 19
      Color = 15329769
      Ctl3D = False
      DataField = 'DTVENCIMENTO'
      DataSource = DMCadDuplicata.dsDuplicata
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit10: TDBEdit
      Left = 310
      Top = 71
      Width = 115
      Height = 19
      Color = clSilver
      Ctl3D = False
      DataField = 'VLR_PARCELA'
      DataSource = DMCadDuplicata.dsDuplicata
      ParentCtl3D = False
      TabOrder = 3
    end
    object DBEdit11: TDBEdit
      Left = 529
      Top = 73
      Width = 115
      Height = 20
      Color = 11206570
      Ctl3D = False
      DataField = 'VLR_RESTANTE'
      DataSource = DMCadDuplicata.dsDuplicata
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 512
      Top = 40
      Width = 115
      Height = 19
      Color = clSilver
      Ctl3D = False
      DataField = 'PERC_COMISSAO'
      DataSource = DMCadDuplicata.dsDuplicata
      ParentCtl3D = False
      TabOrder = 5
    end
    object Edit2: TEdit
      Left = 99
      Top = 40
      Width = 329
      Height = 19
      Color = clSilver
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object DBEdit5: TDBEdit
      Left = 283
      Top = 4
      Width = 46
      Height = 19
      Color = clSilver
      Ctl3D = False
      DataField = 'PARCELA'
      DataSource = DMCadDuplicata.dsDuplicata
      ParentCtl3D = False
      TabOrder = 7
    end
  end
end
