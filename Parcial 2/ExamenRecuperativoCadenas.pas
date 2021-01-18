{1.- Dada una   cadena  de caracteres formada por varias palabras y separadas por espacios en blanco.  Escribir un programa que:
a)	Muestre en una nueva cadena y separadas por una coma, las palabras que terminen con una determinada vocal y seguidamente comienza
otra con la misma vocal (deben mostrarse ambas palabras).
b)	Muestre las palabras que comienzan con una vocal y terminan con una consonante . Dar la cantidad de estas palabras.
c)	Reemplace con igual cantidad de asteriscos  la penúltima ocurrencia
que aparezca en la cadena una palabra dada e imprima la nueva cadena. En caso de existir solo una vez o no existir enviar un mensaje de error.
d)	Muestre la(s)  palabra(s) de  menor y mayor longitud en la cadena dada

 EJEMPLO. Dada la cadena  :
                             “en la casa de la abuela hay algunas lagartijas amarillas”
  (a)  la, abuela
  (b)  en, algunas, amarillas   Total de palabras : 3
  (c ) Si la subcadena es “as”
         La salida sería  “en la casa de la abuela hay algunas lagartij** amarillas”
 (d) Palabras de menor longitud son : en, la, de, la
       Palabras de mayor longitud son : lagartijas

Nota : Implementar la solución usando un menú y subprogramas (al menos uno de cada tipo).}

program ExamenRecuperativoCadenas;
uses crt;
var
  texto:String;
procedure ParteA(cadena:String);{Muestre en una nueva cadena y separadas por una coma, las palabras que terminen con una determinada vocal y seguidamente comienza
otra con la misma vocal (deben mostrarse ambas palabras).}
var
  guardado,aux,salida:string;
  palabra:array[1..100] of string;
  i,j,k,longitud,cont:integer;
  verificador,Confirmador:boolean;
begin
   guardado:='';
   cont:=0;
   k:=1;
   salida:='';
   aux:='';
   cadena:=cadena+' ';
   confirmador:=false;
   verificador:=false;
   writeln('Palabras que terminen con una determinada vocal y seguidamente comienze con la misma vocal');
    for i:=1 to length(cadena) do
     begin
       if cadena[i]<>' ' then
        begin
          guardado:=guardado+cadena[i];
            if verificador=true then
             begin
                 if guardado[1]=aux then
                  begin
                    salida:=salida+palabra[k-1]+',';
                    verificador:=false;
                    confirmador:=True;
                  end;
             end;
        end
          else
            begin
              longitud:=length(guardado);
                  for j:=1 to longitud do
                    begin
                      guardado[i]:=lowercase(guardado[i]);
                    end;
                             if confirmador=true then
                               begin
                                 salida:=salida+guardado+',';
                                 confirmador:=False;
                               end;

                                   if (guardado[longitud]='a') or (guardado[longitud]='e') or (guardado[longitud]='i') or (guardado[longitud]='o') or (guardado[longitud]='u') then
                                    begin
                                     verificador:=True;
                                     aux:=guardado[longitud];
                                     palabra[k]:=guardado;
                                     k:=k+1;
                                     guardado:='';
                                 end
                                  else
                                   begin
                                     palabra[k]:=guardado;
                                     k:=k+1;
                                     guardado:='';
                                   end;
             end;
     end;
     writeln(salida);
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

  end;
  until tec = '5';
 end;
begin
  writeln('Ingrese una cadena de texto');
  readln(texto);
  menu(texto);
end.

