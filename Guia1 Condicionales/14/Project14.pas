program Project1;
uses crt;
(*14. Realizar la conversión de una temperatura dada en grado Celsius a
grados Fahrenheit
(ºF = 9/5ºC + 32 )*)

var grados,fahren:real;
begin
  writeln('Escribe los grados celcius para con: ');
  read(grados);

  fahren:=(grados*9/5+32);
  writeln('Los grados Fahrenheit son: ',fahren:0:2);
  readkey;
end.

