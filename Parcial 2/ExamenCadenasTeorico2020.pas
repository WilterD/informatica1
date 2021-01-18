{1.- Dada una   cadena  de caracteres formada por varias palabras y separadas por espacios en blanco.  Escribir un programa que:

a)Muestre, en una nueva cadena y separadas por un espacio en blanco, las palabras que comiencen con una determinado carácter (letra), dado también por teclado.
b)Muestre, separada por coma,  las  palabras que comiencen y terminen con una misma vocal. Indique el total de palabras que cumplen con esta condición.
c)Sustituya, con igual cantidad de asteriscos(*),  la  primera y última ocurrencia  donde  aparezca una subcadena también dada e imprima la nueva cadena.
En caso de no encontrarse, enviar el mensaje “Subcadena no encontrada” y en caso de aparecer una sola vez enviar el mensaje “Subcadena sustituida una sola vez”.
d)Borrar  todas las palabras que contengan una subcadena dada, y  almacenarlas dentro de otra cadena ( se deben  mostrar las dos cadenas resultantes :
la que no contenga la subcadena dada y en otra la que contenga todas las palabras borradas)

Nota : Implementar la solución usando un menú y subprogramas (al menos uno de cada tipo). (valor 10  ptos)

Ejemplo dada la cadena :
 “en la ventana del apartamento  de mi  abuela Mariana está una iguana y un murciélago”
LAS SALIDAS SERÍAN :
  (a) si el carácter dado es “d” la salida sería : del, de.
  (b) abuela : 1 palabras
  (c ) Si la subcadena dada es “ana“,  la salida sería
“en la venta*** del apartamento  de mi  abuela Mariana está una igu*** y un murciélago”
  (d) Si la subcadena dada es “ana“,  la salida sería
“en la del apartamento  de mi  abuela está una y un murciélago”
 note que se han borrado de la cadena principal las palabras : ventana,Mariana,iguana
“ventana,Mariana,iguana”
Nota :
Implementar la solución usando un menú y subprogramas (valor 10  ptos)}

program ExamenCadenasTeorico2020;
uses crt;
var
  texto:String;
procedure parteA(cadena:string);
var
  letra:char;
  Seleccionar:string;
  palabra:string;
  cadenasalida_A:string;
  i:integer;
  longitud:integer;
begin
  writeln('Palabras que empiezan por un determinado caracter        cadena: ',cadena);
  writeln('Letra');
  readln(letra);
  Seleccionar:='No';
  longitud:=length(cadena);
  cadena:=cadena+' ';
    For  i:=1 to length(cadena) do
    begin
      if (ord(cadena[i])<>32) then
       begin
         palabra:=palabra+cadena[i];
          If (palabra[1]=letra) then
           Seleccionar:='Si';
           if (palabra[1]<>letra) then
            Seleccionar:='No';
       end
       else
        begin
              if Seleccionar='Si' then
               begin
               cadenaSalida_A:=cadenaSalida_A+palabra+' ';
               Palabra:='';
               Seleccionar:='No';
              end
              else
                begin
                Palabra:='';
                Seleccionar:='No';
                end;
        end;
    end;
          writeln ('Las palabras que contienen el caracter ',letra ,' son :',cadenasalida_A );
          readln;
end;
procedure Vocales(cadena:String);
var
  palabra,Verificador:string;
  longitud,cont,i,j:integer;
  arreglo:array[1..99999] of string;

