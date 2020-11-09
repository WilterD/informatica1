//12. Escriba  un  Algoritmo,  que  determine  el  monto  a  pagar  de  una  llamada
//telefónica  teni endo  en  cuenta  lo  siguiente:  toda  llamada  que  dure  hasta  3
//minutos  tiene  un  costo  de  35  Bs.  Por  cada  minuto  adicional  se  cobra  una
//tarifa  de  15  Bs.  Se  debe  leer  el  tiempo  de  llamadas  en  el  formato  hh:mm.
//Salida: tiempo de llamada y costo

program LlamadaTelefonica;
uses crt;
var
  ValorMinuto,CostoH,CostoM,CostoT,CostoAdicional,adicional,hora,minutos,conversion,aux,aux2:integer;

begin
  CostoM:=0;
  CostoH:=0;
  conversion:=0;
  adicional:=0;
  ValorMinuto:=35;
  adicional:=15;
  writeln('Cuantas horas estuvo en llamada');
  readln(hora);
  repeat
  writeln('Cuantos minutos estuvo en llamada');
  readln(minutos);
  until (minutos<60);
  if hora>0 then
  begin
    aux:=ValorMinuto*3;
    conversion:=hora*60;
    CostoH:=((Conversion-3)*adicional)+(aux);
  end;
  if minutos<=3 then
  begin
    CostoM:=minutos*ValorMinuto;
  end;
  if minutos>3 then
  begin
    aux2:=minutos-3;
    CostoAdicional:=aux2*adicional;
    CostoM:=Aux+CostoAdicional;
  end;
  CostoT:=CostoH+CostoM;
  Writeln('El tiempo de llamada fue de ',hora,':',minutos);
  writeln('El costo total es de ',CostoT);
  readkey;

end.

