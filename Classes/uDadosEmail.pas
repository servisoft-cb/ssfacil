unit uDadosEmail;

interface

uses
  Classes, ACBrBase, ACBrMail, Dialogs;

type

TDadosEmail = Class
  private
    FDestinatario: String;
    FNomeRemetente: String;
    FPort: Integer;
    FRemetente: String;
    FSSL: Boolean;
    FPassword: String;
    FMensagem: TStringList;
    FAnexo: TStringList;
    FTSL: Boolean;
    FHost: String;
    FUser: String;
    FAssunto: String;
    FNomeDestinatario: String;
    FArquivo: TStringList;
    FCC: TStringList;
    procedure ConfigurarConta(var FACBrMail: TACBrMail);
  public
    constructor Create;
    destructor Destroy; override;
    property Destinatario : String read FDestinatario write FDestinatario;
    property Remetente : String read FRemetente write FRemetente;
    property NomeRemetente : String read FNomeRemetente write FNomeRemetente;
    property NomeDestinatario : String read FNomeDestinatario write FNomeDestinatario;
    property Assunto : String read FAssunto write FAssunto;
    property Mensagem : TStringList read FMensagem write FMensagem;
    property Host : String read FHost write FHost;
    property Port : Integer read FPort write FPort;
    property User : String read FUser write FUser;
    property Password : String read FPassword write FPassword;
    property TSL : Boolean read FTSL write FTSL;
    property SSL : Boolean read FSSL write FSSL;
    property Arquivo : TStringList read FArquivo write FArquivo;
    property CC : TStringList read FCC write FCC;

    procedure AddMensagem(const aValue : String);
    procedure AddArquivo(const aValue : String);
    procedure AddCC(const aValue : String);

    function EnviarMensagem : Boolean;

End;

implementation

uses SysUtils;

{ TDadosEmail }

procedure TDadosEmail.AddArquivo(const aValue: String);
begin
  FArquivo.Add(aValue);
end;

procedure TDadosEmail.AddCC(const aValue: String);
begin
  FCC.Add(aValue);
end;

procedure TDadosEmail.AddMensagem(const aValue: String);
begin
  FMensagem.Add(aValue);
end;

procedure TDadosEmail.ConfigurarConta(var FACBrMail: TACBrMail);
var
  strMensagem : String;
  strAnexo : String;
  strCC : String;
  i : Integer;
begin
  FACBrMail.Clear;
  FACBrMail.IsHTML := False;
  FACBrMail.Subject := FAssunto;
  FACBrMail.FromName := FNomeRemetente;
  FACBrMail.From := FRemetente;
  FACBrMail.Host := FHost;
  // troque pelo seu servidor smtp
  FACBrMail.Username := FUser;
  FACBrMail.Password := FPassword;
  FACBrMail.Port := IntToStr(FPort);
  // troque pela porta do seu servidor smtp
  FACBrMail.SetTLS := FTSL;
  FACBrMail.SetSSL := FSSL;
  FACBrMail.DefaultCharset := TMailCharset(27); //UTF8
  //FACBrMail.IDECharset := TMailCharset(15); //CP1252
  FACBrMail.AddAddress(FDestinatario, FNomeDestinatario);

  for i := 0 to FCC.Count - 1 do
    FACBrMail.AddCC(FCC.Strings[i]);

  for i := 0 to FMensagem.Count - 1 do
    FACBrMail.AltBody.Add(FMensagem.Strings[i]);

  for i := 0 to FArquivo.Count -1 do
  begin
    try
      //FACBrMail.AddAttachment(FArquivo.Strings[i], FAssunto, adAttachment);
      FACBrMail.AddAttachment(FArquivo.Strings[i], FAssunto);
    except
      on E : Exception do
      ShowMessage('Erro no anexo: ' + strAnexo + #13 + E.Message);
    end;
  end;
end;

constructor TDadosEmail.Create;
begin
  FMensagem := TStringList.Create;
  FArquivo := TStringList.Create;
  FCC := TStringList.Create;
end;

destructor TDadosEmail.Destroy;
begin
  FMensagem.Free;
  FArquivo.Free;
  FCC.Free;
  inherited;
end;

function TDadosEmail.EnviarMensagem: Boolean;
var
  FACBrMail : TACBrMail;
  Dir, ArqXML: string;
  MS: TMemoryStream;
begin
  if FDestinatario = EmptyStr then
    raise Exception.Create('Nenhum Destinatário Informado!');

  FACBrMail := TACBrMail.Create(nil);
  try
    Dir := ExtractFilePath(ParamStr(0));
    ConfigurarConta(FACBrMail);
    try
      FACBrMail.Send(False);
    except
      Result := False;
    end;
    Result := True;
  finally
    FACBrMail.Free;
  end;
end;

end.
