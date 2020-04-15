unit UQtdReserva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, NxCollection;

type
  TfrmQtdReserva = class(TForm)
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label2: TLabel;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    vQtdReserva : Real;
    
  end;

var
  frmQtdReserva: TfrmQtdReserva;

implementation

{$R *.dfm}

procedure TfrmQtdReserva.NxButton1Click(Sender: TObject);
begin
  if CurrencyEdit2.Value > CurrencyEdit1.Value then
  begin
    MessageDlg('*** Quantidade de Reserva não pode ser maior que Estoque! ' , mtWarning, [mbOk], 0);
    exit;
  end;
  vQtdReserva := CurrencyEdit2.Value;
  Close;
end;

procedure TfrmQtdReserva.NxButton2Click(Sender: TObject);
begin
  vQtdReserva := -1;
  Close;
end;

end.
