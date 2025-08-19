{Una empresa dispone de una estructura de datos con las ventas de su comercio. De cada venta, se conoce , numero de venta, cantidad
de productos  y tipo de pago (efectivo o tarjeta). Se pide implementar un programa que genere una segunda estructura con las ventas
cuya cantidad de productos tenga mas digitos pares que impares. En la estructura generada deben quedar almacenadas las ventas de 
tipo de pago efectivo antes que las de tipo de pago con tarjeta.}

program final4;
type
	
	venta = record
		numVenta:integer;
		cantProd:integer;
		pago: char;
	end;

	lista = ^nodo;	//SE DISPONE	
	nodo = record
		dato:venta;
		sig:lista;
	end;


//Modulos

procedure imprimirLista(L:lista);	//NO ES NECESARIO
begin
	while(L<>nil)do begin
		writeln('NumVenta: ',L^.dato.numVenta,' | CantProd: ',L^.dato.cantProd,' | Pago: ',L^.dato.pago);
		L:=L^.sig;
	end;
end;

procedure leerVenta(var v:venta);	//SE DISPONE
begin
	write('Metodo de Pago E(Efectivo) o T(Tarjeta), F para no cargar mas: '); readln(v.pago);
	if(v.pago<>'F')then begin
		write('Numero de Venta: '); readln(v.numVenta);
		write('Cantidad de Productos: '); readln(v.cantProd);
	end;
end;

procedure insertarOrdenado(var L:lista ; v:venta);	//NO ES NECESARIO, LO HAGO PARA PROBAR
var
	ant,act,nue:lista;
begin
	new(nue); nue^.dato:=v ; nue^.sig:=nil;
	if(L=nil)then
		L:=nue
	else begin
		ant:=L ; act:=L;
		while((act<>nil)and(act^.dato.numVenta<v.numVenta))do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(act=L)then begin	//Primer elemento
			nue^.sig:=L;
			L:=nue;
		end
		else begin	//Al medio o al final
			ant^.sig:=nue;
			nue^.sig:=act;
		end;
	end;
end;

procedure cargarLista(var L:lista);	//SE DISPONE
var
	v:venta;
begin
	leerVenta(v);
	while(v.pago<>'F')do begin
		insertarOrdenado(L,v);
		leerVenta(v);
	end;
	writeln;
	writeln('-----Lista 1 Ordenada por numero de Venta-----');
	imprimirLista(L);
end;

function masDigitosPares(cantProd:integer):boolean;
var
	digito:integer;
	cantPar,cantImpar:integer;
	num:integer;
begin
	num:=cantProd;
	cantPar:=0; cantImpar:=0;
	while(num<>0)do begin
		digito:= num MOD 10;
		if((digito MOD 2) = 0)then
			cantPar:=cantPar+1
		else
			cantImpar:=cantImpar+1;
		num:= num DIV 10;
	end;
	masDigitosPares:= (cantPar>cantImpar);
end;

procedure agregarAdelante(var L2:lista ; v:venta);
var
	nue:lista;
begin
	new(nue); nue^.dato:=v ; nue^.sig:=nil;
	if(L2=nil)then
		L2:=nue
	else begin
		nue^.sig:=L2;
		L2:=nue;
	end;
end;

{procedure agregarAtras(var L2:lista ; v:venta);
var
	aux,nue:lista;
begin
	new(nue); nue^.dato:=v; nue^.sig:=nil;
	if(L2=nil)then
		L2:=nue
	else begin
		aux:=L2;
		while(aux^.sig<>nil)do begin
			aux:=aux^.sig;
		end;
		aux^.sig:=nue;
	end;
end;}

procedure agregarAtras(var L2,ult:lista ; v:venta);
var
	nue:lista;
begin
	new(nue); nue^.dato:=v; nue^.sig:=nil;
	if(L2=nil)then begin
		L2:=nue;
		ult:=nue;
	end
	else begin
		ult^.sig:=nue;
		ult:=nue;
	end;
end;

procedure cargarLista2(var L2:lista ; L:lista);
var
	ult:lista;
begin
	ult:=nil;
	while(L<>nil)do begin
		if(masDigitosPares(L^.dato.cantProd))then begin
			if(L^.dato.pago = 'E')then begin
				agregarAdelante(L2,L^.dato);
				if(ult = nil)then	//si agrege el primer dato con el agregar adelante, actualizo el ult
					ult:=L2;
			end
			else
				agregarAtras(L2,ult,L^.dato);
		end;
		L:=L^.sig;
	end;
	writeln;
	writeln('-----Lista 2 Separada por Metodo de pago-----');
	imprimirLista(L2);	
end;

//Programa principal

var
	L:lista;
	L2:lista;
begin
	L:=nil;
	L2:=nil;
	cargarLista(L);	//SE DISPONE
	cargarLista2(L2,L);
end.
