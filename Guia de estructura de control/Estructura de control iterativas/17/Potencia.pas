//17. Realizar un algoritmo que calcule y visualice las potencias de 2 desde 0 hasta 10,
program Potencia;
uses crt,math;
var
  numero,i,resultado:integer;

begin
  numero:=2;
  for i:=0 to 10 do
  begin
   resultado:=numero**i;
   writeln(resultado);
  end;
  readkey;
end.

