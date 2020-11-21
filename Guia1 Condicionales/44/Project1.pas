program Project1;

uses crt;
 const pasaje=2000;
var distancia,estancia:integer;
  precio,descuento:real;

begin
  descuento:=0;
  distancia:=0;
  estancia:=0;

  writeln('Bienvenido!');
  writeln('El precio del pasaje es 2000$ por kilometraje');
  writeln('Cual es la distancia a recorrer del avion en km?');
  read(distancia);

  writeln('Cual es el numero de dias de estancia del avion?');
  read(estancia);

  if(distancia>1000) and (estancia>7) then
  begin
    writeln('Usted tendra un descuento de 30%');//aplicamos descuento
    precio:=(distancia*pasaje);
    descuento:=(precio*0.30);
    precio:=(precio-descuento);
  end
  else
  begin
  precio:=(pasaje*distancia);
  end;

  writeln('el pasaje de ida y vuelta es de: ',precio:2:2,' $ USD');
  readkey;




end.

