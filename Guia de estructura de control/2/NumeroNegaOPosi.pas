//Deducir si un número es negativo o positivo.
program NumeroNegaOPosi;
uses crt;
var
  numero:real;

begin
  writeln('Ingrese un numero');
  readln(numero);
  if numero>0 then
  begin
    writeln(numero:0:2,' es un numero positivo');
  end
  else
   if numero=0 then
   begin
     writeln(numero:0:2,' es un numero neutro');
   end
   else
     writeln(numero:0:2,' es un numero negativo');
readkey;
end.

