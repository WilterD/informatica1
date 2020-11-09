//Diseñar un algoritmo para resolver una ecuación de segundo grado
program Ecuacion;
uses crt,math;
var
b,a,c,x1,x2,resolvente:real;

begin
  writeln('Ingrese el valor de A');
  readln(a);
  writeln('Ingrese el valor de B');
  readln(b);
  writeln('Ingrese el valor de C');
  readln(c);
  resolvente:=(b**2)-(4*a*c);
  if resolvente<0 then
  begin
    writeln('La raiz no existe');
    readln;
    halt
  end
  else
    x1:=(-b+sqrt((b**2)-(4*a*c)))/2*a;
    x2:=(-b-sqrt((b**2)-(4*a*c)))/2*a;
    writeln('X1= ',x1:0:2);
    writeln('X2= ',x2:0:2);
  readkey;
end.

