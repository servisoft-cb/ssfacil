unit uCadConfig_Balanca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, NxCollection, ExtCtrls, Grids, DBGrids,
  SMDBGrid, RzTabs, UDMCadConfig_Balanca, RxDBComb, ToolEdit, DB, UCBase,
  uCadConfig_BalancaArquivo, IniFiles, ComCtrls;

type
  TfrmConfigBalanca = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    pnlPesquisa: TPanel;
    Label5: TLabel;
    Edit1: TEdit;
    btnConsultar: TNxButton;
    StaticText1: TStaticText;
    Panel3: TPanel;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    TS_Cadastro: TRzTabSheet;
    Panel1: TPanel;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    pnlCadastro: TPanel;
    grp1: TGroupBox;
    grp2: TGroupBox;
    grp3: TGroupBox;
    grp4: TGroupBox;
    grp5: TGroupBox;
    edtCodigo: TDBEdit;
    dbedt2: TDBEdit;
    dbedtID_TEXT: TDBEdit;
    dbedtID_POSICAO: TDBEdit;
    dbedtID_TAMANHO: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    dbedtID_POSICAO1: TDBEdit;
    dbedtID_TAMANHO1: TDBEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    dbedtID_POSICAO2: TDBEdit;
    dbedtID_TAMANHO2: TDBEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    comboTipoPreco: TRxDBComboBox;
    lbl8: TLabel;
    lbl9: TLabel;
    dbedtVLR_POSICAO: TDBEdit;
    lbl10: TLabel;
    comboUsaSeparador: TRxDBComboBox;
    lbl11: TLabel;
    dbedtVLR_TAMANHO: TDBEdit;
    dbedtNOMEARQ_TXT: TDBEdit;
    FilePath: TDirectoryEdit;
    Label1: TLabel;
    Label2: TLabel;
    pnlItens: TPanel;
    RzPageControl2: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Panel6: TPanel;
    btnInserir_Lay: TNxButton;
    btnAlterar_Lay: TNxButton;
    btnExcluir_Lay: TNxButton;
    SMDBGrid7: TSMDBGrid;
    btnGerarArquivo: TNxButton;
    ProgressBar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FilePathChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnInserir_LayClick(Sender: TObject);
    procedure btnAlterar_LayClick(Sender: TObject);
    procedure btnExcluir_LayClick(Sender: TObject);
    procedure btnGerarArquivoClick(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;

  public
    { Public declarations }
    fDMCadConfig_Balanca : TDMConfig_Balanca;
    ffrmConfigArquivoBalanca : TfrmConfigArquivoBalanca;
  end;

var
  frmConfigBalanca: TfrmConfigBalanca;

implementation

uses
  rsDBUtils, SqlExpr, DateUtils, uUtilPadrao;

{$R *.dfm}

procedure TfrmConfigBalanca.FormCreate(Sender: TObject);
begin
  fDMCadConfig_Balanca := TDMConfig_Balanca.Create(nil);
  oDBUtils.SetDataSourceProperties(Self, fDMCadConfig_Balanca);
end;

procedure TfrmConfigBalanca.FilePathChange(Sender: TObject);
begin
  fDMCadConfig_Balanca.cdsConfigBalancaNOMEARQ_TXT.AsString := FilePath.Text;
end;

procedure TfrmConfigBalanca.prc_Consultar;
begin
  fDMCadConfig_Balanca.cdsConfigBalanca.Close;
  fDMCadConfig_Balanca.cdsConfigBalanca.CommandText := fDMCadConfig_Balanca.ctCommand;
  if Trim(Edit1.Text) <> '' then
    fDMCadConfig_Balanca.sdsConfigBalanca.CommandText := fDMCadConfig_Balanca.sdsConfigBalanca.CommandText +
                                      ' WHERE DESCRICAO LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  fDMCadConfig_Balanca.cdsConfigBalanca.Open;

end;

procedure TfrmConfigBalanca.prc_Excluir_Registro;
begin
  fDMCadConfig_Balanca.prc_Excluir;
end;

procedure TfrmConfigBalanca.prc_Gravar_Registro;
begin
  fDMCadConfig_Balanca.prc_Gravar;
  if fDMCadConfig_Balanca.cdsConfigBalanca.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadConfig_Balanca.vMsgConfig, mtError, [mbok], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);
  btnAlterar_Lay.Enabled    := not(btnAlterar_Lay.Enabled);
  btnInserir_Lay.Enabled    := not(btnInserir_Lay.Enabled);
  btnExcluir_Lay.Enabled    := not(btnExcluir_Lay.Enabled);
  
end;

