program examen1;
  uses crt;
 (*Dada  la nombre, género (M/F), edad y el índice académico
 (todos distintos)  de N estudiantes del curso de Algoritmos y Programación 1 , implemente un programa en PASCAL que :

a) Calcule el promedio de la edad de los hombres. //listo

b) El nombre de la mujer con la menor edad y el índice
mas  alto (entre las mujeres)       //listo

c) El nombre del hombre con el mayor y menor índice académico. //listo mayor falta menor

d) El promedio de los índices académicos de las
mujeres entre 16 y 18 años (ambas edades inclusive) //listo
Correr el programa para los siguientes datos :
*)
 var continuar,edad,EdadH,nro_h,nro_m1,nro_m2:integer;
   nombre,mujer_a,mujer_b,hombre_a,hombre_b:string;
   gen:char;
   salir:boolean;
   promedio_h,nota,notas_m1,notas_m2,minimo_h,minimo_m,maximo_h,maximo_m,promedio_m1,promedio_m2:real;


begin
   salir:=true;

  maximo_h:=0;  // maximos
  maximo_m:=0;

  minimo_h:=9999; // minimos
  minimo_m:=9999;


 while salir=true do
 begin

   writeln('Desea ingresar el dato de una persona? 1(si) 0(no) ');
   readln(continuar);

  if continuar=0 then
   salir:=false
   else
     begin
    writeln('Ingrese su nombre');
    readln(nombre);

    writeln('Ingrese su genero');
    readln(gen);

    writeln('Ingrese su edad');
    readln(edad);

    writeln('Ingrese su indice academico');
    readln(nota);



      if (gen='M') or (gen='m') then // Hombres
       begin
            nro_h:=nro_h+1; // contar nro hombres
            EdadH:=EdadH+edad;  //sumar edades

        if nota>maximo_h then   // valor mayor
         begin
                hombre_a:=nombre;  // nombre del hombre con mas nota
                maximo_h:=nota;
         end;

         if nota<minimo_h then
          begin
               hombre_b:=nombre;
               minimo_h:=nota;
          end;

      end
      else if (gen='F') or (gen='f') then //mujeres
       begin
       nro_m1:=nro_m1+1;
       notas_m1:=notas_m1+nota; // notas totales


       if nota>maximo_m then
        begin
        mujer_a:=nombre;
        maximo_m:=nota;
        end;

        if edad<minimo_m then
         begin
          mujer_b:=nombre;   // nombre de la mujer con la menor edad
          minimo_m:=edad;
          end;


          if (edad>=16) or (edad<=18) then
           begin
           nro_m2:=nro_m2+1;
           notas_m2:=notas_m2+nota; // notas mujeres 16 y 18
           end;
         end;

       end;

     end;

 // calculos

 if nro_h>0 then
 promedio_h:=EdadH/nro_h; //promedio de edad hombres

 if nro_m1>0 then
 promedio_m1:=notas_m1/nro_m1; // promedio total mujeres

 if nro_m2>0 then
 promedio_m2:=notas_m2/nro_m2; // promedio total mujeres

 writeln('promedio de edades de hombres es: ',promedio_h:0:0);

 writeln('La mujer con la edad menor es: ',mujer_a);

 writeln('Nombre de la mujer con nota mas alta es: ',mujer_b);

 writeln('Nombre del hombre con nota alta es: ',hombre_a);

 writeln('Nombre del hombre con nota baja es: ',hombre_b);


 writeln('promedio de nota de mujeres entre 16 y 18 anos es: ',promedio_m2:0:0);


readkey;
end.

