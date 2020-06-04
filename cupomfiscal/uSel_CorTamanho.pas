unit uSel_CorTamanho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, uDmCupomFiscal,
  NxCollection, ExtCtrls, RxLookup, StdCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TfSel_CorTamanho = class(TForm)
    Panel1: TPanel;
    btConfirmar: TNxButton;
    brCancelar: TNxButton;
    Label1: TLabel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure brCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    vProd: Integer;
  end;

var
  fSel_CorTamanho: TfSel_CorTamanho;

implementation

{$R *.dfm}

procedure TfSel_CorTamanho.brCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfSel_CorTamanho.btConfirmarClick(Sender: TObject);
begin
  if (not fDmCupomFiscal.cdsCombinacao.IsEmpty) and (RxDBLookupCombo1.Text = 'Nenhum') then
  begin
    ShowMessage('Cor deve ser selecionada para este produto!');
    RxDBLookupCombo1.SetFocus;
    Exit;
  end;
  if RxDBLookupCombo1.Text <> 'Nenhum' then
  begin
    fDmCupomFiscal.vIdCombinacao := RxDBLookupCombo1.KeyValue;
    fDmCupomFiscal.vCombinacao   := RxDBLookupCombo1.Text;
  end;
  if (not fDmCupomFiscal.cdsTamanho.IsEmpty) and (RxDBLookupCombo2.Text = 'Nenhum') then
  begin
    ShowMessage('Tamanho deve ser selecionado para este produto!');
    RxDBLookupCombo2.SetFocus;
    Exit;
  end;
  if RxDBLookupCombo2.Text <> 'Nenhum' then
    fDmCupomFiscal.vTamanho := RxDBLookupCombo2.KeyValue;
  Close;
end;

procedure TfSel_CorTamanho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfSel_CorTamanho.FormShow(Sender: TObject);
begin
  fdmCupomFiscal.cdsCombinacao.Close;
  fdmCupomFiscal.sdsCombinacao.ParamByName('P1').AsInteger := vProd;
  fdmCupomFiscal.cdsCombinacao.Open;

  fdmCupomFiscal.cdsTamanho.Close;
  fdmCupomFiscal.sdsTamanho.ParamByName('P1').AsInteger := vProd;
  fdmCupomFiscal.cdsTamanho.Open;     
end;

procedure TfSel_CorTamanho.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    btConfirmarClick(Sender);
end;

end.
