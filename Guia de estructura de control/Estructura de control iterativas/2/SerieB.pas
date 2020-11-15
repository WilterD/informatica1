program SerieB;
uses crt;
var
i:integer;
num:real;
serie:real;


begin
  Serie:=0;
  i:=1;
  writeln('Ingrese un numero');
  readln(num);
  while (i<=num) do
   begin
    serie:= Serie+(1/i);
    i:=i+1;
    writeln;
    writeln(serie:0:2);
   end;
  readkey;
end.

