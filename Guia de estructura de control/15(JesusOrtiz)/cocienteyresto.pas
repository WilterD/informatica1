program cocienteyresto;
uses crt;
var
  dividendo,divisor,cociente,resto:integer;
begin
  writeln('Inserte el dividendo: ');
  readln(dividendo);
  writeln('Inserte el divisor: ');
  readln(divisor);
  if divisor=0 then
    writeln('la division de un numero entre 0 no existe')
  else
    begin
      cociente:=0;
      resto:=dividendo;
      while resto>=divisor do
        begin
        resto:=resto-divisor;          // el proceso basicamente es ir restandole divisor al resto que tiene el mismo valor que dividendo hasta que este sea menor al divisor y ya ahi tendriamos la division lista //
        cociente:=cociente+1;          // por cada ves que se realiza el proceso le voy sumando 1 a cociente //
        end;

      Writeln('El cociente es: ',cociente);
      writeln('El resto es: ',resto);

    end;
readkey;
end.

