{7. Realizar un programa que permita: 
a) Crear un archivo binario a partir de la información almacenada en un archivo de 
texto. El nombre del archivo de texto es: “novelas.txt”. La información en el 
archivo de texto consiste en: código  de novela, nombre, género y precio de 
diferentes novelas argentinas. Los datos de cada novela se almacenan en dos 
líneas en el archivo de texto. La primera línea contendrá la siguiente información: 
código novela, precio y género, y la segunda línea almacenará el nombre de la 
novela. 
b) Abrir el archivo binario y permitir la actualización del mismo. Se debe poder 
agregar una novela y modificar una existente. Las búsquedas se realizan por 
código de novela. 
NOTA: El nombre del archivo binario es proporcionado por el usuario desde el teclado. }

program ejercicio7p1;
type
	
	novela = record
		codigo:integer;
		nombre:string;
		genero:string;
		precio:real;
	end;

	archivo_novelas = file of novela;

//Modulos

procedure leerNovela(var n:novela);
begin
	write('Ingrese el codigo de novela: ');readln(n.codigo);
	if(n.codigo<>0)then begin
		write('Ingrese el nombre de novela: ');readln(n.nombre);
		write('Ingrese el genero de novela:');readln(n.genero);
		write('Ingrese el precio de novela:');readln(n.precio);
	end;
end;


procedure crearArchivo(var novelas:archivo_novelas ; var archText:text);
var
	n:novela;
	nom:string;
begin
	writeln('-----Opcion 1-----');
	write('Ingrese el nombre del archivo: '); readln(nom);
	assign(novelas,nom);
	rewrite(novelas);
	reset(archText);
	while(not EOF(archText)) do begin
		readln(archText,n.codigo,n.precio,n.genero);
		readln(archText,n.nombre);
		write(novelas,n);
	end;
	writeln('Archivo cargado');
	close(archText);close(novelas);
end;

procedure agregarNovela(var novelas:archivo_novelas);
var
	n:novela;
begin
	writeln('-----Opcion 2-----');
	reset(novelas);
	leerNovela(n);
	seek(novelas,fileSize(novelas));	//Pongo el puntero en la ultima posicion
	while(n.codigo<>0)do begin
		write(novelas,n);
		leerNovela(n);
	end;
	close(novelas);
end;

procedure modificarNovela(var novelas:archivo_novelas);
var
	encontre:boolean;
	n:novela;
	cod:integer;
begin
	writeln('-----Opcion 3-----');
	reset(novelas);
	encontre:=false;
	write('Ingrese el codigo de novela que quiere modificar: ');readln(cod);
	while((not EOF(novelas)) and (not encontre))do begin
		read(novelas,n);
		if(n.codigo = cod)then begin
			leerNovela(n);
			seek(novelas,filePos(novelas)-1);	//pongo el puntero donde esta menos uno porque cuando lee avanza uno
			write(novelas,n);
			writeln('Se modifico la novela con el codigo ',cod);
			encontre:=true;
		end;
	end;
	if(not encontre)then
		writeln('No se encontro la novela con codigo ',cod);
	close(novelas);
end;

procedure menu (var novelas:archivo_novelas);
var
	archText:text;
	opcion:integer;
begin
	assign(archText,'novelas.txt');
	writeln('-----MENU DE OPCIONES-----');
	writeln('Opcion 1:Crear un archivo binario a partir de la informacion almacenada en un archivo de texto novelas.txt');
	writeln('Opcion 2:Agregar una novela');
	writeln('Opcion 3:Modificar una novela');
	readln(opcion);
	while(opcion<>4)do begin
		case opcion of
			1: crearArchivo(novelas,archText);
			2: agregarNovela(novelas);
			3: modificarNovela(novelas);
		else
			writeln('Opcion no valida');
		end;
		writeln('Opcion 1:Crear un archivo binario a partir de la informacion almacenada en un archivo de texto novelas.txt');
		writeln('Opcion 2:Agregar una novela');
		writeln('Opcion 3:Modificar una novela');
		readln(opcion);
	end;
	crearArchivo(novelas,archText);
end;

//Programa Principal

var
	novelas:archivo_novelas;
begin
	menu(novelas);
end.
