program Project1;
uses crt;

var aux1,aux2,conteo,num1,num2,doble:integer;

  var salir:boolean;


begin

   writeln('Escriba el primer numero a multiplicando');
   read(num1);
   aux1:=sqr(num1);
   writeln('Escriba el segundo numero a multiplicador');
   read(num2);
   aux2:=sqr(num2);

   salir:=false;
   conteo:=0;

   while salir=false do
   begin
     if (aux1 div 10)=0 then // si se cumple es la ultima vuelta
     salir:=true;
   conteo:=conteo+(aux1 mod 10); // sumando cada digito

   aux1:=(aux1 div 10); //voy quitando los valores de derecha a izquierda
   end;

   aux1:=conteo; // guardo el valor
   conteo:=0;
   salir:=false;

   while salir=false do
   begin
     if (aux2 div 10)=0 then // si se cumple es la ultima vuelta
     salir:=true;
   conteo:=conteo+(aux2 mod 10); // sumando cada digito
   aux2:=(aux2 div 10); // quitando numeros
   end;

   aux2:=conteo;

   conteo:=0;
   salir:=false;

   if (num1 = aux2) and (num2 = aux1) then   (* evaluo *)
      writeln('Son amigos')
    else
      writeln('No son amigos');

    readkey;







end.
