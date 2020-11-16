//19. Construir un algoritmo que determine si un numero N es primo .Encuentre todos
//los números primos menores a un N dado.
program Primo;
uses crt;
var
  numero,divisor,residuo,n:integer;

begin
  divisor:=1;
  residuo:=0;
   writeln('Ingrese un numero a comparar');
   readln(n);
   repeat
   writeln('Ingrese un numero');
   readln(numero);
   if numero<n then
    begin
         while (divisor<=numero) do
         begin
            if (numero mod divisor = 0) then
             begin
             residuo:=residuo+1;
             end;
             divisor:=divisor+1;
         end;
              if (residuo=2) then
              begin
               writeln('Es un numero primo');
              end
              else
               begin
                writeln('No es un numero primo');
               end;
    end
    else
    begin
     writeln('Secuencia terminada');
    end;

   until (numero>=n);
  readkey;
end.

