unit UCadNotaFiscal_ST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, ExtCtrls, DBCtrls, StdCtrls, UDMCadNotaFiscal,
  NxCollection, DB ;

type
  TfrmCadNotaFiscal_ST = class(TForm)
    SMDBGrid2: TSMDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    DBText5: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    Label8: TLabel;
    DBText8: TDBText;
    Label9: TLabel;
    DBText9: TDBText;
    btnSubstTributaria: TNxButton;
    Panel2: TPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSubstTributariaClick(Sender: TObject);
  private
    { Private declarations }
    procedure prc_scroll(DataSet: TDataSet);

  public
    { Public declarations }
    fDMCadNotaFiscal: TDMCadNotaFiscal;
    
  end;

var
  frmCadNotaFiscal_ST: TfrmCadNotaFiscal_ST;

implementation

uses rsDBUtils, UMostrarRegras, uCalculo_NotaFiscal;

{$R *.dfm}

procedure TfrmCadNotaFiscal_ST.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fDMCadNotaFiscal.cdsNotaFiscal_Itens.AfterScroll := nil;
  fDMCadNotaFiscal.cdsNotaFiscal_Itens.Last;
  fDMCadNotaFiscal.cdsNotaFiscal_Itens.First;
  Action := Cafree;
end;

procedure TfrmCadNotaFiscal_ST.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadNotaFiscal);

  fDMCadNotaFiscal.cdsNotaFiscal_Itens.AfterScroll := prc_scroll;
end;

procedure TfrmCadNotaFiscal_ST.btnSubstTributariaClick(Sender: TObject);
begin
  frmMostrarRegras := TfrmMostrarRegras.Create(self);
  frmMostrarRegras.vMostrar_Regra := 'ST';
  frmMostrarRegras.ShowModal;
  FreeAndNil(frmMostrarRegras);
end;

