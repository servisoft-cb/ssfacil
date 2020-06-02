unit ApiDirectcall;

interface

uses
  Windows, Classes, SysUtils;

type
  TGetStringPrc = function: WideString;
  TSetStringPrc = procedure (value: WideString);
  TSendSmsProc  = function(AFrom, ATo, AText: WideString): WideString;
  TReleaseProc  = procedure;

  TApiDirectCall = class
  private
    FGetUser: TGetStringPrc;
    FSetUser: TSetStringPrc;
    FGetPassword: TGetStringPrc;
    FSetPassword: TSetStringPrc;
    FSendSms: TSendSmsProc;
    FConsultarSaldo: TGetStringPrc;
    FRealease: TReleaseProc;
//    FUser: string;
//    FPassword: string;
//    FToken: string;
  private
    FLibHandle: THandle;
    function GetPassword: string;
    procedure SetPassword(const Value: string);
    function GetUser: string;
    procedure SetUser(const Value: string);
//    function dopost(AMethod: string; ARequest: TStringList): string;
//    function getToken: string;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
  public
    function sendSms(AFrom, ATo, AText: string): string;
    function consultarSaldo: string;

    property User: string read GetUser write SetUser;
    property Password: string read GetPassword write SetPassword;
  end;

implementation

uses
  msxml, idHTTP, idSSLOpenSSL, StrUtils;

{ TApiDirectCall }

function TApiDirectCall.consultarSaldo: string;
//var
//  body: TStringList;
//  response: string;
//  XMLDOMDocument  : IXMLDOMDocument;
//  XMLDOMNode      : IXMLDOMNode;
begin
//  body := TStringList.Create;
//  body.add('access_token=' + getToken);
//  body.add('format=xml');
//
//  response := dopost('extrato/saldo', body);
//
//  XMLDOMDocument:=CoDOMDocument.Create;
//  XMLDOMDocument.loadXML(response);
//  XMLDOMNode := XMLDOMDocument.selectSingleNode('//directcall/result');
//
////  Result := XMLDOMNode.text;
//  Result := XMLDOMNode.selectSingleNode('//moeda').Text + ' ' +
//            AnsiReplaceStr(XMLDOMNode.selectSingleNode('//saldo').Text, '.', ',');
  Result := FConsultarSaldo;
end;

//function TApiDirectCall.dopost(AMethod: string; ARequest: TStringList): string;
//var
//  IdHTTP: TIdHttp;
//  idHandle: TIdSSLIOHandlerSocketOpenSSL;
//  RBody: TStringStream;
//begin
//  IdHTTP := TIdHttp.Create(nil);
//  idHandle := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
//  idHandle.SSLOptions.Method := sslvTLSv1;
//  idHandle.SSLOptions.Mode   := sslmUnassigned;
//
//  IdHTTP.IOHandler := idHandle;
//  RBody := TStringStream.Create('');
//  try
//
//    IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
//    IdHTTP.Post('https://api.directcallsoft.com/'+AMethod, ARequest, RBody);
//    Result := RBody.DataString;
//
//  finally
//    FreeAndNil(RBody);
//    FreeAndNil(IdHTTP);
//    FreeAndNil(idHandle);
//  end;
//end;

//function TApiDirectCall.getToken: string;
//var
//  body: TStringList;
//  response: string;
//  XMLDOMDocument  : IXMLDOMDocument;
//  XMLDOMNode      : IXMLDOMNode;
//begin
//  if (FToken = EmptyStr) then
//  begin
//    body := TStringList.Create;
//    body.add('client_id=' + FUser);
//    body.add('client_secret=' + FPassword);
//    body.add('format=xml');
//
//    response := dopost('request_token', body);
//
//    XMLDOMDocument:=CoDOMDocument.Create;
//    XMLDOMDocument.loadXML(response);
//    XMLDOMNode := XMLDOMDocument.selectSingleNode('//oauth/access_token');
//
//    FToken := XMLDOMNode.text;
//  end;
//
//  Result := FToken;
//end;

constructor TApiDirectCall.Create;
begin
  FLibHandle := LoadLibrary('DirectCallApi.dll');
  if FLibHandle = 0 then
    raise Exception.Create('DirectCallApi.dll não encontrado.');

  @FGetUser := GetProcAddress(FLibHandle, 'getUser');
  @FSetUser := GetProcAddress(FLibHandle, 'setUser');
  @FGetPassword := GetProcAddress(FLibHandle, 'getPassword');
  @FSetPassword := GetProcAddress(FLibHandle, 'setPassword');
  @FSendSms := GetProcAddress(FLibHandle, 'sendSms');
  @FConsultarSaldo := GetProcAddress(FLibHandle, 'consultarSaldo');
  @FRealease := GetProcAddress(FLibHandle, 'releaseDll');

  if ( (@FGetUser = nil) or (@FSetUser = nil) or
       (@FGetPassword = nil) or (@FSetPassword = nil) or
       (@FSendSms = nil) or (@FConsultarSaldo = nil) or
       (@FRealease = nil)
     ) then
     raise Exception.Create('Não foi possível carregar DirectCallApi.dll');

end;

destructor TApiDirectCall.Destroy;
begin
  FRealease;
  FreeLibrary(FLibHandle);
  FLibHandle := 0;
  inherited;
end;

function TApiDirectCall.GetPassword: string;
begin
  Result := FGetPassword;
end;

function TApiDirectCall.GetUser: string;
begin
  Result := FGetUser;
end;

function TApiDirectCall.sendSms(AFrom, ATo, AText: string): string;
//var
//  body: TStringList;
//  response: string;
//  XMLDOMDocument  : IXMLDOMDocument;
//  XMLDOMNode      : IXMLDOMNode;
begin
//  body := TStringList.Create;
//  body.add('access_token=' + getToken);
//  body.add('texto=' + AText);
//  body.add('tipo=texto');
//  body.add('origem=' + AFrom);
//  body.add('destino=' + ATo);
//  body.add('format=xml');
//
//  response := dopost('sms/send', body);
//
//  XMLDOMDocument:=CoDOMDocument.Create;
//  XMLDOMDocument.loadXML(response);
//  XMLDOMNode := XMLDOMDocument.selectSingleNode('//directcall/msg');
//
//  Result := XMLDOMNode.text;
  Result := FSendSms(AFrom, Ato, AText);
end;


procedure TApiDirectCall.SetPassword(const Value: string);
begin
  FSetPassword(Value);
end;

procedure TApiDirectCall.SetUser(const Value: string);
begin
  FSetUser(Value);
end;

end.
