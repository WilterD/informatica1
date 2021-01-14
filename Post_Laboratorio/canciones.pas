program canciones;
uses crt;

(*Una compañía disquera organiza una encuesta para determinar el éxito de sus
canciones. A cada persona se le piden sus cinco canciones favoritas, las canciones
son identificadas por números del 1 al N (el N lo determina usted). Los resultados
de la encuesta son tomados por el teclado. Cada elemento leído representa un
encuestado y contiene su cédula, nombre, apellido, sexo, edad y sus cinco canciones
favoritas en orden de preferencia. Se desea que Ud. diseñe una estructura de
datos a través de la sentencia RECORD en el lenguaje de programación Pascal para
almacenar dicha información., para una cantidad M de encuestados., seguidamente
listar:
 Las 5 canciones más preferidas por las mujeres
 Promedio de la edad de las personas que prefieren SOLO las canciones
identificadas con números impares.*)
type

  Regcanciones = record
     musica:integer;
  end;


  RegEncuesta = record
     nombre,apellido:string;
     edad,cedula:integer;
     sexo:char;
     misCanciones:Regcanciones;

   end;

  personas = record
     hombres:RegEncuesta;
     mujeres:RegEncuesta;
  end;


  Regpersonas = array[1..10] of personas;

  var

    genero:char;
    nro_p,impar,i,j,gustoimpar,eleccion,mayor,anterior:integer;
    promedioEdad,sumaEdad:real;
    encuestados:Regpersonas;

    nombresC: array [1..10] of string; // nombres de las canciones
    votos: array [1..10, 1..1] of integer; // votos de las encuestas


