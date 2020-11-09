program universidad1;
 uses crt;


const costo_pre=150000;
  costo_post=300000;

 var promedio,total,descuento:real;
   creditos:integer;
   cursando,nombre,apellido:string;
   grado:boolean;



BEGIN

  //INICIALIZAR:
  nombre:=' ';
  apellido:=' ';
  descuento:=0;
  promedio:=0;
  creditos:=0;
  total:=0;


  writeln('Bienvenido Alumno al Sistema de universidad');
  writeln('Escribir su Nombre');
  readln(nombre);
  writeln('Escribir su Apellido');
  readln(apellido);
  writeln('Escribir si es de pregrado o postgrado');
  readln(cursando);

  writeln('Escriba su promedio');
  readln(promedio);

  if (cursando='pregrado') then //pregrado
     grado:=true
  else
     grado:=false;


   if (promedio>=15.5) and (grado=true) then
   begin
       creditos:=28;                    //creditos a cursar
       total:=(creditos*costo_pre);    // obtener total sin descuento
       descuento:=(total*0.20);       // obtener descuento
       total:=(total-descuento);     //aplicar descuento
       writeln('Su promedio es de: ',promedio:2:2);
       writeln('Alumno: ',nombre,' ',apellido,' cursara: ',creditos,' creditos y tendra un descuento de 20%');
       writeln('Usted es de pregrado y debe pagar: ',total:2:2,' BS');
   end
   else if  (promedio>=14) and (promedio<15.5) and (grado=true) then
      begin
       creditos:=25;                    //creditos a cursar
       total:=(creditos*costo_pre);    // obtener total sin descuento
       descuento:=(total*0.10);       // obtener descuento
       total:=(total-descuento);     //aplicar descuento
       writeln('Su promedio es de: ',promedio:2:2);
       writeln('Alumno: ',nombre,' ',apellido,' cursara: ',creditos,' creditos y tendra un descuento de 10%');
       writeln('Usted es de pregrado y debe pagar: ',total:2:2,' BS');
      end
      else if (promedio>=12.5) and (promedio<14) and (grado=true) then
        begin
       creditos:=20;                    //creditos a cursar
       total:=(creditos*costo_pre);    // obtener total
       writeln('Su promedio es de: ',promedio:2:0);
       writeln('Alumno: ',nombre,' ',apellido,' cursara: ',creditos,' creditos');
       writeln('Usted es de pregrado y debe pagar: ',total:2:2,' BS');
        end
      else if (promedio>=10) and (promedio<12.5) and (grado=true) then
               begin
               creditos:=15;
               total:=(creditos*costo_pre);    // obtener total sin descuento
               writeln('Su promedio es de: ',promedio:2:2);
               writeln('Alumno: ',nombre,' ',apellido,' cursara: ',creditos,' creditos');
               writeln('Usted es de pregrado y debe pagar: ',total:2:2,' BS');
               end
      else if (promedio<10) and (grado=true) then
                     writeln('Usted no podra matricularse');


          if (promedio>=4.5) and (grado=false) then
             begin
             creditos:=20; //creditos a cursar
             total:=(costo_post*creditos);   // Obtener total sin descuento
             total:=(total*0.20);           // Obtener descuento
             total:=(total-descuento);
             writeln('Su promedio es: ',promedio:2:2);
             writeln('Alumno: ',nombre,' ',apellido,' cursara: ',creditos,' creditos y tendra un descuento de 20%');
             writeln('Usted debe pagar: ',total:2:2,' BS');
          end
          else if (promedio<4.5) and (grado=false) then
          begin
             creditos:=10; //creditos a cursar
             total:=(costo_post*creditos);   // Obtener total sin descuento
             writeln('Su promedio es: ',promedio:2:2);
             writeln('Alumno: ',nombre,' ',apellido,' cursara: ',creditos,' creditos');
             writeln('Usted debe pagar: ',total:2:2,' BS');
          end;



  readkey;
end.

