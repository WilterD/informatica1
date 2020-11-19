program num_odiosos;
uses crt;

var num,original,oper,aux1,b1,i,cifras,C_Odi,C_Nodi,nro_ingre:integer;
   salir,salir2:boolean;
   Prom_O,Prom_No:real;


begin
 //INICIALIZAR
  num:=0;
  b1:=0;
  aux1:=0;
  oper:=0;
  original:=0;
  cifras:=0;
  C_Odi:=0;
  C_Nodi:=0;
  nro_ingre:=0;
  salir:=false;
  Prom_O:=0;
  Prom_No:=0;

    while salir=false do
    begin

      writeln('Escriba una secuencia numeros para saber si son numeros odiosos o no y saber porcentaje');
      read(num);
      nro_ingre:=nro_ingre+1; // cantidad de numeros ingresados
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
       begin
           writeln('El Numero: ',original,' Si es odioso');
           C_Odi:=C_Odi+1
           end
           else
           begin
             writeln('El Numero: ',original,' No es odioso');
             C_Nodi:=C_Nodi+1;
           end;
       end;
    end;

    Prom_O:=(C_Odi*100)/nro_ingre;  // porcentaje de numeros odiosos
    Prom_No:=(C_Nodi*100)/nro_ingre; // porcentaje de numeros no odiosos

    writeln('El porcentaje de numeros odisosos es: ',Prom_O:2:2);
    writeln('El porcentaje de numeros No odisosos es: ',Prom_No:2:2);

    readkey;

end.

