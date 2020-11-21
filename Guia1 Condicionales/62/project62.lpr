program project1;
uses crt;
(*Determinar la posición del
 elemento más grande de una matriz.*)

type
matriz = array[1..9,1..9] of integer;


var i,j,aux:integer;
  arreglo:matriz;
  salir:boolean;

begin

 for i:=1 to 9 do
  for j:=1 to 9 do
   arreglo[i,j]:=0;  // INICIALIZAR


  arreglo[2,2]:=(300);
  arreglo[2,2]:=(5);
  arreglo[4,5]:=(400);    // Asignar datos al arreglo
  arreglo[2,4]:=(9);
  arreglo[2,6]:=(120);

  aux:=0;

        for i:=1 to 9 do
           for j:=1 to 9 do
           begin
                if arreglo[i,j] > aux then
                aux:=arreglo[i,j];
           end;

    salir:=false;
    while salir=false do
     begin
          for i:=1 to 9 do
              for j:=1 to 9 do
              if (arreglo[j,i]=aux) then
              begin
               writeln('El numero mayor es: ',aux);
               writeln('La fila es: ',j);
               writeln('La columna es: ',i);
               salir:=true;
              end;
     end;


  readkey;


end.

