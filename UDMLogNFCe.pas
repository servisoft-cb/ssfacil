unit UDMLogNFCe;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TDMLogNFCe = class(TDataModule)
    SQLDataSet1: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLogNFCe: TDMLogNFCe;

implementation

uses DmdDatabase;

{$R *.dfm}

end.
