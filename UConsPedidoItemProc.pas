unit UConsPedidoItemProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsPedidoProc, NxCollection, Grids, DBGrids, SMDBGrid,
  RzTabs, ExtCtrls, AdvPanel, CurrEdit, StdCtrls, RxLookup, Mask, ToolEdit,
  NxEdit;

type
  TfrmConsPedidoItemProc = class(TForm)
    NxPanel1: TNxPanel;
    RzPageControl1: TRzPageControl;
    TS_Processo: TRzTabSheet;
    TS_ConsProcesso: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    pnlPrincipal: TAdvPanel;
    SMDBGrid1: TSMDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    Label9: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    Edit1: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Label12: TLabel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    NxComboBox1: TNxComboBox;
    Label3: TLabel;
    NxButton1: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fDMConsPedidoProc: TDMConsPedidoProc;
    
  public
    { Public declarations }
  end;

var
  frmConsPedidoItemProc: TfrmConsPedidoItemProc;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmConsPedidoItemProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedidoItemProc.FormShow(Sender: TObject);
begin
  fDMConsPedidoProc := TDMConsPedidoProc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedidoProc);

  

end;

end.
