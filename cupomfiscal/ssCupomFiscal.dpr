program SSCupomFiscal;



uses
  Forms,
  DmdDatabase in '..\DmdDatabase.pas' {dmDatabase: TDataModule},
  uMenu in 'uMenu.pas' {fMenu},
  uCupomFiscalC in 'uCupomFiscalC.pas' {fCupomFiscalC},
  uDmCupomFiscal in 'uDmCupomFiscal.pas' {dmCupomFiscal: TDataModule},
  UCupomFiscal in 'UCupomFiscal.pas' {fCupomFiscal},
  UCupomFiscalCanc in 'uCupomFiscalCanc.pas' {fCupomFiscalCanc},
  UCupomFiscalCli in 'uCupomFiscalCli.pas' {fCupomFiscalCli},
  UCupomFiscalPgto in 'uCupomFiscalPgto.pas' {fCupomFiscalPgto},
  uImpFiscal_Bematech in 'uImpFiscal_Bematech.pas',
  uImpFiscal_Daruma in 'uImpFiscal_Daruma.pas',
  uUtilBematech in 'uUtilBematech.pas',
  uUtilDaruma in 'uUtilDaruma.pas',
  rsDBUtils in '..\..\rslib\nova\rsDBUtils.pas',
  UDMEstoque in '..\UDMEstoque.pas' {DMEstoque: TDataModule},
  UDMMovimento in '..\UDMMovimento.pas' {DMMovimento: TDataModule},
  uUtilPadrao in '..\uUtilPadrao.pas',
  UEscolhe_Filial in '..\UEscolhe_Filial.pas' {frmEscolhe_Filial},
  USel_Produto in '..\USel_Produto.pas' {frmSel_Produto},
  uImpFiscal_Elgin in 'uImpFiscal_Elgin.pas',
  uCupomParametros in 'uCupomParametros.pas' {fCupomParametros},
  uUtilElgin in 'uUtilElgin.pas',
  UDMCadExtComissao in '..\UDMCadExtComissao.pas' {DMCadExtComissao: TDataModule},
  UDMGravarFinanceiro in '..\UDMGravarFinanceiro.pas' {DMGravarFinanceiro: TDataModule},
  LogProvider in '..\..\logs\src\LogProvider.pas',
  LogTypes in '..\..\logs\src\LogTypes.pas',
  UDMRel in '..\UDMRel.pas' {DMRel: TDataModule},
  SendMailOptions in '..\sendmail\SendMailOptions.pas' {FormSendMailOptions},
  SelfPrintDefs in '..\sendmail\SelfPrintDefs.pas',
  SendMail in '..\sendmail\SendMail.pas',
  uDmCupomTerminal in 'uDmCupomTerminal.pas' {dmCupomTerminal: TDataModule},
  uCupomTerminal in 'uCupomTerminal.pas' {fCupomTerminal},
  uDmParametros in 'uDmParametros.pas' {dmParametros: TDataModule},
  UCadFechamento in 'UCadFechamento.pas' {frmCadFechamento},
  UCadFechamento_Itens in 'UCadFechamento_Itens.pas' {frmCadFechamento_Itens},
  UCadFechamento_Sangria in 'UCadFechamento_Sangria.pas' {frmCadFechamento_Sangria},
  UDMCadFechamento in 'UDMCadFechamento.pas' {DMCadFechamento: TDataModule},
  URelFechamento in 'URelFechamento.pas' {fRelFechamento},
  uNFeComandos in '..\uNFeComandos.pas',
  uCupomFiscalParcela in 'uCupomFiscalParcela.pas' {fCupomFiscalParcela},
  uComandaR in 'uComandaR.pas' {fComandaR},
  uCartao in 'uCartao.pas' {fCartao},
  uCupomFiscalPgtoMulti in 'uCupomFiscalPgtoMulti.pas' {fCupomFiscalPgtoMulti},
  UDMNFCe in '..\NFCe\UDMNFCe.pas' {DMNFCe: TDataModule},
  uCupomFiscalImposto in 'uCupomFiscalImposto.pas' {fCupomFiscalImposto},
  uCalculo_CupomFiscal in 'uCalculo_CupomFiscal.pas',
  uNFCe in '..\NFCe\uNFCe.pas' {fNFCe},
  nfe_v110 in '..\nfe_v110.pas',
  URelDanfe_NFCe in '..\NFCe\URelDanfe_NFCe.pas' {fRelDanfe_NFCe},
  DmdDatabase_NFeBD in '..\DmdDatabase_NFeBD.pas' {dmDatabase_NFeBD: TDataModule},
  UDMConsNotaEletronica in '..\UDMConsNotaEletronica.pas' {DMConsNotaEletronica: TDataModule},
  UCupomFiscal_Canc in '..\NFCe\UCupomFiscal_Canc.pas' {fCupomFiscal_Canc},
  USenha in '..\USenha.pas' {frmSenha},
  uUtilCliente in '..\uUtilCliente.pas',
  uUtilCupom in 'uUtilCupom.pas',
  UCadFechamento_Contagem in 'UCadFechamento_Contagem.pas' {frmCadFechamento_Contagem},
  UConsPreco in 'UConsPreco.pas' {frmConsPreco},
  USel_Sacola_CF in 'USel_Sacola_CF.pas' {frmSel_Sacola_CF},
  USel_Pedido_CF in 'USel_Pedido_CF.pas' {frmSel_Pedido_CF},
  USel_Pessoa in '..\USel_Pessoa.pas' {frmSel_Pessoa},
  UDMCadCupomFiscal_MP in 'UDMCadCupomFiscal_MP.pas' {DMCadCupomFiscal_MP: TDataModule},
  UConsPessoa_Fin in '..\UConsPessoa_Fin.pas' {frmConsPessoa_Fin},
  UDMConsPessoa in '..\UDMConsPessoa.pas' {DMConsPessoa: TDataModule},
  uCarnePgto in 'uCarnePgto.pas' {fCarnePgto},
  uDmPagamento in 'uDmPagamento.pas' {dmPagamento: TDataModule},
  uCupomCliente in 'uCupomCliente.pas' {fCupomCliente},
  UDMSel_Produto in '..\UDMSel_Produto.pas' {DMSel_Produto: TDataModule},
  USel_Produto_Preco in '..\USel_Produto_Preco.pas' {frmSel_Produto_Preco},
  uCupomDadosCli in 'uCupomDadosCli.pas' {frmCupomDadosCli},
  UDMCadDuplicata in '..\UDMCadDuplicata.pas' {DMCadDuplicata: TDataModule},
  UCadFechamento_Det in '..\UCadFechamento_Det.pas' {frmCadFechamento_Det},
  USel_Comanda_CF in 'USel_Comanda_CF.pas' {frmSel_Comanda_CF},
  uPrevVendas in 'uPrevVendas.pas' {fPrevVendas},
  USel_Produto_Lote in '..\PedidoLoja\USel_Produto_Lote.pas' {frmSel_Produto_Lote},
  uCupomDevolucao in 'uCupomDevolucao.pas' {fCupomDevolucao},
  uDmDevolucao in 'uDmDevolucao.pas' {dmDevolucao: TDataModule},
  uCupomDevolucao_Itens in 'uCupomDevolucao_Itens.pas' {fCupomDevolucao_Itens},
  uCarnePgtoC in 'uCarnePgtoC.pas' {fCarnePgtoC},
  UNFCe_Log in '..\nfce\UNFCe_Log.pas' {frmNFCe_Log},
  uSel_CorTamanho in 'uSel_CorTamanho.pas' {fSel_CorTamanho},
  uMenu1 in 'uMenu1.pas' {fMenu1},
  uAlteraDt_NFCe in 'uAlteraDt_NFCe.pas' {frmAlteraDt_NFCe},
  uXMLNFCe4_00 in '..\nfce\uXMLNFCe4_00.pas',
  enviNFe_v400 in '..\nfe\4.00\enviNFe_v400.pas',
  uGrava_Erro in '..\uGrava_Erro.pas',
  uBalanca in 'uBalanca.pas',
  uNFeConsts in '..\uNFeConsts.pas',
  UConsProdutoNCM in '..\UConsProdutoNCM.pas' {frmConsProdutoNCM},
  UDMConsProduto in '..\UDMConsProduto.pas' {DMConsProduto: TDataModule},
  UAltCFOPProd in '..\UAltCFOPProd.pas' {frmAltCFOPProd},
  UCadFechamento_Contagem2 in 'UCadFechamento_Contagem2.pas' {frmCadFechamento_Contagem2},
  UCadFechamento2 in 'UCadFechamento2.pas' {frmCadFechamento2},
  uCarneRenegociacao in 'uCarneRenegociacao.pas' {fCarneRenegociacao},
  uRenegociacao in 'uRenegociacao.pas' {fRenegociacao};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ssCupomFiscal';
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TfMenu, fMenu);
  Application.CreateForm(TfMenu1, fMenu1);
  fMenu1.FormStyle := fsMDIChild;
  fMenu1.Show;

  Application.Run;
end.
