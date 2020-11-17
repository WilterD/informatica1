//2.-Elabore un algoritmo que determine si un número dado por pantalla es automórfico. Un
//número automórfico es aquel que al elevarlo sistemáticamente a una potencia mayor que cero,
//las últimas cifras del resultado corresponden al mismo número. Hacer el programa, para
//probar que un número es automórfico con un máximo de una potencia N dada. Ejemplo: 76 es
//automorfico para una potencia N= 4 porque: 76^1= 76; 76^2 = 5776; 76^3 = 438976; 76^4 =33362176.
//Fíjese que al elevar el 76 a las 4 potencias sucesivas su resultado teminan en 76.


program Post2Automorfico;
uses crt;
var
Numero,Contador,i,resultado,exponente,aux,Automorfico,Ceros:integer;
salir:boolean;

begin
  salir:=true;
  resultado:=1;
  numero:=0;
  Contador:=0;
  exponente:=0;
  writeln('Ingrese un numero');
  readln(Numero);
  writeln('');
  writeln('Ingrese el exponente');
  readln(exponente);
  writeln('');
  aux:=Numero;
//***************************Hallar la cantidad de numeros*********************
  while salir=true do
  begin
    aux:= aux DIV 10;
    if aux=0 then
    begin
      salir:=false;
    end
    else
     begin
       Contador:=Contador+1
     end;
  end;
//*****************************Operacion de la potencia*************************
  for i:=1 to exponente do
   begin
     resultado:= resultado*numero;
   end;
  writeln('El resultado es ',resultado);
  Ceros:=1;
  for i:=0 to Contador do
   begin
     Ceros:= Ceros*10;
   end;
//*******************************IMPRIMIR***************************************
  Automorfico:= resultado MOD (ceros);
  if Numero=Automorfico then
  begin
    Writeln ('El numero ',numero,' es automorfico');
  end
  else
   begin
     writeln('El numero ',numero,' no es automorfico');
   end;
   readkey;
end.

