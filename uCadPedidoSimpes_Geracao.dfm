object frmCadPedidoSimples_Geracao: TfrmCadPedidoSimples_Geracao
  Left = 116
  Top = 164
  Width = 484
  Height = 262
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'frmCadPedidoSimples_Geracao'
  Color = clBtnFace
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
    Left = 72
    Top = 38
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Regi'#227'o:'
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 115
    Top = 28
    Width = 272
    Height = 21
    DropDownCount = 15
    LookupField = 'ID'
    LookupDisplay = 'NOME'
    LookupSource = DMCadPedido.dsRegiao_Venda
    TabOrder = 0
    OnEnter = RxDBLookupCombo1Enter
  end
  object btnGerar: TNxButton
    Left = 158
    Top = 109
    Width = 153
    Height = 30
    Caption = 'Gerar Pedidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Glyph.Data = {
      7A080000424D7A08000000000000360000002800000017000000170000000100
      2000000000004408000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9BED700B786
      B500A064A10095579500965B9500AB84AA00D5C8D400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B571AA008011710083137600902787009B3B
      9B00A451A600AA5DAE00A25DA8009C68A4005B215C008E6B8E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEBAD900880C72008E177D009B319300A54CA400A550A400A44DA200A34B
      A200A24BA100A448A200A247A100C37CC600AC84B600480E4800D1C6D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CA90C1008602
      7100952489009E389800A249A100A147A000A0449D00A1469F00A1469F00A146
      9F00A1469F00A1459F009E409B00A747A000CB91CF005D2A6100B39CB200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8AED20086007200962489009830
      9200A1449C00A0419A009F419900AA55A5009E3D98009F419B00A0419900A041
      9A00A0419B00A0419B009F3F9A009E399600C57EC6005A285F00CFC1CF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008A06770094218400912789009E3C95009D3E
      94009D3D94009B369100D8BECF009D3D94009E3B94009D3D94009D3D94009D3D
      94009D3D94009D3D94009C3B9300972D8D00C88ECC00480E4A00FFFFFF00FFFF
      FF00FFFFFF00B15FA70090197D008B278200942E89009E3791009D3691009D36
      91009C3490009A308D00FFFFFF00922085009D3591009D3691009D3590009D36
      91009D3591009F369200942C890094338B00A97FB4008F6A8D00FFFFFF00FFFF
      FF008D0D7B0088277F0081277F009A318C009B318D009B318D009A318D009B31
      8D0096258800C896C200FFFFFF00942185009B318D009B318D009B318D009B31
      8D009B318D009D318D007D1E7900AF69B2005C225F00FFFFFF00D8B2D3008D18
      7E00772178007B237B009B2A8A00962988009629880096298800962988009628
      88008F188000FDFFFE00A23F9500922184009629880096298800962988009629
      8800992A8A0080237D00741B7600995F9F00D8CBD800C07AB600821F7B005E19
      5F00731C6E00991F8300941D8000941D8000941D8000941E8000931E81008E13
      7A00BF7BB200F5FDF4008F127B00941F82009621830095218300952183009821
      85007C1E73005C155C008C429200AF89AF00B35DAB00701B6C00390D3E007420
      6A00A13994009F409800A1439B00A1429A009F3C9600972B87008E1577008604
      6D00F1F2EC00D8BECF008B08700094217D0094227D0094227D0098238000781C
      6A003D0C3F007B357D009E659E00B76CB900701B6F00782173009A3F9700A751
      A700A44EA400A44EA400A34EA4009E419D00FFFFFF00FFFFFF00FEFFFF00EFEF
      E900F4FFF000BD81AA0090157100962178009521770099217900761863004D13
      4F00882886009B5F9C00C38AC8007E227C008A257D00963A9000A54FA500A44D
      A300A34CA200A44CA2009E429E00C997C900FFFFFF00FEFCFE00C693C700CA99
      C900C9A1C8009C378D009B368D009E398F00A04297009B3D95008C2780008C21
      8200A670A800D8B4DE00813283008F237F0095348C00A54FA500A34CA200A34C
      A200A34CA200A34BA2009D409C00FFFFFF00FFFFFF00B873B6009B3B9A009F44
      9E00A44EA400A44FA500A44FA400A650A60097388F008E267F00891D7E00BD90
      BB00ECDDF300975B9F00861D7700942A8400A755AA00A44FA500A44FA500A44F
      A500A550A5009E429F00D6B0D600FFFFFF00FDFEFD009C3F9D00A44EA500A54F
      A500A54FA500A44FA500A654AA00942D87009127820083127700E0CADE00FFFF
      FF00C899D9006D17640096208300A855AD00A95AB100A959B000A959B000A959
      B100A857AF00A859B000FFFFFF00FFFFFF00D0A5D400A34EAA00A959B100A959
      B000AA5AB100A959B000932080009522850083167400FFFFFF00FFFFFF00E7D0
      F6008C5B95008C167800A03E9C00B16EC200AE67BC00AE67BC00AE67BC00AE67
      BC00A658B500E5D1EA00FFFFFF00FFFFFF00AC64BC00AE65BB00AE67BC00B16D
      C200A0429F00962286008C147A00BC7FB300FFFFFF00FFFFFF00FFFFFF00DCBC
      F100632263009A228400B472C900B778CE00B576CB00B576CB00B576CB00B472
      CA00FFFFFF00F9F3FA00F8F1F900FFFFFF00B26FC900B678CD00B575CB009627
      8300931F82008B127800FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F0FC00D0B0
      E3005E145900A1328F00C291E700BD8AE100BC88DF00BD88DF00BC88DF00BA84
      DD00B57AD900B67ADA00B781DB00BC8AE000C192E9009F3A9200962483008701
      7100E6CDE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4EBFC00CFB0
      E3006421600095308A00CDA2F700CAA1F400C599EF00C598EE00C598EE00C598
      EE00C599EE00C8A1F300CBA3F400A0429900921E7D0086007200D5ACD000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCBD
      F100895893006B1E6300B785C500E3CDFE00E3CDFE00E1CCFD00E3CFFE00E4D0
      FF00C291D30091308300891176008B0D7B00E5CAE100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9D4
      F500CA99DA00915097007A307B008F4990009951990094439100821877008108
      71008E127D00BF7AB600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1E4F500DCBBE100C792CA00B86FB900B76AB000C78DC000E4C8E000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F2F2F200FFFFFF00FFFFFF00F2F2F200}
    GlyphSpacing = 1
    ParentFont = False
    TabOrder = 1
    Transparent = True
    OnClick = btnGerarClick
  end
end
