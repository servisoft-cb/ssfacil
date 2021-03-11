unit UEtiqueta_RFID_Cli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxCollection, Grids, DBGrids, SMDBGrid, StdCtrls, DB,
  Mask, DBCtrls, ExtCtrls, UDMRFID;

type
  TfrmEtiqueta_RFID_Cli = class(TForm)
    NxPanel1: TNxPanel;
    Label1: TLabel;
    btnConfirmar: TNxButton;
    Panel2: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    Label3: TLabel;
    lblReferencia: TLabel;
    Label5: TLabel;
    lblCor: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMRFID: TDMRFID;

    vID_Nota_Qtd : Integer;
    
  end;

var
  frmEtiqueta_RFID_Cli: TfrmEtiqueta_RFID_Cli;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmEtiqueta_RFID_Cli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmEtiqueta_RFID_Cli.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMRFID);
  DBEdit2.Setfocus;
end;

procedure TfrmEtiqueta_RFID_Cli.btnConfirmarClick(Sender: TObject);
begin
  if trim(fDMRFID.cdsProduto_FornCOD_MATERIAL_FORN.AsString) = '' then
  begin
    MessageDlg('*** Código do Produto do Cliente não informado!', mtError, [mbOk], 0);
    exit;
  end;
  if trim(fDMRFID.cdsProduto_FornNOME_MATERIAL_FORN.AsString) = '' then
  begin
    MessageDlg('*** Nome do Produto do Cliente não informado!', mtError, [mbOk], 0);
    exit;
  end;

  fDMRFID.cdsProduto_Forn.Post;
  fDMRFID.cdsProduto_Forn.ApplyUpdates(0);
  Close;
end;

end.
