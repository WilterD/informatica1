{************************************************************************}
{   Universidad Latina de Costa Rica                                     }
{   Eduardo Chongkan Lกos                            Carnet: 2002501098  }
{   Eduardo_ckl@hotmail.com                                              }
{   Proyecto Programado                              Fecha:  31/04/02    }
{************************************************************************}

program Movies;

uses crt,printer,dos;

type
    persona = record
              Nombre  : string[15];
              ap1     : string[15];
              ap2     : string[15];
              tel     : string[9];
              day     : byte;
              month   : byte;
              year    : word;
              Dir     : string;
              city    : string;
              prov    : string;

    end;

    tape   = record
             Titulo   : string[35];
             tipo     : char;
             socio    : word;
             estado   : byte;
             price    : word;
             multa    : word;
             day2     : word;
             month2   : word;
             year2    : word;


    end;

var
   archivo1     : file of persona;
   archivo2     : file of tape;
   cliente      : persona;
   movie        : tape;
   opcion       : char;
   a,b          : byte;
   dia          : word;
   mes          : word;
   ano          : word;
   dow          : word;
   car          : word;
   control      : char;
   day2p2       : byte;
   monthaux     : byte;
   yearaux      : word;


{*************************PROCEDURE CUADRO**********************************}
procedure cuadro;
     begin
          textcolor (yellow);
          gotoxy(25,6);
          writeln ('ษออออออออออออออออออออออป');
          gotoxy(25,7);
          writeln ('บ                      บ');
          gotoxy(25,8);
          writeln ('ฬออออออออออออออออออออออน');
          gotoxy(25,9);
          writeln ('บ                      บ');
          gotoxy(25,10);
          writeln ('บ                      บ');
          gotoxy(25,11);
          writeln ('บ                      บ');
          gotoxy(25,12);
          writeln ('บ                      บ');
          gotoxy(25,13);
          writeln ('บ                      บ');
          gotoxy(25,14);
          writeln ('บ                      บ');
          gotoxy(25,15);
          writeln ('บ                      บ');
          gotoxy(25,16);
          writeln ('บ                      บ');
          gotoxy(25,17);
          writeln ('บ                      บ');
          gotoxy(25,18);
          writeln ('ศออออออออออออออออออ[ ]อผ');
          normvideo;
     end;

{****************************PROCEDURE PRINT_CARNET*************************}

Procedure print_carnet;
  begin
       assign(archivo1,'clientes.dat');
       reset(Archivo1);
       seek(Archivo1,filesize(Archivo1)-1);
       read(archivo1,cliente);
       car:= filesize(archivo1);

       with cliente do
            begin
            writeln (lst,'ษออออออออออออออออออออออออออออป');
            writeln (lst);
            writeln (lst,'    * Changos Videoclub *');
            writeln (lst);
            writeln (lst,'  ',nombre,' ',ap1);
            writeln (lst);
            writeln (lst,'  # Carnet  ',car);
            writeln (lst);
            writeln (lst,'  Firma:__________________');
            writeln (lst);
            writeln (lst,'ศอออออVer sello al dorsoอออออผ');
            writeln (lst);
            writeln (lst,'.................................Corte Aquก....................................');
       end;
  end;


{***************************PROCEDURE NUEVO*********************************}

