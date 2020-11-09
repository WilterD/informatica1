program Calculadora;
uses crt;
var
  numero1,numero2,resultado:real;
  opc:string[1];

begin
  resultado:=0;
  writeln('Ingrese un numero');
  readln(numero1);
  writeln('Ingrese otro numero');
  readln(numero2);
  writeln('Ingrese el operador');
  readln(opc);
  case opc of
  '+':
    resultado:=numero1+numero2;
  '-':
    resultado:=numero1-numero2;
  '*':
    resultado:=numero1*numero2;
  '/':
    resultado:=numero1/numero2;
  else
    writeln('Operador incorrecto');
  end;
  writeln('El resultado es ',resultado:0:2);
  readkey;
end.

