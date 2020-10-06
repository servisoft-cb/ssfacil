unit UCadProduto_Saldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadProduto, StdCtrls, Mask, ToolEdit, CurrEdit, NxCollection, DB;

type
  TfrmCadProduto_Saldo = class(TForm)
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label4: TLabel;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMCadProduto: TDMCadProduto;

  end;

var
  frmCadProduto_Saldo: TfrmCadProduto_Saldo;

implementation

uses rsDBUtils, UDMEstoque;

{$R *.dfm}

procedure TfrmCadProduto_Saldo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadProduto_Saldo.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadProduto);

  if fDMCadProduto.cdsProduto_SaldoDATA.AsDateTime > 10 then
    DateEdit1.Date := fDMCadProduto.cdsProduto_SaldoDATA.AsDateTime
  else
    DateEdit1.Date := Date;
  CurrencyEdit2.Value := fDMCadProduto.cdsProduto_SaldoQTD.AsFloat;
  CurrencyEdit2.SetFocus;
end;

procedure TfrmCadProduto_Saldo.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadProduto_Saldo.btnConfirmarClick(Sender: TObject);
var
  fDMEstoque: TDMEstoque;
  vID_Estoque : Integer;
begin
  if CurrencyEdit2.Value <= 0 then
  begin
    MessageDlg('*** Quantidade não informada!', mtError, [mbOk], 0);
    exit;
  end;
  if DateEdit1.Date <= 10 then
  begin
    MessageDlg('*** Data não informada!', mtError, [mbOk], 0);
    exit;
  end;
  if fDMCadProduto.cdsProduto_SaldoID.AsInteger > 0 then
    fDMCadProduto.cdsProduto_Saldo.Edit
  else
  begin
    fDMCadProduto.cdsProduto_Saldo.Insert;
    fDMCadProduto.cdsProduto_SaldoID.AsInteger := fDMCadProduto.cdsProdutoID.AsInteger;
  end;
  fDMCadProduto.cdsProduto_SaldoDATA.AsDateTime := DateEdit1.Date;
  fDMCadProduto.cdsProduto_SaldoQTD.AsFloat     := CurrencyEdit2.Value;
  fDMEstoque := TDMEstoque.Create(fDMEstoque);
  fDMCadProduto.cdsFilial.First;

  try
    vID_Estoque := fDMEstoque.fnc_Gravar_Estoque(fDMCadProduto.cdsProduto_SaldoID_MOVESTOQUE.AsInteger,
                                                 fDMCadProduto.cdsFilialID.AsInteger,
                                                 1,
                                                 fDMCadProduto.cdsProduto_SaldoID.AsInteger,
                                                 0,
                                                 0,
                                                 0,
                                                 0,0,
                                                 'E','SLD',
                                                 fDMCadProduto.cdsProdutoUNIDADE.AsString,
                                                 fDMCadProduto.cdsProdutoUNIDADE.AsString,
                                                 '',
                                                 '',
                                                 fDMCadProduto.cdsProduto_SaldoDATA.AsDateTime,
                                                 fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat,
                                                 fDMCadProduto.cdsProduto_SaldoQTD.AsFloat,
                                                 0,
                                                 fDMCadProduto.cdsProdutoPERC_IPI.AsFloat,
                                                 0,
                                                 0,
                                                 0,
                                                 fDMCadProduto.cdsProduto_SaldoQTD.AsFloat,
                                                 fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat,
                                                 0,0,fDMCadProduto.cdsProdutoUNIDADE.AsString,
                                                 0,
                                                 '','S',
                                                 fDMCadProduto.cdsProdutoPRECO_CUSTO.AsFloat,0,0,0,
                                                 0,0,0);

    if fDMCadProduto.cdsProduto_Saldo.State in [dsEdit,dsInsert] then
      fDMCadProduto.cdsProduto_Saldo.Edit;
    fDMCadProduto.cdsProduto_SaldoID_MOVESTOQUE.AsInteger := vID_Estoque;
    fDMCadProduto.cdsProduto_Saldo.Post;
    fDMCadProduto.cdsProduto_Saldo.ApplyUpdates(0);

  finally
    FreeAndNil(fDMEstoque);
  end;

  Close;

end;

end.
