unit UConsPedidoItemProc_Itens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsPedidoProc, NxCollection, Grids, DBGrids, SMDBGrid,
  RzTabs, ExtCtrls, AdvPanel, CurrEdit, StdCtrls, RxLookup, Mask, ToolEdit,
  NxEdit, SqlExpr, DB;

type
  TfrmConsPedidoItemProc_Itens = class(TForm)
    NxPanel1: TNxPanel;
    AdvPanel1: TAdvPanel;
    SMDBGrid2: TSMDBGrid;
    NxButton1: TNxButton;
    Shape5: TShape;
    Label30: TLabel;
    ShapeConf: TShape;
    Label68: TLabel;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    procedure prc_Consultar_Itens;

  public
    { Public declarations }
    fDMConsPedidoProc: TDMConsPedidoProc;


  end;

var
  frmConsPedidoItemProc_Itens: TfrmConsPedidoItemProc_Itens;

implementation

uses rsDBUtils, DmdDatabase, uMostraPDF;

{$R *.dfm}

procedure TfrmConsPedidoItemProc_Itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedidoItemProc_Itens.FormShow(Sender: TObject);
var
  i: Integer;
begin
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedidoProc);

  for i := 0 to SMDBGrid2.ColCount - 2 do
  begin
    if (copy(SMDBGrid2.Columns[i].FieldName,1,9) = 'PROCESSO_') then
       SMDBGrid2.Columns[i].Visible := False;
  end;

  prc_Consultar_Itens;
end;

procedure TfrmConsPedidoItemProc_Itens.prc_Consultar_Itens;
var
  sds: TSQLDataSet;
  i: Integer;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'select PROC.ID, PROC.NOME, PROC.ORDEM_MAPA ORDEM  from PROCESSO PROC order by PROC.ORDEM_MAPA ';
    sds.Open;
    while not sds.Eof do
    begin
      for i := 0 to SMDBGrid2.ColCount - 2 do
      begin
        if (SMDBGrid2.Columns[i].FieldName = 'PROCESSO_'+FormatFloat('00',sds.FieldByName('ORDEM').AsInteger)) then
        begin
          SMDBGrid2.Columns[i].Title.Caption := sds.FieldByName('NOME').AsString;
          SMDBGrid2.Columns[i].Visible       := True;
        end;
      end;
      sds.Next;
    end;
  finally
    FreeAndNil(sds);
  end;

  fDMConsPedidoProc.cdsConsItens.Close;
  fDMConsPedidoProc.sdsConsItens.ParamByName('ID').AsInteger := fDMConsPedidoProc.cdsConsPedidoID.AsInteger;
  fDMConsPedidoProc.cdsConsItens.Open;
end;

procedure TfrmConsPedidoItemProc_Itens.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if copy(Field.Name,1,21) = 'cdsConsItensPROCESSO_' then
  begin
    if Field.IsNull then
    begin
      Background  := clGray;
      AFont.Color := clGray;
    end
    else
    if Field.AsInteger = 1 then
    begin
      Background  := clAqua;
      AFont.Color := clAqua;
    end
    else
    if Field.AsInteger = 2 then
    begin
      Background  := $000080FF;
      AFont.Color := $000080FF;
    end
    else
    if Field.AsInteger < 1 then
      AFont.Color := clWindow;
  end;
end;

procedure TfrmConsPedidoItemProc_Itens.KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vCaminhoPDF: String;
begin
  //ctrl + P (Imprimir PDF)
  if (Shift = [ssCtrl]) and (Key = 80) then
  begin
    frmMostraPDF := TfrmMostraPDF.Create(Self);
    try
      vCaminhoPDF := fDMConsPedidoProc.cdsConsItensCAMINHO_ARQUIVO_PDF.AsString;
      frmMostraPDF.vCaminhoPDF := vCaminhoPDF;
      frmMostraPDF.edtCaminhoPDF.Text := vCaminhoPDF;
      frmMostraPDF.ShowModal;
    finally
      FreeAndNil(frmMostraPDF);
    end;
  end;

end;

end.
