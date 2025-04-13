{2. El encargado de ventas de un negocio de productos de limpieza desea administrar el stock 
de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los 
productos que comercializa. De cada producto se maneja la siguiente información: código de 
producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se 
genera un archivo detalle donde se registran todas las ventas de productos realizadas. De 
cada venta se registran: código de producto y cantidad de unidades vendidas. Se pide 
realizar un programa con opciones para: 
a. Actualizar el archivo maestro con el archivo detalle, sabiendo que: 
● Ambos archivos están ordenados por código de producto. 
● Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del 
archivo detalle. 
● El archivo detalle sólo contiene registros que están en el archivo maestro. 
b. Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo 
stock actual esté por debajo del stock mínimo permitido. 
}

program ejercicio2P2;
const 
	valorAlto = 9999;
type

	producto = record
		codigo:integer;
		nombre:string;
		precio:real;
		stockAct:integer;
		stockMin:integer;
	end;
	
	venta = record
		codProd:integer;
		cantVent:integer;
	end;

	archivo_maestro = file of producto;
	archivo_detalle = file of venta;
	
//Modulos

procedure leerVenta(var v:venta);
begin
	write('Ingrese la cantidad de unidades vendidas: ');readln(v.cantVent);
	write('Ingrese el codigo del producto ');readln(v.codProd);
end;

procedure leerProducto(var p:producto);
begin
	write('Ingrese el codigo del producto: ');readln(p.codigo);
	if(p.codigo<>0)then begin
		write('Ingrese el nombre del producto: ');readln(p.nombre);
		write('Ingrese el precio del producto: ');readln(p.precio);
		write('Ingrese el stock del producto: ');readln(p.stockAct);
		write('Ingrese el stock minimo del producto: ');readln(p.stockMin);
	end;
end;


procedure cargarDetalle(var det:archivo_detalle);
var
	v:venta;
begin
	assign(det,'Detalle');
	rewrite(det);
	leerVenta(v);
	while(v.cantVent<>0)do begin
		write(det,v);
		leerVenta(v);
	end;
	close(det);
end;

procedure cargarMaestro(var mae:archivo_maestro);
var
	p:producto;
begin
	assign(mae,'Maestro');
	rewrite(mae);
	leerProducto(p);
	while(p.codigo<>0)do begin
		write(mae,p);
		leerProducto(p);
	end;
	close(mae);
end;

procedure leer(var det:archivo_detalle ; var regDet:venta);
begin
	if(not EOF(det))then
		read(det,regDet)
	else
		regDet.codProd := valorAlto;
end;

procedure imprimirMaestro(var mae:archivo_maestro);
var
	p:producto;
begin
	reset(mae);
	while(not EOF(mae))do begin
		read(mae,p);
		writeln('-Codigo: ',p.codigo,'  -Nombre: ',p.nombre,'  -Precio: ',p.precio:2:2,'  -Stock: ',p.stockAct,'  -StockMin: ',p.stockMin); 
	end;
	close(mae);
end;

procedure ActualizarMaestro(var mae:archivo_maestro ; var det:archivo_detalle);
var
	regDet:venta;
	regMae:producto;
begin
	writeln('----Opcion 1----');
	reset(mae);reset(det);
	leer(det,regDet);
	while(regDet.codProd<>valorAlto)do begin
		read(mae,regMae);
		while(regDet.codProd<>regMae.codigo)do begin
			read(mae,regMae);
		end;
		while(regDet.codProd = regMae.codigo)do begin
			regMae.stockAct := regMae.stockAct - regDet.cantVent;
			leer(det,regDet);
		end;
		seek(mae,filePos(mae)-1);	//decremento el puntero en uno porque cuando lei avanze
		write(mae,regMae);			//escribo y avanzo
	end;
	close(mae);close(det);
	imprimirMaestro(mae);
end;

procedure ProductosBajoStock(var mae:archivo_maestro);
var
	p:producto;
	archText:text;
begin
	writeln('----Opcion 2----');
	reset(mae);
	assign(archText,'stock_minimo.txt');
	rewrite(archText);
	while(not EOF(mae))do begin
		read(mae,p);
		if(p.stockAct<p.stockMin)then begin
			write(archText,p.codigo,' ',p.nombre,' ',p.precio,' ',p.stockAct,' ',p.stockMin);
		end;	
	end;
	close(mae);close(archText);
	writeln('Archivo de Texto Cargado');
end;

procedure menu(var mae:archivo_maestro ; var det:archivo_detalle);
var
	opcion:integer;
begin
	writeln('------MENU OPCIONES------');
	writeln('Opcion 1: Actualizar el archivo maestro con el archivo detalle');
	writeln('Opcion 2: Listar en un archivo de texto los productos con stock actual menor al stock mínimo');
	readln(opcion);
	while(opcion<>3)do begin
		case opcion of
			1:ActualizarMaestro(mae,det);
			2:ProductosBajoStock(mae);
		else
			writeln('Opcion invalida');
		end;
		writeln('Opcion 1: Actualizar el archivo maestro con el archivo detalle');
		writeln('Opcion 2: Listar en un archivo de texto los productos con stock actual menor al stock mínimo');
		readln(opcion);
	end;
end;

//Programa Principal

var
	mae:archivo_maestro;
	det:archivo_detalle;
begin
	cargarDetalle(det);		//Se dispone
	cargarMaestro(mae);		//Se dispone
	menu(mae,det);
end.
