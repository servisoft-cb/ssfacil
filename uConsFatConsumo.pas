unit uConsFatConsumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, NxCollection, StdCtrls, Mask, ToolEdit, UDMConsFat, SqlExpr,
  NxEdit, Grids, DBGrids, SMDBGrid, AdvPanel;
  //SysUtils, Classes, FMTBcd, DB, DBClient, Provider, , dbXPress, Math, Messages, Dialogs, LogTypes, Variants, frxClass, frxDBSet;


type
  TfrmConsFatConsumo = class(TForm)
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel1: TNxPanel;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    NxComboBox1: TNxComboBox;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsFat: TDMConsFat;
    vQtdProduto : Real;

    procedure prc_Consultar;
    procedure prc_Le_cdsConsFatConsumo;
    procedure prc_Gravar_mConsumo(ID, ID_Cor : Integer ; Nome, Unidade, Semi, Nome_Cor : String ; Qtd : Real);
    procedure prc_Gerar_Consumo_Semi;

    function fnc_Busca_Qtd : Real;

  public
    { Public declarations }
  end;

var
  frmConsFatConsumo: TfrmConsFatConsumo;

implementation

uses rsDBUtils, DB, DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfrmConsFatConsumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsFatConsumo.prc_Consultar;
begin
  fDMConsFat.cdsConsFatConsumo.Close;
  fDMConsFat.sdsConsFatConsumo.CommandText := fDMConsFat.ctConsFatConsumo;
  if DateEdit1.Date > 10 then
    fDMConsFat.sdsConsFatConsumo.CommandText := fDMConsFat.sdsConsFatConsumo.CommandText +
                                                   ' AND N.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    fDMConsFat.sdsConsFatConsumo.CommandText := fDMConsFat.sdsConsFatConsumo.CommandText +
                                                   ' AND N.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case NxComboBox1.ItemIndex of
    1 : fDMConsFat.sdsConsFatConsumo.CommandText := fDMConsFat.sdsConsFatConsumo.CommandText + ' AND  PROD.TIPO_PRODUCAO = ' + QuotedStr('T');
    2 : fDMConsFat.sdsConsFatConsumo.CommandText := fDMConsFat.sdsConsFatConsumo.CommandText + ' AND  PROD.TIPO_PRODUCAO = ' + QuotedStr('E');
  end;
  fDMConsFat.cdsConsFatConsumo.Open;
end;

procedure TfrmConsFatConsumo.FormShow(Sender: TObject);
begin
  fDMConsFat := TDMConsFat.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsFat);
end;

procedure TfrmConsFatConsumo.prc_Le_cdsConsFatConsumo;
var
  vQtdAux : Real;
begin
  fDMConsFat.mConsumo.EmptyDataSet;
  fDMConsFat.cdsConsFatConsumo.First;
  while not fDMConsFat.cdsConsFatConsumo.Eof do
  begin
    vQtdProduto := fnc_Busca_Qtd;
    if StrToFloat(FormatFloat('0.0000',vQtdProduto)) > 0 then
      vQtdProduto := StrToFloat(FormatFloat('0.0000',vQtdProduto * fDMConsFat.cdsConsFatConsumoQTD.AsFloat))
    else
      vQtdProduto := StrToFloat(FormatFloat('0.0000',fDMConsFat.cdsConsFatConsumoQTD.AsFloat));


    prc_Gravar_mConsumo(fDMConsFat.cdsConsFatConsumoID_MATERIAL.AsInteger,
                        fDMConsFat.cdsConsFatConsumoID_COR.AsInteger, 
                        fDMConsFat.cdsConsFatConsumoNOME_MATERIAL.AsString,
                        UpperCase(fDMConsFat.cdsConsFatConsumoUNIDADE_MAT.AsString),
                        fDMConsFat.cdsConsFatConsumoTIPO_REG.AsString,
                        fDMConsFat.cdsConsFatConsumoNOME_COR_MAT.AsString,
                        vQtdProduto);

    if fDMConsFat.cdsConsFatConsumoTIPO_REG.AsString = 'S' then
      prc_Gerar_Consumo_Semi;

    fDMConsFat.cdsConsFatConsumo.Next;
  end;

end;

function TfrmConsFatConsumo.fnc_Busca_Qtd: Real;
var
  sds: TSQLDataSet;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select UC.qtd from produto_uni puni '
                       + 'inner join unidade_conv uc on puni.unidade = UC.UNIDADE AND UC.item = PUNI.item_unidade '
                       + ' where puni.id = :ID_PRODUTO and  UC.unidade = :UNIDADE_PROD AND UC.unidade_conv = :UNIDADE_NOTA ';
    sds.ParamByName('ID_PRODUTO').AsInteger  := fDMConsFat.cdsConsFatConsumoID_PRODUTO.AsInteger;
    sds.ParamByName('UNIDADE_PROD').AsString := fDMConsFat.cdsConsFatConsumoUNIDADE_PROD.AsString;
    sds.ParamByName('UNIDADE_NOTA').AsString := fDMConsFat.cdsConsFatConsumoUNIDADE_NOTA.AsString;
    sds.Open;
    Result := StrToFloat(FormatFloat('0.0000',sds.FieldByName('qtd').AsFloat));
  finally
    FreeAndNil(sds);
  end;

