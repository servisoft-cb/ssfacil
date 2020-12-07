//Quem usa é a JW para conferência simples e envio de Email ou SMS
unit UBaixaPedido_Processo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, UDMConferencia, RxLookup, UCBase, Mask, RzPanel, ToolEdit,
  dbXPress, NxPageControl, RzTabs, NxCollection, NxEdit,
  DBCtrls, CurrEdit;

type
  TfrmBaixaPedido_Processo = class(TForm)
    gbxDuplicata: TRzGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    SMDBGrid1: TSMDBGrid;
    Label3: TLabel;
    RzGroupBox1: TRzGroupBox;
    CurrencyEdit2: TCurrencyEdit;
    Edit2: TEdit;
    Label4: TLabel;
    NxPanel1: TNxPanel;
    Label1: TLabel;
    Shape1: TShape;
    btnConsultarSaldoSMS: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarSaldoSMSClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    fDMConferencia: TDMConferencia;
    ColunaOrdenada: String;
    vItem_Ant : Integer;
    vItem_Ped_Sel : Integer;
    vID_Processo : Integer;
    vNome_Processo : String;

    procedure prc_Baixa_Processo;
    procedure prc_Abrir_cdsConsPedido_Item_Proc(NumPed,Item : Integer);
    procedure Prc_Gravar;
    procedure prc_Abrir_qPedido_Item(NumPed,Item : Integer );

    procedure prc_Processo;

  public
    { Public declarations }
  end;

var
  frmBaixaPedido_Processo: TfrmBaixaPedido_Processo;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, ULiberacao_Fat_Ped, ULiberacao_Fat_Conf,
  UDMAprovacao_Ped, UEscolhe_Filial;

{$R *.dfm}

procedure TfrmBaixaPedido_Processo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmBaixaPedido_Processo.FormShow(Sender: TObject);
begin
  fDMConferencia := TDMConferencia.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConferencia);
  vItem_Ant := 0;

  fDMConferencia.cdsPedido.Close;
  fDMConferencia.cdsPedido_Item.Close;

  Edit1.SetFocus;

  fDMConferencia.prc_Abrir_qFuncionario(0,vUsuario);

  if not fDMConferencia.qFuncionario.IsEmpty then
  begin
    CurrencyEdit2.AsInteger := fDMConferencia.qFuncionarioNUM_CARTAO.AsInteger;
    Edit2.Text              := fDMConferencia.qFuncionarioNOME.AsString;
  end;
end;

procedure TfrmBaixaPedido_Processo.btnConsultarSaldoSMSClick(Sender: TObject);
var
  fDMAprovacao_Ped: TDMAprovacao_Ped;
  ffrmEscolhe_Filial: TfrmEscolhe_Filial;
begin
  if fDMConferencia.cdsFilial.RecordCount > 1 then
  begin
    ffrmEscolhe_Filial := TfrmEscolhe_Filial.Create(self);
    ffrmEscolhe_Filial.ShowModal;
    FreeAndNil(ffrmEscolhe_Filial);
  end
  else
  begin
    fDMConferencia.cdsFilial.Last;
    vFilial      := fDMConferencia.cdsFilialID.AsInteger;
    vFilial_Nome := fDMConferencia.cdsFilialNOME.AsString;
  end;
  if vFilial <= 0 then
  begin
    ShowMessage('Filial não informada!');
    exit;
  end;

  fDMAprovacao_Ped := TDMAprovacao_Ped.Create(Self);
  fDMAprovacao_Ped.prc_Saldo_SMS;
  FreeAndNil(fDMAprovacao_Ped);
end;

procedure TfrmBaixaPedido_Processo.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    prc_Baixa_Processo;
end;

procedure TfrmBaixaPedido_Processo.prc_Baixa_Processo;
var
  vNumPed : Integer;
  vItem : Integer;
  vMSG : String;
  vIDPed : Integer;
  vNomeProc : String;
  vConferido : String;