procedure TfrmConfigBalanca.prc_Inserir_Registro;
begin
  fDMCadConfig_Balanca.prc_Inserir;

  if fDMCadConfig_Balanca.cdsConfigBalanca.State in [dsBrowse] then
    exit;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
  btnAlterar_Lay.Enabled    := not(btnAlterar_Lay.Enabled);
  btnInserir_Lay.Enabled    := not(btnInserir_Lay.Enabled);
  btnExcluir_Lay.Enabled    := not(btnExcluir_Lay.Enabled);

  dbedt2.SetFocus;

end;

procedure TfrmConfigBalanca.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmConfigBalanca.btnExcluirClick(Sender: TObject);
begin
  if fDMCadConfig_Balanca.cdsConfigBalanca.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;

end;

procedure TfrmConfigBalanca.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
    Edit1.SetFocus
  else
    Edit1.Clear;

end;

procedure TfrmConfigBalanca.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadConfig_Balanca.cdsConfigBalanca.IsEmpty) or  not(fDMCadConfig_Balanca.cdsConfigBalanca.Active) or (fDMCadConfig_Balanca.cdsConfigBalancaID.AsInteger < 1) then
    exit;

  fDMCadConfig_Balanca.cdsConfigBalanca.Edit;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
  btnAlterar_Lay.Enabled    := not(btnAlterar_Lay.Enabled);
  btnInserir_Lay.Enabled    := not(btnInserir_Lay.Enabled);
  btnExcluir_Lay.Enabled    := not(btnExcluir_Lay.Enabled);

end;

procedure TfrmConfigBalanca.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmConfigBalanca.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadConfig_Balanca.cdsConfigBalanca.State in [dsBrowse]) or not(fDMCadConfig_Balanca.cdsConfigBalanca.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadConfig_Balanca.cdsConfigBalanca.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);
  btnAlterar_Lay.Enabled    := not(btnAlterar_Lay.Enabled);
  btnInserir_Lay.Enabled    := not(btnInserir_Lay.Enabled);
  btnExcluir_Lay.Enabled    := not(btnExcluir_Lay.Enabled);

end;

procedure TfrmConfigBalanca.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConfigBalanca.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmConfigBalanca.btnInserir_LayClick(Sender: TObject);
begin
  if (fDMCadConfig_Balanca.cdsConfigBalancaID.AsInteger < 1) or not(fDMCadConfig_Balanca.cdsConfigBalanca.Active) then
    exit;



  fDMCadConfig_Balanca.prc_inserirLayout;

  ffrmConfigArquivoBalanca := TfrmConfigArquivoBalanca.Create(self);
  ffrmConfigArquivoBalanca.fDMCadConfig_Balanca := fDMCadConfig_Balanca;
  ffrmConfigArquivoBalanca.ShowModal;

  FreeAndNil(ffrmConfigArquivoBalanca);

end;

procedure TfrmConfigBalanca.btnAlterar_LayClick(Sender: TObject);
begin
  if (fDMCadConfig_Balanca.cdsConfigBalancaLayID.AsInteger < 1) or not(fDMCadConfig_Balanca.cdsConfigBalancaLay.Active) or
     (fDMCadConfig_Balanca.cdsConfigBalancaLay.IsEmpty) then
    exit;

  fDMCadConfig_Balanca.cdsConfigBalancaLay.Edit;

  ffrmConfigArquivoBalanca := TfrmConfigArquivoBalanca.Create(self);
  ffrmConfigArquivoBalanca.fDMCadConfig_Balanca := fDMCadConfig_Balanca;
  ffrmConfigArquivoBalanca.ShowModal;

  FreeAndNil(ffrmConfigArquivoBalanca);

end;

procedure TfrmConfigBalanca.btnExcluir_LayClick(Sender: TObject);
begin
  if fDMCadConfig_Balanca.cdsConfigBalancaLay.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadConfig_Balanca.cdsConfigBalancaLay.Delete;

end;

procedure TfrmConfigBalanca.btnGerarArquivoClick(Sender: TObject);
Var
  I,TamRegistro:Integer;
  Registro,LinhaVazia,Separador, STR:String;
  Arquivo:TextFile;
