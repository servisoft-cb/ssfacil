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
    btnConsultarSaldoSMS: TNxButton;
    NxPanel1: TNxPanel;
    Label1: TLabel;
    Shape1: TShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnConsultarSaldoSMSClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid2DblClick(Sender: TObject);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2Exit(Sender: TObject);
  private
    { Private declarations }
    fDMConferencia: TDMConferencia;
    ColunaOrdenada: String;
    vItem_Ant : Integer;
    vItem_Ped_Sel : Integer;
    vID_Processo : Integer;
    vNome_Processo : String;

    procedure prc_Abrir_cdsPedido_Item;
    procedure prc_Verifica_Pedido_Conf;
    procedure prc_Baixa_Processo;
    procedure prc_Abrir_cdsConsPedido_Item_Proc(NumPed,Item : Integer);
    procedure Prc_Gravar(Gravar_Processo : Boolean);
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

procedure TfrmBaixaPedido_Processo.prc_Abrir_cdsPedido_Item;
var
  vIDAux : Integer;
begin
  fDMConferencia.cdsPedido.Close;
  fDMConferencia.sdsPedido.CommandText := fDMConferencia.ctPedido
                                        + ' WHERE NUM_PEDIDO = ' + IntToStr(CurrencyEdit1.AsInteger);
  fDMConferencia.cdsPedido.Open;
  if (fDMConferencia.cdsPedido.IsEmpty) or (fDMConferencia.cdsPedidoTIPO_REG.AsString <> 'P') then
  begin
    MessageDlg('Pedido não encontrado!', mtInformation, [mbOk], 0);
    exit;
  end;
  if fDMConferencia.cdsPedidoCANCELADO.AsString = 'S' then
  begin
    MessageDlg('Pedido Cancelado!', mtInformation, [mbOk], 0);
    exit;
  end;

  fDMConferencia.cdsPedido_Item.Close;
  fDMConferencia.sdsPedido_Item.ParamByName('ID').AsInteger := fDMConferencia.cdsPedidoID.AsInteger;
  fDMConferencia.cdsPedido_Item.Open;

  btnConfirmar.Enabled := ((fDMConferencia.cdsPedido_ItemDTCONFERENCIA.AsDateTime <= 10) and not(fDMConferencia.cdsPedido_Item.IsEmpty));
  btnExcluir.Enabled   := ((fDMConferencia.cdsPedido_ItemDTCONFERENCIA.AsDateTime > 10) and not(fDMConferencia.cdsPedido_Item.IsEmpty));

  SMDBGrid2.SetFocus;
end;

procedure TfrmBaixaPedido_Processo.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if StrToFloat(FormatFloat('0.00000',fDMConferencia.cdsPedido_ItemQTD_FATURADO.AsFloat)) > 0 then
    Background := clGreen
  else
  if fDMConferencia.cdsPedido_ItemDTCONFERENCIA.AsDateTime > 10 then
    Background := $007DBEFF;
end;

procedure TfrmBaixaPedido_Processo.prc_Verifica_Pedido_Conf;
var
  vConfAux : String;
begin
  vConfAux := '';
  fDMConferencia.cdsPedido_Item.First;
  while not fDMConferencia.cdsPedido_Item.Eof do
  begin
    if (fDMConferencia.cdsPedido_ItemDTCONFERENCIA.AsDateTime > 10) then
    begin
      if vConfAux = 'N' then
        vConfAux := 'P'
      else
      if vConfAux = '' then
        vConfAux := 'S';
    end
    else
    begin
      if vConfAux = 'S' then
        vConfAux := 'P'
      else
      if vConfAux = '' then
        vConfAux := 'N';
    end;
    fDMConferencia.cdsPedido_Item.Next;
  end;

  fDMConferencia.cdsPedido.Edit;
  fDMConferencia.cdsPedidoCONFERIDO.AsString := vConfAux;
  fDMConferencia.cdsPedido.Post;
  fDMConferencia.cdsPedido.ApplyUpdates(0);
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

