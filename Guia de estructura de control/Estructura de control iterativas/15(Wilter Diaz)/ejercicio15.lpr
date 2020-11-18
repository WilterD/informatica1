program ejercicio15;
uses crt;
(*En un estacionamiento ingresan y se retiran N carros diarios. El monto a pagar se
calcula multiplicando el número de horas que permaneció el automóvil dentro del
estacionamiento por Bs. 700 y se incrementa esta cantidad en Bs. 100 por cada cuarto
de hora adicional.

Elabora un algoritmo que a partir de la hora de entrada y la hora de
salida de cada uno de los vehículos (en un mismo día) calcule el monto a pagar por
concepto de estacionamiento.
Dados:
HH: es un entero que indica la hora
MM: es un entero que indica los minutos
T: es un carácter que indica si la hora es AM o PM .
Ejemplo: 12 35 P 2 15 A
Esta secuencia corresponde a un vehículo que ingreso al estacionamiento a las 12:35
PM. Y se retiro a las 2:15 PM.
*)
const bs_700=700;
  const bs_100=100;

var HH,MM,total,HH2,MM2,i,MT,inicio,salida,horas:integer;
  T,T2,continuar:char;
  salir:boolean;

begin

  salir:=false; // variable de control

  while salir=false do
  begin
          total:=0;
          writeln('Bienvenido al Sistema de calculo de estacionamiento');

          repeat
          writeln('Ingrese la hora de entrada de su automovil)');
          readln(HH);
          if HH>12 then
            writeln('Ingrese Horas validas');
          until HH<=12;

          repeat
            writeln('Ingrese los minutos de entrada (menos de 60 min)');
            readln(MM);
            if MM>59 then
            writeln('Ingrese Minutos validos');
          until MM<60;

          Writeln('Ingrese si el automovil ingreso en la tarde (P) o en la manana (A)');
          readln(T);

          repeat
          writeln('Ingrese la hora de salida de su automovil)');
          readln(HH2);
          if HH2>12 then
            writeln('Ingrese Horas validas');
          until HH2<=12;

          repeat
            writeln('Ingrese los minutos de salida (menos de 60 min)');
            readln(MM2);
            if MM2>59 then
            writeln('Ingrese Minutos validos');
          until MM2<60;

          Writeln('Ingrese si el automovil salio en la tarde (P) o en la manana (A)');
          readln(T2);

          if (T='A') and (T2='A') then // ingreso en la mañana 1 am - 11 am
            begin
              for i:=HH to HH2-1 do
                begin
                  total:=total+bs_700; // calcular costo por horas
                  MT:=MM+MM2; // SUMAR minutos
                  MT:=(MT div 15); // calcular precio adicionar de 15 minutos
                end;
            end
          else if (T='P') and (T2='P') and (HH>11) and (HH2<10) then  // ingreso en la entre 12 pm Y 9pm
          begin
             inicio:=(HH DIV 10);
             salida:=(HH2 mod 10);

             for i:=inicio to salida do
             begin
                  total:=total+bs_700; // calcular costo por horas
                  MT:=MM+MM2; // SUMAR minutos
                  MT:=(MT div 15); // calcular precio adicionar de 15 minutos/ nro de vueltas
             end;
          end
          else if (T='P') and (T2='P') and (HH>0) and (HH2<12) then  // ingreso en la entre 1-11pm a

            begin
                  for i:=HH to HH2-1 do
                  begin
                    total:=total+bs_700; // calcular costo por horas
                    MT:=MM+MM2; // SUMAR minutos
                    MT:=(MT div 15); // calcular precio adicionar de 15 minutos
                  end;
            end
            else if (T='A') and (T2='P') then // ingreso en la mañana y sale en la tarde
            begin
                 if HH>HH2 then
               horas:=(HH2+12)-HH
               else
                 horas:=(HH2+12)-HH;

               for i:=1 to horas do
                begin
                  total:=total+bs_700; // calcular costo por horas
                  MT:=MM+MM2; // SUMAR minutos
                  MT:=(MT div 15); // calcular precio adicionar de 15 minutos

                end;
            end;


    for i:=1 to MT do
       total:=total+bs_100; //calcular monto adicional

    writeln('Su monto a pagar por estacionamiento es: ',total);

    writeln('Desea ingresar otro vehiculo? SI (Y) / NO (N)');
    read(continuar);
     readkey;

    if continuar='N' then
    salir:=true
    else
      clrscr;



   end;





end.