begin
  if (not fDMCadConfig_Balanca.cdsConfigBalancaLay.IsEmpty) Then
  begin
      AssignFile(Arquivo,fDMCadConfig_Balanca.cdsConfigBalancaNOMEARQ_TXT.AsString);
      Rewrite(Arquivo);
      TamRegistro:=0;
      fDMCadConfig_Balanca.cdsConfigBalancaLay.First;
      while not fDMCadConfig_Balanca.cdsConfigBalancaLay.Eof Do
        Begin
          TamRegistro := TamRegistro + fDMCadConfig_Balanca.cdsConfigBalancaLayTAMANHO.Value;
          fDMCadConfig_Balanca.cdsConfigBalancaLay.Next;
        End;
      LinhaVazia := '';
      for I := 1 To TamRegistro Do
        LinhaVazia := LinhaVazia + ' ';

      with fDMCadConfig_Balanca do
      begin
        cdsProduto.Open;
        cdsProduto.Last;
        cdsProduto.First;
        ProgressBar.Min := 1;
        ProgressBar.Max := cdsProduto.RecordCount;
        ProgressBar.Visible := True;
        ProgressBar.Update;
        ProgressBar.Position := 1;
        cdsProduto.DisableControls;

        try
          While Not cdsProduto.Eof Do
            Begin
              If cdsProduto.FieldByName('CODIGO_BALANCA').AsInteger > 0 Then
                Begin
                  Registro := LinhaVazia;
                  cdsConfigBalancaLay.First;
                  While Not cdsConfigBalancaLay.EOF Do
                    Begin
                      Case cdsProduto.FieldByName(cdsConfigBalancaLayCAMPO.Value).DataType Of
                        FtInteger  :begin
                                       Registro := Copy(Registro,1,cdsConfigBalancaLayPOSICAO.Value - 1) +
                                       Preenche(cdsProduto.FieldByName(cdsConfigBalancaLayCAMPO.Value).AsString,'0',cdsConfigBalancaLayTAMANHO.Value,0);

                                    end;
                        FtString   :begin
                                      Registro := Copy(Registro,1,cdsConfigBalancaLayPOSICAO.Value - 1) +
                                      Preenche(cdsProduto.FieldByName(cdsConfigBalancaLayCAMPO.Value).asString, '', cdsConfigBalancaLayTAMANHO.Value,2) +
                                      Copy(Registro,cdsConfigBalancaLayPOSICAO.Value + cdsConfigBalancaLayTAMANHO.Value , TamRegistro - (cdsConfigBalancaLayPOSICAO.Value+cdsConfigBalancaLayTAMANHO.Value));
                                    end;
                        FtBCD,
                        FtFloat    :if cdsConfigBalancaUSA_SEPARADOR.AsString = 'S' then
                                      begin
                                        Separador := cdsConfigBalancaTIPO_SEPARADOR.AsString;
                                        Registro  := Copy(Registro, 1, cdsConfigBalancaLayPOSICAO.Value - 1) +
                                                     Format('%.'+IntToStr(cdsConfigBalancaLayTAMANHO.Value - 1 - cdsConfigBalancaDECIMAIS.Value)+ 'd' ,[Round(Int(cdsProduto.FieldByName(cdsConfigBalancaLayCAMPO.Value).asFloat))]) + Separador +
                                                     Copy(Format('%.'+IntToStr(cdsConfigBalancaDECIMAIS.Value)+'f',[Frac(cdsProduto.FieldByName(cdsConfigBalancaLayCAMPO.AsString).Value)]),3,cdsConfigBalancaDECIMAIS.AsInteger)+
                                                     Copy(Registro,cdsConfigBalancaLayPOSICAO.Value+ cdsConfigBalancaLayTAMANHO.Value,TamRegistro + 1 - (cdsConfigBalancaLayPOSICAO.Value + cdsConfigBalancaLayTAMANHO.Value));
                                      end
                                    else
                                      Begin
                                        STR := FormatFloat('#,##0.00',cdsProduto.FieldByName(cdsConfigBalancaLayCAMPO.Value).AsFloat);
                                        While Pos('.',STR) > 0 do
                                          Delete(STR,Pos('.',STR),1);
                                        While Pos(',',STR) > 0 do
                                          Delete(STR,Pos(',',STR),1);
                                        Registro :=Copy(Registro,1,cdsConfigBalancaLayPOSICAO.Value - 1) +
                                        Preenche(STR, '0',cdsConfigBalancaLayTAMANHO.Value,0);
                                      End;
                      End;
                      cdsConfigBalancaLay.Next;
                    end;
                  WriteLn(Arquivo, Registro);
                End;
              cdsProduto.Next;
              ProgressBar.Position := ProgressBar.Position + 1;
              ProgressBar.UpDate;
            End;
          CloseFile(Arquivo);
        except
          Application.MessageBox('Problemas na geração do arquivo, verifique suas configurações !', PChar('Advanced Control Informa'), MB_SYSTEMMODAL + MB_Ok + MB_IconInformation);
          CloseFile(Arquivo);
          Abort;
        end;
        cdsConfigBalancaLay.EnableControls;
        cdsProduto.Close;
      end;
      Application.MessageBox('Operação Concluida com Sucesso!', PChar('Advanced Control Informa'), MB_SYSTEMMODAL + MB_Ok + MB_IconInformation);
      ProgressBar.Visible:=False;
      ProgressBar.UpDate;
  end;
end;

end.
