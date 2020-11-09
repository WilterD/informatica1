program project1;
uses crt;
 var texto:string;
   i,desicion:integer;

   procedure invertido(texto:string);
   var i:integer;
  begin
     for i:=length(texto) downto 1 do
       begin
        write(texto[i]);
       end;
     end;

procedure vocales(vocal:string);
var i,contador:integer;
  begin
     for i:=1 to length(texto) do
       begin
        case texto[i] of
         'a':writeln('hola');
    end;
begin
 writeln('Introduzca la cadena de texto: ');
 read(texto);
 writeln('Que quiere realizar a la cadena de texto?');
 writeln('1: la cadena de texto invertida');
 writeln('2: la cantidad de vocales en la cadena de texto');
 read(desicion);

 case desicion of
  1:invertido(texto);
  2:vocales(texto);


   end;

 readkey;

end.

