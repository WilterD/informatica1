(*Dado una secuencia de  números naturales (sin el cero) y finalizada al introducir un número negativo,  construya un algoritmo que determine  el menor y el mayor de  los números MALVADOS  de la secuencia introducida.
Número malvado: todo número natural cuya expresión en base 2 (binaria) contiene un número par de unos. Por ejemplo el 12 y el  15 son números malvados ya que 12=1100 contiene dos(2) unos en su representación binaria  y 15=1111  contiene cuatro(4)  unos en su representación binaria ( dos y cuatro son pares). Para llevar un número natural a binario, hacer divisiones sucesivas entre 2 y tomar el resto.
*)


program num_malvados;
uses
SysUtils;
Var
Num,Dig,cont : integer;
bin:string;
begin
Writeln('Escriba un numero');
readln(num);
cont := 0;
bin :=(' ');
while (num > 0) do
begin
dig :=num mod 2;
if dig mod 2 = 1 then
cont := cont+1;
num := num div 2;
bin:= char(dig+48) + bin;
end;
Writeln('El numero binario es ', bin);
if cont mod 2 = 0 then
begin
Writeln('El numero binario es Malvado');
end
else
Writeln('El numero binario no es Malvado');
readln()
end.
