unit UEtiqueta_RFID;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxCollection, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, UDMEtiqueta,
  Grids, DBGrids, SMDBGrid, SqlExpr, UDMRFID, RzTabs, RzPanel, DBCtrls, DB;

type
  TfrmEtiqueta_RFID = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Configuracao: TRzTabSheet;
    TS_Etiquetas: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    RzGroupBox1: TRzGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    btnAlterar_Etiq: TNxButton;
    Panel1: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    btnGerar: TNxButton;
    btnImprimirA4: TNxButton;
    ckTeste: TCheckBox;
    DBEdit2: TDBEdit;
    btnConfirmar_Etiq: TNxButton;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    btnImprimir: TNxButton;
    Shape1: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Shape2: TShape;
    btnReenvio: TNxButton;
    btnExcluir: TNxButton;
    Panel2: TPanel;
    Label9: TLabel;
    Shape3: TShape;
    Label10: TLabel;
    StaticText1: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnImprimirA4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterar_EtiqClick(Sender: TObject);
    procedure btnConfirmar_EtiqClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnReenvioClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    fDMEtiqueta: TDMEtiqueta;
    fDMRFID: TDMRFID;
    vSeq: Integer;
    vImprimir : Boolean;
    vJaGerado : Boolean;

    procedure prc_Gravar_RFID;
    procedure prc_Grava_Seq_Aux;
    procedure prc_Imprimir;
    procedure prc_Envio_RFID;
    procedure prc_Verifica_ItemSemQtdRotulo;
    procedure prc_Abrir_Produto_Forn;
    procedure prc_Inserir_Produto_Forn;
    procedure prc_Grava_ProdCli_Auxiliar;

    function fnc_Ultima_Seq : Integer;
    function fnc_Proximo_Item : Integer;

  public
    { Public declarations }
    vID_Nota_Local : Integer;
    
  end;

var
  frmEtiqueta_RFID: TfrmEtiqueta_RFID;

implementation

uses DmdDatabase, rsDBUtils, uUtilPadrao, UEtiqueta_Zebra,
  UEtiqueta_RFID_Qtd, UEtiqueta_RFID_Cli;

{$R *.dfm}

procedure TfrmEtiqueta_RFID.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
  FreeAndNil(fDMEtiqueta);
  FreeAndNil(fDMRFID);
end;

procedure TfrmEtiqueta_RFID.FormShow(Sender: TObject);
begin
  fDMEtiqueta := TDMEtiqueta.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMEtiqueta);
  fDMRFID := TDMRFID.Create(Self);
  vJaGerado := False;
  fDMEtiqueta.vProd_Cliente_Exite := True;

  Panel2.Visible := trim(SQLLocate('PARAMETROS_NFE','ID','ETIQ_RFID_AGRUPADA','1')) = 'S';

  fDMEtiqueta.mEtiqueta_Nav.EmptyDataSet;
  fDMEtiqueta.prc_Le_NotaFiscal_RFID(vID_Nota_Local);
  if not fDMEtiqueta.mEtiqueta_Nav.IsEmpty then
    vJaGerado := True;

  prc_Verifica_ItemSemQtdRotulo;
end;

procedure TfrmEtiqueta_RFID.btnGerarClick(Sender: TObject);
begin
  if trim(SQLLocate('PARAMETROS_PROD','ID','USA_QTD_ROTULO_RFID','1')) <> 'S' then
  begin
    if CurrencyEdit1.Value <= 0 then
    begin
      MessageDlg('*** É obrigatório informar a quantidade!' , mtInformation, [mbOk], 0);
      CurrencyEdit1.SetFocus;
      exit;
    end;
  end;
  if trim(SQLLocate('PARAMETROS_NFE','ID','ETIQ_RFID_AGRUPADA','1')) = 'S' then
    fDMEtiqueta.prc_Monta_Etiqueta_RFID_Agr(vID_Nota_Local,CurrencyEdit1.Value)
  else
    fDMEtiqueta.prc_Monta_Etiqueta_RFID(vID_Nota_Local,CurrencyEdit1.Value);
