{5. Realizar un programa para una tienda de celulares, que presente un menú con 
opciones para: 
a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos 
ingresados desde un archivo de texto denominado “celulares.txt”. Los registros 
correspondientes a los celulares deben contener: código de celular, nombre, 
descripción, marca, precio, stock mínimo y stock disponible. 
b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al 
stock mínimo. 
c. Listar en pantalla los celulares del archivo cuya descripción contenga una 
cadena de caracteres proporcionada por el usuario. 
d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado 
“celulares.txt” con todos los celulares del mismo. El archivo de texto generado 
podría ser utilizado en un futuro como archivo de carga (ver inciso a), por lo que 
debería respetar el formato dado para este tipo de archivos en la NOTA 2. 
NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el 
usuario. 
NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique 
en tres  líneas consecutivas. En la primera se especifica: código de celular,  el precio y 
marca, en la segunda el stock disponible, stock mínimo y la descripción y en la tercera 
nombre en ese orden. Cada celular se carga leyendo tres líneas del archivo 
“celulares.txt”.}

program ejercicio5P1;
type

	celular = record
		codigo:integer;
		nombre:string;
		descripcion:string;
		marca:string;
		precio:real;
		stockMin:integer;
		stockDisp:integer;
	end;

	archivo_celulares = file of celular;
	

//Modulos

procedure imprimirCelular(c: celular);
begin
	writeln('Codigo: ', c.codigo, ' Nombre: ', c.nombre, ' Descripcion:', c.descripcion, ' Marca:', c.marca, ' Precio:', c.precio:0:2, ' StockMin:', c.stockMin, ' Stock:', c.stockDisp);
end;


procedure crearArchivo (var celulares:archivo_celulares);
var
	c:celular;
	archText:text;
	nom:string;
begin
	writeln('-----Opcion 1-----');
	assign(archText,'celulares.txt');
	reset(archText);
	write('Ingrese un nombre para el archivo de celulares: ');readln(nom);
	assign(celulares,nom);	
	rewrite(celulares);
	while(not EOF(archText))do begin
		Readln(archText,c.codigo,c.precio,c.marca);
		Readln(archText,c.stockDisp,c.stockMin,c.descripcion);
		Readln(archText,c.nombre);
		write(celulares,c);
	end;
	writeln('El archivo se creo correctamete');
	close(celulares);close(archText);
end;

procedure imprimirStockMenor(var celulares: archivo_celulares);
var
	c:celular;
begin
	writeln('-----Opcion 2-----');
	reset(celulares);
	while(not EOF(celulares))do begin
		read(celulares,c);
		if(c.stockDisp<c.stockMin)then
			imprimirCelular(c);
	end;
	close(celulares);
end;

procedure imprimirCeluDesc(var celulares:archivo_celulares);
var
	c:celular;
	desc:string;
begin
	writeln('-----Opcion 3-----');
	reset(celulares);
	write('Ingrese la descripcion elegida: ');readln(desc);
	while(not EOF(celulares))do begin
		read(celulares,c);
		if(desc = c.descripcion)then
			imprimirCelular(c);
	end;
	close(celulares);
end;

procedure exportaraTexto(var celulares: archivo_celulares);
var
	c:celular;
	archText:text;
begin
	writeln('-----Opcion 4-----');	
	reset(celulares);
	assign(archText,'celulares.txt');
	rewrite(archText);
	while(not EOF(celulares))do begin
		read(celulares,c);
		writeln(archText,c.codigo,' ',c.precio,' ',c.marca);
		writeln(archText,c.stockDisp,' ',c.stockMin,' ',c.descripcion);
		writeln(archText,c.nombre);
	end;
	close(celulares);close(archText);
	writeln('El archivo se exporto correctamente');
end;

procedure menu(var celulares: archivo_celulares);
var
	opcion:integer;
begin
	writeln('----MENU DE OPCIONES----');
	writeln('Opcion 1:Crear un archivo de celulares y cargarlo desde un archivo de texto denominado celulares.txt');
	writeln('Opcion 2:Listar en pantalla los datos de aquellos celulares que tengan un stock menor al stock minimo');
	writeln('Opcion 3:Listar en pantalla los celulares del archivo cuya descripcion contenga una cadena de caracteres elegida');
	writeln('Opcion 4:Exportar el archivo creado a un texto celulares.txt');
	readln(opcion);
	writeln;
	while(opcion<>5)do begin
		case opcion of
			1:crearArchivo(celulares);
			2:imprimirStockMenor(celulares);
			3:imprimirCeluDesc(celulares);
			4:exportaraTexto(celulares);
		else
			writeln('Opcion no valida');
		end;
		writeln;
		writeln('----MENU DE OPCIONES----');
		writeln('Opcion 1:Crear un archivo de celulares y cargarlo desde un archivo de texto denominado celulares.txt');
		writeln('Opcion 2:Listar en pantalla los datos de aquellos celulares que tengan un stock menor al stock minimo');
		writeln('Opcion 3:Listar en pantalla los celulares del archivo cuya descripcion contenga una cadena de caracteres elegida');
		writeln('Opcion 4:Exportar el archivo creado a un texto celulares.txt');
		readln(opcion);
	end;
end;



//Programa Principal

var
	celulares:archivo_celulares;
begin
	menu(celulares);
end.
