program amigos;
uses crt;
var
  num1, num2: integer;
  aux1, aux2, conteo: integer;
  salir: boolean;
begin
  writeln('Escribe el primer numero');
  readln(num1);     (* leo el primer numero *)
  aux1:=sqr(num1);  (* guardo su cuadrado *)
  writeln('Escribe el segundo numero');
  readln(num2);     (* leo el segundo *)
  aux2:=sqr(num2);  (* guardo su cuadrado *)

  conteo:=0;                            (* inicializo *)
  salir:=false;                         (* iniciaalizo *)
  while salir=false do
    begin
      if (aux1 div 10)=0 then           (* si se cumple quiere decir que es la ultima vuelta *)
        salir:=true;
      conteo:=conteo+(aux1 mod 10);     (* sumo digito por digito *)
      aux1:=(aux1 div 10);              (* voy quitando numeros de izquierda a derecha *)
    end;
  aux1:=conteo;                         (* guardo el resultado *)

  conteo:=0;                            (* iniciaalizo *)
  salir:=false;                         (* iniciaalizo *)
  while salir=false do
    begin
      if (aux2 div 10)=0 then           (* si se cumple quiere decir que es la ultima vuelta *)
        salir:=true;
      conteo:=conteo+(aux2 mod 10);     (* sumo digito por digito *)
      aux2:=(aux2 div 10);              (* voy quitando numeros de izquierda a derecha *)
    end;
  aux2:=conteo;                         (* guardo el resultado *)

  if (num1 = aux2) and (num2 = aux1) then   (* evaluo *)
    writeln('Son amigos')
  else
    writeln('No son amigos');

  readkey;
end.

