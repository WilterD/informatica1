//3. Con dos dados al azar se pueden obtener los números: 2..12. Por ejemplo, para
//obtener el número 2, la única forma es que ambos salgan con el uno; para obtener un
//cuatro existen dos combinaciones posibles, que ambos tengan un dos o que un dado
//salga con uno y el otro con tres. Diseñe un algoritmo (utilizando estructuras iterativas)
//que leyendo un valor N, validado entre 2 y 12, genere cuáles son las combinaciones
//posibles, sin repetición, para ese valor.


program Dado;
uses crt;
var
  n,i,c:integer;

begin
  writeln('Introduzca un numero entre 2 y 12');
  readln(n);
  writeln;
  while (n<2) or (n>12) do
   begin
     clrscr;
     if (n<2) or (n>12) then
      begin
        writeln('numero incorrecto, vuelva a intentarlo');
        writeln;
        writeln('Introduzca un numero entre 2 y 12');
        readln(n);
        writeln;
      end;
   end;

  c:=(n div 2);
    for i:=1 to 6 do
     begin
       if (c+i=n) then
        begin
          writeln('Una combinacion para conseguir un ',n,' es ',c,' y ',i);
        end;
     end;
      c:=(c-1);
      if c>=1 then
       begin
       for i:=1 to 6 do
        begin
          if (c+i=n) then
           begin
             writeln('Una combinacion para conseguir un ',n,' es ',c,' y ',i);
           end;
        end;
       end;
         c:=(c-1);
       if c>=1 then
        begin
          for i:=1 to 6 do
           begin
             if (c+i=n) then
              begin
              writeln('Una combinacion para conseguir un ',n,' es ',c,' y ',i);
              end;
           end;
        end;
  readkey;

end.

