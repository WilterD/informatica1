(*Una agencia de viajes tiene un plan vacacional familiar hasta 8 personas y con una
estadía mínima de 5 días para la isla de Margarita. El plan incluye el hotel, pasaje
aéreo, alquiler del vehículo, 2 comidas diarias (almuerzo y cena)

La agencia desea que Ud. realice el análisis y el algoritmo que, dado el
número de adultos y el número de menores que conforman la familia, así como los días

que van a permanecer en el hotel,

los días que van a alquilar el vehículo y un estimado

de los Kilómetros que van a recorrer en el vehículo,

le calcule el monto total a pagar
por el paquete familiar que incluye hotel, comida,  alquiler del vehículo y pasajes
aéreos.
Sabiendo que :


•	La estadía en el hotel tiene un costo diario de Bs 2.500.000,00 por
adulto hasta un máximo de 3 y de Bs 1.800.000,00 por día por 1 o 2 menores. El


resto de la tarifa es como sigue: por adulto adicional Bs 2.100.000,00 y por menor
adicional Bs 1.300.000,00 por día.

•	El alquiler del carro es de Bs 5.000.000,00 diarios más el kilometraje
estimado que se paga a razón de Bs 3500,00 el kilómetro

•	El pasaje aéreo es de Bs 20.000.000,00 por adulto y Bs 12.000.000,00
por menor. Si viajan más de 2 menores, se les descuenta un 25% adicional.
*)

program project1;
uses crt;

const
   //comidas
   comida_adulto=2500000;
   comida_ninos=1000000;
   //estadias
   estadia_adulto=2500000; // maximo 3 adultos
   estadia_menores=1800000; // 1 o 2 menores diarios
   estadia_adulto_ad=2100000; // adulto adicional
   estadia_nino_ad=1300000;    //nino adicional

   //alquiler de automovil

   bs_km=3500;     // kilometros estimados
   bs_carro=5000000; // monto de alquiler carro

    //pasaje aereo
   pasajeA=20000000; // Pasaje de avion
   pasajeM=12000000; // pasaje menor, si viajan mas de dos menores se descuenta 25%

  var desc_estadia:boolean;
    nro_personas,nro_adultos,nro_ninos,estadia,dias_carro,km,nro_comidas,contador,estimacion,costo_carro:int64;
    i:integer;
    paquete_total,descuento,total_comidaA,total_comidaB,total_comidaC,pago_esta_A,pago_esta_N,pago_aereo,pago_estadia_total:real;


  begin
    desc_estadia:=false;
   repeat
     writeln('Bienvenido a la agencia familiar');
     writeln('Cuanto es su grupo familiar?');
     read(nro_personas);

     if nro_personas>8 then
        writeln('Se excede el numero de personas');


   until nro_personas<=8;

   writeln('Cuantos adultos comforman su grupo familiar? ');
   read(nro_adultos);

   writeln('Cuantos menores comforman su grupo familiar? ');
   read(nro_ninos);

   writeln('Cuantos dias permaneceran en el hotel?');
   read(estadia);

   writeln('Cuantos dias alquilara el automovil?');
   read(dias_carro);

   writeln('Cuantos kilometros estima que recorre el automovil');
   read(km);

   // calculo comidas

   total_comidaA:=(nro_adultos*comida_adulto*estadia); //total pago adultos

   total_comidaB:=(nro_ninos*comida_ninos*estadia);    // total pago niños

   total_comidaC:=(total_comidaA+total_comidaB);  // total de los dos

   //descuento de comidas 15%

   if estadia>5 then
   begin
     descuento:=(total_comidaC*0.15); //obtener descuento
     total_comidaC:=total_comidaC-descuento; // aplicar descuento
   end;

   contador:=0;
   for i:=1 to nro_adultos do
   begin
     if i>3 then
     pago_esta_A:=(pago_esta_A+estadia_adulto_ad) //pago de estadia adulto  adicional
     else
       pago_esta_A:=(pago_esta_A+estadia_adulto);
     end;

   for i:=1 to nro_ninos do
     begin
       if i>2 then
           pago_esta_N:=(pago_esta_N+estadia_nino_ad)  //pago de estadia nino adicional
           else
               pago_esta_N:=(pago_esta_N+estadia_menores);
    end;

     pago_aereo:=(nro_adultos*pasajeA); // calcular pasaje adultos

     pago_aereo:=(nro_ninos*pasajeM)+pago_aereo;

     if nro_ninos>2 then
     begin
       descuento:=(pago_aereo*0.25); // aplicar descuento
       pago_aereo:=pago_aereo-descuento;
     end;

     pago_estadia_total:=(pago_esta_A+pago_esta_N); // sumar total de estadias

     estimacion:=(km*bs_km); // costo diarios por uso de carro

     costo_carro:=(bs_carro*dias_carro); // costo diario carro

     costo_carro:=(costo_carro+estimacion); // calcular ambos precios


     paquete_total:=(pago_estadia_total+total_comidaC+costo_carro+pago_aereo);

       writeln('Costo de la estadia total es: ',pago_estadia_total:3:2);
       writeln('Costo de la comida total: ',total_comidaC:3:2);
       writeln('costo del alquiler de carro: ',costo_carro);
       writeln('costo del pasaje aereo: ',pago_aereo:3:2);
       writeln('Costo del paquete completo: ',paquete_total:3:2);

       readkey;

  end.

