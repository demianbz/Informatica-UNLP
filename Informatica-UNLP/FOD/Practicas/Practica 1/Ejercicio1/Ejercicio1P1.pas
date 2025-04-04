{1. Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita 
incorporar datos al archivo. Los números son ingresados desde teclado. La carga finaliza 
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del 
archivo debe ser proporcionado por el usuario desde teclado. }

program ej1P1;
type
	
	archivo_enteros = file of integer;
	
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
end.
