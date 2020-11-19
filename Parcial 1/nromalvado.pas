program NroMalvado;
uses crt;
var
 aux,cont,numero,binario,acum,malvado:integer;
 promedio:real;

begin
 cont:=0;
 malvado:=0;
 acum:=0;
 binario:=0;

repeat
  writeln('Ingrese un numero');
  readln(numero);
  aux:=numero;
  writeln;
    if numero <0 then
     begin
      writeln('Secuencia terminada');
     end
     else
     begin
       while numero>0 do     //PROCEDIMIENTO PARA SABER SI EL NUMERO ES MALVADO
        begin
        binario:=numero mod 2;
        numero:=numero div 2;
        malvado:=malvado+binario;
        end;
         if (malvado mod 2 = 0) then
          begin
          writeln('el numero ',aux,' es un numero malvado');
          writeln;
          cont:=cont+1;    // CONTADOR DE NUMEROS MALVADOS INTRODUCIDOS
          acum:=aux+acum; // Suma de los numeros introducidos malvados
          end
        else
          begin
           writeln('el numero ',aux,' no es un numero malvado');
           writeln;
          end;
     end;
until (numero<0);

//**********************************SALIDA*************************************

    if cont>0 then
     begin
     promedio:=acum/cont;
     end;

    writeln('El promedio de los numeros malvados introducios por el usuario es de ',promedio:0:2);

readkey;
end.

