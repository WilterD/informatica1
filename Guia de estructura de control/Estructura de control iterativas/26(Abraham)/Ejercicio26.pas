program Ejercicio26;
Uses crt;
Var Min, seg:integer;
    V, T:real;

begin
  Repeat
    Writeln('Ingrese la cantidad de minutos');
    Readln(Min);
    writeln('Ingrese la cantidad de segundos');
    Readln(Seg);

    T:=(Min*60+seg);
    V:=(1500/T);
    Writeln('La velocidad es: ',V:2:0,', ',T:0:2);
  until (Min=0) and (Seg=0);
end.