end;

procedure TfrmEtiqueta_RFID.btnImprimirA4Click(Sender: TObject);
const
  C_Dll : string = 'EnviaRFID.dll';
var
  vArq: String;
  FHandle: THandle;
  FRoutine: function (const pID: WideString): Boolean;
  vImp: Boolean;
  Form: TForm;
begin
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Etiqueta_RFID.fr3';
  if not(FileExists(vArq)) then
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  vSeq := fnc_Ultima_Seq;
  fDMEtiqueta.mEtiqueta_Nav.IndexFieldNames := 'ID_Nota;Item_Nota';
  fDMEtiqueta.mEtiqueta_Nav.First;
  while not fDMEtiqueta.mEtiqueta_Nav.Eof do
  begin
    //if fDMEtiqueta.mEtiqueta_NavSequencia_RFID.Value <= 0 then
    begin
      prc_Grava_Seq_Aux;
      prc_Gravar_RFID;
    end;
    fDMEtiqueta.mEtiqueta_Nav.Next;
  end;


  if (ckTeste.Checked) and (ckTeste.Visible) then
    vImp := True
  else
  begin
    Form := TForm.Create(Application);
    uUtilPadrao.prc_Form_Aguarde(Form);

    FHandle := LoadLibrary(PAnsiChar(C_Dll));
    try
      vImp := False;
      FRoutine := GetProcAddress(FHandle, 'EnviarRFID');
      if (Assigned(FRoutine)) then
      begin
        try
          FRoutine(IntToStr(vID_Nota_Local));
          vImp := true;
        except
          on E : Exception do
            FreeLibrary(FHandle);
        end;
      end
      else
        raise Exception.Create('Dll não encontrada!');
    finally
      FreeLibrary(FHandle);
      FreeAndNil(Form);
    end;
  end;

  if vImp then
    prc_Imprimir;

end;

procedure TfrmEtiqueta_RFID.prc_Gravar_RFID;
var
  vItemAux : Integer;
begin
  fDMRFID.cdsNotaFiscal_RFID.Close;
  fDMRFID.sdsNotaFiscal_RFID.ParamByName('ID').AsInteger        := fDMEtiqueta.mEtiqueta_NavID_Nota.AsInteger;
  fDMRFID.sdsNotaFiscal_RFID.ParamByName('ITEM_NOTA').AsInteger := fDMEtiqueta.mEtiqueta_NavItem_Nota.AsInteger;
  fDMRFID.cdsNotaFiscal_RFID.Open;

  fDMRFID.cdsNotaFiscal_RFID.Last;
  vItemAux := fDMRFID.cdsNotaFiscal_RFIDITEM_RFID.AsInteger;

  fDMRFID.cdsNotaFiscal_RFID.Insert;
  fDMRFID.cdsNotaFiscal_RFIDID.AsInteger         := fDMEtiqueta.mEtiqueta_NavID_Nota.AsInteger;
  fDMRFID.cdsNotaFiscal_RFIDITEM_NOTA.AsInteger  := fDMEtiqueta.mEtiqueta_NavItem_Nota.AsInteger;
  fDMRFID.cdsNotaFiscal_RFIDITEM_RFID.AsInteger  := vItemAux + 1;
  fDMRFID.cdsNotaFiscal_RFIDFILIAL.AsInteger     := fDMEtiqueta.mEtiqueta_NavFilial.AsInteger;
  fDMRFID.cdsNotaFiscal_RFIDCNPJ_FILIAL.AsString := fDMEtiqueta.mEtiqueta_NavCNPJ_Filial.AsString;
  fDMRFID.cdsNotaFiscal_RFIDSEQUENCIA.AsVariant  := fDMEtiqueta.mEtiqueta_NavSequencia_RFID.AsVariant;
  fDMRFID.cdsNotaFiscal_RFIDQTD.AsFloat          := StrToFloat(FormatFloat('0.0000',fDMEtiqueta.mEtiqueta_NavQtd.AsFloat));
  fDMRFID.cdsNotaFiscal_RFIDUNIDADE.AsString     := fDMEtiqueta.mEtiqueta_NavUnidade.AsString;
  fDMRFID.cdsNotaFiscal_RFIDNUM_RFID.AsString    := Monta_Numero(fDMEtiqueta.mEtiqueta_NavCNPJ_Filial.AsString,14)
                                                  + Monta_Numero(fDMEtiqueta.mEtiqueta_NavSequencia_RFID.AsString,10);
  fDMRFID.cdsNotaFiscal_RFID.Post;
  fDMRFID.cdsNotaFiscal_RFID.ApplyUpdates(0);
