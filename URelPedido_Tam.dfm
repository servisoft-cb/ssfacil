object fRelPedido_Tam: TfRelPedido_Tam
  Left = 159
  Top = 39
  Width = 874
  Height = 666
  Caption = 'Pedido'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 48
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DMCadPedido.dsPedidoImp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    RecordRange = rrCurrentOnly
    ShowProgress = False
    BeforePrint = RLReport1BeforePrint
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 26
      Width = 742
      Height = 623
      DataSource = DMCadPedido.dsPedidoImp
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 159
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLDraw8: TRLDraw
          Left = 0
          Top = 0
          Width = 742
          Height = 43
          Align = faTop
        end
        object RLLabel4: TRLLabel
          Left = 3
          Top = 26
          Width = 88
          Height = 15
          Alignment = taRightJustify
          Caption = 'Pedido Interno:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 591
          Top = 4
          Width = 70
          Height = 15
          Caption = 'Dt.Emiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 247
          Top = 26
          Width = 87
          Height = 15
          Alignment = taRightJustify
          Caption = 'Pedido Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 667
          Top = 4
          Width = 71
          Height = 15
          DataField = 'DTEMISSAO'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 336
          Top = 26
          Width = 100
          Height = 15
          DataField = 'PEDIDO_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 42
          Width = 742
          Height = 66
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLLabel10: TRLLabel
          Left = 26
          Top = 45
          Width = 35
          Height = 12
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 16
          Top = 57
          Width = 45
          Height = 12
          Caption = 'Endere'#231'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 31
          Top = 68
          Width = 30
          Height = 12
          Caption = 'Bairro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 26
          Top = 81
          Width = 35
          Height = 12
          Caption = 'Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 65
          Top = 45
          Width = 51
          Height = 11
          DataField = 'NOME_CLI'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 65
          Top = 68
          Width = 83
          Height = 12
          DataField = 'BAIRRO_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel19: TRLLabel
          Left = 433
          Top = 45
          Width = 45
          Height = 12
          Caption = 'Telefone :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel20: TRLLabel
          Left = 455
          Top = 57
          Width = 23
          Height = 12
          Caption = 'Cep:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 443
          Top = 68
          Width = 35
          Height = 12
          Caption = 'Estado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel23: TRLLabel
          Left = 428
          Top = 93
          Width = 50
          Height = 12
          Caption = 'Inscr. Est.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel24: TRLLabel
          Left = 447
          Top = 81
          Width = 31
          Height = 12
          Caption = 'CNPJ:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText11: TRLDBText
          Left = 508
          Top = 45
          Width = 73
          Height = 12
          DataField = 'FONE_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText12: TRLDBText
          Left = 482
          Top = 57
          Width = 66
          Height = 12
          DataField = 'CEP_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText13: TRLDBText
          Left = 482
          Top = 68
          Width = 16
          Height = 12
          DataField = 'UF'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText14: TRLDBText
          Left = 482
          Top = 81
          Width = 96
          Height = 12
          DataField = 'CNPJ_CPF_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText15: TRLDBText
          Left = 482
          Top = 93
          Width = 99
          Height = 12
          DataField = 'INSCR_EST_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel25: TRLLabel
          Left = 598
          Top = 45
          Width = 22
          Height = 12
          Caption = 'Fax:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText17: TRLDBText
          Left = 648
          Top = 45
          Width = 64
          Height = 12
          DataField = 'FAX_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel30: TRLLabel
          Left = 85
          Top = 145
          Width = 40
          Height = 11
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel32: TRLLabel
          Left = 4
          Top = 145
          Width = 51
          Height = 11
          Caption = 'Refer'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel34: TRLLabel
          Left = 686
          Top = 145
          Width = 54
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Pr.Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel35: TRLLabel
          Left = 646
          Top = 145
          Width = 38
          Height = 11
          Alignment = taCenter
          Caption = 'Pr.Unit.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel37: TRLLabel
          Left = 486
          Top = 145
          Width = 28
          Height = 11
          Alignment = taCenter
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText20: TRLDBText
          Left = 93
          Top = 25
          Width = 62
          Height = 16
          AutoSize = False
          DataField = 'NUM_PEDIDO'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel18: TRLLabel
          Left = 11
          Top = 94
          Width = 50
          Height = 12
          Alignment = taRightJustify
          Caption = 'Email NFe:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText7: TRLDBText
          Left = 482
          Top = 45
          Width = 24
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DDD_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rlEndereco: TRLLabel
          Left = 65
          Top = 57
          Width = 368
          Height = 12
          AutoSize = False
          Caption = 'Endere'#231'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText31: TRLDBText
          Left = 2
          Top = 1
          Width = 308
          Height = 14
          AutoSize = False
          DataField = 'NOME_FILIAL'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText37: TRLDBText
          Left = 65
          Top = 81
          Width = 83
          Height = 12
          DataField = 'CIDADE_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText38: TRLDBText
          Left = 65
          Top = 94
          Width = 98
          Height = 12
          DataField = 'EMAIL_NFE_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText39: TRLDBText
          Left = 622
          Top = 45
          Width = 24
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DDD_FAX_CLIENTE'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw12: TRLDraw
          Left = 0
          Top = 107
          Width = 742
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLLabel9: TRLLabel
          Left = 77
          Top = 122
          Width = 54
          Height = 14
          Caption = 'Vendedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText28: TRLDBText
          Left = 134
          Top = 124
          Width = 513
          Height = 12
          AutoSize = False
          DataField = 'NOME_VENDEDOR'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel28: TRLLabel
          Left = 433
          Top = 145
          Width = 22
          Height = 11
          Alignment = taCenter
          Caption = 'Uni.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 9
          Top = 108
          Width = 122
          Height = 14
          Caption = 'Condi'#231#227'o de Pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText9: TRLDBText
          Left = 134
          Top = 110
          Width = 513
          Height = 12
          AutoSize = False
          DataField = 'NOME_CONDPGTO'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel1: TRLLabel
          Left = 596
          Top = 26
          Width = 65
          Height = 15
          Caption = 'Dt.Entrega:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 667
          Top = 26
          Width = 71
          Height = 15
          DataField = 'DTENTREGA'
          DataSource = DMCadPedido.dsPedidoImp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 335
          Top = 2
          Width = 39
          Height = 14
          Caption = 'PEDIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel17: TRLLabel
          Left = 602
          Top = 145
          Width = 24
          Height = 11
          Caption = 'V.IPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 371
          Top = 145
          Width = 52
          Height = 11
          Alignment = taCenter
          Caption = 'Dt.Entrega'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel40: TRLLabel
          Left = 517
          Top = 145
          Width = 30
          Height = 11
          Alignment = taCenter
          Caption = 'N'#186' OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLSubDetail2: TRLSubDetail
        Left = 0
        Top = 159
        Width = 742
        Height = 221
        DataSource = DMCadPedido.dsmItensImp
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 16
          BeforePrint = RLBand2BeforePrint
          object RLDBText22: TRLDBText
            Left = 497
            Top = 2
            Width = 18
            Height = 12
            Alignment = taRightJustify
            DataField = 'Qtd'
            DataSource = DMCadPedido.dsmItensImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText29: TRLDBText
            Left = 2
            Top = 2
            Width = 79
            Height = 12
            AutoSize = False
            DataField = 'REFERENCIA'
            DataSource = DMCadPedido.dsmItensImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object rlPreco: TRLLabel
            Left = 632
            Top = 2
            Width = 54
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Pre'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object rlVlrTotal: TRLLabel
            Left = 687
            Top = 2
            Width = 54
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Vlr.Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText49: TRLDBText
            Left = 428
            Top = 2
            Width = 30
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Unidade'
            DataSource = DMCadPedido.dsmItensImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLMemo2: TRLMemo
            Left = 82
            Top = 2
            Width = 271
            Height = 12
            Behavior = [beSiteExpander]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText8: TRLDBText
            Left = 584
            Top = 2
            Width = 46
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'Vlr_Ipi'
            DataSource = DMCadPedido.dsmItensImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText5: TRLDBText
            Left = 363
            Top = 2
            Width = 62
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtEntrega'
            DataSource = DMCadPedido.dsmItensImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw7: TRLDraw
            Left = 0
            Top = 0
            Width = 742
            Height = 1
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLDBText30: TRLDBText
            Left = 517
            Top = 2
            Width = 65
            Height = 12
            DataField = 'NumOS'
            DataSource = DMCadPedido.dsmItensImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 169
          Width = 742
          Height = 17
          BandType = btSummary
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          BeforePrint = RLBand4BeforePrint
          object RLDraw6: TRLDraw
            Left = 0
            Top = 0
            Width = 742
            Height = 2
            HelpContext = 2
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLLabel45: TRLLabel
            Left = 510
            Top = 1
            Width = 130
            Height = 14
            Caption = 'Valor Total de Pedidos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText34: TRLDBText
            Left = 672
            Top = 1
            Width = 68
            Height = 14
            Alignment = taRightJustify
            DataField = 'VLR_TOTAL'
            DataSource = DMCadPedido.dsPedidoImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText10: TRLDBText
            Left = 418
            Top = 3
            Width = 39
            Height = 11
            DataField = 'VLR_IPI'
            DataSource = DMCadPedido.dsPedidoImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel22: TRLLabel
            Left = 381
            Top = 3
            Width = 34
            Height = 11
            Caption = 'Vlr.IPI:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel41: TRLLabel
            Left = 6
            Top = 3
            Width = 64
            Height = 11
            Caption = 'Vlr.Produtos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText32: TRLDBText
            Left = 71
            Top = 3
            Width = 59
            Height = 11
            DataField = 'VLR_ITENS2'
            DataSource = DMCadPedido.dsPedidoImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel42: TRLLabel
            Left = 206
            Top = 3
            Width = 65
            Height = 11
            Caption = 'Vlr.Desconto:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText33: TRLDBText
            Left = 273
            Top = 3
            Width = 79
            Height = 11
            DataField = 'VLR_DESCONTO'
            DataSource = DMCadPedido.dsPedidoImp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLSubDetail3: TRLSubDetail
          Left = 0
          Top = 16
          Width = 742
          Height = 64
          DataSource = DMCadPedido.dsmItensImp_Tam
          object RLDetailGrid1: TRLDetailGrid
            Left = 0
            Top = 0
            Width = 742
            Height = 33
            ColCount = 10
            AfterPrint = RLDetailGrid1AfterPrint
            object RLLabel14: TRLLabel
              Left = 4
              Top = 1
              Width = 12
              Height = 14
              Caption = 'T:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLLabel16: TRLLabel
              Left = 2
              Top = 16
              Width = 14
              Height = 14
              Caption = 'Q:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDraw1: TRLDraw
              Left = 19
              Top = 1
              Width = 55
              Height = 15
            end
            object RLDBText16: TRLDBText
              Left = 23
              Top = 3
              Width = 46
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'Tamanho'
              DataSource = DMCadPedido.dsmItensImp_Tam
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDraw4: TRLDraw
              Left = 19
              Top = 15
              Width = 55
              Height = 15
            end
            object RLDBText18: TRLDBText
              Left = 23
              Top = 17
              Width = 46
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'Qtd'
              DataSource = DMCadPedido.dsmItensImp_Tam
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
        end
        object RLSubDetail4: TRLSubDetail
          Left = 0
          Top = 80
          Width = 742
          Height = 89
          DataSource = DMCadPedido.dsmItensImp_Mat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          object RLBand6: TRLBand
            Left = 0
            Top = 0
            Width = 742
            Height = 18
            BandType = btHeader
            BeforePrint = RLBand6BeforePrint
            object RLLabel26: TRLLabel
              Left = 56
              Top = 3
              Width = 32
              Height = 12
              Caption = 'C'#243'digo'
            end
            object RLLabel27: TRLLabel
              Left = 99
              Top = 3
              Width = 35
              Height = 12
              Caption = 'Material'
            end
            object RLLabel29: TRLLabel
              Left = 471
              Top = 3
              Width = 52
              Height = 12
              Caption = 'Cons.M'#233'dio'
            end
            object RLLabel31: TRLLabel
              Left = 635
              Top = 3
              Width = 49
              Height = 12
              Caption = 'Vlr.Unit'#225'rio'
            end
            object RLLabel33: TRLLabel
              Left = 704
              Top = 3
              Width = 37
              Height = 12
              Caption = 'Vlr.Total'
            end
            object RLDraw5: TRLDraw
              Left = 56
              Top = 15
              Width = 684
              Height = 2
              DrawKind = dkLine
            end
            object RLLabel38: TRLLabel
              Left = 535
              Top = 2
              Width = 21
              Height = 12
              Caption = 'Qtd.'
            end
            object RLLabel39: TRLLabel
              Left = 576
              Top = 2
              Width = 51
              Height = 12
              Caption = 'Cons. Total'
            end
          end
          object RLBand8: TRLBand
            Left = 0
            Top = 18
            Width = 742
            Height = 15
            BeforePrint = RLBand8BeforePrint
            object RLDBText19: TRLDBText
              Left = 57
              Top = 2
              Width = 38
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'ID_Material'
              DataSource = DMCadPedido.dsmItensImp_Mat
            end
            object RLDBText21: TRLDBText
              Left = 96
              Top = 2
              Width = 372
              Height = 12
              AutoSize = False
              DataField = 'Nome_Material'
              DataSource = DMCadPedido.dsmItensImp_Mat
            end
            object RLDBText23: TRLDBText
              Left = 469
              Top = 2
              Width = 55
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Qtd_Consumo'
              DataSource = DMCadPedido.dsmItensImp_Mat
            end
            object RLDBText24: TRLDBText
              Left = 631
              Top = 2
              Width = 51
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Vlr_Unitario'
              DataSource = DMCadPedido.dsmItensImp_Mat
            end
            object RLDBText25: TRLDBText
              Left = 684
              Top = 2
              Width = 56
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Vlr_Total'
              DataSource = DMCadPedido.dsmItensImp_Mat
            end
            object RLDBText26: TRLDBText
              Left = 527
              Top = 1
              Width = 38
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'Qtd_Peca'
              DataSource = DMCadPedido.dsmItensImp_Mat
            end
            object RLDBText27: TRLDBText
              Left = 568
              Top = 1
              Width = 61
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Qtd_Consumo_Total'
              DataSource = DMCadPedido.dsmItensImp_Mat
            end
          end
          object RLBand9: TRLBand
            Left = 0
            Top = 33
            Width = 742
            Height = 20
            BandType = btFooter
            BeforePrint = RLBand9BeforePrint
            object RLLabel36: TRLLabel
              Left = 44
              Top = 4
              Width = 25
              Height = 12
              Caption = 'OBS:'
            end
            object RLMemo3: TRLMemo
              Left = 72
              Top = 4
              Width = 657
              Height = 12
              Behavior = [beSiteExpander]
            end
            object RLDraw9: TRLDraw
              Left = 72
              Top = 1
              Width = 668
              Height = 2
              DrawKind = dkLine
            end
          end
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 380
        Width = 742
        Height = 36
        BandType = btSummary
        IntegralHeight = False
        BeforePrint = RLBand7BeforePrint
        object RLDraw3: TRLDraw
          Left = 0
          Top = 0
          Width = 742
          Height = 36
          Align = faClient
        end
        object RLLabel46: TRLLabel
          Left = 7
          Top = 2
          Width = 79
          Height = 14
          Caption = 'Observa'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLMemo1: TRLMemo
          Left = 7
          Top = 17
          Width = 705
          Height = 16
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          IntegralHeight = True
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 416
        Width = 742
        Height = 36
        BandType = btSummary
      end
    end
    object RLBand5: TRLBand
      Left = 26
      Top = 649
      Width = 742
      Height = 17
      BandType = btFooter
      object RLLabel2: TRLLabel
        Left = 501
        Top = 4
        Width = 36
        Height = 10
        Caption = 'Imp. Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 629
        Top = 4
        Width = 21
        Height = 10
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 550
        Top = 2
        Width = 62
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 659
        Top = 3
        Width = 62
        Height = 11
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Info = itHour
        ParentFont = False
      end
    end
  end
end
