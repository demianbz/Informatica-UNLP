program intento;
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
	nom_fisico: string;
	num: integer;
begin
	write('Ingrese el nombre del Archivo: '); readln(nom_fisico);
	assign(enteros,nom_fisico);	//Enlace entre el nom logico y el nom fisico
	rewrite(enteros);	//Apertura del archivo para la creacion
	write('Ingrese un numero entero: '); readln(num);
	while(num<>3000)do begin
		write(enteros,num);	//Escritura del registro
		write('Ingrese un nuevo numero o 3000 para finalizar: '); readln(num);
	end;
	close(enteros);
	reset(enteros);				//abro el archivo existente
	procesarArchivo(enteros);	//hago lo que me pide el enunciado
	close(enteros);				//cierro el archivo
end.
