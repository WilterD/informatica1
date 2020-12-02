//  Un arreglo tridimensional contiene la cantidad de hombres y mujeres  que se
//han reportado con COVID-19 , durante los 7 días de  la  semana, en cada uno
//de  los  23  estados  del  país.  Donde  CASOS  [I,  J,  K]  representa la cantidad  de
//casos que se reportaron en el estado I, el día J,  de sexo K. Encontrar:
//a) Cantidad de mujeres contagiados en cada estado.
//b) Cantidad de hombres contagiadas durante los fines de semana.
//c) El estado con mayor número de  contagio en las mujeres.
//NOTA : Los estados se almacenan en orden secuencial alfabético.
program Ejercicio4Reporte_COVID;
uses crt;
var
 Reporte:array[1..23,1..7,1..2] of integer;
 Estado:array[1..23] of string[50];
 hombres,mujeres,i,j,mayor,aux:integer;

begin
  mayor:=-999;
  mujeres:=0;
  hombres:=0;
  writeln('         REPORTE DE CONTAGIADOS POR COVID-19 EN VENEZUELA');
  writeln;
//*********************Relleno del arreglo reporte y estados********************

   for i:=1 to 23 do
   begin
      case i of
       1:
         Estado[i]:='Amazonas';
       2:
         Estado[i]:='Anzoategui';
       3:
         Estado[i]:='Apure';
       4:
         Estado[i]:='Aragua';
       5:
         Estado[i]:='Barinas';
       6:
         Estado[i]:='Bolivar';
       7:
         Estado[i]:='Carabobo';
       8:
         Estado[i]:='Cojedes';
       9:
         Estado[i]:='Delta Amacuro';
       10:
         Estado[i]:='Falcon';
       11:
         Estado[i]:='Guarico';
       12:
         Estado[i]:='Lara';
       13:
         Estado[i]:='Merida';
       14:
         Estado[i]:='Miranda';
       15:
         Estado[i]:='Monagas';
       16:
         Estado[i]:='Nueva Esparta';
       17:
         Estado[i]:='Portuguesa';
       18:
         Estado[i]:='Sucre';
       19:
         Estado[i]:='Tachira';
       20:
         Estado[i]:='Trujillo';
       21:
         Estado[i]:='Vargas';
       22:
         Estado[i]:='Yaracuy';
       23:
         Estado[i]:='Zulia';
       end;
               for j:=1 to 7 do
                begin
                writeln('Ingrese el numero de hombres contagiados en el estado ',Estado[i],' en el dia ',j);
                readln(Reporte[i,j,1]);
                 writeln('Ingrese el numero de mujeres contagiadas en el estado ',Estado[i],' en el dia ',j);
                readln(Reporte[i,j,2]);
                end;
   end;

//*******************Cantidad de homobres y mujeres contagiados*****************
  clrscr;
  for i:=1 to 23 do
   begin
   hombres:=0;
   mujeres:=0;
          for j:=1 to 7 do
           begin
           mujeres:=mujeres+reporte[i,j,2];
           end;
                if mujeres>mayor then
                 begin
                 aux:=i;
                 mayor:=mujeres;
                 end;
                      for j:=6 to 7 do
                       begin
                       hombres:=hombres+reporte[i,j,1];
                       end;
   writeln('La cantidad de mujeres contagiadas en el estado ',Estado[i],' fue de ',mujeres);
   writeln('La cantidad de hombres contagiados en el estado ',Estado[i],' los fines de semana fue de ',hombres);
   writeln;
   end;
  writeln;
  writeln('El estado con mayor numero de mujeres contagiadas fue ',Estado[aux],' con un total de ',mayor);
  writeln('FIN DEL REPORTE');
  readkey;
end.

