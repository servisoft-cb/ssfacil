object frmConfigArquivoBalanca: TfrmConfigArquivoBalanca
  Left = 330
  Top = 185
  Width = 665
  Height = 130
  Caption = 'Cadastro Arquivo Layout Balan'#231'a'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 57
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 0
    object Label7: TLabel
      Left = 27
      Top = 7
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Campo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 280
      Top = 7
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Posi'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 408
      Top = 7
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tamanho'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboNome: TRxDBLookupCombo
      Left = 27
      Top = 23
      Width = 246
      Height = 21
      DropDownCount = 8
      DropDownWidth = 200
      DataField = 'CAMPO'
      DataSource = DMConfig_Balanca.dsConfigBalancaLay
      LookupField = 'NOME_CAMPO'
      LookupDisplay = 'NOME_CAMPO'
      LookupSource = DMConfig_Balanca.dsTabelaProduto
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 280
      Top = 24
      Width = 121
      Height = 21
      DataField = 'POSICAO'
      DataSource = DMConfig_Balanca.dsConfigBalancaLay
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 408
      Top = 24
      Width = 121
      Height = 21
      DataField = 'TAMANHO'
      DataSource = DMConfig_Balanca.dsConfigBalancaLay
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 649
    Height = 34
    Align = alBottom
    Color = 8404992
    TabOrder = 1
    object BitBtn4: TBitBtn
      Left = 265
      Top = 5
      Width = 98
      Height = 25
      Caption = '(F10) Ca&ncelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
    end
    object BitBtn1: TBitBtn
      Left = 166
      Top = 5
      Width = 98
      Height = 25
      Caption = '&Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
end