begin
  nro_p:=0;
  sumaEdad:=0;
  impar:=0;
  gustoimpar:=0;
  promedioEdad:=0;
    // Asignar nombres de canciones
    NombresC[1]:='Cada dia te canto';
    NombresC[2]:='Confesiones de vida';
    NombresC[3]:='Tu eres perfecta';
    NombresC[4]:='Eres Solo Mia';
    NombresC[5]:='Necesito Mas de ti';
    NombresC[6]:='Soy tu caballero';
    NombresC[7]:='Rosas y perfumes';
    NombresC[8]:='Tu mirada es bella';
    NombresC[9]:='Noche de pasion ';
    NombresC[10]:='Llevame en tu bicicleta';

 repeat
    writeln('Menu Principal: ');
    writeln('Realizar Encuesta a una persona sobre sus 5 canciones favoritas     [1]');
    writeln('Las 5 canciones mas preferidas por las mujeres                      [2]');
    writeln('Promedio de la edad de las personas que prefieren canciones impares [3]');

    readln(eleccion);

    case eleccion of
      1:
      begin
          nro_p:=nro_p+1;
          writeln('Escriba su genero Masculino[M] Femenino[F]');
          readln(genero);

        case genero of
          'M':Begin
           writeln('Escriba su nombre');
           readln(encuestados[nro_p].hombres.nombre);

           writeln('Escriba su apellido');
           readln(encuestados[nro_p].hombres.apellido);

           writeln('Escriba su edad');
           readln(encuestados[nro_p].hombres.edad);

           encuestados[nro_p].hombres.sexo:='M';

             writeln('Cada dia te canto       [1]');
             writeln('Confesiones de vida     [2]');
             writeln('Tu eres perfecta        [3]');
             writeln('Eres Solo Mia           [4]');
             writeln('Necesito Mas de ti      [5]');
             writeln('Soy tu caballero        [6]');
             writeln('Rosas y perfumes        [7]');
             writeln('Tu mirada es bella      [8]');
             writeln('Noche de pasion         [9]');
             writeln('Llevame en tu bicicleta [10]');

             writeln('Cuales son sus 5 canciones favoritas del album " El Ultimo Tour " ');

           for i:=1 to 5 do
           begin
             writeln('Escriba la cancion nro: ',i,' que sea su favorita');
             readln(encuestados[i].hombres.misCanciones.musica);


             if (encuestados[i].hombres.misCanciones.musica) mod 2 <> 0 then // si es impar
             begin
              impar:=impar+1;
              writeln('impar ',impar);
             end;


           end;

           if impar=5 then  // si escogio numeros impares en canciones
           begin
             sumaEdad:=sumaEdad+encuestados[nro_p].hombres.edad; // sumar edades
             gustoimpar:=gustoimpar+1;  // personas que tuvieron gustos impares en las canciones
           end;


          end;
          'F':
          Begin
            writeln('Escriba su nombre');
           readln(encuestados[nro_p].mujeres.nombre);

           writeln('Escriba su apellido');
           readln(encuestados[nro_p].mujeres.apellido);

           writeln('Escriba su edad');
           readln(encuestados[nro_p].mujeres.edad);

           encuestados[nro_p].mujeres.sexo:='F';

             writeln('Cada dia te canto       [1]');
             writeln('Confesiones de vida     [2]');
             writeln('Tu eres perfecta        [3]');
             writeln('Eres Solo Mia           [4]');
             writeln('Necesito Mas de ti      [5]');
             writeln('Soy tu caballero        [6]');
             writeln('Rosas y perfumes        [7]');
             writeln('Tu mirada es bella      [8]');
             writeln('Noche de pasion         [9]');
             writeln('Llevame en tu bicicleta [10]');

             writeln('Cuales son sus 5 canciones favoritas del album " El Ultimo Tour " ');

           for i:=1 to 5 do
           begin
             writeln('Escriba la cancion nro: ',i,' que sea su favorita');
             readln(encuestados[i].mujeres.misCanciones.musica);

             if (encuestados[i].mujeres.misCanciones.musica) mod 2 <> 0 then // si es impar
             impar:=impar+1;

             votos[encuestados[i].mujeres.misCanciones.musica,1]:=votos[encuestados[i].mujeres.misCanciones.musica,1]+1;
             writeln('llevar suma: ',votos[encuestados[i].mujeres.misCanciones.musica,1]);
           end;





           if impar=5 then  // si escogio numeros impares en canciones
           begin
             sumaEdad:=sumaEdad+encuestados[nro_p].mujeres.edad; // sumar edades
             gustoimpar:=gustoimpar+1;  // personas que tuvieron gustos impares en las canciones
           end;
          end;
        end;
      end;
      2:begin

       clrscr; // limpiar pantalla
       writeln('Las 5 canciones mas preferidas por mujeres son: ');
            anterior:=100;         // inicializo la variable en un numero grande
            mayor:=0;             // la inicializo en un numero pequeño

          for i:=1 to 5 do // ir mostrando nombre de cancion y ordenando
          begin
              for j:=1 to 10 do        // busco la mayor nota que sea menor al numero anterior
                if (votos[j,1] > mayor) and (votos[j,1] < anterior) then
                  mayor:=votos[j,1];


              for j:=1 to 5 do        // escribire el nombre de la cancion que tenga mas votos
              begin
                if votos[j,1] = mayor then
                  begin
                    if votos[j,1]>0 then  // si tiene mas de 0 votos escribir
                      begin
                        write(nombresC[j]);
                        writeln;
                      end;
                  end;
              end;


              anterior:=mayor;         // actualizo la variable
              mayor:=0;                // inicializo en 0
          end;
      end;


      3:begin
        clrscr; // limpiar pantalla
          if gustoimpar>=1 then // si existe una persona con gustos impares en las canciones
          begin
            promedioEdad:=sumaEdad/gustoimpar;
            writeln('El Promedio de las edades de las personas que prefieren solo las canciones impares   es: ',promedioEdad:2:2);
          end
          else  // de lo contrario
          writeln('No hay personas que prefieren canciones identificadas impares.');
      end;
     end;
    writeln('Desea terminar la encuesta? NO[1] SI[2]');
    readln(eleccion);


  until eleccion=2;


  end.
