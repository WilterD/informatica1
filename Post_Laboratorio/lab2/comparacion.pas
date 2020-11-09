program comparacion;
uses crt;

var a,b,c,menor,inter,mayor:integer;

begin

 //INICIALIZAR:
 a:=0;
 b:=0;
 c:=0;
 menor:=0;
 inter:=0;
 mayor:=0;

  writeln('Ingrese tres numeros enteros');
  readln(a,b,c);

  //primer numero ingresado
  if (a<b) and (a<c)then
      menor:=a
  else if(a>b) and (a<c) or (a<b)and(a>c)then
      inter:=a
  else if(a>b)and(a>c) then
     mayor:=a;

 //segundo numero ingresado
   if (b<a) and (b<c)then
      menor:=b
  else if (b>a) and (b<c) or (b<a)and(b>c)then
      inter:=b
  else if(b>a)and(b>c) then
     mayor:=b;

// tercer numero ingresado
  if(c<b) and (c<a)then
      menor:=c
  else if (c>b) and (c<a) or (c<b)and(c>a)then
      inter:=c
  else if (c>a)and(c>a) then
     mayor:=c;

 writeln('Menor es: ',menor,' Intermedio es: ',inter,' y Mayor es: ',mayor);

 readkey;
end.