{  if (StrToFloat(FormatFloat('0.0000',fDMConferencia.qPedido_ItemQTD_RESTANTE.AsFloat)) <= 0) and (fDMConferencia.qPedido_ItemID.AsInteger > 0) then
  begin
    MessageDlg('Item já faturado!', mtConfirmation, [mbOk], 0);
    exit;
  end;
  if (StrToFloat(FormatFloat('0.0000',fDMConferencia.qPedido_ItemQTD_RESTANTE.AsFloat)) <= 0) and (fDMConferencia.qPedido_ItemID.AsInteger >= 0) then
  begin
    MessageDlg('Item não encontrado!', mtError, [mbOk], 0);
    exit;
  end;}

  vMSG := '';
  if fDMConferencia.qPedido_Item.IsEmpty then
    vMSG := vMSG + #13 + 'Pedido/Item não encontrado!'
  else
  if fDMConferencia.qPedido_ItemDTCONFERENCIA.AsDateTime > 10 then
    vMSG := vMSG + #13 + 'Item já Conferido!'
  else
  if StrToFloat(FormatFloat('0.0000',fDMConferencia.qPedido_ItemQTD_FATURADO.AsFloat)) > 0 then
    vMSG := vMSG + #13 + 'Item já Faturado!'
  else
  if (StrToFloat(FormatFloat('0.0000',fDMConferencia.qPedido_ItemQTD_RESTANTE.AsFloat)) <= 0) and
     (StrToFloat(FormatFloat('0.0000',fDMConferencia.qPedido_ItemQTD_CANCELADO.AsFloat)) >= 0) then
    vMSG := vMSG + #13 + 'Item já Cancelado!';

  if trim(vMSG) <> '' then
  begin
    Label3.Caption := vMSG;
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
  begin
    prc_Abrir_cdsPedido_Item;

    Prc_Gravar(True);

  end;
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

procedure TfrmBaixaPedido_Processo.Prc_Gravar(Gravar_Processo : Boolean);
var
  vItemAux : Integer;
  ID: TTransactionDesc;
  fDMAprovacao_Ped: TDMAprovacao_Ped;
begin
  fDMAprovacao_Ped := TDMAprovacao_Ped.Create(Self);

  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    if Gravar_Processo then
    begin
      fDMConferencia.cdsPedido_Item_Processo.Close;
      fDMConferencia.sdsPedido_Item_Processo.ParamByName('ID').AsInteger   := fDMConferencia.qPedido_ItemID.AsInteger;
      fDMConferencia.sdsPedido_Item_Processo.ParamByName('ITEM').AsInteger := fDMConferencia.qPedido_ItemITEM.AsInteger;
      fDMConferencia.cdsPedido_Item_Processo.Open;
      fDMConferencia.cdsPedido_Item_Processo.Last;
      vItemAux := fDMConferencia.cdsPedido_Item_ProcessoITEM_PROCESSO.AsInteger;

      fDMConferencia.cdsPedido_Item_Processo.Insert;
      fDMConferencia.cdsPedido_Item_ProcessoID.AsInteger   := fDMConferencia.qPedido_ItemID.AsInteger;
      fDMConferencia.cdsPedido_Item_ProcessoITEM.AsInteger := fDMConferencia.qPedido_ItemITEM.AsInteger;
      fDMConferencia.cdsPedido_Item_ProcessoITEM_PROCESSO.AsInteger := vItemAux + 1;
      fDMConferencia.cdsPedido_Item_ProcessoID_PROCESSO.AsInteger := vID_Processo;
      fDMConferencia.cdsPedido_Item_ProcessoQTD.AsFloat           := fDMConferencia.qPedido_ItemQTD.AsFloat;
      fDMConferencia.cdsPedido_Item_ProcessoDTENTRADA.AsDateTime  := Date;
      fDMConferencia.cdsPedido_Item_ProcessoHRENTRADA.AsDateTime  := Now;
      fDMConferencia.cdsPedido_Item_ProcessoDTBAIXA.AsDateTime    := Date;
      fDMConferencia.cdsPedido_Item_ProcessoHRSAIDA.AsDateTime    := fDMConferencia.cdsPedido_Item_ProcessoHRENTRADA.AsDateTime;
      fDMConferencia.cdsPedido_Item_Processo.Post;
      fDMConferencia.cdsPedido_Item_Processo.ApplyUpdates(0);
    end;

