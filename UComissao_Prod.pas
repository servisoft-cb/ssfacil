unit UComissao_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMComissaoProd, Grids, DBGrids, SMDBGrid, RzTabs, NxCollection,
  StdCtrls, Mask, DBCtrls, ExtCtrls, ToolEdit, CurrEdit, SqlExpr, AdvPanel, DB;

type
  TfrmComissao_Prod = class(TForm)
    Panel10: TPanel;
    Label120: TLabel;
    DBEdit59: TDBEdit;
    RzPageControl5: TRzPageControl;
    TS_Comissao_Cli: TRzTabSheet;
    SMDBGrid10: TSMDBGrid;
    TS_Comissao_Vend: TRzTabSheet;
    SMDBGrid11: TSMDBGrid;
    btnAlterar_Comissao: TNxButton;
    NxPanel1: TNxPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    NxButton3: TNxButton;
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    NxButton4: TNxButton;
    NxPanel2: TNxPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Edit2: TEdit;
    CurrencyEdit4: TCurrencyEdit;
    NxButton5: TNxButton;
    NxButton6: TNxButton;
    NxButton7: TNxButton;
    NxButton8: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NxButton1Click(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NxButton2Click(Sender: TObject);
    procedure NxButton4Click(Sender: TObject);
    procedure NxButton3Click(Sender: TObject);
    procedure btnAlterar_ComissaoClick(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NxButton5Click(Sender: TObject);
    procedure NxButton6Click(Sender: TObject);
    procedure NxButton7Click(Sender: TObject);
    procedure NxButton8Click(Sender: TObject);
  private
    { Private declarations }
    fDMComissaoProd: TDMComissaoProd;
    vItem_Com : Integer;

    function fnc_Busca_Cli(ID: Integer) : String;
    procedure prc_scroll(DataSet: TDataSet);
    procedure prc_Limpa;

  public
    { Public declarations }

  end;

var
  frmComissao_Prod: TfrmComissao_Prod;

implementation

uses rsDBUtils, uUtilPadrao, USel_Pessoa, DmdDatabase;

{$R *.dfm}

procedure TfrmComissao_Prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ACtion := Cafree;
end;

procedure TfrmComissao_Prod.FormShow(Sender: TObject);
begin
  fDMComissaoProd := TDMComissaoProd.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMComissaoProd);
  vItem_Com := 0;
  fDMComissaoProd.cdsProduto.IndexFieldNames := 'REFERENCIA';
  fDMComissaoProd.cdsProduto.Open;
  fDMComissaoProd.cdsProduto.AfterScroll := prc_scroll;
  fDMComissaoProd.cdsProduto.Last;
end;

procedure TfrmComissao_Prod.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger > 0 then
  begin
    Edit1.Text := fnc_Busca_Cli(CurrencyEdit1.AsInteger);
    if trim(Edit1.Text) = '' then
    begin
      MessageDlg('*** Código do Cliente não encontrado!', mtError, [mbOk], 0);
      CurrencyEdit1.SetFocus;
      exit;
    end;
  end
  else
    Edit1.SetFocus;
end;

function TfrmComissao_Prod.fnc_Busca_Cli(ID: Integer): String;
var
  sds: TSQLDataSet;
begin
  Result := '';
  sds  := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'SELECT CODIGO, NOME FROM PESSOA WHERE CODIGO = :CODIGO ';
    sds.ParamByName('CODIGO').AsInteger := ID;
    sds.Open;
    if sds.FieldByName('CODIGO').AsInteger > 0 then
      Result := sds.FieldByName('NOME').AsString;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmComissao_Prod.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vCodPessoa_Pos := CurrencyEdit1.AsInteger;
    frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
    frmSel_Pessoa.vTipo_Pessoa := 'C';
    frmSel_Pessoa.ShowModal;
    FreeAndNil(frmSel_Pessoa);
    CurrencyEdit1.AsInteger := vCodPessoa_Pos;
    if CurrencyEdit1.AsInteger > 0 then
      Edit1.Text := fnc_Busca_Cli(CurrencyEdit1.AsInteger);
  end;
end;

procedure TfrmComissao_Prod.NxButton1Click(Sender: TObject);
var
  vItem : Integer;
begin
  if CurrencyEdit1.AsInteger <= 0 then
  begin
    MessageDlg('*** Não foi informado o Cliente !', mtError, [mbOk], 0);
    CurrencyEdit1.SetFocus;
    exit;
  end;
  if CurrencyEdit2.AsInteger <= 0 then
  begin
    MessageDlg('*** Não foi informado o % de Comissão!', mtError, [mbOk], 0);
    CurrencyEdit2.SetFocus;
    exit;
  end;

  if vItem_Com > 0 then
    vItem := vItem_Com
  else
    vItem := 0;

  if (fDMComissaoProd.cdsProduto_Comissao.Locate('ID_CLIENTE',CurrencyEdit1.AsInteger,([Locaseinsensitive]))) and
    (vItem <= 0) then
  begin
    MessageDlg('*** Cliente já lançado!', mtError, [mbOk], 0);
    CurrencyEdit2.SetFocus;
    exit;
  end
  else
  if vItem > 0 then
  begin
    (fDMComissaoProd.cdsProduto_Comissao.Locate('ITEM',vItem ,([Locaseinsensitive])));
    fDMComissaoProd.cdsProduto_Comissao.Edit;
  end
  else
  begin
    fDMComissaoProd.cdsProduto_Comissao.Last;
    vItem := fDMComissaoProd.cdsProduto_ComissaoITEM.AsInteger;
    vItem := vItem + 1;
    fDMComissaoProd.cdsProduto_Comissao.Insert;
    fDMComissaoProd.cdsProduto_ComissaoID.AsInteger := fDMComissaoProd.cdsProdutoID.AsInteger;
    fDMComissaoProd.cdsProduto_ComissaoITEM.AsInteger := vItem;
  end;

  try
    fDMComissaoProd.cdsProduto_ComissaoID_CLIENTE.AsInteger := CurrencyEdit1.AsInteger;
    fDMComissaoProd.cdsProduto_ComissaoPERC_COMISSAO.AsFloat := CurrencyEdit2.Value;
    fDMComissaoProd.cdsProduto_ComissaoNOME.AsString         := Edit1.Text;
    fDMComissaoProd.cdsProduto_Comissao.Post;
    fDMComissaoProd.cdsProduto_Comissao.ApplyUpdates(0);
  except
    on E: exception do
    begin
      MessageDlg('*** Erro ao gravar Produto_Comissao!' + #13 + E.Message , mtError, [mbOk], 0);
    end;
  end;

  fDMComissaoProd.sdsprc_Produto_Comissao.Close;
  fDMComissaoProd.sdsprc_Produto_Comissao.ParamByName('P_ID_PRODUTO').AsInteger := fDMComissaoProd.cdsProdutoID.AsInteger;
  fDMComissaoProd.sdsprc_Produto_Comissao.ParamByName('P_ITEM').AsInteger       := vItem;
  fDMComissaoProd.sdsprc_Produto_Comissao.ExecSQL;

  prc_Limpa;
  CurrencyEdit1.SetFocus;
end;

procedure TfrmComissao_Prod.prc_scroll(DataSet: TDataSet);
begin
  fDMComissaoProd.cdsProduto_Comissao.Close;
  fDMComissaoProd.sdsProduto_Comissao.ParamByName('ID').AsInteger := fDMComissaoProd.cdsProdutoID.AsInteger;
  fDMComissaoProd.cdsProduto_Comissao.Open;

  fDMComissaoProd.cdsProduto_Comissao_Vend.Close;
  fDMComissaoProd.sdsProduto_Comissao_Vend.ParamByName('ID').AsInteger := fDMComissaoProd.cdsProdutoID.AsInteger;
  fDMComissaoProd.cdsProduto_Comissao_Vend.Open;
end;

procedure TfrmComissao_Prod.SMDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F5) then
  begin
    fDMComissaoProd.cdsProduto.AfterScroll := nil;
    fDMComissaoProd.cdsProduto.Close;
    fDMComissaoProd.cdsProduto.Open;
    fDMComissaoProd.cdsProduto.AfterScroll := prc_scroll;
    fDMComissaoProd.cdsProduto.Last;
  end;

end;

procedure TfrmComissao_Prod.NxButton2Click(Sender: TObject);
begin
  if fDMComissaoProd.cdsProduto_Comissao.IsEmpty then
    exit;
  vItem_Com := fDMComissaoProd.cdsProduto_ComissaoITEM.AsInteger;
  CurrencyEdit1.AsInteger := fDMComissaoProd.cdsProduto_ComissaoID_CLIENTE.AsInteger;
  CurrencyEdit2.Value     := fDMComissaoProd.cdsProduto_ComissaoPERC_COMISSAO.AsFloat;
  Edit1.Text              := fDMComissaoProd.cdsProduto_ComissaoNOME.AsString;
  CurrencyEdit1.SetFocus;
end;

procedure TfrmComissao_Prod.NxButton4Click(Sender: TObject);
begin
  prc_Limpa;
  CurrencyEdit1.SetFocus;
end;

procedure TfrmComissao_Prod.prc_Limpa;
begin
  vItem_Com := 0;
  CurrencyEdit1.Clear;
  Edit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  Edit2.Clear;
  CurrencyEdit4.Clear;
end;

procedure TfrmComissao_Prod.NxButton3Click(Sender: TObject);
begin
  if fDMComissaoProd.cdsProduto_Comissao.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir a comissão selecionada?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;
  fDMComissaoProd.cdsProduto_Comissao.Delete;
  fDMComissaoProd.cdsProduto_Comissao.ApplyUpdates(0);
end;

procedure TfrmComissao_Prod.btnAlterar_ComissaoClick(Sender: TObject);
var
  vID : Integer;
begin
  if fDMComissaoProd.cdsProduto.State in [dsEdit] then
  begin
    vID := fDMComissaoProd.cdsProdutoID.AsInteger;
    fDMComissaoProd.cdsProduto.Post;
    fDMComissaoProd.cdsProduto.ApplyUpdates(0);

    fDMComissaoProd.sdsprc_Produto_Comissao_Dir.Close;
    fDMComissaoProd.sdsprc_Produto_Comissao_Dir.ParamByName('P_ID_PRODUTO').AsInteger := vID;
    fDMComissaoProd.sdsprc_Produto_Comissao_Dir.ExecSQL;
    fDMComissaoProd.cdsProduto.Locate('ID',vID,([Locaseinsensitive]));
  end;
end;

procedure TfrmComissao_Prod.CurrencyEdit3Exit(Sender: TObject);
begin
  if CurrencyEdit3.AsInteger > 0 then
  begin
    Edit2.Text := fnc_Busca_Cli(CurrencyEdit3.AsInteger);
    if trim(Edit2.Text) = '' then
    begin
      MessageDlg('*** Código do Vendedor não encontrado!', mtError, [mbOk], 0);
      CurrencyEdit3.SetFocus;
      exit;
    end;
  end
  else
    Edit2.SetFocus;
end;

procedure TfrmComissao_Prod.CurrencyEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vCodPessoa_Pos := CurrencyEdit3.AsInteger;
    frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
    frmSel_Pessoa.vTipo_Pessoa := 'V';
    frmSel_Pessoa.ShowModal;
    FreeAndNil(frmSel_Pessoa);
    CurrencyEdit3.AsInteger := vCodPessoa_Pos;
    if CurrencyEdit3.AsInteger > 0 then
      Edit2.Text := fnc_Busca_Cli(CurrencyEdit3.AsInteger);
  end;
end;

procedure TfrmComissao_Prod.NxButton5Click(Sender: TObject);
var
  vItem : Integer;
begin
  if CurrencyEdit3.AsInteger <= 0 then
  begin
    MessageDlg('*** Não foi informado o Vendedor!', mtError, [mbOk], 0);
    CurrencyEdit3.SetFocus;
    exit;
  end;
  if CurrencyEdit4.AsInteger <= 0 then
  begin
    MessageDlg('*** Não foi informado o % de Comissão!', mtError, [mbOk], 0);
    CurrencyEdit4.SetFocus;
    exit;
  end;

  if vItem_Com > 0 then
    vItem := vItem_Com
  else
    vItem := 0;

  if (fDMComissaoProd.cdsProduto_Comissao_vend.Locate('ID_VENDEDOR',CurrencyEdit3.AsInteger,([Locaseinsensitive]))) and
    (vItem <= 0) then
  begin
    MessageDlg('*** Vendedor já lançado!', mtError, [mbOk], 0);
    CurrencyEdit3.SetFocus;
    exit;
  end
  else
  if vItem > 0 then
  begin
    (fDMComissaoProd.cdsProduto_Comissao_Vend.Locate('ITEM',vItem ,([Locaseinsensitive])));
    fDMComissaoProd.cdsProduto_Comissao_Vend.Edit;
  end
  else
  begin
    fDMComissaoProd.cdsProduto_Comissao_Vend.Last;
    vItem := fDMComissaoProd.cdsProduto_Comissao_VendITEM.AsInteger;
    vItem := vItem + 1;
    fDMComissaoProd.cdsProduto_Comissao_Vend.Insert;
    fDMComissaoProd.cdsProduto_Comissao_VendID.AsInteger := fDMComissaoProd.cdsProdutoID.AsInteger;
    fDMComissaoProd.cdsProduto_Comissao_vendITEM.AsInteger := vItem;
  end;

  try
    fDMComissaoProd.cdsProduto_Comissao_VendID_VENDEDOR.AsInteger := CurrencyEdit3.AsInteger;
    fDMComissaoProd.cdsProduto_Comissao_vendPERC_COMISSAO.AsFloat := CurrencyEdit4.Value;
    fDMComissaoProd.cdsProduto_Comissao_VendNOME.AsString         := Edit2.Text;
    fDMComissaoProd.cdsProduto_Comissao_Vend.Post;
    fDMComissaoProd.cdsProduto_Comissao_Vend.ApplyUpdates(0);
  except
    on E: exception do
    begin
      MessageDlg('*** Erro ao gravar Produto_Comissao_Vend!' + #13 + E.Message , mtError, [mbOk], 0);
    end;
  end;

  fDMComissaoProd.sdsprc_Produto_Comissao_Vend.Close;
  fDMComissaoProd.sdsprc_Produto_Comissao_Vend.ParamByName('P_ID_PRODUTO').AsInteger := fDMComissaoProd.cdsProdutoID.AsInteger;
  fDMComissaoProd.sdsprc_Produto_Comissao_Vend.ParamByName('P_ITEM').AsInteger       := vItem;
  fDMComissaoProd.sdsprc_Produto_Comissao_Vend.ExecSQL;

  prc_Limpa;
  CurrencyEdit3.SetFocus;
end;

procedure TfrmComissao_Prod.NxButton6Click(Sender: TObject);
begin
  if fDMComissaoProd.cdsProduto_Comissao_Vend.IsEmpty then
    exit;
  vItem_Com := fDMComissaoProd.cdsProduto_Comissao_vendITEM.AsInteger;
  CurrencyEdit3.AsInteger := fDMComissaoProd.cdsProduto_Comissao_VendID_VENDEDOR.AsInteger;
  CurrencyEdit4.Value     := fDMComissaoProd.cdsProduto_Comissao_vendPERC_COMISSAO.AsFloat;
  Edit2.Text              := fDMComissaoProd.cdsProduto_Comissao_vendNOME.AsString;
  CurrencyEdit3.SetFocus;
end;

procedure TfrmComissao_Prod.NxButton7Click(Sender: TObject);
begin
  if fDMComissaoProd.cdsProduto_Comissao_Vend.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir a comissão selecionada?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;
  fDMComissaoProd.cdsProduto_Comissao_Vend.Delete;
  fDMComissaoProd.cdsProduto_Comissao_Vend.ApplyUpdates(0);
end;

procedure TfrmComissao_Prod.NxButton8Click(Sender: TObject);
begin
  prc_Limpa;
  CurrencyEdit3.SetFocus;
end;

end.
