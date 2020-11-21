program Project1;
uses crt;
  var num1,num2,conteo,columna1,columna2:integer;

    var salir:boolean;

begin

  writeln('Escribir el primer multiplicando');
  read(num1);

  writeln('Escribir el segundo multiplicador');
  read(num2);

  salir:=false;
   columna2:=0;
   conteo:=0;
  while salir=false do
begin

 if(num1 mod 2)=0 then // si num1 es par se tacha columna derecha
 begin
write('C Izq: ',num1);
columna1:=num1 div 2;
num1:=columna1;        // divido la columna izquierda entre dos y continuo

writeln('   C Der: ',num2,'(Eliminado)'); // eliminado y no sumamos pero si multiplicamos
columna2:=num2*2;
num2:=columna2;

 end
  else // si num1 es impar
  begin
  write('C Izq: ',num1);
  columna1:=num1 div 2;
  num1:=columna1;        // divido la columna izquierda entre dos y continuo

  conteo:=conteo+num2;

  writeln('   C Der: ',num2); // eliminado y no sumamos pero si multiplicamos
  columna2:=num2*2;
  num2:=columna2;       // guardo el ultimo valor

  end;

if(num1 div 2)=1 then // ya terminó de dividir columna1
  begin
  if(num1 mod 2)=0 then // si num1 es par se tacha columna derecha
 begin

 write('C Izq: ',num1);
 columna1:=num1 div 2;
 num1:=columna1;        // divido la columna izquierda entre dos y continuo

 writeln('   C Der: ',num2,'(Eliminado)'); // eliminado y no sumamos pero si multiplicamos
 columna2:=num2*2;
 num2:=columna2;

 end
  else  // si num1 es impar
  begin
  write('C Izq: ',num1);
  columna1:=num1 div 2;
  num1:=columna1;        // divido la columna izquierda entre dos y continuo

  conteo:=conteo+num2;

  writeln('   C Der: ',num2); // eliminado y no sumamos pero si multiplicamos
  columna2:=num2*2;
  num2:=columna2;       // guardo el ultimo valor

  end;

  salir:=true;


   write('C Izq: ',num1);
  columna1:=num1 div 2;
  num1:=columna1;        // divido la columna izquierda entre dos y continuo

  conteo:=conteo+num2;

  writeln('   C Der: ',num2); // eliminado y no sumamos pero si multiplicamos
  columna2:=num2*2;
  num2:=columna2;       // guardo el ultimo valor


  end
  else

  begin

  end;
end;

  writeln('el resultado es: ',conteo);
readkey;


end.