procedure TfrmCadNotaFiscal_ST.prc_scroll(DataSet: TDataSet);
var
  vBaseSubst, vVlrSubst: Real;
  vIcmsAux: Real;
  vBaseICMAux: Real;
  vVICMS: Real;
  vPercRedST: Real;
  vUF: String;
  vTotalProdAux: Real;
  vVlrAgregado: Real;
  vPerc_MVA: Real;
  vTipo_Cliente: String;
  vImportado_Nacional: String;
  vAux: Real;
  vPerc_Red_MVA: Real;
  vID_OBS_Lei: Integer;
  vVlrTotal: Real;
  vPerc_Reducao_Base: Real;
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  if fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger <> fDMCadNotaFiscal.cdsClienteCODIGO.AsInteger then
    fDMCadNotaFiscal.cdsCliente.Locate('CODIGO',fDMCadNotaFiscal.cdsNotaFiscalID_CLIENTE.AsInteger,[loCaseInsensitive]);
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '1')  or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '2')
    or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '3') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '8') then
    vImportado_Nacional := 'I'
  else
    vImportado_Nacional := 'N';

  if (fDMCadNotaFiscal.cdsClientePESSOA.AsString = 'F') or (fDMCadNotaFiscal.cdsClienteTIPO_CONSUMIDOR.AsInteger  = 1) then
  begin
    if fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger > 0 then
    begin
      if fDMCadNotaFiscal.cdsCFOP_Variacao.Locate('ID;ITEM',VarArrayOf([fDMCadNotaFiscal.cdsNotaFiscal_ItensID_CFOP.AsInteger,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_VARIACAO.AsInteger]),[locaseinsensitive]) then
      begin
        if fDMCadNotaFiscal.cdsCFOP_VariacaoCALCULAR_ST.AsString <> 'S' then
        begin
          Memo1.Lines.Add('Marcado para calcular por Variação, e a variação esta como NÃO Calcular');
          exit;
        end;
      end;
    end;
  end;
  //*****************

  vID_OBS_Lei := 0;
  if (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '1')  or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '2')
    or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '3') or (fDMCadNotaFiscal.cdsNotaFiscal_ItensORIGEM_PROD.AsString = '8') then
    vImportado_Nacional := 'I'
  else
    vImportado_Nacional := 'N';
  fDMCadNotaFiscal.cdsTab_NCM.Locate('ID',fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger,([Locaseinsensitive]));

  if (fDMCadNotaFiscal.qParametros_ProdCONTROLAR_PROD_ST.AsString = 'S') and (fDMCadNotaFiscal.cdsProdutoCALCULAR_ST.AsString = 'N') then
  begin
    Memo1.Lines.Add('Esta marcado no Parâmetros que é para controlar o cálculo da ST por Produto.');
    Memo1.Lines.Add('');
    Memo1.Lines.Add('No Produto ID ' + fDMCadNotaFiscal.cdsNotaFiscal_ItensID_PRODUTO.AsString + ' esta marcado como NÃO Calcular ST.');
    exit;
  end;

  if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S') and (fDMCadNotaFiscal.cdsTab_NCMUSAR_MVA_UF_DESTINO.AsString <> 'S') then
    vUF := fDMCadNotaFiscal.cdsFilialUF.AsString
  else
    vUF := fDMCadNotaFiscal.cdsClienteUF.AsString;
  if fDMCadNotaFiscal.cdsUFUF.AsString <> fDMCadNotaFiscal.cdsClienteUF.AsString then
    fDMCadNotaFiscal.cdsUF.Locate('UF',fDMCadNotaFiscal.cdsClienteUF.AsString,([Locaseinsensitive]));
  vTipo_Cliente := '';
  if fDMCadNotaFiscal.cdsClienteID_REGIME_TRIB.AsInteger > 0 then
  begin
    fDMCadNotaFiscal.qRegime_Trib.Close;
    fDMCadNotaFiscal.qRegime_Trib.ParamByName('ID').AsInteger := fDMCadNotaFiscal.cdsClienteID_REGIME_TRIB.AsInteger;
    fDMCadNotaFiscal.qRegime_Trib.Open;
    if fDMCadNotaFiscal.qRegime_TribCODIGO.AsInteger < 3 then
      vTipo_Cliente := 'S'
    else
      vTipo_Cliente := 'G';
  end;

  Memo1.Lines.Add('UF para cálculo: ' + vUF);
  if vTipo_Cliente = 'G' then
    Memo1.Lines.Add('Cliente do Regime Geral')
  else
    Memo1.Lines.Add('    Cliente do Regime Simples');

  vPercRedST    := StrToFloat(FormatFloat('0.00',0));
  vPerc_Reducao_Base := StrToFloat(FormatFloat('0.00',0));
  prc_Abrir_qProduto_UF(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_Produto.AsInteger,vUF);

  if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsTab_NCMPERC_BASE_ICMS.AsFloat)) > 0 then
    vPerc_Reducao_Base := fDMCadNotaFiscal.cdsTab_NCMPERC_BASE_ICMS.AsFloat;

  if not(fDMCadNotaFiscal.qProduto_UF.IsEmpty) then
  begin
    if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ST.AsFloat)) > 0) then
      vPercRedST := StrToFloat(FormatFloat('0.00000',fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ST.AsFloat));
    if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat)) > 0) then
      vPerc_Reducao_Base := StrToFloat(FormatFloat('0.00000',fDMCadNotaFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat));
  end;

  if (StrToFloat(FormatFloat('0.0000',vPerc_Reducao_Base)) <= 0) and (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsProdutoPERC_REDUCAOICMS.AsFloat)) > 0) then
    vPerc_Reducao_Base := StrToFloat(FormatFloat('0.00000',fDMCadNotaFiscal.cdsProdutoPERC_REDUCAOICMS.AsFloat));
  if vUF <> fDMCadNotaFiscal.cdsClienteUF.AsString then
    prc_Abrir_qProduto_UF(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_Produto.AsInteger,fDMCadNotaFiscal.cdsClienteUF.AsString);

  prc_Abrir_qNCM_UF(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger,vUF,'A');
  if fDMCadNotaFiscal.qNCM_UF.IsEmpty then
  begin
    prc_Abrir_qNCM_UF(fDMCadNotaFiscal,fDMCadNotaFiscal.cdsNotaFiscal_ItensID_NCM.AsInteger,vUF,vImportado_Nacional);
    if fDMCadNotaFiscal.qNCM_UF.IsEmpty then
    begin
      Memo1.Lines.Text := 'Não cadastrado o %MVA no NCM para a UF <' + vUF + '>';
      exit;
    end;
  end;

  if vTipo_Cliente = 'G' then
  begin
    if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_BASE_ST.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',vPercRedST)) <= 0) then
      vPercRedST :=  StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_BASE_ST.AsFloat))
  end
  else
  if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_BASE_ST_SIMPLES.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',vPercRedST)) <= 0) then
    vPercRedST :=  StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_BASE_ST_SIMPLES.AsFloat));
  //***********

  if copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) <> '3' then
  begin
    if (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.cdsProdutoPERC_REDUCAOICMSSUBST.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',vPercRedST)) <= 0) then
      vPercRedST := StrToCurr(FormatCurr('0.0000',fDMCadNotaFiscal.cdsProdutoPERC_REDUCAOICMSSUBST.AsFloat));
    if (StrToFloat(FormatFloat('0.0000',fDMCadNotaFiscal.qNCM_UFPERC_RED_STRIB.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',vPercRedST)) <= 0) then
      vPercRedST := StrToCurr(FormatCurr('0.0000',fDMCadNotaFiscal.qNCM_UFPERC_RED_STRIB.AsFloat));

    vBaseICMAux := StrToCurr(FormatCurr('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_IPI.AsFloat
                 + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_FRETE.AsFloat + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_SEGURO.AsFloat
                 + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_OUTRASDESPESAS.AsFloat + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_IPI_DEVOL.AsFloat)); //09/01/2018
    vVlrTotal   := StrToCurr(FormatCurr('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat
                 + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_FRETE.AsFloat + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_SEGURO.AsFloat + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_OUTRASDESPESAS.AsFloat));
  end
  else
  begin
    vBaseICMAux := StrToCurr(FormatCurr('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensBASE_ICMS.AsFloat));
    vVlrTotal   := StrToCurr(FormatCurr('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensBASE_ICMS.AsFloat ));
  end;

  Memo1.Lines.Add('% Redução ST: ' + FormatFloat('0.00##',vPercRedST)); 
  Memo1.Lines.Add('% Origem BaseICMS: ' + FormatFloat('0.00##',vBaseICMAux));
  Memo1.Lines.Add('% Redução ST: ' + FormatFloat('0.00##',vPercRedST));

  Memo2.Lines.Add('Vlr Total: ' + FormatFloat('###,###,##0.00',vVlrTotal));
  Memo2.Lines.Add('% Red. Base: ' + FormatFloat('0.00##',vPerc_Reducao_Base));

  if StrToFloat(FormatFloat('0.00000',vPerc_Reducao_Base)) > 0 then
  begin
    if fDMCadNotaFiscal.cdsParametrosARREDONDAR_5.AsString = 'B' then
      vVlrTotal := StrToCurr(FormatCurr('0.00',vVlrTotal * (vPerc_Reducao_Base / 100)))
    else
      vVlrTotal := StrToFloat(FormatFloat('0.00',vVlrTotal * (vPerc_Reducao_Base / 100)));
  end;
  //**************

  if copy(fDMCadNotaFiscal.cdsNotaFiscal_ItensCODCFOP.AsString,1,1) <> '3' then
  begin
    if (fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString = 'S') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_IPI_DEVOL.AsFloat)) > 0) then
      vVlrTotal := StrToCurr(FormatCurr('0.00',vVlrTotal + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_IPI_DEVOL.AsFloat))
    else
    if (fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString = 'S') then
      vVlrTotal := StrToCurr(FormatCurr('0.00',vVlrTotal + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_IPI.AsFloat));
    Memo2.Lines.Add('Calcular ICMS Sobre IPI: <' + fDMCadNotaFiscal.cdsNotaFiscal_ItensCALCULARICMSSOBREIPI.AsString + ' >');
  end;

  //23/05/2014
  vPerc_MVA  := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFMVAINTERNO.AsFloat));
  Memo1.Lines.Add('% MVA Original: ' + FormatFloat('0.00##',vPerc_MVA));

  if StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFMVAINTERNO.AsFloat)) > 0 then
  begin
    vPerc_Red_MVA := 0;
    if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString = 'S') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_MVA.AsFloat)) > 0) then
      vPerc_Red_MVA := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_MVA.AsFloat))
    else
    if (fDMCadNotaFiscal.cdsFilialSIMPLES.AsString <> 'S') and (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_MVA_GERAL.AsFloat)) > 0) then
      vPerc_Red_MVA := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_MVA_GERAL.AsFloat));
    if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_MVA_CLI_GERAL.AsFloat)) > 0) and (vTipo_Cliente = 'G') then
      vPerc_Red_MVA := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_MVA_CLI_GERAL.AsFloat))
    else
    if (StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_MVA_CLI_SIMPLES.AsFloat)) > 0) and (vTipo_Cliente = 'S') then
      vPerc_Red_MVA := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.qNCM_UFPERC_RED_MVA_CLI_SIMPLES.AsFloat));

    Memo1.Lines.Add('% Redução MVA: ' + FormatFloat('0.00##',vPerc_Red_MVA));
  end;

  if (fDMCadNotaFiscal.qNCM_UFAJUSTAR_MVA.AsString = 'A') or (vTipo_Cliente = fDMCadNotaFiscal.qNCM_UFAJUSTAR_MVA.AsString) then
    Memo1.Lines.Add('MVA Ajustado');

end;

end.
