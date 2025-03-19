{2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados 
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el 
promedio de los números ingresados. El nombre del archivo a procesar debe ser 
proporcionado por el usuario una única vez.  Además, el algoritmo deberá listar el 
contenido del archivo en pantalla.}

program ej2p2;
type
	
	archivo_enteros = file of integer;

//Modulos

procedure procesarArchivo(var enteros:archivo_enteros);
var
	num:integer;
	total:integer;
	cant1500:integer;
	promedio:real;
begin
	cant1500:=0;
	promedio:=0;
	total:=0;
	while(not EOF(enteros))do begin
		read(enteros,num);
		writeln(num);	
		if(num<1500)then	
			cant1500:=cant1500+1;
		total:= total + num;
	end;
	promedio:= total / filesize(enteros);
	writeln('La cantidad de numeros menores a 1500 son: ',cant1500);
	writeln('El promedio de los numeros ingresados es: ',promedio:2:2);
end;



	
//Programa principal

var
	enteros: archivo_enteros;
	nom_fisico:string;
begin
	write('Ingrese el nombre del Archivo: '); readln(nom_fisico);
	assign(enteros,nom_fisico);	//Enlace entre el nom logico y el nom fisico
	reset(enteros);		//Abro el archivo EXISTENTE

	procesarArchivo(enteros);
	
	
	close(enteros);
end.
