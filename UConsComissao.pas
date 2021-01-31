unit UConsComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadExtComissao, NxCollection, ExtCtrls, StdCtrls, NxEdit,
  Mask, ToolEdit, CurrEdit, RxLookup, Grids, DBGrids, SMDBGrid;

type
  TfrmConsComissao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    NxComboBox1: TNxComboBox;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    NxComboBox2: TNxComboBox;
    Label4: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label5: TLabel;
    Edit1: TEdit;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    Label6: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    ckImpTitulos: TNxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    fDMCadExtComissao: TDMCadExtComissao;

    procedure prc_Consultar;

  public
    { Public declarations }
  end;

var
  frmConsComissao: TfrmConsComissao;

implementation

uses rsDBUtils, StrUtils, UConsComissao_Titulos;

{$R *.dfm}

procedure TfrmConsComissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsComissao.FormShow(Sender: TObject);
begin
  fDMCadExtComissao := TDMCadExtComissao.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadExtComissao);
  fDMCadExtComissao.cdsFilial.Open;
end;

procedure TfrmConsComissao.btnConsultarClick(Sender: TObject);
var
  i : Integer;
begin
  if NxComboBox1.ItemIndex < 1 then
  begin
    MessageDlg('Mês inicial não informado!', mtError, [mbOk], 0);
    NxComboBox1.SetFocus;
    exit;
  end;
  if NxComboBox2.ItemIndex < 1 then
  begin
    MessageDlg('Mês final não informado!', mtError, [mbOk], 0);
    NxComboBox2.SetFocus;
    exit;
  end;
  if CurrencyEdit1.AsInteger <= 2000 then
  begin
    MessageDlg('Ano final não informado!', mtError, [mbOk], 0);
    CurrencyEdit1.SetFocus;
    exit;
  end;
  if CurrencyEdit1.AsInteger > CurrencyEdit2.AsInteger then
  begin
    MessageDlg('Ano inicial maior que final!', mtError, [mbOk], 0);
    CurrencyEdit1.SetFocus;
    exit;
  end;
  if (CurrencyEdit1.AsInteger = CurrencyEdit2.AsInteger) and (NxComboBox1.ItemIndex > NxComboBox2.ItemHeight) then
  begin
    MessageDlg('Mês inicial maior que o final !', mtError, [mbOk], 0);
    CurrencyEdit1.SetFocus;
    exit;
  end;
  fDMCadExtComissao.vImpTitulos := ckImpTitulos.Checked;
  prc_Consultar;

  for i := 1 to SMDBGrid1.ColCount - 2 do
  begin
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'VLR_ENTRADA') then
    begin
      if trim(fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Entrada.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Entrada.Value);

    end;
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'VLR_PAGO') then
    begin
      if trim(fDMCadExtComissao.cdsConsComissao_AnoMesVLR_PAGO.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadExtComissao.cdsConsComissao_AnoMesVLR_PAGO.Value);
    end;
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'SALDO') then
    begin
      if trim(fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Saldo.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Saldo.Value);
    end;
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'VLR_ANTERIOR') then
    begin
      if trim(fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Anterior.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Anterior.Value);
    end;
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'SALDO_MES') then
    begin
      if trim(fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Mes.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Mes.Value);
    end;
    if (UpperCase(SMDBGrid1.Columns[i].FieldName) = 'BASE_COMISSAO') then
    begin
      if trim(fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Base.AsString) = '' then
        SMDBGrid1.Columns[i].FooterValue := 0
      else
        SMDBGrid1.Columns[i].FooterValue := FormatFloat('###,###,###,##0.00',fDMCadExtComissao.cdsConsComissao_AnoMesagTotal_Base.Value);
    end;
  end;
  SMDBGrid1.Refresh;


end;

procedure TfrmConsComissao.prc_Consultar;
var
  vQtdAux, vQtdAux2: Real;
  vComandoAux, vComandoAux2: String;
  i: Integer;
  vTamAux: String;
