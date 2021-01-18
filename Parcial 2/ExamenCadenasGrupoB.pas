{1.- Dada una   cadena  de caracteres formada por varias palabras y separadas por espacios en blanco. Escribir un programa que:

a)	Muestre, en una nueva cadena y separadas por una coma(,) las palabras que comiencen y terminen con una vocal.
b)	Muestre separadas por una coma, las palabras  que contengan tres o mas vocales distintas.
c)	Sustituya, con igual cantidad de asteriscos(*),   la  tercera ocurrencia  donde  aparezca una subcadena dada
e imprima la nueva cadena.  En caso de no encontrarse, reemplazar la última vez que aparezca.
d)	Muestre, separadas por una coma y un espacio,  todas las palabras, que contengan una subcadena dada.

Ejemplo dada la cadena :
 “en la ventana del apartamento  de mi  abuela Mariana está una iguana y un murciélago”
LAS SALIDAS SERÍAN :
  (a) apartamento, abuela, una,iguana
  (b) apartamento,abuela, iguana, murcielago
  (c ) Si la subcadena dada es “ana“,  la salida sería
“en la ventana del apartamento  de mi  abuela Mariana está una igu*** y un murciélago”
  (d) Si la subcadena dada es “ana“,  la salida sería
       “ventana,Mariana,iguana”

Nota :
Implementar la solución usando un menú y subprogramas (valor 10  ptos)}

program ExamenCadenasGrupoB;
uses crt;
var
  texto:String;

procedure ParteA(cadena:String); {Muestre, en una nueva cadena y separadas por una coma(,) las palabras que comiencen y terminen con una vocal.}
  var
    palabra,Verificador:string;
    longitud,cont,i,j:integer;
    arreglo:array[1..99999] of string;

  Begin
     writeln('Palabras que terminan y empiezan con una vocal      cadena: ',cadena);
     j:=1;
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
          if (palabra[1]='a') or (palabra[1]='A') or (palabra[1]='e') or (palabra[1]='E') or (palabra[1]='i') or (palabra[1]='I') or (palabra[1]='o') or (palabra[1]='O') or (palabra[1]='u') or (palabra[1]='U')then
           begin
           if (palabra[longitud]='a') or (palabra[longitud]='A') or (palabra[longitud]='e') or (palabra[longitud]='E') or (palabra[longitud]='i') or (palabra[longitud]='I') or (palabra[longitud]='o') or (palabra[longitud]='O') or (palabra[longitud]='u') or (palabra[longitud]='U') then
            begin
            Verificador:=Verificador+palabra+',';
            end;
           end;

        end;
       writeln('Las palabras que empiezan y terminan con una vocal son ',verificador);
       readln;


end;
procedure ParteB(cadena:string); {	Muestre separadas por una coma, las palabras  que contengan tres o mas vocales distintas.}
var
  vocal:array[1..5] of char;
  palabra:string;
  cadenasalida_A:string;
  i,j,k,cont:integer;
  longitud,longitud2:integer;
  arreglo:array[1..999] of string;
  identificador:array[1..5] of boolean;
