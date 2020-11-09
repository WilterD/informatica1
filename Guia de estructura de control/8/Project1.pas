//8. Tres numero naturales A, B y C forman una terna pitagórica cuando se cumple la
  //relación A2 + B2 = C2. Escriba un algoritmo que leídos tres números diga si forman una
//terna pitagórica.

program Project1;
uses crt,math, unit1;
var
  A,B,C,aux:real;
  Pitagora:real;

begin
  writeln('Ingrese el valor de A');
  readln(A);
  writeln('Ingrese el valor de B');
  readln(B);
  writeln('Ingrese el valor de C');
  readln(C);
  pitagora:= (A**2)+(B**2);
  aux:=(C**2);
  IF (aux=pitagora) then
  begin
    writeln('Los datos ingresados si forman un teorema de pitagora');
  end
  else
  begin
    writeln('No forman un teorema de pitagora');
  end;
  readkey;
end.

