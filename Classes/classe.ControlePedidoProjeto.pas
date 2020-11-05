unit classe.ControlePedidoProjeto;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, classe.Controle, classe.CalcularPeso;

type
  TPedidoControle = class
  private
    FID_Pessoa: Integer;
    FID_PRODUTO: integer;
    FVLR_UNITARIO: real;
    FCOMPRIMENTO: real;
    FESPESSURA: real;
    FPESO: real;
    FPRECO_KG: real;
    FLARGURA: real;
    FNOMEPROJETO: String;
    FVLR_DOBRA: real;
    FPROCESSO_01: Integer;
    FPROCESSO_02: Integer;
    FPROCESSO_03: Integer;
    FPROCESSO_04: Integer;
    FPROCESSO_05: Integer;
    FPROCESSO_06: Integer;
    FPROCESSO_07: Integer;
    FPROCESSO_08: Integer;
    FPROCESSO_09: Integer;
    FPROCESSO_10: Integer;

    FControle : TControle;

  public
    constructor create(pConexaoControle:TControle);
    destructor destroy; override;
    function InserePedidoProjeto : Boolean;
    function PesquisaPedidoProjeto(pNome : String; ID_Cliente : String) : TPedidoControle;

    property NomeProjeto : String read FNOMEPROJETO write FNOMEPROJETO;
    property ID_Pessoa : Integer read FID_Pessoa write FID_Pessoa;
    property PRECO_KG : real read FPRECO_KG write FPRECO_KG;
    property PESO : real read FPESO write FPESO;
    property VLR_DOBRA : real read FVLR_DOBRA write FVLR_DOBRA;
    property VLR_UNITARIO : real read FVLR_UNITARIO write FVLR_UNITARIO;
    property COMPRIMENTO : real read FCOMPRIMENTO write FCOMPRIMENTO;
    property LARGURA : real read FLARGURA write FLARGURA;
    property ESPESSURA : real read FESPESSURA write FESPESSURA;
    property ID_PRODUTO : integer read FID_PRODUTO write FID_PRODUTO;
    property PROCESSO_01 : integer read FPROCESSO_01 write FPROCESSO_01;
    property PROCESSO_02 : integer read FPROCESSO_02 write FPROCESSO_02;
    property PROCESSO_03 : integer read FPROCESSO_03 write FPROCESSO_03;
    property PROCESSO_04 : integer read FPROCESSO_04 write FPROCESSO_04;
    property PROCESSO_05 : integer read FPROCESSO_05 write FPROCESSO_05;
    property PROCESSO_06 : integer read FPROCESSO_06 write FPROCESSO_06;
    property PROCESSO_07 : integer read FPROCESSO_07 write FPROCESSO_07;
    property PROCESSO_08 : integer read FPROCESSO_08 write FPROCESSO_08;
    property PROCESSO_09 : integer read FPROCESSO_09 write FPROCESSO_09;
    property PROCESSO_10 : integer read FPROCESSO_10 write FPROCESSO_10;

  end;

implementation

{ TPedidoControle }

constructor TPedidoControle.create(pConexaoControle: Tcontrole);
begin
  FControle := pConexaoControle;
end;

destructor TPedidoControle.destroy;
begin
  inherited;
end;

