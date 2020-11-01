program Project1;
  (*13. Determinar la hipotenusa de un triángulo rectángulo conocida las
longitudes de los catetos. (La hipotenusa es igual a la raíz cuadrada de a
suma de los cuadrados de los catetos). *)
uses crt;
 var cateto1,cateto2,hipotenusa:integer;
begin

  Writeln('Escribir cateto 1');
read(cateto1);

Writeln('Escribir cateto 2');
read(cateto2);

hipotenusa:=sqr(cateto1)+sqr(cateto2);

writeln('La hipotenusa es: ',hipotenusa);
readkey;

end.

