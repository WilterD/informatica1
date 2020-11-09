//Escribir un algoritmo que lea cuatro números y a continuación imprima el mayor de
//ellos.
program Mayorde4;
uses crt;
var
a,b,c,d:real;

begin
  writeln('Ingrese el primer numero');
  readln(a);
  writeln('Ingrese el 2do numero');
  readln(b);
  writeln('Ingrese el 3er numero');
  readln(c);
  writeln('Ingrese el 4to numero');
  readln(d);
  if (a>b) and (a>c) and (a>d) then
  begin
    writeln('El numero mayor es ',a:0:2);
  end;
  if (b>a) and (b>c) and (b>d) then
  begin
   writeln('El numero mayor es ',b:0:2);
  end;
  if (c>a) and (c>b) and (c>d) then
  begin
  writeln('El numero mayor es ',c:0:2);
  end;
  if (d>a) and (d>b) and (d>c) then
  begin
  writeln('El numero mayor es ',d:0:2);
  end;
  readkey
end.