Procedure nuevo;
  begin
    assign(Archivo1,'clientes.dat');
    reset(archivo1);
    seek(archivo1,filesize(archivo1));
    with cliente do
       begin
         repeat
             clrscr;
             textcolor (white);
             textbackground (blue);
             writeln ('                        .: Ingrese Datos para Nuevo Socio :.                    ');
             normvideo;
             getdate(ano,mes,dia,dow);
             day   := dia;
             month := mes;
             year  := ano;
             gotoxy(1,3);
             writeln ('Nombre: [              ]         Fecha: [  /  /    ]');
             gotoxy(42,3);
             writeln (dia);
             gotoxy(45,3);
             if mes < 10 then
             writeln ('0',mes)
             else
             writeln (mes);
             gotoxy(48,3);
             writeln (ano);
             gotoxy(1,5);
             writeln ('1er Apellido: [               ]');
             gotoxy(1,7);
             writeln ('2do Apellido: [               ]');
             gotoxy(1,9);
             writeln ('Telfono: [         ] (555 55 55)');
             gotoxy(1,11);
             writeln ('Direcciขn: [                                      ]');
             gotoxy(1,13);
             writeln ('Ciudad: [               ] Provincia: [            ]');
             gotoxy(1,15);
             writeln ('# de Carnet: [         ]');
             textcolor (lightblue);
             gotoxy(10,3);
             readln(nombre);
             gotoxy(16,5);
             readln(ap1);
             gotoxy(16,7);
             readln(ap2);
             gotoxy(12,9);
             readln (tel);
             gotoxy(13,11);
             readln (dir);
             gotoxy(10,13);
             readln (city);
             gotoxy(39,13);
             readln (prov);
             gotoxy(15,15);
             textcolor (yellow);
             writeln (filepos(archivo1)+1);
             normvideo;
             gotoxy(25,17);
             textcolor (blue);
             writeln ('ษออออออออออออออออออออออป');
             gotoxy(25,18);
             writeln ('บ                      บ');
             gotoxy(25,19);
             writeln ('ฬออออออออออออออออออออออน');
             gotoxy(25,20);
             writeln ('บ                      บ');
             gotoxy(25,21);
             writeln ('บ                      บ');
             gotoxy(25,22);
             writeln ('บ                      บ');
             gotoxy(25,23);
             writeln ('บ                      บ');
             gotoxy(25,24);
             writeln ('ศออออออออออออออออออ[ ]อผ');
             normvideo;
             gotoxy(28,18);
             textcolor (yellow + blink);
             writeln ('Selecionar Opciขn');
             normvideo;
             gotoxy(27,20);
             writeln ('A) Imprimir Carnet');
             gotoxy(27,22);
             writeln ('B) Corregir Datos');
             gotoxy (45,24);
             readln (opcion);
             if upcase(opcion) = 'A' then
                begin
                     write(archivo1,cliente);
                     close(Archivo1);
                     print_carnet;

               end;
         until upcase(opcion) = 'A'
        end;

  end;
{***************************PROCEDRUE MOD_SOCIOS****************************}
procedure mod_socios;
  begin
       control:= 'b';
     repeat

       clrscr;
       textcolor (white);
       textbackground (blue);
       writeln ('                               .: Tramitar :.                                   ');
       normvideo;
       writeln;
       writeln ('  Digite Carnet: [           ]');
       gotoxy(19,4);
       textcolor (lightblue);
       readln (car);
       normvideo;
       assign(archivo1,'clientes.dat');
       reset(archivo1);

      begin
         while not eof(archivo1) do
         begin
            read(archivo1,cliente);
            with cliente do
                 begin
                   if (car) = filepos(archivo1) then
                      begin
                           control := 'a';
                           gotoxy(3,6);
                           textcolor (yellow);
                           writeln (nombre,' ',ap1,' ',ap2);
                           normvideo;
                           gotoxy(3,8);
                           writeln ('Fecha de Afiliaciขn: ');
                           if month < 10 then
                              begin
                                gotoxy(24,8);
                                textcolor (lightblue);
                                writeln ('[',day,'/0',month,'/',year,']');
                                normvideo;
                              end
                           else
                              begin
                                gotoxy(24,8);
                                textcolor (lightblue);
                                writeln ('[',day,'/',month,'/',year,']');
                                normvideo;
                              end;
                           gotoxy(3,10);
                           writeln ('Telfono: ');
                           gotoxy(13,10);
                           writeln (tel);
                           gotoxy(3,12);
                           writeln ('Direcciขn: ');
                           gotoxy(3,14);
                           writeln (dir,', ',city,', ',prov);
                           repeat
                             gotoxy(50,4);
                             textcolor (blue);
                             writeln ('ษออออออออออออออออออออออป');
                             gotoxy(50,5);
                             writeln ('บ                      บ');
                             gotoxy(50,6);
                             writeln ('ฬออออออออออออออออออออออน');
                             gotoxy(50,7);
                             writeln ('บ                      บ');
                             gotoxy(50,8);
                             writeln ('บ                      บ');
                             gotoxy(50,9);
                             writeln ('บ                      บ');
                             gotoxy(50,10);
                             writeln ('บ                      บ');
                             gotoxy(50,11);
                             writeln ('บ                      บ');
                             gotoxy(50,12);
                             writeln ('บ                      บ');
                             gotoxy(50,13);
                             writeln ('บ                      บ');
                             gotoxy(50,14);
                             writeln ('บ                      บ');
                             gotoxy(50,15);
                             writeln ('บ                      บ');
                             gotoxy(50,16);
                             writeln ('บ                      บ');
                             gotoxy(50,17);
                             writeln ('บ                      บ');
                             gotoxy(50,18);
                             writeln ('ศออออออออออออออออออ[ ]อผ');
                             normvideo;
                             gotoxy(53,5);
                             textcolor (yellow);
                             writeln ('Selecionar Opciขn');
                             normvideo;
                             gotoxy(52,7);
                             writeln ('A) Nombre');
                             gotoxy(52,9);
                             writeln ('B) 1er Apellido');
                             gotoxy(52,11);
                             writeln ('C) 2do Apellido');
                             gotoxy(52,13);
                             writeln ('D) Telfono');
                             gotoxy(52,15);
                             writeln ('E) Direcciขn');
                             gotoxy(52,17);
                             textcolor (blue);
                             writeln ('F) Socios...');
                             normvideo;
                             gotoxy (70,18);
                             readln (opcion);
                             case upcase(opcion) of
                               'A' : begin
                                     gotoxy (3,18);
                                     writeln ('Nuevo Nombre: [             ]');
                                     gotoxy(18,18);
                                     textcolor (lightblue);
                                     readln (nombre);
                                     normvideo;
                                     seek(archivo1,filepos(archivo1)-1);
                                     write(archivo1,cliente);
                                     gotoxy (3,18);
                                     writeln ('                             ');
                                     gotoxy(3,6);
                                     writeln ('                                               ');
                                     gotoxy(3,6);
                                     textcolor (yellow);
                                     writeln (nombre,' ',ap1,' ',ap2);
                                     end;
                               'B' : begin
                                     gotoxy (3,18);
                                     writeln ('Nuevo Apellido: [             ]');
                                     gotoxy(20,18);
                                     textcolor (lightblue);
                                     readln (ap1);
                                     normvideo;
                                     seek(archivo1,filepos(archivo1)-1);
                                     write(archivo1,cliente);
                                     gotoxy (3,18);
                                     writeln ('                                     ');
                                     gotoxy(3,6);
                                     writeln ('                                               ');
                                     gotoxy(3,6);
                                     textcolor (yellow);
                                     writeln (nombre,' ',ap1,' ',ap2);
                                     end;
                               'C' : begin
                                     gotoxy (3,18);
                                     writeln ('Nuevo Apellido: [             ]');
                                     gotoxy(20,18);
                                     textcolor (lightblue);
                                     readln (ap2);
                                     normvideo;
                                     seek(archivo1,filepos(archivo1)-1);
                                     write(archivo1,cliente);
                                     gotoxy (3,18);
                                     writeln ('                                     ');
                                     gotoxy(3,6);
                                     writeln ('                                               ');
                                     gotoxy(3,6);
                                     textcolor (yellow);
                                     writeln (nombre,' ',ap1,' ',ap2);
                                     end;
                               'D' : begin
                                     gotoxy (3,18);
                                     writeln ('Nuevo Telfono: [         ]');
                                     gotoxy(20,18);
                                     textcolor (lightblue);
                                     readln (tel);
                                     normvideo;
                                     seek(archivo1,filepos(archivo1)-1);
                                     write(archivo1,cliente);
                                     gotoxy (3,18);
                                     writeln ('                                     ');
                                     gotoxy(3,10);
                                     writeln ('                                        ');
                                     gotoxy(3,10);
                                     writeln ('Telfono: ');
                                     gotoxy(13,10);
                                     writeln (tel);
                                     end;
                               'E' : begin
                                     gotoxy (3,18);
                                     writeln ('1) Direcciขn     [ ]');
                                     writeln ('  2) Ciudad');
                                     writeln ('  3) Provincia');
                                     gotoxy(21,18);
                                     textcolor (lightblue);
                                     readln (opcion);
                                     normvideo;
                                     case upcase(opcion) of
                                       '1' : begin
                                            gotoxy (3,18);
                                            writeln ('                      ');
                                            writeln ('                 ');
                                            writeln ('                 ');
                                            gotoxy(3,18);
                                            writeln ('Nueva Direcciขn: [                            ]');
                                            gotoxy(21,18);
                                            textcolor (lightblue);
                                            readln (dir);
                                            normvideo;
                                            seek(archivo1,filepos(archivo1)-1);
                                            write(archivo1,cliente);
                                            gotoxy (3,18);
                                            writeln ('                                                       ');
                                            gotoxy(3,14);
                                            writeln ('                                          ');
                                            gotoxy(3,14);
                                            writeln (dir,', ',city,', ',prov);
                                            end;
                                       '2' : begin
                                            gotoxy (3,18);
                                            writeln ('                      ');
                                            writeln ('                 ');
                                            writeln ('                 ');
                                            gotoxy(3,18);
                                            writeln ('Nueva Ciudad: [             ]');
                                            gotoxy(18,18);
                                            textcolor (lightblue);
                                            readln (city);
                                            normvideo;
                                            seek(archivo1,filepos(archivo1)-1);
                                            write(archivo1,cliente);
                                            gotoxy (3,18);
                                            writeln ('                                     ');
                                            gotoxy(3,14);
                                            writeln ('                                          ');
                                            gotoxy(3,14);
                                            writeln (dir,', ',city,', ',prov);
                                            end;
                                       '3' : begin
                                            gotoxy (3,18);
                                            writeln ('                      ');
                                            writeln ('                 ');
                                            writeln ('                 ');
                                            gotoxy(3,18);
                                            writeln ('Nueva Provincia: [             ]');
                                            gotoxy(21,18);
                                            textcolor (lightblue);
                                            readln (prov);
                                            normvideo;
                                            seek(archivo1,filepos(archivo1)-1);
                                            write(archivo1,cliente);
                                            gotoxy (3,18);
                                            writeln ('                                     ');
                                            gotoxy(3,14);
                                            writeln ('                                          ');
                                            gotoxy(3,14);
                                            writeln (dir,', ',city,', ',prov);
                                            end;
                                       end;



                                     end;
                             end;
                          until upcase(opcion) = 'F'
                      end
                 end
                 end;
         end;
         until control= 'a';

  end;
{****************************PROCEDURE PRINT_SOC****************************}
procedure print_soc;
  begin
   assign(archivo1,'clientes.dat');
       reset(archivo1);
       writeln (lst,'                                .: cat logo de clientes :.');
       writeln (lst,'*****************************************************************************************');
       writeln (lst,'Carnet                     Nombre');
       writeln (lst,'*****************************************************************************************');
       writeln (lst);
       while not eof(archivo1) do
         begin
         read(Archivo1,cliente);
            with cliente do
            begin
              car:= filepos(archivo1);
              writeln (lst,car:4,'          ',nombre,' ',ap1,' ',ap2);
            end;
         end;

  end;
{****************************PROCEDURE CATA_SOC*****************************}
procedure cat_soc;
  begin
       clrscr;
       textcolor (white);
       textbackground (blue);
       writeln ('                             .: Cat logo de Socios :.                          ');
       normvideo;
       gotoxy(1,2);
       textcolor (red);
       textbackground (lightgray);
       writeln (' Carnet                    Nombre                                              ');
       normvideo;
       assign(archivo1,'clientes.dat');
       reset(archivo1);
       a:= 3;
       while not eof(archivo1) do
         begin
              read(archivo1,cliente);
              with cliente do
              begin
              a:= a+1;
              car:= filepos(archivo1);
              gotoxy(2,a);
              writeln (car);
              gotoxy(12,a);
              writeln (nombre,' ',ap1,' ',ap2);
              end;
         end;
      gotoxy(2,a+2);
      writeln ('Desea Imprimir el cat logo de socios (s/n) [ ]');
      gotoxy(46,a+2);
      readln (opcion);
      if upcase(opcion) = 'S' then
      begin
      print_soc;
      clrscr;
      gotoxy(30,12);
      textcolor (white);
      writeln ('Imprimiendo...');
      delay(500);
      normvideo;
      end;



  end;


