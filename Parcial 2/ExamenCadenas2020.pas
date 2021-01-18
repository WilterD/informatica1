{1.- Dada una   cadena  de caracteres formada por varias palabras y separadas por espacios en blanco.  Escribir un programa que:

a)	Muestre, en una nueva cadena y separadas por un espacio en blanco, las palabras que comiencen con una determinado carácter (letra),
dado también por teclado.
b)	Muestre, separada por coma,  las  palabras que comiencen y terminen con una misma vocal.
Indique el total de palabras que cumplen con esta condición.
c)	Sustituya, con igual cantidad de asteriscos(*),  la  primera y última ocurrencia  donde  aparezca una subcadena
también dada e imprima la nueva cadena.  En caso de no encontrarse, enviar el mensaje “Subcadena no encontrada” y en caso de aparecer
una sola vez enviar el mensaje “Subcadena sustituida una sola vez”.
d)	Borrar  todas las palabras que contengan una subcadena dada, y  almacenarlas dentro de otra cadena ( se deben  mostrar las dos cadenas resultantes :  la que no contenga la subcadena dada y en otra la que contenga todas las palabras borradas)

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
{ note que se han borrado de la cadena principal las palabras : ventana,Mariana,iguana}
“ventana,Mariana,iguana”}


program ExamenCadenas2020;
uses crt;
var
  texto:string;
procedure parteA(cadena:string);
var
  letra:char;
  Seleccionar:string;
  palabra:string;
  cadenasalida_A:string;
  i:integer;
  longitud:integer;
begin

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

end;
procedure Vocales(cadena:String);
var
  palabra,Verificador:string;
  longitud,cont,i,j:integer;
  arreglo:array[1..99999] of string;

Begin
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


end;
procedure cadenaU(palabra:string);
var
  longitud,longitud2,longitud3,lugar,contadorSC,i:integer;
  subcadena,subcadenaI,palabraI,asterisco:string;
  begin
    palabraI:='';
    subcadena:='';
    subcadenaI:='';
    asterisco:='';
    contadorSc:=0;
    writeln('que subcadena quiere sustituir por asterisco?');
    readln(subcadena);
    lugar:=pos(subcadena,palabra);
   if pos(subcadena,palabra)<>0 then
    begin
     contadorSC:=contadorSC+1;                    // contador de si se encuentra la subcadena //

     for i:=1 to length(subcadena) do           //guardo la cantidad de asteriscos//
        asterisco:=asterisco+'*';
     longitud3:=length(asterisco);
     delete(palabra,lugar,longitud3);
     insert(''+asterisco,palabra,lugar);

      for longitud:=length(palabra) downto 0 do    // invierto la cadena//
       palabraI:=palabraI+palabra[longitud];


     for longitud:=length(subcadena) downto 1 do  //invierto la subcadena//
      subcadenaI:=subcadenaI+subcadena[longitud];


    longitud2:=pos(subcadenaI,palabraI);          //guardo la posicion de la subcadena invertida//
    if longitud2<> 0 then
      contadorSC:=contadorSC                      +1;
    delete(palabraI,longitud2,length(subcadenaI)); //elimino la subcadena en la ultima ocurrencia//
    insert(''+asterisco,palabraI,longitud2);     //inserto los asteriscos //


    palabra:='';

    for longitud:=length(palabraI) downto 0 do    //ahora ordeno la cadena como estaba//
      palabra:=palabra+palabraI[longitud];

    delete(palabra,1,1);
    writeln(palabra);
    lugar:=pos(subcadena,palabra);
    end
   else
    begin
    for i:=1 to length(palabra) do
      if palabra[i]=' ' then
        begin
          palabra[i]:='*'
        end;
    end;

   if contadorSC=0 then
    begin
      writeln('La subcadena no se encuentra en la cadena');
      writeln(palabra);
    end
   else if contadorSC=1 then
    begin
      writeln('La subcadena aparece 1 sola vez');
      writeln(palabra);
    end
   else if contadorSC>=2 then
    writeln('La subcadena aparece ',contadorSC,' veces y la cadena ahora es: ',palabra);


  readkey;
end;
procedure borrar(palabras:string);

var
   palabra,subcadena,palabraN,palabrasB:string;
   long,i,j,longitud:integer;
   cadena:array [1..999999] of string;

   begin
   subcadena:=' ';
   j:=1;
   palabraN:=' ';
   long:=0;
   longitud:=length(palabras);

   for i:=1 to longitud do
    cadena[i]:='';

   writeln('Ingrese la subcadena a borrar');
   readln(subcadena);

   for i:=1 to length(palabras) do
     if palabras[i]=' ' then
        j:=j+1
     else
       cadena[j]:=cadena[j]+palabras[i];


   for i:=1 to j do
     begin
      long:=pos(subcadena,cadena[i]);
      if long<>0 then
         begin
          palabrasB:=palabrasB+cadena[i]+',';
          cadena[i]:=' ';
         end
     end;


   for i:=1 to j do
     palabraN:=palabraN+cadena[i]+' ';



   writeln('La nueva frase es:',palabraN,' y las palabras borradas son: ',palabrasB);
   end;

begin
  writeln('Ingrese una cadena');
  readln(texto);
  parteA(texto);
  Vocales(texto);
  writeln;
  cadenaU(texto);
  writeln;
  borrar(texto);
  readkey;
end.
