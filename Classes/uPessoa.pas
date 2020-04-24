unit uPessoa;

interface

type
  TPessoa = Class
  private
    FUF: WideString;
    FCidade: WideString;
    FBairro: WideString;
    FCEP: WideString;
    FNumero: WideString;
    FRazaoSocial: WideString;
    FEndereco: WideString;
    FFantasia: WideString;
    FTelefone: WideString;
    FComplemento: WideString;
  public
    property RazaoSocial: WideString read FRazaoSocial write FRazaoSocial;
    property Endereco: WideString read FEndereco write FEndereco;
    property Cidade: WideString read FCidade write FCidade;
    property Bairro: WideString read FBairro write FBairro;
    property UF: WideString read FUF write FUF;
    property CEP: WideString read FCEP write FCEP;
    property Numero: WideString read FNumero write FNumero;
    property Fantasia: WideString read FFantasia write FFantasia;
    property Telefone: WideString read FTelefone write FTelefone;
    property Complemento: WideString read FComplemento write FComplemento;
    constructor create;
    destructor destroy; override;

  End;

implementation

{ TPessoa }

{ TPessoa }

constructor TPessoa.create;
begin

end;

destructor TPessoa.destroy;
begin

  inherited;
end;

end.
