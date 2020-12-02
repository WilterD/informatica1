//Escriba un programa que lea la cédula, nombre y las calificaciones de los tres
//parciales  de  los  alumnos  de  Algoritmos  y  Programación  I  de  la  UCAB,  las
//almacene en un arreglo    y  luego  muestre en pantalla los nombres  ordenados
//de forma descendente  por promedio.  Para ello tome una muestra solo de 10
//alumnos.
program Ejercicio1Notas_Arreglos;
uses crt;
var
  Nombre:array[1..10] of string[30];
  cedula:array[1..10] of integer;
  promedio:array[1..10] of real;
  nota1,nota2,nota3,acum,aux:real;
  aux2:string[30];
  i,j,num:integer;


begin
  writeln('Ingrese la cantidad de alumnos');
  readln(num);
  writeln;
  repeat
      if num<=10 then
      begin
            for i:=1 to num do
             begin
              writeln('Ingrese el nombre del alumno ',i);
              readln(nombre[i]);
              writeln('Ingrese la cedula del alumno ',i);
              readln(cedula[i]);
              writeln('Ingresa la primera calificacion');
              readln(nota1);
              writeln('Ingresa la segunda calificacion');
              readln(nota2);
              writeln('Ingresa la tercera calificacion');
              readln(nota3);
              acum:=(nota1+nota2+nota3)/3;
              promedio[i]:=promedio[i]+acum;
              writeln;
             end;
      end
        else
         begin
          writeln('Ingreso una cantidad de alumnos superior a lo permitido');
          writeln('Vuelva a intentarlo');
          writeln;
         end;
  until (num<=10);

//**************************ORDENAMIENTO****************************************
  for i:=1 to num-1 do
   begin
        for j:=1 to num-1 do
         begin
              if promedio[j]<promedio[j+1] then
               begin
               aux2:=nombre[j+1];
               aux:=promedio[j+1];
               nombre[j+1]:=nombre[j];
               promedio[j+1]:=promedio[j];
               nombre[j]:=aux2;
               promedio[j]:=aux;
               end;
         end;
   end;

//****************************IMPRIMIR*****************************************
  writeln('Nombres ordenados por promedio de forma descendente');
  for i:=1 to num do
   begin
    writeln('Alumno ',nombre[i],' promedio ',promedio[i]:0:2);
   end;

  readkey;
end.

