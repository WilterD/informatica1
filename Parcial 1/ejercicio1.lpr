program project1;
uses crt;
Var
	num1, num2, i, resultado: integer;
	num3: real;
	par: Boolean;
Begin
		/// Inicializacion
	num1:=0;
	num2:=0;
	resultado:=0;

	write('> Ingrese el multiplicando: ');
	Readln(num1);
	WriteLn;
	Write('> Ingrese el multiplicador: ');
	Readln(num2);
	WriteLn;
	Repeat
		if (num1 mod 2)=0 then // si es par
			par:=True;

		if par=True then
			write('   ', num1, '    ', num2, '   (Eliminado)')  /// Si es par no tomamos este numero
		Else
			Begin
				write('   ', num1, '    ', num2);	/// Como no es par lo agregamos al resultado
				resultado:=resultado+num2;
			End;

		num1:=(num1 div 2); // realizar division
		num2:=num2*2;  // ir haciendo su doble en cada vuelta
		par:=False;
		writeln;
	Until num1=0;
	WriteLn;
	WriteLn;
	Writeln('> El resultado es: ', resultado);
	ReadKey;
End.

