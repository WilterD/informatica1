//29.  Construya  un  algoritmo  que  calculen  el  factorial  de  un  número  entero  positivo  n.
//La función factorial, representada por n!, es ampliamente utilizada, y se especifica que
//n!=  n*(n-1)!,  y  además  0!=1.   Implemente  el  mismo  programa  utilizando  repita
//mientras, repita hasta y repita para.
program Ejercicio29FactorialDeVariasFormas;
uses crt;
var
  metodo,numero,aux,i,factorial:integer;
begin
  writeln('Ingrese un metodo para calcular el factorial');
  writeln('1 Factorial con While');
  writeln('2 Factorial con Repeat');
  writeln('3 Factorial con For');
  writeln;
  readln(metodo);
  if metodo=1 then
  begin
    writeln('Introduzca un numero entero');
    writeln;
    readln(numero);
    aux:=numero;
    factorial:=1;
     while numero>0 do
      begin
      Factorial:=Factorial*numero;
      numero:=numero-1

      end;
     writeln(aux,'!= ',factorial);
  end
   else
   begin
      if metodo=2 then
       begin
         writeln('Introduzca un numero entero');
         writeln;
         readln(numero);
         aux:=aux;
         factorial:=1;
         if numero<>0 then
         begin
           repeat
           Factorial:=Factorial*numero;
           numero:=numero-1;
           until (numero=0) ;
           writeln(numero,'!= ',factorial);
         end;
       end
       else
       begin
           if metodo=3 then
           begin
             Writeln('Introduzca un numero entero');
             writeln;
             readln(numero);
             factorial:=1;
             for i:=1 to numero do
             begin
              factorial:=factorial*i
             end;
             writeln(numero,'!= ',factorial);
           end
           else
           begin
               writeln('No ha escogido ningun metodo');
           end;
       end;
   end;
readkey;

end.

