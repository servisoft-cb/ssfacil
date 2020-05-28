unit USel_ANP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr;

type
  TfrmSel_ANP = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    sdsTab_CPROD_ANP: TSQLDataSet;
    cdsTab_CPROD_ANP: TClientDataSet;
    dspTab_CPROD_ANP: TDataSetProvider;
    dsTab_CPROD_ANP: TDataSource;
    StaticText1: TStaticText;
    cdsTab_CPROD_ANPID: TIntegerField;
    cdsTab_CPROD_ANPCODIGO: TStringField;
    cdsTab_CPROD_ANPDESCRICAO: TStringField;
    Label2: TLabel;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    ctTab_CPROD_ANPLocal : String;
    procedure prc_Consultar;

  public
    { Public declarations }

  end;

var
  frmSel_ANP: TfrmSel_ANP;

implementation

uses DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfrmSel_ANP.BitBtn1Click(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmSel_ANP.prc_Consultar;
begin
  cdsTab_CPROD_ANP.Close;
  sdsTab_CPROD_ANP.CommandText := ctTab_CPROD_ANPLocal;
  if trim(Edit1.Text) <> '' then
    sdsTab_CPROD_ANP.CommandText := sdsTab_CPROD_ANP.CommandText + ' AND (DESCRICAO LIKE ' + QuotedStr('%'+Edit1.Text+'%') + ')';
  if trim(Edit2.Text) <> '' then
    sdsTab_CPROD_ANP.CommandText := sdsTab_CPROD_ANP.CommandText + ' AND (CODIGO LIKE ' + QuotedStr('%'+Edit2.Text+'%') + ')';

  cdsTab_CPROD_ANP.Open;
end;

procedure TfrmSel_ANP.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    vID_ANP_Pos := cdsTab_CPROD_ANPID.AsInteger;
    Close;
  end;
end;

procedure TfrmSel_ANP.SMDBGrid1DblClick(Sender: TObject);
begin
  vID_ANP_Pos := cdsTab_CPROD_ANPID.AsInteger;
  Close;
end;

procedure TfrmSel_ANP.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    BitBtn1Click(Sender);
    if not cdsTab_CPROD_ANP.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

procedure TfrmSel_ANP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmSel_ANP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

procedure TfrmSel_ANP.FormShow(Sender: TObject);
var
  i : Integer;
begin
  ctTab_CPROD_ANPLocal := sdsTab_CPROD_ANP.CommandText;
end;

procedure TfrmSel_ANP.SMDBGrid1TitleClick(Column: TColumn);
var
  ColunaOrdenada : String;
begin
  ColunaOrdenada := Column.FieldName;
  cdsTab_CPROD_ANP.IndexFieldNames := Column.FieldName;
end;

end.
