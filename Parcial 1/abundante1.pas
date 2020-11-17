program abundante1;
uses crt;
var menor,num,numabundante,i,ab:integer;

begin
  numabundante:=0;
  menor:=1000;

  Writeln('Introduzca un numero');
  readln(num);
    while (num > 0) do
      begin
        for i:=1 to (num-1) do
         begin
           ab:=(num mod i);
             if (ab=0) then
                 numabundante:=numabundante+i;
         end;

         if (numabundante > num) then
           begin
             if numabundante < menor then
                menor:=numabundante
           end;


       writeln('Introduzca el siguiente numero');
       readln(num);
      end;

    writeln('El menor de los abundantes es: ',menor);
readkey;
end.

