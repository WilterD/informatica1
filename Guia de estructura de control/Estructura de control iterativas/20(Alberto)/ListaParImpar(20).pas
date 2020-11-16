program Ejercicio_20_i;
uses crt;
var
i, n, num, sumapar, cantipar, cantimpar, sumaimpar, MediaImpar: integer;
begin
  sumapar:= 0;
  cantipar:= 0;
  cantimpar:= 0;
  sumaimpar:= 0;
  writeln('Ingrese la cantidad de numeros que va a escribir');
  readln(n);
  while i <> n do
   begin
     i:=(i+1);
     writeln('Ingrese un numero');
     readln(num);
     if (num mod 2 = 0) then
      begin
       cantipar:=(cantipar + 1);
       sumapar:=(sumapar + num);
      end;
     if (num mod 2 <> 0) then
      begin
        cantimpar:=(cantimpar + 1);
        sumaimpar:=(sumaimpar + num);
        MediaImpar:=(sumaimpar div cantimpar);
      end;
   end;
 writeln('La media de numeros impares es:', MediaImpar);
 writeln('La cantidad de numeros pares es:', cantipar);
 writeln('La suma de los pares es:', sumapar);
 ReadKey;
end.