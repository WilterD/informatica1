{1.  Dado un arreglo con N elementos enteros, se quiere:
a)  Leer el arreglo.
b)  Imprimir el arreglo.
c)  Calcular la suma de los valores del arreglo.
d)  Calcular la media de los valores del arreglo.
e)  Calcular la cantidad de números impares y números pares.
f)   Calcular cuántos números son mayores que la media y cuántos son
menores.
g)  Obtener un  nuevo arreglo, tal  que sus elementos sean la diferencia de
los elementos sucesivos del arreglo dado.
h)  Transformar dicho arreglo, de tal forma que en las posiciones pares
contengan un valor X dado.}
program Ejercicio_GuiaA_1;
uses crt;
var
  i, n, Acu, ContP, ContI, Med, ContMay, ContMen, Num: integer;
  vector: array[1..100] of integer;
  vector2: array[1..100] of integer;
begin
 i:=0;
 Acu:=0;
 ContP:=0;
 ContI:=0;
 ContMay:=0;
 ContMen:=0;
 writeln('Ingrese el numero a cambiar');  {Acá pido el caracter que sustituirá en las posiciones pares del arreglo de la resta}
 readln(Num);
 writeln('Ingrese cuantos numeros ingresara');
 readln(n);
 for i:=1 to n do
  begin
    writeln('Ingrese el numero', ' ', i, ' ', 'de la secuencia');
    readln(vector[i]);
    Acu:=(Acu+vector[i]); {Mientras lleno el arreglo voy sumando sus elementos}
    if (vector[i] mod 2 = 0) then
     begin
       ContP:=(ContP + 1); {Cuento los pares}
     end
    else
     begin
       if (vector[i] mod 2 <> 0) then
        begin
          ContI:=(ContI + 1);     {Cuento los Impares}
        end;
     end;
  end;
  Med:=(Acu div N);  {Calculo la media de los elementos}
  writeln('El arreglo es:');
 for i:=1 to n do
  begin                  {Imprimo el arreglo}
   writeln(vector[i]);
  end;
 for i:=1 to n do
  begin
   if (Vector[i] > Med) then
    begin
      ContMay:=(ContMay+1);   {Cuento los mayores a la media y los menores de la media}
    end
   else
    begin
     ContMen:=(ContMen + 1);
    end;
  end;
 writeln('La suma de la secuencia es:', ' ', Acu, ' ', 'y su media es:', ' ', Med);
 writeln('La secuencia tiene:', ' ', ContP, ' ', 'numeros pares y', ' ', ContI, ' ', 'numeros impares');
 writeln('Hay:', ' ', ContMay, ' ', 'numeros mayores de la media y', ' ', ContMen, ' ', 'menores de la media');
 writeln;
 writeln('El arreglo de resta consecutiva es:');
 for i:=1 to n do
  begin
   Vector2[i]:=(vector[i]-vector[i+1]);
   writeln(Vector2[i]);                       {Hago las restas consecutivas e imprimo el arreglo resultante}
  end;
 writeln;
 writeln('El arreglo con el caracter sustituido es:');
 for i:=1 to n do
  begin
   if (i mod 2 = 0) then     {Evalúo que si la posicioón (i) es par, sustituyo por Num que es mi caracter especial e imprimo}
    begin
      Vector2[i]:=Num;
    end;
   writeln(Vector2[i]);
  end;
 ReadKey;
end.  
