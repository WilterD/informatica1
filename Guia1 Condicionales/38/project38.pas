program project12;
uses crt;
 (*38. Elabore un algoritmo que determine si un número es automórfico. Un
número automórfico es aquel que al elevarlo sistemáticamente a una
potencia mayor que cero, las últimas cifras del resultado corresponden al
mismo número.
(Pruebe sólo con las tres primeras potencias)
Ejemplo:
761= 76; 76 -2 = 5776; 76-3 = 438976; 76-4 = 33362176*)
var num1,operacion,cifras,cuadrado,conteo,aux1,divisor,divisor2,i,cubo:integer;
  var operacion2,operacion3:integer;
  var salir:boolean;

begin
  writeln('Escribe un numero para saber si es automorfico');
read(num1);

aux1:=num1; // tenemos el numero original en aux1

cuadrado:=0;   // inicializar
cuadrado:=num1*num1;   // elevacion al cuadrado tambien se puede usar sqr()
cubo:=num1*num1*num1;
 conteo:=1;     // para determinar cuantas cifras tengo en el numero ingresado
salir:=true;
cifras:=0;

while salir=true do
begin
cifras:=(num1 div 10);    // voy quitando digitos
num1:=cifras;
if cifras=0 then   // si se cumple ya es la ultima vuelta
begin
salir:=false;
end
else
begin
 conteo:=conteo+1;      //voy contando digitos
end;
end;
 // ya tengo las cifras
  divisor2:=10;
 if conteo>1 then // si la cifra es mayor que 1
 begin
 for i:=2 to conteo do  //2
 begin
 divisor:=divisor2*10;   //por cada vuelta elevo el divisor al cuadrado
 divisor2:=divisor; // determinar el divisor por cada numero de vueltas se agrega un cero

 end;
 end
 else
 begin
  divisor2:=10; // si la cifra es 1
 end;
operacion:=0;
operacion2:=0;
operacion3:=0;

operacion:=(cuadrado mod divisor2);
if operacion=aux1 then
begin
writeln('es un numero automorfico');

end
else
begin
writeln('No es un numero automorfico');
writeln('divisor2: ',divisor2);
writeln('cuadrado: ',divisor2);
writeln('divisor: ',divisor);
writeln('operacion: ',operacion);

end;

operacion2:=(cubo mod divisor2);
if operacion2=aux1 then
begin
writeln('es un numero automorfico');

end
else
begin
writeln('No es un numero automorfico');
writeln('divisor2: ',divisor2);
writeln('cuadrado: ',divisor2);
writeln('divisor: ',divisor);
writeln('operacion: ',operacion2);

end;

operacion3:=(cuadrado mod divisor2);
if operacion3=aux1 then
begin
writeln('es un numero automorfico');

end
else
begin
writeln('No es un numero automorfico');
writeln('divisor2: ',divisor2);
writeln('cuadrado: ',divisor2);
writeln('divisor: ',divisor);
writeln('operacion: ',operacion3);

end;

readkey;

end.

