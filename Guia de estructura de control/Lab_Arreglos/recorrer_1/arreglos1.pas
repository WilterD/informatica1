program Project1;
uses crt;

type
  vector = array[1..9,1..9] of integer;

  var arreglo:vector;
    num:integer;

    PROCEDURE orden (var num:integer);
    var i,j,fila,col:integer;
      salir:boolean;
    begin
      for i:=1 to num do
      for j:=1 to num do
      arreglo[i,j]:=0;  // inicializar

      fila:=2; // fila de la matriz
      j:=1; //numeros dentro de la matriz
      col:=1;  // columas de la matriz hacia abajo para rellenar nro de vueltas
        salir:=false;
      while salir=false do
      begin
           // Rellenar arreglo
           for i:=1 to col do
           begin
                arreglo[fila,i]:=j;
                j:=j+1;
           end;
           fila:=fila+1; // paso a la otra fila
           col:=col+1; // aumento la cantidad de relleno hacia abajo
           if col=num then // si col es igual a num de matriz termina
           salir:=true;
      end;
  end;

PROCEDURE mostrar(var num:integer);
var i,j,col:integer;
  begin
       for col:=1 to num Do
            Begin
                WriteLn;
                for i:=1 to num Do
                    if arreglo[i,col] = 0 then // si arreglo esta vacio
                        Write('     ')
                    Else
                        if arreglo[i,col] >= 10 then
                            Write(' |', arreglo[i,col], '|')
                        Else
                            Write(' |0', arreglo[i,col], '|');
            End;

  end;

begin

  writeln('De que orden es la matriz? ejemplo 3x3');
  read(num);

  orden(num);
   clrscr;
  mostrar(num);
  readkey;

end.

