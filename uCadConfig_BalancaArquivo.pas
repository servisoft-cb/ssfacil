unit uCadConfig_BalancaArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DB,
  Dialogs, StdCtrls, Buttons, RxLookup, ExtCtrls, Mask, DBCtrls, UDMCadConfig_Balanca;

type
  TfrmConfigArquivoBalanca = class(TForm)
    Panel2: TPanel;
    Label7: TLabel;
    ComboNome: TRxDBLookupCombo;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMCadConfig_Balanca : TDMConfig_Balanca;
  end;

var
  frmConfigArquivoBalanca: TfrmConfigArquivoBalanca;

implementation


{$R *.dfm}

procedure TfrmConfigArquivoBalanca.BitBtn1Click(Sender: TObject);
begin
  if trim(ComboNome.Text) = '' then
  begin
    ShowMessage('Informar o campo antes de confirmar');
    Exit;
  end;

  try
    fDMCadConfig_Balanca.cdsConfigBalancaLay.Post;
  except
    on E: exception do
    begin
      raise Exception.Create('Erro ao gravar, ' + E.Message);
    end;
  end;
  Close;

end;

procedure TfrmConfigArquivoBalanca.BitBtn4Click(Sender: TObject);
begin
  if fDMCadConfig_Balanca.cdsConfigBalancaLay.State in [dsEdit,dsInsert] then
    if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
  Close;

end;

procedure TfrmConfigArquivoBalanca.FormShow(Sender: TObject);
begin
  fDMCadConfig_Balanca.cdsTabelaProduto.Close;
  fDMCadConfig_Balanca.cdsTabelaProduto.Open;
end;

end.
