program project1;
  uses crt,math;

 var numeros,i,numeros2,conteo,cifras,original,contador,aux1,x,y:integer;
   salir:boolean;
   resultante:real;


begin

  writeln('Ingrese un numero entero de N Digitos');
  read(numeros);

  writeln('Escriba un numero que se sustituira en todas las coincidencias por otro digito');
  read(x);

  writeln('Escriba el numero sustituto');
  read(y);


  aux1:=x;
  original:=numeros;

      conteo:=0;     // para determinar cuantas cifras tengo en el numero ingresado
      salir:=true;

      while salir=true do
      begin
           cifras:=(numeros div 10);    // voy quitando digitos
           numeros:=cifras;
           if cifras=0 then         // si se cumple ya es la ultima vuelta
              salir:=false
               else
               conteo:=conteo+1;      //voy contando digitos
       end;



       // ya tengo las cifras
       contador:=0;
       for i:=1 to conteo do
       begin
            contador:=contador+1;
            aux1:=(original mod 10); // sacar ultimo numero
            if aux1=x then // si coincide
               begin
               resultante:= resultante + y*(power(10,contador));
               writeln('proceso: ',resultante:2:2,'  nro:',contador);
               original:=original div 10;
               end
            else
            original:=original div 10; // quito el ultimo digito*)
       end;



       writeln('original: ',original:2);
       writeln('resultante: ',resultante:2:2);



       readkey;



end.

