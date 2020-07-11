unit UInforma_RecPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, OleCtnrs, NxCollection, UCBase, LogTypes,
  FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TfrmInforma_RecPagto = class(TForm)
    FilenameEdit1: TFilenameEdit;
    Label1: TLabel;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    btnMostrarRec: TNxButton;
    OleContainer1: TOleContainer;
    UCControls1: TUCControls;
    Label2: TLabel;
    FilenameEdit2: TFilenameEdit;
    sdsPedido_Anexo: TSQLDataSet;
    sdsPedido_AnexoID: TIntegerField;
    sdsPedido_AnexoEND_ARQ_PAGTO: TStringField;
    sdsPedido_AnexoEND_ARQ_OC: TStringField;
    dspPedido_Anexo: TDataSetProvider;
    cdsPedido_Anexo: TClientDataSet;
    cdsPedido_AnexoID: TIntegerField;
    cdsPedido_AnexoEND_ARQ_PAGTO: TStringField;
    cdsPedido_AnexoEND_ARQ_OC: TStringField;
    dsPedido_Anexo: TDataSource;
    btnMostrarOC: TNxButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnMostrarRecClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMostrarOCClick(Sender: TObject);
  private
    { Private declarations }

    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

    function fnc_Arruma_Nome(Campo : String) : String;
    procedure prc_Abrir_Pedido_Anexo;
    procedure prc_Mostrar_Arquivo(Nome_Arq : String);
    procedure MoverArquivo(Origem, Destino,Arquivo: String);

  public
    { Public declarations }
    vID_Pedido_Loc : Integer;
    vEND_ARQ_REC_PED : String;

  end;

var
  frmInforma_RecPagto: TfrmInforma_RecPagto;

implementation

uses UMenu, LogProvider, DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfrmInforma_RecPagto.btnConfirmarClick(Sender: TObject);
var
  vArq : String;
begin
  FilenameEdit1.Text := fnc_Arruma_Nome(FilenameEdit1.Text);
  FilenameEdit2.Text := fnc_Arruma_Nome(FilenameEdit2.Text);
  if (trim(FilenameEdit1.Text) <> '')  and (not FileExists(FilenameEdit1.Text)) then
  begin
    MessageDlg('*** Arquivo de Recibo não encontrado!',mtError, [mbOk], 0);
    FilenameEdit1.SetFocus;
    exit;
  end;
  if (trim(FilenameEdit2.Text) <> '')  and (not FileExists(FilenameEdit2.Text)) then
  begin
    MessageDlg('*** Arquivo de OC não encontrado!',mtError, [mbOk], 0);
    FilenameEdit2.SetFocus;
    exit;
  end;

  if trim(FilenameEdit1.Text) <> '' then
  begin
    vArq := FilenameEdit1.Text;
    if (trim(vEND_ARQ_REC_PED) <> '')
      and (ExtractFilePath(FilenameEdit1.Text) <> vEND_ARQ_REC_PED) then
    begin
      try
        MoverArquivo(ExtractFilePath(FilenameEdit1.Text),vEND_ARQ_REC_PED,ExtractFileName(FilenameEdit1.Text));
        FilenameEdit1.Text := vEND_ARQ_REC_PED + ExtractFileName(FilenameEdit1.Text);
      except
      end
    end;
  end;
  if trim(FilenameEdit2.Text) <> '' then
  begin
    vArq := FilenameEdit2.Text;
    if (trim(vEND_ARQ_REC_PED) <> '')
      and (ExtractFilePath(FilenameEdit2.Text) <> vEND_ARQ_REC_PED) then
    begin
      try
        MoverArquivo(ExtractFilePath(FilenameEdit2.Text),vEND_ARQ_REC_PED,ExtractFileName(FilenameEdit2.Text));
        FilenameEdit2.Text := vEND_ARQ_REC_PED + ExtractFileName(FilenameEdit2.Text);
      except
      end
    end;
  end;
  cdsPedido_Anexo.Edit;
  cdsPedido_AnexoID.AsInteger           := vID_Pedido_Loc;
  if trim(FilenameEdit1.Text) <> '' then
    cdsPedido_AnexoEND_ARQ_PAGTO.AsString := FilenameEdit1.Text
  else
    cdsPedido_AnexoEND_ARQ_PAGTO.Clear;
  if trim(FilenameEdit2.Text) <> '' then
    cdsPedido_AnexoEND_ARQ_OC.AsString := FilenameEdit2.Text
  else
    cdsPedido_AnexoEND_ARQ_OC.Clear;
  cdsPedido_Anexo.Post;
  cdsPedido_Anexo.ApplyUpdates(0);
  Close;
end;

procedure TfrmInforma_RecPagto.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInforma_RecPagto.btnMostrarRecClick(Sender: TObject);
begin
  prc_Mostrar_Arquivo(FilenameEdit1.Text);
end;

function TfrmInforma_RecPagto.fnc_Arruma_Nome(Campo : String) : String;
var
  vArq : String;
begin
  vArq := Campo;
  if copy(vArq,1,1) = '"' then
    delete(vArq,1,1);
  if copy(vArq,Length(vArq),1) = '"' then
    delete(vArq,Length(vArq),1);
  Result := vArq;
end;

procedure TfrmInforma_RecPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmInforma_RecPagto.FormCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  //*** Logs Implantado na versï¿½o .353
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
  //***********************
end;

procedure TfrmInforma_RecPagto.FormShow(Sender: TObject);
begin
  FilenameEdit1.ReadOnly := not(btnConfirmar.Visible);
  FilenameEdit2.ReadOnly := not(btnConfirmar.Visible);

  prc_Abrir_Pedido_Anexo;

  FilenameEdit1.Text := cdsPedido_AnexoEND_ARQ_PAGTO.AsString;
  FilenameEdit2.Text := cdsPedido_AnexoEND_ARQ_OC.AsString;
end;

procedure TfrmInforma_RecPagto.prc_Abrir_Pedido_Anexo;
begin
  cdsPedido_Anexo.Close;
  sdsPedido_Anexo.ParamByName('ID').AsInteger := vID_Pedido_Loc;
  cdsPedido_Anexo.Open;
end;

procedure TfrmInforma_RecPagto.prc_Mostrar_Arquivo(Nome_Arq: String);
begin
  Nome_Arq := fnc_Arruma_Nome(Nome_Arq);
  if FileExists(Nome_Arq) then
  begin
    OleContainer1.AutoActivate:= aaGetFocus;
    OleContainer1.CreateLinkToFile(Nome_Arq,TRUE);
    OleContainer1.SetFocus;
 end
 else
   MessageDlg('Arquivo não encontrado!!!' , mtInformation,[mbOk], 0);
end;

procedure TfrmInforma_RecPagto.btnMostrarOCClick(Sender: TObject);
begin
  prc_Mostrar_Arquivo(FilenameEdit2.Text);
end;

procedure TfrmInforma_RecPagto.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TfrmInforma_RecPagto.MoverArquivo(Origem, Destino,
  Arquivo: String);
var
  o, d: PAnsiChar;
begin
  o := PAnsiChar(Origem + Arquivo);
  d := PAnsiChar(Destino + Arquivo);
  MoveFile(o,d);
end;

end.
