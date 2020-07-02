object frmInforma_RecPagto: TfrmInforma_RecPagto
  Left = 355
  Top = 254
  Width = 698
  Height = 123
  BorderIcons = [biSystemMenu]
  Caption = 'Pedido Informar Rec. Pagto'
  Color = 16754342
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 26
    Width = 97
    Height = 14
    Caption = 'Arquivo Recibo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object FilenameEdit1: TFilenameEdit
    Left = 115
    Top = 19
    Width = 463
    Height = 21
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object btnConfirmar: TNxButton
    Left = 116
    Top = 54
    Width = 100
    Height = 27
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TNxButton
    Left = 214
    Top = 54
    Width = 100
    Height = 27
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object btnMostrar: TNxButton
    Left = 576
    Top = 17
    Width = 75
    Caption = 'Mostrar'
    TabOrder = 3
    OnClick = btnMostrarClick
  end
  object OleContainer1: TOleContainer
    Left = 585
    Top = 48
    Width = 30
    Height = 30
    Caption = 'OleContainer1'
    OldStreamFormat = True
    TabOrder = 4
  end
  object UCControls1: TUCControls
    GroupName = 'Pedido Informar Rec. Pagto'
    UserControl = fMenu.UserControl1
    NotAllowed = naDisabled
    Left = 420
    Top = 58
  end
end
