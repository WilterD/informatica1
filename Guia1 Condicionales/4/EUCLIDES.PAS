{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

program EuclidesAl;

{*******************************VARIABLES************************************}
var
   m,n,menor,mayor:longint;

{***********************PROCEDIMIENTOS Y FUNCIONES***************************}
function Euclides(k{menor},L{moyor}:Longint):longint;
var r:longint;
begin
    r:=L mod k;
    if r > 0 then begin
       Euclides:=Euclides(r,trunc((L-r)/(L div k)));{parte recursiva}
    end else
       Euclides:=trunc((L-r)/(L div k));
end;
{------------------------------}
procedure Ordena(t,w:longint);
begin
   if t<=w then begin mayor:=m; menor:=n end else begin
      mayor:=n; menor:=m;
   end;
end;
{------------------------------}
procedure info;
begin
   Writeln('El programa calcula el mcd mediante el algoritmo de Euclides');
   Writeln('Compute dos n£meros enteros');
end;

{****************************PROGRAMA PRINCIPAL******************************}
begin
   info;{Muestra informaci¢n para el usuario}
   readln (n,m);
   Ordena(n,m);{ordena a n y m de menor a mayor}
   Writeln;
   writeln('mcd(',n,',',m,') = ',Euclides(menor,mayor));{lo escribo con el
   formato tradicional}
end.
  (*
  ALGORITMO
  Sean m y n dos n£meros naturales y sea m > n. Designemos mediante m1 y r1
  respectivamente el cociente y el resto de la divisi¢n de m entre n:

                m = n*m1 + r1,   0<= r1 < n

  Si resulta que r1 > 0, entonces dividamos n entre r1, designando mediante
  m2 y r2 respectivamente el cociente y el resto de la divisi¢n:

                n = r1*m2 + r2,   0<= r2 < r1

  Si r2 a£n no es 0, dividamos r1 entre r2 y obtenemos an logamente

                r1 = r2*m3 + r3,   0<= r3 < r2

  Puesto que n, r1, r2, r3, ... son n£meros naturales y n>r1>r2>r3>...,
  entonces el proceso de divisi¢n despu‚s de un n£mero finito de pasos debe
  cesarse, es decir, debemos obtener un resto igual a cero. Supongamos que
  tal resto sea rn+1 = 0, puesto que

                      rn-2 = rn-1*mn+1

  El numero natural rn es el mcd de los numeros m y n. Para convencerse de
  esto se puede consultar las demostraciones expuestas en las referencias.
*)

