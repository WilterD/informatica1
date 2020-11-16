program NumPerfecto;
uses crt;
var
 n, a: integer;
 p: integer;
begin
 p:= 0;
 writeln('Ingrese un numero');
 readln(n);
 a := 2;
 while a <= n do
  begin
  if (n mod a = 0) then
    begin
    p:=(p + (n div a));
    end;
  a:=(a+1);
  end;
 if (p = n) then
   begin
    writeln(n, ' ', 'es un numero perfecto');
   end
  else
   begin
   writeln(n, ' ', 'no es un numero perfecto');
   end;
 ReadKey;
end.
        