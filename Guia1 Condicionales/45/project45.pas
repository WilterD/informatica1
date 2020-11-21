program pro;
(*45. Un proveedor de computadores ofrece descuento del 10%, si cuesta Bs.
1.000.000 o más. Además, independientemente, ofrece el 5% de descuento
si la maraca es IBM. Determinar cuánto pagará, con IVA incluido, un cliente
cualquiera por la compra de un computador. *)
uses crt;
const iva=0.13;

var desicion:integer;
  descuento,precio,total,impuesto:real;
  promo_5,promo_10:boolean;


begin
  descuento:=0;
  total:=0;
  promo_5:=false;
  promo_10:=false;
  writeln('Bienvenido que marca de computadora desea comprar?');
  writeln('1 - LG');
  writeln('2 - Samsung');
  writeln('3 - IBM');
  writeln('4 - Dell');
  writeln('5 - lenovo');
  read(desicion);

  case desicion of
  3:promo_5:=true;
  end;

  writeln('Que modelo de computadora desea comprar?');
  writeln('1 - Basica: 600000Bs');
  writeln('2 - Estandar: 900000Bs');
  writeln('3 - Profesional 1200000Bs');
  writeln('4 - Gamer: 3000000Bs');
  read(desicion);

  case desicion of
  1:precio:=600000;
  2:precio:=900000;
  3:precio:=1200000;
  4:precio:=3000000;
  end;

  if precio>1000000 then
    promo_10:=true;

  if promo_10=true then
    descuento:=descuento+10;   // verificar cual promo estan habilitadas
  if promo_5=true then
    descuento:=descuento+5;  // verificar cual promo estan habilitadas

  descuento:=(descuento*0.01); // colocar descuento en porcentaje
   impuesto:=precio*iva; // obteniendo iva
  precio:=precio+impuesto; // calculando precio con iva
  descuento:=precio*descuento; // aplicando el descuento
  total:=(precio-descuento); // aplicando restando el descuento
  writeln('Usted debe pagar: ',total:2:2);

  readkey;

end.

