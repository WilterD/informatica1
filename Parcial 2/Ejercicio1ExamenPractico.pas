{1.- Dada una   cadena  de caracteres formada por varias palabras y separadas por espacios en blanco.  Escribir un programa que:

a)Muestre, en una nueva cadena y separadas por un espacio en blanco, las palabras que tengan al menos una vocal, dada por teclado,  tres  o mas veces.
b)Muestre, separada por coma,  las  palabras que comiencen y terminen con una misma vocal, también  indique el total de palabras que cumplen con
esta condición.
c)Sustituya, con igual cantidad de asteriscos(*),  la  primera y última ocurrencia  donde  aparezca una subcadena también dada e
imprima la nueva cadena.  En caso de no encontrarse, enviar el mensaje “Subcadena no encontrada” y en caso de aparecer una sola vez enviar el
mensaje “Subcadena sustituida una sola vez”.
d)Borrar  todas las palabras que contengan una subcadena dada y mostrar la cadena resultante. Así como también mostrar el mensaje
“Fueron eliminadas las palabras” y seguidamente en líneas distintas mostrar las palabras borradas, seguida por su longitud separada por una coma.
(ver salida en el ejemplo)}
{Programa realizado por Emmanuel Salcedo}


program Ejercicio1ExamenPractico;
uses crt;
var
  texto:string;
procedure parteA(cadena:string);
var
  vocal:char;
  palabra:string;
  cadenasalida_A:string;
  i,j,cont:integer;
  longitud,longitud2:integer;
  arreglo:array[1..999] of string;
begin
   writeln('Palabras que contienen mas de 3 vocales     cadena: ',cadena);
  cont:=0;
  j:=1;
repeat
  writeln('Ingrese una vocal');
  readln(vocal);
  vocal:=lowercase(vocal);
until (vocal='a') or (vocal='e') or (vocal='i') or (vocal='o') or (vocal='u');

  longitud:=length(cadena);
   for i:=1 to longitud do
    begin
    cadena[i]:=lowercase(cadena[i]);
    end;

    for i:=1 to longitud do
     begin
       if (ord(cadena[i])=32) then
        begin
          j:=j+1;
        end;
        if (ord(cadena[i])<>32) then
         begin
           arreglo[j]:=arreglo[j]+cadena[i];
         end;
     end;

       for i:=1 to j do
        begin
          palabra:=arreglo[i];
          longitud2:=length(palabra);
             for j:=1 to longitud2 do
              begin
                 if palabra[j]=vocal then
                  cont:=cont+1;
              end;
                if cont>=3 then
                 begin
                  cadenasalida_A:=cadenasalida_A+palabra+' ';
                  cont:=0;
                 end;

        end;

  writeln ('Las palabras que contienen mas de 3 vocales ',vocal ,' son :',cadenasalida_A );
  readln;
end;
procedure Vocales(cadena:String);
var
  palabra,Verificador:string;
  longitud,cont,i,j:integer;
  arreglo:array[1..99999] of string;

Begin
   writeln('Palabras que terminan y empiezan con una vocal      cadena: ',cadena);
   j:=1;
   cont:=0;
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
  subcadena,palabra:string;
  salida:array[1..999] of string;
  i,aux,cont:integer;
begin
   palabra:='';
   cont:=1;
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
               salida[cont]:=salida[cont]+palabra;
               delete(cadena,pos(palabra,cadena),length(palabra));
               cont:=cont+1;
             end;
          palabra:='';
          end;
     end;

    writeln('Cadena resultante ',cadena);
    writeln('Fueron eliminada las palabras: ');
    for i:=1 to cont do
     begin
       if length(salida[i])<>0 then
       begin
      writeln(salida[i],' ',length(salida[i]));
       end;
     end;
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
