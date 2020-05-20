unit uCarneRenegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit,
  CurrEdit, NxCollection, Buttons, Grids, DBGrids, SMDBGrid, RxLookup, uDmPagamento, DB, RXDBCtrl;

type
  TfCarneRenegociacao = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Panel3: TPanel;
    brCancelar: TNxButton;
    btConfirmar: TNxButton;
    Label4: TLabel;
    Label1: TLabel;
    btnParcelas: TSpeedButton;
    CurrencyEdit2: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SMDBGrid1: TSMDBGrid;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfirmarClick(Sender: TObject);
    procedure brCancelarClick(Sender: TObject);
    procedure btnParcelasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmPagamento: TDmPagamento;
    
    vIdCliente: Integer;
    vNomeCliente: String;
  end;

var
  fCarneRenegociacao: TfCarneRenegociacao;

implementation

{$R *.dfm}

uses
  uUtilPadrao;

procedure TfCarneRenegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCarneRenegociacao.btConfirmarClick(Sender: TObject);
var
  vArq: string;
begin
  if fDmPagamento.mNegociacao.IsEmpty then
    Exit;

  fDmPagamento.cdsRenegociacao.Insert;
  fDmPagamento.cdsRenegociacaoUSUARIO.AsString      := vUsuario;
  fDmPagamento.cdsRenegociacaoID_CONDPGTO.AsInteger := RxDBLookupCombo1.KeyValue;
  fDmPagamento.cdsRenegociacaoID_PESSOA.AsInteger   := CurrencyEdit1.AsInteger;
  fDmPagamento.cdsRenegociacaoNOME.AsString         := Edit1.Text;
  fDmPagamento.cdsRenegociacaoDATA.AsDateTime       := Date;

  fDmPagamento.cdsRenegociacao.Post;
  fDmPagamento.cdsRenegociacao.ApplyUpdates(0);

  fDmPagamento.mNegociacao.First;
  while not fDmPagamento.mNegociacao.IsEmpty do
  begin
    fDmPagamento.cdsRenegociacaoParc.Insert;
    fDmPagamento.cdsRenegociacaoParcDATA.AsDateTime  := fDmPagamento.mNegociacaoDATA.AsDateTime;
    fDmPagamento.cdsRenegociacaoParcID.AsInteger     := fDmPagamento.cdsRenegociacaoID.AsInteger;
    fDmPagamento.cdsRenegociacaoParcPARC.AsInteger   := fDmPagamento.mNegociacaoPARCELA.AsInteger;
    fDmPagamento.cdsRenegociacaoParcVALOR.AsCurrency := fDmPagamento.mNegociacaoVALOR.AsCurrency;     
    fDmPagamento.prc_InsereDuplicata(fDmPagamento.mNegociacaoDATA.AsDateTime,CurrencyEdit1.AsInteger,
                                     fDmPagamento.mNegociacaoPARCELA.AsInteger,Edit1.Text,fDmPagamento.mNegociacaoVALOR.AsFloat);
    fDmPagamento.cdsRenegociacaoParcID_DUPLICATA.AsInteger := fDmPagamento.cdsDuplicataID.AsInteger;
    fDmPagamento.cdsRenegociacaoParc.Post;
    fDmPagamento.cdsRenegociacaoParc.ApplyUpdates(0);
    fDmPagamento.mNegociacao.Delete;
  end;
  fDmPagamento.vGerou := True;

  fDmPagamento.cdsRenegociacao.Close;
  fDmPagamento.sdsRenegociacao.CommandText := fDmPagamento.ctRenegociacao + ' WHERE 0 = 0 ';
  if fDmPagamento.cdsRenegociacaoParcID.AsInteger > 0 then
    fDmPagamento.sdsRenegociacao.CommandText := fDmPagamento.sdsRenegociacao.CommandText + ' AND ID = ' +
                                                fDmPagamento.cdsRenegociacaoParcID.AsString;
  fDmPagamento.cdsRenegociacao.Open;


  if MessageDlg('Deseja imprimir carnê?',mtConfirmation,[mbNo,mbOK],0) = mrOk then
  begin
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CarneNegociacao.fr3';

    if FileExists(vArq) then
    begin
      fDmPagamento.frxReport1.Report.LoadFromFile(vArq);
      fDmPagamento.frxReport1.ShowReport
    end
    else
      ShowMessage('Relatório não localizado! ' + vArq);
  end;
  Close;
end;

procedure TfCarneRenegociacao.brCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfCarneRenegociacao.btnParcelasClick(Sender: TObject);
var
  vlrParc, vSoma, vDif: Currency;
  i: Word;
  vData: TDateTime;
begin
  fDmPagamento.mNegociacao.EmptyDataSet;
  fDmPagamento.cdsCondPgto.Locate('ID',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
  if (RxDBLookupCombo1.Text = '')  then
    Raise Exception.Create('Condição de pagamento obrigatória!');
  vData := DateEdit1.Date;
  vSoma := 0;

  vlrParc := CurrencyEdit2.Value / fDmPagamento.cdsCondPgtoQTD_PARCELA.AsInteger;
  for i := 1 to fDmPagamento.cdsCondPgtoQTD_PARCELA.AsInteger do
  begin
    fDmPagamento.mNegociacao.Insert;
    fDmPagamento.mNegociacaoDATA.AsDateTime := vData;
    vData := incMonth(vData,1);

    fDmPagamento.mNegociacaoPARCELA.AsInteger := i;
    fDmPagamento.mNegociacaoVALOR.AsString    := FormatFloat('0.00',vlrParc);
    vSoma := vSoma + StrToFloat(FormatFloat('0.00',vlrParc));
    fDmPagamento.mNegociacao.Post;
  end;
  if vSoma <> CurrencyEdit2.Value then
  begin
    vDif := vSoma - CurrencyEdit2.Value;
    fDmPagamento.mNegociacao.Edit;
    fDmPagamento.mNegociacaoVALOR.AsCurrency := fDmPagamento.mNegociacaoVALOR.AsCurrency - vDif;
    fDmPagamento.mNegociacao.Post;
  end;
end;

procedure TfCarneRenegociacao.FormShow(Sender: TObject);
begin
  fDmPagamento.cdsCondPgto.Open;
  fDmPagamento.cdsRenegociacao.Open;
  fDmPagamento.cdsRenegociacaoParc.Open;
  fDmPagamento.vGerou := False;
end;

end.
