object frmAltPrecoPedido: TfrmAltPrecoPedido
  Left = 423
  Top = 198
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmAltPrecoPedido'
  ClientHeight = 132
  ClientWidth = 467
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
    Left = 91
    Top = 33
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr Unit'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 83
    Top = 56
    Width = 77
    Height = 13
    Alignment = taRightJustify
    Caption = '% Comiss'#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 162
    Top = 25
    Width = 121
    Height = 21
    DataField = 'VLR_UNITARIO'
    DataSource = DMCadPedido.dsPedido_Itens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 162
    Top = 48
    Width = 121
    Height = 21
    DataField = 'PERC_COMISSAO'
    DataSource = DMCadPedido.dsPedido_Itens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object NxButton1: TNxButton
    Left = 167
    Top = 80
    Width = 75
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = NxButton1Click
  end
  object NxButton2: TNxButton
    Left = 250
    Top = 80
    Width = 75
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = NxButton2Click
  end
end
