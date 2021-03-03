unit UEtiqueta_RFID_Qtd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMEtiqueta, NxCollection, Grids, DBGrids, SMDBGrid, StdCtrls, UDMRFID, DB;

type
  TfrmEtiqueta_RFID_Qtd = class(TForm)
    NxPanel1: TNxPanel;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    NxButton1: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMEtiqueta: TDMEtiqueta;
    fDMRFID: TDMRFID;

    vID_Nota_Qtd : Integer;
    
  end;

var
  frmEtiqueta_RFID_Qtd: TfrmEtiqueta_RFID_Qtd;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmEtiqueta_RFID_Qtd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmEtiqueta_RFID_Qtd.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMEtiqueta);

end;

procedure TfrmEtiqueta_RFID_Qtd.NxButton1Click(Sender: TObject);
begin
  if fDMEtiqueta.cdsItemSemQtdRotulo.State in [dsEdit,dsInsert] then
    fDMEtiqueta.cdsItemSemQtdRotulo.Post;
  fDMEtiqueta.cdsItemSemQtdRotulo.First;
  while not fDMEtiqueta.cdsItemSemQtdRotulo.Eof do
  begin
    if StrToFloat(FormatFloat('0.0000',fDMEtiqueta.cdsItemSemQtdRotuloQTD_POR_ROTULO.AsFloat)) > 0 then
    begin
      fDMRFID.cdsProduto.Close;
      fDMRFID.sdsProduto.ParamByName('ID').AsInteger := fDMEtiqueta.cdsItemSemQtdRotuloID_PRODUTO.AsInteger;
      fDMRFID.cdsProduto.Open;
      if not fDMRFID.cdsProduto.IsEmpty then
      begin
        fDMRFID.cdsProduto.Edit;
        fDMRFID.cdsProdutoQTD_POR_ROTULO.AsFloat := StrToFloat(FormatFloat('0.0000',fDMEtiqueta.cdsItemSemQtdRotuloQTD_POR_ROTULO.AsFloat));
        fDMRFID.cdsProduto.Post;
        fDMRFID.cdsProduto.ApplyUpdates(0);
      end;
    end;
    fDMEtiqueta.cdsItemSemQtdRotulo.Next;
  end;

  fDMEtiqueta.cdsItemSemQtdRotulo.Close;
  fDMEtiqueta.sdsItemSemQtdRotulo.ParamByName('ID').AsInteger := vID_Nota_Qtd;
  fDMEtiqueta.cdsItemSemQtdRotulo.Open;
  if fDMEtiqueta.cdsItemSemQtdRotulo.IsEmpty then
    Close;
end;

end.
