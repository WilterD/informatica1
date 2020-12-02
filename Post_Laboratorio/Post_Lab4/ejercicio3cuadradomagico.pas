        //Dado  N,  un  número  impar, elaborar  un algoritmo que  genere    un  cuadrado
//mágico  de  orden  N.  El  método  de  generación,  de  un  cuadrado  mágico,
//consiste  en  situar  el  número  1  en  el  centro  de  la  primera  fila;  el  número
//siguiente en la casilla situada por encima y a la derecha, y así sucesivamente.
//Debe considerarse, que el cuadrado es cíclico, lo que significa, que la línea
//encima  de  la  primera  fila  es  la  última  fila   y  la  columna  a  la  derecha  de  la
//última es la primera columna. Debe tomar en cuenta, que en el caso de que
//el número generado caiga en una casilla ocupada, se elige la casilla debajo
//del último número situado.
//A continuación un ejemplo de un cuadrado mágico de orden 3 :
//8  1  6
//3  5  7
//4  9  2

program Ejercicio3cuadradoMagico;
uses crt;
var
  magia:array[1..99,1..99] of integer;
  grado,sumando,posicionI,posicionJ,i,j,mitad,cuadrado:integer;

begin
  posicionI:=0;
  posicionJ:=0;
  sumando:=0;
  writeln('                CUADRADO MAGICO DE ORDEN IMPAR');
  writeln;
  repeat
    writeln('Ingrese el grado de la matriz');
    readln(grado);
    writeln;
     if (grado mod 2 = 0) then
     begin
       writeln('Ingreso un grado par vuelvalo a intentar');
       writeln;
     end;
  until (grado mod 2 <>0);

   for i:=1 to grado do
   begin
      for j:=1 to grado do
       begin
         magia[i,j]:=0;
       end;
   end;

//***************************HORA DE LA MAGIA***********************************
   mitad:= (grado div 2)+1;
   cuadrado:= grado*grado;
   sumando:=sumando+1;
   i:=1;
   j:=mitad;
     for sumando:=1 to cuadrado do
      begin
        if magia[i,j]<>0 then  // Condicion donde si esa casilla ya esta siendo ubicada por un numero el numero sera ubicado debajo del ultimo numero situado
         begin
           i:=posicionI+1;
           j:=posicionJ;
         end;
         posicionI:=i;
         posicionJ:=j;
//***************************Rellendo las casillas*****************************

         magia[i,j]:=sumando;
         i:=i-1;
         j:=j+1;
           if (i=0) then
            begin
              i:=grado;
            end;
                if (j=grado+1) then
                 begin
                  j:=1;
                 end;
      end;

//****************************SALIDA********************************************
    writeln('Aqui esta su cuadrado magico correspondiente al grado ',grado,'x',grado);
    writeln;
    for i:=1 to grado Do
     begin
        writeLn;
	 for j:= 1 to grado do
	  write(magia[i,j], ' | ');
     end;

    ReadKey;
end.

