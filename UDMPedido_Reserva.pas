unit UDMPedido_Reserva;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TDMPedido_Reserva = class(TDataModule)
    sdsPedido_Reserva: TSQLDataSet;
    sdsPedido_ReservaID: TIntegerField;
    sdsPedido_ReservaID_PEDIDO: TIntegerField;
    sdsPedido_ReservaITEM_PEDIDO: TIntegerField;
    sdsPedido_ReservaID_PRODUTO: TIntegerField;
    sdsPedido_ReservaID_COR: TIntegerField;
    sdsPedido_ReservaQTD: TFloatField;
    sdsPedido_ReservaID_LOTE: TIntegerField;
    sdsPedido_ReservaFILIAL: TIntegerField;
    dspPedido_Reserva: TDataSetProvider;
    cdsPedido_Reserva: TClientDataSet;
    cdsPedido_ReservaID: TIntegerField;
    cdsPedido_ReservaID_PEDIDO: TIntegerField;
    cdsPedido_ReservaITEM_PEDIDO: TIntegerField;
    cdsPedido_ReservaID_PRODUTO: TIntegerField;
    cdsPedido_ReservaID_COR: TIntegerField;
    cdsPedido_ReservaQTD: TFloatField;
    cdsPedido_ReservaID_LOTE: TIntegerField;
    cdsPedido_ReservaFILIAL: TIntegerField;
    dsPedido_Reserva: TDataSource;
    sdsPedido_ReservaTIPO_ES: TStringField;
    sdsPedido_ReservaDATA: TDateField;
    sdsPedido_ReservaQTD2: TFloatField;
    cdsPedido_ReservaTIPO_ES: TStringField;
    cdsPedido_ReservaDATA: TDateField;
    cdsPedido_ReservaQTD2: TFloatField;
    sdsPessoa: TSQLDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    dsPessoa: TDataSource;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    cdsPessoaCODIGO: TIntegerField;
    cdsProdutoID: TIntegerField;
    cdsProdutoPRECO_VENDA: TFloatField;
    cdsProdutoUNIDADE: TStringField;
    cdsPessoaNOME: TStringField;
    cdsProdutoNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctPessoa: String;

    procedure prc_localizar(ID: Integer);

    function fnc_Gravar_Pedido_Reserva(ID, ID_Pedido, Item_Pedido, ID_Produto, ID_Cor, ID_Lote, Filial: Integer;
                                       Qtd: Real; Tipo_ES: String; Data: TDateTime): Integer;
  end;

var
  DMPedido_Reserva: TDMPedido_Reserva;

implementation

uses DmdDatabase;

{$R *.dfm}

{ TDMPedido_Reserva }

function TDMPedido_Reserva.fnc_Gravar_Pedido_Reserva(ID, ID_Pedido,
  Item_Pedido, ID_Produto, ID_Cor, ID_Lote, Filial: Integer; Qtd: Real;
  Tipo_ES: String; Data: TDateTime): Integer;
begin
  prc_localizar(ID);
  if cdsPedido_Reserva.IsEmpty then
  begin
    ID := dmDatabase.ProximaSequencia('PEDIDO_RESERVA',0);
    cdsPedido_Reserva.Insert;
    cdsPedido_ReservaID.AsInteger := ID;
  end
  else
    cdsPedido_Reserva.Edit;
  if ID_Cor <= 0 then
    ID_Cor := 0;
  if ID_Pedido > 0 then
    cdsPedido_ReservaID_PEDIDO.AsInteger := ID_Pedido
  else
    cdsPedido_ReservaID_PEDIDO.Clear;
  if Item_Pedido > 0 then
    cdsPedido_ReservaITEM_PEDIDO.AsInteger := Item_Pedido
  else
    cdsPedido_ReservaITEM_PEDIDO.Clear;
  cdsPedido_ReservaID_PRODUTO.AsInteger := ID_Produto;
  cdsPedido_ReservaID_COR.AsInteger     := ID_Cor;
  cdsPedido_ReservaQTD.AsFloat          := StrToFloat(FormatFloat('0.0000',Qtd));
  if ID_Lote > 0 then
    cdsPedido_ReservaID_LOTE.AsInteger := ID_Lote
  else
    cdsPedido_ReservaID_LOTE.Clear;
  cdsPedido_ReservaFILIAL.AsInteger := Filial;
  cdsPedido_ReservaTIPO_ES.AsString := Tipo_ES;
  cdsPedido_ReservaDATA.AsDateTime  := Data;
  if Tipo_ES = 'S' then
    cdsPedido_ReservaQTD2.AsFloat := StrToFloat(FormatFloat('0.0000',Qtd * -1))
  else
    cdsPedido_ReservaQTD2.AsFloat := StrToFloat(FormatFloat('0.0000',Qtd));
  cdsPedido_Reserva.Post;
  cdsPedido_Reserva.ApplyUpdates(0);
  Result := ID;
end;

procedure TDMPedido_Reserva.prc_localizar(ID: Integer);
begin
  cdsPedido_Reserva.Close;
  sdsPedido_Reserva.ParamByName('ID').AsInteger := ID;
  cdsPedido_Reserva.Open;
end;

procedure TDMPedido_Reserva.DataModuleCreate(Sender: TObject);
begin
  ctPessoa := sdsPessoa.CommandText;
end;

end.