{*******************************PROCEDURE SOCIOS****************************}
Procedure socios;
  begin
    repeat
     textcolor (lightgray);
     clrscr;
     gotoxy(25,4);
     textcolor (blue);
     writeln ('ษออออออออออออออออออออออป');
     gotoxy(25,5);
     writeln ('บ                      บ');
     gotoxy(25,6);
     writeln ('ฬออออออออออออออออออออออน');
     gotoxy(25,7);
     writeln ('บ                      บ');
     gotoxy(25,8);
     writeln ('บ                      บ');
     gotoxy(25,9);
     writeln ('บ                      บ');
     gotoxy(25,10);
     writeln ('บ                      บ');
     gotoxy(25,11);
     writeln ('บ                      บ');
     gotoxy(25,12);
     writeln ('บ                      บ');
     gotoxy(25,13);
     writeln ('บ                      บ');
     gotoxy(25,14);
     writeln ('ศออออออออออออออออออ[ ]อผ');
     normvideo;
     gotoxy(28,5);
     textcolor (yellow);
     writeln ('Seleccionar Opciขn');
     normvideo;
     gotoxy(28,7);
     writeln ('A) Aคadir...');
     gotoxy(28,9);
     writeln ('B) Modificar...');
     gotoxy(28,11);
     writeln ('C) Cat logo...');
     gotoxy(28,13);
     textcolor (yellow);
     writeln ('D) Principal...');
     normvideo;
     gotoxy (45,14);
     readln (opcion);
     case upcase(opcion) of
       'A' : nuevo;
       'B' : mod_socios;
       'C' : cat_soc;
     end;

   until upcase(opcion) = 'D'

  end;