Begin
   j:=1;
   cont:=0;
   writeln('Palabras que terminan y empiezan por una vocal       cadena: ',cadena);
    for i:=1 to length(cadena) do
     begin
       if (ord(cadena[i])=32) then
        begin
          j:=j+1;
        end;
        if (cadena[i]<>' ') then
         begin
           arreglo[j]:=arreglo[j]+cadena[i];
         end;
     end;


     for i:=1 to j do
      begin
        palabra:=arreglo[i];
        longitud:=length(palabra);
        if (palabra[1]='a') or (palabra[1]='A')  then
         begin
         if (palabra[longitud]='a') then
          begin
          Verificador:=Verificador+palabra+',';
          cont:=cont+1;
          end;
         end;
            if (palabra[1]='e') or (palabra[1]='E')  then
             begin
             if (palabra[longitud]='e') then
              begin
                Verificador:=Verificador+palabra+',';
                cont:=cont+1;
              end;
             end;
               if (palabra[1]='i') or (palabra[1]='I') then
                begin
                 if (palabra[longitud]='i') then
                  begin
                  Verificador:=Verificador+palabra+',';
                  cont:=cont+1;
                  end;
                end;
                  if (palabra[1]='o') or (palabra[1]='O') then
                   begin
                    if (palabra[longitud]='o') then
                     begin
                     Verificador:=Verificador+palabra+',';
                     cont:=cont+1;
                     end;
                   end;
                       if (palabra[1]='u') or (palabra[1]='U') then
                        begin
                        if (palabra[longitud]='u') then
                         begin
                         Verificador:=Verificador+palabra+',';
                         cont:=cont+1;
                         end;
                        end;
      end;
     writeln('Cantidad de palabras que empiezan y terminan con una vocal es de ',cont,' y son ',verificador);
     readln;
end;
procedure parteC(cadena:String);
 var
   posi,posiAx,ax,i:integer;
   aux,subcadena,aste:string;

begin
     aste:='';
     writeln('Ingrese la subcadena a remplazar               cadena: ',cadena);
     readln(subcadena);
     aux:=cadena;
      for i:=1 to length(subcadena) do
       begin
         aste:=aste+'*';
       end;

     ax:=pos(subcadena,aux);
     posi:=ax;
       while ax<>0 do
        begin
            posiAx:=ax;
            delete(aux,ax,length(subcadena));
            insert(aste,aux,ax);
            ax:=pos(subcadena,aux);
        end;

       if posi=0 then
        begin
        writeln('Subcadena no encontrada');
        end
        else
         begin
            If posi=posiAx then
             begin
              delete(cadena,posi,length(subcadena));
              insert(aste,cadena,posi);
              writeln('La subcadena fue sustituida una sola vez');
              writeln(cadena);
             end
              else
               begin
                  delete(cadena,posi,length(subcadena));
                  insert(aste,cadena,posi);
                  delete(cadena,posiAx,length(subcadena));
                  insert(aste,cadena,posiAx);
                  writeln('La nueva cadena es ',cadena);
               end;
          end;
readln;
end;
procedure parteD(cadena:string);
var
  subcadena,palabra,salida:string;
  i,aux:integer;
begin
   palabra:='';
   salida:='';
   writeln('Ingrese la subcadena a borrar                cadena: ',cadena);
   readln(subcadena);
    for i:=1 to length(cadena) do
     begin
        if ord(texto[i])<>32 then
         begin
           palabra:=palabra+cadena[i];
         end
         else
          begin
          aux:=pos(subcadena,palabra);
            if aux<>0 then
             begin
               salida:=salida+palabra+' ';
               delete(cadena,pos(palabra,cadena),length(palabra));
             end;
          palabra:='';
          end;
     end;
    writeln('El nuevo texto es ',cadena);
    writeln('El texto con las palabras que se borraron es ',salida);
    readln;
end;
 procedure menu(cadena:string);
  var
    tec : char;
  begin
  repeat
      clrscr;
      writeln('**** Menu Principal ****   Cadena: ',cadena);
      writeln;
      writeln('  1 : PARTE A');
      writeln('  2 : PARTE B ');
      writeln('  3 : PARTE C ');
      writeln('  4 : PARTE D ');
      writeln('  5 : Salir ');
      writeln;
      writeln('<<<< Elija Opcion >>>>');
      repeat
         tec := readkey;
      until tec in['1','2','3','4','5'];
      clrscr;
   case tec of
 '1' : parteA(texto);
 '2' : Vocales(texto);
 '3' : parteC(texto);
 '4' : parteD(texto);
   end;
   until tec = '5';
  end;
 begin
      writeln('Ingrese una cadena de texto');
      readln(texto);
      writeln;
      menu(Texto);
      readkey;

 end.
