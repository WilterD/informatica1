program rusos;
   uses crt;
var num1,num2,i:integer;
  booleano:boolean;
begin
  num1:=0;
  num2:=0;
  i:=0;
  writeln(' escriba el numero de la columna izquierda ');
  readln(num1);
  writeln(' escriba el numero de la columna derecha ');
  readln(num2);
  repeat
    if (num1 mod 2) = 0 then // dividir en enteros
      booleano:=true
    else
    begin
    i:=i+num2;
    booleano:=false;
    end;
     num1:=num1 div 2; //dividir en enteros
     num2:=num2*2;  // crear su doble
  until num1=0;
  writeln(' el resultado de la suma de la multiplicacion de la derecha es: ',i);
  readkey;

end.
