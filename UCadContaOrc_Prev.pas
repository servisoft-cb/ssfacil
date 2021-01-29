unit UCadContaOrc_Prev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils, Dialogs, UDMCadContaOrc, Mask,
  db, RxLookup, StdCtrls, ToolEdit, CurrEdit, NxCollection, ExtCtrls, RXDBCtrl, Buttons, UCadCondPgto, dbXpress,
  Grids, DBGrids, SMDBGrid, NxEdit;

type
  TfrmCadContaOrc_Prev = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label17: TLabel;
    DateEdit1: TDateEdit;
    NxPanel1: TNxPanel;
    btnGerar: TNxButton;
    NxComboBox1: TNxComboBox;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label4: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
    vTipo_ES: String;
    vFilial: Integer;
    vNumNota: Integer;
    vSerie: String;
    vDtVencimentoIni, vData, vDtEmissao: TDateTime;
    vVlrParcela: Real;
    vPerc_Comissao: Real;
    vID_Vendedor, vID_Cliente: Integer;
    vID_Conta, vID_Conta_Boleto: Integer;
    vID_TipoCobranca: Integer;
    vID_ContaOrcamento: Integer;
    vObs: String;
    vParcela: Integer;
    vQtdDupl: Real;
    vAno_Comp, vMes_Comp : Integer;
    vItem : Integer;

    procedure prc_mGerarPrev;
  public
    { Public declarations }
    fDMCadContaOrc: TDMCadContaOrc;
  end;

var
  frmCadContaOrc_Prev: TfrmCadContaOrc_Prev;

implementation

uses rsDBUtils, DmdDatabase;

{$R *.dfm}

procedure TfrmCadContaOrc_Prev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadContaOrc_Prev.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadContaOrc);
end;

procedure TfrmCadContaOrc_Prev.prc_mGerarPrev;
begin
  vItem := vItem + 1;
  fDMCadContaOrc.cdsContaOrc_Prev.Insert;
  fDMCadContaOrc.cdsContaOrc_PrevID.AsInteger   := fDMCadContaOrc.cdsContaOrcID.AsInteger;
  fDMCadContaOrc.cdsContaOrc_PrevITEM.AsInteger := vItem;
  fDMCadContaOrc.cdsContaOrc_PrevDTVENCIMENTO.AsDateTime := vData;
  case NxComboBox1.ItemIndex of
    0 : fDMCadContaOrc.cdsContaOrc_PrevTIPO.AsString := 'A';
    1 : fDMCadContaOrc.cdsContaOrc_PrevTIPO.AsString := 'M';
  end;
  fDMCadContaOrc.cdsContaOrc_PrevANO_REF.AsInteger := vAno_Comp;
  fDMCadContaOrc.cdsContaOrc_PrevMES_REF.AsInteger := vMes_Comp;
  fDMCadContaOrc.cdsContaOrc_PrevVLR_PREVISAO.AsFloat := StrToFloat(FormatFloat('0.00',vVlrParcela));
  fDMCadContaOrc.cdsContaOrc_Prev.Post;

  {fDMCadContaOrc.mGerarPrev.Insert;
  fDMCadContaOrc.mGerarPrevDtVencimento.AsDateTime := vData;
  fDMCadContaOrc.mGerarPrevVlrParcela.AsFloat      := StrToFloat(FormatFloat('0.00',vVlrParcela));
  fDMCadContaOrc.mGerarPrevAno.AsInteger           := vAno_Comp;
  fDMCadContaOrc.mGerarPrevMes.AsInteger           := vMes_Comp;
  case NxComboBox1.ItemIndex of
    0 : fDMCadContaOrc.mGerarPrevTipo.AsString := 'A';
    1 : fDMCadContaOrc.mGerarPrevTipo.AsString := 'M';
  end;
  fDMCadContaOrc.mGerarPrev.Post;}
end;

procedure TfrmCadContaOrc_Prev.btnGerarClick(Sender: TObject);
var
  i: Integer;
  vDtAux: TDateTime;
  vDiasIn: Integer;
  vDiasAux2: Integer;
  vDiaIni: Integer;
  vDataOrig: TDateTime;
begin
  vItem := fDMCadContaOrc.fnc_proximo_Item_Prev(fDMCadContaOrc.cdsContaOrcID.AsInteger);
  fDMCadContaOrc.prc_Abrir_ContaoOrc_Prev(fDMCadContaOrc.cdsContaOrcID.AsInteger,CurrencyEdit4.AsInteger);

  if (NxComboBox1.ItemIndex = 1) and (DateEdit1.Date < 10) then
  begin
    MessageDlg('*** Data de vencimento não informada!', mtError, [mbOk], 0);
    DateEdit1.SetFocus;
    exit;
  end;
  if (CurrencyEdit2.AsInteger <= 0) or (CurrencyEdit2.AsInteger > 12) then
  begin
    MessageDlg('*** Mês incorreto!', mtError, [mbOk], 0);
    CurrencyEdit2.SetFocus;
    exit;
  end;
  if (CurrencyEdit4.AsInteger <= 2015) then 
  begin
    MessageDlg('*** Ano incorreto!', mtError, [mbOk], 0);
    CurrencyEdit4.SetFocus;
    exit;
  end;
  if CurrencyEdit1.Value <= 0 then
  begin
    MessageDlg('*** Valor não informado!', mtError, [mbOk], 0);
    CurrencyEdit1.SetFocus;
    exit;
  end;
  if CurrencyEdit3.AsInteger <= 0 then
  begin
    MessageDlg('*** Qtd. de Parcela não informada!', mtError, [mbOk], 0);
    CurrencyEdit3.SetFocus;
    exit;
  end;

  try
    vDtVencimentoIni := DateEdit1.Date;
    vVlrParcela      := CurrencyEdit1.Value;
    vDiaIni          := DayOf(vDtVencimentoIni);
    vData            := vDtVencimentoIni;
    i := 0;
    vAno_Comp := CurrencyEdit4.AsInteger;
    vMes_Comp := CurrencyEdit2.AsInteger;
    while i < CurrencyEdit3.AsInteger do
    begin
      prc_mGerarPrev;
      if vMes_Comp > 0 then
        vMes_Comp := vMes_Comp + 1;
      if vMes_Comp > 12 then
      begin
        vAno_Comp := vAno_Comp + 1;
        vMes_Comp := 01;
      end;
      vParcela := vParcela + 1;
      vData := IncMonth(vData);
      if vDiaIni <> DayOf(vData) then
      begin
        if DaysInMonth(vData) > DayOf(vData) then
          vData := EncodeDate(YearOf(vData),MonthOf(vData),vDiaIni);
      end;
      i := i + 1;
    end;
  except
    raise;
  end;
  Close;
end;

end.