{*************************PROCEDURE COMPARAR********************************}

Procedure comparar;
  begin
       control:= 'b';
     repeat

       clrscr;
       textcolor (white);
       textbackground (blue);
       writeln ('                               .: Tramitar :.                                   ');
       normvideo;
       writeln;
       writeln ('  Digite Carnet: [           ]');
       gotoxy(19,4);
       textcolor (lightblue);
       readln (car);
       normvideo;
       assign(archivo1,'clientes.dat');
       reset(archivo1);

      begin
         while not eof(archivo1) do
         begin
            read(archivo1,cliente);
            with cliente do
                 begin
                   if (car) = filepos(archivo1) then
                      begin
                           control := 'a';
                           gotoxy(3,6);
                           textcolor (yellow);
                           writeln (nombre,' ',ap1,' ',ap2);
                           normvideo;
                           gotoxy(40,6);
                           writeln ('Fecha de Afiliaciขn: ');
                           if month < 10 then
                              begin
                                gotoxy(61,6);
                                writeln ('[',day,'/0',month,'/',year,']');
                              end
                           else
                              begin
                                gotoxy(61,6);
                                writeln ('[',day,'/',month,'/',year,']');
                              end;
                           gotoxy(3,8);
                           writeln ('Telfono: ');
                           gotoxy(13,8);
                           writeln (tel);
                           gotoxy(3,10);
                           writeln ('Direcciขn: ');
                           gotoxy(14,10);
                           writeln (dir,', ',city,', ',prov);
                           gotoxy(3,12);
                           textcolor (red);
                           writeln ('Pelกculas pendientes:');
                           normvideo;
                           writeln;
                           assign(Archivo2,'movies.dat');
                           reset(archivo2);
                           textcolor (lightblue);
                           writeln ('  Cขdigo    Tกtulo                         Fecha A.');
                           gotoxy(64,14);
                           textcolor (red);
                           writeln ('Fecha D.');
                           normvideo;
                           writeln;
                           while not eof(archivo2) do
                                 begin
                                 read(archivo2,movie);
                                 if movie.socio = filepos(archivo1) then
                                 begin
                                 if movie.month2 = 1 or 3 or 5 or 7 or 8 or 10 or 12 then
                                    begin
                                     day2p2 := movie.day2+2;
                                     monthaux:= movie.month2;
                                     if day2p2 > 31 then
                                     begin
                                       monthaux := month+1;
                                       day2p2 := day2p2 - 31;
                                       if monthaux > 12 then
                                        begin
                                          yearaux:= movie.year2+1;
                                          monthaux := month-12;
                                        end;
                                     end;
                                    end;
                                  if movie.month2 = 4 or 6 or 9 or 11 then
                                    begin
                                     day2p2 := movie.day2+2;
                                     monthaux:= movie.month2;
                                     if day2p2 > 30 then
                                     begin
                                       monthaux := month+1;
                                       day2p2 := day2p2 - 30;
                                       if monthaux > 12 then
                                        begin
                                          yearaux:= movie.year2+1;
                                          monthaux := month-12;
                                        end;
                                     end;
                                    end;
                                  if movie.month2 = 2 then
                                    begin
                                     day2p2 := movie.day2+2;
                                     monthaux:= movie.month2;
                                     if (movie.year2 mod 4) = 0 then
                                     if day2p2 > 29 then
                                     begin
                                       monthaux := month+1;
                                       day2p2 := day2p2 - 29;
                                       if monthaux > 12 then
                                        begin
                                          yearaux:= movie.year2+1;
                                          monthaux := month-12;
                                        end;
                                     end
                                     else
                                      begin
                                     day2p2 := movie.day2+2;
                                     monthaux:= movie.month2;
                                     if day2p2 > 28 then
                                     begin
                                       monthaux := month+1;
                                       day2p2 := day2p2 - 28;
                                       if monthaux > 12 then
                                        begin
                                          yearaux:= movie.year2+1;
                                          monthaux := month-12;
                                        end;
                                     end;
                                    end;
                                    end;
                                 if monthaux < 10 then
                                   begin
                                    writeln('  ',filepos(archivo2),'         '+
                                    movie.titulo,movie.day2:21-length(movie.titulo)+12,'/0',movie.month2,'/',movie.year2,+
                                    '          ',day2p2,'/0',monthaux,'/',yearaux);
                                   end
                                  else
                                     begin
                                      writeln('  ',filepos(archivo2),'         '+
                                      movie.titulo,movie.day2:21-length(movie.titulo)+12,'/0',movie.month2,'/',movie.year2,+
                                      '          ',day2p2,'/',monthaux,'/',yearaux);
                                     end;
                           end;
                           end;
                           normvideo;
                           readkey;

                      end

                 end


                 end;



         end;
         until control= 'a';
   end;