begin
  Label3.Caption := '';
  if Length(Edit1.Text) <> 10 then
  begin
    MessageDlg('Código de Barras inválido!', mtError, [mbOk], 0);
    exit;
  end;
  fDMConferencia.qParametros_Ped.Close;
  fDMConferencia.qParametros_Ped.Open;
  if fDMConferencia.qParametros_PedID_PROCESSO_FINAL.AsInteger <= 0 then
  begin
    MessageDlg('Não foi informado o Processo Final nos Parâmetros!', mtError, [mbOk], 0);
    exit;
  end;

  vNumPed := StrToInt(Copy(Edit1.Text,2,6));
  vItem   := StrToInt(Copy(Edit1.Text,8,3));

  prc_Abrir_cdsConsPedido_Item_Proc(vNumPed,vItem);
  prc_Abrir_qPedido_Item(vNumPed,vItem);

  Label1.Caption := 'Referência: ' + fDMConferencia.qPedido_ItemREFERENCIA.AsString + '  ' + fDMConferencia.qPedido_ItemNOMEPRODUTO.AsString;
  Label1.Caption := Label1.Caption + #13 + ' Comprimento(mm): ' + fDMConferencia.qPedido_ItemCOMPRIMENTO.AsString;
  Label1.Caption := Label1.Caption + #13 + '     Largura(mm): ' + fDMConferencia.qPedido_ItemLARGURA.AsString;
  Label1.Caption := Label1.Caption + #13 + '   Espessura(mm): ' + fDMConferencia.qPedido_ItemESPESSURA.AsString;
  Label1.Caption := Label1.Caption + #13 + #13 + '      Qtd. Peças: ' + fDMConferencia.qPedido_ItemQTD.AsString;


  {fDMConferencia.sqlProcBaixaPedidoProc.Close;
  fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('P_NUM_PEDIDO').AsInteger := vNumPed;
  fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('P_ITEM').AsInteger       := vItem;
  fDMConferencia.sqlProcBaixaPedidoProc.ExecProc;
  vNomeProc  := fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('R_NOME_PROCESSO').AsString;
  vConferido := fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('R_CONFERIDO').AsString;
  vMSG := fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('R_MSG').AsString;
  exit;}
        

  vMSG := '';
  if fDMConferencia.qPedido_Item.IsEmpty then
    vMSG := vMSG + #13 + 'Pedido/Item não encontrado!'
  else
  if StrToFloat(FormatFloat('0.0000',fDMConferencia.qPedido_ItemQTD_FATURADO.AsFloat)) > 0 then
    vMSG := vMSG + #13 + 'Item já Faturado!'
  else
  if fDMConferencia.qPedido_ItemDTCONFERENCIA.AsDateTime > 10 then
    vMSG := vMSG + #13 + 'Item já Conferido!'
  else
  if (StrToFloat(FormatFloat('0.0000',fDMConferencia.qPedido_ItemQTD_RESTANTE.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.0000',fDMConferencia.qPedido_ItemQTD_CANCELADO.AsFloat)) >= 0) then
    vMSG := vMSG + #13 + 'Item já Cancelado!';

  if trim(vMSG) <> '' then
  begin
    Label3.Caption := vMSG;
    Label3.Visible := True;
    exit;
  end;

  //aqui, apartir  29/10/2020
  //exit;

  fDMConferencia.cdsFuncionario_Proc.Close;
  fDMConferencia.sdsFuncionario_Proc.ParamByName('CODIGO').AsInteger := fDMConferencia.qFuncionarioCODIGO.AsInteger;
  fDMConferencia.cdsFuncionario_Proc.Open;

  if fDMConferencia.cdsFuncionario_Proc.IsEmpty then
  begin
    MessageDlg('Funcionário não autorizado a dar baixa nos processos!', mtError, [mbOk], 0);
    exit;
  end;

  vID_Processo   := 0;
  vNome_Processo := '';
  prc_Processo;
  if vID_Processo <= 0 then
    exit;

  if vNumPed > 0 then
    Prc_Gravar;
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TfrmBaixaPedido_Processo.prc_Abrir_cdsConsPedido_Item_Proc(NumPed,Item: Integer);
begin
  fDMConferencia.cdsConsPedido_Item_Proc.Close;
  fDMConferencia.sdsConsPedido_Item_Proc.ParamByName('NUM_PEDIDO').AsInteger := NumPed;
  fDMConferencia.sdsConsPedido_Item_Proc.ParamByName('ITEM').AsInteger       := Item;
  fDMConferencia.cdsConsPedido_Item_Proc.Open;
end;

procedure TfrmBaixaPedido_Processo.Prc_Gravar;
var
  fDMAprovacao_Ped: TDMAprovacao_Ped;
  vNomeProc, vConferido : String;
  vMSG: String;
begin
  fDMAprovacao_Ped := TDMAprovacao_Ped.Create(Self);
  try
    fDMConferencia.sqlProcBaixaPedidoProc.Close;
//    fDMConferencia.sqlProcBaixaPedidoProc.Prepare;

    fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('P_NUM_PEDIDO').AsInteger := fDMConferencia.qPedido_ItemNUM_PEDIDO.AsInteger;
    fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('P_ITEM').AsInteger       := fDMConferencia.qPedido_ItemITEM.AsInteger;
//    fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('P_USUARIO').AsString     := vUsuario;
    fDMConferencia.sqlProcBaixaPedidoProc.ExecProc;
    vNomeProc  := fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('R_NOME_PROCESSO').AsString;
    vConferido := fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('R_CONFERIDO').AsString;
    vMSG := fDMConferencia.sqlProcBaixaPedidoProc.ParamByName('R_MSG').AsString;

    fDMConferencia.cdsConsPedido_Item_Proc.Close;
    fDMConferencia.cdsConsPedido_Item_Proc.Open;

    Label3.Caption := '*** PROCESSO: ' + vNomeProc + #13 + ' Baixado ';
    if vConferido = 'S' then
    begin
      Label3.Caption := Label3.Caption + #13 + ' CONFERIDO ';
      try
        fDMAprovacao_Ped.prc_Gravar_Pedido_Processo(fDMConferencia.qPedido_ItemEMAIL_COMPRAS.AsString,fDMConferencia.qPedido_ItemID.AsInteger,0,'E','','',Date);
      except
      end;
    end;
    Label3.Visible := True;
  finally
    FreeAndNil(fDMAprovacao_Ped);
  end;
  fDMConferencia.cdsConsPedido_Item_Proc.Close;
  fDMConferencia.cdsConsPedido_Item_Proc.Open;
end;

procedure TfrmBaixaPedido_Processo.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMConferencia.cdsConsPedido_Item_ProcDTBAIXA.AsDateTime > 10 then
    Background := $007DBEFF;
end;

procedure TfrmBaixaPedido_Processo.prc_Processo;
var
  vMSGAux : String;
begin
  vMSGAux := '';
  fDMConferencia.cdsFuncionario_Proc.First;
  while not fDMConferencia.cdsFuncionario_Proc.Eof do
  begin
    if (fDMConferencia.cdsConsPedido_Item_Proc.locate('ID_PROCESSO',fDMConferencia.cdsFuncionario_ProcID_PROCESSO.AsInteger,[loCaseInsensitive])) and
       (fDMConferencia.cdsConsPedido_Item_ProcDTBAIXA.AsDateTime <= 10)  then
    begin
      vID_Processo := fDMConferencia.cdsFuncionario_ProcID_PROCESSO.AsInteger;
      fDMConferencia.cdsFuncionario_Proc.Last;
    end
    else
      vMSGAux := '*** Processo: ' + fDMConferencia.cdsConsPedido_Item_ProcNOME_PROCESSO.AsString + ' já baixado!';
    fDMConferencia.cdsFuncionario_Proc.Next;
  end;
  if (vID_Processo <= 0) and (trim(vMSGAux) <> '') then
    MessageDlg(vMSGAux, mtWarning, [mbOk], 0);
end;


procedure TfrmBaixaPedido_Processo.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Edit1.SetFocus;
end;

procedure TfrmBaixaPedido_Processo.CurrencyEdit2Exit(Sender: TObject);
begin
  Edit2.Clear;
  fDMConferencia.qFuncionario.Close;
  if CurrencyEdit2.AsInteger <= 0 then
  begin
    Edit1.SetFocus;
    exit;
  end;
  fDMConferencia.qFuncionario.ParamByName('NUM_CARTAO').AsInteger := CurrencyEdit2.AsInteger;
  fDMConferencia.qFuncionario.ParamByName('USUARIO_LOG').AsString := '';
  fDMConferencia.qFuncionario.Open;
  if fDMConferencia.qFuncionario.IsEmpty then
  begin
    MessageDlg('Funcionário não encontrado!', mtInformation, [mbOk], 0);
    CurrencyEdit2.SetFocus;
    exit;
  end
  else
  begin
    Edit2.Text := fDMConferencia.qFuncionarioNOME.AsString;
  end;
end;

procedure TfrmBaixaPedido_Processo.prc_Abrir_qPedido_Item(NumPed,
  Item: Integer);
begin
  fDMConferencia.qPedido_Item.Close;
  fDMConferencia.qPedido_Item.ParamByName('NUM_PEDIDO').AsInteger := NumPed;
  fDMConferencia.qPedido_Item.ParamByName('ITEM').AsInteger       := Item;
  fDMConferencia.qPedido_Item.Open;
end;

procedure TfrmBaixaPedido_Processo.Edit1Change(Sender: TObject);
begin
  //Label3.Visible := False;
end;

end.
