//10. Por cada uno de los N estudiantes se tienen la nota obtenida en una materia hacer
//un algoritmo que obtenga: la nota máxima, la mínima, cuántos perdieron y cuántos
//ganaron la asignatura.
program AprobadosDeUnaMateria_10;
uses crt;
var
  estudiantes,nota,aprobar,maxima,minimo,i,contG,contP:integer;

begin
  maxima:=-9999;
  minimo:=9999;
  contG:=0;
  contP:=0;
  writeln('Ingrese el numero de estudiantes');
  readln(estudiantes);
  writeln('Ingrese la nota aprobatoria necesaria para pasar la asignatura');
  readln(aprobar);
   for i:=1 to estudiantes do
   begin
     writeln;
     writeln('Nota obtenida del estudiante ',i);
     readln(nota);
      if nota<minimo then
      begin
        minimo:=nota;
      end;
        if nota>maxima then
        begin
          maxima:=nota;
        end;
          if nota>=aprobar then
          begin
           contG:=contG+1;
          end;
           if nota<aprobar then
           begin
            contP:=contP+1;
           end;
   end;
  writeln;
  writeln('La maxima nota fue de ',maxima);
  writeln('La minima nota fue de ',minimo);
  writeln('La cantidad de aprobados fue de ',contG);
  writeln('La cantidad de desaprobados fue de ',contP);
  readkey;
end.

