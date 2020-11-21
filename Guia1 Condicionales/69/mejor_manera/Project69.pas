program Project1;
uses crt;
type
  arreglo=array[1..100] of string;
  arreglo2=array[1..100] of integer;
var
  num_notas,num_est,k,i,notas: integer;
  promedio, nota: real;
  nombres: arreglo;
  notas_estudiantes: arreglo2;

begin
  for i:=1 to 100 do
    nombres[i]:='';

  k:=0;
  write('escribir numero de estudiantes: ');
  readln(num_est);

  writeln;
  for i:=1 to num_est do
    begin
      write('escribir nombres de estudiantes');
      readln(nombres[i]);
      k:=k+1;
    end;

  promedio:=0;
  for i:=1 to num_est do
    begin
      writeln('Escribir la nota del estudiante: ',nombres[i]);
      read(notas);
      notas_estudiantes[i]:=notas;
      promedio:=promedio+notas;
    end;

  promedio:=promedio/num_est;
  writeln('Promedio de estudiantes es: ',promedio:0:0);

  nota:=0;
  for i:=1 to num_est do
    begin
      nota:=notas_estudiantes[i]-promedio;
      writeln('diferencia de cada nota con el promedio: ',nombres[i],' ',nota:0:0);
    end;

  readkey;
end.
