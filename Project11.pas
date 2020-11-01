program Project1;
(*11. Construir un algoritmo que encuentre todos los números primos
menores de 30. *)
uses crt;
var contador,i,num1:integer;
  var operacion:real;
    var salir:boolean;
begin


 salir:=true;
 num1:=1;
while salir=true do
begin
for i:=1 to 30 do
begin

  if (num1 mod i)=0 then
  begin
    contador:=contador+1; // si dividio un entero

  end;
end;
if contador=2 then
begin
  writeln(num1,' Si es Numero primo');
  operacion:=operacion+1; // contando para que salga del ciclo while
  num1:=num1+1;
  contador:=0; // reiniciar contador

end
else
begin
 writeln(num1,' No es Numero primo');
  operacion:=operacion+1; // contando para que salga del ciclo while
  num1:=num1+1;
  contador:=0; // reiniciar contador


end;

if operacion=30 then
salir:=false;
end;


readkey;
end.

