object fRelEstoqueMov_Acum: TfRelEstoqueMov_Acum
  Left = 51
  Top = 139
  Width = 1272
  Height = 528
  Caption = 'fRelEstoqueMov_Acum'
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
    Left = 32
    Top = 16
    Width = 1123
    Height = 794
    DataSource = DMConsEstoque.dsmAuxEst_Acum
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    PageSetup.Orientation = poLandscape
    ShowProgress = False
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 26
      Top = 26
      Width = 1071
      Height = 56
      BandType = btHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 192
        Top = 5
        Width = 380
        Height = 16
        Caption = 'Relat'#243'rio do Movimento do Estoque - Produtos Acumulados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 977
        Top = 2
        Width = 22
        Height = 12
        Caption = 'Pag:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 1003
        Top = 2
        Width = 32
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
      end
      object RLLabel22: TRLLabel
        Left = 957
        Top = 15
        Width = 42
        Height = 12
        Caption = 'Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 1003
        Top = 15
        Width = 64
        Height = 11
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 0
        Top = 28
        Width = 33
        Height = 12
        Caption = 'Op'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object rllbOpcao: TRLLabel
        Left = 35
        Top = 28
        Width = 33
        Height = 12
        Caption = 'Op'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 4
        Top = 42
        Width = 39
        Height = 10
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 54
        Width = 1071
        Height = 2
        Align = faBottom
        DrawKind = dkLine
      end
      object RLLabel9: TRLLabel
        Left = 91
        Top = 42
        Width = 28
        Height = 10
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel39: TRLLabel
        Left = 766
        Top = 42
        Width = 35
        Height = 10
        Caption = 'Qtd.Sa'#237'da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel51: TRLLabel
        Left = 936
        Top = 42
        Width = 42
        Height = 10
        Caption = 'Vlr. Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel52: TRLLabel
        Left = 1033
        Top = 42
        Width = 35
        Height = 10
        Caption = 'Vlr. Sa'#237'da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 664
        Top = 42
        Width = 44
        Height = 10
        Caption = 'Qtd. Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLMemo1: TRLMemo
        Left = 809
        Top = 24
        Width = 84
        Height = 28
        Alignment = taCenter
        Behavior = [beSiteExpander]
        Lines.Strings = (
          'Soma '
          '(Entrada - Sa'#237'da)')
      end
      object RLLabel5: TRLLabel
        Left = 571
        Top = 43
        Width = 45
        Height = 10
        Caption = 'Qtd. Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 82
      Width = 1071
      Height = 183
      DataSource = DMConsEstoque.dsmAuxEst_Acum
      object RLBand12: TRLBand
        Left = 0
        Top = 16
        Width = 1071
        Height = 29
        BandType = btSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BeforePrint = RLBand12BeforePrint
        object RLDraw8: TRLDraw
          Left = 0
          Top = 0
          Width = 1071
          Height = 2
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel3: TRLLabel
          Left = 802
          Top = 15
          Width = 100
          Height = 12
          Caption = 'Entrada - Sa'#237'da (Qtd):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel37: TRLLabel
          Left = 20
          Top = 16
          Width = 87
          Height = 11
          Alignment = taRightJustify
          Caption = 'Geral Qtd.Entrada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 108
          Top = 15
          Width = 129
          Height = 12
          AutoSize = False
          DataField = 'QTD_ENT'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          DisplayMask = '###,###,###,##0.0000##'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
        object RLLabel43: TRLLabel
          Left = 410
          Top = 15
          Width = 50
          Height = 12
          Caption = 'Qtd.Sa'#237'da:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult4: TRLDBResult
          Left = 461
          Top = 15
          Width = 122
          Height = 12
          AutoSize = False
          DataField = 'QTD_SAI'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          DisplayMask = '###,###,###,##0.0000##'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
        object RLLabel44: TRLLabel
          Left = 903
          Top = 15
          Width = 75
          Height = 12
          Caption = 'Entrada - Sa'#237'da:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel65: TRLLabel
          Left = 239
          Top = 16
          Width = 34
          Height = 11
          Caption = 'Vlr.R$:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel67: TRLLabel
          Left = 602
          Top = 16
          Width = 37
          Height = 11
          Caption = 'Vlr. R$:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult2: TRLDBResult
          Left = 275
          Top = 15
          Width = 129
          Height = 12
          AutoSize = False
          DataField = 'VLR_ENTRADA'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
        object RLDBResult3: TRLDBResult
          Left = 642
          Top = 15
          Width = 129
          Height = 12
          AutoSize = False
          DataField = 'VLR_SAIDA'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 44
          Top = 3
          Width = 64
          Height = 11
          Alignment = taRightJustify
          Caption = 'Qtd. Anterior:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult5: TRLDBResult
          Left = 109
          Top = 2
          Width = 129
          Height = 12
          AutoSize = False
          DataField = 'Qtd_Ant'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          DisplayMask = '###,###,###,##0.0000##'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 1071
        Height = 16
        BeforePrint = RLBand2BeforePrint
        object RLDBText2: TRLDBText
          Left = 2
          Top = 2
          Width = 86
          Height = 10
          AutoSize = False
          DataField = 'REFERENCIA'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 14
          Width = 1071
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLDBText4: TRLDBText
          Left = 89
          Top = 2
          Width = 434
          Height = 10
          AutoSize = False
          DataField = 'NOMEPRODUTO'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 618
          Top = 2
          Width = 92
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QTD_ENT'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText16: TRLDBText
          Left = 710
          Top = 2
          Width = 92
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QTD_SAI'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText17: TRLDBText
          Left = 802
          Top = 2
          Width = 92
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'SALDO'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText19: TRLDBText
          Left = 894
          Top = 2
          Width = 87
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VLR_ENTRADA'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText20: TRLDBText
          Left = 981
          Top = 2
          Width = 88
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VLR_SAIDA'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 525
          Top = 2
          Width = 92
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Qtd_Ant'
          DataSource = DMConsEstoque.dsmAuxEst_Acum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
end
