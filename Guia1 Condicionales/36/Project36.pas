program Project1;
 (*36. Dado el monto en Bs. inicial en una cuenta de ahorros y una tasa de
interés fija mensual, calcule el monto que habrá al cabo de n años,
sabiendo no se hacen retiros de la cuenta.
*)
 uses crt;

  var dinero,anos,interes,ganado,ano,i:integer;
begin
 writeln('Cuanto vas a depositar en el banco?'); //1000
 read(dinero);

 writeln('Cuanto de interes mensual?'); //100
 read(interes);

 writeln('Cuantos anos han pasado?'); // 2 ano = 24*100
 read(anos);
  ano:=12;
 for i:=1 to anos do
 begin
  ganado:=ano*interes;
  ano:=ano+12;


 end;
  writeln('ha ganado de interes: ',ganado);
  writeln('tiene en el banco: ',dinero);
  writeln('En ',anos,' anos tendra en el banco',ganado+dinero);
  readkey;


end.

