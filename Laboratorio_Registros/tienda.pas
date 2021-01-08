program tienda;
  uses crt;

(*Usando un arreglo de registros, realice un programa en Pascal para registrar diez
(10) artículos de una tienda los cuales deben tener la siguiente información: código,
nombre, familia, precio y cantidad. Donde la familia es un código numérico entre 1 y 4
que agrupa por tipo de material ( 1 : papelería, 2 : computación, 3 : MAE materiales
eléctricos, 4: otros). Luego de registrar la información en el arreglo, listar por
familia cada uno de los productos registrados.
*)


type
 Rfamilia = RECORD
  papeleria,computacion,mae,otros:boolean;

 end;
  Rarticulos = RECORD
   codigo:Rfamilia;
   nombre:string;
   precio,cantidad:integer;
  end;

  Rproductos = record
   productos:Rarticulos;
   end;

  misArticulos = array[1..10] of Rproductos;

  var articulos:misArticulos;
    nroP,eleccion,eleccion2,i:integer;
    continuar:char;


 BEGIN
   for i:=1 to 10 do   // INICIALIZAR
      begin
            articulos[i].productos.codigo.papeleria:=false;
            articulos[i].productos.codigo.computacion:=false;
            articulos[i].productos.codigo.mae:=false;
            articulos[i].productos.codigo.otros:=false;
      end;

  repeat



      writeln('Menu Principal: ');
      writeln('Registrar articulo  [1] ');
      writeln('Ver articulos registrados [2]');
      readln(eleccion);

      case eleccion of
        1:begin // registrar articulo
           repeat
                writeln('Numero de producto a listar: [maximo 10]');
                readln(nroP);

                  if nroP>10 then // mensaje de advertencia
                  writeln('Escriba un numero de producto valido!');

           until nroP<=10;

            writeln('Precio del producto ');
            readln(articulos[nroP].productos.precio);

            writeln('Ingrese el nombre del producto: ');
            readln(articulos[nroP].productos.nombre);

            writeln('Ingrese la cantidad del articulo: ');
            readln(articulos[nroP].productos.cantidad);

            writeln('papeleria [1]');
            writeln('Computacion [2]');
            writeln('Materiales electricos [3]');
            writeln('Otros [4]');
            writeln('Ingrese el Codigo del articulo :');
            readln(eleccion2);

            case eleccion2 of  // asignar familia a articulo
              1: articulos[nroP].productos.codigo.papeleria:=true;
              2: articulos[nroP].productos.codigo.computacion:=true;
              3: articulos[nroP].productos.codigo.mae:=true;
              4: articulos[nroP].productos.codigo.otros:=true;
            end;
        end;
        //  VER ARTICULOS
        2:begin
          writeln('Que articulos desea mostrar en pantalla?');
          writeln('papeleria             [1]');
          writeln('computacion           [2]');
          writeln('materiales electricos [3]');
          writeln('otros articulos       [4]');
          readln(eleccion2);

           case eleccion2 of
            1: begin // papeleria
              writeln('Revisando articulos de papeleria..');
              for i:=1 to 10 do
                begin
                 if articulos[i].productos.codigo.papeleria=true then
                 begin

                    writeln('nombre: ',articulos[i].productos.nombre);
                    writeln('precio: ',articulos[i].productos.precio);
                    writeln('cantidad: ',articulos[i].productos.cantidad);

                 end;
                end;
            end;


            2: begin // computacion
             writeln('Revisando articulos de computaccion..');
              for i:=1 to 10 do
                begin
                 if articulos[i].productos.codigo.computacion=true then
                 begin
                  writeln('nombre: ',articulos[i].productos.nombre);
                  writeln('precio: ',articulos[i].productos.precio);
                  writeln('cantidad: ',articulos[i].productos.cantidad);
                 end;

               end;
            end;

            3: begin // mae
             writeln('Revisando articulos de materiales electricos..');
              for i:=1 to 10 do
                begin
                 if articulos[i].productos.codigo.mae=true then
                 begin
                  writeln('nombre: ',articulos[i].productos.nombre);
                  writeln('precio: ',articulos[i].productos.precio);
                  writeln('cantidad: ',articulos[i].productos.cantidad);
                 end;

               end;
            end;

            4: begin // otros
             writeln('Revisando otros articulos..');
              for i:=1 to 10 do
                begin
                 if articulos[i].productos.codigo.otros=true then
                 begin
                    writeln('nombre: ',articulos[i].productos.nombre);
                    writeln('precio: ',articulos[i].productos.precio);
                    writeln('cantidad: ',articulos[i].productos.cantidad);
                 end;
               end;
            end;
          end;

        end;
      end;

      writeln('Desea salir del programa? (N) NO / (S) SI');
      readln(continuar);

   until (continuar='s') or (continuar='S');


END.
