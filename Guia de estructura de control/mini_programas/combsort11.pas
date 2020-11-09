Program combsort;
uses Crt;
Var
	brecha, i, aux: Integer;
	cambio: Integer;
	clasificacion: array [1..6] of integer;
	
Begin
	clasificacion[1]:=6;    (* ejemplo *)
	clasificacion[2]:=3;    (* la salida a mostar estara de menor a mayor *)
	clasificacion[3]:=13;
	clasificacion[4]:=2;
	clasificacion[5]:=10;
	clasificacion[6]:=8;

	brecha:=6; (* longitud del arreglo *)
	cambio:=0;
	
	Repeat
		(* actualizacion de la brecha para el rastreo *)
		if brecha>1 Then
			Begin
				brecha:=Trunc(brecha/1.3);   {iniciamos la brecha dividiendo entre el factor de encogimiento, redondeamos hacia abajo}
				if (brecha=9) or (brecha=10) Then  {si la brecha llegara a ser 9 o 10 se pueden hacer mejoras en la}
					brecha:=11;                      		{velocidad si se establace como 11, de aqui el nombre de combsort11}
		 	End;
			
		i:=1;
		cambio:=0;

		while (i+brecha <= 6) Do
			Begin
				if (clasificacion[i] > clasificacion[i+brecha]) Then	(* comparo *)
					Begin
						aux:=clasificacion[i+brecha];                      (* guardo en una auxiliar *)
						clasificacion[i+brecha]:=clasificacion[i];	(* cambio al menor *)
						clasificacion[i]:=aux;               (* cambio al mayor *)
						cambio:=cambio+1;                           (* sumo 1*)
					End;

					i:=i+1;		(* subimos el indice *)
			End;
	Until (brecha=1) and (cambio=0);

	for i:=1 to 6 Do
		WriteLn(clasificacion[i]);
End.
