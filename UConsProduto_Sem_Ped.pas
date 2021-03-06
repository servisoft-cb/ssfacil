unit UConsProduto_Sem_Ped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, UDMConsPedido, UCBase, Mask, ToolEdit, RzButton, NxCollection,
  RzTabs, UDMCadPessoa;

type
  TfrmConsProduto_Sem_Ped = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    RzPageControl1: TRzPageControl;
    TS_Produto: TRzTabSheet;
    TS_Clientes: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    Panel3: TPanel;
    btnInativar: TNxButton;
    UCControls1: TUCControls;
    Label2: TLabel;
    ComboBox1: TComboBox;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnInativarClick(Sender: TObject);
    procedure SMDBGrid2TitleClick(Column: TColumn);
  private
    { Private declarations }
    fDMConsPedido: TDMConsPedido;
    ColunaOrdenada: String;

    procedure prc_Consultar;
    procedure prc_Consultar_Cli;

  public
    { Public declarations }
  end;

var
  frmConsProduto_Sem_Ped: TfrmConsProduto_Sem_Ped;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, StrUtils;

{$R *.dfm}

procedure TfrmConsProduto_Sem_Ped.btnConsultarClick(Sender: TObject);
var
  Form : TForm;
begin
  if DateEdit1.Date <= 10 then
  begin
    MessageDlg('*** Data de in�cio da verifica��o n�o informada!', mtError, [mbOk], 0);
    Exit;
  end;
  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);
  
  if RzPageControl1.ActivePage = TS_Produto then
    prc_Consultar
  else
    prc_Consultar_Cli;
  FreeAndNil(Form);
end;

procedure TfrmConsProduto_Sem_Ped.prc_Consultar;
var
  vComando : String;
begin
  fDMConsPedido.cdsProduto_Sem_Venda.Close;
  Refresh;
  if ComboBox1.ItemIndex = 0 then
  begin
    vComando := 'SELECT V.* FROM vult_produto_ped V '
              + 'WHERE NOT EXISTS (SELECT 1 FROM vult_produto_ped V2 '
              + '                   WHERE V.ID = V2.ID '
              + '                    AND V.dtemissao >= :DATA ) ';
  end
  else
  begin
    vComando := 'SELECT V.* FROM vult_produto_nota V '
              + 'WHERE NOT EXISTS (SELECT 1 FROM vult_produto_nota V2 '
              + '                   WHERE V.ID = V2.ID '
              + '                    AND V.dtemissao >= :DATA ) ';
  end;
  fDMConsPedido.sdsProduto_Sem_Venda.CommandText := vComando;
  fDMConsPedido.sdsProduto_Sem_Venda.ParamByName('DATA').AsDate := DateEdit1.Date;
  fDMConsPedido.cdsProduto_Sem_Venda.Open;
end;

procedure TfrmConsProduto_Sem_Ped.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsProduto_Sem_Ped.FormShow(Sender: TObject);
begin
  fDMConsPedido := TDMConsPedido.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedido);
  Label5.Caption := 'Data in�cio sem vendas, at� ' + DateToStr(Date) + ':';
end;

procedure TfrmConsProduto_Sem_Ped.SMDBGrid1TitleClick(Column: TColumn);
var
  i : Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsPedido.cdsProduto_Sem_Venda.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsProduto_Sem_Ped.btnImprimirClick(Sender: TObject);
var
  vArq : String;
  vNome : String;
begin
  if RzPageControl1.ActivePage = TS_Produto then
    vNome := 'Produto'
  else
    vNome := 'Cliente';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\'+vNome+'_Sem_Ped.fr3';
  if FileExists(vArq) then
    fDMConsPedido.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio n�o localizado! ' + vArq);
    Exit;
  end;
  fDMConsPedido.frxReport1.variables['Opcao_Imp'] := QuotedStr(DateEdit1.Text);
  if ComboBox1.ItemIndex = 0 then
    fDMConsPedido.frxReport1.variables['Opcao_Cab'] := QuotedStr('Relat�rio de ' + vNome +'s Sem Vendas (Pedidos)   Dt. Inicial:')
  else
    fDMConsPedido.frxReport1.variables['Opcao_Cab'] := QuotedStr('Relat�rio de ' + vNome + 's Sem Vendas (Notas)   Dt. Inicial:');
  fDMConsPedido.frxReport1.ShowReport;
end;

procedure TfrmConsProduto_Sem_Ped.prc_Consultar_Cli;
var
  vComando : String;
begin
  fDMConsPedido.cdsCliente_Sem_Venda.Close;
  Refresh;
  if ComboBox1.ItemIndex = 0 then
  begin
    vComando := 'select V.* from vult_pessoa_ped V '
              + 'WHERE not exists (select 1 from vult_pessoa_ped v2 where v.codigo = v2.codigo and v2.dtult_emissao >= :DATA ) ';
  end
  else
  begin
    vComando := 'select V.* from vult_pessoa_nota V '
              + 'WHERE not exists (select 1 from vult_pessoa_nota v2 where v.codigo = v2.codigo and v2.dtult_emissao >= :DATA ) ';
  end;
  fDMConsPedido.sdsCliente_Sem_Venda.CommandText := vComando;
  fDMConsPedido.sdsCliente_Sem_Venda.ParamByName('DATA').AsDate := DateEdit1.Date;
  fDMConsPedido.cdsCliente_Sem_Venda.Open;
end;

procedure TfrmConsProduto_Sem_Ped.btnInativarClick(Sender: TObject);
var
  fDMCadPessoa: TDMCadPessoa;
begin
  fDMCadPessoa := TDMCadPessoa.Create(Self);
  try
    fDMConsPedido.cdsCliente_Sem_Venda.First;
    while not fDMConsPedido.cdsCliente_Sem_Venda.Eof do
    begin
      if (SMDBGrid2.SelectedRows.CurrentRowSelected) then
      begin
        fDMCadPessoa.prc_Localizar(fDMConsPedido.cdsCliente_Sem_VendaCODIGO.AsInteger);
        if fDMCadPessoa.cdsPessoaCODIGO.AsInteger > 0 then
        begin
          fDMCadPessoa.cdsPessoa.Edit;
          fDMCadPessoa.cdsPessoaINATIVO.AsString := 'S';
          fDMCadPessoa.cdsPessoa.Post;
          fDMCadPessoa.cdsPessoa.ApplyUpdates(0);
        end;
      end;
      fDMConsPedido.cdsCliente_Sem_Venda.Next;
    end;
  finally
    ShowMessage('Conclu�do o processo de inativar os Clientes!');
    FreeAndNil(fDMCadPessoa);
  end;
end;

procedure TfrmConsProduto_Sem_Ped.SMDBGrid2TitleClick(Column: TColumn);
var
  i : Integer;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsPedido.cdsCliente_Sem_Venda.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;
end;

end.