end;

procedure TfrmEtiqueta_RFID.prc_Grava_Seq_Aux;
begin
  vSeq := vSeq + 1;
  fDMEtiqueta.mEtiqueta_Nav.Edit;
  fDMEtiqueta.mEtiqueta_NavSequencia_RFID.Value := vSeq;
  fDMEtiqueta.mEtiqueta_NavNUM_RFID.AsString    := Monta_Numero(fDMEtiqueta.mEtiqueta_NavCNPJ_Filial.AsString,14)
                                                 + Monta_Numero(fDMEtiqueta.mEtiqueta_NavSequencia_RFID.AsString,10);
  fDMEtiqueta.mEtiqueta_Nav.Post;
end;

function TfrmEtiqueta_RFID.fnc_Ultima_Seq: Integer;
var
  sds: TSQLDataSet;
begin
  Result := 0;
  vSeq   := 0;
  sds    := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select coalesce(max(SEQUENCIA),0) SEQUENCIA from NOTAFISCAL_RFID ';
    sds.Open;
    Result := sds.FieldByName('SEQUENCIA').Value;
  finally
    FreeAndNil(sds);
  end;

end;

procedure TfrmEtiqueta_RFID.prc_Imprimir;
var
  vArq: String;
begin
  fDMEtiqueta.mEtiqueta_Nav.First;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Etiqueta_RFID.fr3';
  fDMEtiqueta.frxReport1.Report.LoadFromFile(vArq);
  fDMEtiqueta.frxReport1.ShowReport;
end;

procedure TfrmEtiqueta_RFID.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    ckTeste.Visible := not(ckTeste.Visible);
end;

procedure TfrmEtiqueta_RFID.btnAlterar_EtiqClick(Sender: TObject);
begin
  RzGroupBox1.Enabled       := True;
  btnConfirmar_Etiq.Enabled := True;
  if fDMEtiqueta.cdsParametros_FinID.AsInteger <= 0 then
  begin
    fDMEtiqueta.cdsParametros_Fin.Insert;
    fDMEtiqueta.cdsParametros_FinID.AsInteger;
    fDMEtiqueta.cdsParametros_FinZEBRA_TEMPERATURA.AsInteger := 20;
    fDMEtiqueta.cdsParametros_FinZEBRA_VELOCIDADE.AsInteger  := 2;
  end
  else
  begin
    fDMEtiqueta.cdsParametros_Fin.Edit;
    if fDMEtiqueta.cdsParametros_FinZEBRA_TEMPERATURA.AsInteger <= 0 then
      fDMEtiqueta.cdsParametros_FinZEBRA_TEMPERATURA.AsInteger := 20;
    if fDMEtiqueta.cdsParametros_FinZEBRA_VELOCIDADE.AsInteger <= 0 then
      fDMEtiqueta.cdsParametros_FinZEBRA_VELOCIDADE.AsInteger := 2;
  end;
end;

