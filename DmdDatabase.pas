unit DmdDatabase;

interface

uses                       
  SysUtils, Classes, Dialogs, MidasLib, RLFilters, DB, SqlExpr, Forms, IniFiles, IdCoder, IdCoder3to4, IdCoderMIME, FMTBcd, IdBaseComponent,
  DBClient, Provider, RLRichFilter, RLXLSFilter, RLPDFFilter, RLPreviewForm, DBXpress;
                                  
type
  TdmDatabase = class(TDataModule)
    scoDados: TSQLConnection;
    Decoder64: TIdDecoderMIME;
    sdsExec: TSQLDataSet;
    scoAtualiza: TSQLConnection;
    sdsVersao: TSQLDataSet;                                                   
    dspVersao: TDataSetProvider;
    cdsVersao: TClientDataSet;
    sdsVersaoID: TIntegerField;
    sdsVersaoSCRIPT: TBlobField;
    cdsVersaoID: TIntegerField;
    cdsVersaoSCRIPT: TBlobField;
    sqVersaoAtual: TSQLQuery;
    sqVersaoAtualVERSAO_BANCO: TIntegerField;
    scoLiberacao: TSQLConnection;                                                  
    sqEmpresa: TSQLQuery;
    sqDataLiberacao: TSQLQuery;
    sqEmpresaCNPJ_CPF: TStringField;
    sqDataLiberacaoDT_LIBERADO: TStringField;
    sqEmpresaLIBERADO_ATE: TStringField;
    Encoder64: TIdEncoderMIME;                              
    sdsExecRemoto: TSQLDataSet;
    sdsModuloRemoto: TSQLDataSet;
    dspModuloRemoto: TDataSetProvider;
    cdsModuloRemoto: TClientDataSet;
    sdsModuloRemotoID: TIntegerField;
    sdsModuloRemotoMODULO_ID: TIntegerField;
    sdsModuloRemotoLIBERADO: TStringField;
    cdsModuloRemotoID: TIntegerField;
    cdsModuloRemotoMODULO_ID: TIntegerField;
    cdsModuloRemotoLIBERADO: TStringField;
    sdsModuloRemotoMODULO_NOME: TStringField;
    cdsModuloRemotoMODULO_NOME: TStringField;
    sqEmpresaID: TIntegerField;
    sqDataLiberacaoCODVENDEDOR: TIntegerField;
    sqEmpresaULTIMO_ACESSO: TStringField;
    qParametros: TSQLQuery;
    qParametrosID_RESP_SUPORTE: TIntegerField;
    sdsLogPessoa: TSQLDataSet;
    dspLogPessoa: TDataSetProvider;
    cdsLogPessoa: TClientDataSet;
    sdsLogPessoaDOCUMENTO: TStringField;
    sdsLogPessoaNOME: TStringField;
    sdsLogPessoaFONE: TStringField;
    sdsLogPessoaDTPRIMEIROACESSO: TDateField;
    sdsLogPessoaDTULTIMOACESSO: TDateField;
    sdsLogPessoaCIDADE: TStringField;
    cdsLogPessoaDOCUMENTO: TStringField;
    cdsLogPessoaNOME: TStringField;
    cdsLogPessoaFONE: TStringField;
    cdsLogPessoaDTPRIMEIROACESSO: TDateField;
    cdsLogPessoaDTULTIMOACESSO: TDateField;
    cdsLogPessoaCIDADE: TStringField;
    sqEmpresaDDD1: TIntegerField;
    sqEmpresaCIDADE: TStringField;
    sqEmpresaNOME: TStringField;
    sqEmpresaFONE: TStringField;
    scoServidor: TSQLConnection;
    sqDataLiberacaoCODVENDEDOR_COB: TIntegerField;
    qParametros_Geral: TSQLQuery;
    qParametros_GeralID_RESP_COBRANCA: TIntegerField;
    qParametros_GeralUSA_NFCE_LOCAL: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function Fnc_ArquivoConfiguracao: string;

    function Monta_Numero2(Campo: String; Tamanho: Integer): String;
    procedure prc_Gravar_Log_Pessoa;

  public
    function ProximaSequencia(NomeTabela: string; Filial: Integer; SerieCupom: String = '0'): Integer;
    function Registro_Max(NomeTabela: string; Campo: String): Integer;
    procedure AtualizaFDB;
    function verificaLiberacao: Boolean;

    function ProximaTabelaLoc(NomeTabela: String): Integer;

    procedure prc_UpdateError(Tabela: String; ukTipo: TUpdateKind; Emsg: EUpdateError);

    function  fnc_Usa_NFCe_Local : Boolean;

  end;

