unit UConsComissao_Titulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadExtComissao, Grids, DBGrids, SMDBGrid, StdCtrls, ExtCtrls;

type
  TfrmConsComissao_Titulos = class(TForm)
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    Label6: TLabel;
    lblVendedor: TLabel;
    Label2: TLabel;
    lblMesAno: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    fDMCadExtComissao: TDMCadExtComissao;
    
  end;

var
  frmConsComissao_Titulos: TfrmConsComissao_Titulos;

implementation

uses rsDBUtils, DateUtils;

{$R *.dfm}

procedure TfrmConsComissao_Titulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsComissao_Titulos.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadExtComissao);
end;

end.