procedure TfrmEtiqueta_RFID.btnConfirmar_EtiqClick(Sender: TObject);
begin
  if fDMEtiqueta.cdsParametros_Fin.State in [dsEdit,dsInsert] then
  begin
    if fDMEtiqueta.cdsParametros_FinZEBRA_TEMPERATURA.AsInteger <= 0 then
      fDMEtiqueta.cdsParametros_FinZEBRA_TEMPERATURA.AsInteger := 20;
    if fDMEtiqueta.cdsParametros_FinZEBRA_VELOCIDADE.AsInteger <= 0 then
      fDMEtiqueta.cdsParametros_FinZEBRA_TEMPERATURA.AsInteger := 2;
    fDMEtiqueta.cdsParametros_Fin.Post;
    fDMEtiqueta.cdsParametros_Fin.ApplyUpdates(0);
  end;
  btnConfirmar_Etiq.Enabled := False;
  RzGroupBox1.Enabled       := False;
end;

procedure TfrmEtiqueta_RFID.btnImprimirClick(Sender: TObject);
begin
  if not fDMEtiqueta.vProd_Cliente_Exite then
  begin
    MessageDlg('*** Produto/Cor do Cliente não informado em algum item!' , mtError, [mbOk], 0);
    exit;
  end;

  vImprimir := False;
  vSeq := fnc_Ultima_Seq;
  fDMEtiqueta.mEtiqueta_Nav.IndexFieldNames := 'ID_Nota;Item_Nota';
  fDMEtiqueta.mEtiqueta_Nav.First;
  while not fDMEtiqueta.mEtiqueta_Nav.Eof do
  begin
    begin
      if fDMEtiqueta.mEtiqueta_NavSequencia_RFID.AsInteger <= 0 then
      begin
        prc_Grava_Seq_Aux;
        prc_Gravar_RFID;
      end;
    end;
    fDMEtiqueta.mEtiqueta_Nav.Next;
  end;
  if (ckTeste.Checked) and (ckTeste.Visible) then
    vImprimir := True
  else
  begin
    try
      prc_Envio_RFID;
    except
    end;
  end;
  uEtiqueta_Zebra.prc_Etiqueta_ZebraZT410(fDMEtiqueta);
end;

procedure TfrmEtiqueta_RFID.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMEtiqueta.mEtiqueta_NavEnviado.AsString = 'S' then
    Background := clLime
  else
  if (trim(fDMEtiqueta.mEtiqueta_NavProd_Cliente.AsString) = '') or (trim(fDMEtiqueta.mEtiqueta_NavCod_Cor_Cliente.AsString) = '') then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
    fDMEtiqueta.vProd_Cliente_Exite := False;
  end
  else
  if (fDMEtiqueta.mEtiqueta_NavEnviado.AsString = 'N') or (trim(fDMEtiqueta.mEtiqueta_NavEnviado.AsString) = '') then
    Background  := clYellow;
end;

procedure TfrmEtiqueta_RFID.prc_Envio_RFID;
const
  C_Dll : string = 'EnviaRFID.dll';
var
  FHandle: THandle;
  FRoutine: function (const pID: WideString): Boolean;
  Form: TForm;
begin
  vImprimir := False;
  
  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);

  FHandle := LoadLibrary(PAnsiChar(C_Dll));
  try
    FRoutine := GetProcAddress(FHandle, 'EnviarRFID');
    if (Assigned(FRoutine)) then
    begin
      try
        FRoutine(IntToStr(vID_Nota_Local));
        vImprimir := True;
      except
        on E : Exception do
          FreeLibrary(FHandle);
      end;
    end
    else
      raise Exception.Create('Dll não encontrada!');
  finally
    FreeLibrary(FHandle);
    FreeAndNil(Form);
  end;
end;