end;

procedure TfrmConsFatConsumo.btnConsultarClick(Sender: TObject);
var
  Form : TForm;
begin
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** É obrigatório informar a data inicial e final!',mtInformation,[mbOk],0);
    Exit;
  end;
  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);
  try
    SMDBGrid1.DisableScroll;
    prc_Consultar;
    prc_Le_cdsConsFatConsumo;
  finally
    SMDBGrid1.EnableScroll;
    FreeAndNil(Form);
  end;
end;

procedure TfrmConsFatConsumo.prc_Gerar_Consumo_Semi;
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select PCM.ID_MATERIAL, PCM.UNIDADE, PCM.QTD_CONSUMO, MAT.NOME NOME_MATERIAL, PCM.ID_COR, COMB.NOME NOME_COR '
                       + 'from PRODUTO_COMB PCOMB '
                       + 'inner join PRODUTO_COMB_MAT PCM on (PCOMB.ID = PCM.ID and PCOMB.ITEM = PCM.ITEM) '
                       + 'inner join PRODUTO MAT on MAT.ID = PCM.ID_MATERIAL '
                       + 'left join COMBINACAO COMB on PCM.ID_COR = COMB.ID '
                       + 'where PCOMB.ID = :ID and '
                       + '      PCOMB.ID_COR_COMBINACAO = :ID_COR_COMBINACAO ';
    sds.ParamByName('ID').AsInteger                := fDMConsFat.cdsConsFatConsumoID_PRODUTO.AsInteger;
    sds.ParamByName('ID_COR_COMBINACAO').AsInteger := fDMConsFat.cdsConsFatConsumoID_COR.AsInteger;
    sds.Open;

    while not sds.Eof do
    begin
      prc_Gravar_mConsumo(sds.FieldByName('ID_MATERIAL').AsInteger,
                          sds.FieldByName('ID_COR').AsInteger,
                          sds.FieldByName('NOME_MATERIAL').AsString,
                          UpperCase(sds.FieldByName('UNIDADE').AsString),
                          'N',
                          UpperCase(sds.FieldByName('NOME_COR').AsString),
                          vQtdProduto);
      sds.Next;
    end;

  finally
    FreeAndNil(sds);
  end;

end;

procedure TfrmConsFatConsumo.prc_Gravar_mConsumo(ID, ID_Cor : Integer ; Nome, Unidade, Semi, Nome_Cor : String ; Qtd : Real);
var
  vQtdAux : Real;  
begin
  if fDMConsFat.mConsumo.Locate('ID_Material;ID_Cor;Unidade',VarArrayOf([ID,ID_Cor,Unidade]),[locaseinsensitive]) then
    fDMConsFat.mConsumo.Edit
  else
  begin
    fDMConsFat.mConsumo.Insert;
    fDMConsFat.mConsumoID_Material.AsInteger  := ID;
    fDMConsFat.mConsumoNome_Material.AsString := Nome;
    fDMConsFat.mConsumoID_Cor.AsInteger       := ID_Cor;
    fDMConsFat.mConsumoNome_Cor.AsString      := Nome_Cor;
    fDMConsFat.mConsumoUnidade.AsString       := Unidade;
    if Semi = 'S' then
      fDMConsFat.mConsumoSemi.AsString := 'S'
    else
      fDMConsFat.mConsumoSemi.AsString := 'N';
    fDMConsFat.mConsumoQtd.AsFloat := 0;
  end;
  vQtdAux := StrToFloat(FormatFloat('0.0000',fDMConsFat.cdsConsFatConsumoQTD_CONSUMO.AsFloat * Qtd));
  fDMConsFat.mConsumoQtd.AsFloat := fDMConsFat.mConsumoQtd.AsFloat + vQtdAux;
  fDMConsFat.mConsumo.Post;
  if Semi = 'S' then
    vQtdProduto := StrToFloat(FormatFloat('0.0000',vQtdAux));
end;

procedure TfrmConsFatConsumo.btnImprimirClick(Sender: TObject);
var
  vOpcaoAux : String;
  vArq : String;
begin
  vOpcaoAux := '';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoAux := vOpcaoAux + '(Dt.Fatura: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')';
  case NxComboBox1.ItemIndex of
    1 : vOpcaoAux := vOpcaoAux + ' (Trançadeira)';
    2 : vOpcaoAux := vOpcaoAux + ' (Tear)';
  end;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Faturamento_Consumo.fr3';
  if FileExists(vArq) then
    fDMConsFat.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMConsFat.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoAux);
  fDMConsFat.frxReport1.ShowReport;
end;

end.
