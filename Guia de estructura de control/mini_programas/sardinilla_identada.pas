Program sardinilla;
Uses crt;
Type
	registro = Record // registro donde guardare la posicion de en los ejes
		abscisa: Shortint;  // eje x
		ordenada:	Shortint; // eje y
	End;

	arreglo = Array [1..8] of registro; // un arreglo de registros
Var
	dato: String[2]; // ubicacion inicial del caballo (ejem: A6)
	i: Integer;
	movimientos: arreglo; // los movimientos posibles

Function posicion(dato: String): registro;  // valido la posicion inicial para guardarla en el registro
Var
	salir: Boolean;
	Begin
		salir:=False;
		Repeat // si la letra esta entre A y H (ascii) y el numero entre 1 y 8 (ascii) entonces
			if ((ord(dato[1]) >= 65)) and ((ord(dato[1]) <= 72)) and ((ord(dato[2]) >= 49)) and ((ord(dato[2]) <= 57))Then
				Begin
					posicion.abscisa:=ord(dato[1])-64;	// valor para la abscisa, quito el excedente y dejo el numero del 1-8
					posicion.ordenada:=ord(dato[2])-48;	// valor para la ordenada, quito el excedente y dejo el numero del 1-8
					salir:=True;
				End

			Else
				Begin
					WriteLn;
					WriteLn('> Ha ingresado una posicion invalida');
					WriteLn('> La dimensiones del tablero son de 8*8');
					Write('> Ingrese la posicion del caballo: ');
					Readln(dato);
				End;

		Until salir=True;

	End;

Function posibles(posicion: registro): arreglo; // subrutina que guarda los 8 movimientos posibles del caballo
	Begin
			for i:=1 to 8 Do
					case i of
							1:
								Begin
									posibles[i].abscisa:=posicion.abscisa+1;
									posibles[i].ordenada:=posicion.ordenada+2;
								End;
							2:
								Begin
									posibles[i].abscisa:=posicion.abscisa+2;
									posibles[i].ordenada:=posicion.ordenada+1;
								End;
							3:
								Begin
									posibles[i].abscisa:=posicion.abscisa+2;
									posibles[i].ordenada:=posicion.ordenada-1;
								End;
							4:
								Begin
									posibles[i].abscisa:=posicion.abscisa+1;
									posibles[i].ordenada:=posicion.ordenada-2;
								End;
							5:
								Begin
									posibles[i].abscisa:=posicion.abscisa-1;
									posibles[i].ordenada:=posicion.ordenada-2;
								End;
							6:
								Begin
									posibles[i].abscisa:=posicion.abscisa-2;
									posibles[i].ordenada:=posicion.ordenada-1;
								End;
							7:
								Begin
									posibles[i].abscisa:=posicion.abscisa-2;
									posibles[i].ordenada:=posicion.ordenada+1;
								End;
							8:
								Begin
									posibles[i].abscisa:=posicion.abscisa-1;
									posibles[i].ordenada:=posicion.ordenada+2;
								End;
					End;
	End;
Begin
	Write('> Ingrese la posicion del caballo (ejem: A8): ' );
	Readln(dato);
	movimientos:=posibles(posicion(dato));
	// invoco a posicion y le paso como parametro a dato, a su vez tambien invoco a posibles y le paso a posicion, el resultado lo guardo en movimientos
	
	For i:=1 to 8 Do
		with movimientos[i] do // esta funcion hace que no tenga que escribir movimientos.(blablabla) a todo
			if (ord(abscisa+64) >= 65) and (ordenada >= 1) and (ord(abscisa+64) <= 72) and (ordenada <= 8) then
					writeln(chr(ord(abscisa+64)), ordenada)
End.