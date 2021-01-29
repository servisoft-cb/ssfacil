unit UInformeEndereco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, NxCollection;

type
  TfrmInformeEndereco = class(TForm)
    DirectoryEdit1: TDirectoryEdit;
    Label1: TLabel;
    NxButton1: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeEndereco: TfrmInformeEndereco;

implementation

uses uUtilPadrao;

{$R *.dfm}

procedure TfrmInformeEndereco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmInformeEndereco.NxButton1Click(Sender: TObject);
begin
  if trim(DirectoryEdit1.Text) = '' then
    vEndereco_Arq := ExtractFilePath(Application.ExeName)
  else
    vEndereco_Arq := DirectoryEdit1.Text;
  Close;
end;

end.
