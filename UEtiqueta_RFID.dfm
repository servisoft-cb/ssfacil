object frmEtiqueta_RFID: TfrmEtiqueta_RFID
  Left = 104
  Top = 53
  Width = 1197
  Height = 640
  Caption = 'frmEtiqueta_RFID'
  Color = clBtnFace
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
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 1189
    Height = 609
    ActivePage = TS_Etiquetas
    ActivePageDefault = TS_Etiquetas
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    FixedDimension = 19
    object TS_Configuracao: TRzTabSheet
      Caption = 'Configura'#231#227'o'
      object RzGroupBox1: TRzGroupBox
        Left = 14
        Top = 20
        Width = 644
        Height = 110
        Caption = ' Zebra ZT410 RFID '
        Enabled = False
        TabOrder = 0
        object Label2: TLabel
          Left = 61
          Top = 30
          Width = 63
          Height = 13
          Caption = 'Temperatura:'
          Enabled = False
        end
        object Label3: TLabel
          Left = 68
          Top = 53
          Width = 56
          Height = 13
          Caption = 'Velocidade:'
          Enabled = False
        end
        object Label4: TLabel
          Left = 204
          Top = 25
          Width = 130
          Height = 13
          Caption = '(valores v'#225'lidos de 01 a 30)'
          Enabled = False
        end
        object Label5: TLabel
          Left = 204
          Top = 49
          Width = 350
          Height = 13
          Caption = 
            '(valores v'#225'lidos de 1 a 14) *Setar sempre os 3 campos com o mesm' +
            'o valor'
          Enabled = False
        end
        object Label6: TLabel
          Left = 6
          Top = 78
          Width = 118
          Height = 13
          Caption = 'Endere'#231'o da Impressora:'
          Enabled = False
        end
        object DBEdit1: TDBEdit
          Left = 128
          Top = 23
          Width = 74
          Height = 21
          DataField = 'ZEBRA_TEMPERATURA'
          DataSource = DMEtiqueta.dsParametros_Fin
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 128
          Top = 47
          Width = 74
          Height = 21
          DataField = 'ZEBRA_VELOCIDADE'
          DataSource = DMEtiqueta.dsParametros_Fin
          Enabled = False
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 128
          Top = 73
          Width = 459
          Height = 21
          DataField = 'ZEBRA_ENDERECO'
          DataSource = DMEtiqueta.dsParametros_Fin
          Enabled = False
          TabOrder = 2
        end
      end
      object btnAlterar_Etiq: TNxButton
        Left = 49
        Top = 138
        Width = 75
        Caption = 'Alterar'
        TabOrder = 1
        OnClick = btnAlterar_EtiqClick
      end
      object btnConfirmar_Etiq: TNxButton
        Left = 132
        Top = 138
        Width = 75
        Caption = 'Confirmar'
        Enabled = False
        TabOrder = 2
        OnClick = btnConfirmar_EtiqClick
      end
    end
    object TS_Etiquetas: TRzTabSheet
      Caption = 'Etiquetas'
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 123
        Width = 1185
        Height = 443
        Align = alClient
        Ctl3D = False
        DataSource = DMEtiqueta.dsmEtiqueta_Nav
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = SMDBGrid1DblClick
        Flat = True
        BandsFont.Charset = DEFAULT_CHARSET
        BandsFont.Color = clWindowText
        BandsFont.Height = -11
        BandsFont.Name = 'MS Sans Serif'
        BandsFont.Style = []
        Groupings = <>
        GridStyle.Style = gsCustom
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 15
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CNPJ_Filial'
            Title.Alignment = taCenter
            Title.Caption = 'CNPJ Empresa'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Sequencia_RFID'
            Title.Alignment = taCenter
            Title.Caption = 'Sequencia RFID'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Item_Nota'
            Title.Alignment = taCenter
            Title.Caption = 'Item Nota'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_Produto'
            Title.Alignment = taCenter
            Title.Caption = 'ID Produto'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Referencia'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Produto'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Produto'
            Width = 221
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Unidade'
            Title.Alignment = taCenter
            Width = 52
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtd'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pedido_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' OC'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Prod_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Produto Cliente'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Cod_Cor_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Cor Cliente'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Num_Nota'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Nota'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Cor_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cor Clente'
            Width = 340
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_RFID'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' RFID'
            Width = 196
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1185
        Height = 82
        Align = alTop
        Color = 13619151
        TabOrder = 1
        object Label1: TLabel
          Left = 19
          Top = 23
          Width = 216
          Height = 14
          Caption = 'Informe a Quantidade por Pacote:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Shape1: TShape
          Left = 333
          Top = 43
          Width = 26
          Height = 17
          Brush.Color = clYellow
        end
        object Label7: TLabel
          Left = 361
          Top = 46
          Width = 199
          Height = 13
          Caption = 'N'#227'o enviado ao WebService da Beira Rio'
        end
        object Label8: TLabel
          Left = 361
          Top = 62
          Width = 39
          Height = 13
          Caption = 'Enviado'
        end
        object Shape2: TShape
          Left = 333
          Top = 59
          Width = 26
          Height = 17
          Brush.Color = clLime
        end
        object Shape3: TShape
          Left = 493
          Top = 60
          Width = 26
          Height = 17
          Brush.Color = clRed
        end
        object Label10: TLabel
          Left = 521
          Top = 64
          Width = 246
          Height = 13
          Caption = 'Sem o C'#243'digo do Produto e Cor do Cliente (Verificar)'
        end
        object CurrencyEdit1: TCurrencyEdit
          Left = 236
          Top = 14
          Width = 87
          Height = 21
          AutoSize = False
          DecimalPlaces = 4
          DisplayFormat = '0.####'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyDown = CurrencyEdit1KeyDown
        end
        object btnGerar: TNxButton
          Left = 325
          Top = 10
          Width = 101
          Height = 26
          Caption = 'Gerar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnGerarClick
        end
        object btnImprimirA4: TNxButton
          Left = 1057
          Top = 3
          Width = 101
          Height = 26
          Caption = 'Imprimir A4'
          TabOrder = 2
          Visible = False
          OnClick = btnImprimirA4Click
        end
        object ckTeste: TCheckBox
          Left = 1025
          Top = 26
          Width = 57
          Height = 17
          Caption = 'Teste'
          TabOrder = 3
          Visible = False
        end
        object btnImprimir: TNxButton
          Left = 425
          Top = 10
          Width = 101
          Height = 26
          Caption = 'Imprimir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btnImprimirClick
        end
        object btnReenvio: TNxButton
          Left = 526
          Top = 10
          Width = 101
          Height = 26
          Caption = 'Reenvio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = btnReenvioClick
        end
        object btnExcluir: TNxButton
          Left = 627
          Top = 10
          Width = 102
          Height = 26
          Caption = 'Excluir Tabela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = btnExcluirClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 82
        Width = 1185
        Height = 41
        Align = alTop
        Color = clSilver
        TabOrder = 2
        object Label9: TLabel
          Left = 41
          Top = 15
          Width = 1094
          Height = 16
          Caption = 
            '*** Etiquetas geradas Agrupadas pelo (ID do Produto, ID Cor, Cod' +
            ' Produto Cliente, Cod Cor Cliente, Tamanho Grade, Tamanho Grade ' +
            'Cliente, Unidade)'
          Color = 14145495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object StaticText1: TStaticText
        Left = 0
        Top = 566
        Width = 1185
        Height = 20
        Align = alBottom
        BevelOuter = bvRaised
        Caption = 
          '                   Duplo Clique para alterar o Cod. Produto/Cor ' +
          'do Cliente'
        Color = 13290186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
    end
  end
end
