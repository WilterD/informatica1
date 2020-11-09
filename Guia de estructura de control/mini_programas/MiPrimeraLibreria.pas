(* En Lazarus si queremos crear una libreria basta con que vayamos a
Archivo y luego click en Nueva Unidad*)

(* La Unit sera el nombre de la libreria por la cual nosotros la llamamos *)
unit MiPrimeraLibreria;

{$mode objfpc}{$H+}   (* No se que es esto pero no me ha dado problemas *)

interface
 (* La interface, o dominio publico, es el puente que conecta al programa
   principal con la libreria, aqui pueden adjuntar mas librerias si son
   necesarias asi como tambien definir variables *)

 (* Pueden dejar esta parte para el final e ir directos a la implementacion *)
uses
  crt;

{type}  // por si necesitan usar tipo de datos aqui los declaran

var   // por si desean usar variables aqui es donde las declaras
  a, i, j, k: integer;
  salir: boolean;
  arreglo: array [1..9, 1..9] of integer;

  (* si sus subprogramas todos usan las mismas variables pueden ahorrarse el
    declararlas en cada uno de los subprogramas haciendolo directamente aqui*)

(* aqui facilmente lo que hacen es copiar la cabezera de su subprograma *)
  Procedure muestraE1(cedula: Integer);

implementation
  (* La implementacion, o dominio privado, son todas las funciones y procedimientos
   que almecenara la libreria, literalmente puedes hacer un copia y pega de tus
   subprogramas en el codigo principal y almacernarlos aqui*)

  (* Adjunto un ejemplo de la implementacion, como pueden ver es sencillamente
   un copia y pega de uno de mis subprogramas *)
  Procedure muestraE1(cedula: Integer);
	  Begin
			  // iniciacilazion
			  for k:=1 to cedula Do
				  for i:=1 to cedula Do
					  arreglo[k,i]:=0;

			  a:=2;
			  j:=1;		// este es el contador que le asignare a las posiciones
			  k:=1;		// esta la altura en la matriz
			  salir:=False;

			  while salir=False Do
				  Begin
					  for i:=a to cedula Do
						  Begin
							  arreglo[k,i]:=j;
							  j:=j+1;
						  End;

					  a:=a+1;
					  k:=k+1;

					  if k = cedula Then
						  salir:=True;
				  End;

        // impresion de la tabla
        writeln('Holaaaaa');
        for k:=1 to cedula Do
				  Begin
					  WriteLn;
					  for i:=1 to cedula Do
						  if arreglo[i,k] = 0 then
							  Write('     ')
						  Else
							  if arreglo[i,k] >= 10 then
								  Write(' |', arreglo[i,k], '|')
							  Else
								  Write(' |0', arreglo[i,k], '|');
				  End;

				  WriteLn;
	  End;

End.