{******************************PROCEDURE CONS_CINTA************************}

procedure cons_cinta;
  begin
    control:= 'b';
    repeat
       clrscr;
       textcolor (white);
       textbackground (blue);
       writeln ('                            .: Pelกculas :.                                   ');
       normvideo;
       writeln;
       writeln ('  Digite Cขdigo: [           ]');
       gotoxy(19,3);
       textcolor (lightblue);
       readln (car);
       normvideo;
       assign(archivo2,'movies.dat');
       reset(archivo2);

      begin
         while not eof(archivo2) do
         begin
            read(archivo2,movie);
            with movie do
                 begin
                   if (car) = filepos(archivo2) then
                      begin
                           control := 'a';
                           gotoxy(3,6);
                           textcolor (white);
                           writeln (titulo);
                           normvideo;
                           gotoxy(3,8);
                           writeln ('Tipo: [       ]');
                           case upcase(tipo) of
                            'A': begin
                                 gotoxy(10,8);
                                 textcolor(red);
                                 writeln ('Acciขn');
                                 normvideo;
                                 end;
                            'B': begin
                                 gotoxy(10,8);
                                 textcolor (lightblue);
                                 writeln ('Drama');
                                 normvideo;
                                 end;
                            'C': begin
                                 gotoxy(10,8);
                                 textcolor (yellow);
                                 writeln ('Comedia');
                                 normvideo;
                                 end;

                      end;
                      gotoxy(3,10);
                      writeln ('Estado: ');
                      if estado = 0 then

                        begin
                          gotoxy(11,10);
                          textcolor (lightblue);
                          writeln ('Disponible');
                          normvideo;
                          gotoxy(3,12);
                          writeln ('Desea Alquilar la pelกcula (s/n) [ ]');
                          gotoxy(37,12);
                          opcion := readkey;
                          case upcase(opcion) of
                             'S' : begin
                                    gotoxy(3,14);
                                    writeln ('Digite # de Carnet del socio [        ]');
                                    gotoxy(33,14);
                                    readln (dow);
                                    socio:= dow;
                                    estado:= 1;
                                    getdate(ano,mes,dia,dow);
                                    year2 := ano;
                                    month2 := mes;
                                    day2 :=  dia;
                                    gotoxy(3,18);
                                    writeln ('Registro Actualizado!');
                                    writeln;
                                    writeln ('  Presione cualquier tecla para continuar...');
                                    gotoxy(45,20);
                                    readkey;
                                   end;
                          end;
                        seek(archivo2,filepos(archivo2)-1);
                        write(archivo2,movie);
                       end
                      else
                        begin
                          gotoxy(11,10);
                          textcolor (red);
                          write ('Alquilada');
                          normvideo;
                          write (' por ');
                          assign(archivo1,'clientes.dat');
                          reset(Archivo1);
                          while not eof(Archivo1) do
                            begin
                                 read(archivo1,cliente);
                                 if socio = filepos(Archivo1) then
                                 with cliente do
                                   writeln (nombre,' ',ap1,' ',ap2);

                                 end;
                                 close(archivo1);
                                 writeln;
                                 if month2 < 10 then
                                  begin
                                   writeln ('  Fecha: ', day2,'/0',month2,'/',year2);
                                   writeln;
                                   textcolor (red);
                                   writeln ('  Fecha de Devoluciขn: ');
                                   normvideo;
                                   gotoxy(24,14);
                                   writeln (day2+2,'/0',month2,'/',year2);
                                   gotoxy(3,16);
                                   writeln ('Devolver pelกcula (s/n) [ ]');
                                   gotoxy(28,16);
                                   opcion := readkey;
                                   case upcase(opcion) of
                                     'S' : begin
                                            estado:= 0;
                                            socio := 0;
                                            seek(archivo2,filepos(Archivo2)-1);
                                            write(Archivo2,movie);
                                            gotoxy(3,18);
                                            writeln ('Registro Actualizado!');
                                            writeln;
                                            writeln ('  Presione cualquier tecla para continuar...');
                                            gotoxy(45,20);
                                            readkey;

                                           end;
                                   end;
                                  end
                                 else
                                  begin
                                   writeln ('  Fecha: ', day2,'/0',month2,'/',year2);
                                   writeln;
                                   textcolor (red);
                                   writeln ('  Fecha de Devoluciขn: ');
                                   normvideo;
                                   gotoxy(24,14);
                                   writeln (day2+2,'/',month2,'/',year2);

                                  end;
                            end;


                          end;


                        end;

                       end;




         end;

         close(Archivo2);
         gotoxy(3,18);
         writeln ('Digite cualquier tecla para continuar...');
         gotoxy(25,18);

         until control= 'a';
   end;

