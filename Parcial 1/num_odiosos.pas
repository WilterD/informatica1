program num_odiosos;
uses crt;

(*Dado una secuencia de  números naturales mayores que cero y
finalizada por el usuario,  construya un algoritmo que determine
cual es el porcentaje de  números ODIOSOS que hay en la secuencia introducida.
Número odiosos: todo número cuya expresión en base 2 (binaria) contiene
un número impar de unos. Por ejemplo, 11=1011 es un número odioso pues
tiene tres (3) unos, siendo tres número impar. Para llevar un número natural
a binario, hacer divisiones sucesivas entre 2 y tomar el resto
*)

 var num,original,oper,aux1,contador,b1,i,cifras:integer;
   salir,salir2:boolean;


begin
  num:=1;
  b1:=0;
  aux1:=0;
  oper:=0;
  original:=0;
  cifras:=0;

    while salir=false do
    begin

      writeln('Escriba una secuencia de 1 y 0 numeros para saber si son numeros odiosos');
      read(num);
      if num=0 then
      salir:=true
      else
        begin

        original:=num; // obtener numero original
        aux1:=num;

         cifras:=1;     // para determinar cuantas cifras tengo en el numero ingresado
        salir2:=false;


        while salir2=false do
        begin
             oper:=(aux1 div 10);    // voy quitando digitos
             aux1:=oper;
             if oper=0 then         // si se cumple ya es la ultima vuelta
                salir2:=true
                 else
                 cifras:=cifras+1;      //voy contando digitos
         end;

          oper:=0;
          for i:=0 to cifras do
          begin
            oper:=(num mod 2);
            if oper=1 then
            begin
                b1:=(b1+1); // contar numeros que son 1
                aux1:=(num div 2);
                num:=(aux1);
             end
            else
              begin
                aux1:=(num div 2); // quitar cifra
                num:=(aux1);
               end;
          end;

       if (b1 mod 2)=0 then // es par y no es odioso
           writeln('El Numero: ',original,' no es odioso')
           else
             writeln('El Numero: ',original,' si es odioso');


       readkey;
       end;

    end;

end.