procedure TfrmEtiqueta_RFID.btnReenvioClick(Sender: TObject);
begin
  if not fDMEtiqueta.vProd_Cliente_Exite then
  begin
    MessageDlg('*** Produto/Cor do Cliente não informado em algum item!' , mtError, [mbOk], 0);
    exit;
  end;
  prc_Envio_RFID;
  fDMEtiqueta.mEtiqueta_Nav.First;
  while not fDMEtiqueta.mEtiqueta_Nav.Eof do
  begin
    fDMEtiqueta.mEtiqueta_Nav.Edit;
    fDMEtiqueta.mEtiqueta_NavEnviado.AsString := fDMEtiqueta.fnc_Verifica_Enviado_BeiraRio(fDMEtiqueta.mEtiqueta_NavSequencia_RFID.AsLargeInt,fDMEtiqueta.mEtiqueta_NavFilial.AsInteger);
    fDMEtiqueta.mEtiqueta_Nav.Post;

    fDMEtiqueta.mEtiqueta_Nav.Next;
  end;

end;

procedure TfrmEtiqueta_RFID.btnExcluirClick(Sender: TObject);
begin
  fDMEtiqueta.mEtiqueta_Nav.EmptyDataSet;
end;

procedure TfrmEtiqueta_RFID.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and not(vJaGerado) then
    prc_Verifica_ItemSemQtdRotulo;
end;

procedure TfrmEtiqueta_RFID.prc_Verifica_ItemSemQtdRotulo;
begin
  if trim(SQLLocate('PARAMETROS_PROD','ID','USA_QTD_ROTULO_RFID','1')) = 'S' then
  begin
    if (fDMEtiqueta.mEtiqueta_Nav.IsEmpty) or not(vJaGerado) then
    begin
      fDMEtiqueta.cdsItemSemQtdRotulo.Close;
      fDMEtiqueta.sdsItemSemQtdRotulo.ParamByName('ID').AsInteger := vID_Nota_Local;
      fDMEtiqueta.cdsItemSemQtdRotulo.Open;
      if not fDMEtiqueta.cdsItemSemQtdRotulo.IsEmpty then
      begin
        frmEtiqueta_RFID_Qtd := TfrmEtiqueta_RFID_Qtd.Create(self);
        frmEtiqueta_RFID_Qtd.fDMEtiqueta  := fDMEtiqueta;
        frmEtiqueta_RFID_Qtd.fDMRFID      := fDMRFID;
        frmEtiqueta_RFID_Qtd.vID_Nota_Qtd := vID_Nota_Local;
        frmEtiqueta_RFID_Qtd.ShowModal;
        FreeAndNil(frmEtiqueta_RFID_Qtd);

        btnGerarClick(nil);
      end;
    end;
  end;
end;

procedure TfrmEtiqueta_RFID.SMDBGrid1DblClick(Sender: TObject);
begin
  prc_Inserir_Produto_Forn;
  frmEtiqueta_RFID_Cli := TfrmEtiqueta_RFID_Cli.Create(self);
  frmEtiqueta_RFID_Cli.fDMRFID := fDMRFID;
  frmEtiqueta_RFID_Cli.lblReferencia.Caption := fDMEtiqueta.mEtiqueta_NavReferencia.AsString;
  frmEtiqueta_RFID_Cli.lblCor.Caption        := fDMEtiqueta.mEtiqueta_NavNome_Cor.AsString;
  frmEtiqueta_RFID_Cli.ShowModal;
  FreeAndNil(frmEtiqueta_RFID_Cli);
  if fDMRFID.cdsProduto_Forn.State in [dsEdit,dsInsert] then
    fDMRFID.cdsProduto_Forn.Cancel
  else
    prc_Grava_ProdCli_Auxiliar;

end;

procedure TfrmEtiqueta_RFID.prc_Inserir_Produto_Forn;
var
  vItemAux : Integer;
