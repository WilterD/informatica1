//6. Dado un número entero de 5 dígitos, se quiere obtener el número producto de
//desplazar circularmente a la derecha tantos dígitos del número dado como lo indique
//su primer digito.

program DesplazamientoEmmanuel;
uses crt,math;
var
  numero,aux,ultimo,i,primero,desplazamiento,potencia,cont,cifras,resto:integer;

begin
  writeln('Ingrese un numero');
  readln(numero);
  aux:=numero;
  cont:=1;
//***********************Contador de digitos************************************
  while (numero div 10 <> 0) do
   begin
     cont:=cont+1;
     numero:= numero div 10;
   end;
  writeln(' Cantidad de digitos que tiene el numero ingresado es de ',cont);
  writeln;
  writeln('PROCESANDO');
   if cont<>5 then
    begin
      writeln('Ha ingresado un numero de mas de 5 digitos');
    end
   else
//************************Desplazamiento dolor de cabeza***********************
   begin
     numero:=aux; //Con esto recuperamos el numero original que antes estaba guardado en el aux para volver a usar
     potencia:=cont-1; //Le reducimos uno al contador de digitos con el proposito que a la hora de elevar una de base 10 de la cantidad de cifras
     cifras:= 10**potencia; // En este caso como son 5 digitos 10 elevado a 4 nos dara 10000
     primero:=numero div cifras; //Aqui veremos que el sentido de toda esta operacion con la potencia y la cifra era con el proposito de que al dividir el numero ingresado div cifras nos de
     ultimo:=numero mod 10;      //el 1er digito y para conseguir el ultimo digito simplemente numero ingresado mod 10 y no los dara
     desplazamiento:=numero;     //Inicializamos desplazamiento (Que sera nuestro resultado total) con el numero ya que dentro del ciclo repetitivo este valor cambiara
        for i:=1 to primero do
         begin
           ultimo:=ultimo*cifras; //Digamos que ingresas 12345 entonces ya sacamos el ultimo que era 5 anteriormente ahora lo multiplicamos por cifras que son 10000 y nos dara 50000
           resto:=desplazamiento div 10; //Con este paso le quitamos el ultimo numero
           desplazamiento:=ultimo+resto; //Ahora le sumamos el resultado que nos dio de multiplicar el ultimo numero con cifras y le sumamos el resto y nos dara el numero nuevo de desplazamiento
           primero:=desplazamiento div cifras; //Y esto que vemos aqui es en caso de que el primer digito sea mayor a 1 debido a que tenemos que tener un control
           ultimo:=desplazamiento mod 10; //de cual es el primer numero del resultado obtenido y el ultimo para desplazar multiples veces como lo indique el primer digito
      end;
//********************************Imprimir por pantalla************************

      writeln(desplazamiento);
   end;

   readkey;
end.

