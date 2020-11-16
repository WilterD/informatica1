//19. Construir un algoritmo que determine si un numero N es primo .Encuentre todos
//los números primos menores a un N dado.
program PrimoConFor;
uses crt;
var
  i,divisor,residuo,n:integer;

begin
  divisor:=1;
  residuo:=0;
   writeln('Ingrese un numero a comparar');
   readln(n);
    for i:=2 to n do
    begin
     divisor:=1;
     residuo:=0;
      if i<n then
       begin
         while (divisor<=i) do
         begin
            if (i mod divisor = 0) then
             begin
             residuo:=residuo+1;
             end;
             divisor:=divisor+1;
         end;
              if (residuo=2) then
              begin
               writeln( i,' Es un numero primo');
              end
              else
               begin
                writeln( i,' No es un numero primo');
               end;
       end;

    end;
  readkey;
end.

