//1.  Se  desea  calcular  el  salario  neto  semanal  de  un  trabajador  en  función  del  número
//de horas trabajadas y la tasa de impuestos d acuerdo a lo siguiente:
//- Las primeras 35 horas se pagan a tarifa normal
//- Las horas que pasen de 35 se pagan a 1.5 veces la tarifa normal
//- Las tasas de impuesto son:
//- Los rimeros 50$ son libres de impuesto
//- Los siguientes 40$ tienen un 25% de impuesto
//- Los restantes un 45% de impuesto
//Se pide mostrar el nombre del trabajador, salario bruto, tasas y salario neto.

program Salario;
uses crt;
VAR
  nombre:string[20];
  horas,tarifa,salarioBruto,salarioNeto,impuesto:real;

begin
  writeln('Ingrese el nombre del trabajador');
  readln(nombre);
  writeln('Ingrese las horas trabajadas');
  readln(horas);
  writeln('Ingrese la tarifa');
  readln(tarifa);
  if (horas<=35) then
  begin
    salarioBruto:=horas*tarifa;
  end
  else
    begin
    salarioBruto:=(35*tarifa)+(horas-35)*1.5*tarifa;
    end;
  if salarioBruto<=50 then
  begin
    impuesto:=0;
  end
  else
     if (salarioBruto>50) and (salarioBruto<=90) then
     begin
       impuesto:=(salarioBruto-50)*0.20
     end
     else
       if (salarioBruto>90) then
       begin
         impuesto:=((40*0.20)+((salarioBruto-90)*0.30))
       end;
  salarioNeto:=salarioBruto-impuesto;
  writeln('Nombre del trabajador es ',nombre);
  writeln('Salario bruto es de ',salarioBruto:0:2);
  writeln('La tarifa salarial es de ',tarifa:0:2);
  writeln('El salario neto es de ',salarioNeto:0:2);
  readkey;
end.

