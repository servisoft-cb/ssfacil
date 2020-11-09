object dmDatabase: TdmDatabase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 376
  Top = 187
  Height = 480
  Width = 515
  object scoDados: TSQLConnection
    ConnectionName = 'SSFacil'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    KeepConnection = False
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=D:\Fontes\$Servisoft\Bases\SSFacil\SSFacil.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 59
    Top = 20
  end
  object Decoder64: TIdDecoderMIME
    FillChar = '='
    Left = 104
    Top = 24
  end
  object sdsExec: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scoDados
    Left = 106
    Top = 80
  end
  object scoAtualiza: TSQLConnection
    ConnectionName = 'FDBUpdate'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    KeepConnection = False
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=firebird09-farm51.kinghost.net:/firebird/servisoft1.gdb'
      'RoleName=RoleName'
      'User_Name=servisoft1'
      'Password=campobom'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 41
    Top = 79
  end
  object sdsVersao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, SCRIPT '#13#10'FROM VERSAO'#13#10'WHERE PROGRAMA_ID = 1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scoAtualiza
    Left = 104
    Top = 128
    object sdsVersaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsVersaoSCRIPT: TBlobField
      FieldName = 'SCRIPT'
      Size = 1
    end
  end
  object dspVersao: TDataSetProvider
    DataSet = sdsVersao
    Left = 144
    Top = 128
  end
  object cdsVersao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspVersao'
    Left = 184
    Top = 128
    object cdsVersaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsVersaoSCRIPT: TBlobField
      FieldName = 'SCRIPT'
      Size = 1
    end
  end
  object sqVersaoAtual: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT VERSAO_BANCO FROM PARAMETROS')
    SQLConnection = scoDados
    Left = 41
    Top = 128
    object sqVersaoAtualVERSAO_BANCO: TIntegerField
      FieldName = 'VERSAO_BANCO'
    end
  end
  object scoLiberacao: TSQLConnection
    ConnectionName = 'LIBERACAO'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    KeepConnection = False
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=firebird.servisoft.kinghost.net:/firebird/servisoft.gdb'
      'RoleName=RoleName'
      'User_Name=SERVISOFT'
      'Password=35977456'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 40
    Top = 200
  end
  object sqEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT ID, CNPJ_CPF, LIBERADO_ATE, ULTIMO_ACESSO, FONE, DDD1, CI' +
        'DADE, NOME  FROM FILIAL WHERE PRINCIPAL = '#39'S'#39)
    SQLConnection = scoDados
    Left = 40
    Top = 248
    object sqEmpresaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object sqEmpresaLIBERADO_ATE: TStringField
      FieldName = 'LIBERADO_ATE'
      Size = 18
    end
    object sqEmpresaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sqEmpresaULTIMO_ACESSO: TStringField
      FieldName = 'ULTIMO_ACESSO'
      Size = 18
    end
    object sqEmpresaDDD1: TIntegerField
      FieldName = 'DDD1'
    end
    object sqEmpresaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object sqEmpresaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object sqEmpresaFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
  end
  object sqDataLiberacao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'D1'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DT_LIBERADO, CODVENDEDOR , CODVENDEDOR_COB'
      'FROM PESSOA WHERE DOCUMENTO = :D1 AND STATUS = '#39'1'#39)
    SQLConnection = scoLiberacao
    Left = 76
    Top = 249
    object sqDataLiberacaoDT_LIBERADO: TStringField
      FieldName = 'DT_LIBERADO'
      Size = 25
    end
    object sqDataLiberacaoCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object sqDataLiberacaoCODVENDEDOR_COB: TIntegerField
      FieldName = 'CODVENDEDOR_COB'
    end
  end
  object Encoder64: TIdEncoderMIME
    FillChar = '='
    Left = 208
    Top = 32
  end
  object sdsExecRemoto: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scoLiberacao
    Left = 136
    Top = 248
  end
  object sdsModuloRemoto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PM.*, M.NOME MODULO_NOME'#13#10'FROM PESSOA_MODULOS PM'#13#10'INNER J' +
      'OIN MODULO M ON (PM.MODULO_ID = M.ID)'#13#10'WHERE PM.ID = :P1'#13#10'AND PM' +
      '.LIBERADO = '#39'N'#39' '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P1'
        ParamType = ptInput
      end>
    SQLConnection = scoLiberacao
    Left = 248
    Top = 248
    object sdsModuloRemotoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsModuloRemotoMODULO_ID: TIntegerField
      FieldName = 'MODULO_ID'
    end
    object sdsModuloRemotoLIBERADO: TStringField
      FieldName = 'LIBERADO'
      FixedChar = True
      Size = 1
    end
    object sdsModuloRemotoMODULO_NOME: TStringField
      FieldName = 'MODULO_NOME'
      ProviderFlags = []
      Size = 40
    end
  end
  object dspModuloRemoto: TDataSetProvider
    DataSet = sdsModuloRemoto
    Left = 280
    Top = 248
  end
  object cdsModuloRemoto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModuloRemoto'
    Left = 312
    Top = 248
    object cdsModuloRemotoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsModuloRemotoMODULO_ID: TIntegerField
      FieldName = 'MODULO_ID'
    end
    object cdsModuloRemotoLIBERADO: TStringField
      FieldName = 'LIBERADO'
      FixedChar = True
      Size = 1
    end
    object cdsModuloRemotoMODULO_NOME: TStringField
      FieldName = 'MODULO_NOME'
      ProviderFlags = []
      Size = 40
    end
  end
  object qParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ID_RESP_SUPORTE'
      'FROM PARAMETROS')
    SQLConnection = scoDados
    Left = 40
    Top = 304
    object qParametrosID_RESP_SUPORTE: TIntegerField
      FieldName = 'ID_RESP_SUPORTE'
    end
  end
  object sdsLogPessoa: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM LOG_PESSOA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scoLiberacao
    Left = 248
    Top = 312
    object sdsLogPessoaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Required = True
      Size = 18
    end
    object sdsLogPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsLogPessoaFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object sdsLogPessoaDTPRIMEIROACESSO: TDateField
      FieldName = 'DTPRIMEIROACESSO'
    end
    object sdsLogPessoaDTULTIMOACESSO: TDateField
      FieldName = 'DTULTIMOACESSO'
    end
    object sdsLogPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
  end
  object dspLogPessoa: TDataSetProvider
    DataSet = sdsLogPessoa
    Left = 280
    Top = 312
  end
  object cdsLogPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLogPessoa'
    Left = 312
    Top = 312
    object cdsLogPessoaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Required = True
      Size = 18
    end
    object cdsLogPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsLogPessoaFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object cdsLogPessoaDTPRIMEIROACESSO: TDateField
      FieldName = 'DTPRIMEIROACESSO'
    end
    object cdsLogPessoaDTULTIMOACESSO: TDateField
      FieldName = 'DTULTIMOACESSO'
    end
    object cdsLogPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
  end
  object scoServidor: TSQLConnection
    ConnectionName = 'SSFacil_Servidor'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    KeepConnection = False
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      
        'Database=localhost:D:\Fontes\$Servisoft\Bases\SSFacil\SSFACIL.FD' +
        'B'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 403
    Top = 84
  end
  object qParametros_Geral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT ID_RESP_COBRANCA, USA_NFCE_LOCAL'
      'FROM PARAMETROS_GERAL')
    SQLConnection = scoDados
    Left = 98
    Top = 307
    object qParametros_GeralID_RESP_COBRANCA: TIntegerField
      FieldName = 'ID_RESP_COBRANCA'
    end
    object qParametros_GeralUSA_NFCE_LOCAL: TStringField
      FieldName = 'USA_NFCE_LOCAL'
      FixedChar = True
      Size = 1
    end
  end
end