var
  dmDatabase: TdmDatabase;

implementation

uses StrUtils;

{$R *.dfm}

const
  cArquivoConfiguracao = 'Config.ini';

function TdmDatabase.Fnc_ArquivoConfiguracao: string;
begin
  Result := ExtractFilePath(Application.ExeName) + cArquivoConfiguracao;
end;

function TdmDatabase.ProximaSequencia(NomeTabela: string; Filial: Integer; SerieCupom: String = '0'): Integer;
var
  sds: TSQLDataSet;
  iSeq: Integer;
  ID: TTransactionDesc;
  Flag: Boolean;
begin
  Result := 0;
  iSeq   := 0;
  qParametros_Geral.Close;
  qParametros_Geral.Open;

  sds := TSQLDataSet.Create(nil);
  try
    ID.TransactionID  := 999;
    ID.IsolationLevel := xilREADCOMMITTED;

    if (qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S') and (NomeTabela = 'PESSOA') then
      scoServidor.StartTransaction(ID)
    else
      scoDados.StartTransaction(ID);
    try
      //19/10/2020  vai gravar no servidor o cliente
      if (qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S') and (NomeTabela = 'PESSOA') then
         sds.SQLConnection := scoServidor
      else
        sds.SQLConnection := scoDados;
      sds.NoMetadata  := True;
      sds.GetMetadata := False;
      sds.CommandText := 'SELECT NUMREGISTRO FROM SEQUENCIAL WHERE TABELA = :TABELA AND FILIAL = :FILIAL AND SERIE = :SERIE';
      sds.ParamByName('SERIE').AsInteger  := StrToInt(SerieCupom);
      sds.ParamByName('TABELA').AsString  := NomeTabela;
      sds.ParamByName('FILIAL').AsInteger := Filial;
      sds.Open;

      //iSeq := sds.FieldByName('NUMREGISTRO').AsInteger + 1;
      iSeq := sds.FieldByName('NUMREGISTRO').AsInteger;

      if (qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S') and (NomeTabela = 'PESSOA') then
      begin
        if (iSeq = 0) and (sds.IsEmpty) then
          scoServidor.ExecuteDirect('INSERT INTO SEQUENCIAL(TABELA,FILIAL,NUMREGISTRO,SERIE) VALUES(' + QuotedStr(NomeTabela) + ',' +
                                  QuotedStr(IntToStr(Filial)) + ',' + QuotedStr(IntToStr(0)) + ',' + QuotedStr(SerieCupom) + ')');
        scoServidor.Commit(ID);
      end
      else
      begin
        if (iSeq = 0) and (sds.IsEmpty) then
          scoDados.ExecuteDirect('INSERT INTO SEQUENCIAL(TABELA,FILIAL,NUMREGISTRO,SERIE) VALUES(' + QuotedStr(NomeTabela) + ',' +
                                  QuotedStr(IntToStr(Filial)) + ',' + QuotedStr(IntToStr(0)) + ',' + QuotedStr(SerieCupom) + ')');
        scoDados.Commit(ID);
      end;

    except
      if (qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S') and (NomeTabela = 'PESSOA') then
        scoServidor.Rollback(ID)
      else
        scoDados.Rollback(ID);
      raise;
    end;
  finally
    FreeAndNil(sds);
  end;

  sds := TSQLDataSet.Create(nil);
  try
    ID.TransactionID  := 999;
    ID.IsolationLevel := xilREADCOMMITTED;

      if (qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S') and (NomeTabela = 'PESSOA') then
      dmDatabase.scoServidor.StartTransaction(ID)
    else
      dmDatabase.scoDados.StartTransaction(ID);
    try //--
      qParametros_Geral.Close;
      qParametros_Geral.Open;
      if (qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S') and (NomeTabela = 'PESSOA') then
        sds.SQLConnection := dmDatabase.scoServidor
      else
        sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata  := True;
      sds.GetMetadata := False;

      sds.CommandText := 'UPDATE SEQUENCIAL SET NUMREGISTRO = (SELECT MAX(COALESCE(NUMREGISTRO,0)) + 1 ' +
                         'FROM SEQUENCIAL ' +
                         'WHERE TABELA = :TABELA' +
                         ' AND FILIAL = :FILIAL AND SERIE = :SERIE) ' +
                         'WHERE TABELA = :TABELA' +
                         ' AND FILIAL = :FILIAL AND SERIE = :SERIE';

      sds.ParamByName('TABELA').AsString  := NomeTabela;
      sds.ParamByName('FILIAL').AsInteger := Filial;
      sds.ParamByName('SERIE').AsInteger := StrToInt(SerieCupom);


      Flag := False;
      while not Flag do
      begin
        try
          sds.Close;
          sds.ExecSQL;
          Flag := True;
        except
          on E: Exception do
            Flag := False;
        end;
      end;

      sds.Close;
      sds.CommandText := 'SELECT MAX(COALESCE(NUMREGISTRO,0)) NUMREGISTRO  ' +
                         'FROM SEQUENCIAL ' +
                         'WHERE TABELA = :TABELA ' +
                         'AND FILIAL = :FILIAL ' +
                         'AND SERIE = :SERIE';

      sds.ParamByName('TABELA').AsString  := NomeTabela;
      sds.ParamByName('FILIAL').AsInteger := Filial;
      sds.ParamByName('SERIE').AsInteger := StrToInt(SerieCupom);

      sds.Open;

      iSeq := sds.FieldByName('NUMREGISTRO').AsInteger;

      if (qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S') and (NomeTabela = 'PESSOA') then
        dmDatabase.scoServidor.Commit(ID)
      else
        dmDatabase.scoDados.Commit(ID);

      Result := iSeq;

    except
      if (qParametros_GeralUSA_NFCE_LOCAL.AsString = 'S') and (NomeTabela = 'PESSOA') then
        dmDatabase.scoServidor.Rollback(ID)
      else
        dmDatabase.scoDados.Rollback(ID);
      raise;
    end;

  finally
    FreeAndNil(sds);
  end;
end;

function TdmDatabase.Registro_Max(NomeTabela: string; Campo: String): Integer;
var                                                                                                             
  sds: TSQLDataSet;
  iSeq: Integer;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;

    sds.NoMetadata := True;
    sds.GetMetadata := False;

    sds.Close;
    sds.CommandText := ' SELECT MAX(' +CAMPO+ ')' + ' ID FROM ' + NomeTabela;
    sds.Open;

    iSeq := sds.FieldByName('ID').AsInteger;

    Result := iSeq;

  finally
    FreeAndNil(sds);
  end;
end;

procedure TdmDatabase.AtualizaFDB;
var
  DelimiterPos: Integer;
  S: WideString;
  Command: WideString;
  vFlag, vErro: Boolean;
  F: TextFile;
  arqLog: String;
  vID_Versao: Integer;
  vSQL_Ant: WideString;
  ID, ID2: TTransactionDesc;
  sds: TSQLDataSet;
  vFlag2: Integer;
  vMicroAtual: Boolean;
begin
   // verifica se algu�m est� atualizando
  {sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  vFlag2 := 1;
  while vFlag2 = 1 do
  begin
  	sds.Close;
  	sds.CommandText   := 'SELECT FLAG  FROM TABELALOC WHERE TABELA = ' + QuotedStr('INICIO');
  	sds.Open;
  	vFlag2 := sds.FieldByName('FLAG').AsInteger;
  end;}
  //

  sqVersaoAtual.Open;
  sdsVersao.CommandText := sdsVersao.CommandText + ' AND ID > ' + sqVersaoAtualVERSAO_BANCO.AsString + ' AND PROGRAMA_ID = 1 ';
  cdsVersao.Open;
  if not cdsVersao.IsEmpty then
  begin
    try
      arqLog := '';
      sds := TSQLDataSet.Create(nil);
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      vFlag2 := 1;
      while vFlag2 = 1 do
      begin
        sds.Close;
        sds.CommandText   := 'SELECT FLAG  FROM TABELALOC WHERE TABELA = ' + QuotedStr('INICIO');
        sds.Open;
        vFlag2 := sds.FieldByName('FLAG').AsInteger;
      end;
      sqVersaoAtual.Close;
      sqVersaoAtual.Open;
      cdsVersao.Close;
      sdsVersao.CommandText := sdsVersao.CommandText + ' AND ID > ' + sqVersaoAtualVERSAO_BANCO.AsString + ' AND PROGRAMA_ID = 1 ';
      cdsVersao.Open;
      if cdsVersao.IsEmpty then
        exit;

      sds.Close;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := ' UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('INICIO');
      sds.ExecSQL();

      vErro  := False;
      arqLog := 'FDBUpdate_' + FormatDateTime('YYYYMMDD',Date) +  '_' + FormatDateTime('HHMMSS',Time) +  '.log';
      AssignFile(F,arqLog);
      ReWrite(F);

      while not cdsVersao.Eof do
      begin
        S := cdsVersaoSCRIPT.AsString; // ScriptFile: String - your whole script
        vFlag := True;
        while vFlag do
        begin
          DelimiterPos := Pos('}', S);
          if DelimiterPos = 0 then
            DelimiterPos := Length(S);
          Command:= Copy(S, 1, DelimiterPos - 1);
          if pos('COMMIT',UpperCase(Command)) <= 0 then
            vSQL_Ant := Command;

          sdsExec.CommandText := (Command);
          //SQLQuery1.ParamCheck := False;
          //SQLQuery1.SQL.Text := command;
          //SQLQuery1.SQL.SaveToFile('C:\a\testeedson.txt');
          if trim(sdsExec.CommandText) <> '' then
          begin
            ID.TransactionID  := 99;
            ID.IsolationLevel := xilREADCOMMITTED;
            dmDatabase.scoDados.StartTransaction(ID);
            try
              sdsExec.ExecSQL(True);
              //SQLQuery1.ExecSQL(True);
              dmDatabase.scoDados.Commit(ID);
            except
              WriteLn(F,'----------------------------');
              WriteLn(F,'Vers�o: ' + cdsVersaoID.AsString + ' = ' + vSQL_Ant);
              vErro := True;
              dmDatabase.scoDados.Rollback(ID);
            end;
          end;
          //sdsExec.CommandText := ('UPDATE PARAMETROS SET VERSAO_BANCO = ' + cdsVersaoID.AsString);
          //sdsExec.ExecSQL(True);
          Delete(S, 1, DelimiterPos);
          if Length(S) = 0 then
            vFlag := False;
        end;
        sdsExec.CommandText := ('UPDATE PARAMETROS SET VERSAO_BANCO = ' + cdsVersaoID.AsString);
        sdsExec.ExecSQL(True);

        cdsVersao.Next;
      end;
    finally
      if trim(arqLog) <> '' then
        CloseFile(F);
      if not(vErro) then
        DeleteFile(arqLog);
      sds.Close;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := ' UPDATE TABELALOC SET FLAG = 0 WHERE TABELA = ' + QuotedStr('INICIO');
      sds.ExecSQL();

      FreeAndNil(sds);
    end;
  end;
  cdsVersao.Close;
  sqVersaoAtual.Close;
  scoAtualiza.Connected := False;
end;

function TdmDatabase.verificaLiberacao: Boolean;
var
  vData: String;
  vAux: String;
  vMsgLib: WideString;
begin
  Result := True;

  vAux := Monta_Numero2(sqEmpresaCNPJ_CPF.AsString,0);
  if Length(vAux) > 11 then
    vAux := copy(vAux,1,2) + '.' + copy(vAux,3,3) + '.' + copy(vAux,6,3) + '/' + copy(vAux,9,4) + '-' + copy(vAux,13,2)
  else
    vAux := copy(vAux,1,3) + '.' + copy(vAux,4,3) + '.' + copy(vAux,7,3) + '-' + copy(vAux,10,2);
  sqDataLiberacao.Close;
  //sqDataLiberacao.ParamByName('D1').AsString := sqEmpresaCNPJ_CPF.AsString;
  sqDataLiberacao.ParamByName('D1').AsString := vAux;
  sqDataLiberacao.Open;

  //14/01/2018 Aqui vai ser ajustado o c�digo do respons�vel pelo sistema na tabela SSFacil.fdb buscanddo infoma��o na base de dados
  //do ftp  servisoft.fdb
  qParametros.Close;
  qParametros.Open;
  if qParametrosID_RESP_SUPORTE.AsInteger <> sqDataLiberacaoCODVENDEDOR.AsInteger then
  begin
    sdsExec.CommandText := ('UPDATE PARAMETROS SET ID_RESP_SUPORTE = ' + IntToStr(sqDataLiberacaoCODVENDEDOR.AsInteger));
    sdsExec.ExecSQL(True);
  end;
  //*******************

  //27/07/2020 Aqui vai ser ajustado o c�digo do respons�vel pela cobran�a do SSFacil
  qParametros_Geral.Close;
  qParametros_Geral.Open;
  if qParametros_GeralID_RESP_COBRANCA.AsInteger <> sqDataLiberacaoCODVENDEDOR_COB.AsInteger then
  begin
    sdsExec.CommandText := ('UPDATE PARAMETROS_GERAL SET ID_RESP_COBRANCA = ' + IntToStr(sqDataLiberacaoCODVENDEDOR_COB.AsInteger));
    sdsExec.ExecSQL(True);
  end;
  //*******************

  vData := Decoder64.DecodeString(sqDataLiberacaoDT_LIBERADO.AsString);
  if vData <> '' then
  begin
    sdsExec.CommandText := ('UPDATE FILIAL SET LIBERADO_ATE = ' +
                            QuotedStr(sqDataLiberacaoDT_LIBERADO.AsString) +
                            ' WHERE PRINCIPAL = ''S''');
    sdsExec.ExecSQL(True);

    if (StrToDate(vData) > 1) and (StrToDate(vData) < Date) then
      Result := False;

///INCLUI VENDEDOR NO CADASTRO DA FILIAL
    sdsExec.CommandText := ('UPDATE PARAMETROS SET ID_RESP_SUPORTE = ' + sqDataLiberacaoCODVENDEDOR.AsString);
    sdsExec.ExecSQL(True);
  end
  else
  begin
    ShowMessage('Empresa com o CNPJ  ' + sqEmpresaCNPJ_CPF.AsString + '  n�o localizada no banco de dados Servisoft!');
    Result := False;
  end;
end;

procedure TdmDatabase.prc_UpdateError(Tabela: String;
  ukTipo: TUpdateKind; Emsg: EUpdateError);
begin
  if ukTipo = ukDelete  then
    //raise Exception.Create('Erro ao tentar excluir: ' + ' Tabela: ' + '(' + Tabela + ')'  + #13 + Emsg.Message)
    raise Exception.Create('Erro ao tentar excluir: ' + #13 + Emsg.Message)
  else
  if ukTipo = ukModify then
    //raise Exception.Create('Erro ao tentar gravar: ' + ' Tabela: ' + '(' + Tabela + ')'  + #13 + Emsg.Message);
    raise Exception.Create('Erro ao tentar gravar: ' + #13 + Emsg.Message);
end;

procedure TdmDatabase.DataModuleCreate(Sender: TObject);
var
  Config: TIniFile;
  dtLiberado: TDateTime;
  dtUltimo_Acesso: TDateTime;
  vTexto: String;
  vFoneAux: String;
  vDia, vMes, vAno: Word;
begin
  scoDados.Connected     := False;
  scoLiberacao.Connected := False;
  scoAtualiza.Connected  := False;
  //scoDados.LoadParamsOnConnect     := True;
  //scoLiberacao.LoadParamsOnConnect := True;
  //scoAtualiza.LoadParamsOnConnect  := True;
  scoDados.KeepConnection     := True;
  scoLiberacao.KeepConnection := True;
// juca 28/05/19  scoAtualiza.KeepConnection  := True;
  vTexto := Fnc_ArquivoConfiguracao;
  if not FileExists(Fnc_ArquivoConfiguracao) then
  begin
    MessageDlg(' Arquivo Config.ini n�o encontrado!',mtInformation,[mbOk],0);
    Exit;
  end;

  Config := TIniFile.Create(Fnc_ArquivoConfiguracao);
  scoDados.LoadParamsFromIniFile(Fnc_ArquivoConfiguracao);
  scoLiberacao.LoadParamsFromIniFile(Fnc_ArquivoConfiguracao);
// juca 28/05/19  scoAtualiza.LoadParamsFromIniFile(Fnc_ArquivoConfiguracao);

  try
//////////////////CONECTA AO BANCO DE DADOS DA APLICA��O
    try
      scoDados.Params.Values['DRIVERNAME'] := 'INTERBASE';
      scoDados.Params.Values['SQLDIALECT'] := '3';
      scoDados.Params.Values['DATABASE']   := Config.ReadString('SSFacil', 'DATABASE', '');
      scoDados.Params.Values['USER_NAME']  := Config.ReadString('SSFacil', 'USERNAME', '');
      scoDados.Params.Values['PASSWORD']   := Decoder64.DecodeString(Config.ReadString('SSFacil', 'PASSWORD', ''));
      scoDados.Connected := True;
    except
      on E: exception do
      begin
        raise Exception.Create('Erro ao conectar ao banco de dados:' + #13 +
                               'Mensagem: ' + E.Message + #13 +
                               'Classe: ' + E.ClassName + #13 + #13 +
                               'Dados da Conexao SSFacil' + #13 +
                               'Banco de Dados: '  + scoDados.Params.Values['Database'] + #13 +
                               'Usu�rio: '         + scoDados.Params.Values['User_Name']);
      end;
    end;

    if fnc_Usa_NFCe_Local then
    begin
      try
        scoServidor.Params.Values['DRIVERNAME'] := 'INTERBASE';
        scoServidor.Params.Values['SQLDIALECT'] := '3';
        scoServidor.Params.Values['DATABASE']   := Config.ReadString('SSFacil_Servidor', 'DATABASE', '');
        scoServidor.Params.Values['USER_NAME']  := Config.ReadString('SSFacil_Servidor', 'USERNAME', '');
        scoServidor.Params.Values['PASSWORD']   := Decoder64.DecodeString(Config.ReadString('SSFacil_Servidor', 'PASSWORD', ''));
        scoServidor.Connected := True;
      except
        on E: exception do
        begin
          raise Exception.Create('Erro ao conectar ao banco de dados do Servidor (NFCe Local):' + #13 +
                                 'Mensagem: ' + E.Message + #13 +
                                 'Classe: ' + E.ClassName + #13 + #13 +
                                 'Dados da Conexao SSFacil Servidor (NFCe Local) ' + #13 +
                                 'Banco de Dados: '  + scoServidor.Params.Values['Database'] + #13 +
                                 'Usu�rio: '         + scoServidor.Params.Values['User_Name']);
        end;
      end;

    end;


//////////////////VERIFICA SE EMPRESA EST� LIBERADA
      sqEmpresa.Open;
      if (sqEmpresaLIBERADO_ATE.IsNull) or (Trim(sqEmpresaLIBERADO_ATE.AsString) = '') then
      begin
        sdsExec.CommandText := ('UPDATE FILIAL SET LIBERADO_ATE = ' +
                                QuotedStr(Encoder64.EncodeString(DateToStr(Date + 5)))) +
                                ' WHERE PRINCIPAL = ''S''';
        sdsExec.ExecSQL(True);
      end;
      sqEmpresa.Close;
      sqEmpresa.Open;

      dtLiberado := StrToDate(Decoder64.DecodeString(sqEmpresaLIBERADO_ATE.AsString));
      vTexto     := Decoder64.DecodeString(sqEmpresaULTIMO_ACESSO.AsString);
      if trim(vTexto) <> '' then
        dtUltimo_Acesso := StrToDate(Decoder64.DecodeString(sqEmpresaULTIMO_ACESSO.AsString))
      else
        dtUltimo_Acesso := 0;
      qParametros.Close;
      qParametros.Open;
      qParametros_Geral.Close;
      qParametros_Geral.Open;
      if qParametrosID_RESP_SUPORTE.AsInteger = 90 then
        vFoneAux := 'Contate com a Mash Solu��es pelo telefone (51)31110780 / 31110354 / 34411084!'
      else
      if qParametros_GeralID_RESP_COBRANCA.AsInteger = 175 then
        vFoneAux := 'Contate com a CRI NET  pelos telefones (51)99240-0477 / 3066-0477 / 3066-0577 '
      else
        vFoneAux := 'Contate com a Servisoft pelo telefone (51)3598-6584!';

      if (dtUltimo_Acesso > 10) and (dtUltimo_Acesso > Date) then
      begin
        MessageDlg('Data inv�lida, favor verificar a data do �ltimo acesso ' + DateToStr(dtUltimo_Acesso) + #13 + vFoneAux,mtInformation,[mbOk],0);
        Application.Terminate;
      end
      else
      if dtLiberado >= Date then
      begin
        sdsExec.CommandText := ('UPDATE FILIAL SET ULTIMO_ACESSO = ' +
                                QuotedStr(Encoder64.EncodeString(DateToStr(Date)))) +
                                ' WHERE PRINCIPAL = ''S''';
        sdsExec.ExecSQL(True);
      end
      else
      begin
        try
          try
            scoLiberacao.Params.Values['DRIVERNAME'] := 'INTERBASE';
            scoLiberacao.Params.Values['SQLDIALECT'] := '3';
            scoLiberacao.Params.Values['DATABASE']   := Config.ReadString('Liberacao', 'DATABASE', '');
            scoLiberacao.Params.Values['USER_NAME']  := Config.ReadString('Liberacao', 'USERNAME', '');
            scoLiberacao.Params.Values['PASSWORD']   := Decoder64.DecodeString(Config.ReadString('Liberacao', 'PASSWORD', ''));
            scoLiberacao.Connected := True;
          except
          on E: exception do
            raise Exception.Create('Erro ao conectar ao banco de dados!');
          end;

          if not(verificaLiberacao) then
          begin
            MessageDlg('A validade de uso do programa expirou!' + #13 +
                       vFoneAux,mtInformation,[mbOk],0);
            Application.Terminate;
        end;
        finally
          begin
            sqEmpresa.Close;
            sqEmpresa.Open;
            dtLiberado := StrToDate(Decoder64.DecodeString(sqEmpresaLIBERADO_ATE.AsString));
            if dtLiberado >= Date then
            begin
              sdsExec.CommandText := ('UPDATE FILIAL SET ULTIMO_ACESSO = ' +
                                     QuotedStr(Encoder64.EncodeString(DateToStr(Date)))) +
                                     ' WHERE PRINCIPAL = ''S''';
              sdsExec.ExecSQL(True);
            end
            else
            begin
              try
                scoLiberacao.Params.Values['DRIVERNAME'] := 'INTERBASE';
                scoLiberacao.Params.Values['SQLDIALECT'] := '3';
                scoLiberacao.Params.Values['DATABASE']   := Config.ReadString('Liberacao', 'DATABASE2', '');
                scoLiberacao.Params.Values['USER_NAME']  := Config.ReadString('Liberacao', 'USERNAME2', '');
                scoLiberacao.Params.Values['PASSWORD']   := Decoder64.DecodeString(Config.ReadString('Liberacao', 'PASSWORD2', ''));
                scoLiberacao.Connected := True;
              except
                MessageDlg('Servidor de licen�as n�o localizado!' + #13 +
                           vFoneAux,mtInformation,[mbOk],0);
                Application.Terminate;
              end;
            end;
          end
        end;
      end;
//////////////////VERIFICA E ATUALIZA FDB
// juca 28/05/19
    {try
      //24/05/2019  Esta fixo no dmddatabase, pois esta pegando no kinghost
      scoAtualiza.Params.Values['DRIVERNAME'] := 'INTERBASE';
      scoAtualiza.Params.Values['SQLDIALECT'] := '3';
      scoAtualiza.Params.Values['DATABASE']   := Config.ReadString('FDBUpdate', 'DATABASE', '');
      scoAtualiza.Params.Values['USER_NAME']  := Config.ReadString('FDBUpdate', 'USERNAME', '');
      scoAtualiza.Params.Values['PASSWORD']   := Decoder64.DecodeString(Config.ReadString('FDBUpdate', 'PASSWORD', ''));
      scoAtualiza.Connected := True;
    except
      on E: exception do
      begin
        raise Exception.Create('Erro ao conectar ao banco de dados:' + #13 +
                               'Mensagem: ' + E.Message + #13 +
                               'Classe: ' + E.ClassName + #13 + #13 +
                               'Dados da Conexao FDBUpdate' + #13 +
                               'Banco de Dados: '  + scoAtualiza.Params.Values['Database'] + #13 +
                               'Usu�rio: '         + scoAtualiza.Params.Values['User_Name']);
      end;
    end;}

     //grava os dados dos clientes que est�o utilizando o sistema
      DecodeDate(Date, vAno, vMes, vDia);
      if (vDia = 02) or (vDia = 10) or (vDia = 20) or (vDia = 28) then
      begin
        try
          scoLiberacao.Params.Values['DRIVERNAME'] := 'INTERBASE';
          scoLiberacao.Params.Values['SQLDIALECT'] := '3';
          scoLiberacao.Params.Values['DATABASE']   := Config.ReadString('Liberacao', 'DATABASE', '');
          scoLiberacao.Params.Values['USER_NAME']  := Config.ReadString('Liberacao', 'USERNAME', '');
          scoLiberacao.Params.Values['PASSWORD']   := Decoder64.DecodeString(Config.ReadString('Liberacao', 'PASSWORD', ''));
          scoLiberacao.Connected := True;
          prc_Gravar_Log_Pessoa;
        finally
          scoLiberacao.Connected := False;
        end;
      end;
  finally
    FreeAndNil(Config);
  end;

// juca 28/05/19  AtualizaFDB;

end;

function TdmDatabase.ProximaTabelaLoc(NomeTabela: String): Integer;
var
  sds: TSQLDataSet;
  iSeq: Integer;
  ID: TTransactionDesc;
  Flag: Boolean;
begin
  iSeq   := 0;
  Result := 0;

  sds := TSQLDataSet.Create(nil);
  try
    ID.TransactionID := 990;
    ID.IsolationLevel := xilREADCOMMITTED;

    scoDados.StartTransaction(ID);
    try
      sds.SQLConnection := scoDados;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := 'SELECT FLAG FROM TABELALOC WHERE TABELA = :TABELA';
      sds.ParamByName('TABELA').AsString := NomeTabela;
      sds.Open;

      //iSeq := sds.FieldByName('NUMREGISTRO').AsInteger + 1;
      iSeq := sds.FieldByName('FLAG').AsInteger;

      if (iSeq = 0) and (sds.IsEmpty) then
        scoDados.ExecuteDirect('INSERT INTO TABELALOC(TABELA,FLAG) VALUES(''' + NomeTabela + ''', ''' + IntToStr(0) + ''' )');
      scoDados.Commit(ID);
    except
      scoDados.Rollback(ID);
      raise;
    end;
  finally
    FreeAndNil(sds);
  end;

  sds := TSQLDataSet.Create(nil);
  try
    ID.TransactionID  := 990;
    ID.IsolationLevel := xilREADCOMMITTED;

    dmDatabase.scoDados.StartTransaction(ID);
    try //--
      sds.SQLConnection := dmDatabase.scoDados;

      sds.NoMetadata  := True;
      sds.GetMetadata := False;

      sds.CommandText := 'UPDATE TABELALOC SET FLAG = (SELECT MAX(COALESCE(FLAG,0)) + 1 ' +
                         'FROM TABELALOC ' +
                         'WHERE TABELA = :TABELA)' +
                         'WHERE TABELA = :TABELA';

      sds.ParamByName('TABELA').AsString  := NomeTabela;

      Flag := False;
      while not Flag do
      begin
        try
          sds.Close;
          sds.ExecSQL;
          Flag := True;
        except
          on E: Exception do
            Flag := False;
        end;
      end;

      sds.Close;
      sds.CommandText := 'SELECT MAX(COALESCE(FLAG,0)) FLAG  ' +
                         'FROM TABELALOC ' +
                         'WHERE TABELA = :TABELA ';
      sds.ParamByName('TABELA').AsString  := NomeTabela;
      sds.Open;

      iSeq   := sds.FieldByName('FLAG').AsInteger;
      Result := iSeq;

      dmDatabase.scoDados.Commit(ID);

    except
      dmDatabase.scoDados.Rollback(ID);
      raise;
    end;

  finally
    FreeAndNil(sds);
  end;
end;

function TdmDatabase.Monta_Numero2(Campo: String; Tamanho: Integer): String;
var
  texto2: String;
  i: Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
    if Campo[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      Texto2 := Texto2 + Copy(Campo,i,1);
  for i := 1 to Tamanho - Length(texto2) do
    texto2 := '0' + texto2;
  Result := texto2;
end;

procedure TdmDatabase.prc_Gravar_Log_Pessoa;
var
  vDocumento: string;
begin
  cdsLogPessoa.Close;
  cdsLogPessoa.Open;

  vDocumento := Monta_Numero2(sqEmpresaCNPJ_CPF.AsString,0);
  if Length(vDocumento) > 11 then
    vDocumento := copy(vDocumento,1,2) + '.' + copy(vDocumento,3,3) + '.' + copy(vDocumento,6,3) + '/' + copy(vDocumento,9,4) + '-' + copy(vDocumento,13,2)
  else
    vDocumento := copy(vDocumento,1,3) + '.' + copy(vDocumento,4,3) + '.' + copy(vDocumento,7,3) + '-' + copy(vDocumento,10,2);
  if cdsLogPessoa.locate('DOCUMENTO',vDocumento,[loCaseInsensitive]) then
    cdsLogPessoa.Edit
  else
    cdsLogPessoa.Insert;
  cdsLogPessoaDOCUMENTO.AsString := vDocumento;
  cdsLogPessoaNOME.AsString := sqEmpresaNOME.AsString;
  cdsLogPessoaFONE.AsString := '(' + sqEmpresaDDD1.AsString + ') ' + sqEmpresaFONE.AsString;
  cdsLogPessoaCIDADE.AsString := sqEmpresaCIDADE.AsString;
  if cdsLogPessoaDTPRIMEIROACESSO.IsNull then
    cdsLogPessoaDTPRIMEIROACESSO.AsDateTime := Date;
  cdsLogPessoaDTULTIMOACESSO.AsDateTime := Date;
  cdsLogPessoa.Post;
  cdsLogPessoa.ApplyUpdates(0);
end;

function TdmDatabase.fnc_Usa_NFCe_Local: Boolean;
var
  sds: TSQLDataSet;
begin
  Result := False;

  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := scoDados;
    sds.NoMetadata  := True;
    sds.GetMetadata := False;
    sds.CommandText := 'SELECT USA_NFCE_LOCAL FROM PARAMETROS_GERAL';
    sds.Open;
    result := (sds.FieldByName('USA_NFCE_LOCAL').AsString = 'S');
  finally
    FreeAndNil(sds);
  end;
end;

end.

