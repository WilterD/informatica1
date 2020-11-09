program lab1;
uses crt;
 (*- Dada una secuencia de enteros positivos terminada en cero, elabore un algoritmo que :
a) Calcule el porcentaje de números impares y el porcentaje de números pares.
b) Calcule la cantidad de valores iguales a un valor N dado por el usuario.
c) El número mayor y el menor de la secuencia*)
var numeros,num1,num2,pares,fav,impares,mayor,contador,b,a,menor:integer;
  salir:boolean;
  porc1,porc2:real;

begin

  writeln('Ingrese su numero favorito y se contara las veces ingresado ese numero');
  read(num1);

  contador:=0;

  mayor:=1;
  pares:=0;
  impares:=0;
  num2:=1;
  b:=1;

  salir:=true;

  while num2<>0 do
    begin
        writeln('Ingrese una secuencia de numeros enteros');
        read(num2);

        contador:=contador+1; // cuantos numeros se ingreso

        if num2=num1 then // contar numero favorito
          fav:=fav+1; // favorito

        a:=num2;
        if mayor>a then
        mayor:=a
        else if (a>num2) and (a<b) then
        menor:=a;


        if (num2 mod 2)=0 then // es par
        pares:=(pares+1)
        else
          impares:=impares+1;

   end;

  porc1:=(pares/contador*100);

  porc2:=(impares/contador*100);



  writeln('Cantidad de numeros pares: ',pares);

  writeln('Cantidad de numeros impares: ',impares);

  writeln('El numero mayor: ',mayor);

  writeln('El numero mayor: ',menor);

  writeln('Su numero favorito se ingreso: ',fav);

  writeln('porcentaje de numeros pares ingresados: ',porc1:0:2);

  writeln('porcentaje de numeros impares ingresados: ',porc2:0:2);




  readkey;
end.

