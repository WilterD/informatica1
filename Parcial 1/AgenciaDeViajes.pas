program AgenciaDeViajes;
uses crt;
var
  HotelM,personas,HotelA,adultos,menores,montoHa,montoHm,adicionalA,adicionalM,dias,diasvehiculo,alquilervehiculo,comidaA,montoA,montoM,comidaM,kilometros,kilometrosR,pasajeA,pasajeM,aux:integer;
  total,comidaD,comidaT,kilometrajeT,pasajeT,pasajeD,HotelT:real;

begin
//*******************************Pidiendo datos XD**************************
  montoA:=2550000;
  montoM:=1900000;
  montoHa:=3500000;
  montoHm:=2800000;
  adicionalA:=3100000;
  adicionalM:=2000000;
  alquilervehiculo:=4500000;
  kilometros:=2500;
  pasajeA:=17000000;
  pasajeM:=9000000;
  comidaT:=0;
  comidaD:=0;
  repeat
    writeln('Ingrese el numero de personas');
    readln(personas);
    writeln('Ingrese el numero de dias que permaneceran en el hotel de margarita');
    readln(dias);
     if (personas>8) or (dias<5) then
     begin
       writeln('No cumple con los requisitos minimo del plan');
     end;
  until (personas<=8) and (dias>=5);

  aux:=personas;

  repeat
    writeln('Cuantos adultos son, recuerde que la familia que ha ingresado es de ',personas,' personas');
    readln(adultos);
    aux:=aux-adultos;
    writeln('Cuantos menores son, recuerde que la familia que ha ingresado es de ',personas,' y le quedan ',aux);
    readln(menores);
    aux:=aux-menores;
     if (aux<0)or(aux>0) then
     begin
       writeln('Ha cometido un error a la hora de ingresar datos, por favor vuelva a intentarlo');
     end;
  until (aux=0);
//****************************Calculo*******************************************
   writeln('Procesando......');
   writeln;
   comidaA:= adultos*(montoA*dias);
   comidaM:= menores*(montoM*dias);
   comidaT:= comidaA+comidaM;
    if dias>5 then
    begin
      comidaD:= comidaT*0.15;
      comidaT:= comidaT-comidaD;
    end;
     if adultos<=3 then
      begin
        HotelA:=adultos*(montoHa*dias);
      end
      else
      begin
        HotelA:=adultos*((MontoHa+adicionalA)*dias);
      end;
        if menores<=2 then
         begin
           HotelM:=menores*(montoHm*dias);
         end
         else
         begin
           HotelM:=menores*((montoHm+adicionalM)*dias);
         end;
           HotelT:=HotelA+HotelM;

//*******************************KILOMETROS*************************************
   writeln('Ingrese cuantos dias alguilo un vehiculo');
   readln(diasvehiculo);
   writeln('Ingrese cuantos kilometros recorrio');
   readln(kilometrosR);

//********************************Calculo***************************************
   kilometrajeT:=(diasvehiculo*alquilervehiculo)+(kilometrosR*kilometros);

//********************************ViajeAereo************************************

   pasajeT:=(adultos*pasajeA)+(menores*pasajeM);
    if menores>2 then
     begin
       pasajeD:=pasajeT*0.15;
       pasajeT:=pasajeT-pasajeD;
     end;

//*****************************FINAL********************************************

   total:=pasajeT+kilometrajeT+HotelT+comidaT;

   writeln('Costo de la estadia en el hotel total es de ',HotelT:0:2);
   writeln('Costo de la comida total es de ',comidaT:0:2);
   writeln('Costo del alguiler del carro es de ',kilometrajeT:0:2);
   writeln('Costo del pasaje aereo es de ',pasajeT:0:2);
   writeln('Costo del paquete total es de ',total:0:2);

readkey;


end.

