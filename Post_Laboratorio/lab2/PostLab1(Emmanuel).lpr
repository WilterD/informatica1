//Cierta  Universidad  tiene  un  programa  para  estimular  a  los  estudiantes  con  buen  rendimiento
//académico.  Si  el  promedio  es  de  15.5  o  más  y  el  alumno  es  de  pregrado  entonces  cursará  28
//créditos y se le hará un 20% de descuento. Si el promedio es mayor o igual  a 14.0 pero menor que
//15.5 y el alumno es de pregrado, entonces cursará 25 créditos y se le hará un 10% de descuento.
//Si el promedio es mayor o igual a 12.5 y menor que 14.0 y es de pregrado, cursará 20 créditos y
//no tendrá  ningún descuento. Si el promedio  es  mayor o igual a 10.0  y  menor que  12.5 y  es de
//pregrado, cursará 15 créditos y no tendrá descuento. Si el promedio es menor de 10.0 y es de
//pregrado, no podrá matricularse. Si el promedio es mayor o igual a 4.5 y es de postgrado, cursará
//20 créditos y se le hará un 20% de descuento. Si el promedio es menor de 4.5 y es de postgrado
//cursará 10 créditos y no tendrá descuento. Hacer un algoritmo que determiné cuánto debe pagar
//un  estudiante  y  cuántos  créditos  registra  si  el  valor  de  cada  crédito  es  de  Bs.  150.000  para
//pregrado y Bs. 300.000 para postgrado.

program PostLab1;
uses crt;
  var
    grado:string[20];
    promedio,descuento,porcentaje,valorTotal:real;
    Uc,monto,valor1,valor2:integer;

begin
  valor1:=150000; //costo de la UC para pregrado
  valor2:=300000; //Costo de la UC para postgrado
  writeln('Ingrese su promedio academico');
  readln(promedio);
  writeln('Ingrese el grado de estudio a cursar postgrado o pregrado');
  readln(grado);

//**************************Procedimiento para Pregrado**********************

    if (grado='pregrado') or (grado='Pregrado') then
    begin
      if (promedio>=15.5) then
      begin
       Uc:=28;
       porcentaje:=20/100;
      end
      else
        if (promedio>=14.0) and (promedio<15.5) then
        begin
          Uc:=25;
          porcentaje:=10/100;
        end
        else
          if (promedio>=12.5) and (promedio<14.0) then
          begin
           Uc:=20;
           porcentaje:=0;
          end
          else
            if (promedio>=10.0) and (promedio<12.5) then
            begin
              Uc:=15;
              porcentaje:=0;
            end
            else
             if (promedio<10.0) then
             begin
               writeln('No cumples los requisitos minimo para matricularte');
               Uc:=0;
               porcentaje:=0;
             end;
    monto:=valor1*Uc;
    descuento:=monto*porcentaje;
    ValorTotal:=monto-descuento;
    end;

//***************************Procedimiento para Postgrado*********************
    if (grado='postgrado') or (grado='Postgrado') then
    begin
      if (promedio>=4.5) then
      begin
       Uc:=20;
       porcentaje:=20/100;
      end
      else
        if (promedio<4.5) then
        begin
         Uc:=10;
         Porcentaje:=0;
        end;
    monto:=Valor2*Uc;
    descuento:=monto*porcentaje;
    ValorTotal:=monto-descuento;
    end;
//***************************Salida********************************************
    writeln('Las unidades de credito a cursar son: ',Uc);
    writeln('El monto total a pagar es de ',ValorTotal:0:2);
    readkey;

end.

