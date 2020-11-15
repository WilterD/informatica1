//2. Escriba un algoritmo que calcule el resultado de la siguiente serie:
//a) 2, 5, 7, 10, 12, 15, 17, 20, …. 1800

program SerieA;
uses crt;
var
  i,num:integer;

begin
  num:=2;
  i:=1;
  while num<=20 do //Este sera el numero limite que veremos imprimod por pantalla en este caso la serie de numeros sera hasta 20 si colocamos 1800
   begin                         // Veriamos por pantalla todo el calculo en pantalla hasta que llegue a 18000
   writeln(num);
     if (i mod 2 = 0) then  //Como funciona este recorrido pues si vemos la serie es una suma que empieza en 2+3=5 luego 5+2=7 y 7+3=10
     begin                  // entonces la solucion es que inicializamos una variable con 1 y esta variable al dividirla entre 2 es 0 entonces le sumara al numero
      num:= num+2;          // 2 pero si no es una division exacta entre 2 entonces se le sumara al numero y antes de terminar el ciclo repetitivo le sumamos 1 a la variable inicializada
     end
     else
     begin
      num:=num+3;
     end;
   i:=i+1;
  end;
  readkey;
end.

