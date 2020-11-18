//8.  Dado  un  número  entero  de  N  dígitos,  se  pide  que  construya  un  algoritmo  que
//substituya todas las ocurrencias de un dígito dado X por otro dígito
//suministrado Y.
//Ejemplo:
//Entrada  Salida
//14123   64623
//X=1
//Y=6
program Sustituir;
uses crt,math;
var
  numero,x,y,potencia,cont,verificador,resultado:integer;

begin
  cont:=1;
  writeln('Ingrese un numero');
  readln(numero);
  writeln('Ingrese el numero a encontrar');
  readln(x);
  writeln('Ingrese el numero por el cual lo sustituira');
  readln(y);
  potencia:=1;
  writeln;
   while (numero<>0) do
    begin
      verificador:= numero mod 10;
      numero:= numero div 10;
      potencia:=cont-1;
      cont:=cont+1;
       if verificador=x then
        begin
         resultado:=resultado+(y*(10**potencia));
        end
        else
        begin
           resultado:=resultado+(verificador*(10**potencia));
        end;
       ;
    end;
   writeln('El numero modificado es ');;
   writeln(resultado);
   readkey;
end.

