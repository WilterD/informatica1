//Elabore un algoritmo que lea dos números M y N (M < N) y calcule los múltiplos de
//M comprendidos entre M y N.
program Multiplos;
uses crt;
var
  m,n,i,resultado:integer;

begin
 repeat
  writeln('Recuerde cumplir con la condicion M<N');
  writeln('Ingrese el numero a calcular');
  readln(m);
  writeln('ingrese el numero limite');
  readln(n);
  if m<n then
  begin
   writeln('Calculo de los multiplos comprendido entre ',m,' y ',n);
   writeln;
   for i:=m to n-1 do
   begin
    resultado:=m*i;
    writeln('Los multiplos de ',m,' son ',resultado);
   end;
  end
  else
  begin
   writeln('Los numeros ingresados no cumple con la condicion m<n');
  end;
 until m<n;
 readkey;
end.

