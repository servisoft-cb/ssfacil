unit uDmCupomTerminal;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes;

type
  TdmCupomTerminal = class(TDataModule)
    sdsCupomTerminal: TSQLDataSet;
    dspCupomTerminal: TDataSetProvider;
    cdsCupomTerminal: TClientDataSet;
    dsCupomTerminal: TDataSource;
    sdsCupomTerminalID: TSmallintField;
    sdsCupomTerminalNOME: TStringField;
    cdsCupomTerminalID: TSmallintField;
    cdsCupomTerminalNOME: TStringField;
    sdsCupomTerminalSERIE: TStringField;
    cdsCupomTerminalSERIE: TStringField;
    sdsCupomTerminalINATIVO: TStringField;
    sdsCupomTerminalFILIAL: TIntegerField;
    cdsCupomTerminalINATIVO: TStringField;
    cdsCupomTerminalFILIAL: TIntegerField;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsCupomTerminalNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }
    vMsgCupomTerminal: String;
    ctTerminal: String;

    procedure prc_Localizar(ID: Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
  end;

var
  dmCupomTerminal: TdmCupomTerminal;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider;

{$R *.dfm}

{ TdmCupomTerminal }

procedure TdmCupomTerminal.prc_Excluir;
begin
  if not(cdsCupomTerminal.Active) or (cdsCupomTerminal.IsEmpty) then
    exit;
  cdsCupomTerminal.Delete;
  cdsCupomTerminal.ApplyUpdates(0);
end;

procedure TdmCupomTerminal.prc_Gravar;
var
  sds: TSQLDataSet;
begin
  vMsgCupomTerminal := '';
  if (trim(cdsCupomTerminalSERIE.AsString) <> '') and (cdsCupomTerminalFILIAL.AsInteger > 0) then
  begin
    sds := TSQLDataSet.Create(nil);
    try
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := 'SELECT C.ID FROM CUPOMFISCAL_TERMINAL C WHERE C.SERIE = :SERIE AND FILIAL = :FILIAL ';
      sds.ParamByName('SERIE').AsString   := cdsCupomTerminalSERIE.AsString;
      sds.ParamByName('FILIAL').AsInteger := cdsCupomTerminalFILIAL.AsInteger;
      sds.Open;
      if sds.FieldByName('ID').AsInteger <> cdsCupomTerminalID.AsInteger then
        vMsgCupomTerminal := vMsgCupomTerminal + #13 + '*** Série já usada na Filial!';
    finally
      FreeAndNil(sds);
    end;
  end;

  if trim(cdsCupomTerminalNOME.AsString) = '' then
    vMsgCupomTerminal := vMsgCupomTerminal + #13 + '*** Nome não informado!';

  if vMsgCupomTerminal <> '' then
    exit;

  cdsCupomTerminal.Post;
  cdsCupomTerminal.ApplyUpdates(0);
end;

procedure TdmCupomTerminal.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsCupomTerminal.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('CUPOM_TERMINAL',0);

  cdsCupomTerminal.Insert;
  cdsCupomTerminalID.AsInteger := vAux;
end;

procedure TdmCupomTerminal.prc_Localizar(ID: Integer);
begin
  cdsCupomTerminal.Close;
  sdsCupomTerminal.CommandText := ctTerminal;
  if ID <> 0 then
    sdsCupomTerminal.CommandText := sdsCupomTerminal.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsCupomTerminal.Open;
end;

procedure TdmCupomTerminal.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  //SR: TSearchRec;
  vIndices: string;
  aIndices: array of string;
begin
  ctTerminal := sdsCupomTerminal.CommandText;
  cdsFilial.Open;
  //*** Logs Implantado na versão .353
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
  //***********************
end;

procedure TdmCupomTerminal.cdsCupomTerminalNewRecord(DataSet: TDataSet);
begin
  cdsCupomTerminalINATIVO.AsString := 'N';
end;

procedure TdmCupomTerminal.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

end.
