program Project1;
 uses crt;
type
tMatriz = array[1..2,1..2] of integer;

var
  A:tMatriz;
  positivo,negativo:integer;

  PROCEDURE insertar(var Z:tMatriz);
var i,j:integer;
  begin
   positivo:=0;
   negativo:=0;
    for i:=1 to 2 do
    for j:=1 to 2 do
    begin
      write('Inserta el elemento[',i,' , ',j,']:');
      read(Z[i,j]);
      if Z[i,j] > 0 then  // es positivo
       begin
       positivo:=positivo+Z[i,j];

       end
      else
      begin
        negativo:=negativo+Z[i,j];
        end;
      end;


  End;


begin

  writeln('Por favor rellene la matriz');
insertar(A);
writeln;

writeln('la suma de los positivos es: ',positivo);
writeln('la suma de los negativos es: ',negativo);

 readkey;
end.

