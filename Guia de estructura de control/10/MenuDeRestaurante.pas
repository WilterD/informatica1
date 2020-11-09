//10. El menú de un restaurante de comida rápida es:
//Hamburguesa250 Ptas.
//Cerveza 100 Ptas.
//Coca cola 125 Ptas.
//Ensalada 200 Ptas.
//Salchichas 275 Ptas.
//Sopa 260 Ptas.
//Pastel 300 Ptas.
//Se desea un algoritmo que calcule las ventas totales al final del día, así como los
//impuestos a pagar (12%). El algoritmo tendrá como entrada el número de cada uno e
//los productos vendidos ese día.
program MenuDeRestaurante;
uses crt;
var
  Hamburguesa,cantHam,Cerveza,CantCerve,Refresco,CantRefre,Ensalada,CantEnsa,Salchichas,CantSalchi,Sopa,CantSopa,Pastel,CantPastel:integer;
  VentaTotal,ventas,Impuestos:real;


begin
  writeln('1- Hamburguesa costo 250');
  writeln('2- Cerveza costo 100');
  writeln('3- Coca Cola costo 125');
  writeln('4- Ensalada costo 200');
  writeln('5- Salchichas costo 275');
  writeln('6- Sopa costo 260');
  writeln('7- Pastel costo 300');
  writeln;
  writeln('Cuantas hamburguesas fueron vendidas');
  readln(cantHam);
  writeln('Cuantas Cervezas fueron vendidas');
  readln(CantCerve);
  writeln('Cuantos refrescos fueron vendidos');
  readln(CantRefre);
  writeln('Cuantas ensaladas fueron vendidas');
  readln(CantEnsa);
  writeln('Cuantas salchichas fueron vendidas');
  readln(CantSalchi);
  writeln('Cuantas sopas fueron vendidas');
  readln(CantSopa);
  Writeln('Cuantos pasteles fueron vendidos');
  readln(CantPastel);
  writeln;
  Hamburguesa:= CantHam*250;
  Cerveza:= CantCerve*100;
  Refresco:= CantRefre*125;
  Ensalada:= CantEnsa*200;
  Salchichas:= CantSalchi*275;
  Sopa:= CantSopa*260;
  Pastel:= CantPastel*300;
  Ventas:= Hamburguesa+Cerveza+Refresco+Ensalada+Salchichas+Sopa+Pastel;
  Impuestos:= Ventas*0.12;
  VentaTotal:=Ventas-Impuestos;
  CLRSCR;
  writeln('La cantidad de hamburguesas vendidas fue de ',cantHam);
  writeln('La cantidad de cervezas vendidas fue de ',CantCerve);
  writeln('La cantidad de Coca Colas vendidas fue de ',CantRefre);
  writeln('La cantidad de ensaladas vendidas fue de ',CantEnsa);
  writeln('La cantidad de salchichas vendidas fue de ',CantSalchi);
  writeln('La cantidad de sopas vendidas fue de ',CantSopa);
  writeln('La cantidad de pasteles vendidos fue de ',CantPastel);
  writeln;
  writeln('Se obtuvo al final de el dia ',Ventas:0:2,' Bs');
  Writeln('Los impuestos a pagar es de ',impuestos:0:2);
  writeln('Pagando el impuesto, las ganancias fueron de ',VentaTotal:0:2);
  readkey;
end.

