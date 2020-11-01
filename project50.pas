program Project1;
 uses crt;
(*50. Escribir un procedimiento que dado los numeradores y denominadores
de dos fracciones devuelva el numerador y denominador de la suma. *)

type
  matriz=array[1..2,1..2] of integer;

  var fraccion:matriz;

  var num1,num2,k,i:integer;


begin
    k:=1;
    i:=0;

  repeat
    i:=i+1;
    writeln('Escriba el numerador ');
    read(num1); //5

    fraccion[i]:=num1;
    k:k+1;
    writeln('Escriba el denominador ');
    read(num2); //5
    fraccion[k]:=num2;


    until k=4;

    writeln('Datos del arreglo');


    for i:=1 to 4 do
    writeln(fraccion[i]);

    readkey;

end.

