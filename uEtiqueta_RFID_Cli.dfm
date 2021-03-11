object frmEtiqueta_RFID_Cli: TfrmEtiqueta_RFID_Cli
  Left = 281
  Top = 201
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmEtiqueta_RFID_Cli'
  ClientHeight = 209
  ClientWidth = 839
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
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 81
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 212
      Top = 4
      Width = 296
      Height = 32
      Caption = 
        'Informar o C'#243'digo do Produto do Cliente e o '#13#10'C'#243'digo da Cor do P' +
        'roduto do Cliente'
      Color = 12582911
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object Label3: TLabel
      Left = 22
      Top = 41
      Width = 71
      Height = 14
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblReferencia: TLabel
      Left = 100
      Top = 41
      Width = 12
      Height = 14
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 26
      Top = 57
      Width = 67
      Height = 14
      Alignment = taRightJustify
      Caption = 'Nome Cor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblCor: TLabel
      Left = 100
      Top = 57
      Width = 12
      Height = 14
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btnConfirmar: TNxButton
      Left = 631
      Top = 41
      Width = 97
      Height = 30
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 839
    Height = 128
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 1
    object Label4: TLabel
      Left = 58
      Top = 54
      Width = 115
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Produto no Cliente:'
    end
    object Label2: TLabel
      Left = 52
      Top = 36
      Width = 121
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Produto no Cliente:'
    end
    object Label6: TLabel
      Left = 90
      Top = 71
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tamanho Cliente:'
    end
    object Label12: TLabel
      Left = 94
      Top = 89
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Cor Cliente:'
    end
    object DBEdit2: TDBEdit
      Left = 174
      Top = 46
      Width = 216
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'COD_MATERIAL_FORN'
      DataSource = DMRFID.dsProduto_Forn
      ParentCtl3D = False
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 174
      Top = 28
      Width = 327
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'NOME_MATERIAL_FORN'
      DataSource = DMRFID.dsProduto_Forn
      ParentCtl3D = False
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 174
      Top = 64
      Width = 107
      Height = 19
      Ctl3D = False
      DataField = 'TAMANHO_CLIENTE'
      DataSource = DMRFID.dsProduto_Forn
      ParentCtl3D = False
      TabOrder = 2
    end
    object DBEdit8: TDBEdit
      Left = 174
      Top = 82
      Width = 107
      Height = 19
      Ctl3D = False
      DataField = 'COD_COR_FORN'
      DataSource = DMRFID.dsProduto_Forn
      ParentCtl3D = False
      TabOrder = 3
    end
  end
end
