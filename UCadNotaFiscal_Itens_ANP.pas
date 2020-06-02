unit UCadNotaFiscal_Itens_ANP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadNotaFiscal, StdCtrls, Mask, DBCtrls, NxCollection;

type
  TfrmCadNotaFiscal_Itens_ANP = class(TForm)
    Label91: TLabel;
    Label92: TLabel;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    NxButton1: TNxButton;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NxButton1Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMCadNotaFiscal: TDMCadNotaFiscal;
    
  end;

var
  frmCadNotaFiscal_Itens_ANP: TfrmCadNotaFiscal_Itens_ANP;

implementation

uses rsDBUtils, uUtilPadrao, USel_ANP;

{$R *.dfm}

procedure TfrmCadNotaFiscal_Itens_ANP.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadNotaFiscal);
end;

procedure TfrmCadNotaFiscal_Itens_ANP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadNotaFiscal_Itens_ANP.NxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadNotaFiscal_Itens_ANP.DBEdit3Exit(Sender: TObject);
begin
  fDMCadNotaFiscal.cdsNotaFiscal_ItensANP_PRODUTO.Clear;
  if fDMCadNotaFiscal.cdsNotaFiscal_ItensANP_ID.AsInteger > 0 then
  begin
    fDMCadNotaFiscal.qTab_CProd_ANP.Close;
    fDMCadNotaFiscal.qTab_CProd_ANP.ParamByName('ID').AsInteger := fDMCadNotaFiscal.cdsNotaFiscal_ItensANP_ID.AsInteger;
    fDMCadNotaFiscal.qTab_CProd_ANP.Open;
    if fDMCadNotaFiscal.qTab_CProd_ANP.IsEmpty then
    begin
      MessageDlg('*** ID não cadastrado!' , mtError, [mbOk], 0);
      DBEdit3.SetFocus;
      exit;
    end
    else
      fDMCadNotaFiscal.cdsNotaFiscal_ItensANP_PRODUTO.AsString := fDMCadNotaFiscal.qTab_CProd_ANPCODIGO.AsString;
  end;
end;

procedure TfrmCadNotaFiscal_Itens_ANP.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vID_ANP_Pos := fDMCadNotaFiscal.cdsNotaFiscal_ItensANP_ID.AsInteger;
    frmSel_ANP := TfrmSel_ANP.Create(Self);
    frmSel_ANP.ShowModal;
    FreeAndNil(frmSel_ANP);
    fDMCadNotaFiscal.cdsNotaFiscal_ItensANP_ID.AsInteger := vID_ANP_Pos;
    DBEdit3Exit(Sender);
  end;
end;

end.
