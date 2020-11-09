program Top5Mejorado;
uses
   crt, top5remix;
  type
    fichero = record
          nombre : string[80];
          numero : integer;
          estado : string[80]
        end;
    top = array[1..5] of record
          nombre: string[80];
          numero: integer;
          estado : string[80];
    end;
   const
       elarchivo = 'C:\Users\david_000\Desktop\PCS-ENMANUEL\Emmanuel\emmanuel salcedo\Desktop\Trabajo\UCAB\Algoritmo y programacion\Proyecto\datos.txt'; //Aqui debe ir la direccion donde se guardara el archivo
       lista = 'C:\Users\david_000\Desktop\PCS-ENMANUEL\Emmanuel\emmanuel salcedo\Desktop\Trabajo\UCAB\Algoritmo y programacion\Proyecto\lista.txt'; //igualmente aqui perro aqui tambien  pon la direccion
   var
     f : file of fichero;
     dato : fichero;
     orden:top;
     reporte: file of top;


  procedure entadatos;
  begin
      clrscr;
        writeln('*** Entrada Datos ***');
        writeln;
        write('  Nombre = ');
        readln(dato.nombre);
        write('  Numero = ');
        readln(dato.numero);
        write('  Estado = ');
        readln(dato.estado);
     assign(f,elarchivo);
  {$I-} reset(f); {$I+}
   if ioresult <> 0 then
   begin
       rewrite(f);
       seek(f,0);
       write(f,dato);
       close(f);
   end
 else
    begin
       seek(f,filesize(f));
       write(f,dato);
       close(f);
    end;
  end;

  procedure ordenaarchivos;
  var
    da, tempo : fichero;
    i, t : longint;
  begin
     assign(f,elarchivo);
  {$I-} reset(f); {$I+}
   if ioresult <> 0 then
   begin
       writeln('  Error de archivo pulse [Enter]');
       readln;
       exit;
   end
 else
    begin
     for i := 0 to filesize(f) - 1 do
     begin
         seek(f,i);
         read(f,dato);
         for t := filesize(f) - 1 downto i + 1 do
         begin
            seek(f,t);
            read(f,da);
            if dato.numero < da.numero then
            begin
               tempo := dato;
               dato := da;
               da := tempo;
               seek(f,i);
               write(f,dato);
               seek(f,t);
               write(f,da);
            end;
         end;
      end;
        close(f);
    end;
  end;

  procedure presentaordenados;
  var
     d : longint;
  begin
  assign(f,elarchivo);
  {$I-} reset(f); {$I+}
   if ioresult <> 0 then
   begin
     writeln('  Error de archivo pulse [Enter]');
     readln;
     exit;
   end
 else
    begin
       writeln('*** Datos Del Archivo ***');
       writeln;
       writeln(' Nombre               Numero          Estado');
       for d := 0 to filesize(f) - 1 do
       begin
          seek(f,d);
          read(f,dato);
          gotoxy(3,4 + d);write(dato.nombre);
          gotoxy(25,4 + d);write(dato.numero);
          gotoxy(38,4 + d);write(dato.estado);
       end;
       close(f);
    end;
    readln;
  end;
  procedure Top5;
  VAR
     k:longint;
  begin
  assign(f,elarchivo);
  {$I-} reset(f); {$I+}
   if ioresult <> 0 then
   begin
     writeln('  Error de archivo pulse [Enter]');
     readln;
     exit;
   end
 else
   begin
       For k:=1 to 5 do
       begin
          seek(f,k-1);
          read(f,dato);
          orden[k].nombre:= dato.nombre;
          orden[k].numero:= dato.numero;
          orden[k].estado:= dato.estado;
       end;
       close(f)
   end;
   assign(reporte,lista);
   rewrite(reporte);
   write(reporte,orden);
   close(reporte);
  end;
procedure VisualizarTop5;
var
   M:integer;
begin
 assign(f,elarchivo);
  {$I-} reset(f); {$I+}
   if ioresult <> 0 then
   begin
     writeln('  Error de archivo pulse [Enter]');
     readln;
     exit;
   end
 else
 begin
 ordenaarchivos;
 Top5;
 writeln('*** TOP 5 ***');
       writeln;
       writeln(' Nombre               Numero          Estado');
       For M:=1 to 5 do
       begin
          gotoxy(3,4 + M);write(orden[M].nombre);
          gotoxy(25,4 + M);write(orden[M].numero);
          gotoxy(38,4 + M);write(orden[M].estado);
       end;
       readln;
   end;
end;
  procedure menu;
  var
    tec : char;
  begin
  repeat
      clrscr;
      writeln('**** Menu Principal ****');
      writeln;
      writeln('  1 : Entrada Datos');
      writeln('  2 : Ordenar Archivo');
      writeln('  3 : Ver Archivos');
      writeln('  4 : TOP 5');
      writeln('  5 : Salir');
      writeln;
      writeln('<<<< Elija Opcion >>>>');
      repeat
         tec := readkey;
      until tec in['1','2','3','4','5'];
      clrscr;
   case tec of
 '1' : entadatos;
 '2' : ordenaarchivos;
 '3' : presentaordenados;
 '4' : VisualizarTop5;
   end;
   until tec = '5';
  end;


  begin
      menu;
  end.
