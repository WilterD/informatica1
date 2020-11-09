program magia;
Uses Crt;
Var
	cuadrado: Array [1..49, 1..49] of Integer;
	orden, i, j, num: integer;
	mitad: Integer;

// este era el origen de todos los problemas, fue una locura resolverlo
Procedure ejeY(var j: Integer);
	Begin
		j:=j+1;
		if j=orden+1 Then
			j:=1;

		j:=j+1;
		if j=orden+1 Then
			j:=1;

		if j=0 then
			j:=orden;
	End;

Begin
	// repite hasta que se ingrese un orden impar
	Repeat
		Write('> Ingrese el orden del cuadrado (debe ser impar): ');
		Readln(orden);
	until (orden mod 2) <> 0;

	// inicializacion
	for j:=1 to orden Do
		for i:=1 to orden Do
			cuadrado[i,j]:=0;

	{mitad:=round(orden/2+0.5);
	cuadrado[mitad, 1]:=1;}

	for i:=1 to (orden) Do
		if i=orden/2+0.5 Then
			Begin
				mitad:=i;
				cuadrado[mitad,1]:=1;
			End;

	j:=1;
	i:=mitad;
	for num:=2 to orden*orden Do
		Begin
			// eje y
			j:=j-1;
			if j=0 then
				j:=orden;

			// eje x
			i:=i+1;
			if i=orden+1 Then
				i:=1;

			if cuadrado[i,j]=0 Then
				cuadrado[i,j]:=num

			// si la posicion ya esta ocupada entonces
			Else
				Begin
					// eje x
					i:=i-1;
					
					if i=0 Then
						i:=orden;
						
					if i=orden+1 Then
						i:=1;
					
					// eje y
					ejeY(j);

					cuadrado[i,j]:=num;
				End;

		End;
	
	// imprime el arreglo
	for j:=1 to orden Do
		Begin
			WriteLn;
			for i:= 1 to orden Do
				write(cuadrado[i,j], ' | ');
		End;

	ReadKey;

End.