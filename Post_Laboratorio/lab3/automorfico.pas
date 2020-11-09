program automorfico;
uses crt;

var  cifras,conteo,divisor2,oper1,oper2,oper3,comprobar,i,num1,aux1,cuadrado,cubo,cuatro:integer;
     salir,ingresar:boolean;
     continuar:char;

begin

  ingresar:=true;

  while ingresar=true do
  begin
     // INICIALIZAR
      cifras:=0;
      oper1:=0;
      oper2:=0;
      oper3:=0;
      num1:=0;
      aux1:=0;
      divisor2:=0;
      cubo:=0;
      cuadrado:=0;
      cuatro:=0;
      comprobar:=0;
      continuar:=' ';


      writeln('Escribe un numero para saber si es automorfico');
      readln(num1);

      aux1:=num1; // tenemos el numero original en aux1

      cuadrado:=num1*num1;   // elevacion al cuadrado tambien se puede usar sqr()
      cubo:=num1*num1*num1;
      cuatro:=num1*num1*num1*num1;

      conteo:=1;     // para determinar cuantas cifras tengo en el numero ingresado
      salir:=true;


      while salir=true do
      begin
           cifras:=(num1 div 10);    // voy quitando digitos
           num1:=cifras;
           if cifras=0 then         // si se cumple ya es la ultima vuelta
              salir:=false
               else
               conteo:=conteo+1;      //voy contando digitos
       end;

       // ya tengo las cifras


      // este paso para obtener el divisor
     if conteo>1 then // si la cifra es mayor que 1
             for i:=2 to conteo do  //2
                      divisor2:=divisor2*10
     else
      divisor2:=10; // si la cifra es 1

     //cuando dividimos un numero entre 100 dara 2 decimales entre 1000 tres decimales, por eso determinamos el divisor y
     // antes sabemos de cuantas cifras son

     // Comienzo de cada operacion

      oper1:=(cuadrado mod divisor2);   // obtener resto
       if oper1=aux1 then
         comprobar:=comprobar+1;

        oper2:=(cubo mod divisor2);
       if oper2=aux1 then
         comprobar:=comprobar+1;

       oper3:=(cuatro mod divisor2);
       if oper3=aux1 then
         comprobar:=comprobar+1;


        if comprobar=3 then // si se comprueba los tres casos entonces, es un numero automorfico
         writeln('Es un numero automorfico')
         else
         writeln('No es un numero automorfico');

        writeln;

        writeln('Deseas verificar otro numero?');
        writeln('Continuar (Y) SALIR (N)');
        readln(continuar);

        if (continuar='N') or (continuar='n') then
         ingresar:=false
         else
         clrscr;

  end;

end.
