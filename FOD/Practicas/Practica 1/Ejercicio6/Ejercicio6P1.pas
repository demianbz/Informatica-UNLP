{6. Agregar al menú del programa del ejercicio 5, opciones para: 
a. Añadir uno o más celulares al final del archivo con sus datos ingresados por teclado. 
b. Modificar el stock de un celular dado. 
c. Exportar el contenido del archivo binario a un archivo de texto denominado: ”SinStock.txt”, con aquellos celulares que tengan stock 0. 
NOTA: Las búsquedas deben realizarse por nombre de celular. }

program ejercicio6P1;
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

procedure leerCelular (var c:celular);
begin
	write('Ingrese el codigo: ');readln(c.codigo);
	write('Ingrese el nombre: ');readln(c.nombre);
	write('Ingrese la descripcion: ');readln(c.descripcion);
	write('Ingrese la marca: ');readln(c.marca);
	write('Ingrese el precio: ');readln(c.precio);
	write('Ingrese el Stock minimo: ');readln(c.stockMin);
	write('Ingrese el Stock disponible: ');readln(c.stockDisp);					
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

procedure agregarCelulares(var celulares:archivo_celulares);
var
	c:celular;
begin
	writeln('-----Opcion 5-----');
	reset(celulares);
	leerCelular(c);
	seek(celulares,fileSize(celulares));	//establece la posicion del puntero en el fin del archivo
	while(c.nombre<>'fin')do begin
		write(celulares,c);
		leerCelular(c);
	end;
	close(celulares);
end;

procedure modificarStock(var celulares:archivo_celulares);
var
	c:celular;
	nom:string;
	encontre:boolean;
	stock:integer;
begin
	writeln('-----Opcion 6-----');
	reset(celulares);
    writeln('Ingrese el nombre del celular que va a modificar su stock');
    readln(nom);	
    encontre:=false;
    while((not EOF(celulares)) and (not encontre))do begin
		read(celulares, c);
        if(c.nombre = nom) then begin
			encontre:= true;
            write('Ingrese el nuevo stock del celular');readln(stock);
            seek(celulares, filepos(celulares)-1);//pongo el puntero en donde esta menos 1 porque cuando lee avanza
            c.stockDisp:= stock;
            write(celulares, c);	//escribo el archivo con el registro modificado
            writeln('Se modifico el stock del celular con nombre: ', nom);
        end;
    end;
    if(not encontre)then
		writeln('No se encontro el celular con nombre: ',nom);
	close(celulares);
end;

procedure exportarSinStock(var celulares: archivo_celulares);
var
	c:celular;
	archText:text;
begin
	writeln('-----Opcion 7-----');
	reset(celulares);
	assign(archText,'SinStock.txt');
	rewrite(archText);
	while(not EOF(celulares))do begin
		read(celulares,c);
		if(c.stockDisp = 0)then begin
			writeln(archText, c.codigo, ' ', c.precio:0:2, ' ', c.marca);
			writeln(archText, c.stockDisp, ' ', c.stockMin, ' ', c.descripcion);
			writeln(archText, c.nombre);
			writeln('El contenido se exporto correctamente');
		end;
	end;
	close(celulares);close(archText);	
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
	writeln('Opcion 5:Agregar uno o mas celulares al final del archivo con sus datos ingresados por teclado');
	writeln('Opcion 6:Modificar el stock de un celular dado');
	writeln('Opcion 7:Exportar el contenido del archivo binario a un archivo de texto SinStock.txt, con los celulares con stock = 0');
	readln(opcion);
	writeln;
	while(opcion<>8)do begin
		case opcion of
			1:crearArchivo(celulares);
			2:imprimirStockMenor(celulares);
			3:imprimirCeluDesc(celulares);
			4:exportaraTexto(celulares);
			5:agregarCelulares(celulares);
			6:modificarStock(celulares);
			7:exportarSinStock(celulares);
		else
			writeln('Opcion no valida');
		end;
		writeln;
		writeln('----MENU DE OPCIONES----');
		writeln('Opcion 1:Crear un archivo de celulares y cargarlo desde un archivo de texto denominado celulares.txt');
		writeln('Opcion 2:Listar en pantalla los datos de aquellos celulares que tengan un stock menor al stock minimo');
		writeln('Opcion 3:Listar en pantalla los celulares del archivo cuya descripcion contenga una cadena de caracteres elegida');
		writeln('Opcion 4:Exportar el archivo creado a un texto celulares.txt');
		writeln('Opcion 5:Agregar uno o mas celulares al final del archivo con sus datos ingresados por teclado');		
		writeln('Opcion 6:Modificar el stock de un celular dado');
		writeln('Opcion 7:Exportar el contenido del archivo binario a un archivo de texto SinStock.txt, con los celulares con stock = 0');
		readln(opcion);
	end;
end;



//Programa Principal

var
	celulares:archivo_celulares;
begin
	menu(celulares);
end.
