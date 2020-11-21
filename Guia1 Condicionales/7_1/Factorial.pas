//7. Construya un algoritmo utilizando estructuras iterativas que calculen el factorial de
//un número entero positivo n. La función factorial, representada por n!, es ampliamente
//utilizada, y se especifica que n!= n*(n-1)!, y además 0!=1.
program Factorial;
uses crt;
var
  numero,limite,i:integer;


begin
  writeln('Ingrese un numero');
  readln(numero);
  if numero=0 then
  begin
    writeln('Factorial de 0 es igual a ',1);
  end
  else
  begin
  limite:=numero;
  numero:=1;
     for i:=1 to limite do
     begin
       numero:=numero*i;
     end;
       writeln('Factorial de ',limite,'!= ',numero);
  end;
    readkey;
end.
