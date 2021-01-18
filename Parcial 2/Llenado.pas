program Llenado;
uses crt;

type
    tMatrix = array [0..10, 0..10] of integer;
var
    i, j, n, counter: integer;
    M: tMatrix;
begin
    writeln('Ingrese el orden de la matriz');
    readln(n);
    counter := 1;
    for i := n - 1 downto 0 do begin
        for j := n - 1 downto 0 do
            if not((i+j >= n div 2) and (n div 2 >= j-i) and (n div 2 >= i-j) and (i+j <= n div 2 + n - 1)) then begin
                M[j, i] := counter;
                counter := counter + 1;
            end;
    end;

    for i := 0 to n - 1 do begin
        for j := 0 to n - 1 do begin
            if M[i, j] < 10 then
                write(' 0', M[i,j])
            else
                write(' ', M[i,j])
        end;
        writeln;
    end;
    readkey;
end.
