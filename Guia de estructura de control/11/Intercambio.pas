// Realizar  un  algoritmo  que  permita  intercambiar  entre  si  los  valores  de  dos
//variables A y B.
program Intercambio;
uses crt;
var
  a,b,aux:integer;

begin
  writeln('Ingrese el primer numero');
  readln(a);
  writeln('Ingrese el segundo numero');
  readln(b);
  writeln;
  writeln('Intercambio de valores');
  aux:=a;
  a:=b;
  b:=aux;

  writeln('Ahora el valor de A es ',a);
  writeln('Ahora el valor de B es ',b);
  readkey;
end.

