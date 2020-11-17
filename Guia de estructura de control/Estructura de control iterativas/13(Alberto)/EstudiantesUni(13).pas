program Estudiantes_Uni;
uses crt;
var
  CE, CEH, CEI, CMI, sumaedad, edad, i, PromEd: integer;
  PHU, PMI: real;
  genr, carrera: char;
begin
 i:= 0;
 CEH:= 0; {Inicializo contador de estudiantes Hombres}
 CEI:= 0; {Inicializo acumulador de estudiantes de Ingenieria}
 sumaedad:= 0; {Inicializo acumulador de edad}
 CMI:= 0; {Inicializo contador de mujeres en ingeniería}
 writeln('Ingrese la cantidad de estudiantes en la Universidad');
 readln(CE);
 repeat
  i:=(i+1);
   writeln('Suministre su edad');
   readln(edad);
   writeln('Pulse 1 si es hombre, 2 si es mujer');
   readln(genr);
   writeln('Pulse 1 si estudia Ingenieria, 2 si estudia otra carrera');
   readln(carrera);
   if (carrera = '1') then
    begin
      sumaedad:=(sumaedad + edad); {Se incrementa el acumulador de edad de Ing}
      CEI:=(CEI + 1);
    end;
   if (genr = '1') then
    begin
      CEH:=(CEH + 1); {Cada vez que se ingrese un hombre, se acumula}
    end;
   if (genr = '2') and (carrera = '1') then
    begin
      CMI:= (CMI + 1);
    end;
 until i = CE;
 PromEd:=(sumaedad div CEI);
 PHU:= ((CEI*100)/CE);
 PMI:=((CMI*100)/CEI);
 writeln('El promedio de edad de Ingenieria es:', PromEd, 'años');
 writeln('El porcentaje de hombres en la universidad es:', PHU:9:2, '%');
 writeln('El porcentaje de mujeres en ingenieria es:', PMI:9:2, '%');
 ReadKey;
end.     