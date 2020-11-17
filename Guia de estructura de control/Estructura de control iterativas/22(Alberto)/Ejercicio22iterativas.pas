program Ejercicio_22;
uses crt;
var
 tipo: char;
 sumapar, sumaimpar, cantipar, cantimpar, MediaImpar, MediaPar, nota: real;
 i: integer;
begin
  sumapar:= 0;
  sumaimpar:= 0;
  cantipar:= 0;
  cantimpar:=0;
  i:= 0;
  repeat
   i:=(i+1);
   writeln('Ingrese su nota del examen');
   readln(nota);
   repeat
   writeln('Pulse A si presento el examen 1. B si presento el 2');
   readln(tipo);
   until (tipo='a') or (tipo='A') or (tipo='b') or (tipo='B');
     if (tipo = 'A') or (tipo = 'a') then
      begin
       cantipar:=(cantipar + 1);
       sumapar:=(sumapar+nota);
      end
      else
      begin
        if (tipo = 'B') or (tipo = 'b') then
         begin
          cantimpar:=(cantimpar + 1);
          sumaimpar:=(sumaimpar + nota);
         end;
      end;
  until (i = 50);
 MediaPar:=(sumapar / cantipar);
 MediaImpar:=(sumaimpar / cantimpar);
 writeln('Nota media examen A:', MediaPar:9:2);
 writeln('Media Examen B:', MediaImpar:9:2);
 ReadKey;
end.  
