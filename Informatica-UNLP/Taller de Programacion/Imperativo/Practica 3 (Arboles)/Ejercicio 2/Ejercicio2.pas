{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.

iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.

b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.

c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.

d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.}

program Ejercicio2;
type	
	
	rango_fecha=1..31;

	venta=record
		codigo:integer;
		fecha:rango_fecha;
		cantventas:integer;
	end;


	arbol=^nodo;
	nodo=record
		dato:venta;
		HI:arbol;
		HD:arbol;
	end;

	venta2=record
		codigo2:integer;
		cantventas2:integer;
	end;

	arbol2=^nodo2;
	nodo2=record
		dato:venta2;
		HI:arbol2;
		HD:arbol2;
	end;

//Modulos


procedure LeerVenta (var v:venta);
begin
	v.codigo:=random(100);
	if(v.codigo<>0)then begin
		v.fecha:=1+random(31);
		v.cantventas:=random(50);
	end;
end;

procedure Agregar (var a:arbol ; v:venta);
var
	nue:arbol;
begin
	if(a=nil)then begin
		new(nue);
		nue^.dato:=v;
		nue^.HI:=nil;
		nue^.HD:=nil;
		a:=nue;
	end
	else begin
		if(a^.dato.codigo > v.codigo) then
			Agregar(a^.HI,v)
		else
			Agregar(a^.HD,v);
	end;
end;

procedure CargarArbol (var a:arbol);
var
	v:venta;
begin
	a:=nil;
	randomize;
	writeln;
	writeln ('----- Ingreso de ventas y armado del arbol ----->');
	writeln;
	LeerVenta(v);
	while(v.codigo<>0)do begin
		Agregar(a,v);
		LeerVenta(v);
	end;
		writeln;
	writeln('Termino la Lectura');
	writeln;
end;

procedure ImprimirOrdenCreciente (a:arbol);
begin
	if(a<>nil)then begin
		ImprimirOrdenCreciente(a^.HI);
		writeln ('Codigo: ', a^.dato.codigo, ' Fecha: ', a^.dato.fecha, ' Cantidad de Ventas: ', a^.dato.cantventas);	
		ImprimirOrdenCreciente(a^.HD);
	end;
end;

procedure InformarOrdenCreciente (a:arbol) ;
begin
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol en Orden CRECIENTE (por Codigo de Venta)');
	writeln;
	ImprimirOrdenCreciente(a);
	writeln;
end;

procedure CargarArbol2(var a2:arbol2 ; cod:integer ; cantventas:integer);
var
	nue:arbol2;
begin
	if(a2 = nil) then begin
            new(nue);
            nue^.dato.codigo2:=cod;
            nue^.dato.cantventas2:=cantventas;
            nue^.HI:=nil;
            nue^.HD:=nil;
            a2:=nue;
    end
	else begin
		if(a2^.dato.codigo2 = cod)then
			a2^.dato.cantventas2:=a2^.dato.cantventas2+cantventas
		else
			if(a2^.dato.codigo2 > cod)then
				CargarArbol2(a2^.HI,cod,cantventas)
			else
				CargarArbol2(a2^.HD,cod,cantventas);
	end;
end;


procedure RecorrerArbolycargarArbol2(var a2:arbol2 ; a:arbol);
begin
	if(a<>nil)then begin
		RecorrerArbolyCargarArbol2(a2^.HI,a);
		CargarArbol2(a2,a^.dato.codigo,a^.dato.cantventas);
		RecorrerArbolyCargarArbol2(a2^.HD,a);
	end;	
end;


procedure ImprimirOrdenCreciente2 (a2:arbol2);
begin
	if(a2<>nil)then begin
		ImprimirOrdenCreciente2(a2^.HI);
		writeln ('Codigo: ', a2^.dato.codigo2, ' Cantidad total de Ventas: ', a2^.dato.cantventas2);	
		ImprimirOrdenCreciente2(a2^.HD);
	end;
end;

procedure InformarOrdenCreciente2 (a2:arbol2) ;
begin
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol en Orden CRECIENTE (por Codigo de Venta)');
	writeln;
	ImprimirOrdenCreciente2(a2);
	writeln;
end;



//Programa Principal

var
	a:arbol;
	a2:arbol2;
begin
	CargarArbol(a);
	InformarOrdenCreciente(a);
	RecorrerArbolycargarArbol2(a2,a);
	InformarOrdenCreciente2(a2);
end.
