unit uRenegociacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, uDmPagamento, Mask, UCBase,
  StdCtrls, DB, NxCollection, DBCtrls, ExtCtrls, DBGrids, RzTabs, ToolEdit, RXDBCtrl, CurrEdit, RxLookup, StrUtils;

type
  TfRenegociacao = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    pnlCadastro: TPanel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    StaticText1: TStaticText;
    pnlPesquisa: TPanel;
    Label6: TLabel;
    Edit4: TEdit;
    UCControls1: TUCControls;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnConsultar: TNxButton;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    SMDBGrid2: TSMDBGrid;
    btnImprimir: TNxButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDmPagamento: TDmPagamento;

    procedure prc_Consultar;
    procedure prc_Limpar_Edit_Consulta;
  public
    { Public declarations }
    vTipo: String;
  end;

var
  fRenegociacao: TfRenegociacao;

implementation

uses DmdDatabase, rsDBUtils, uUtilPadrao;

{$R *.dfm}

procedure TfRenegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRenegociacao.btnExcluirClick(Sender: TObject);
begin
  if fDmPagamento.cdsRenegociacao.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  
end;

procedure TfRenegociacao.FormShow(Sender: TObject);
begin
  fDmPagamento := TDmPagamento.Create(Self);

  oDBUtils.SetDataSourceProperties(Self, fDmPagamento);
end;

procedure TfRenegociacao.prc_Consultar;
begin
  fDmPagamento.cdsRenegociacao.Close;
  fDmPagamento.sdsRenegociacao.CommandText := fDmPagamento.ctRenegociacao + ' WHERE 0 = 0 ';
  if Trim(Edit4.Text) <> '' then
    fDmPagamento.sdsRenegociacao.CommandText := fDmPagamento.sdsRenegociacao.CommandText +
                                                ' AND NOME LIKE ' + QuotedStr('%'+Edit4.Text+'%');
  fDmPagamento.cdsRenegociacao.Open;
end;

procedure TfRenegociacao.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfRenegociacao.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
//  ComboBox1.ItemIndex := AnsiIndexStr(fDmPagamento.cdsRenegociacaoTIPO.AsString,['NFC','CNF','PED','ORC']);
end;

procedure TfRenegociacao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDmPagamento);
end;

procedure TfRenegociacao.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfRenegociacao.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
    Edit4.SetFocus
  else
    prc_Limpar_Edit_Consulta;
end;

procedure TfRenegociacao.prc_Limpar_Edit_Consulta;
begin
  Edit4.Clear;
end;

procedure TfRenegociacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if fDmPagamento.cdsRenegociacao.State in [dsEdit,dsInsert] then
  begin
    if MessageDlg('Fechar esta tela sem confirmar?',mtConfirmation,[mbOk,mbNo],0) = mrNo then
      CanClose := False
    else
    begin
      fDmPagamento.cdsRenegociacao.CancelUpdates;
      CanClose := True;
    end;
  end;
end;

procedure TfRenegociacao.btnImprimirClick(Sender: TObject);
begin
  fDmPagamento.prc_ImprimirRenegocicao(fDmPagamento.cdsRenegociacaoID.AsInteger);
end;

end.