begin
  fDMCadExtComissao.cdsConsComissao_AnoMes.Close;
  i := PosEx('GROUP',UpperCase(fDMCadExtComissao.ctConsComissao_AnoMes),0);
  vComandoAux  := copy(fDMCadExtComissao.ctConsComissao_AnoMes,i,Length(fDMCadExtComissao.ctConsComissao_AnoMes) - i + 1);
  vComandoAux2 := copy(fDMCadExtComissao.ctConsComissao_AnoMes,1,i-1);
  if RxDBLookupCombo1.Text <> '' then
    vComandoAux2 := vComandoAux2 + ' AND V.FILIAL = :FILIAL ';
  if trim(Edit1.Text) <> '' then
    vComandoAux2 := vComandoAux2 + ' AND V.NOME_VENDEDOR LIKE ' + QuotedStr('%'+':NOME_VENDEDOR'+'%');
  fDMCadExtComissao.sdsConsComissao_AnoMes.CommandText := vComandoAux2 + vComandoAux;
  fDMCadExtComissao.sdsConsComissao_AnoMes.ParamByName('ANOMES1').AsString := FormatFloat('0000',CurrencyEdit1.AsInteger) + FormatFloat('00',NxComboBox1.ItemIndex);
  fDMCadExtComissao.sdsConsComissao_AnoMes.ParamByName('ANOMES2').AsString := FormatFloat('0000',CurrencyEdit2.AsInteger) + FormatFloat('00',NxComboBox2.ItemIndex);
  if RxDBLookupCombo1.Text <> '' then
    fDMCadExtComissao.sdsConsComissao_AnoMes.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
  if trim(Edit1.Text) <> '' then
    fDMCadExtComissao.sdsConsComissao_AnoMes.ParamByName('NOME_VENDEDOR').AsString := Edit1.Text;
  fDMCadExtComissao.cdsConsComissao_AnoMes.Open;
  fDMCadExtComissao.cdsConsComissao_AnoMes.IndexFieldNames := 'ANOMES;NOME_VENDEDOR';
end;

procedure TfrmConsComissao.btnImprimirClick(Sender: TObject);
var
  vArq: String;
  vOpcaoImp : String;
begin
  if not(fDMCadExtComissao.cdsConsComissao_AnoMes.Active) and (fDMCadExtComissao.cdsConsComissao_AnoMes.IsEmpty) then
    Exit;

  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Comissao_AnoMes.fr3';
  if FileExists(vArq) then
    fDMCadExtComissao.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDMCadExtComissao.vImpTitulos := ckImpTitulos.Checked;
  vOpcaoImp := '';
  if RxDBLookupCombo1.Text <> '' then
    vOpcaoImp := vOpcaoImp + '(Filial: ' + RxDBLookupCombo1.Text + ')';
  vOpcaoImp := vOpcaoImp + '(Mês/Ano Inicial: ' + NxComboBox1.Text + '/' + CurrencyEdit1.Text + ')';
  vOpcaoImp := vOpcaoImp + '(Mês/Ano Final: ' + NxComboBox2.Text + '/' + CurrencyEdit2.Text + ')';
  if trim(Edit1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Vendedor: ' + Edit1.Text;
  fDMCadExtComissao.frxReport1.Variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  if ckImpTitulos.Checked then
    fDMCadExtComissao.frxReport1.Variables['ImpTitulos'] := QuotedStr('S')
  else
    fDMCadExtComissao.frxReport1.Variables['ImpTitulos'] := QuotedStr('N');
  fDMCadExtComissao.frxReport1.ShowReport;
end;

procedure TfrmConsComissao.SMDBGrid1DblClick(Sender: TObject);
begin
  if not(fDMCadExtComissao.cdsConsComissao_AnoMes.Active) and (fDMCadExtComissao.cdsConsComissao_AnoMesID_VENDEDOR.AsInteger <= 0) then
    Exit;
  fDMCadExtComissao.prc_Abrir_ConsTitulos(fDMCadExtComissao.cdsConsComissao_AnoMesID_VENDEDOR.AsInteger,
                                          fDMCadExtComissao.cdsConsComissao_AnoMesANO.AsInteger,
                                          fDMCadExtComissao.cdsConsComissao_AnoMesMES.AsInteger);

  frmConsComissao_Titulos := TfrmConsComissao_Titulos.Create(self);
  frmConsComissao_Titulos.lblVendedor.Caption := fDMCadExtComissao.cdsConsComissao_AnoMesNOME_VENDEDOR.AsString;
  frmConsComissao_Titulos.lblMesAno.Caption   := fDMCadExtComissao.cdsConsComissao_AnoMesDESCRICAO_MES.AsString + '/' + fDMCadExtComissao.cdsConsComissao_AnoMesANO.AsString;
  frmConsComissao_Titulos.fDMCadExtComissao   := fDMCadExtComissao;
  frmConsComissao_Titulos.ShowModal;
  FreeAndNil(frmConsComissao_Titulos);
end;

end.
