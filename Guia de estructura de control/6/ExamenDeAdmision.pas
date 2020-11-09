//Una escuela aplica dos exámenes a sus aspirantes, por lo que cada uno de
//ellos obtiene dos cali ficaciones denotadas como C1 y C2. El aspirante que
//obtenga una cali ficación mayor que a un mínimo dado en cualquiera de los
//exámenes es aceptado; en caso contrario es rechazado. Reali ce un
//Algoritmo, que lea el nombre y cali ficaciones del aspirante. Realice un
//Algoritmo, que indique si es aceptado o rechazado. (Ejemplo mínimo = 90)

program ExamenDeAdmision;
uses crt;
var
  C1,C2,minimo:integer;
  Nombre:string;

begin
  writeln('Ingrese el nombre del estudiante');
  readln(nombre);
  writeln('Ingrese la primera calificacion');
  readln(C1);
  writeln('Ingrese su segunda calificacion');
  readln(C2);
  writeln('Ingrese el minimo requerido para ser aceptado');
  readln(minimo);
  writeln;
  if (C1>=minimo) or (C2>=minimo) then
  begin
    writeln('El aspirante ',nombre,' fue aceptado');
  end
  else
  begin
    writeln('El aspirante ',nombre,' fue rechazado');
  end;
  readkey;

end.

