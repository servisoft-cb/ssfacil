object frmRecebeXML: TfrmRecebeXML
  Left = 120
  Top = 3
  Width = 1124
  Height = 706
  BorderWidth = 5
  Caption = 'Recebe XML NFe'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcDados: TPageControl
    Left = 0
    Top = 146
    Width = 1106
    Height = 519
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cabe'#231'alho/NFe'
      ImageIndex = 3
      object GroupBox1: TGroupBox
        Left = 0
        Top = 93
        Width = 1098
        Height = 193
        Align = alTop
        Caption = 'Dados Da NFe'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label7: TLabel
          Left = 18
          Top = 29
          Width = 27
          Height = 13
          Caption = 'S'#233'rie:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 115
          Top = 29
          Width = 41
          Height = 13
          Caption = 'N'#186' Nota:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 295
          Top = 29
          Width = 56
          Height = 13
          Caption = 'Dt.Emiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 546
          Top = 29
          Width = 46
          Height = 13
          Caption = 'Dt.Sa'#237'da:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 705
          Top = 29
          Width = 88
          Height = 13
          Caption = 'Hr.Sa'#237'da/Entrada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 7
          Top = 70
          Width = 38
          Height = 13
          Caption = 'Modelo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 264
          Top = 67
          Width = 89
          Height = 13
          Caption = 'Forma Pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 502
          Top = 67
          Width = 51
          Height = 13
          Caption = 'Finalidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 707
          Top = 67
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Entrada/Sa'#237'da:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 264
          Top = 85
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Forma de Emiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 7
          Top = 103
          Width = 198
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data e Hora da Entrada em Conting'#234'ncia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 7
          Top = 146
          Width = 195
          Height = 13
          Alignment = taRightJustify
          Caption = 'Justificativa  da Entrada em Conting'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 506
          Top = 85
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Processo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit6: TDBEdit
          Left = 47
          Top = 23
          Width = 54
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'serie'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 159
          Top = 17
          Width = 131
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'nNF'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 354
          Top = 17
          Width = 143
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'ide_dEmi'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit9: TDBEdit
          Left = 596
          Top = 23
          Width = 94
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'dSaiEnt'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit10: TDBEdit
          Left = 795
          Top = 23
          Width = 94
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'hSaiEnt'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit11: TDBEdit
          Left = 47
          Top = 66
          Width = 54
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'mod'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object edTipoPagamento: TEdit
          Left = 353
          Top = 62
          Width = 129
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object edFinalidade: TEdit
          Left = 554
          Top = 62
          Width = 129
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object edEntradaSaida: TEdit
          Left = 783
          Top = 62
          Width = 94
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object edFormaEmissao: TEdit
          Left = 353
          Top = 80
          Width = 129
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit13: TDBEdit
          Left = 7
          Top = 119
          Width = 224
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'dhCont'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit14: TDBEdit
          Left = 7
          Top = 162
          Width = 834
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'xJust'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object edProcesso: TEdit
          Left = 554
          Top = 80
          Width = 323
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit68: TDBEdit
          Left = 353
          Top = 41
          Width = 144
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'ide_dhemi'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 286
        Width = 1098
        Height = 91
        Align = alTop
        Caption = 'Emitente'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Label25: TLabel
          Left = 32
          Top = 28
          Width = 31
          Height = 13
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 5
          Top = 45
          Width = 55
          Height = 13
          Caption = 'CNPJ/CPF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 245
          Top = 45
          Width = 67
          Height = 13
          Caption = 'Insc.Estadual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 624
          Top = 45
          Width = 17
          Height = 13
          Caption = 'UF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit16: TDBEdit
          Left = 66
          Top = 21
          Width = 631
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'emit_xNome'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edCNPJEmitente: TEdit
          Left = 66
          Top = 39
          Width = 164
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edInscEmitente: TEdit
          Left = 314
          Top = 39
          Width = 129
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edUFEmitente: TEdit
          Left = 645
          Top = 39
          Width = 52
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 377
        Width = 1098
        Height = 114
        Align = alClient
        Caption = 'Destinat'#225'rio'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        object Label21: TLabel
          Left = 32
          Top = 28
          Width = 31
          Height = 13
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 5
          Top = 45
          Width = 55
          Height = 13
          Caption = 'CNPJ/CPF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 245
          Top = 45
          Width = 67
          Height = 13
          Caption = 'Insc.Estadual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 624
          Top = 45
          Width = 17
          Height = 13
          Caption = 'UF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit15: TDBEdit
          Left = 66
          Top = 21
          Width = 631
          Height = 26
          TabStop = False
          Ctl3D = False
          DataField = 'dest_xNome'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edCNPJDest: TEdit
          Left = 66
          Top = 39
          Width = 164
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edInscDest: TEdit
          Left = 314
          Top = 39
          Width = 129
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edUFDest: TEdit
          Left = 645
          Top = 39
          Width = 52
          Height = 26
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 1098
        Height = 93
        Align = alTop
        Caption = ' Dados de Autoriza'#231#227'o da NFe '
        Color = clMoneyGreen
        ParentColor = False
        TabOrder = 3
        object Label1: TLabel
          Left = 40
          Top = 20
          Width = 34
          Height = 13
          Caption = 'Chave:'
        end
        object Label2: TLabel
          Left = 26
          Top = 38
          Width = 48
          Height = 13
          Caption = 'Protocolo:'
        end
        object Label3: TLabel
          Left = 7
          Top = 56
          Width = 67
          Height = 13
          Caption = 'Dt.Autorizado:'
        end
        object Label5: TLabel
          Left = 427
          Top = 22
          Width = 71
          Height = 13
          Caption = 'Tipo Ambiente:'
        end
        object Label6: TLabel
          Left = 437
          Top = 40
          Width = 61
          Height = 13
          Caption = 'Vers'#227'o XML:'
        end
        object Label16: TLabel
          Left = 415
          Top = 58
          Width = 83
          Height = 13
          Caption = 'Vers'#227'o Processo:'
        end
        object DBEdit1: TDBEdit
          Left = 76
          Top = 14
          Width = 337
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'chNFe'
          DataSource = DMRecebeXML.dsNFeProtocolo
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 76
          Top = 32
          Width = 337
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'nProt'
          DataSource = DMRecebeXML.dsNFeProtocolo
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 76
          Top = 50
          Width = 337
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'dhRecbto'
          DataSource = DMRecebeXML.dsNFeProtocolo
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 500
          Top = 16
          Width = 94
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'tpAmb'
          DataSource = DMRecebeXML.dsNFeProtocolo
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 500
          Top = 34
          Width = 94
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'versao'
          DataSource = DMRecebeXML.dsNFeProtocolo
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit12: TDBEdit
          Left = 500
          Top = 52
          Width = 94
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'verProc'
          DataSource = DMRecebeXML.dsCabecalho
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Emitente'
      ImageIndex = 4
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1098
        Height = 491
        Align = alClient
        Color = clMoneyGreen
        TabOrder = 0
        DesignSize = (
          1098
          491)
        object Label29: TLabel
          Left = 18
          Top = 29
          Width = 66
          Height = 13
          Caption = 'Raz'#227'o Social:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 41
          Top = 51
          Width = 43
          Height = 13
          Caption = 'Fantasia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 35
          Top = 73
          Width = 49
          Height = 13
          Caption = 'Endere'#231'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 650
          Top = 73
          Width = 15
          Height = 13
          Caption = 'N'#186':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 17
          Top = 95
          Width = 67
          Height = 13
          Caption = 'Complemento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 54
          Top = 117
          Width = 30
          Height = 13
          Caption = 'Bairro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 48
          Top = 139
          Width = 36
          Height = 13
          Caption = 'Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 607
          Top = 139
          Width = 58
          Height = 13
          Caption = 'C'#243'd.Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 67
          Top = 161
          Width = 17
          Height = 13
          Caption = 'UF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 60
          Top = 183
          Width = 25
          Height = 13
          Caption = 'Pa'#237's:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 616
          Top = 183
          Width = 50
          Height = 13
          Caption = 'C'#243'd. Pa'#237's:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 441
          Top = 161
          Width = 22
          Height = 13
          Caption = 'Cep:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 29
          Top = 261
          Width = 55
          Height = 13
          Caption = 'CNPJ/CPF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 358
          Top = 261
          Width = 67
          Height = 13
          Caption = 'Insc.Estadual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 328
          Top = 280
          Width = 97
          Height = 13
          Caption = 'IE do Sub.Tribut'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 10
          Top = 280
          Width = 74
          Height = 13
          Caption = 'Insc. Municipal:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 52
          Top = 302
          Width = 32
          Height = 13
          Caption = 'CNAE:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 400
          Top = 302
          Width = 25
          Height = 13
          Caption = 'CRT:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label79: TLabel
          Left = 57
          Top = 205
          Width = 27
          Height = 13
          Caption = 'Fone:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label61: TLabel
          Left = 932
          Top = 389
          Width = 132
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Fornecedor n'#227'o encontrado'
          Visible = False
        end
        object DBEdit17: TDBEdit
          Left = 87
          Top = 23
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'emit_xNome'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit18: TDBEdit
          Left = 87
          Top = 45
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'xFant'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit19: TDBEdit
          Left = 87
          Top = 67
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_xLgr'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit20: TDBEdit
          Left = 667
          Top = 67
          Width = 163
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_nro'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit21: TDBEdit
          Left = 87
          Top = 89
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_xCpl'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit22: TDBEdit
          Left = 87
          Top = 111
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_xBairro'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit23: TDBEdit
          Left = 87
          Top = 133
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_xMun'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit24: TDBEdit
          Left = 667
          Top = 132
          Width = 163
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_cMun'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit25: TDBEdit
          Left = 87
          Top = 155
          Width = 83
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_UF'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit26: TDBEdit
          Left = 87
          Top = 177
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_xPais'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit27: TDBEdit
          Left = 667
          Top = 177
          Width = 163
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_cPais'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit28: TDBEdit
          Left = 470
          Top = 155
          Width = 123
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_CEP'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object edCNPJEmitente2: TEdit
          Left = 87
          Top = 255
          Width = 164
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object edInscEmitente2: TEdit
          Left = 429
          Top = 255
          Width = 164
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit29: TDBEdit
          Left = 429
          Top = 277
          Width = 164
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'IEST'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object DBEdit30: TDBEdit
          Left = 87
          Top = 277
          Width = 164
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'IM'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object DBEdit31: TDBEdit
          Left = 87
          Top = 299
          Width = 164
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'CNAE'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object DBEdit32: TDBEdit
          Left = 429
          Top = 299
          Width = 164
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'CRT'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
        end
        object DBEdit45: TDBEdit
          Left = 87
          Top = 199
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderEmit_fone'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object BitBtn2: TBitBtn
          Left = 957
          Top = 407
          Width = 123
          Height = 25
          Hint = 'Gravar fornecedor no sistema'
          Anchors = [akTop, akRight]
          Caption = 'Gravar Fornecedor'
          TabOrder = 19
          Visible = False
          OnClick = BitBtn2Click
        end
        object BitBtn1: TBitBtn
          Left = 956
          Top = 459
          Width = 123
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Mostrar Dados Originais'
          TabOrder = 20
          Visible = False
          OnClick = BitBtn1Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Destinat'#225'rio'
      ImageIndex = 5
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1098
        Height = 491
        Align = alClient
        Color = clMoneyGreen
        TabOrder = 0
        object Label47: TLabel
          Left = 18
          Top = 29
          Width = 66
          Height = 13
          Caption = 'Raz'#227'o Social:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 35
          Top = 73
          Width = 49
          Height = 13
          Caption = 'Endere'#231'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 650
          Top = 73
          Width = 15
          Height = 13
          Caption = 'N'#186':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 17
          Top = 95
          Width = 67
          Height = 13
          Caption = 'Complemento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 54
          Top = 117
          Width = 30
          Height = 13
          Caption = 'Bairro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 48
          Top = 139
          Width = 36
          Height = 13
          Caption = 'Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 607
          Top = 139
          Width = 58
          Height = 13
          Caption = 'C'#243'd.Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 67
          Top = 161
          Width = 17
          Height = 13
          Caption = 'UF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 61
          Top = 183
          Width = 25
          Height = 13
          Caption = 'Pa'#237's:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 616
          Top = 183
          Width = 50
          Height = 13
          Caption = 'C'#243'd. Pa'#237's:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 441
          Top = 161
          Width = 22
          Height = 13
          Caption = 'Cep:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label59: TLabel
          Left = 29
          Top = 221
          Width = 55
          Height = 13
          Caption = 'CNPJ/CPF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label60: TLabel
          Left = 358
          Top = 221
          Width = 67
          Height = 13
          Caption = 'Insc.Estadual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label65: TLabel
          Left = 56
          Top = 319
          Width = 28
          Height = 13
          Caption = 'Email:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit33: TDBEdit
          Left = 87
          Top = 23
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'dest_xNome'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit35: TDBEdit
          Left = 87
          Top = 67
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_xLgr'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit36: TDBEdit
          Left = 667
          Top = 67
          Width = 163
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_nro'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit37: TDBEdit
          Left = 87
          Top = 89
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_xCpl'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit38: TDBEdit
          Left = 87
          Top = 111
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_xBairro'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit39: TDBEdit
          Left = 87
          Top = 133
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_xMun'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit40: TDBEdit
          Left = 667
          Top = 132
          Width = 163
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_cMun'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit41: TDBEdit
          Left = 87
          Top = 155
          Width = 83
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_UF'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit42: TDBEdit
          Left = 87
          Top = 177
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_xPais'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit43: TDBEdit
          Left = 667
          Top = 177
          Width = 163
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_cPais'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit44: TDBEdit
          Left = 470
          Top = 155
          Width = 123
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'enderDest_CEP'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object edCNPJDest2: TEdit
          Left = 87
          Top = 215
          Width = 164
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object edInscDest2: TEdit
          Left = 429
          Top = 215
          Width = 164
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit49: TDBEdit
          Left = 87
          Top = 313
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'email'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Transportadora'
      ImageIndex = 8
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1098
        Height = 491
        Align = alClient
        Color = clMoneyGreen
        TabOrder = 0
        object Label73: TLabel
          Left = 54
          Top = 29
          Width = 31
          Height = 13
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label92: TLabel
          Left = 35
          Top = 73
          Width = 49
          Height = 13
          Caption = 'Endere'#231'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label96: TLabel
          Left = 48
          Top = 139
          Width = 36
          Height = 13
          Caption = 'Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label97: TLabel
          Left = 607
          Top = 139
          Width = 58
          Height = 13
          Caption = 'C'#243'd.Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label98: TLabel
          Left = 67
          Top = 161
          Width = 17
          Height = 13
          Caption = 'UF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label102: TLabel
          Left = 29
          Top = 221
          Width = 55
          Height = 13
          Caption = 'CNPJ/CPF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label103: TLabel
          Left = 358
          Top = 221
          Width = 67
          Height = 13
          Caption = 'Insc.Estadual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit58: TDBEdit
          Left = 87
          Top = 23
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'xNome'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit59: TDBEdit
          Left = 87
          Top = 67
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'xEnder'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit63: TDBEdit
          Left = 87
          Top = 133
          Width = 506
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'transporta_xMun'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit64: TDBEdit
          Left = 667
          Top = 132
          Width = 163
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'cMunFG1'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit65: TDBEdit
          Left = 87
          Top = 155
          Width = 83
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'transporta_UF'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object edCNPJTransportadora: TEdit
          Left = 87
          Top = 215
          Width = 164
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object edInscTransportadora: TEdit
          Left = 429
          Top = 215
          Width = 164
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Itens (Produto/Servi'#231'o)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 6
      ParentFont = False
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1098
        Height = 491
        Align = alClient
        Color = clMoneyGreen
        TabOrder = 0
        object SMDBGrid1: TSMDBGrid
          Left = 1
          Top = 1
          Width = 1096
          Height = 261
          Align = alClient
          Ctl3D = False
          DataSource = DMRecebeXML.dsmItensNota
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnKeyDown = SMDBGrid1KeyDown
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
          ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          OnGetCellParams = SMDBGrid1GetCellParams
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 43
          RowCount = 2
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Copiar_CFOP_Prod'
              Title.Alignment = taCenter
              Title.Caption = 'Copiar CFOP Prod.'
              Width = 34
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CodCFOPAtual'
              Title.Alignment = taCenter
              Title.Caption = 'CFOP Inf. Produto'
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CodCFOPNCM'
              Title.Alignment = taCenter
              Title.Caption = 'CFOP Inf. NCM'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Item'
              ReadOnly = True
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NumPedido'
              ReadOnly = True
              Title.Caption = 'N'#186' OC'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ItemPedido'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Item OC'
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Num_Nota_NTE'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Nota Retorno'
              Width = 69
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TipoVenda'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Tipo Venda'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Unidade'
              ReadOnly = True
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UnidadeInterno'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Unid. Interno'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CFOP'
              ReadOnly = True
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CFOPInterno'
              Width = 52
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CodCFOP_NFCe'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'CFOP NFCe'
              Width = 49
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CFOPOriginal'
              ReadOnly = True
              Title.Alignment = taCenter
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CodProduto'
              ReadOnly = True
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CodProdutoInterno'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Referencia_Int'
              Title.Alignment = taCenter
              Title.Caption = 'Refer'#234'ncia Interna'
              Width = 88
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Tamanho'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_Cor'
              Title.Alignment = taCenter
              Title.Caption = 'ID Cor'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome_Cor'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Cor'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrUnitario'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vlr_Venda'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Venda Produto'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeProduto'
              Width = 418
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CodBarra'
              ReadOnly = True
              Title.Alignment = taCenter
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Num_Lote_Controle'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Lote Controle'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Qtd'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrTotal'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrIPI'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NCM'
              ReadOnly = True
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CEST'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrIcmsST'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. ICMS ST'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'QtdPacote'
              ReadOnly = True
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GravarNovo'
              ReadOnly = True
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NumLote'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Lote'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Obs_Complementar'
              Title.Alignment = taCenter
              Title.Caption = 'Obs. Complementar'
              Width = 168
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'InfAdicionais'
              Title.Alignment = taCenter
              Title.Caption = 'Informa'#231#245'es Adicionais'
              Width = 207
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeProduto_Nota'
              Title.Alignment = taCenter
              Title.Caption = 'Nome do produto na nota'
              Width = 649
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome_Grupo'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Grupo (Estrutura)'
              Width = 295
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Gravar_Adic_Prod'
              Title.Alignment = taCenter
              Title.Caption = 'Gravar Inf. Adic. No Nome do Produto'
              Width = 84
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ANP_PRODUTO'
              Title.Alignment = taCenter
              Title.Caption = 'Cod. Produto ANP'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ANP_UF_CONS'
              Title.Alignment = taCenter
              Title.Caption = 'UF Consumo  ANP'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANP_DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o (ANP)'
              Width = 349
              Visible = True
            end>
        end
        object Panel7: TPanel
          Left = 1
          Top = 423
          Width = 1096
          Height = 67
          Align = alBottom
          Color = clSilver
          TabOrder = 1
          DesignSize = (
            1096
            67)
          object Shape1: TShape
            Left = 827
            Top = 9
            Width = 25
            Height = 16
            Anchors = [akTop, akRight]
            Brush.Color = clRed
          end
          object Label67: TLabel
            Left = 855
            Top = 12
            Width = 115
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Produto n'#227'o encontrado'
          end
          object Shape2: TShape
            Left = 654
            Top = 9
            Width = 25
            Height = 16
            Anchors = [akTop, akRight]
            Brush.Color = clYellow
          end
          object Shape3: TShape
            Left = 654
            Top = 39
            Width = 25
            Height = 16
            Anchors = [akTop, akRight]
            Brush.Color = clAqua
          end
          object Label68: TLabel
            Left = 683
            Top = 43
            Width = 86
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Unidade Diferente'
          end
          object Shape4: TShape
            Left = 827
            Top = 24
            Width = 25
            Height = 16
            Anchors = [akTop, akRight]
            Brush.Color = clGray
          end
          object Label90: TLabel
            Left = 855
            Top = 27
            Width = 109
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'CFOP N'#227'o Encontrada'
          end
          object Label76: TLabel
            Left = 682
            Top = 12
            Width = 124
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'N'#227'o possui n'#250'mero na OC'
          end
          object Shape5: TShape
            Left = 654
            Top = 24
            Width = 25
            Height = 16
            Anchors = [akTop, akRight]
            Brush.Color = clMaroon
          end
          object Label118: TLabel
            Left = 682
            Top = 27
            Width = 72
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Produto Inativo'
          end
          object Label48: TLabel
            Left = 6
            Top = 5
            Width = 360
            Height = 57
            Caption = 
              'F3 - Associar Produto       F6 - Rateio Produto'#13#10'F4 - Associar O' +
              'C               F7 - Ver CFOP '#13#10'F5 - Associar Nota'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -17
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Shape6: TShape
            Left = 827
            Top = 40
            Width = 25
            Height = 16
            Anchors = [akTop, akRight]
            Brush.Color = 33023
          end
          object Label148: TLabel
            Left = 855
            Top = 43
            Width = 174
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'CFOP 5405 Sem Base/Vlr ST Retido'
          end
          object Shape7: TShape
            Left = 480
            Top = 7
            Width = 25
            Height = 16
            Anchors = [akTop, akRight]
            Brush.Color = 8453888
          end
          object Label149: TLabel
            Left = 508
            Top = 10
            Width = 103
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Diverg'#234'ncia de CFOP'
          end
          object BitBtn4: TBitBtn
            Left = 376
            Top = 35
            Width = 123
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Gravar Produtos'
            TabOrder = 0
            Visible = False
            OnClick = BitBtn4Click
          end
          object CheckBox2: TCheckBox
            Left = 509
            Top = 25
            Width = 139
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Mostrar CFOP na Grid'
            TabOrder = 1
            OnClick = CheckBox2Click
          end
        end
        object PageControl1: TPageControl
          Left = 1
          Top = 262
          Width = 1096
          Height = 161
          ActivePage = TS_Calculo
          Align = alBottom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MultiLine = True
          ParentFont = False
          TabOrder = 2
          TabPosition = tpLeft
          object TabSheet8: TTabSheet
            Caption = 'Fiscal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            object Label94: TLabel
              Left = 46
              Top = 10
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'CFOP:'
            end
            object Label95: TLabel
              Left = 37
              Top = 44
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = '% ICMS:'
            end
            object Label99: TLabel
              Left = 21
              Top = 26
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base ICMS:'
            end
            object Label100: TLabel
              Left = 30
              Top = 80
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vlr. ICMS:'
            end
            object Label101: TLabel
              Left = 15
              Top = 62
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Sit.Tribut'#225'ria:'
            end
            object Label104: TLabel
              Left = 234
              Top = 44
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = '% IPI:'
            end
            object Label109: TLabel
              Left = 208
              Top = 26
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Sit.Trib.CF:'
            end
            object Label121: TLabel
              Left = 200
              Top = 8
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'CFOP NFCe:'
            end
            object Label127: TLabel
              Left = 397
              Top = 25
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vlr. ICMS ST:'
            end
            object Label128: TLabel
              Left = 424
              Top = 7
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = '% MVA:'
            end
            object Label117: TLabel
              Left = 36
              Top = 126
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Aquisi'#231#227'o:'
            end
            object Label136: TLabel
              Left = 417
              Top = 43
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base ST:'
            end
            object Label105: TLabel
              Left = 227
              Top = 62
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vlr. IPI:'
            end
            object Label137: TLabel
              Left = 196
              Top = 80
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vlr. IPI Devol:'
            end
            object Label138: TLabel
              Left = 433
              Top = 61
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = '% ST:'
            end
            object Label139: TLabel
              Left = 626
              Top = 28
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vlr. Base Efet:'
            end
            object Label140: TLabel
              Left = 586
              Top = 10
              Width = 107
              Height = 13
              Alignment = taRightJustify
              Caption = '% Base Redu'#231#227'o Efet:'
            end
            object Label141: TLabel
              Left = 631
              Top = 46
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = '% ICMS Efet:'
            end
            object Label142: TLabel
              Left = 624
              Top = 64
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vlr. ICMS Efet:'
            end
            object Label143: TLabel
              Left = 397
              Top = 100
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base ST Ret:'
            end
            object Label144: TLabel
              Left = 402
              Top = 118
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'Vlr. ST Ret.:'
            end
            object Label146: TLabel
              Left = 404
              Top = 141
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo SPED:'
            end
            object Label147: TLabel
              Left = 737
              Top = 140
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Caption = 'Posse Prod:'
            end
            object Label150: TLabel
              Left = 376
              Top = 79
              Width = 85
              Height = 13
              Alignment = taRightJustify
              Caption = 'V.Icms Substituto:'
            end
            object RxDBLookupCombo2: TRxDBLookupCombo
              Left = 80
              Top = 2
              Width = 106
              Height = 19
              DropDownCount = 8
              DropDownWidth = 500
              Ctl3D = False
              DataField = 'CFOPInterno'
              DataSource = DMRecebeXML.dsmItensNota
              LookupField = 'ID'
              LookupDisplay = 'CODCFOP;NOME'
              LookupSource = DMRecebeXML.dsCFOP
              ParentCtl3D = False
              TabOrder = 0
              OnChange = RxDBLookupCombo2Change
              OnExit = RxDBLookupCombo2Exit
            end
            object DBEdit60: TDBEdit
              Left = 80
              Top = 38
              Width = 106
              Height = 19
              Ctl3D = False
              DataField = 'AliqIcms'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 2
            end
            object DBEdit61: TDBEdit
              Left = 80
              Top = 20
              Width = 106
              Height = 19
              Ctl3D = False
              DataField = 'BaseIcms'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 1
            end
            object DBEdit62: TDBEdit
              Left = 80
              Top = 74
              Width = 106
              Height = 19
              Ctl3D = False
              DataField = 'VlrIcms'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 4
            end
            object RxDBLookupCombo3: TRxDBLookupCombo
              Left = 80
              Top = 56
              Width = 106
              Height = 19
              DropDownCount = 8
              DropDownWidth = 300
              Ctl3D = False
              DataField = 'CodSitTribInterno'
              DataSource = DMRecebeXML.dsmItensNota
              ListStyle = lsDelimited
              LookupField = 'ID'
              LookupDisplay = 'COD_CST;PERCENTUAL'
              LookupSource = DMRecebeXML.dsTab_CSTICMS
              ParentCtl3D = False
              TabOrder = 3
              OnChange = RxDBLookupCombo3Change
            end
            object DBEdit66: TDBEdit
              Left = 264
              Top = 38
              Width = 106
              Height = 19
              Ctl3D = False
              DataField = 'AliqIPI'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 8
            end
            object RxDBLookupCombo5: TRxDBLookupCombo
              Left = 264
              Top = 20
              Width = 82
              Height = 19
              DropDownCount = 8
              DropDownWidth = 500
              Ctl3D = False
              DataField = 'ID_SitTrib_CF'
              DataSource = DMRecebeXML.dsmItensNota
              LookupField = 'ID'
              LookupDisplay = 'CODIGO'
              LookupSource = DMRecebeXML.dsSitTrib_CF
              ParentCtl3D = False
              TabOrder = 7
              OnChange = RxDBLookupCombo2Change
            end
            object RxDBLookupCombo8: TRxDBLookupCombo
              Left = 264
              Top = 2
              Width = 82
              Height = 19
              DropDownCount = 8
              DropDownWidth = 500
              Ctl3D = False
              DataField = 'ID_CFOP_NFCe'
              DataSource = DMRecebeXML.dsmItensNota
              LookupField = 'ID'
              LookupDisplay = 'CODCFOP;NOME'
              LookupSource = DMRecebeXML.dsCFOP
              ParentCtl3D = False
              TabOrder = 6
              OnChange = RxDBLookupCombo8Change
            end
            object DBEdit78: TDBEdit
              Left = 464
              Top = 19
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'VlrIcmsST'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 12
            end
            object DBEdit79: TDBEdit
              Left = 464
              Top = 1
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'PercMVAST'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 11
            end
            object RxDBComboBox1: TRxDBComboBox
              Left = 112
              Top = 118
              Width = 257
              Height = 21
              Style = csDropDownList
              Ctl3D = False
              DataField = 'TipoVenda'
              DataSource = DMRecebeXML.dsmItensNota
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                '[..Nenhuma..]'
                'Consumo'
                'Revenda'
                'Industrializa'#231#227'o')
              ParentCtl3D = False
              TabOrder = 5
              Values.Strings = (
                'G'
                'C'
                'R'
                'I')
              OnClick = RxDBComboBox1Click
            end
            object DBEdit84: TDBEdit
              Left = 464
              Top = 37
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'BaseCST'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 13
            end
            object DBEdit67: TDBEdit
              Left = 264
              Top = 56
              Width = 106
              Height = 19
              Ctl3D = False
              DataField = 'VlrIPI'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 9
            end
            object DBEdit85: TDBEdit
              Left = 264
              Top = 74
              Width = 106
              Height = 19
              Ctl3D = False
              DataField = 'VlrIPI'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 10
            end
            object DBEdit86: TDBEdit
              Left = 464
              Top = 55
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'PercIcmsST'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 14
            end
            object DBEdit87: TDBEdit
              Left = 696
              Top = 22
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'Vlr_Base_Efet'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 19
            end
            object DBEdit88: TDBEdit
              Left = 696
              Top = 4
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'Perc_Base_Red_Efet'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 18
            end
            object DBEdit89: TDBEdit
              Left = 696
              Top = 40
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'Perc_ICMS_Efet'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 20
            end
            object DBEdit90: TDBEdit
              Left = 696
              Top = 58
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'Vlr_ICMS_Efet'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 21
            end
            object DBEdit91: TDBEdit
              Left = 464
              Top = 94
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'BaseCSTRet'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 16
            end
            object DBEdit92: TDBEdit
              Left = 464
              Top = 112
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'VlrIcmsCSTRet'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 17
            end
            object DBCheckBox11: TDBCheckBox
              Left = 612
              Top = 104
              Width = 92
              Height = 17
              Caption = 'Gerar Estoque'
              DataField = 'Gerar_Estoque'
              DataSource = DMRecebeXML.dsmItensNota
              TabOrder = 22
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object RxDBComboBox3: TRxDBComboBox
              Left = 463
              Top = 133
              Width = 257
              Height = 21
              Style = csDropDownList
              Ctl3D = False
              DataField = 'Sped_Tipo'
              DataSource = DMRecebeXML.dsmItensNota
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                '00 - Mercadoria para Revenda'
                '01- Mat'#233'ria-Prima'
                '02- Embalagem'
                '03 - Produto em Processo'
                '04 - Produto Acabado'
                '05 - SubProduto'
                '06 - Produto Intermedi'#225'rio'
                '07 - Material de Uso e Consumo'
                '08 - Ativo Imobilizado'
                '09 - Servi'#231'os'
                '10 - Outros Insumos'
                '99 - Outras')
              ParentCtl3D = False
              TabOrder = 23
              Values.Strings = (
                '00'
                '01'
                '02'
                '03'
                '04'
                '05'
                '06'
                '07'
                '08'
                '09'
                '10'
                '99')
            end
            object RxDBComboBox4: TRxDBComboBox
              Left = 797
              Top = 133
              Width = 91
              Height = 21
              Style = csDropDownList
              DataField = 'Posse_Material'
              DataSource = DMRecebeXML.dsmItensNota
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Empresa'
                'Terceiro')
              TabOrder = 24
              Values.Strings = (
                'E'
                'T')
            end
            object DBEdit93: TDBEdit
              Left = 464
              Top = 73
              Width = 100
              Height = 19
              Ctl3D = False
              DataField = 'Vlr_Icms_Substituto'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 15
            end
          end
          object TabSheet9: TTabSheet
            Caption = 'Integra'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImageIndex = 1
            ParentFont = False
            DesignSize = (
              1048
              153)
            object Label106: TLabel
              Left = 32
              Top = 44
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Unid.Padr'#227'o:'
            end
            object Label107: TLabel
              Left = 196
              Top = 44
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Unid.Nota:'
            end
            object Label108: TLabel
              Left = 388
              Top = 44
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Qtd.Conv.:'
            end
            object Label110: TLabel
              Left = 43
              Top = 8
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#186' Pedido:'
            end
            object Label111: TLabel
              Left = 188
              Top = 8
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Item Pedido:'
            end
            object Label112: TLabel
              Left = 389
              Top = 7
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'ID Pedido:'
            end
            object Label120: TLabel
              Left = 13
              Top = 62
              Width = 81
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#186' Lote Controle:'
            end
            object Label115: TLabel
              Left = 75
              Top = 98
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cor:'
            end
            object Label124: TLabel
              Left = 48
              Top = 117
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'ID Grupo:'
            end
            object Label129: TLabel
              Left = 37
              Top = 80
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Caption = 'CEST Nota:'
            end
            object Label130: TLabel
              Left = 191
              Top = 80
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'CEST no NCM:'
            end
            object Label125: TLabel
              Left = 405
              Top = 117
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Caption = 'Posse Prod:'
            end
            object Label135: TLabel
              Left = 414
              Top = 98
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tamanho:'
            end
            object Label151: TLabel
              Left = 383
              Top = 136
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Caption = 'Centro de Custo:'
            end
            object Label134: TLabel
              Left = 8
              Top = 135
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = 'Conta Or'#231'amento:'
            end
            object Label154: TLabel
              Left = 749
              Top = 132
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'F2 Pesquisar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit69: TDBEdit
              Left = 248
              Top = 38
              Width = 81
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'Unidade'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit70: TDBEdit
              Left = 440
              Top = 38
              Width = 81
              Height = 19
              AutoSize = False
              Ctl3D = False
              DataField = 'QtdPacote'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 6
              OnExit = DBEdit70Exit
            end
            object DBEdit71: TDBEdit
              Left = 96
              Top = 1
              Width = 81
              Height = 19
              AutoSize = False
              Ctl3D = False
              DataField = 'NumPedido'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 0
            end
            object DBEdit72: TDBEdit
              Left = 248
              Top = 1
              Width = 81
              Height = 19
              AutoSize = False
              Ctl3D = False
              DataField = 'ItemPedido'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 1
            end
            object dbedtIDPedido: TDBEdit
              Left = 440
              Top = 1
              Width = 81
              Height = 19
              AutoSize = False
              Color = clSilver
              Ctl3D = False
              DataField = 'ID_Pedido'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBCheckBox1: TDBCheckBox
              Left = 248
              Top = 20
              Width = 137
              Height = 17
              Caption = 'Converter Unid. Medida'
              DataField = 'Converter_Unid_Medida'
              DataSource = DMRecebeXML.dsmItensNota
              TabOrder = 3
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object RxDBLookupCombo4: TRxDBLookupCombo
              Left = 96
              Top = 38
              Width = 82
              Height = 19
              DropDownCount = 8
              DropDownWidth = 300
              Ctl3D = False
              DataField = 'UnidadeInterno'
              DataSource = DMRecebeXML.dsmItensNota
              ListStyle = lsDelimited
              LookupField = 'UNIDADE'
              LookupDisplay = 'UNIDADE'
              LookupSource = DMRecebeXML.dsUnidade2
              ParentCtl3D = False
              TabOrder = 4
              OnEnter = RxDBLookupCombo4Enter
            end
            object DBEdit74: TDBEdit
              Left = 96
              Top = 56
              Width = 233
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'Num_Lote_Controle'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 9
            end
            object RxDBLookupCombo7: TRxDBLookupCombo
              Left = 96
              Top = 92
              Width = 249
              Height = 19
              DropDownCount = 8
              DropDownWidth = 300
              Ctl3D = False
              DataField = 'ID_Cor'
              DataSource = DMRecebeXML.dsmItensNota
              ListStyle = lsDelimited
              LookupField = 'ID_COMBINACAO_COR'
              LookupDisplay = 'NOME'
              LookupSource = DMRecebeXML.dsCombinacao
              ParentCtl3D = False
              TabOrder = 13
              OnChange = RxDBLookupCombo3Change
            end
            object DBEdit76: TDBEdit
              Left = 96
              Top = 111
              Width = 69
              Height = 19
              AutoSize = False
              Ctl3D = False
              DataField = 'ID_Grupo'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 16
              OnExit = DBEdit76Exit
              OnKeyDown = DBEdit76KeyDown
            end
            object DBEdit77: TDBEdit
              Left = 164
              Top = 111
              Width = 215
              Height = 19
              TabStop = False
              AutoSize = False
              Color = 13224393
              Ctl3D = False
              DataField = 'Nome_Grupo'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 17
            end
            object ckAtualizaRef: TCheckBox
              Left = 575
              Top = 94
              Width = 113
              Height = 17
              Anchors = [akTop, akRight]
              Caption = 'Ajustar Refer'#234'ncia'
              TabOrder = 15
            end
            object btnConfirmar: TNxButton
              Left = 522
              Top = 33
              Width = 33
              Height = 30
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              Glyph.Data = {
                AE060000424DAE06000000000000360000002800000017000000170000000100
                1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
                224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
                3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
                5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
                4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
                402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
                4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
                0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
                0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
                04550500550505560707540B065309065008044D06034D050042002F65312860
                2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
                54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
                044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
                0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
                550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
                2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
                C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
                00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
                FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
                002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
                FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
                07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
                DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
                C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
                5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
                FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
                000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
                056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
                022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
                9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
                B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
                8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
                FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
                B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
                2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
                0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
                5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
                299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
                C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
                36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
                4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
                984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
                FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
                7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
                B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
                CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
              GlyphSpacing = 5
              ParentFont = False
              TabOrder = 7
              Transparent = True
              OnClick = btnConfirmarClick
            end
            object DBEdit80: TDBEdit
              Left = 96
              Top = 74
              Width = 81
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'CEST'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 10
            end
            object DBEdit81: TDBEdit
              Left = 264
              Top = 74
              Width = 81
              Height = 19
              AutoSize = False
              CharCase = ecUpperCase
              Color = clSilver
              Ctl3D = False
              DataField = 'CEST'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 11
            end
            object DBCheckBox10: TDBCheckBox
              Left = 463
              Top = 74
              Width = 92
              Height = 17
              Caption = 'Gerar Estoque'
              DataField = 'Gerar_Estoque'
              DataSource = DMRecebeXML.dsmItensNota
              TabOrder = 12
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object RxDBComboBox2: TRxDBComboBox
              Left = 463
              Top = 109
              Width = 81
              Height = 21
              Style = csDropDownList
              DataField = 'Posse_Material'
              DataSource = DMRecebeXML.dsmItensNota
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Empresa'
                'Terceiro')
              TabOrder = 18
              Values.Strings = (
                'E'
                'T')
            end
            object RxDBLookupCombo10: TRxDBLookupCombo
              Left = 463
              Top = 92
              Width = 81
              Height = 19
              DropDownCount = 8
              DropDownWidth = 300
              Ctl3D = False
              DataField = 'Tamanho'
              DataSource = DMRecebeXML.dsmItensNota
              ListStyle = lsDelimited
              LookupField = 'TAMANHO'
              LookupDisplay = 'TAMANHO'
              LookupSource = DMRecebeXML.dsTamanho
              ParentCtl3D = False
              TabOrder = 14
              OnEnter = RxDBLookupCombo4Enter
            end
            object btnAjustarUnidade: TBitBtn
              Left = 567
              Top = 41
              Width = 162
              Height = 25
              Caption = 'Ajustar as Unidades'
              TabOrder = 8
              Visible = False
              OnClick = btnAjustarUnidadeClick
            end
            object DBEdit83: TDBEdit
              Left = 164
              Top = 129
              Width = 215
              Height = 19
              TabStop = False
              AutoSize = False
              Color = 13224393
              Ctl3D = False
              DataField = 'Nome_ContaOrcamento'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 20
            end
            object DBEdit82: TDBEdit
              Left = 96
              Top = 130
              Width = 69
              Height = 19
              AutoSize = False
              Ctl3D = False
              DataField = 'ID_ContaOrcamento'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 19
              OnExit = DBEdit82Exit
              OnKeyDown = DBEdit82KeyDown
            end
            object DBEdit94: TDBEdit
              Left = 463
              Top = 129
              Width = 69
              Height = 19
              AutoSize = False
              Ctl3D = False
              DataField = 'ID_ContaOrcamento'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 21
              OnKeyDown = DBEdit94KeyDown
            end
            object DBEdit95: TDBEdit
              Left = 530
              Top = 129
              Width = 215
              Height = 19
              TabStop = False
              AutoSize = False
              Color = 13224393
              Ctl3D = False
              DataField = 'Nome_ContaOrcamento'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 22
            end
          end
          object TS_Calculo: TTabSheet
            Caption = 'C'#225'lculos'
            ImageIndex = 2
            object Label123: TLabel
              Left = 10
              Top = 132
              Width = 83
              Height = 13
              Alignment = taRightJustify
              Caption = '% Margem Pre'#231'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label131: TLabel
              Left = 278
              Top = 128
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Caption = 'Custo Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object GroupBox5: TGroupBox
              Left = 8
              Top = 4
              Width = 161
              Height = 69
              Caption = ' Vlr. do Frete da Nota '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object Label126: TLabel
                Left = 8
                Top = 40
                Width = 132
                Height = 26
                Caption = 'Esse valor n'#227'o vem na nota'#13#10'Precisa ser informado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object ceVlrFrete_Nota: TCurrencyEdit
                Left = 24
                Top = 16
                Width = 121
                Height = 21
                AutoSize = False
                DisplayFormat = '0.00'
                TabOrder = 0
              end
            end
            object DBCheckBox3: TDBCheckBox
              Left = 13
              Top = 100
              Width = 196
              Height = 17
              Caption = 'Atualizar Custo Total'
              DataField = 'AtualizarCustoTotal'
              DataSource = DMRecebeXML.dsmItensNota
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              ValueChecked = 'True'
              ValueUnchecked = 'False'
              OnClick = DBCheckBox3Click
            end
            object DBCheckBox2: TDBCheckBox
              Left = 13
              Top = 83
              Width = 145
              Height = 17
              Caption = 'Atualizar Pre'#231'o Compra'
              DataField = 'AtualizarPreco'
              DataSource = DMRecebeXML.dsmItensNota
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object DBEdit75: TDBEdit
              Left = 97
              Top = 123
              Width = 81
              Height = 22
              Ctl3D = False
              DataField = 'Perc_Margem'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 3
            end
            object DBCheckBox4: TDBCheckBox
              Left = 215
              Top = 67
              Width = 196
              Height = 17
              Caption = 'Subtrair o ICMS do Custo do Produto'
              DataField = 'SUB_ICMS_CUSTO'
              DataSource = DMRecebeXML.dsmItensNota
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox5: TDBCheckBox
              Left = 215
              Top = 99
              Width = 236
              Height = 17
              Caption = 'Subtrair o Pis/Cofins do Custo do Produto'
              DataField = 'SUB_PISCOFINS_CUSTO'
              DataSource = DMRecebeXML.dsmItensNota
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox6: TDBCheckBox
              Left = 215
              Top = 5
              Width = 196
              Height = 17
              Caption = 'Somar IPI no custo'
              DataField = 'SOMAR_IPI_NO_CUSTO'
              DataSource = DMRecebeXML.dsmItensNota
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox7: TDBCheckBox
              Left = 215
              Top = 21
              Width = 196
              Height = 17
              Caption = 'Somar Frete no custo'
              DataField = 'SOMAR_FRETE_NO_CUSTO'
              DataSource = DMRecebeXML.dsmItensNota
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox8: TDBCheckBox
              Left = 215
              Top = 36
              Width = 196
              Height = 17
              Caption = 'Somar ST no custo'
              DataField = 'SOMAR_ST_NO_CUSTO'
              DataSource = DMRecebeXML.dsmItensNota
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox9: TDBCheckBox
              Left = 215
              Top = 82
              Width = 236
              Height = 17
              Caption = 'Subtrair o IPI do Custo do Produto'
              DataField = 'SUB_PISCOFINS_CUSTO'
              DataSource = DMRecebeXML.dsmItensNota
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBEdit73: TDBEdit
              Left = 339
              Top = 119
              Width = 81
              Height = 22
              Ctl3D = False
              DataField = 'Preco_Custo_Total'
              DataSource = DMRecebeXML.dsmItensNota
              ParentCtl3D = False
              TabOrder = 10
            end
            object BitBtn5: TBitBtn
              Left = 362
              Top = 26
              Width = 75
              Height = 25
              Caption = 'Recalcular'
              TabOrder = 11
              OnClick = BitBtn5Click
            end
            object GroupBox6: TGroupBox
              Left = 471
              Top = 10
              Width = 161
              Height = 130
              Caption = 'Calcular valor de venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              object cePercVlrVenda: TCurrencyEdit
                Left = 16
                Top = 33
                Width = 121
                Height = 21
                AutoSize = False
                DisplayFormat = '0.00'
                TabOrder = 0
              end
              object BitBtn7: TBitBtn
                Left = 16
                Top = 62
                Width = 121
                Height = 25
                Caption = 'Aplicar nos itens'
                TabOrder = 1
                OnClick = BitBtn7Click
              end
            end
          end
        end
      end
    end
    object tsDuplicatasDeducoes: TTabSheet
      BorderWidth = 5
      Caption = 'Financeiro'
      ImageIndex = 3
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 1088
        Height = 481
        Align = alClient
        TabOrder = 0
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 1086
          Height = 45
          Align = alTop
          Color = clSilver
          TabOrder = 0
          object Label152: TLabel
            Left = 335
            Top = 20
            Width = 116
            Height = 14
            Alignment = taRightJustify
            Caption = 'Conta Or'#231'amento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label153: TLabel
            Left = 827
            Top = 15
            Width = 61
            Height = 13
            Caption = 'F2 Pesquisar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object btnInserir_Fin: TNxButton
            Left = 7
            Top = 9
            Width = 94
            Height = 30
            Caption = 'Inserir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnInserir_FinClick
          end
          object btnAlterar_Fin: TNxButton
            Left = 100
            Top = 9
            Width = 94
            Height = 30
            Caption = 'Alterar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnAlterar_FinClick
          end
          object btnExcluir_Fin: TNxButton
            Left = 193
            Top = 9
            Width = 94
            Height = 30
            Caption = 'Excluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = btnExcluir_FinClick
          end
          object ceConta_Orcamento: TCurrencyEdit
            Left = 452
            Top = 14
            Width = 79
            Height = 19
            AutoSize = False
            Ctl3D = False
            DecimalPlaces = 0
            DisplayFormat = '0'
            ParentCtl3D = False
            TabOrder = 3
            OnExit = ceConta_OrcamentoExit
            OnKeyDown = ceConta_OrcamentoKeyDown
          end
          object edtNome_Conta_Orcamento: TEdit
            Left = 529
            Top = 14
            Width = 291
            Height = 19
            Color = 13224393
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
        end
        object SMDBGrid2: TSMDBGrid
          Left = 1
          Top = 46
          Width = 1086
          Height = 434
          Align = alClient
          Ctl3D = False
          DataSource = DMRecebeXML.dsmParc
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 8
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'NumDuplicata'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Duplicata'
              Title.Color = 16777130
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DtVencimento'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Title.Color = 16777130
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrVencimento'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Title.Color = 16777130
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_Conta'
              Title.Alignment = taCenter
              Title.Caption = 'ID Conta'
              Title.Color = 16777130
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkNomeConta'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Conta'
              Title.Color = 16777130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_TipoCobranca'
              Title.Alignment = taCenter
              Title.Caption = 'ID Tipo Cobran'#231'a'
              Title.Color = 16777130
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkNomeTipoCobranca'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Tipo Cobran'#231'a'
              Title.Color = 16777130
              Width = 182
              Visible = True
            end>
        end
      end
    end
    object tsNFeRefProtocolo: TTabSheet
      BorderWidth = 5
      Caption = 'NFe Ref. / Nfe Protocolo'
      ImageIndex = 4
      object dgNFeRef: TDBGrid
        Left = 0
        Top = 0
        Width = 1088
        Height = 278
        Align = alClient
        DataSource = DMRecebeXML.dsNFeRef
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dgNFeProtocolo: TDBGrid
        Left = 0
        Top = 278
        Width = 1088
        Height = 203
        Align = alBottom
        DataSource = DMRecebeXML.dsNFeProtocolo
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'versao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Id'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tpAmb'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'verAplic'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chNFe'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dhRecbto'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nProt'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'digVal'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cStat'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'xMotivo'
            Width = 64
            Visible = True
          end>
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Total'
      ImageIndex = 7
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1090
        Height = 483
        Align = alClient
        Color = clMoneyGreen
        Enabled = False
        TabOrder = 0
        object Label80: TLabel
          Left = 1
          Top = 113
          Width = 110
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr. Total dos Produtos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label88: TLabel
          Left = 27
          Top = 137
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr. Tota da Nota:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label77: TLabel
          Left = 59
          Top = 41
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Base Icms:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label78: TLabel
          Left = 203
          Top = 41
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Icms:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label81: TLabel
          Left = 51
          Top = 65
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr. do Frete:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label82: TLabel
          Left = 314
          Top = 65
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr. do Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label83: TLabel
          Left = 44
          Top = 89
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr. Desconto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label84: TLabel
          Left = 347
          Top = 41
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr. IPI:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label85: TLabel
          Left = 484
          Top = 41
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr. PIS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label86: TLabel
          Left = 619
          Top = 41
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr. Cofins:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label87: TLabel
          Left = 585
          Top = 65
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Outras Despesas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit57: TDBEdit
          Left = 113
          Top = 131
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'vNF'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit46: TDBEdit
          Left = 113
          Top = 35
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'ICMSTot_vBC'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit47: TDBEdit
          Left = 257
          Top = 35
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'vICMS'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit48: TDBEdit
          Left = 113
          Top = 107
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'vProd'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit50: TDBEdit
          Left = 113
          Top = 59
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'vFrete'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit51: TDBEdit
          Left = 383
          Top = 59
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'vSeg'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit52: TDBEdit
          Left = 113
          Top = 83
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'ICMSTot_vDesc'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit53: TDBEdit
          Left = 383
          Top = 35
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'vIPI'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit54: TDBEdit
          Left = 525
          Top = 35
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'ICMSTot_vPIS'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit55: TDBEdit
          Left = 671
          Top = 35
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'ICMSTot_vCOFINS'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit56: TDBEdit
          Left = 671
          Top = 59
          Width = 82
          Height = 19
          TabStop = False
          Ctl3D = False
          DataField = 'vOutro'
          DataSource = DMRecebeXML.dsCabecalho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Resumo'
      ImageIndex = 7
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 1090
        Height = 483
        Align = alClient
        Color = clMoneyGreen
        TabOrder = 0
        object Label62: TLabel
          Left = 39
          Top = 32
          Width = 80
          Height = 16
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lbStatusForn: TLabel
          Left = 125
          Top = 32
          Width = 700
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label63: TLabel
          Left = 69
          Top = 56
          Width = 50
          Height = 16
          Caption = 'Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lbStatusCidade: TLabel
          Left = 125
          Top = 56
          Width = 700
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label66: TLabel
          Left = 87
          Top = 80
          Width = 32
          Height = 16
          Caption = 'Pa'#237's:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lbStatusPais: TLabel
          Left = 125
          Top = 80
          Width = 700
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lbStatusNotaEntrada: TLabel
          Left = 125
          Top = 112
          Width = 700
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label69: TLabel
          Left = 26
          Top = 112
          Width = 93
          Height = 16
          Caption = 'Nota Entrada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label70: TLabel
          Left = 12
          Top = 279
          Width = 132
          Height = 18
          Caption = 'Contas a Pagar:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lbStatusContasPagar: TLabel
          Left = 157
          Top = 283
          Width = 796
          Height = 18
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 61
          Top = 176
          Width = 58
          Height = 16
          Caption = 'Material:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lbStatusMaterial: TLabel
          Left = 125
          Top = 176
          Width = 700
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label74: TLabel
          Left = 60
          Top = 208
          Width = 59
          Height = 16
          Caption = 'Estoque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lbStatusEstoque: TLabel
          Left = 125
          Top = 208
          Width = 700
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1106
    Height = 146
    Align = alTop
    BevelOuter = bvNone
    Color = clMoneyGreen
    TabOrder = 1
    DesignSize = (
      1106
      146)
    object Label4: TLabel
      Left = 269
      Top = 3
      Width = 524
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Label4'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object Label64: TLabel
      Left = 580
      Top = 34
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Nota:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label75: TLabel
      Left = 168
      Top = 19
      Width = 54
      Height = 13
      Caption = 'Dt.Entrada:'
    end
    object Label89: TLabel
      Left = 141
      Top = 61
      Width = 96
      Height = 26
      Caption = 'Usar Config. da Nat.'#13#10'Interna para o ICMS'
    end
    object Label71: TLabel
      Left = 278
      Top = 42
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Gravar Itens como: '
    end
    object Label93: TLabel
      Left = 6
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Gerar como:'
    end
    object Label113: TLabel
      Left = 865
      Top = 6
      Width = 65
      Height = 26
      Caption = '% Margem'#13#10'Pre'#231'o Venda:'
      Visible = False
    end
    object Label91: TLabel
      Left = 287
      Top = 109
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente Triangular:'
      Visible = False
    end
    object SpeedButton1: TSpeedButton
      Left = 690
      Top = 100
      Width = 23
      Height = 22
      Hint = 'Atualiza tabela de cliente'
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFDF9FAFBF2
        F1F1EEEEEEEBEBEBE9EAECE4E8E9E2E4E7E3E4E6E4E6E7E6E9EAEBECF0F2F4F7
        F2F6F5F7F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF1EBE9D0C5BADBDEE2C9CC
        CEC1C3C4B6B0AEB1A397AA876AA6764FA87044AC754BB39174C7BCB3D5D6DBE5
        E7E8EFEFEEFDFDFDFFFFFFFFFFFFFFFFFFEBE5DC9F6B46DBDBDEC9C8CAB9A796
        B68861C18451D29861CD9460CE945CCC9258C58346B26E36C09E83E3E1E3EFF1
        F2FBFBFBFFFFFFFFFFFFFFFFFFF5F0EEBC8A63C3A48CC3A58CC68F61CF9B68C8
        9565CA9361CD9364C18951BF864FC18853C6884FB8763BCEB3A1F7FCFFFEFEFE
        FFFFFFFFFFFFFFFFFFF7F3EFBD916CD5B493D6AD8BD8AA84CB9668CB9664BA85
        53BA8A61C6A281BF926DBB814EC08F67B47437BE8C5EEDE6DFFFFFFFFFFFFFFF
        FFFFFFFFFFF6F2EEB98F69E3C2A3DDB99AE0BF9CCA9C72BD9473E2CFC0E5D9D0
        F1EEECEFE7E3E1CAB1DCC3AACFB193A96B33E4D1BFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F2EFBA9069DFBB9BDEBD9DC79F7BD8C4B1F1EDEAFFFFFFFFFFFFFFFFFFFF
        FFFFF7F3EEEAD6C4FEFEFEB58560D7BDA9FFFFFFFFFFFFFFFFFFFFFFFFF7F3EF
        BD946CDFBC9CD9B996D8B694C8AE97F6F6F6FFFFFFFEFFFFFFFEFFFFFFFFFBF9
        F7F4EBE5FFFFFFC1A287D9C5B5FFFFFFFFFFFFFFFFFFFFFFFFF5EEEAB07E53E0
        BD9FDCB793E2BE9FCE9E73D0B499FCFAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE2D6CBEBE3DCFFFFFFFFFFFFFFFFFFFFFFFFF9F9F5BEA994C2A797BFA1
        92BB9E8CB99C89B39983F7F5F2FFFFFFAB7957BB967BB79676B89778B89777B9
        997EECE3DCFFFFFFFFFFFFFFFFFFFFFFFFF5F0E8CAB09BFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC9B7A7D3A679DBB088D9AA84DCAD87C7986EE9DB
        CDFFFFFFFFFFFFFFFFFFFFFFFFE6D8CEB67B50E8D0BCDFC7B7F3EFEBFFFFFFFE
        FFFEFEFFFEFFFFFFFFFFFFBA9F8CD6A57DCF9B6ECD9B6CBF9164E9DDD2FFFFFF
        FFFFFFFFFFFFFFFFFFEDE4DCA86B3BBF865CC29776EAE2DBFFFFFFFFFFFFFFFF
        FFFDFFFFDED0C4D4B8A3C79B71D1A478CD9E70BF9265E8DDD0FFFFFFFFFFFFFF
        FFFFFFFFFFF9F5F2BD8F6DBC8A639D5F2DB58968E0D2C8E7DCD3DAC8B8DECBBA
        C09A77D4A882D0A479D2A478D3A77CBF8E64E8DBCFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F5F2CAAB93E5CCB7CCA788C29471CDAC8ED9BDA3CAA98AD7B094E8CEB2DB
        BEA1DDB995C99D76C0946FC39168EADACFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF
        E1D2C6C5A284F6E3D0F0DCC9E6CEB7E6CCB5E5CBB6E7CCB5E5CCB2E3C2A4C299
        78CFB9A6D2BEADB58257E7D5C6FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFDFEFEDA
        C9BBBA9675D4B193EDD1B8EED3BCECCEB6D1AF8EBE916DC2A386EEE6E2F9F8F6
        FFFFFFBD9A80DBC9BAFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFDFEFEF6F2
        EFD9C8BDBFA38CC3A388B99D83CFBEACFAF6F4F7F4F2FFFFFFFFFFFFFFFFFFF8
        F7F5F8F7F4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFF
        FFFEFEFFFFFFFFFFFFFF}
      Margin = 0
      Visible = False
      OnClick = SpeedButton1Click
    end
    object Label114: TLabel
      Left = 349
      Top = 130
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
      Visible = False
    end
    object Label116: TLabel
      Left = 266
      Top = 87
      Width = 106
      Height = 13
      Caption = 'Finalidade (Aquisi'#231#227'o):'
    end
    object Label119: TLabel
      Left = 718
      Top = 108
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Local Estoque:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label122: TLabel
      Left = 750
      Top = 86
      Width = 117
      Height = 13
      Alignment = taRightJustify
      Caption = 'Gravar o Emitente como:'
    end
    object SpeedButton2: TSpeedButton
      Left = 520
      Top = 81
      Width = 89
      Height = 21
      Caption = 'Copiar para Itens'
      OnClick = SpeedButton2Click
    end
    object Label132: TLabel
      Left = 645
      Top = 63
      Width = 75
      Height = 13
      Caption = 'Ref.Seq. Inicial:'
    end
    object Label133: TLabel
      Left = 732
      Top = 129
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'ID Opera'#231#227'o:'
    end
    object Label145: TLabel
      Left = 319
      Top = 64
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Sped:'
    end
    object DBEdit34: TDBEdit
      Left = 634
      Top = 29
      Width = 184
      Height = 25
      TabStop = False
      Ctl3D = False
      DataField = 'nNF'
      DataSource = DMRecebeXML.dsCabecalho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 19
    end
    object DateEdit1: TDateEdit
      Left = 152
      Top = 35
      Width = 100
      Height = 21
      NumGlyphs = 2
      StartOfWeek = Sun
      TabOrder = 2
    end
    object CheckBox1: TCheckBox
      Left = 240
      Top = 64
      Width = 17
      Height = 17
      TabOrder = 3
    end
    object btnAbrirXML: TBitBtn
      Left = 5
      Top = 32
      Width = 120
      Height = 28
      Caption = 'Abrir NFe (XML)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnAbrirXMLClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF40404040404040404040404040404040404040404040
        4040404040404040404040404040404040404040002020FFFFFF40404060DFDF
        60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DF
        DF60DFDF004040FFFFFF40404060DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60
        DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF004040FFFFFF40404060DFDF
        60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DF
        DF60DFDF004040FFFFFF40404060DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60
        DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF004040FFFFFF40404060DFDF
        60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DFDF60DF
        DF60DFDF004040FFFFFF404040609F9F60DFDF609F9F60DFDF609F9F60DFDF60
        9F9F609F9F306F6F609F9F306F6F609F9F306F6F004040FFFFFF40404060DFDF
        606060609F9F306F6F306F6F306F6F306F6F306F6F60DFDF306F6F306F6F609F
        9F003F3F004040FFFFFF404040609F9F609F9F60606060DFDF306F6F306F6F30
        6F6F306F6F60DFDF306F6F306F6F306F6F306F6F004040FFFFFF404040306F6F
        306F6F306F6F306F6F306F6F306F6F306F6F306F6F306F6F306F6F306F6F306F
        6F306F6F202020FFFFFF707070609F9F90CFCF90CFCF90CFCF90CFCF90CFCFB0
        B0B0404040404040404040404040404040404040FFFFFFFFFFFFFFFFFF404040
        306F6F306F6F306F6F306F6F508F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040404040404040404040202020FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object btnGravarNFe: TBitBtn
      Left = 7
      Top = 64
      Width = 120
      Height = 28
      Caption = 'Gravar No Sistema'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
      OnClick = btnGravarNFeClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF3F3F3F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F
        6F6F6F6F6F6060603F3F3F000000FFFFFFFFFFFFFFFFFFFFFFFF6F6F6FDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF7F7F7FBFBFBF0000
        00FFFFFFFFFFFFFFFFFF6F6F6FDF9F9FDF6060DFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDF6F6F6F6F6F6F000000FFFFFFFFFFFFFFFFFF6F6F6FDFDFDF
        DF9F9FEF6F6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF0000
        00FFFFFFFFFFFFFFFFFF6F6F6FDFDFDFDFDFDFDF9F9FDF9F9FDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDF000000FFFFFFFFFFFFFFFFFF6F6F6FDFDFDF
        DFDFDFDFDFDFAF6F6FDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFCFCFCFC0C0C00000
        2000005F00003FFFFFFF6F6F6FDFDFDFCFCFCFDFDFDFDFDFDF3F00007F3F3F7F
        3F3F60606060606060606060606060606000007F0000BF00003F606060CFCFCF
        6F6F6F909090DFDFDF9F9F9F3F3F3F7F7F7F7F7F7FEFEFEFDFDFDFDFDFDFFFFF
        FF6F6F6F0000BF00005F3030307F7F7FFFFFFFBFBFBF909090DFDFDF3030307F
        00003F3F3F909090DFDFDFFFFFFFFFFFFF7F7F7F0000BF000020FFFFFF000000
        3F3F3F7F7F7FBFBFBF6060606F6F6F9F9F9F7F00009F9F9FFFFFFFFFFFFF6F6F
        6F000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000003F
        3F3FAFAFAF7F00007F7F7F303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000007F0000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000007F0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F00
        00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF}
    end
    object BitBtn3: TBitBtn
      Left = 5
      Top = 96
      Width = 120
      Height = 28
      Caption = 'Danfe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      OnClick = BitBtn3Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFF202020
        404040404040404040404040404040404040404040202020FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000060606060606060606060606060606060606050
        5050202020404040404040404040404040808080202020FFFFFF000000BFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF606060606060B0B0B0C0C0C0C0C0
        C04040408080802020205F5F5F505050B0B0B0909090A0A0A0B0B0B0808080C0
        C0C0CFCFCF4040405050506060606060604040404040408080807F7F7FC0C0C0
        606060606060606060606060606060606060606060606060C0C0C0DFDFDFCFCF
        CF808080202020FFFFFF7F7F7FC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C09090907F7F7FCFCFCF8080808080800000007F7F7FC0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C09090CF60609FC0C0
        C08080808080800000003F3F3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9F9F9F808080000000FFFFFF303030
        B0B0B02020203F3F3F7F7F7F3F3F3F5F5F5F2020203F3F3F6F6F6F0000003030
        30CFCFCF9F9F9F000000FFFFFFFFFFFF303030505050202020FFFFFFDFDFDF5F
        5F5F000000DFDFDFFFFFFF404040606060606060505050000000FFFFFFFFFFFF
        FFFFFFFFFFFF0000009F9F9FFFFFFF4040405F5F5FFFFFFFFFFFFF9F9F9F0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF202020EFEFEFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object ComboBox1: TComboBox
      Left = 374
      Top = 34
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = ComboBox1Change
      Items.Strings = (
        'Produto'
        'Material'
        'Material Consumo'
        'Imobilizado')
    end
    object ComboBox2: TComboBox
      Left = 67
      Top = 6
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 1
      Text = 'Entrada'
      Items.Strings = (
        'Sa'#237'da'
        'Entrada')
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 933
      Top = 10
      Width = 73
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00'
      TabOrder = 16
      Visible = False
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 375
      Top = 101
      Width = 313
      Height = 21
      DropDownCount = 8
      DropDownWidth = 700
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME;CNPJ_CPF'
      LookupSource = DMRecebeXML.dsCliente
      TabOrder = 9
      Visible = False
      OnKeyDown = RxDBLookupCombo1KeyDown
    end
    object RxDBLookupCombo6: TRxDBLookupCombo
      Left = 375
      Top = 122
      Width = 313
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMRecebeXML.dsFilial
      TabOrder = 10
      Visible = False
      OnExit = RxDBLookupCombo6Exit
    end
    object cbFinalidade: TComboBox
      Left = 375
      Top = 79
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 4
      TabOrder = 8
      Text = 'Outros'
      Items.Strings = (
        'Consumo'
        'Revenda'
        'Industrializa'#231#227'o'
        'Usar conforme produto'
        'Outros'
        '')
    end
    object rxdbLocalEstoque: TRxDBLookupCombo
      Left = 793
      Top = 100
      Width = 220
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'NOME;COD_LOCAL'
      LookupSource = DMRecebeXML.dsLocal_Estoque
      ParentFont = False
      TabOrder = 14
      OnExit = rxdbLocalEstoqueExit
    end
    object ComboBox3: TComboBox
      Left = 868
      Top = 78
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 13
      Text = 'Fornecedor'
      Items.Strings = (
        'Fornecedor'
        'Cliente')
    end
    object ckAtualizaPreco2: TCheckBox
      Left = 963
      Top = 38
      Width = 147
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Ajustar Pre'#231'o Compra'
      TabOrder = 17
      Visible = False
    end
    object ckAtualizaCusto2: TCheckBox
      Left = 963
      Top = 54
      Width = 147
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Ajustar Pre'#231'o Custo Total'
      TabOrder = 18
      Visible = False
    end
    object ckUsaNome: TCheckBox
      Left = 144
      Top = 107
      Width = 118
      Height = 17
      Caption = 'Usa Nome da Nota'
      TabOrder = 5
      Visible = False
    end
    object ckAssociar: TCheckBox
      Left = 144
      Top = 91
      Width = 118
      Height = 17
      Caption = 'Associar Produtos'
      TabOrder = 4
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 722
      Top = 55
      Width = 97
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 11
      OnKeyDown = CurrencyEdit2KeyDown
    end
    object NxButton1: TNxButton
      Left = 819
      Top = 47
      Width = 32
      Height = 31
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        18000000000078060000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9BED7B786B5A064A1955795965B
        95AB84AAD5C8D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB571AA801171831376902787
        9B3B9BA451A6AA5DAEA25DA89C68A45B215C8E6B8EFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFDEBAD9880C728E177D9B
        3193A54CA4A550A4A44DA2A34BA2A24BA1A448A2A247A1C37CC6AC84B6480E48
        D1C6D2FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFCA90C18602
        719524899E3898A249A1A147A0A0449DA1469FA1469FA1469FA1469FA1459F9E
        409BA747A0CB91CF5D2A61B39CB2FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        D8AED2860072962489983092A1449CA0419A9F4199AA55A59E3D989F419BA041
        99A0419AA0419BA0419B9F3F9A9E3996C57EC65A285FCFC1CFFFFFFFFFFFFF00
        0000FFFFFFFFFFFF8A06779421849127899E3C959D3E949D3D949B3691D8BECF
        9D3D949E3B949D3D949D3D949D3D949D3D949D3D949C3B93972D8DC88ECC480E
        4AFFFFFFFFFFFF000000FFFFFFB15FA790197D8B2782942E899E37919D36919D
        36919C34909A308DFFFFFF9220859D35919D36919D35909D36919D35919F3692
        942C8994338BA97FB48F6A8DFFFFFF000000FFFFFF8D0D7B88277F81277F9A31
        8C9B318D9B318D9A318D9B318D962588C896C2FFFFFF9421859B318D9B318D9B
        318D9B318D9B318D9D318D7D1E79AF69B25C225FFFFFFF000000D8B2D38D187E
        7721787B237B9B2A8A9629889629889629889629889628888F1880FDFFFEA23F
        95922184962988962988962988962988992A8A80237D741B76995F9FD8CBD800
        0000C07AB6821F7B5E195F731C6E991F83941D80941D80941D80941E80931E81
        8E137ABF7BB2F5FDF48F127B941F829621839521839521839821857C1E735C15
        5C8C4292AF89AF000000B35DAB701B6C390D3E74206AA139949F4098A1439BA1
        429A9F3C96972B878E157786046DF1F2ECD8BECF8B087094217D94227D94227D
        982380781C6A3D0C3F7B357D9E659E000000B76CB9701B6F7821739A3F97A751
        A7A44EA4A44EA4A34EA49E419DFFFFFFFFFFFFFEFFFFEFEFE9F4FFF0BD81AA90
        15719621789521779921797618634D134F8828869B5F9C000000C38AC87E227C
        8A257D963A90A54FA5A44DA3A34CA2A44CA29E429EC997C9FFFFFFFEFCFEC693
        C7CA99C9C9A1C89C378D9B368D9E398FA042979B3D958C27808C2182A670A800
        0000D8B4DE8132838F237F95348CA54FA5A34CA2A34CA2A34CA2A34BA29D409C
        FFFFFFFFFFFFB873B69B3B9A9F449EA44EA4A44FA5A44FA4A650A697388F8E26
        7F891D7EBD90BB000000ECDDF3975B9F861D77942A84A755AAA44FA5A44FA5A4
        4FA5A550A59E429FD6B0D6FFFFFFFDFEFD9C3F9DA44EA5A54FA5A54FA5A44FA5
        A654AA942D87912782831277E0CADE000000FFFFFFC899D96D1764962083A855
        ADA95AB1A959B0A959B0A959B1A857AFA859B0FFFFFFFFFFFFD0A5D4A34EAAA9
        59B1A959B0AA5AB1A959B0932080952285831674FFFFFF000000FFFFFFE7D0F6
        8C5B958C1678A03E9CB16EC2AE67BCAE67BCAE67BCAE67BCA658B5E5D1EAFFFF
        FFFFFFFFAC64BCAE65BBAE67BCB16DC2A0429F9622868C147ABC7FB3FFFFFF00
        0000FFFFFFFFFFFFDCBCF16322639A2284B472C9B778CEB576CBB576CBB576CB
        B472CAFFFFFFF9F3FAF8F1F9FFFFFFB26FC9B678CDB575CB962783931F828B12
        78FFFFFFFFFFFF000000FFFFFFFFFFFFF7F0FCD0B0E35E1459A1328FC291E7BD
        8AE1BC88DFBD88DFBC88DFBA84DDB57AD9B67ADAB781DBBC8AE0C192E99F3A92
        962483870171E6CDE3FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFF4EBFCCFB0
        E364216095308ACDA2F7CAA1F4C599EFC598EEC598EEC598EEC599EEC8A1F3CB
        A3F4A04299921E7D860072D5ACD0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFDCBDF18958936B1E63B785C5E3CDFEE3CDFEE1CCFDE3CF
        FEE4D0FFC291D39130838911768B0D7BE5CAE1FFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D4F5CA99DA9150977A307B
        8F49909951999443918218778108718E127DBF7AB6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF1E4F5DCBBE1C792CAB86FB9B76AB0C78DC0E4C8E0FFFFFFFFFFFFFFFFFF
        FFFFFFF2F2F2FFFFFFFFFFFFF2F2F2000000}
      TabOrder = 12
      OnClick = NxButton1Click
    end
    object RxDBLookupCombo9: TRxDBLookupCombo
      Left = 794
      Top = 121
      Width = 220
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMRecebeXML.dsOperacao_Nota
      TabOrder = 15
    end
    object cbTipoSped: TComboBox
      Left = 374
      Top = 56
      Width = 217
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      Items.Strings = (
        '00 - Mercadoria para Revenda'
        '01- Mat'#233'ria-Prima'
        '02- Embalagem'
        '03 - Produto em Processo'
        '04 - Produto Acabado'
        '05 - SubProduto'
        '06 - Produto Intermedi'#225'rio'
        '07 - Material de Uso e Consumo'
        '08 - Ativo Imobilizado'
        '09 - Servi'#231'os'
        '10 - Outros Insumos'
        '99 - Outras')
    end
    object NxButton2: TNxButton
      Left = 588
      Top = 51
      Width = 32
      Height = 29
      Hint = 'Grava a op'#231#227'o escolhida nos itens abaixo'
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        18000000000078060000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9BED7B786B5A064A1955795965B
        95AB84AAD5C8D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB571AA801171831376902787
        9B3B9BA451A6AA5DAEA25DA89C68A45B215C8E6B8EFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFDEBAD9880C728E177D9B
        3193A54CA4A550A4A44DA2A34BA2A24BA1A448A2A247A1C37CC6AC84B6480E48
        D1C6D2FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFCA90C18602
        719524899E3898A249A1A147A0A0449DA1469FA1469FA1469FA1469FA1459F9E
        409BA747A0CB91CF5D2A61B39CB2FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        D8AED2860072962489983092A1449CA0419A9F4199AA55A59E3D989F419BA041
        99A0419AA0419BA0419B9F3F9A9E3996C57EC65A285FCFC1CFFFFFFFFFFFFF00
        0000FFFFFFFFFFFF8A06779421849127899E3C959D3E949D3D949B3691D8BECF
        9D3D949E3B949D3D949D3D949D3D949D3D949D3D949C3B93972D8DC88ECC480E
        4AFFFFFFFFFFFF000000FFFFFFB15FA790197D8B2782942E899E37919D36919D
        36919C34909A308DFFFFFF9220859D35919D36919D35909D36919D35919F3692
        942C8994338BA97FB48F6A8DFFFFFF000000FFFFFF8D0D7B88277F81277F9A31
        8C9B318D9B318D9A318D9B318D962588C896C2FFFFFF9421859B318D9B318D9B
        318D9B318D9B318D9D318D7D1E79AF69B25C225FFFFFFF000000D8B2D38D187E
        7721787B237B9B2A8A9629889629889629889629889628888F1880FDFFFEA23F
        95922184962988962988962988962988992A8A80237D741B76995F9FD8CBD800
        0000C07AB6821F7B5E195F731C6E991F83941D80941D80941D80941E80931E81
        8E137ABF7BB2F5FDF48F127B941F829621839521839521839821857C1E735C15
        5C8C4292AF89AF000000B35DAB701B6C390D3E74206AA139949F4098A1439BA1
        429A9F3C96972B878E157786046DF1F2ECD8BECF8B087094217D94227D94227D
        982380781C6A3D0C3F7B357D9E659E000000B76CB9701B6F7821739A3F97A751
        A7A44EA4A44EA4A34EA49E419DFFFFFFFFFFFFFEFFFFEFEFE9F4FFF0BD81AA90
        15719621789521779921797618634D134F8828869B5F9C000000C38AC87E227C
        8A257D963A90A54FA5A44DA3A34CA2A44CA29E429EC997C9FFFFFFFEFCFEC693
        C7CA99C9C9A1C89C378D9B368D9E398FA042979B3D958C27808C2182A670A800
        0000D8B4DE8132838F237F95348CA54FA5A34CA2A34CA2A34CA2A34BA29D409C
        FFFFFFFFFFFFB873B69B3B9A9F449EA44EA4A44FA5A44FA4A650A697388F8E26
        7F891D7EBD90BB000000ECDDF3975B9F861D77942A84A755AAA44FA5A44FA5A4
        4FA5A550A59E429FD6B0D6FFFFFFFDFEFD9C3F9DA44EA5A54FA5A54FA5A44FA5
        A654AA942D87912782831277E0CADE000000FFFFFFC899D96D1764962083A855
        ADA95AB1A959B0A959B0A959B1A857AFA859B0FFFFFFFFFFFFD0A5D4A34EAAA9
        59B1A959B0AA5AB1A959B0932080952285831674FFFFFF000000FFFFFFE7D0F6
        8C5B958C1678A03E9CB16EC2AE67BCAE67BCAE67BCAE67BCA658B5E5D1EAFFFF
        FFFFFFFFAC64BCAE65BBAE67BCB16DC2A0429F9622868C147ABC7FB3FFFFFF00
        0000FFFFFFFFFFFFDCBCF16322639A2284B472C9B778CEB576CBB576CBB576CB
        B472CAFFFFFFF9F3FAF8F1F9FFFFFFB26FC9B678CDB575CB962783931F828B12
        78FFFFFFFFFFFF000000FFFFFFFFFFFFF7F0FCD0B0E35E1459A1328FC291E7BD
        8AE1BC88DFBD88DFBC88DFBA84DDB57AD9B67ADAB781DBBC8AE0C192E99F3A92
        962483870171E6CDE3FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFF4EBFCCFB0
        E364216095308ACDA2F7CAA1F4C599EFC598EEC598EEC598EEC599EEC8A1F3CB
        A3F4A04299921E7D860072D5ACD0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFDCBDF18958936B1E63B785C5E3CDFEE3CDFEE1CCFDE3CF
        FEE4D0FFC291D39130838911768B0D7BE5CAE1FFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D4F5CA99DA9150977A307B
        8F49909951999443918218778108718E127DBF7AB6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF1E4F5DCBBE1C792CAB86FB9B76AB0C78DC0E4C8E0FFFFFFFFFFFFFFFFFF
        FFFFFFF2F2F2FFFFFFFFFFFFF2F2F2000000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      TabStop = False
      Transparent = True
      OnClick = NxButton2Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.xml'
    InitialDir = 'c:\'
    Left = 680
    Top = 243
  end
  object UCControls1: TUCControls
    GroupName = 'Recebe XML'
    UserControl = fMenu.UserControl1
    NotAllowed = naDisabled
    Left = 492
    Top = 329
  end
  object XMLDocument1: TXMLDocument
    Left = 636
    Top = 330
    DOMVendorDesc = 'MSXML'
  end
end
