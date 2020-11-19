program agencia1;
uses crt;

const
   //comidas
   comida_adulto=2500000;
   comida_ninos=1000000;

   //estadias
   estadia_adulto=2500000; // maximo 3 adultos
   estadia_menores=1800000; // 1 o 2 menores diarios
   estadia_adulto_ad=2100000; // adulto adicional
   estadia_nino_ad=1300000;    // nino adicional

   //alquiler de automovil

   bs_km=3500;     // kilometros estimados
   bs_carro=5000000; // monto de alquiler carro

    //pasaje aereo
   pasajeA=20000000; // Pasaje de avion adulto
   pasajeM=12000000; // pasaje menor, si viajan mas de dos menores se descuenta 25%

  var nro_adultos,nro_ninos,estadia,dias_carro,km,estimacion,costo_carro:integer;
    i:integer;
    paquete_total,descuento,total_comidaA,total_comidaB,total_comidaC,pago_esta_A,pago_esta_N,pago_aereo,pago_estadia_total:real;


  begin

   // INICIALIZAR
   pago_esta_A:=0;
   nro_adultos:=0;
   nro_ninos:=0;
   descuento:=0;
   paquete_total:=0;
   estadia:=0;
   dias_carro:=0;
   km:=0;
   estimacion:=0;
   costo_carro:=0;
   total_comidaA:=0;
   total_comidaB:=0;
   total_comidaC:=0;
   pago_esta_N:=0;
   pago_aereo:=0;
   pago_estadia_total:=0;


   writeln('Bienvenido a la agencia familiar');
   writeln('Calcularemos el precio del paquete completo');
   writeln;

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

       writeln('Costo de la estadia total es: ',pago_estadia_total:2:2);
       writeln('Costo de la comida total: ',total_comidaC:2:2);
       writeln('costo del alquiler de carro: ',costo_carro);
       writeln('costo del pasaje aereo: ',pago_aereo:2:2);
       writeln('Costo del paquete completo: ',paquete_total:2:2);

       readkey;

  end.

