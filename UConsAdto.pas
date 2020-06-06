unit UConsAdto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, NxCollection, Grids, DBGrids, SMDBGrid, UDMConsFinanceiro,
  StdCtrls;

type
  TfrmConsAdto = class(TForm)
    Panel1: TPanel;
    btnConsultar: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsFinanceiro: TDMConsFinanceiro;

  public
    { Public declarations }
  end;

var
  frmConsAdto: TfrmConsAdto;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmConsAdto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsAdto.FormShow(Sender: TObject);
begin
  fDMConsFinanceiro := TDMConsFinanceiro.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsFinanceiro);
  if trim(Edit1.Text) <> '' then
    btnConsultarClick(Sender);
end;

procedure TfrmConsAdto.btnConsultarClick(Sender: TObject);
begin
  fDMConsFinanceiro.cdsConsAdto_Saldo.Close;
  fDMConsFinanceiro.sdsConsAdto_Saldo.CommandText := fDMConsFinanceiro.ctConsAdto_Saldo;
  if trim(Edit1.Text) <> '' then
    fDMConsFinanceiro.sdsConsAdto_Saldo.CommandText := fDMConsFinanceiro.sdsConsAdto_Saldo.CommandText
                                                     + ' WHERE P.NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  fDMConsFinanceiro.cdsConsAdto_Saldo.Open;
end;

end.