begin
  writeln('Palabras que contienen mas de 3 vocales distintas    cadena: ',cadena);
  cont:=0;
  j:=1;
  vocal[1]:='a';
  vocal[2]:='e';
  vocal[3]:='i';
  vocal[4]:='o';
  vocal[5]:='u';

  for i:=1 to 5 do
   begin
     identificador[i]:=false;
   end;

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
                  for k:=1 to 5 do
                   begin
                    identificador[k]:=false;
                   end;
          palabra:=arreglo[i];
          longitud2:=length(palabra);
             for j:=1 to longitud2 do
              begin
                 if (palabra[j]=vocal[1]) and (identificador[1]=false) then
                  begin
                  cont:=cont+1;
                  identificador[1]:=true;
                  end
                   else
                    begin
                       if (palabra[j]=vocal[2]) and (identificador[2]=false) then
                         begin
                          cont:=cont+1;
                          identificador[2]:=true;
                         end
                          else
                           begin
                             if (palabra[j]=vocal[3]) and (identificador[3]=false) then
                              begin
                              cont:=cont+1;
                              identificador[3]:=true;
                              end
                               else
                                begin
                                    if (palabra[j]=vocal[4]) and (identificador[4]=false) then
                                     begin
                                     cont:=cont+1;
                                     identificador[4]:=true;
                                     end
                                      else
                                       begin
                                           if (palabra[j]=vocal[5]) and (identificador[5]=false) then
                                            begin
                                            cont:=cont+1;
                                            identificador[5]:=true;
                                            end;
                                       end;
                                end;
                         end;


                end;
             end;
             if cont>=3 then
                 begin
                  cadenasalida_A:=cadenasalida_A+palabra+',';
                  cont:=0;
                 end;
        cont:=0;

        end;
  writeln ('Las palabras que contienen mas de 3 vocales distintas  son :',cadenasalida_A );
  readln;
end;
procedure parteC(cadena:String);{Sustituya, con igual cantidad de asteriscos(*),   la  tercera ocurrencia  donde  aparezca una subcadena dada
e imprima la nueva cadena.  En caso de no encontrarse, reemplazar la última vez que aparezca.}
 var
   posi,ax,i,j:integer;
   posiAx:array[1..999] of integer;
   aux,subcadena,aste:string;

begin
     aste:='';
     j:=0;
     for i:=1 to length(cadena) do
      begin
        posiAx[i]:=0;
      end;

     writeln('Ingrese la subcadena a remplazar               cadena: ',cadena);
     readln(subcadena);
     writeln;
     aux:=cadena;
      for i:=1 to length(subcadena) do
       begin
         aste:=aste+'*';
       end;

     ax:=pos(subcadena,aux);
     posi:=ax;

       while ax<>0 do
        begin
            j:=j+1;
            posiAx[j]:=ax;
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
                 if posiAx[3]<>0 then
                   begin
                     delete(cadena,posiAx[3],length(subcadena));
                     insert(aste,cadena,posiAx[3]);
                     writeln('Sustituyendo por asteriscos la tercera ocurrencia la nueva cadena queda asi ');
                     writeln(cadena);
                   end
                    else
                     begin
                       delete(cadena,posiAx[j],length(subcadena));
                       insert(aste,cadena,posiAx[j]);
                       writeln('Debido a que no se encontro la 3era ocurrencia se reemplazara la ultima que aparecio');
                       writeln(cadena);
                     end;
               end;
       readln;
end;
procedure parteD (cadena:string); {Muestre, separadas por una coma y un espacio,  todas las palabras, que contengan una subcadena dada.}
var
  i:integer;
  palabra:string;
  salida:string;
  subcadena:String;
begin
   palabra:='';
   salida:='';
   writeln('Ingrese la subcadena a hallar          cadena: ',cadena);
   readln(subcadena);
   for i:=1 to length(cadena) do
    begin
      if ord(cadena[i])<>32 then
        begin
          palabra:=palabra+cadena[i];
        end
         else
          begin
              if pos(subcadena,palabra)<>0 then
                begin
                 salida:=salida+palabra+',';
                 palabra:='';
                end
                 else
                  begin
                     palabra:='';
                  end;
          end;
    end;
        if pos(subcadena,palabra)<>0 then
         begin
          salida:=salida+palabra+',';
         end;
   writeln;
   writeln('Las palabras que contienen la subcadena dada son ',salida);
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
'1' : ParteA(texto);
'2' : ParteB(texto);
'3' : ParteC(texto);
'4' : ParteD(texto);
  end;
  until tec = '5';
 end;
begin
  writeln('Ingrese una cadena de texto');
  readln(texto);
  menu(texto);

end.


