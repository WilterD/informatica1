program cuenta;
        var
           x,c,aux:integer;
        begin
             repeat
                   write ('Nuevo numero: ');
                   read(x);
                   aux:=1;
                   c:=0;
                   repeat
                         c:=c+1;
                         aux:=aux*10
                   until abs(x)<aux;
                   writeln ('El numero ',x,' esta formado por ',c,' digitos');
             until x=0
        end.