{*****************************PROCEDURE PLUS_CINTA**************************}

procedure plus_cinta;
  begin
       with movie do
       begin
       repeat
       assign(archivo2,'movies.dat');
       reset(archivo2);
       seek(archivo2,filesize(archivo2));
       clrscr;
       textcolor (white);
       textbackground (blue);
       writeln ('                        .: Ingrese Datos para Nueva Cinta :.                    ');
       normvideo;
       gotoxy(3,4);
       writeln ('Tกtulo: [                                   ]');
       gotoxy(3,6);
       writeln ('Cขdigo : [      ]     Precio: [ฝ    ]');
       gotoxy(12,4);
       readln (titulo);
       gotoxy(13,6);
       textcolor (yellow);
       writeln (filepos(archivo2)+1);
       normvideo;
       gotoxy(35,6);
       readln (price);
       gotoxy(3,8);
       writeln ('Tipo: A) Acciขn     [ ]');
       gotoxy(9,9);
       writeln ('B) Drama');
       gotoxy(9,10);
       writeln ('C) Comedia');
       textcolor (lightblue);
       gotoxy(24,8);
       readln (tipo);
       estado := 0;
       write(archivo2,movie);
       close(archivo2);
       textcolor (red);
       gotoxy(3,12);
       writeln ('Desea Aคadir otra cinta (S/N) [ ]');
       normvideo;
       gotoxy(34,12);
       readln (opcion);
       until upcase(opcion) = 'N';
    end;
  end;

{********************************PROCEDURE PRINT_INVENT**********************}

Procedure print_invent;
  begin
       assign(archivo2,'movies.dat');
       reset(archivo2);
       writeln (lst,'                         .: Inventario de Pelกculas :.');
       writeln (lst,'*****************************************************************************************');
       writeln (lst,'Cขdigo             Tกtulo                            Tipo            Precio');
       writeln (lst,'*****************************************************************************************');

       while not eof(archivo2) do
         begin
         read(Archivo2,movie);
            with movie do
            begin
              car:= filepos(archivo2);
              write (lst,car:4,'     ',titulo);
              case upcase(tipo) of
                'A' : writeln (lst,'Acciขn':35-length(titulo)+15,'          ฝ',price);
                'B' : writeln (lst,'Drama':35-length(titulo)+14,'           ฝ',price);
                'C' : writeln (lst,'Comedia':35-length(titulo)+16,'         ฝ',price);
              end;

            end
        end;

  end;

{*****************************PROCEDURE INVENTARIO**************************}

Procedure inventario;
  begin
       clrscr;
       textcolor (white);
       textbackground (blue);
       writeln ('                          .: Inventario de Pelกculas :.                         ');
       normvideo;
       gotoxy(1,2);
       textcolor (red);
       textbackground (lightgray);
       writeln (' Cขdigo               Tกtulo                        Tipo             Estado     ');
       normvideo;
       assign(archivo2,'movies.dat');
       reset(archivo2);
       a:= 3;
       while not eof(archivo2) do
         begin
              read(archivo2,movie);
              with movie do
              begin
              a:= a+1;
              car:= filepos(archivo2);
              gotoxy(2,a);
              writeln (car);
              gotoxy(12,a);
              writeln (titulo);
              case upcase(tipo) of
                'A': begin
                      gotoxy(53,a);
                      textcolor(red);
                      writeln ('Acciขn');
                      normvideo;
                     end;
                'B': begin
                      gotoxy(53,a);
                      textcolor (lightblue);
                      writeln ('Drama');
                      normvideo;
                     end;
                'C': begin
                      gotoxy(53,a);
                      textcolor (yellow);
                      writeln ('Comedia');
                      normvideo;
                     end;
                end;
                case estado of
                   0 : begin
                        gotoxy(69,a);
                        textcolor(lightblue);
                        writeln ('Disponible');
                        normvideo;
                       end;
                   1 : begin
                        gotoxy(69,a);
                        textcolor(Red);
                        writeln ('Alquilada');
                        normvideo;
                       end;
                 end;

             end;

            end;
            gotoxy(2,a+2);
            writeln ('Desea Imprimir el inventario (s/n) [ ]');
            gotoxy(38,a+2);
            readln (opcion);
            if upcase(opcion) = 'S' then
               print_invent;



  end;

