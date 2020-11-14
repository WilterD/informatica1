// Leer tres números del teclado y deducir si se han introducido en orden creciente.
program OrdenCreciente;
uses crt;
var
  a,b,c:integer;


begin
  writeln('Ingrese el primer numero');
  readln(a);
  writeln('Ingrese el segundo numero');
  readln(b);
  writeln('Ingrese el tercer numero');
  readln(c);
  writeln;
  if (a<b) and (b<c) then
  begin
    writeln('Se ingreso en orden creciente');
  end
  else
  begin
    writeln('Se ingreso en orden decreciente');
  end;
  readkey;
end.

