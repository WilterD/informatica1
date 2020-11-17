program evento;
uses crt;
      (*.En un evento público tienen como norma hacer un descuento del 50% en
el costo de la entrada para menores de 12 años. Elabore un Algoritmo, que
lea N edades de personas en el evento, calcule e imprima el costo total y la
cantidad y monto para menores de 12 años.*)

var  totalMA,menores,mayores,edad:integer;
  descuento,totalME,ganancias:real;
begin

  mayores:=0;
  menores:=0;

  while edad<>0 do
  begin
    writeln('La entrada vale 300$');
    writeln('Los menores de 12 anos tienen descuento de 50%');
    writeln('Cual es su edad?');
    read(edad);

    if edad<12 then
    begin
    menores:=menores+1; // cuantos menores hay
    totalME:=totalME+300; // ir sumando por entradas
    end
    else
    begin
    mayores:=mayores+1;
    totalMA:=totalMA+300;
    end;

    descuento:=(totalME*0.50); // calcular descuento
    totalME:=(totalME-descuento); // aplicar descuento

    ganancias:=totalME+totalMA; // ganancias totales

    total_p:=menores+mayores; // calcular personas en el evento

    writeln('Hay ',menores,' personas menores de 12 anos y su total a pagar es: ',totalME:2:2);
    writeln('Hay ',mayores,' personas mayores de 12 anos y su total a pagar es: ',totalMA);
    writeln('La cantidad de personas en el evento es de: ',total_p);

    writeln('las ganancias totales son: ',ganancias:2:2);

    readkey;

  end;


end.