{*************************PROCEDURE MODIFICAR CINTAS************************}
Procedure modificar_cinta;
  begin
     repeat
       clrscr;
       textcolor (white);
       textbackground (blue);
       writeln ('                         .: Modificar Datos de Pelกcula :.                      ');
       normvideo;
       gotoxy(3,4);
       writeln ('Digite Cขdigo: [       ]');
       gotoxy(19,4);
       textcolor (lightblue);
       readln (car);
       normvideo;
       assign(archivo2,'movies.dat');
       reset(archivo2);

      begin
         while not eof(archivo2) do
         begin
            read(archivo2,movie);
            with movie do
                 begin
                   if (car) = filepos(archivo2) then
                      begin
                           control := 'a';
                           gotoxy(3,6);
                           textcolor (white);
                           writeln (titulo);
                           normvideo;
                           gotoxy(3,8);
                           writeln ('Tipo: [ ]');
                           case upcase(tipo) of
                            'A': begin
                                 gotoxy(10,8);
                                 textcolor(red);
                                 writeln ('A');
                                 gotoxy(13,8);
                                 writeln ('Acciขn');
                                 normvideo;
                                 end;
                            'B': begin
                                 gotoxy(10,8);
                                 textcolor (lightblue);
                                 writeln ('B');
                                 gotoxy(13,8);
                                 writeln ('Drama');
                                 normvideo;
                                 end;
                            'C': begin
                                 gotoxy(10,8);
                                 textcolor (yellow);
                                 writeln ('C');
                                 gotoxy(13,8);
                                 writeln ('Comedia');
                                 normvideo;
                                 end;
                             end;
            repeat
             gotoxy(3,10);
             writeln ('Precio: ฝ',price);
             gotoxy(50,4);
             textcolor (blue);
             writeln ('ษออออออออออออออออออออออป');
             gotoxy(50,5);
             writeln ('บ                      บ');
             gotoxy(50,6);
             writeln ('ฬออออออออออออออออออออออน');
             gotoxy(50,7);
             writeln ('บ                      บ');
             gotoxy(50,8);
             writeln ('บ                      บ');
             gotoxy(50,9);
             writeln ('บ                      บ');
             gotoxy(50,10);
             writeln ('บ                      บ');
             gotoxy(50,11);
             writeln ('บ                      บ');
             gotoxy(50,12);
             writeln ('บ                      บ');
             gotoxy(50,13);
             writeln ('บ                      บ');
             gotoxy(50,14);
             writeln ('ศออออออออออออออออออ[ ]อผ');
             normvideo;
             gotoxy(53,5);
             textcolor (yellow);
             writeln ('Selecionar Opciขn');
             normvideo;
             gotoxy(52,7);
             writeln ('A) Tกtulo');
             gotoxy(52,9);
             writeln ('B) Tipo');
             gotoxy(52,11);
             writeln ('C) Precio');
             gotoxy(52,13);
             textcolor (red);
             writeln ('D) Pelกculas...');
             normvideo;
             gotoxy (70,14);
             readln (opcion);
             case upcase(opcion) of
              'A': begin
                    gotoxy(3,16);
                    writeln ('Nuevo Tกtulo: [                              ]');
                    gotoxy(18,16);
                    Textcolor (lightblue);
                    readln (titulo);
                    normvideo;
                    seek(archivo2,filepos(Archivo2)-1);
                    write(archivo2,movie);
                    gotoxy(3,6);
                    writeln('                                           ');
                    gotoxy(3,16);
                    writeln ('                                              ');
                    gotoxy(3,6);
                    textcolor (white);
                    writeln (titulo);
                    normvideo;
                   end;
              'B': begin
                    gotoxy(3,16);
                    writeln ('Nuevo Tipo: A) Acciขn  [ ]');
                    gotoxy(15,17);
                    writeln ('B) Drama');
                    gotoxy(15,18);
                    writeln ('C) Comedia');
                    textcolor (lightblue);
                    gotoxy(27,16);
                    readln (tipo);
                    normvideo;
                    seek(archivo2,filepos(Archivo2)-1);
                    write(archivo2,movie);
                    gotoxy(3,16);
                    writeln ('                          ');
                    gotoxy(15,17);
                    writeln ('        ');
                    gotoxy(15,18);
                    writeln ('          ');
                    gotoxy(3,8);
                    writeln('                  ');
                    gotoxy(3,8);
                    writeln ('Tipo: [ ]');
                           case upcase(tipo) of
                            'A': begin
                                 gotoxy(10,8);
                                 textcolor(red);
                                 writeln ('A');
                                 gotoxy(13,8);
                                 writeln ('Acciขn');
                                 normvideo;
                                 end;
                            'B': begin
                                 gotoxy(10,8);
                                 textcolor (lightblue);
                                 writeln ('B');
                                 gotoxy(13,8);
                                 writeln ('Drama');
                                 normvideo;
                                 end;
                            'C': begin
                                 gotoxy(10,8);
                                 textcolor (yellow);
                                 writeln ('C');
                                 gotoxy(13,8);
                                 writeln ('Comedia');
                                 normvideo;
                                 end;
                       end;
                       end;
             'C' : begin
                    gotoxy(3,16);
                    writeln ('Nuevo Precio: [ฝ    ]');
                    gotoxy(19,16);
                    Textcolor (lightblue);
                    readln (price);
                    normvideo;
                    seek(archivo2,filepos(Archivo2)-1);
                    write(archivo2,movie);
                    gotoxy(3,10);
                    writeln('                                           ');
                    gotoxy(3,16);
                    writeln ('                                              ');
                    normvideo;
                   end;
             end;

     until upcase(opcion) = 'D'


                      end;
                      end;
                      end;

                          close(archivo2);

                      end;


     until control = 'a';
  end;



{*****************************PROCEDURE CINTAS******************************}

