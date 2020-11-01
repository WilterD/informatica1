program project1;
 uses crt;
 // 23) Leer tres números del teclado y deducir si se han introducido en orden
// creciente.

 var num1,num2,num3:integer;

begin

   num1:=0;
   num2:=0;
   num3:=0;

  writeln('escribir el primer numero');
  readln(num3);
  writeln('escribir el segundo numero');
  readln(num2);
  writeln('escribir el tercer numero');
  readln(num1);

   if (num1>num2) and (num2>num3) then
   writeln('se escribieron de forma creciente')
  else
  writeln('no se escribieron de forma creciente ');
    readkey;
  end.

