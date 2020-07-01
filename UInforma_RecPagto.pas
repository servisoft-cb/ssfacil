unit UInforma_RecPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, OleCtnrs, NxCollection, UCBase;

type
  TfrmInforma_RecPagto = class(TForm)
    FilenameEdit1: TFilenameEdit;
    Label1: TLabel;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    btnMostrar: TNxButton;
    OleContainer1: TOleContainer;
    UCControls1: TUCControls;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
  private
    { Private declarations }

    function fnc_Arruma_Nome : String;

  public
    { Public declarations }
  end;

var
  frmInforma_RecPagto: TfrmInforma_RecPagto;

implementation

uses UMenu;

{$R *.dfm}

procedure TfrmInforma_RecPagto.btnConfirmarClick(Sender: TObject);
var
  vArq : String;
begin
  FilenameEdit1.Text := fnc_Arruma_Nome;
  if (trim(FilenameEdit1.Text) <> '')  and (not FileExists(FilenameEdit1.Text)) then
  begin
    MessageDlg('*** Arquivo não encontrado!',mtError, [mbOk], 0);
    exit;
  end;

  Close;
  ModalResult := mrOk;
end;

procedure TfrmInforma_RecPagto.btnCancelarClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TfrmInforma_RecPagto.btnMostrarClick(Sender: TObject);
begin
  FilenameEdit1.Text := fnc_Arruma_Nome;
  if FileExists(FilenameEdit1.Text) then
  begin
    OleContainer1.AutoActivate:= aaGetFocus;
    OleContainer1.CreateLinkToFile(FilenameEdit1.Text,TRUE);
    OleContainer1.SetFocus;
 end
 else
   MessageDlg('Arquivo não encontrado!!!' , mtInformation,[mbOk], 0);
end;

function TfrmInforma_RecPagto.fnc_Arruma_Nome: String;
var
  vArq : String;
begin
  vArq := FilenameEdit1.Text;
  if copy(vArq,1,1) = '"' then
    delete(vArq,1,1);
  if copy(vArq,Length(vArq),1) = '"' then
    delete(vArq,Length(vArq),1);
  Result := vArq;
end;

end.
