unit UConsPedido_Res;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsPedidoRes, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit,
  NxCollection, RzTabs, Grids, DBGrids, SMDBGrid;

type
  TfrmConsPedido_Res = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    btnConsultar: TNxButton;
    RzPageControl1: TRzPageControl;
    TS_Detalhada: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsPedidoRes: TDMConsPedidoRes;

    procedure prc_ConsProduto_Ped;

  public
    { Public declarations }
  end;

var
  frmConsPedido_Res: TfrmConsPedido_Res;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmConsPedido_Res.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMConsPedidoRes);
  Action := Cafree;
end;

procedure TfrmConsPedido_Res.FormShow(Sender: TObject);
begin
  fDMConsPedidoRes := TDMConsPedidoRes.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedidoRes);
end;

procedure TfrmConsPedido_Res.btnConsultarClick(Sender: TObject);
begin
  prc_ConsProduto_Ped;
end;

procedure TfrmConsPedido_Res.prc_ConsProduto_Ped;
var
  vComando : String;
begin
  vComando := '';
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + ' AND NUM_PEDIDO = ' + IntToStr(CurrencyEdit1.AsInteger);
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND NOME_CLIENTE LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + ' AND ID_PRODUTO = ' + IntToStr(CurrencyEdit2.AsInteger);
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND REFERENCIA LIKE ' + QuotedStr('%'+Edit2.Text+'%');
  if trim(Edit3.Text) <> '' then
    vComando := vComando + ' AND NOME_PRODUTO LIKE ' + QuotedStr('%'+Edit3.Text+'%');
  vComando := fDMConsPedidoRes.ctConsProduto_Ped + vComando;
  fDMConsPedidoRes.cdsConsProduto_Ped.Close;
  fDMConsPedidoRes.sdsConsProduto_Ped.CommandText := vComando;
  fDMConsPedidoRes.cdsConsProduto_Ped.Open;
end;

end.
