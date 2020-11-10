//20. La amistad cuadrática entre números se podría explicar en la siguiente
//conversación entre el numero 13 y el numero 16
//16 al 13: Quiero ofrecerte mi homenaje amigo, mi cuadrado es 256 cuya suma
//de guarismos es 13
//13 al 16: Agradezco tu bondad y quiero retribuirla en la misma forma. Mi
//cuadrado es 169 cuya suma de guarismos es 16.
//Dado este pequeño fragmento de “El hombre que calculaba” realice un programa que
//diga si dos números son amigos matemáticos
// Alberto_William


program amigoscuadraticos;
uses crt;
var
  Num1, Num2, NC1, NC2, Z1, Z2, Dig1, Dig2, Suma1, Suma2: integer;
begin
  Dig1:= 0;
  Dig2:= 0;
  Suma1:= 0;
  Suma2:= 0;
  writeln('Ingrese el primer numero a evaluar su amistad matematica');
  readln(Num1);
  writeln('Ingrese el segundo numero');
  readln(Num2);
  NC1:= (Num1 * Num1);
  NC2:= (Num2 * Num2);
  Z1:= NC1;
  Z2:= NC2;

  while Z1 <> 0 do   { Descomponer el cuadrado de N1 en digitos y vas sumando }
   begin
      Dig1:= (Z1 mod 10);
      Suma1:= (Suma1 + Dig1);
      Z1:= (Z1 div 10);
   end;
  while Z2 <> 0 do {Descomponer el cuadrado de N2 en digitos y vas sumando}
   begin
      Dig2:= (Z2 mod 10);
      Suma2:= (Suma2 + Dig2);
      Z2:= (Z2 div 10);
   end;
  if (Suma1 = Num2) and (Suma2 = Num1) then
   begin
     writeln(Num1, ' ', 'y', ' ', Num2, ' ', 'son amigos matematicos');
   end
  else
    begin
       writeln(Num1, ' ', 'y', ' ', Num2, ' ', 'no son amigos matematicos');
    end;
 ReadKey;
end.
