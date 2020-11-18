(*Dado una secuencia de  números naturales mayores que cero y finalizada por el usuario,  construya un algoritmo que determine  cual es el porcentaje de  números ODIOSOS que hay en la secuencia introducida.
Número odiosos: todo número cuya expresión en base 2 (binaria) contiene un número impar de unos. Por ejemplo, 11=1011 es un número odioso pues tiene tres (3) unos, siendo tres número impar. Para llevar un número natural a binario, hacer divisiones sucesivas entre 2 y tomar el resto.
*)


program ejercicio1;
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
