object frmConsOrcamento: TfrmConsOrcamento
  Left = 171
  Top = 42
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Consulta Or'#231'amentos'
  ClientHeight = 628
  ClientWidth = 1102
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1102
    Height = 135
    Align = alTop
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 0
    object Label2: TLabel
      Left = 263
      Top = 10
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
    end
    object Label3: TLabel
      Left = 251
      Top = 31
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
    end
    object Label4: TLabel
      Left = 189
      Top = 52
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia/Produto:'
    end
    object Label5: TLabel
      Left = 216
      Top = 73
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Emiss'#227'o Ini:'
    end
    object Label6: TLabel
      Left = 389
      Top = 73
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
    end
    object Label9: TLabel
      Left = 237
      Top = 95
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor:'
    end
    object Label12: TLabel
      Left = 664
      Top = 14
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Or'#231'amento:'
    end
    object Label35: TLabel
      Left = 201
      Top = 115
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor Interno:'
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 287
      Top = 2
      Width = 359
      Height = 21
      DropDownCount = 8
      Ctl3D = True
      LookupField = 'ID'
      LookupDisplay = 'NOME_INTERNO'
      LookupSource = DMConsPedido.dsFilial
      ParentCtl3D = False
      TabOrder = 0
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 287
      Top = 23
      Width = 359
      Height = 21
      DropDownCount = 8
      Ctl3D = True
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = DMConsPedido.dsCliente
      ParentCtl3D = False
      TabOrder = 1
      OnEnter = RxDBLookupCombo2Enter
      OnKeyDown = RxDBLookupCombo2KeyDown
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 407
      Top = 44
      Width = 239
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMConsPedido.dsProduto
      TabOrder = 3
      OnChange = RxDBLookupCombo3Change
      OnEnter = RxDBLookupCombo3Enter
      OnKeyDown = RxDBLookupCombo3KeyDown
    end
    object RxDBLookupCombo4: TRxDBLookupCombo
      Left = 287
      Top = 44
      Width = 121
      Height = 21
      DropDownCount = 8
      Ctl3D = True
      LookupField = 'ID'
      LookupDisplay = 'REFERENCIA'
      LookupSource = DMConsPedido.dsProduto
      ParentCtl3D = False
      TabOrder = 2
      OnChange = RxDBLookupCombo4Change
      OnEnter = RxDBLookupCombo4Enter
      OnKeyDown = RxDBLookupCombo4KeyDown
    end
    object DateEdit1: TDateEdit
      Left = 287
      Top = 65
      Width = 100
      Height = 21
      Ctl3D = True
      NumGlyphs = 2
      ParentCtl3D = False
      StartOfWeek = Sun
      TabOrder = 4
    end
    object DateEdit2: TDateEdit
      Left = 415
      Top = 65
      Width = 100
      Height = 21
      Ctl3D = True
      NumGlyphs = 2
      ParentCtl3D = False
      StartOfWeek = Sun
      TabOrder = 5
    end
    object RxDBLookupCombo5: TRxDBLookupCombo
      Left = 287
      Top = 87
      Width = 228
      Height = 21
      DropDownCount = 8
      Ctl3D = True
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = DMConsPedido.dsVendedor
      ParentCtl3D = False
      TabOrder = 6
      OnEnter = RxDBLookupCombo5Enter
    end
    object RadioGroup2: TRadioGroup
      Left = 0
      Top = 0
      Width = 103
      Height = 135
      Align = alLeft
      Caption = ' Op'#231#227'o '
      Ctl3D = True
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'Pendente'
        'Aprovado'
        'N'#227'o Aprovado')
      ParentCtl3D = False
      TabOrder = 8
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 735
      Top = 6
      Width = 86
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 7
    end
    object RxDBLookupCombo6: TRxDBLookupCombo
      Left = 287
      Top = 108
      Width = 228
      Height = 21
      DropDownCount = 8
      Ctl3D = True
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = DMConsPedido.dsVendedor
      ParentCtl3D = False
      TabOrder = 9
      OnEnter = RxDBLookupCombo5Enter
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 135
    Width = 1102
    Height = 37
    Align = alTop
    Color = clSilver
    TabOrder = 1
    object Label1: TLabel
      Left = 571
      Top = 15
      Width = 46
      Height = 13
      Caption = 'Aprovado'
    end
    object Shape1: TShape
      Left = 544
      Top = 14
      Width = 24
      Height = 14
      Brush.Color = clGreen
    end
    object Label7: TLabel
      Left = 483
      Top = 15
      Width = 46
      Height = 13
      Caption = 'Pendente'
    end
    object Shape2: TShape
      Left = 456
      Top = 14
      Width = 24
      Height = 14
      Brush.Color = clYellow
    end
    object Label8: TLabel
      Left = 659
      Top = 15
      Width = 69
      Height = 13
      Caption = 'N'#227'o Aprovado'
    end
    object Shape3: TShape
      Left = 632
      Top = 14
      Width = 24
      Height = 14
      Brush.Color = clRed
    end
    object Label10: TLabel
      Left = 815
      Top = 15
      Width = 114
      Height = 14
      Caption = 'F4 Cons. Obs Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Clma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnConsultar: TNxButton
      Left = 4
      Top = 4
      Width = 170
      Height = 30
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F2F0F5F2F0FCFDFDFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B778D2D52869876
        72B0A3A1FCFDFE000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7780
        0055B812A5FA5E90BDBBA29FFAF5F4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF5C6377004EAD29BEFFA9ECFFA3F7FF3A89BFF6F5F6000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF75737F0051AC17B1FFA4E7FDD5FFFF12A6E45E90B5FFFCFC00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFD6C6C7D0057BB25BAFFA5E7FEC7FFFF099DDF6A8A
        A8FFFFFDFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54657D0057B120B5FFA1E5FECFFFFF
        109CDD4D7EA5FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFCFEFEDADDDDDAD9D9CFCFCFEDEFEFFFFFFFFFFFFFFFFFFF00024A21BCFFA5
        EAFFCAFFFF11A7E86587A9FFFFFCFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFDDE0E0958E8D7A63657D60628467678065658D77799C9393D3D1D1ADAA
        A749343776B3E0B4FFFF19A4DF5A84A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFD2D8D84C3334846269967570A39388A99E9AAB9E99AE9890
        B69DA4A28E8F867070E7D0CC806B6E005499467EA7FFFFFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFC2C2C2533638A27B799D80649A9A7C94988895
        97979498949198849E9478C4AFA8C8B5B7AFA1A1B6B3B1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FBFBFB816D6E8A66679C6F4A987D
        5A978F7499978499998D99998C989783948769987854C9B1A9C1B4B6DED8D8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000E0DCDB74575C
        98634797653998765499876899927799977F99967F99907799826295704B9B64
        3AD4CFD8A39C9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000887F83865B54984D1A945C319969439A77559A7F5F998365998364997F5F
        99735095673F81400DC9A391B2ACB0ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000BDAFB38C57459140079352258D562D875732885D3A8D
        6744946E4B92694587532D91572CBB753CCA906BADAAB0CECDCDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6B7BB8F56428528008B3D08A766
        34CA9765D0A272BC8D5F9E6940A06B3ECB9867EFB984FFCB8ACD8A5FBBB8C0DD
        DBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000B8AEB1906152
        AD5529ECB177FFD29AFED7A5FCDEAEFEE7B6FFEABBFFE8B8FDDCABF7D09CFCCB
        90CF9675AEAAB2CBCBCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00009B96988F6B68EAA769FFD19BF4CD9BF4D8AAF4E0B4F4E4BBF4E5BDF4E4BB
        F4DDB1F6DBABF8C98AC6A399A8A6A9F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000D2D0D07E6B73B47F67FED295F6DBADF4E4BAF5E5C2F5
        E7C8F5E9CAF4E7C8F5E8C3F9E9B9D29E73DDDEE8A6A2A1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FCFEFE9B8F91B6A0A5CD9972FDE8
        B2F6EDC7F5E9CCF4EDD4F5EED9F5EED6F9EFCDE4C299F3E4DD867F80D7D8D8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFD4D6D6
        574849C3AEB2CDA88FF0D9B4F6ECD0F6F3E3F6F1E5F4E8D3E2C2ABE1D0CF9E95
        96C6C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFD3D5D59F969797888CC0A6A1D1B6ACD5BEB2D7C0B7D5BDB8
        C1B4B8ADA7AAC0BFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFCFDFDD2D0D0A3A0A2CEC5C7E1
        D7D8DCD3D4A09C9EE7E5E5F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 0
      Transparent = True
      OnClick = btnConsultarClick
    end
    object btnImprimir: TNxButton
      Left = 172
      Top = 4
      Width = 170
      Height = 30
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        1800000000007806000000000000000000000000000000000000FCFFFFFFFEFE
        FCFFFCF9FEFEF9FCFDFFFCFFF3FAFBF3FAFAF3FAFAF2FAFAF3FAFAF4F9FAF4F9
        FAF2FAFAF2FAFAF4F9FAF5FAFAFDFBFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FEFFFEFEFEFEFBFFFDFCFDFEFFFFFFD5EAF0489FC55DB4D15EB4D157B3D2
        5BB3D05BB4D458B2D359B3D25AB3D45DB1D352A8C3AFDDEAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FEFFFDFEFDFEFCFFFCFFFDFEFFFFFFB5E2EA4AB8D0A1
        FAFC9EF1F597F1F69DF1F59AF1F699F1F69EF1F598F1F4A0F6FB58C7D98DCFE8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FAFFFEFEFDFEFCFFFDFFFEFEFFFF
        FEB8E1EC53C0D899E8E97EBCC083BECA8CBEC189BCC582BCC785BEC282BAB899
        E0E667D1E08CCEE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FCFEFEFFFDFE
        FFFFFFFFFFFFFFFFFFC1E6F147BFDA84E1E860ADB05FAFB862B1B45AB1B559B1
        B659B1B54EA8AE70D9E25ED0E28FCFE9FFFFFFFFFFFFFFFFFFFFFFFFFDFFFF00
        0000FAFEFEFFFFFFDCDAD9D5D2D2E0D9D6AABFCD41C3DD8AF5FD8BDEE591E4EA
        92DFEA8FE0E78CE1E697DFEA8FDDEA8AF3FB4FD4E48FC6D5E1D8D5D5D3D2DBD9
        D9FDFDFDFDFFFF000000FFFFFFB5B1B371635E806E6B503A2F0E3B4C69E7FF6E
        E2F660C9D361CCD95FC7D65FC8D661C8D761CBD55DC7CD6BDFF069EEFF114764
        45322C776C666E6460AEAAA9FFFFFF000000FDFDFC827A78CFBFB9E9DDD66F5B
        52324448396F7A4373754974744574734674754B73764B727545757544747549
        6F75426D793646505F5049DDCDCAD1C1BE827B78FCFCFB000000FCFCFB87817D
        CCC0BADEDCD4D2C2BCAD9A9CAB9697AF9895AF9794AC9794A79994AC9693AD99
        8FAD9893A79897A89A92AC9B90AE9E98C1B7B2E8DBD9CFC0BD897F7CFBFBFA00
        0000FCFCFB8B807ED3C7C3E6E6E2EAE4E4F2ECECF6EEEBF3EEEEF7EEEEF7EEEF
        F0EFEEF5EFF0F4EFEEF7EEF0F5EDF2EFF1EFF1EFEEF2ECEEEBE6EAEAE4E3D3C8
        C4887F7DFCFBFB000000FCFCFC89817FDBCECEF7F2F2F7F0F4EBEAE7E4E3DEDF
        E3E1E4E1E2E3E0DFDDE1DFE2E0DFE1E0E0E1E0DEE5E0DDE4DDDCE0DDDDECE8E7
        F2F2F3F5F3F1DAD2D188827DFBFCFB000000FCFDFC8B8282DFD3D4FFFDFFE8EC
        EB7D797665605E68626165605F635E5D635D5B625C5C605A595F59595C58575B
        5655585453676362E9E8EAFFFDFDE1D4D189837EFAFCFC000000FCFDFD8B8482
        DED6D5FFFFFFC2C4C3514B4A322F2D3735353835353735353734343735353633
        333836353835343836353431304C4746AFB0B0FFFFFFE4D4DB8C8485FCFCFC00
        0000FCFCFD8F8986DCD5D1FFFFFFC6C5C4554F4D2F2E2D383838383838373838
        37383838373837393737383737393738373733302F4C4747B7B1B2FFFFFFDED6
        D0898884FCFBFD000000FBFCFC928C89D4CAC5DAD4D0BDBAB8605C5A2C2D2D25
        28282B2E2E313434333737343737363838363737353838363838343131514C4C
        ADA1AE7F70C2CEC2CA938B8BFAFBFC000000FFFFFF999490B7A9A2BEAFADAAA0
        A084807FA6A6A58182825C5C5C46474739383835363635333332323231333332
        32322F2D2D534C4FA1A19760AB80BAB8AA9A9290FCFFFF000000FFFFFFC6C1BE
        94817DC4AFACA39A98868784C9CACAB9BABBBABBBCB4B5B5A9AAAB9D9E9F9093
        938A87888482827A7B7C7F7F7E6D6669918D8195A67B847F79C1BEBFFFFFFF00
        0000FFFFFEFEFFFFB2A9A99F9494989895796C6EA69694A49593A1918EA0908C
        9B8D899A8C899889879987849686809882808C7C7C6359588E8B8BA4999EAEA9
        ACFFFFFFFFFFFF000000FEFCFEFCFEFFFFFFFFFFFFFFFFFFFF98AFC059919F6A
        9FA5689CA2689CA165989D679BA065989D5E999A56999D5E959F498295A2ABB4
        FFFFFFFFFFFFFFFFFFFEFFFFFFFFFF000000FDFDFDFCFDFEFEFEFCFAFDFDFFFF
        FF90D3EC50CEE37FF9FF7DF4FF7EF5FF7DF4FF7DF5FF7CF5FF7FF8FC7FF6FF89
        FAFF3DBBD5C8EAF1FFFFFFFDFDFDFEFFFFFDFEFEFFFFFF000000FBFEFEFAFDFE
        FDFFFCFCFDFEFFFFFF88C9E457CCDF8DFAFE89F4FC89F5FB89F6FB8AF6FC86F4
        FC8DF5FC8DF5FC91FBFF39B8D0B5E1EBFFFFFFFCFFFFFCFFFFFFFEFEFFFFFF00
        0000FDFEFFFFFDFFFEFFFDFFFDFEFFFFFFA7DBE44AA8C558B6D059B5CE5AB5CD
        59B5CD5AB5CF55B5CF5DB4D059B1D356B5D246A5C3D4ECF0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FEFDFFFDFDFFF7FFFFFCFEFBFFFDFEF8FEFEF1F9FAEF
        F8F9F0F8F9F0F8FAF0F8FAF0F8F9F0F8F9F0F8FAEEF8FAF0F7FAF3FAFAFCFDFF
        FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF000000}
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 1
      Transparent = True
      OnClick = btnImprimirClick
    end
  end
  object pnlTotal: TPanel
    Left = 0
    Top = 598
    Width = 1102
    Height = 30
    Align = alBottom
    Color = clSilver
    TabOrder = 2
    object Label19: TLabel
      Left = 130
      Top = 8
      Width = 56
      Height = 16
      Alignment = taRightJustify
      Caption = 'Vlr.Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 192
      Top = 8
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 424
      Top = 8
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 328
      Top = 8
      Width = 90
      Height = 16
      Alignment = taRightJustify
      Caption = 'Vlr. Pendente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 560
      Top = 8
      Width = 90
      Height = 16
      Alignment = taRightJustify
      Caption = 'Vlr. Aprovado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 656
      Top = 8
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 811
      Top = 8
      Width = 119
      Height = 16
      Alignment = taRightJustify
      Caption = 'Vlr. N'#227'o Aprovado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 936
      Top = 8
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnRecalcular: TNxButton
      Left = 6
      Top = 2
      Width = 107
      Height = 27
      Caption = 'Recalcular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
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
      GlyphSpacing = 5
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Transparent = True
      OnClick = btnRecalcularClick
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 172
    Width = 1102
    Height = 426
    ActivePage = TS_Item
    ActivePageDefault = TS_Item
    Align = alClient
    Color = 16755027
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    FlatColor = clSilver
    ParentColor = False
    ParentFont = False
    TabColors.Unselected = clGray
    TabIndex = 0
    TabOrder = 3
    TextColors.Unselected = 5197647
    FixedDimension = 19
    object TS_Item: TRzTabSheet
      Color = 16755027
      Caption = 'Consulta Por Item (Produto)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 0
        Width = 1098
        Height = 403
        Align = alClient
        Ctl3D = False
        DataSource = DMConsPedido.dsPedido_Item
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = SMDBGrid1KeyDown
        OnTitleClick = SMDBGrid1TitleClick
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
        ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 21
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'APROVADO_ORC'
            Title.Alignment = taCenter
            Title.Caption = 'Aprovado'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FILIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Filial'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_ORCAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Or'#231'amento'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Width = 33
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTEMISSAO'
            Title.Alignment = taCenter
            Title.Caption = 'Data Emiss'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'ID Produto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_PRODUTO_PED'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Produto'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_COMBINACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Cor / Combina'#231#227'o'
            Width = 225
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Unid.'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_UNITARIO'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Unit'#225'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_TOTAL'
            Title.Caption = 'Vlr. Total'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_GRUPO'
            Title.Alignment = taCenter
            Title.Caption = 'Grupo'
            Width = 175
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cliente'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_VENDEDOR'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Vendedor'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_VENDEDOR_INT'
            Title.Alignment = taCenter
            Title.Caption = 'Vendedor Interno'
            Width = 184
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'ID Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FILIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Filial'
            Width = 217
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_PECA'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pe'#231'a'
            Width = 54
            Visible = True
          end>
      end
    end
  end
end
