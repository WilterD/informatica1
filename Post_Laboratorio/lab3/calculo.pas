program calculo;
uses crt;
var
  edad,n_personas,kilo,gramos,metros,centimetros,jovenes,adulto,mayor:integer;

  EdadP,PesoK,PesoPJ,EstaP,PesoG,Centi_P,gramos_j:real;
  continuar:char;
  salir:boolean;
begin
  //INICIALIZAR

       edad:=0;
       n_personas:=0;
       jovenes:=0;
       centimetros:=0;
       kilo:=0;
       gramos:=0;
       metros:=0;
       PesoPJ:=0;
       EdadP:=0;
       PesoK:=0;
       EstaP:=0;
       PesoG:=0;
       Centi_P:=0;
       gramos_j:=0;
       mayor:=0;
       adulto:=0;
       continuar:=' ';
       salir:=true;  //Estructura de control while

       writeln('Bienvenido Al Sistema calculador');
       writeln;

  While salir=true do
  begin
          writeln('Desea ingresar los datos de una persona? (Y)SI (N)NO');
          readln(continuar);

         if (continuar='N') or (continuar='n') then
            salir:=false
         else
         begin
          n_personas:=n_personas+1;
          Writeln('Ingrese los datos de la persona numero: ',n_personas);
          writeln('Ingrese Su Edad');
          readln(edad);

           writeln('Ingrese Su Peso (kg)');
           readln(kilo);

           writeln('Ingrese Su Peso (grms)');
           readln(gramos);

           writeln('Ingrese Su Estatura (metros)');
           readln(metros);

           writeln('Ingrese Su Estatura (centimetros)');
           readln(centimetros);

           EdadP:=EdadP+edad;                // contar edades
           PesoK:=PesoK+kilo;               // contar pesos de las personas (kilos)
           PesoG:=PesoG+gramos;            // contar gramos peso
           EstaP:=EstaP+metros;           // contar estaturas de las personas
           Centi_P:=Centi_P+centimetros; // contar centimetros estatura



           if (edad>17) and (edad<26) then
              jovenes:=jovenes+1                 // contar personas con edades entre 18 y 25 años
              else if (edad>17) and (edad<36) then
             begin
               adulto:=adulto+1;               // sumar pesos de peronas entre 18 y 35 años
               PesoPJ:=PesoPJ+kilo;           // sumar peso de personas
               gramos_j:=(gramos_j+gramos);  // contar gramos de personas
              end
                 else if edad>36 then
                 mayor:=mayor+1;


           clrscr; // limpiar pantalla



           if adulto>0 then // calculamos el promedio si existen personas de estas edades
                       begin
                            gramos_j:=(gramos_j/adulto);   // promedio gramos jovenes
                            PesoPJ:=(PesoPJ/adulto);      // obtener peso de jovenes promedios
                       end;

          end;
   end;

       if n_personas=0 then
       writeln('Tenga un buen dia usuario, vuelta pronto! ')
       else if n_personas<>0 then
       begin

         EdadP:=(EdadP/n_personas);            // obtener promedio de edad
         PesoK:=(PesoK/n_personas);           // obtener promedio (Kilos)
         EstaP:=(EstaP/n_personas);          // obtener estatura promedio
         PesoG:=(PesoG/n_personas);         // promedio de gramos
         Centi_P:=(Centi_P/n_personas);    // promedio de centimetros total


         writeln('Edad Promedio de todas las personas: ',EdadP:0:0);
         writeln;
         writeln('Peso Promedio de todas las personas: ',PesoK:3:0,',',PesoG:3:0);
         writeln;
         writeln('Estatura Promedio de todas las personas: ',EstaP:0:0,',',Centi_P:2:0);
         writeln;



        if (jovenes=0) then
            writeln('No hay personas de entre 18 y 25 anos')
            else
             writeln('Hay ',jovenes,' jovenes de entre 18 y 25 anos');
        writeln;
        if adulto=0 then
        writeln('No hay personas entre 25 y 35 anos')
        else
        writeln('Peso Promedio de las personas entre 18 y 35 anos: ',PesoPJ:3:0,',',gramos_j:3:0);
        writeln;
        if mayor=0 then
          writeln('No hay personas de 36 anos en adelante')
          else
          writeln('Hay ',mayor,' personas con 36 anos en adelante');






          readkey;
       end;
end.

