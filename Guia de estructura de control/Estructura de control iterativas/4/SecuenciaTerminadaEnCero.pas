//4.  Dada  una  secuencia  de  enteros  terminada  en  cero,  elabore  un  algoritmo  para
//resolver cada uno de los siguientes problemas:
//a) Calcular el promedio de dicha secuencia.
//b) Calcular el porcentaje de números impares y el porcentaje de números pares.
//c) Calcular la cantidad de valores iguales a un valor N dado por el usuario.
//d) Contar la cantidad de números primos.
program SecuenciaTerminadaEnCero;
uses crt;
var
    numero:integer;
    n:integer;
    promedio:real;
    PorcentajePar:real;
    PorcentajeImpar:real;
    Cont:integer;
    ContN:integer;
    ContPrimo:integer;
    ContPar:integer;
    ContImpar:integer;
    secuencia:integer;
    divisor:integer;
    residuo:integer;

begin
  secuencia:=0;
  cont:=0;
  ContN:=0;
  ContPrimo:=0;
  ContPar:=0;
  ContImpar:=0;
  writeln('Ingrese un numero a comparar');
  readln(n);
  residuo:=0;
  repeat
    residuo:=0;
    divisor:=1;
    writeln('Ingrese un numero');
    readln(numero);
    if numero=0 then
    begin
      writeln('Secuencia terminada');
    end
    else
    begin
      cont:=cont+1;
      secuencia:= secuencia+numero;
       if (numero mod 2 = 0) then
       begin
         ContPar:=contPar+1;
       end
       else
       begin
          ContImpar:=ContImpar+1
       end;
         while (divisor<=numero) do
         begin
          if (numero mod divisor = 0) then
          begin
           residuo:=residuo+1;
          end;
          divisor:=divisor+1;
         end;
          if (residuo=2) then
          begin
            ContPrimo:=ContPrimo+1;
          end;
           if (numero=n) then
           begin
             ContN:=ContN+1;
           end;
    end;
  until (numero=0) ;
  if cont>0 then
  begin
    Promedio:= secuencia/cont;
    porcentajePar:= ContPar/Cont*100;
    porcentajeImpar:=ContImpar/Cont*100;
  end;
  writeln('El promedio de la secuencia es ',promedio:0:2);
  writeln('El porcentaje de numeros pares es ',porcentajePar:0:2);
  writeln('El porcentaje de numeros impares es ',porcentajeImpar:0:2);
  Writeln('La cantidad de veces que se repitio ',n,' fue de ',contN);
  writeln('La cantidad de numeros primos ingresados fue de ',ContPrimo);
  readkey;
end.

