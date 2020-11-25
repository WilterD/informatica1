program recorrer2;
uses crt;

type
matriz = array[1..9,1..9] of integer;
var arreglo:matriz;
num:integer;
salir:boolean;
i,col,j,fila,aux,rec:integer;

begin

  for i:=1 to num do
    for j:=1 to num do
     arreglo[i,j]:=0; //inicializar

  j:=1; // numeros dentro de la matriz
  col:=1; // columnas de la matriz
  fila:=1; // fila de la matriz
  salir:=false; // inicializar
  rec:=0; //recorrido

  writeln('De que orden es la matriz? ejem 3x3');
  readln(num);

  aux:=num+1; // extremo derecho

  while salir=false do
  begin
    for i:=fila to aux-1 do
      begin
        arreglo[i,col]:=j;
        j:=j+1;
        rec:=rec+1;
      end;

    aux:=aux-1;
    fila:=fila+1; //aumento de fila
    col:=col+1; // posicion de columnas

    if rec=1 then
       salir:=true;
       rec:=0; //para saber si solo se hizo una vuelta, inicializo
  End;

  // Ahora la Piramide
  salir:=false;
  fila:=fila-2;

  while salir=false do
  begin
       for i:=fila to aux+1 do
           begin
                arreglo[i,col]:=j;
                j:=j+1;
           end;

           aux:=aux+1;
           col:=col+1; // posicion de columnas
           fila:=fila-1;

           if col=num+1 then
              salir:=true;

  End;

  for col:=1 to num Do
  Begin
       WriteLn;
       for fila:=1 to num Do
           if arreglo[fila,col] = 0 then // si arreglo esta vacio
              Write(' ')
                      Else
                      if arreglo[fila,col] >= 10 then
                         Write(' :', arreglo[fila,col], ':')
                         Else
                         Write(' |0', arreglo[fila,col], '|');
  End;


  readkey;


end.
