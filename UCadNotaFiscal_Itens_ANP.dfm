object frmCadNotaFiscal_Itens_ANP: TfrmCadNotaFiscal_Itens_ANP
  Left = 469
  Top = 280
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ANP '
  ClientHeight = 206
  ClientWidth = 363
  Color = 16759413
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
  object Label91: TLabel
    Left = 151
    Top = 23
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = 'ID:'
  end
  object Label92: TLabel
    Left = 100
    Top = 42
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'UF Consumo:'
  end
  object Label1: TLabel
    Left = 11
    Top = 79
    Width = 153
    Height = 13
    Alignment = taRightJustify
    Caption = '% PGNn (G'#225's Natural Nacional):'
  end
  object Label2: TLabel
    Left = 10
    Top = 97
    Width = 154
    Height = 13
    Alignment = taRightJustify
    Caption = '% PGNi (G'#225's Natural Importado):'
  end
  object Label3: TLabel
    Left = 222
    Top = 3
    Width = 61
    Height = 13
    Caption = 'F2 Pesquisar'
  end
  object Label4: TLabel
    Left = 16
    Top = 61
    Width = 148
    Height = 13
    Alignment = taRightJustify
    Caption = '% PGLP (derivado do petr'#243'leo):'
  end
  object Label5: TLabel
    Left = 67
    Top = 114
    Width = 97
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor Partida (vPart):'
  end
  object Label6: TLabel
    Left = 9
    Top = 170
    Width = 263
    Height = 26
    Caption = 
      'Valor Partida : Deve ser informado neste campo o valor '#13#10'por qui' +
      'lograma sem ICMS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit75: TDBEdit
    Left = 221
    Top = 17
    Width = 92
    Height = 19
    TabStop = False
    Color = 16759413
    Ctl3D = False
    DataField = 'ANP_PRODUTO'
    DataSource = DMCadNotaFiscal.dsNotaFiscal_Itens
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit76: TDBEdit
    Left = 165
    Top = 35
    Width = 56
    Height = 19
    CharCase = ecUpperCase
    Color = clWhite
    Ctl3D = False
    DataField = 'ANP_UF_CONS'
    DataSource = DMCadNotaFiscal.dsNotaFiscal_Itens
    ParentCtl3D = False
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 165
    Top = 71
    Width = 92
    Height = 19
    Color = clWhite
    Ctl3D = False
    DataField = 'ANP_PERC_PGNN'
    DataSource = DMCadNotaFiscal.dsNotaFiscal_Itens
    ParentCtl3D = False
    TabOrder = 4
  end
  object DBEdit2: TDBEdit
    Left = 165
    Top = 89
    Width = 92
    Height = 19
    Color = clWhite
    Ctl3D = False
    DataField = 'ANP_PERC_PGNI'
    DataSource = DMCadNotaFiscal.dsNotaFiscal_Itens
    ParentCtl3D = False
    TabOrder = 5
  end
  object NxButton1: TNxButton
    Left = 166
    Top = 129
    Width = 92
    Height = 25
    Caption = 'Confirmar'
    Down = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = NxButton1Click
  end
  object DBEdit3: TDBEdit
    Left = 165
    Top = 17
    Width = 56
    Height = 19
    Color = clWhite
    Ctl3D = False
    DataField = 'ANP_ID'
    DataSource = DMCadNotaFiscal.dsNotaFiscal_Itens
    ParentCtl3D = False
    TabOrder = 0
    OnExit = DBEdit3Exit
  end
  object DBEdit4: TDBEdit
    Left = 165
    Top = 53
    Width = 92
    Height = 19
    Color = clWhite
    Ctl3D = False
    DataField = 'ANP_PERC_PGLP'
    DataSource = DMCadNotaFiscal.dsNotaFiscal_Itens
    ParentCtl3D = False
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 165
    Top = 107
    Width = 92
    Height = 19
    Color = clWhite
    Ctl3D = False
    DataField = 'ANP_VLR_VPART'
    DataSource = DMCadNotaFiscal.dsNotaFiscal_Itens
    ParentCtl3D = False
    TabOrder = 6
  end
end
