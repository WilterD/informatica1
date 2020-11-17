program mcm1_1
{Programa que calcula el mcm con el teorema de euclides}
uses crt;
var aux,r1,r2,r:integer;

begin

  Writeln('Introduzca el valor de R1 y R2');
  readln(r1,r2);

   if (r1>r2) then
     begin
          r:=(r1 mod r2);

            repeat

                 aux:=r2;
                 r2:=r;
                 r1:=aux;
                 r:=(r1 mod r2);

            until (r=0);

     end;
   writeln('El mcm de los numeros es ',r2);


readkey;
end.
