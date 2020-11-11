//13. Los trabajadores de una fabrica de autos tiene tres turnos: mañana, noche y
//festivos. Se desea calcular el sueldo semanal a razón de 5 días de trabajo a la semana
//según la siguiente tarifa:
// 600 Ptas./hora turno de la mañana
// 800 Ptas./hora turno de la tarde
//1000 Ptas./hora día festivo.
//Se debe leer el turno y el número de horas trabajadas.
program Salario_Semanal;
uses crt;
var
 horas, dias, Salario, SalSem: integer;
 turno: char;
begin
 dias:= 0; {Contador de dias}
 SalSem:= 0;   {Acumulador de pesetas por dias}
 while dias < 6 do
  begin
    dias:=(dias + 1);
    writeln('Ingrese las horas trabajadas');
    readln(horas);
    writeln('Pulse 1 para turno mañana, 2 para la tarde, 3 festivo');
    readln(turno);
    if (turno = '1') then
      begin
        Salario:=(horas * 600);
        SalSem:=(SalSem + Salario);
      end
    else
      begin
        if (turno = '2') then
          begin
            Salario:=(horas * 800);
            SalSem:=(SalSem + Salario);
          end
        else
         begin
           if (turno = '3') then
             begin
               Salario:=(horas * 1000);
               SalSem:=(SalSem + Salario);
             end
           else
             begin
               writeln('Turno Invalido');
             end;
         end;
      end;
  end;
 writeln('El trabajador a razon de 5 dias cobra:', SalSem, 'ptas');
 ReadKey;
end.   
