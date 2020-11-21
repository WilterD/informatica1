program project1;
uses crt;
 // Realizar la suma de los enteros comprendidos entre dos límites, mínimo
//y máximo.

// FUNCTION sumar(a,b:integer):integer

 var suma,minimo,maximo,i,conteo:integer;

begin

  writeln('Crear un limite para sumar, digite el minimo');
  read(minimo);

  writeln('Crear un limite para sumar, digite el maximo');

  read(maximo);

  for i:=minimo+1 to maximo-1 do


    conteo:=conteo+i;



  writeln('la suma de los numeros comprendidos es:',conteo);
   readkey;

end.

