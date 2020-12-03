unit uUtil_Pedido;

interface

uses
  Classes, SysUtils, Dialogs, SqlExpr, DmdDatabase, Messages, Controls, Graphics, UDMCadPedido, Variants, DB, StrUtils,
  frxExportMail, frxClass, frxExportPDF, RLFilters, RLPDFFilter;

  procedure prc_Before_frxReport1(fDMCadPedido: TDMCadPedido);

implementation

uses uUtilPadrao, DateUtils, SysConst;

var
  vCalcFrete, vCalcTotalNota: Real;
  vContadorOutros: Integer;

procedure prc_Before_frxReport1(fDMCadPedido: TDMCadPedido);
var
  i: Integer;
  vArq: String;
  vArqC: String;
  vCol: Integer;
  vCompl: String;
  vCompl2: String;
  vImpTotal: Boolean;
begin
  vCompl  := '';
  vCompl2 := '2_';

  try
    if (fDMCadPedido.vNum_Rel_Fast = 3) then
    begin
      TfrxPictureView(fDMCadPedido.frxReport1.FindComponent('Foto_Prod')).Picture := nil;
      if FileExists(fDMCadPedido.mItensImpFoto_End.AsString) then
      begin
        TfrxPictureView(fDMCadPedido.frxReport1.FindComponent('Foto_Prod')).Picture.LoadFromFile(fDMCadPedido.mItensImpFoto_End.AsString);
      end;
    end;
  except
  end;

  if (fDMCadPedido.vNum_Rel_Fast > 1) or (fDMCadPedido.vTipo_Rel_Ped = 'P') or (fDMCadPedido.vTipo_Rel_Ped = 'R') and (fDMCadPedido.cdsParametrosUSA_GRADE.AsString = 'S') then
  begin
    i := 1;
    vCol := 9;
    if (fDMCadPedido.vTipo_Rel_Ped = 'P') then
      //vCol := 17
      vCol := 18
    else
    if (fDMCadPedido.vTipo_Rel_Ped = 'R') then
    begin
      //vCol   := 17;
      vCol   := 18;
      if fDMCadPedido.mItensImpImp_Continua.AsString = 'N' then
      begin
        vCol    := 14;
        vCompl  := '_B';
        vCompl2 := '1_';
      end;
    end;
    for i := 1 to vCol do
    begin
      if fDMCadPedido.cdsParametrosUSA_GRADE.AsString = 'S' then
      begin
        TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam'+vCompl+IntToStr(i))).Visible := False;
        if (fDMCadPedido.vTipo_Rel_Ped = 'P') or (fDMCadPedido.vTipo_Rel_Ped = 'R') then
        begin
          TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam_Mat'+vCompl+IntToStr(i))).Visible       := False;
          TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Tam'+vCompl+IntToStr(i))).Visible     := False;
          TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Tam_Mat'+vCompl+IntToStr(i))).Visible := False;
          TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Qtd'+vCompl+IntToStr(i))).Visible     := False;

          if (fDMCadPedido.vTipo_Rel_Ped = 'R') then
          begin
            TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_S'+vCompl2+IntToStr(i))).Visible := False;
            TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd_S'+vCompl2+IntToStr(i))).Visible   := False;
          end;
        end;
        TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd'+vCompl+IntToStr(i))).Visible := False;
      end;
    end;

    try
      if fDMCadPedido.vNum_Rel_Fast = 3 then
      begin
       TfrxPictureView(fDMCadPedido.frxReport1.FindComponent('Foto_Prod')).Picture := nil;
        if FileExists(fDMCadPedido.mItensImpFoto_End.AsString) then
        begin
          TfrxPictureView(fDMCadPedido.frxReport1.FindComponent('Foto_Prod')).Picture.LoadFromFile(fDMCadPedido.mItensImpFoto_End.AsString);
        end;
      end;
    except
    end;

    i := 0;
    fDMCadPedido.mItensImp_Tam.First;
    while not fDMCadPedido.mItensImp_Tam.Eof do
    begin
      i := i + 1;
      if i > vCol then
        fDMCadPedido.vMSGErro := fDMCadPedido.vMSGErro + #13 + 'Tamanho excedeu a quantidade limite do Item ' + fDMCadPedido.mItensImpItem.AsString
      else
      begin
        if fDMCadPedido.mItensImp_TamQtd.AsInteger > 0 then
        begin
          TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam'+vCompl+IntToStr(i))).Visible := True;
          TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam'+vCompl+IntToStr(i))).Text    := fDMCadPedido.mItensImp_TamTamanho.AsString;
          if (fDMCadPedido.vTipo_Rel_Ped = 'P') or (fDMCadPedido.vTipo_Rel_Ped = 'R') then
          begin
            TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam_Mat'+vCompl+IntToStr(i))).Visible       := True;
            TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam_Mat'+vCompl+IntToStr(i))).Text          := fDMCadPedido.mItensImp_TamTam_Matriz.AsString;
            TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Tam'+vCompl+IntToStr(i))).Visible     := True;
            TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Tam_Mat'+vCompl+IntToStr(i))).Visible := True;
            TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Qtd'+vCompl+IntToStr(i))).Visible     := True;
            if (fDMCadPedido.vTipo_Rel_Ped = 'R') then
            begin
              TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_S'+vCompl2+IntToStr(i))).Visible := True;
              TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd_S'+vCompl2+IntToStr(i))).Visible   := True;
            end;
          end;
          TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd'+vCompl+IntToStr(i))).Visible := True;
          TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd'+vCompl+IntToStr(i))).Text    := fDMCadPedido.mItensImp_TamQtd.AsString;
        end;
      end;
      fDMCadPedido.mItensImp_Tam.Next;
    end;
    vImpTotal := False;
    if ((fDMCadPedido.vImpPedTerceiro = False) or ((fDMCadPedido.vImpPedTerceiro) and (fDMCadPedido.mItensImp_Tam.RecordCount > 0))) then
      vImpTotal := True;

    if ((fDMCadPedido.vTipo_Rel_Ped = 'P') or (fDMCadPedido.vTipo_Rel_Ped = 'R')) and (vImpTotal) and (fDMCadPedido.cdsParametrosUSA_GRADE.AsString = 'S') then
    begin
      i := i + 1;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam'+vCompl+IntToStr(i))).Visible := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam'+vCompl+IntToStr(i))).Text    := 'Total';
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam_Mat'+vCompl+IntToStr(i))).Visible := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam_Mat'+vCompl+IntToStr(i))).Text    := '';
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd'+vCompl+IntToStr(i))).Visible := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd'+vCompl+IntToStr(i))).Text    := fDMCadPedido.mItensImpQtd.AsString;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Tam'+vCompl+IntToStr(i))).Visible     := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Tam_Mat'+vCompl+IntToStr(i))).Visible := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Qtd'+vCompl+IntToStr(i))).Visible     := True;

      if fDMCadPedido.vTipo_Rel_Ped = 'R' then
      begin
        TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_S'+vCompl2+IntToStr(i))).Visible := True;
        TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd_S'+vCompl2+IntToStr(i))).Visible   := True;

      end;
    end;
    if (fDMCadPedido.vTipo_Rel_Ped = 'R') and (fDMCadPedido.mItensImpImp_Continua.AsString = 'N') then
    begin
      i := i + 1;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam'+vCompl+IntToStr(i))).Visible := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam'+vCompl+IntToStr(i))).Text    := 'D/Nota';
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam_Mat'+vCompl+IntToStr(i))).Visible := False;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Tam_Mat'+vCompl+IntToStr(i))).Text    := '';
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd'+vCompl+IntToStr(i))).Visible     := False;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Tam'+vCompl+IntToStr(i))).Visible     := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Tam_Mat'+vCompl+IntToStr(i))).Visible := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_Qtd'+vCompl+IntToStr(i))).Visible     := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Shape_S'+vCompl2+IntToStr(i))).Visible := True;
      TfrxMemoView(fDMCadPedido.frxReport1.FindComponent('Qtd_S'+vCompl2+IntToStr(i))).Visible   := True;
    end;
  end;

end;

end.
