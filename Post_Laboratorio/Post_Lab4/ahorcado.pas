program ahorcado;

uses crt;
type
  vector = array[1..9] of string;

var Vs:char;
  palabras,mostrar,facil,inter,dificil:vector;
  adivinar:string;
  letra,dificultad,continuar:char;
  vida,i,puntos,j,espacio,azar,c_letras:integer;
  salir:boolean;

begin

  // Inicilizar
  for i:=1 to 9 do
  begin
      facil[i]:=' ';
      inter[i]:=' ';
      dificil[i]:=' ';
      palabras[i]:=' ';
      mostrar[i]:=' ';
  end;

  adivinar:=' ';
  letra:=' ';
  dificultad:=' ';
  continuar:=' ';

  vida:=0;
  azar:=0;
  c_letras:=0;

  salir:=false; // inicializar
  while salir=false do
  begin

    writeln('Bienvenido al juego del ahorcado!! Version Animales');
    writeln('Cuanto conoces de animales? :D');

    writeln('>> Jugar con computadora Escribir (C)');
    writeln('>> Jugar con amigo Escribir (A)');
    readln(Vs);


    repeat
      if (Vs='C') or (Vs='c')  then  // Jugar computadora VERSUS
      begin

        writeln('Seleccione la dificultad');  // dificultad
        writeln('Facil (F)');
        writeln('Intermedio (M)');
        writeln('Dificil (D)');
        readln(dificultad);
        randomize;
        azar:=random(10);  // escoger un numero al azar
        // tambien le puedes decir al usuario que escriba un numoer del 1 al 9

        case dificultad of
          'F':
          begin
           facil[1]:='cucaracha';
           facil[2]:='armadillo';
           facil[3]:='caracoles';
           facil[4]:='cocodrilo';
           facil[5]:='serpiente';
           facil[6]:='carpincho';
           facil[7]:='lagartija';
           facil[8]:='guacamayo';
           facil[9]:='langostas';
           facil[10]:='leopardos';

           adivinar:=facil[azar]; // asignar una palabra al azar

           c_letras:=9;  // cantidad de letras
          end;
          'M':
          begin
           inter[1]:='conejo';
           inter[2]:='delfin';
           inter[3]:='dragon';
           inter[4]:='coyote';
           inter[5]:='jaguar';
           inter[6]:='paloma';
           inter[7]:='zamuro';
           inter[8]:='buitre';
           inter[9]:='canario';
           inter[10]:='nutria';

           adivinar:=inter[azar]; // asignar una palabra al azar

           c_letras:=6;  // cantidad de letras
          end;

          'D':
          begin
           dificil[1]:='mono';
           dificil[2]:='loro';
           dificil[3]:='pato';
           dificil[4]:='vaca';
           dificil[5]:='foca';
           dificil[6]:='gato';
           dificil[7]:='sapo';
           dificil[8]:='topo';
           dificil[9]:='rana';
           dificil[10]:='lobo';

           adivinar:=dificil[azar]; // asignar una palabra al azar

           c_letras:=4;  // cantidad de letras
          end;

        end;

        vida:=c_letras+1; // vidas

        for i:=1 to c_letras do
        begin
            palabras[i]:=adivinar[i];  // asignar letra por letra a vector
            mostrar[i]:=' __ '; // inicializar el mostrar letras
         end;

         espacio:=0;
         puntos:=0;

        repeat
          writeln;
          writeln('>> Tienes ',vida,' vidas');
          writeln('>> Tienes ',puntos,' puntos');
          writeln('>> Te faltan ',c_letras-puntos,' puntos para ganar!');
          writeln('>> Adivine la palabra, escriba una letra');
          readln(letra);

          espacio:=0; // reiniciar casillas

          for i:=1 to c_letras do
          begin
            if mostrar[i]=letra then // si ya esta la letra
            writeln('Ya colocaste esta letra, intenta denuevo!')
            else if palabras[i]=letra then   // Si letra coincide
            begin
                 mostrar[i]:=letra;
                 writeln;
                 writeln('>> Ganaste +1 punto :)');
                 writeln;
                 puntos:=puntos+1;   // sumar puntos
               end
               else
               begin
                   espacio:=espacio+1; // no hay letra
                   if espacio=c_letras then
                     begin
                        writeln;
                        writeln('>> Perdiste una vida :(');
                        writeln;
                        vida:=vida-1; // restar vida
                     end;
               end;
          end;

          for j:=1 to c_letras do // mostrar al usuario por pantalla completacion de palabras
               write(' ',mostrar[j],' ');

        until (vida=0) or (puntos>c_letras-1);

        if vida=0 then
        begin
             writeln;
             writeln('>> Lo siento Has Perdido..');
             writeln('La palabra era: ',adivinar);
        end
        else if puntos>c_letras-1 then
        begin
          writeln;
          writeln('>> Felicitaciones Has Ganado!!');
        end;

          writeln('Deseas Jugar Nuevamente? SI(Y) / NO(N)');
          readln(continuar);

          if (continuar='N') or (continuar='n') then
          salir:=true;

      end
      else if (VS='A') or (VS='a') then    // Jugar Amigo
      begin
        writeln('Cuantas letras tiene su palabra?');
        readln(c_letras);

            writeln('Escriba su palabra');
            readln(adivinar);

            clrscr; // borrar palabra escrita (amigo)

            for i:=1 to c_letras do
            begin
              palabras[i]:=adivinar[i];
              mostrar[i]:=' __ '; // inicializar el mostrar letras
            end;


         vida:=c_letras+1; // vidas
         puntos:=0;

        repeat
          writeln;
          writeln('>> Tienes ',vida,' vidas');
          writeln('>> Tienes ',puntos,' puntos');
          writeln('>> Te faltan ',c_letras-puntos,' puntos para ganar!');
          writeln('>>>> Adivine la palabra, escriba una letra');
          readln(letra);

          espacio:=0; // reiniciar casillas

          for i:=1 to c_letras do
          begin
            if mostrar[i]=letra then // si ya esta la letra
            writeln('Ya colocaste esta letra, intenta denuevo!')
            else if palabras[i]=letra then
            begin
                 mostrar[i]:=letra;
                 writeln;
                 writeln('>> Ganaste +1 punto :)');
                 writeln;
                 puntos:=puntos+1;      // sumar puntos
               end
               else
               begin
                   espacio:=espacio+1; // no hay letra
                   if espacio=c_letras then
                     begin
                        writeln;
                        writeln('>> Perdiste una vida :(');
                        writeln;
                        vida:=vida-1;    // restar vida
                     end;
               end;
          end;

          for j:=1 to c_letras do // mostrar al usuario por pantalla completacion de palabras
               write(' ',mostrar[j],' ');

        until (vida=0) or (puntos>c_letras-1);

        if vida=0 then
        begin
             writeln;
             writeln('>> Lo siento Has Perdido..');
              writeln('La palabra era: ',adivinar);
        end
        else if puntos>c_letras-1 then
        begin
          writeln;
          writeln('>> Felicitaciones Has Ganado!!');
        end;

          writeln('Deseas Jugar Nuevamente? SI(Y) / NO(N)');
          readln(continuar);

          if (continuar='N') or (continuar='n') then
          salir:=true;

      end
      else
      writeln('Escriba un comando valido, C (Jugar Computadora) A(Jugar Amigo)');
     until (Vs='C') or  (Vs='c') or (Vs='A') or (Vs='a');
    end;

end.

