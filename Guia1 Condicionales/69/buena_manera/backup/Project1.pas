program Project1;
 (*Dado el nombre de una serie de estudiantes y las calificaciones
obtenidas en un examen, calcular e imprimir la calificación media así como
cada calificación y su diferencia con la media. *)
 uses crt;
TYPE
  arreglo=array[1..100] of integer;
  arreglo2=array[1..100] of string;

var
  notas: arreglo;
  nombres: arreglo2;
  num_notas, num_est, i, k, contador, divisor, fin: integer;
  salir: boolean;
  promedio: real;

begin
  write('Cuantas notas seran evaluadas?: ');  // cantidad de notas
  readln(num_notas);
  divisor:=num_notas; //obtener aux1 para dividir el promedio

  write('cuantos estudiantes seran evaluados?: ');  // cuantos estudiantes seran evaluados
  readln(num_est);

  for i:=1 to num_est do      // obtener nombres de estudiantes
    begin
      write('Escribir Nombre de estudiante nro: ',i);
      readln(nombres[i]);
    end;

  salir:=true;
  k:=1;  // vuelta de estudiante
  while salir=true do
    begin                  // se igresaran notas por cada estudiantes 2 vueltas en while
      for i:=1 to num_notas do
        begin
          writeln('Escribir Notas de Estudiante nro: ',k);
          read(notas[i]);
        end;

      if k=num_est then
        salir:=false
      else
         k:=k+1; //sumo la vuelta del estudiante
    end;

  salir:=true;  //para el ciclo while
  k:=2; // vuelta estudiante
  contador:=0; //inicio
  writeln('Las notas de los estudiantes son: ');
  fin:=num_notas;

  while salir=true do
    begin
      for i:=contador to num_notas do //mostrar notas
        begin
          writeln(notas[i]);
          contador:=contador+1; // inicio para mostrar notas
          promedio:=promedio+notas[i];
       end;

      promedio:=(promedio/divisor);
      writeln('Promedio del estudiante ',nombres[k],' es: ',promedio:3:3);

      if k=num_est+1 then
        salir:=false
      else
        k:=k+1; // pasamos al otro estudiante si aun no se muestran todos
    end;

  readkey;
end.