begin
  prc_Abrir_Produto_Forn;

  if not fDMRFID.cdsProduto_Forn.IsEmpty then
    fDMRFID.cdsProduto_Forn.Edit
  else
  begin
    fDMRFID.cdsProduto_Forn.Insert;
    fDMRFID.cdsProduto_FornID.AsInteger                := fDMEtiqueta.mEtiqueta_NavID_Produto.AsInteger;
    fDMRFID.cdsProduto_FornITEM.AsInteger              := fnc_Proximo_Item + 1;
    fDMRFID.cdsProduto_FornID_FORNECEDOR.AsInteger     := fDMEtiqueta.mEtiqueta_NavID_Cliente.AsInteger;
    fDMRFID.cdsProduto_FornID_COR.AsInteger            := fDMEtiqueta.mEtiqueta_NavID_Cor.AsInteger;
    fDMRFID.cdsProduto_FornNOME_MATERIAL_FORN.AsString := SQLLocate('PRODUTO','ID','NOME',fDMEtiqueta.mEtiqueta_NavID_Produto.AsString);
  end;
end;

function TfrmEtiqueta_RFID.fnc_Proximo_Item: Integer;
var
  sds: TSQLDataSet;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select max(PF.ITEM) ITEM from PRODUTO_FORN PF where PF.ID = :ID ';
    sds.ParamByName('ID').AsInteger := fDMEtiqueta.mEtiqueta_NavID_Produto.AsInteger;
    sds.Open;
    Result := sds.FieldByName('ITEM').AsInteger;
  finally
    FreeAndNil(sds);
  end
end;

procedure TfrmEtiqueta_RFID.prc_Abrir_Produto_Forn;
begin
  fDMRFID.cdsProduto_Forn.Close;
  fDMRFID.sdsProduto_Forn.ParamByName('ID').AsInteger            := fDMEtiqueta.mEtiqueta_NavID_Produto.AsInteger;
  fDMRFID.sdsProduto_Forn.ParamByName('ID_COR').AsInteger        := fDMEtiqueta.mEtiqueta_NavID_Cor.AsInteger;
  fDMRFID.sdsProduto_Forn.ParamByName('ID_FORNECEDOR').AsInteger := fDMEtiqueta.mEtiqueta_NavID_Cliente.AsInteger;
  fDMRFID.cdsProduto_Forn.Open;
end;

procedure TfrmEtiqueta_RFID.prc_Grava_ProdCli_Auxiliar;
var
  vIDProd, vIDCor : Integer;
  vAux : Boolean;
begin
  vAux := True;
  prc_Abrir_Produto_Forn;
  SMDBGrid1.DisableScroll;
  try
    vIDProd := fDMEtiqueta.mEtiqueta_NavID_Produto.AsInteger;
    vIDCor  := fDMEtiqueta.mEtiqueta_NavID_Cor.AsInteger;

    fDMEtiqueta.mEtiqueta_Nav.First;
    while not fDMEtiqueta.mEtiqueta_Nav.Eof do
    begin
      if (fDMEtiqueta.mEtiqueta_NavID_Produto.AsInteger = vIDProd) and (fDMEtiqueta.mEtiqueta_NavID_Cor.AsInteger = vIDCor) then
      begin
        fDMEtiqueta.mEtiqueta_Nav.Edit;
        fDMEtiqueta.mEtiqueta_NavProd_Cliente.AsString    := fDMRFID.cdsProduto_FornCOD_MATERIAL_FORN.AsString;
        fDMEtiqueta.mEtiqueta_NavCod_Cor_Cliente.AsString := fDMRFID.cdsProduto_FornCOD_COR_FORN.AsString;
        fDMEtiqueta.mEtiqueta_Nav.Post;
      end;
      if (trim(fDMEtiqueta.mEtiqueta_NavProd_Cliente.AsString) = '') or (trim(fDMEtiqueta.mEtiqueta_NavCod_Cor_Cliente.AsString) = '') then
        vAux := False;
      fDMEtiqueta.mEtiqueta_Nav.Next;
    end;
  finally
    SMDBGrid1.EnableScroll;
  end;

  fDMEtiqueta.vProd_Cliente_Exite := vAux;
end;

end.
