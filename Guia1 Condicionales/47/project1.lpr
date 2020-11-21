program project1;

uses crt;

var num1,num2,cuadrado:integer;



  CONT,dig,suma:integer;
  procedure leerentero(var n:integer);
  begin
  read(n); //11
  cont:=cont+1;

  while (n div 10 <> 0) do // determino cuantas cifras tengo
   begin
    CONT:=CONT+1;
    n:=n div 10;

   end;
  end;
  var entero:integer;
  begin
      leerentero(entero);

      writeln ('la cantidad de digitos es ',CONT);


  writeln('Ingresa un primer numero');  // 16
  read(num1);

  writeln('Ingresa un segundo Numero');  // 13
  read(num2);

  cuadrado:= sqr(num1);

  writeln('la elevacion es :',cuadrado); // 16 al c2 256

   readkey;
end.

