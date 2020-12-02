//El  juego  del  ahorcado  se  juega  con  dos  persona  (  o  una  persona  y  una
//computadora).  Un  jugador  escribe   una  palabra  y  el  otro  jugador  trata  de
//adivinar la palabra adivinando letras individuales, hasta que supere un número
//máximo  de  fallos,  dado  por  pantalla,  o  adivine  correctamente  la  palabra.
//Diseñar un programa para jugar al ahorcado, usando arreglos.
program Ejercicio2Ahorcado;
uses crt;
var
  palabra:array[1..9999] of char;
  adivinanza:char;
  vacio:array[1..9999] of char;
  i:integer;
  limite,fallos,cont:integer;
begin
  cont:=0;
  writeln('              BIENVENIDO AL JUEGO DEL AHORCADO');
  writeln('Ingrese la cantidad de letras que tendra la palabra');
  readln(limite);
  writeln;
  writeln('Ingrese el numero maximo de fallos');
  readln(fallos);
  writeln;
  writeln('                    PALABRA CON LA CUAL JUGARAS');
    for i:=1 to limite do
     begin
      write('Ingrese la ',i,' letra :');
      readln(palabra[i]);
      writeln;
   end;
      for i:=1 to limite do
       begin
        vacio[i]:=('_');
       end;

//**************************AHORCADO*****************************************//

    repeat
      writeln('Ingrese una letra         Tiene ',fallos,' intentos disponibles');
      readln(adivinanza);
      writeln;
        for i:=1 to limite do
         begin
              if adivinanza=vacio[i] then
               begin
                writeln('Usted ya ha ingresado esta letra');
               end
                 else
                  begin
                     if adivinanza=palabra[i] then
                       begin
                       vacio[i]:=palabra[i];
                       end
                        else
                         begin
                          cont:=cont+1;
                         end;
                  end;
       end;
                    if cont=limite then
                     begin
                     fallos:=fallos-1;
                     end;
                       for i:=1 to limite do
                        begin
                         write(vacio[i],' ');
                        end;
     writeln;
     writeln;
     cont:=0;
     until (vacio=palabra) or (fallos=0);

//*******************************SALIDA DE PANTALLA****************************

      if vacio=palabra then
       begin
        writeln('USTED HA GANADOOOOO :3');
       end;
           if fallos=0 then
            begin
             writeln('USTED HA PERDIDO :c');
             end;

   readkey;
end.

