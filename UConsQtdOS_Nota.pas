unit UConsQtdOS_Nota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxCollection, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, SMDBGrid, StdCtrls;

type
  TfrmConsQtdOS_Nota = class(TForm)
    NxPanel1: TNxPanel;
    SMDBGrid1: TSMDBGrid;
    sdsConsTotalOS: TSQLDataSet;
    dspConsTotalOS: TDataSetProvider;
    cdsConsTotalOS: TClientDataSet;
    cdsConsTotalOSID: TIntegerField;
    cdsConsTotalOSNUM_OS: TIntegerField;
    cdsConsTotalOSDTEMISSAO: TDateField;
    cdsConsTotalOSQTD_PECAS: TFloatField;
    cdsConsTotalOSQTD_NOTA: TFloatField;
    cdsConsTotalOSID_PRODUTO: TIntegerField;
    cdsConsTotalOSREFERENCIA: TStringField;
    cdsConsTotalOSNOME_PRODUTO: TStringField;
    dsConsTotalOS: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cdsConsTotalOSagTotal_Nota: TAggregateField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vNumNota_Local, vSerie_Local, vID_Cliente_Local : Integer;
  end;

var
  frmConsQtdOS_Nota: TfrmConsQtdOS_Nota;

implementation

uses uUtilPadrao;

{$R *.dfm}

procedure TfrmConsQtdOS_Nota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsQtdOS_Nota.FormShow(Sender: TObject);
begin
  cdsConsTotalOS.Close;
  sdsConsTotalOS.ParamByName('NUM_NOTA').AsInteger   := vNumNota_Local;
  sdsConsTotalOS.ParamByName('SERIE_NOTA').AsInteger := vSerie_Local;
  sdsConsTotalOS.ParamByName('ID_CLIENTE').AsInteger := vID_Cliente_Local;
  cdsConsTotalOS.Open;

  Label4.Caption := FormatFloat('0.0000',uUtilPadrao.vQtd_Nota_OS);
  if not cdsConsTotalOSagTotal_Nota.IsNull then
    Label2.Caption := FormatFloat('0.0000',cdsConsTotalOSagTotal_Nota.Value);
end;

end.