procedure cintas;
  begin
       repeat
          clrscr;
          textcolor (red);
          gotoxy(25,6);
          writeln ('ษออออออออออออออออออออออป');
          gotoxy(25,7);
          writeln ('บ                      บ');
          gotoxy(25,8);
          writeln ('ฬออออออออออออออออออออออน');
          gotoxy(25,9);
          writeln ('บ                      บ');
          gotoxy(25,10);
          writeln ('บ                      บ');
          gotoxy(25,11);
          writeln ('บ                      บ');
          gotoxy(25,12);
          writeln ('บ                      บ');
          gotoxy(25,13);
          writeln ('บ                      บ');
          gotoxy(25,14);
          writeln ('บ                      บ');
          gotoxy(25,15);
          writeln ('บ                      บ');
          gotoxy(25,16);
          writeln ('บ                      บ');
          gotoxy(25,17);
          writeln ('บ                      บ');
          gotoxy(25,18);
          writeln ('ศออออออออออออออออออ[ ]อผ');
          normvideo;
          gotoxy(28,7);
          textcolor (yellow);
          writeln ('Seleccionar Opciขn');
          normvideo;
          gotoxy(28,9);
          writeln ('A) Aคadir ');
          gotoxy(28,11);
          writeln ('B) Inventario ');
          gotoxy(28,13);
          writeln ('C) Modificar');
          gotoxy(28,15);
          writeln ('D) Consultar');
          gotoxy(28,17);
          textcolor (yellow);
          writeln ('E) Principal...');
          normvideo;
          gotoxy(45,18);
          readln (opcion);
          case upcase(opcion) of
            'A' : plus_cinta;
            'B' : inventario;
            'C' : modificar_cinta;
            'D' : cons_cinta;

          end;

     until upcase (opcion) = 'E';
     opcion := 'Z';


  end;

{****************************PROCEDURE OPCIONES*****************************}
Procedure opciones;
 begin
   repeat
     textcolor (lightgray);
     clrscr;
     gotoxy(25,4);
     textcolor (blue);
     writeln ('ษออออออออออออออออออออออป');
     gotoxy(25,5);
     writeln ('บ                      บ');
     gotoxy(25,6);
     writeln ('ฬออออออออออออออออออออออน');
     gotoxy(25,7);
     writeln ('บ                      บ');
     gotoxy(25,8);
     writeln ('บ                      บ');
     gotoxy(25,9);
     writeln ('บ                      บ');
     gotoxy(25,10);
     writeln ('บ                      บ');
     gotoxy(25,11);
     writeln ('บ                      บ');
     gotoxy(25,12);
     writeln ('ศออออออออออออออออออ[ ]อผ');
     normvideo;
     gotoxy(30,5);
     textcolor (lightblue);
     writeln ('Limpiar Archivo');
     normvideo;
     gotoxy(27,7);
     writeln ('A) Clientes.dat');
     gotoxy(27,9);
     writeln ('B) Movies.dat');
     gotoxy(27,11);
     textcolor (yellow);
     writeln ('C) Principal...');
     normvideo;
     gotoxy (45,12);
     readln (opcion);
     case upcase(opcion) of
     'A': begin
             assign(archivo1,'clientes.dat');
             rewrite(archivo1);
             clrscr;
             gotoxy(28,5);
             textcolor (lightblue);
             writeln (' Limpiando Archivo...');
             normvideo;
             gotoxy(28,6);
             writeln ('ษออออออออออออออออออออออป');
             gotoxy(28,7);
             writeln ('บ                      บ');
             gotoxy(28,8);
             writeln ('ศออออออออออออออ[    %]อผ');
             a := 29;
             b := 0;
             repeat
              gotoxy(a,7);
              textbackground (blue);
              write(' ');
              delay(25);
              normvideo;
              a := a+1;
              gotoxy(44,8);
              write(b/20*100:0:0);
              b := b+1;
             until b = 21;
             gotoxy(35,10);
             textcolor (red);
             writeln ('Salir...');
             normvideo;
             gotoxy(43,10);
             readkey;

        end;
      'B': begin
            assign(archivo2,'movies.dat');
            rewrite(archivo2);
            clrscr;
            gotoxy(28,5);
            textcolor (lightblue);
            writeln (' Limpiando Archivo...');
            normvideo;
            gotoxy(28,6);
            writeln ('ษออออออออออออออออออออออป');
            gotoxy(28,7);
            writeln ('บ                      บ');
            gotoxy(28,8);
            writeln ('ศออออออออออออออ[    %]อผ');
            a := 29;
            b := 0;
            repeat
              gotoxy(a,7);
              textbackground (blue);
              write(' ');
              delay(25);
              normvideo;
              a := a+1;
              gotoxy(44,8);
              write(b/20*100:0:0);
              b := b+1;
            until b = 21;
            gotoxy(35,10);
            textcolor (red);
            writeln ('Salir...');
            normvideo;
            gotoxy(43,10);
            readkey;
        end;
        end;
    until upcase(opcion) = 'C'


   end;



{************************************INICIO*********************************}

BEGIN
     repeat
      normvideo;
      clrscr;
      cuadro;
      gotoxy(28,7);
      textcolor (lightblue);
      writeln ('Seleccionar Opciขn');
      normvideo;
      gotoxy(28,9);
      writeln ('A) Socios...');
      gotoxy(28,11);
      writeln ('B) Digitar Carnet');
      gotoxy(28,13);
      writeln ('C) Pelกculas...');
      gotoxy(28,15);
      writeln ('D) Opciones');
      gotoxy(28,17);
      textcolor (lightblue);
      writeln ('E) Salir...');
      normvideo;
      gotoxy(45,18);
      readln (opcion);
      case upcase(opcion) of
           'A': Socios;
           'B': comparar;
           'C': cintas;
           'D': opciones;
      end
     until upcase (opcion) = 'E';

END.