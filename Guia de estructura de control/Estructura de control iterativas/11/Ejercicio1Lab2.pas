//Una  empresa  extranjera  de  aviación  fumiga  cosechas  contra  una  gran  variedad  de
//plagas. Los valores cobrados a los granjeros dependen de lo que éste desea fumigar y de
//cuántas hectáreas se fumigan, de acuerdo a la siguiente distribución:
//Tipo 1: fumigación contra malas hierbas, $10 por hectárea.
//Tipo 2: fumigación contra langostas, $15 hectárea.
//Tipo 3: fumigación contra malas gusanos, $20 por hectárea.
//Tipo 4: fumigación contra todo lo anterior, $30 por hectárea.
//Si  el  área  a  fumigar  es  mayor  de  1000  hectáreas,  el  granjero  goza  de  un  5%  de
//descuento. Además, cualquier granjero cuya cuenta sobrepase los $3000 se le descuenta
//un  10%  sobre  la  cantidad  que  exceda  dicho  precio.  Si  se  aplican  ambos  conceptos,  el
//correspondiente  a  la  superficie  se  considera  primero.  Por  cada  pedido  se  tiene  la
//siguiente  información:  nombre  del  granjero,  tipo  de  fumigación  solicitada  (1,2,3,4)  y  el
//número  de  hectáreas  a  fumigar.  Para  cada  solicitud    el  programa  debe  mostrar  el
//nombre del granjero y valor total  a pagar.

program Ejercicio1Lab2;
uses crt;
  var
nombre:string[30];
fumigacion,hectarea:integer;
precio,precioTotal,descuento1,descuento2:real;

begin
  descuento1:=0;
  descuento2:=0;
  hectarea:=0;
  writeln('Ingrese su nombre');
  readln(nombre);
  writeln('Ingrese la cantidad de hectareas a fumigar');
  readln(hectarea);
  writeln('Ingrese el tipo de fumigacion que desea');
  writeln(' ');
  writeln('Tipo 1: fumigacion contra malas hierbas, $10 por hectarea');
  writeln(' ');
  writeln('Tipo 2: fumigacion contra langostas, $15 hectarea');
  writeln(' ');
  writeln('Tipo 3: fumigacion contra malas gusanos, $20 por hectarea');
  writeln(' ');
  writeln('Tipo 4: fumigacion contra todo lo anterior, $30 por hectarea');
  writeln(' ');
  readln(fumigacion);
     case fumigacion of
     1:
       precio:= 10*hectarea;
     2:
       precio:= 15*hectarea;
     3:
       precio:= 20*hectarea;
     4:
       precio:=30*hectarea;
     else
       writeln('Opcion invalida');
       readln;
       halt
     end;
           if precio>3000 then
           begin
             descuento1:= precio*0.10;
           end;
               if hectarea>1000 then
               begin
                 descuento2:= precio*0.05;
               end;

  precioTotal:= precio-descuento1-descuento2;
  writeln(' Nombre del granjero ',nombre);
  writeln('El precio total a pagar es de: ',precioTotal:0:2);
  readkey;
end.

