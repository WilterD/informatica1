//LA UCAB PARA EL PERIODO 2018-25 ABRIO 10 SECCIONES DE MATEMATICA BASICA, EN CADA UNA SE INSCRIBIERON 40 ALUMNOS Y SE APLICARON 6 EVALUACIONES
//SE DESEA ELABORAR UN PROGRAMA QUE :
//A: REGISTRE LA CEDULA, EL NOMBRE Y LAS NOTAS OBTENIDAS POR CADA ALUMNO EN CADA UNA DE LAS EVALUACIONES REALIZADAS
//B: MUESTRE LA CEDULA, EL NOMBRE Y EL PROMEDIO DE LAS NOTAS OBTENIDAS POR CADA ALUMNO DE UNA SECCION DADA
//C: MUESTRE EL PROMEDIO ENTRE TODAS LAS SECCIONES OBTENIDO EN LA EVALUACION 3
//D: PARA CADA ALUMNO DE UNA SECCION DADA, DETERMINAR LA EVALUACION O LAS EVALUACIONES DONDE OBTUVO EN LAS QUE OBTUVO MAYOR PUNTAJE

program examen;
uses crt;
Var
  Evaluaciones:array[1..10,1..40,1..6] of integer;
  Alumnos:array[1..10,1..40,1..2] of string;
  i,j,k:integer;
  seccion,sec2:integer;
  notat:integer;
  prom_a:array[1..40] of real;
  nota3:integer;
  prom_not3:real;
  mayor:integer;

begin
  nota3:=0;
  notat:=0;
  prom_not3:=0;
  //Llenado de arreglos
  for i:=1 to 10 do   //Secciones
  begin
      for j:=1 to 40 do   //Alumnos
      begin
      writeln('Ingrese el nombre del estudiante ',j,' de la seccion ',i);
      readln(Alumnos[i,j,1]);
      writeln('ingrese la cedula de indentidad del estudiante ',j,' de la seccion ',i);
      readln(Alumnos[i,j,2]); //Cedula
      end;
      for k:=1 to 6 do
      begin
        writeln('Ingrese la nota ',k);
        readln(Evaluaciones[i,j,k]);
      end;
  end;
  //Se llenan al mismo los nombres, cedulas de los alumnos y sus notas
 repeat
 writeln('Ingrese una seccion');
 readln(seccion);
 until (seccion<11);
    for i:=1 to 40 do
    begin
   writeln(Alumnos[seccion,i,1]);
   writeln(alumnos[seccion,i,2]);
      for j:=1 to 6 do
      begin
      notat:=notat+Evaluaciones[seccion,i,j];
      end;
      prom_a[i]:=notat/6;
      writeln('Promedio ',prom_a[i]:0:2);
 end;
 //Procedimiento para sacar el promedio de todas las secciones en la evaluacion3
    for i:=1 to 10 do
    begin
      for j:=1 to 40 do
      begin
        nota3:=nota3+Evaluaciones[i,j,3];
      end;
      prom_not3:=prom_not3+(nota3/40);
      nota3:=0;
    end;
    prom_not3:=prom_not3/10;
    writeln('El promedio de todas las secciones en la evaluacion 3 es ',prom_not3:0:2);

 //Sacar el mayor puntaje que obtuvo en una evaluacion para cada estudiante de una seccion dada
     repeat
     writeln('Ingrese una seccion');
     readln(sec2);
     until ((sec2<11);
     for i:=1 to 40 do
     begin
     mayor:=-99;
       for j:=1 to 6 do
       begin
            if Evaluaciones[sec2,i,j]>mayor then
            begin
            mayor:= Evaluaciones[sec2,i,j]
            end;
        end;
              for k:=1 to 6 do
              begin
                 if Evaluaciones[sec2,i,k]=mayor then
                 begin
                 writeln ('El estudiante ',i,' Saco el mayor promedio', mayor);
                 end;
              end;
         mayor:=-99;   //Si inicializa para otro ciclo
     end;
   readkey;
end.



