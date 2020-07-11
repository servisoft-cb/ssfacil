object frmInforma_RecPagto: TfrmInforma_RecPagto
  Left = 417
  Top = 263
  Width = 698
  Height = 169
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 26
    Width = 97
    Height = 14
    Alignment = taRightJustify
    Caption = 'Arquivo Recibo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 38
    Top = 50
    Width = 75
    Height = 14
    Alignment = taRightJustify
    Caption = 'Arquivo OC:'
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
    Top = 74
    Width = 100
    Height = 27
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TNxButton
    Left = 214
    Top = 74
    Width = 100
    Height = 27
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object btnMostrarRec: TNxButton
    Left = 580
    Top = 17
    Width = 98
    Caption = 'Mostrar Recibo'
    TabOrder = 4
    OnClick = btnMostrarRecClick
  end
  object OleContainer1: TOleContainer
    Left = 585
    Top = 72
    Width = 30
    Height = 30
    Caption = 'OleContainer1'
    OldStreamFormat = True
    TabOrder = 5
  end
  object FilenameEdit2: TFilenameEdit
    Left = 115
    Top = 43
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
    TabOrder = 1
  end
  object btnMostrarOC: TNxButton
    Left = 580
    Top = 42
    Width = 98
    Caption = 'Mostrar OC'
    TabOrder = 6
    OnClick = btnMostrarOCClick
  end
  object UCControls1: TUCControls
    GroupName = 'Pedido Informar Rec. Pagto'
    UserControl = fMenu.UserControl1
    NotAllowed = naDisabled
    Left = 496
    Top = 88
  end
  object sdsPedido_Anexo: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM PEDIDO_ANEXO'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 192
    Top = 108
    object sdsPedido_AnexoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_AnexoEND_ARQ_PAGTO: TStringField
      FieldName = 'END_ARQ_PAGTO'
      Size = 200
    end
    object sdsPedido_AnexoEND_ARQ_OC: TStringField
      FieldName = 'END_ARQ_OC'
      Size = 200
    end
  end
  object dspPedido_Anexo: TDataSetProvider
    DataSet = sdsPedido_Anexo
    UpdateMode = upWhereKeyOnly
    Left = 226
    Top = 107
  end
  object cdsPedido_Anexo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspPedido_Anexo'
    Left = 265
    Top = 104
    object cdsPedido_AnexoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_AnexoEND_ARQ_PAGTO: TStringField
      FieldName = 'END_ARQ_PAGTO'
      Size = 200
    end
    object cdsPedido_AnexoEND_ARQ_OC: TStringField
      FieldName = 'END_ARQ_OC'
      Size = 200
    end
  end
  object dsPedido_Anexo: TDataSource
    DataSet = cdsPedido_Anexo
    Left = 306
    Top = 108
  end
end
