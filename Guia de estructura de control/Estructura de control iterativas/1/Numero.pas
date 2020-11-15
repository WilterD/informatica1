//1) Iterativas
//Escriba un algoritmo   que:
//a) Dado un grupo de números enteros (terminado en -1), calcule e imprima el cubo de
//cada uno de estos números.
//b) Dados como datos 270 números enteros, obtenga la suma de los números impares
//y el promedio de los números pares.
//c)  Dados  como  datos  N  números  enteros,  determine  cuántos  de  ellos  son  pares  y
//cuántos impares.

program Numero;
uses crt,math;
var
  numero:integer;
  cubo:integer;
  Cont:integer;
  ContPar:integer;
  ContImpar:integer;
  SumaImpar:integer;
  SumaPar:Real;
  PromPar:real;

begin
  numero:=0;
  Cont:=0;
  ContImpar:=0;
  SumaImpar:=0;
  repeat
   writeln('Ingrese un numero');
   readln(numero);
   if numero<>-1 then
   begin
     cubo:= numero**3;
     cont:=cont+1;
       if (numero mod 2 = 0) then
       begin
         contPar:= contPar+1;
         SumaPar:= SumaPar+numero;
       end
       else
       begin
        ContImpar:= contImpar+1;
        SumaImpar:= SumaImpar+numero;
       end;
     writeln;
     writeln('El cubo del numero ingresado es igual a ',cubo);
     writeln;
   end
   else
   begin
    writeln;
    writeln('Secuencia terminada, el usuario ha ingresado un -1');
    writeln;
   end;
   until (numero=-1);
      if contPar>0 then
      begin
       PromPar:= SumaPar/ContPar;
      end;
  writeln('Cantidad de numeros pares ingresados por el usuario ',ContPar);
  writeln('Cantidad de numeros impares ingresados por el usuario ',ContImpar);
   if cont>=270 then
   begin
     writeln;
     writeln('Condicion especial activada');
     writeln('Ha ingresado 270 numeros enteros o mas');
     writeln;
     writeln('La suma de los numeros impares es de ',SumaImpar);
     writeln;
     writeln('El promedio de los numeros pares es de ',PromPar);
   end;
   readkey;
end.

