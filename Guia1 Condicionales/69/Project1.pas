program Project1;
uses crt;
TYPE
arreglo=array[1..100] of string;
arreglo2=array[1..100] of integer;

var nombres:arreglo;
var notas:arreglo2;

eval,num_est,i,k,contador,aux1,aux2,aux3,aux4:integer;

var revisar:boolean;


begin

  writeln('Cuantas evaluaciones seran evaluadas?');
  read(eval);
  aux3:=eval;
  aux4:=eval;

  writeln('Cuantos estudiantes se revisaran?');
  read(num_est);
aux1:=num_est;
 for i:=1 to num_est+1 do
     begin

      writeln('Ingrese nombre de estudiante: ',i);
      readln(nombres[i]);
     end;
 revisar:=true;
 contador:=1;
 i:=1;
 k:=0;
 aux2:=0;
 while revisar=true do  // ciclo while
 begin
  contador:=aux2+1;
  eval:=aux3;
for i:=contador to eval do
begin
Writeln('Ingrese la nota nro: ',i);
read(notas[i]);
aux2:=aux2+1;
aux3:=aux3+1;
 end;
k:=k+1;
 if k=aux1 then
 revisar:=false;
end;
 i:=1; //inicializar
 k:=1; //inicializar
 contador:=0;
 revisar:=true;
 writeln('Nota de los estudiantes son: ');
 while revisar=true do
 begin

 for k:=1 to aux4 do
 begin
 writeln(nombres[k]);
 writeln(notas[k]);
 end;
 contador:=contador+1;
 if contador=aux1 then
 revisar:=false;
 end;

readkey;


end.

