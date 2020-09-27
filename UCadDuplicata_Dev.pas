unit UCadDuplicata_Dev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, UDMCadDuplicata, RzPanel, 
  StdCtrls, Buttons, RxLookup, DBCtrls, DB, Mask, RxDBComb, ToolEdit, RXDBCtrl, CurrEdit, NxCollection, Menus, dbXpress;

type
  TfrmCadDuplicata_Dev = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    ceVlrDevolucao: TCurrencyEdit;
    edtHistorico: TEdit;
    DtDevolucao: TDateEdit;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    Edit2: TEdit;
    Label19: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label59: TLabel;
    RxDBLookupCombo12: TRxDBLookupCombo;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ceVlrDevolucaoKeyPress(Sender: TObject; var Key: Char);
    procedure ceAdtoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    
    function fnc_Erro: Boolean;

  public
    { Public declarations }
    fDMCadDuplicata: TDMCadDuplicata;
  end;

var
  frmCadDuplicata_Dev: TfrmCadDuplicata_Dev;

implementation

uses rsDBUtils, uUtilPadrao, UDMUtil, DmdDatabase, uUtilCliente;

{$R *.dfm}

procedure TfrmCadDuplicata_Dev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMCadDuplicata.cdsDuplicata.State in [dsEdit,dsInsert] then
    fDMCadDuplicata.cdsDuplicata.Cancel;
  Action := Cafree;
end;

procedure TfrmCadDuplicata_Dev.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadDuplicata);
  if (fDMCadDuplicata.cdsDuplicataID_VENDEDOR.AsInteger > 0) and (fDMCadDuplicata.cdsVendedor.Locate('CODIGO',fDMCadDuplicata.cdsDuplicataID_VENDEDOR.AsInteger,[loCaseInsensitive])) then
    Edit2.Text := fDMCadDuplicata.cdsVendedorNOME.AsString;
  ceVlrDevolucao.Value := fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat;
end;

function TfrmCadDuplicata_Dev.fnc_Erro: Boolean;
var
  vMsgErro: String;
begin
  Result   := True;
  vMsgErro := '';
  if DtDevolucao.Date <= 10 then
    vMsgErro := vMsgErro + #13 + '*** Data de devolução não informada!';
  if DtDevolucao.Date < fDMCadDuplicata.cdsDuplicataDTEMISSAO.AsDateTime then
    vMsgErro := vMsgErro + #13 + '*** Data de devolução não pode ser menor que a data de emissão!';
  if (ceVlrDevolucao.Value <= 0) then
    vMsgErro := vMsgErro + #13 + '*** Valor de Devolução não informada!';
  if ceVlrDevolucao.Value > StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat)) then
    vMsgErro := vMsgErro + #13 + '*** Valor de Devolução não pode ser maior que o valor do título!';
  if vMsgErro <> '' then
  begin
    MessageDlg(vMsgErro, mtError, [mbOk], 0);
    exit;
  end;
  Result := False;
end;

procedure TfrmCadDuplicata_Dev.ceVlrDevolucaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '.' then
    key := ',';
end;

procedure TfrmCadDuplicata_Dev.ceAdtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '.' then
    key := ',';
end;

procedure TfrmCadDuplicata_Dev.btnConfirmarClick(Sender: TObject);
var
  ID: TTransactionDesc;
  vIDAux: Integer;
  vGravar_Fin: Boolean;
  vComDesconto: String;
  vVlrCheque: Real;
  vVlrAux: Real;
begin
  if fnc_Erro then
    exit;
    
  ID.TransactionID  := 2;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    if not(fDMCadDuplicata.cdsDuplicata.State in [dsEdit,dsInsert]) then
      fDMCadDuplicata.cdsDuplicata.Edit;
    fDMCadDuplicata.cdsDuplicataVLR_DEVOLUCAO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_DEVOLUCAO.AsFloat + ceVlrDevolucao.Value));
    fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadDuplicata.cdsDuplicataVLR_RESTANTE.AsFloat - ceVlrDevolucao.Value));
    fDMCadDuplicata.cdsDuplicata.Post;
    if trim(edtHistorico.Text) = '' then
      edtHistorico.Text := 'DEVOLUÇÃO';
    fDMCadDuplicata.prc_Gravar_Dupicata_Hist('DEV',edtHistorico.Text,ceVlrDevolucao.Value,0,0,0,0,0,0,0,DtDevolucao.Date);
    if fDMCadDuplicata.cdsDuplicata.State in [dsEdit,dsInsert] then
      fDMCadDuplicata.cdsDuplicata.Post;
    fDMCadDuplicata.cdsDuplicata.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  Close;
end;

procedure TfrmCadDuplicata_Dev.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  Close;
end;

end.

