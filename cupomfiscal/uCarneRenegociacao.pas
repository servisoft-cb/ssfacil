unit uCarneRenegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, NxCollection;

type
  TfCarneRenegociacao = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    brCancelar: TNxButton;
    btConfirmar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfirmarClick(Sender: TObject);
    procedure brCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCarneRenegociacao: TfCarneRenegociacao;

implementation

{$R *.dfm}

procedure TfCarneRenegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCarneRenegociacao.btConfirmarClick(Sender: TObject);
begin
  if MessageDlg('Deseja imprimir carnê?',mtConfirmation,[mbNo,mbOK],0) = mrOk then
  begin
  
  end;
  Close;
end;

procedure TfCarneRenegociacao.brCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