function TPedidoControle.InserePedidoProjeto: Boolean;
begin
  FControle.SqlGeral.Close;
  FControle.SqlGeral.SQL.Clear;
  FControle.SqlGeral.SQL.Add('update or insert into pedido_projeto ');
  FControle.SqlGeral.SQL.Add('(NOME_PROJETO,ID_PESSOA,PRECO_KG,PESO,VLR_DOBRA,VLR_UNITARIO,COMPRIMENTO,LARGURA,ESPESSURA,ID_PRODUTO, PROCESSO_01,');
  FControle.SqlGeral.SQL.Add('PROCESSO_02,');
  FControle.SqlGeral.SQL.Add('PROCESSO_03,');
  FControle.SqlGeral.SQL.Add('PROCESSO_04,');
  FControle.SqlGeral.SQL.Add('PROCESSO_05,');
  FControle.SqlGeral.SQL.Add('PROCESSO_06,');
  FControle.SqlGeral.SQL.Add('PROCESSO_07,');
  FControle.SqlGeral.SQL.Add('PROCESSO_08,');
  FControle.SqlGeral.SQL.Add('PROCESSO_09,');
  FControle.SqlGeral.SQL.Add('PROCESSO_10)  ');
  FControle.SqlGeral.SQL.Add(' values (:vNome_Projeto,');
  FControle.SqlGeral.SQL.Add(' :vId_Pessoa,');
  FControle.SqlGeral.SQL.Add(' :vPreco_Kg,');
  FControle.SqlGeral.SQL.Add(' :vPeso,');
  FControle.SqlGeral.SQL.Add(' :vVlr_Dobra,');
  FControle.SqlGeral.SQL.Add(' :vVlr_Unitario,');
  FControle.SqlGeral.SQL.Add(' :vComprimento,');
  FControle.SqlGeral.SQL.Add(' :vLargura,');
  FControle.SqlGeral.SQL.Add(' :vEspessura,');
  FControle.SqlGeral.SQL.Add(' :vId_Produto,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_01,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_02,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_03,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_04,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_05,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_06,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_07,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_08,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_09,');
  FControle.SqlGeral.SQL.Add(' :vProcesso_10)');

  FControle.SqlGeral.ParamByName('vNome_Projeto').AsString := Self.FNomeProjeto;
  FControle.SqlGeral.ParamByName('vId_Pessoa').asInteger := Self.FId_Pessoa;
  FControle.SqlGeral.ParamByName('vPreco_Kg').asFloat := Self.FPreco_Kg;
  FControle.SqlGeral.ParamByName('vPeso').asFloat := Self.FPeso;
  FControle.SqlGeral.ParamByName('vVlr_Dobra').asFloat := Self.FVlr_Dobra;
  FControle.SqlGeral.ParamByName('vVlr_Unitario').asFloat := Self.FVlr_Unitario;
  FControle.SqlGeral.ParamByName('vComprimento').asFloat := Self.FComprimento;
  FControle.SqlGeral.ParamByName('vLargura').asFloat := Self.FLargura;
  FControle.SqlGeral.ParamByName('vEspessura').asFloat := Self.FEspessura;
  FControle.SqlGeral.ParamByName('vId_Produto').asInteger := Self.FId_Produto;
  FControle.SqlGeral.ParamByName('vProcesso_01').asInteger := Self.FProcesso_01;
  FControle.SqlGeral.ParamByName('vProcesso_02').asInteger := Self.FPROCESSO_02;
  FControle.SqlGeral.ParamByName('vProcesso_03').asInteger := Self.FPROCESSO_03;
  FControle.SqlGeral.ParamByName('vProcesso_04').asInteger := Self.FPROCESSO_04;
  FControle.SqlGeral.ParamByName('vProcesso_05').asInteger := Self.FPROCESSO_05;
  FControle.SqlGeral.ParamByName('vProcesso_06').asInteger := Self.FPROCESSO_06;
  FControle.SqlGeral.ParamByName('vProcesso_07').asInteger := Self.FPROCESSO_07;
  FControle.SqlGeral.ParamByName('vProcesso_08').asInteger := Self.FPROCESSO_08;
  FControle.SqlGeral.ParamByName('vProcesso_09').asInteger := Self.FPROCESSO_09;
  FControle.SqlGeral.ParamByName('vProcesso_10').asInteger := Self.FPROCESSO_10;

  try
    FControle.SqlGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TPedidoControle.PesquisaPedidoProjeto(pNome: String; ID_Cliente : String): TPedidoControle;
