{Se lee Informacion de Productos. De cada producto se lee codigo de prodcto, nombre de rubro y stock. 
Se pide realizar un programa que genere una estructura donde se almacenen, para cada rubro leido, su nombre, cantidad de productos del rubro
y stock total, para los productos con stock distinto de cero. La lectura finaliza cuando se lee el codigo -1 y la lectura viene ordenada por
nombre de rubro.}

program final8;

type

	producto = record
		codigo:integer;
		rubro:string;
		stock:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:producto;
		sig:lista;
	end;

//Modulos

procedure leerProducto(var p:producto);
begin
	write('Ingrese el codigo: ');readln(p.codigo);
	if(p.codigo<>-1)then begin
		write('Ingrese el rubro: ');readln(p.rubro);
		write('Ingrese el stock: ');readln(p.stock);
	end;
end;

procedure InsertarOrdenado(var L:lista ; p:producto);
var
	nue,ant,act:lista;
begin
	new(nue); nue^.dato:=p; nue^.sig:=nil;
	act:=L;ant:=L;
	while((act<>nil) and (act^.dato.rubro<p.rubro))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=L)then begin
		nue^.sig:=L;
		L:=nue;
	end
	else begin
		ant^.sig:=nue;
		nue^.sig:=act;
	end;
end;

procedure cargarProductos(var L:lista);	//SE DISPONE
var
	p:producto;
begin
	L:=nil;
	leerProducto(p);
	while(p.codigo<>-1)do begin
		InsertarOrdenado(L,p);
		leerProducto(p);
	end;
end;

procedure AgregarAdelante(var L:lista ; p:producto);
var
	nue:lista;
begin
	new(nue);nue^.dato:=p;nue^.sig:=nil;
	if(L=nil)then begin
		L:=nue;
	end
	else begin
		nue^.sig:=L;
		L:=nue;
	end;
end;

procedure cargarLista(var L:lista ; productos:lista);
var
	prodAct:string;
	stockTotal:integer;
	p:producto;
	cantProductos:integer;
begin
	while(productos<>nil)do begin
		prodAct:=productos^.dato.rubro;
		cantProductos:=0;
		stockTotal:=0;
		while((productos<>nil) and (prodAct = productos^.dato.rubro))do begin
			if(productos^.dato.stock > 0)then begin
				cantProductos:=cantProductos+1;
				stockTotal:=stockTotal+productos^.dato.stock;
			end;
			productos:=productos^.sig;
		end;
			p.rubro:=prodAct;
			p.codigo:=cantProductos;
			p.stock:=stockTotal;
			AgregarAdelante(L,p);
	end;
end;

procedure imprimirResumen(L:lista);
begin
	writeln('--- RESUMEN POR RUBRO ---');
	while (L <> nil) do begin
		writeln('Rubro: ', L^.dato.rubro);
		writeln('  Cantidad de productos con stock > 0: ', L^.dato.codigo);
		writeln('  Stock total: ', L^.dato.stock);
		writeln('----------------------------');
		L := L^.sig;
  end;
end;



//Programa Principal

var
	productos:lista;
	L:lista;
begin
	cargarProductos(productos);	//SE DISPONE
	L:=nil;
	cargarLista(L,productos);
	imprimirResumen(L);
end.
