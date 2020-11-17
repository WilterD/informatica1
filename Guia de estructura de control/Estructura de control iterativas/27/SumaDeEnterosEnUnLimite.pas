//Realizar la suma de los enteros comprendidos entre dos límites, mínimo y máximo
program SumaDeEnterosEnUnLimite;
uses crt;
var
 minimo,maximo,i,suma:integer;

begin
  suma:=0;
  writeln('Ingrese un minimo');
  readln(minimo);
  writeln('Ingrese un maximo');
  readln(maximo);
  writeln;
   for i:=minimo to maximo do
    begin
     suma:=suma+i;
    end;
  writeln('La suma total entre los enteros comprendidos entre los limites ',minimo,' y ',maximo,' fue de ',suma);
readkey;
end.