//    if ((Gravar_Processo) and (vID_Processo = fDMConferencia.qParametros_PedID_PROCESSO_FINAL.AsInteger)) or not(Gravar_Processo) then
    if fDMConferencia.cdsPedido_ItemITEM.AsInteger <> fDMConferencia.qPedido_ItemITEM.AsInteger then
      fDMConferencia.cdsPedido_Item.Locate('ITEM',fDMConferencia.qPedido_ItemITEM.AsInteger,[loCaseInsensitive]);
    vItemAux := fDMConferencia.cdsPedido_ItemITEM.AsInteger;
    fDMConferencia.cdsPedido_Item.Edit;
    if ((Gravar_Processo) and (vID_Processo = fDMConferencia.qParametros_PedID_PROCESSO_FINAL.AsInteger)) or not(Gravar_Processo) then
    begin
      fDMConferencia.cdsPedido_ItemDTCONFERENCIA.AsDateTime := Date;
      fDMConferencia.cdsPedido_ItemHRCONFERENCIA.AsDateTime := Now;
      fDMConferencia.cdsPedido_ItemUSUARIO_CONF.AsString    := vUsuario;
      fDMConferencia.cdsPedido_ItemQTD_CONFERIDO.AsFloat    := StrToFloat(FormatFloat('0.00000',fDMConferencia.cdsPedido_ItemQTD.AsFloat));
    end;
    if vID_Processo <= 0 then
      fDMConferencia.cdsPedido_ItemID_PROCESSO.Clear
    else
      fDMConferencia.cdsPedido_ItemID_PROCESSO.AsInteger := vID_Processo;
    fDMConferencia.cdsPedido_Item.Post;
    fDMConferencia.cdsPedido_Item.ApplyUpdates(0);
    if ((Gravar_Processo) and (vID_Processo = fDMConferencia.qParametros_PedID_PROCESSO_FINAL.AsInteger)) or not(Gravar_Processo) then
    begin
      prc_Verifica_Pedido_Conf;
      if fDMConferencia.cdsPedidoCONFERIDO.AsString = 'S' then
        fDMAprovacao_Ped.prc_Gravar_Pedido_Processo(fDMConferencia.cdsPedidoEMAIL_COMPRAS.AsString,fDMConferencia.cdsPedidoID.AsInteger,0,'E','','',Date);
    end;

    dmDatabase.scoDados.Commit(ID);

    if Gravar_Processo then
      Label3.Caption := 'Pedido: ' + fDMConferencia.cdsPedidoNUM_PEDIDO.AsString + '     Item: ' + IntToStr(fDMConferencia.qPedido_ItemITEM.AsInteger) + #13 + #13
                      + 'Processo: ' + vNome_Processo
                      + '      ** Encerrado **      ';

  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  fDMConferencia.cdsPedido_Item.Locate('ID;ITEM',VarArrayOf([fDMConferencia.cdsPedidoID.AsInteger,vItemAux]),[locaseinsensitive]);
  FreeAndNil(fDMAprovacao_Ped);
  fDMConferencia.cdsConsPedido_Item_Proc.Close;
  fDMConferencia.cdsConsPedido_Item_Proc.Open;
end;

procedure TfrmBaixaPedido_Processo.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMConferencia.cdsConsPedido_Item_ProcDTBAIXA.AsDateTime > 10 then
    Background := $007DBEFF;
end;

procedure TfrmBaixaPedido_Processo.SMDBGrid2DblClick(Sender: TObject);
begin
  if fDMConferencia.cdsPedido_ItemITEM.AsInteger > 0 then
    prc_Abrir_cdsConsPedido_Item_Proc(fDMConferencia.cdsPedidoNUM_PEDIDO.AsInteger,fDMConferencia.cdsPedido_ItemITEM.AsInteger);
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

end.