begin
  FControle.sqlGeral.Close;
  FControle.sqlGeral.SQL.Clear;
  FControle.sqlGeral.SQL.ADD('select NOME_PROJETO, ');
  FControle.sqlGeral.SQL.ADD('ID_PESSOA, ');
  FControle.sqlGeral.SQL.ADD('PRECO_KG, ');
  FControle.sqlGeral.SQL.ADD('PESO, ');
  FControle.sqlGeral.SQL.ADD('VLR_DOBRA, ');
  FControle.sqlGeral.SQL.ADD('VLR_UNITARIO, ');
  FControle.sqlGeral.SQL.ADD('COMPRIMENTO, ');
  FControle.sqlGeral.SQL.ADD('LARGURA, ');
  FControle.sqlGeral.SQL.ADD('ESPESSURA, ');
  FControle.sqlGeral.SQL.ADD('ID_PRODUTO, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_01, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_02, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_03, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_04, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_05, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_06, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_07, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_08, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_09, ');
  FControle.sqlGeral.SQL.ADD('PROCESSO_10');
  FControle.sqlGeral.SQL.ADD('from PEDIDO_PROJETO ');
  FControle.sqlGeral.SQL.ADD('Where NOME_PROJETO = ' + QuotedStr(pNome));
  FControle.sqlGeral.SQL.ADD(' and ID_Pessoa = ' + ID_Cliente);

  FControle.sqlGeral.Open;

  if not FControle.sqlGeral.IsEmpty then
  begin
    Self.NomeProjeto  := FControle.sqlGeral.FieldByName('Nome_Projeto').AsString;
    Self.Id_Pessoa    := FControle.sqlGeral.FieldByName('Id_Pessoa').Asinteger;
    Self.Preco_Kg     := FControle.sqlGeral.FieldByName('Preco_KG').AsFloat;
    Self.Vlr_Dobra    := FControle.sqlGeral.FieldByName('Vlr_Dobra').AsFloat;
    Self.Vlr_Unitario := FControle.sqlGeral.FieldByName('Vlr_Unitario').AsFloat;
    Self.Comprimento  := FControle.sqlGeral.FieldByName('Comprimento').AsFloat;
    Self.Largura      := FControle.sqlGeral.FieldByName('Largura').AsFloat;
    Self.Espessura    := FControle.sqlGeral.FieldByName('Espessura').AsFloat;
    Self.Id_Produto   := FControle.sqlGeral.FieldByName('Id_Produto').AsInteger;
    Self.PROCESSO_01  := FControle.sqlGeral.FieldByName('PROCESSO_01').AsInteger;
    Self.PROCESSO_02  := FControle.sqlGeral.FieldByName('PROCESSO_02').AsInteger;
    Self.PROCESSO_03  := FControle.sqlGeral.FieldByName('PROCESSO_03').AsInteger;
    Self.PROCESSO_04  := FControle.sqlGeral.FieldByName('PROCESSO_04').AsInteger;
    Self.PROCESSO_05  := FControle.sqlGeral.FieldByName('PROCESSO_05').AsInteger;
    Self.PROCESSO_06  := FControle.sqlGeral.FieldByName('PROCESSO_06').AsInteger;
    Self.PROCESSO_07  := FControle.sqlGeral.FieldByName('PROCESSO_07').AsInteger;
    Self.PROCESSO_08  := FControle.sqlGeral.FieldByName('PROCESSO_08').AsInteger;
    Self.PROCESSO_09  := FControle.sqlGeral.FieldByName('PROCESSO_09').AsInteger;
    Self.PROCESSO_10  := FControle.sqlGeral.FieldByName('PROCESSO_10').AsInteger;
  end
  else
  begin
    Self.NomeProjeto  := '';
    Self.Id_Pessoa    := 0;
    Self.Preco_Kg     := 0;
    Self.Vlr_Dobra    := 0;
    Self.Vlr_Unitario := 0;
    Self.Comprimento  := 0;
    Self.Largura      := 0;
    Self.Espessura    := 0;
    Self.Id_Produto   := 0;
    Self.PROCESSO_01  := 0;
    Self.PROCESSO_02  := 0;
    Self.PROCESSO_03  := 0;
    Self.PROCESSO_04  := 0;
    Self.PROCESSO_05  := 0;
    Self.PROCESSO_06  := 0;
    Self.PROCESSO_07  := 0;
    Self.PROCESSO_08  := 0;
    Self.PROCESSO_09  := 0;
    Self.PROCESSO_10  := 0;
  end;

end;

end.
