object frmCadSetor_Proc: TfrmCadSetor_Proc
  Left = 421
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informar os Processos do Setor'
  ClientHeight = 133
  ClientWidth = 578
  Color = clMoneyGreen
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
    Left = 42
    Top = 24
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = 'Processo:'
  end
  object Label2: TLabel
    Left = 62
    Top = 48
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor:'
  end
  object Label3: TLabel
    Left = 46
    Top = 72
    Width = 43
    Height = 13
    Alignment = taRightJustify
    Caption = 'Unidade:'
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 91
    Top = 16
    Width = 361
    Height = 21
    DropDownCount = 15
    DataField = 'ID_PROCESSO'
    DataSource = DmCadSetor.dsSetor_Proc
    LookupField = 'ID'
    LookupDisplay = 'NOME'
    LookupSource = DmCadSetor.dsProcesso
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 91
    Top = 40
    Width = 121
    Height = 21
    DataField = 'VLR_HORA'
    DataSource = DmCadSetor.dsSetor_Proc
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 99
    Width = 578
    Height = 34
    Align = alBottom
    Color = 8404992
    TabOrder = 3
    object BitBtn4: TBitBtn
      Left = 281
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
      Left = 182
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
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 91
    Top = 64
    Width = 122
    Height = 21
    DropDownCount = 15
    DataField = 'UNIDADE'
    DataSource = DmCadSetor.dsSetor_Proc
    LookupField = 'UNIDADE'
    LookupDisplay = 'UNIDADE'
    LookupSource = DmCadSetor.dsUnidade
    TabOrder = 2
  end
end
