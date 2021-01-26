object frmInformeEndereco: TfrmInformeEndereco
  Left = 330
  Top = 154
  Width = 624
  Height = 102
  Caption = 'Informe endere'#231'o do arquivo'
  Color = 15391694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 30
    Top = 19
    Width = 115
    Height = 16
    Caption = 'Local do Arquivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object DirectoryEdit1: TDirectoryEdit
    Left = 147
    Top = 16
    Width = 426
    Height = 21
    NumGlyphs = 1
    TabOrder = 0
  end
  object NxButton1: TNxButton
    Left = 149
    Top = 44
    Width = 94
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = NxButton1Click
  end
end
