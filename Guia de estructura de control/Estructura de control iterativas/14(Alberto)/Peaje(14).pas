program Peaje;
uses crt;
var
 pasajeros, canticarro, cantibus, PBus, PCarro, PromCarro, PromBus: real;
 respu, vehiculo: char;
begin
 PBus:= 0;
 PCarro:= 0;
 cantibus:= 0;
 canticarro:= 0;
 repeat
   writeln('Ingrese la cantidad de personas en el vehiculo');
   readln(pasajeros);
   writeln('Pulse 1 si viaja en Bus. Pulse 2 si viaja en carro');
   readln(vehiculo);
   if (vehiculo = '1') then
    begin
      cantibus:=(cantibus + 1);
      PBus:=(PBus + pasajeros);
    end
   else
    if (vehiculo = '2') then
     begin
       canticarro:=(canticarro + 1);
       PCarro:=(PCarro + pasajeros);
     end
   else
     begin
       writeln('Tipo de vehiculo invalido');
     end;
   writeln('Pulse (0) si quiere finalizar');
   readln(respu);
 until (respu = '0');
 PromCarro:=(PCarro / canticarro);
 PromBus:=(PBus / cantibus);
 writeln('El promedio de personas en carro es:', PromCarro:9:0);
 writeln('El promedio de personas en bus es:', PromBus:9:0);
 writeln('La cantidad de carros del dia es:', canticarro:9:0);
 writeln('La cantidad de buses del dia es:', cantibus:9:0);
 ReadKey;
end.     