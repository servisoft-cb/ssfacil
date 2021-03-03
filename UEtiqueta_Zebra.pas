unit UEtiqueta_Zebra;

interface

Uses
  UDMEtiqueta, SysUtils, Messages, Dialogs, uUtilPadrao, SqlExpr;

  procedure prc_Etiqueta_ZebraZT410(fDMEtiqueta: TDMEtiqueta); //Etiqueta para imprimir o RFID para a Beira Rio  tamanho  10cm x 10cm

implementation

uses DB, MaskUtils, DmdDatabase;

procedure prc_Etiqueta_ZebraZT410(fDMEtiqueta: TDMEtiqueta);
var
  F: TextFile;
  vTexto: String;
  vNome_Mat: array[1..4] of String;
  i: Integer;

  procedure Imprimir;
  begin
    //Cabeçalho
    Write(F,'^XA');
    Write(F,'^SZ2');
    Write(F,'^PW832');
    Write(F,'~SD'+FormatFloat('00',fDMEtiqueta.cdsParametros_FinZEBRA_TEMPERATURA.AsInteger));
    Write(F,'^PR'+fDMEtiqueta.cdsParametros_FinZEBRA_VELOCIDADE.AsString+','+fDMEtiqueta.cdsParametros_FinZEBRA_VELOCIDADE.AsString+','+fDMEtiqueta.cdsParametros_FinZEBRA_VELOCIDADE.AsString);
    Write(F,'^LH5,5');
    Write(F,'^LRN');

    //Detalhe
    Writeln(F,'^FT16,230^A0N,28,38^FDFornecedor: '+copy(fDMEtiqueta.mEtiqueta_NavNome_Empresa.AsString,1,16) +'^FS');
    Writeln(F,'^FT525,230^A0N,28,38^FDData: ' + fDMEtiqueta.mEtiqueta_NavDtEmissao.AsString +'^FS');
    Writeln(F,'^FT16,300^A0N,28,38^FDItem:^FS');
    Writeln(F,'^FT101,300^A0N,39,53^FD'+ copy(fDMEtiqueta.mEtiqueta_NavProd_Cliente.AsString,1,14) +'^FS');
    Writeln(F,'^FT525,300^A0N,28,38^FDCor:^FS');
    Writeln(F,'^FT593,300^A0N,34,46^FD'+copy(fDMEtiqueta.mEtiqueta_NavCod_Cor_Cliente.AsString,1,8)+'^FS');
    Writeln(F,'^FT16,370^A0N,28,38^FDQtde./Med.:^FS');
    Writeln(F,'^FT202,370^A0N,39,53^FD'+FormatFloat('0.####',fDMEtiqueta.mEtiqueta_NavQtd.AsFloat) + ' / ' + fDMEtiqueta.mEtiqueta_NavUnidade.AsString +'^FS');
    Writeln(F,'^FT16,440^A0N,28,38^FDTam.:^FS');
    Writeln(F,'^FT110,440^A0N,39,53^FD'+' ' +'^FS');
    Writeln(F,'^FT16,513^A0N,28,38^FDMaterial:^FS');
    Writeln(F,'^FT159,513^A0N,31,42^FD'+vNome_Mat[1]+'^FS');
    Writeln(F,'^FT159,545^A0N,31,42^FD'+vNome_Mat[2]+'^FS');
    Writeln(F,'^FT159,577^A0N,31,42^FD'+vNome_Mat[3]+'^FS');
    Writeln(F,'^FT159,609^A0N,31,42^FD'+vNome_Mat[4]+'^FS');
    Writeln(F,'^FT122,695^A0N,28,38^FDNF:^FS');
    Writeln(F,'^FT186,695^A0N,39,53^FD'+fDMEtiqueta.mEtiqueta_NavNum_Nota.AsString + '^FS');
    Writeln(F,'^FT425,695^A0N,28,38^FDO.C.:^FS');
    Writeln(F,'^FT515,695^A0N,39,53^FD'+copy(fDMEtiqueta.mEtiqueta_NavPedido_Cliente.AsString,1,8)+'^FS');
    Writeln(F,'^FO59,769^BY3^BCN,102,N,N^FD>;'+fDMEtiqueta.mEtiqueta_NavNUM_RFID.AsString + '^FS');
    Writeln(F,'^FT94,899^A0N,28,38^FD'+fDMEtiqueta.mEtiqueta_NavNUM_RFID.AsString + '^FS');
    Writeln(F,'^FO612,740^BQN,2,6^FDHA,'+fDMEtiqueta.mEtiqueta_NavNUM_RFID.AsString + '^FS');
    Writeln(F,'^FT60,944^A0N,20,25^FDDesenvolvido por Servisoft Informatica - 3598-6584^FS');
    Writeln(F,'^RFW,H,1,2,1^FD3400^FS');
    Writeln(F,'^RFW,H,2,12,1^FD'+fDMEtiqueta.mEtiqueta_NavNUM_RFID.AsString + '^FS');
    //Encerramento
    Writeln(F,'^PQ1,0,1,Y');
    Writeln(F,'^XZ');
  end;

begin
  fDMEtiqueta.cdsParametros_Fin.Close;
  fDMEtiqueta.cdsParametros_Fin.Open;

  if trim(fDMEtiqueta.cdsParametros_FinZEBRA_ENDERECO.AsString) = '' then
  begin
    MessageDlg('*** Endereço da impressora Zebra não informado!', mtError, [mbOk], 0);
    exit;
  end;

  AssignFile(F,fDMEtiqueta.cdsParametros_FinZEBRA_ENDERECO.AsString);
  ReWrite(F);

  i := 0;
  fDMEtiqueta.mEtiqueta_Nav.First;
  while not fDMEtiqueta.mEtiqueta_Nav.Eof do
  begin
    vNome_Mat[1] := copy(fDMEtiqueta.mEtiqueta_NavNome_Produto.AsString,1,30);
    vNome_Mat[2] := copy(fDMEtiqueta.mEtiqueta_NavNome_Produto.AsString,31,30);
    vNome_Mat[3] := copy(fDMEtiqueta.mEtiqueta_NavNome_Produto.AsString,61,30);
    vNome_Mat[4] := copy(fDMEtiqueta.mEtiqueta_NavNome_Produto.AsString,91,30);
    Imprimir;

    fDMEtiqueta.mEtiqueta_Nav.Edit;
    fDMEtiqueta.mEtiqueta_NavEnviado.AsString := fDMEtiqueta.fnc_Verifica_Enviado_BeiraRio(fDMEtiqueta.mEtiqueta_NavSequencia_RFID.AsLargeInt,fDMEtiqueta.mEtiqueta_NavFilial.AsInteger);
    fDMEtiqueta.mEtiqueta_Nav.Post;

    fDMEtiqueta.mEtiqueta_Nav.Next;
  end;

  CloseFile(F);
end;


end.
