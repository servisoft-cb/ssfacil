object frmCadProduto_Saldo: TfrmCadProduto_Saldo
  Left = 261
  Top = 219
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informar o Saldo Inicial'
  ClientHeight = 164
  ClientWidth = 548
  Color = clActiveCaption
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
  object Label1: TLabel
    Left = 58
    Top = 12
    Width = 76
    Height = 16
    Alignment = taRightJustify
    Caption = 'ID Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 36
    Top = 33
    Width = 98
    Height = 16
    Alignment = taRightJustify
    Caption = 'Nome Produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 54
    Top = 73
    Width = 80
    Height = 16
    Alignment = taRightJustify
    Caption = 'Data Inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 49
    Top = 104
    Width = 85
    Height = 16
    Alignment = taRightJustify
    Caption = 'Saldo Inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 137
    Top = 6
    Width = 121
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clActiveCaption
    Ctl3D = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 137
    Top = 26
    Width = 394
    Height = 22
    TabStop = False
    Color = clActiveCaption
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object DateEdit1: TDateEdit
    Left = 137
    Top = 67
    Width = 121
    Height = 21
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    NumGlyphs = 2
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 138
    Top = 97
    Width = 121
    Height = 21
    AutoSize = False
    Ctl3D = False
    DecimalPlaces = 4
    DisplayFormat = '0.0000'
    ParentCtl3D = False
    TabOrder = 3
  end
  object btnConfirmar: TNxButton
    Left = 139
    Top = 122
    Width = 82
    Height = 28
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TNxButton
    Left = 222
    Top = 122
    Width = 82
    Height = 28
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnCancelarClick
  end
end
