// Se  introduce  por  teclado  una  hora  determinada  con  el  formato  H,  M,  S.  Se  pide
//calcular la hora que será dentro de un segundo. Emmanuel Salcedo
program Conversion;
uses crt;
var
  h,m,s,convertidorH,ConvertidorM,aux,aux2:integer;


begin
  writeln('Ingrese la hora');
  readln(h);
  writeln('Ingrese los minutos');
  readln(m);
  writeln('Ingrese los segundos');
  readln(s);
  if s>=60 then    // condicion que me evalua si el usuario ha ingresado mas de 60 segundos me lo convierta a 1 minuto
  begin
  aux:= s div 60; // auxiliar donde guardaremos el valor entero del cociente ya que ese sera la cantidad que pasara a los minutos
  s:= s mod 60;   // El resto de la division ya que en caso de que ingresemos 80 segundos quedarian 20 segundos a la hora ingresada
  m:= m+aux;
  end;
    if m>=60 then
    begin
    aux2:= m div 60;// mismo procedimiento que en los segundos pero ahora aplicado a los minutos
    m:= m mod 60;
    h:= h+aux2;
    end;

//**************Conversion de las horas a segundos y minutos a segundos*********

  ConvertidorH:= h*3600;
  ConvertidorM:= m*60;
  s:= s+ ConvertidorH+ConvertidorM;

//**************************Salida**********************************************

  writeln;
  writeln('La hora ingresada expresada en segundo es ',s);
  readkey;

end.

