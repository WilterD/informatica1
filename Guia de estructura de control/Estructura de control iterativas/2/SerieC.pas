program SerieC;
uses crt;
var
 n:real;
 i:integer;
 verdad:boolean;
 serie:real;

begin
  serie:=0;
  writeln('Ingrese un numero');
  readln(n);
  i:=1;
  verdad:=true;
  while (i<=n) do
   begin
     if (verdad=true) then
      begin
       serie:= serie+(1/i);
       verdad:=false;
      end
      else
      begin
       serie:= serie-(1/i);
       verdad:=true;
      end;
   i:=i+1;
   writeln(Serie:0:2);
   end;
  readkey;
end.

