//21. Calcular la nota media de los alumnos de una clase considerando N (número de
//alumnos) y C( número de notas de cada alumno).
program CalificacionMedia;
uses crt;
var
  alumnos,calificaciones,i:integer;
  suma:integer;
  resultado:real;

begin
   suma:=0;
  writeln('Ingrese la cantidad de alumnos');
  readln(alumnos);
   for i:=1 to alumnos do
   begin
     writeln('Calificacion ',i,':');
     readln(calificaciones);
     suma:=suma+calificaciones;
   end;
   resultado:= suma/alumnos;
   writeln;
   writeln('La calificacion media es ',resultado:0:2);
   readkey;
end.

