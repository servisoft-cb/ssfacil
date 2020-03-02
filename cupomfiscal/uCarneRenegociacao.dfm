object fCarneRenegociacao: TfCarneRenegociacao
  Left = 277
  Top = 156
  Width = 644
  Height = 410
  Caption = 'fCarneRenegociacao'
  Color = clBtnFace
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 30
    Align = alTop
    Color = clGray
    Enabled = False
    TabOrder = 0
    DesignSize = (
      628
      30)
    object Label3: TLabel
      Left = 6
      Top = 8
      Width = 65
      Height = 18
      Alignment = taRightJustify
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 152
      Top = 3
      Width = 369
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 70
      Top = 2
      Width = 80
      Height = 24
      AutoSize = False
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Anchors = [akTop, akRight]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 628
    Height = 300
    Align = alClient
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 330
    Width = 628
    Height = 41
    Align = alBottom
    Color = clGray
    TabOrder = 2
    object brCancelar: TNxButton
      Left = 314
      Top = 5
      Width = 187
      Height = 30
      Caption = 'Ca&ncelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 1
      TabStop = False
      Transparent = True
      OnClick = brCancelarClick
    end
    object btConfirmar: TNxButton
      Left = 127
      Top = 5
      Width = 187
      Height = 30
      Caption = 'Gravar Negocia'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 0
      Transparent = True
      OnClick = btConfirmarClick
    end
  end
end
