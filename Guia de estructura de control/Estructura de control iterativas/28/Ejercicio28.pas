//28 En un evento público tienen como norma hacer un descuento del 50% en
//el costo de la entrada para menores de 12   años. Elabore un Algoritmo, que
//lea N edades de personas en el evento, calcule e imprima el costo total y la
//cantidad y monto para menores de 12 años.

program Ejercicio28;
uses crt;
var
  descuento:real;
  porcentaje:real;
  Edades:integer;
  cont:integer;
  Monto:real;
  costo:real;
  n:integer;
  contN:integer;

begin
  monto:=0;
  cont:=1;
  contN:=0;
  porcentaje:=0.50;
  writeln('Ingrese el costo de la entrada');
  readln(costo);
  writeln;
  writeln('Ingrese la cantidad de personas a participar en el evento');
  readln(n);
  writeln;
   while cont<=n do
    begin
      writeln('Ingrese la edad de la persona ',cont);
      readln(edades);
      writeln;
      descuento:=costo*porcentaje;
       if edades<12 then
       begin
         contN:=contN+1;
         monto:=monto+(costo-descuento);
       end
       else
       begin
          monto:=monto+costo;
       end;
      cont:=cont+1;
    end;

   writeln('Las ganancias totales son de ',monto:0:2);
   writeln('La cantidad de personas que participaron en el evento fue de ',n);
   writeln('La cantidad de carajitos menores a 12  fue de ',contN);
   writeln('El monto para los carajitos menores a 12 es de ',descuento:0:2);
   readkey;
end.

