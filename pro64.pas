program pro64;
uses crt;

(*64. Escriba un algoritmo que escriba la transpuesta de la matriz M *)

type
  vector = array[1..9,1..9] of integer;


var i,j,aux1,aux2:integer;
  arreglo:vector;

begin

  for i:=1 to 9 do
      for j:=1 to 9 do      // Inicializar
          arreglo[i,j]:=0;

  for i:=1 to 9 do
      for j:=1 to 9 do     // Rellenar
          arreglo[j,i]:=j;


  aux1:=arreglo[1,9];
  aux2:=arreglo[9,1];

  arreglo[9,1]:=aux1;
  arreglo[1,9]:=aux2;

  for i:=1 to 9 do
      begin
        writeln;
          for j:=1 to 9 do      // Mostrar
            begin
              write(arreglo[j,i]);

            end;
      end;




   READKEY;
end.

