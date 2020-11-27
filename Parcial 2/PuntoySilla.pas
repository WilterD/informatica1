//3.- Elaborar un programa en PASCAL que determine, el valor y la posición, de TODOS los puntos de silla inversos de una matriz NxM leída por el teclado,
//se debe mostrar el valor de los puntos silla y la posiciones que ocupas. Se denomina elemento o punto de silla inverso,
//a aquel valor que simultáneamente es mínimo de su fila y máximo de su columna.
program PuntoySilla;
uses crt;
var
  Matriz:array[1..100,1..100] of integer;
  MinimoFilas:array[1..100]of integer;
  MaximoColumnas:array[1..100]of integer;
  N,M,i,j:integer;

begin
// ¨***********************Orden de la Matriz********************************

  writeln('Introduce el numero de filas que tendra la matriz');
  readln(N);
  writeln('Introduce el numero de columnas que tendra la matriz');
  readln(M);

//************************Entrada de datos a la matriz*********************

  for i:=1 to N do
  begin
    for j:=1 to M do
    begin
      Writeln('Ingrese un numero para ',i,' ',j);
      readln(Matriz[i,j]);
    end;
  end;

  //**********************LLenado de los vectores**************************

  for i:=1 to N do
  begin
    MinimoFilas[i]:= 999;
  end;
  for j:=1 to M do
  begin
    MaximoColumnas[j]:= -999;
  end;

  //**************************Recorrido de la Matriz**************************

  For i:=1 to N do
  begin
    for j:=1 to M do
    begin
      if Matriz[i,j]<MinimoFilas[i] then
      begin
       MinimoFilas[i]:= Matriz[i,j];
      end;
      if Matriz[i,j]>MaximoColumnas[j] then
      begin
       MaximoColumnas[j]:= Matriz[i,j];
      end;
    end;
  end;

  //*****************************SALIDA*****************************************

  For i:=1 to N do
  begin
    For j:=1 to M do
    begin
      if MaximoColumnas[j]=MinimoFilas[i] then
      begin
       writeln ('Punto Silla en la posicion ','(',i,',',j,')');
      end;
    end;
  end;
  readkey;

end.

