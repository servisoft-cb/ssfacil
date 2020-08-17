unit UDMCadConfig_Balanca;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, DBClient, DB, SqlExpr, DmdDatabase;

type
  TDMConfig_Balanca = class(TDataModule)
    sdsConfigBalancaLay: TSQLDataSet;
    dsConfigBalancaLay: TDataSource;
    cdsConfigBalancaLay: TClientDataSet;
    sdsConfigBalanca: TSQLDataSet;
    dsConfigBalanca: TDataSource;
    cdsConfigBalanca: TClientDataSet;
    dspConfigBalanca: TDataSetProvider;
    sdsConfigBalancaLayID: TIntegerField;
    sdsConfigBalancaLayORDEM: TIntegerField;
    sdsConfigBalancaLayCAMPO: TStringField;
    sdsConfigBalancaLayPOSICAO: TIntegerField;
    sdsConfigBalancaLayTAMANHO: TIntegerField;
    sdsConfigBalancaLayPENDENTE: TStringField;
    cdsConfigBalancaLayID: TIntegerField;
    cdsConfigBalancaLayORDEM: TIntegerField;
    cdsConfigBalancaLayCAMPO: TStringField;
    cdsConfigBalancaLayPOSICAO: TIntegerField;
    cdsConfigBalancaLayTAMANHO: TIntegerField;
    cdsConfigBalancaLayPENDENTE: TStringField;
    sdsConfigBalancaID: TIntegerField;
    sdsConfigBalancaDESCRICAO: TStringField;
    sdsConfigBalancaDECIMAIS: TIntegerField;
    sdsConfigBalancaUSA_SEPARADOR: TStringField;
    sdsConfigBalancaTIPO_SEPARADOR: TStringField;
    sdsConfigBalancaNOMEARQ_TXT: TStringField;
    sdsConfigBalancaID_TEXT: TStringField;
    sdsConfigBalancaID_POSICAO: TIntegerField;
    sdsConfigBalancaID_TAMANHO: TIntegerField;
    sdsConfigBalancaCOD_POSICAO: TIntegerField;
    sdsConfigBalancaCOD_TAMANHO: TIntegerField;
    sdsConfigBalancaVLR_POSICAO: TIntegerField;
    sdsConfigBalancaVLR_TAMANHO: TIntegerField;
    sdsConfigBalancaTIPO_PRECO: TStringField;
    cdsConfigBalancaID: TIntegerField;
    cdsConfigBalancaDESCRICAO: TStringField;
    cdsConfigBalancaDECIMAIS: TIntegerField;
    cdsConfigBalancaUSA_SEPARADOR: TStringField;
    cdsConfigBalancaTIPO_SEPARADOR: TStringField;
    cdsConfigBalancaNOMEARQ_TXT: TStringField;
    cdsConfigBalancaID_TEXT: TStringField;
    cdsConfigBalancaID_POSICAO: TIntegerField;
    cdsConfigBalancaID_TAMANHO: TIntegerField;
    cdsConfigBalancaCOD_POSICAO: TIntegerField;
    cdsConfigBalancaCOD_TAMANHO: TIntegerField;
    cdsConfigBalancaVLR_POSICAO: TIntegerField;
    cdsConfigBalancaVLR_TAMANHO: TIntegerField;
    cdsConfigBalancaTIPO_PRECO: TStringField;
    sdsTabelaProduto: TSQLDataSet;
    dsTabelaProduto: TDataSource;
    cdsTabelaProduto: TClientDataSet;
    cdsTabelaProdutoNOME_CAMPO: TStringField;
    cdsMestre: TDataSource;
    dspTabelaProduto: TDataSetProvider;
    cdsConfigBalancasdsConfigBalancaLay: TDataSetField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    vMsgConfig : String;
    ctCommand : String;
    { Public declarations }
    procedure prc_Localizar(ID : Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;

    procedure prc_inserirLayout;
  end;

var
  DMConfig_Balanca: TDMConfig_Balanca;

implementation

{$R *.dfm}

procedure TDMConfig_Balanca.DataModuleCreate(Sender: TObject);
begin
  ctCommand := sdsConfigBalanca.CommandText;
end;

procedure TDMConfig_Balanca.prc_Excluir;
begin
  if not(cdsConfigBalanca.Active) or (cdsConfigBalanca.IsEmpty) then
    exit;
  cdsConfigBalanca.Delete;
  cdsConfigBalanca.ApplyUpdates(0);
end;

procedure TDMConfig_Balanca.prc_Gravar;
begin
  vMsgConfig := '';
  if trim(cdsConfigBalancaDESCRICAO.AsString) = '' then
    vMsgConfig := '*** Descrição não informada!';
  if vMsgConfig <> '' then
    exit;
  cdsConfigBalanca.Post;
  cdsConfigBalanca.ApplyUpdates(0);

end;

procedure TDMConfig_Balanca.prc_Inserir;
var
  vAux : Integer;
begin
  if not cdsConfigBalanca.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('CONFIG_BALANCA',0);

  cdsConfigBalanca.Insert;
  cdsConfigBalancaID.AsInteger := vAux;

end;

procedure TDMConfig_Balanca.prc_inserirLayout;
var
  vItemAux: Integer;
begin
  cdsConfigBalancaLay.Last;
  vItemAux := cdsConfigBalancaLayORDEM.AsInteger;

  cdsConfigBalancaLay.Insert;
  cdsConfigBalancaLayID.AsInteger   := cdsConfigBalancaID.AsInteger;
  cdsConfigBalancaLayORDEM.AsInteger := vItemAux + 1;
end;

procedure TDMConfig_Balanca.prc_Localizar(ID: Integer);
begin
  cdsConfigBalanca.Close;
  sdsConfigBalanca.CommandText := ctCommand;
  if ID <> 0 then
    sdsConfigBalanca.CommandText := sdsConfigBalanca.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsConfigBalanca.Open;
end;

end.
