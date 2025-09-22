{1. Un comercio dispone de una estructura de datos con información de las facturas realizadas durante el último mes 
(como máximo 1000). De cada factura se conoce el número de factura, código de sucursal (1 a 5), a la que pertenece y monto total.
Se pide implementar un programa que lea desde teclado un código de sucursal y elimine de la estructura todas las facturas 
pertenecientes al código de sucursal leído.
Al finalizar debe informar el monto acumulado en todas las facturas eliminadas. La solución debe ser óptima en tiempo de ejecución.}

program final6;
type
	rango_cod = 0..5;

	factura = record 
		//numero:integer;
		codigo:rango_cod;
		montoT:real;
	end;

	lista = ^nodo;		//Dispongo de una lista porque la solucion debe ser optima en tiempo de ejecucion 
	nodo = record		//y cuando se tienen que hacer varias eliminaciones, es mas eficiente la lista que el vector, aunque sepa la dimF
		dato:factura;
		sig:lista;
	end;
	
//Modulos

procedure leerFactura(var f:factura);
begin
	write('Ingrese el codigo: ');readln(f.codigo);
	write('Ingrese el monto: ');readln(f.montoT);
end;

procedure insertarOrdenado(var L:lista ; f:factura);
var
	nue,act,ant:lista;
begin
	new(nue);nue^.dato:=f;nue^.sig:=nil;
	act:=L;ant:=L;
	if(L=nil)then
		L:=nue
	else begin
		while((act<>nil)and(act^.dato.codigo<f.codigo))do begin	
			ant:=act;											
			act:=act^.sig;
		end;
		if(L=act)then begin	//si nunca avanze(osea es el primer nodo)
			nue^.sig:=L; L:=nue; //hago un agregar adelante
		end
		else begin		//sino hago los enlaces
			ant^.sig:=nue;
			nue^.sig:=act;
		end;
	end;
end;

procedure cargarLista(var L:lista);	//SE DISPONE
var
	f:factura;
begin
	leerFactura(f);
	while(f.codigo<>0)do begin
		insertarOrdenado(L,f);
		leerFactura(f);
	end;
end;

procedure eliminarFacturas(var L:lista ; cod:integer);
var
	ant,act:lista;
	montoEliminadas:real;
begin
	act:=L;ant:=L;montoEliminadas:=0;
	while(act<>nil)do begin
		if(act^.dato.codigo<>cod)then begin
			ant:=act;
			act:=act^.sig;
		end
		else begin
			if(act=L)then begin	//si nunca avanze osea es el primer nodo
				montoEliminadas:=montoEliminadas+L^.dato.montoT;
				L:=L^.sig;
			end
			else begin
				ant^.sig:=act^.sig;
			end;
			montoEliminadas:=montoEliminadas+act^.dato.montoT;
			dispose(act);
			if(act=L)then
				act:=L
			else
				act:=ant^.sig;
		end;
	end;
	writeln('Monto acumulado en todas las facturas eliminadas: $',montoEliminadas:2:2);
end;

procedure imprimirFactura(f:factura);
begin
	writeln('-Codigo: ',f.codigo,'   -Monto: $',f.montoT:2:2);
end;

procedure imprimirLista(L:lista);
begin
	while(L<>nil)do begin
		imprimirFactura(L^.dato);
		L:=L^.sig;
	end;
end;


//Programa Principal

var
	L:lista;
	cod:integer;
begin
	L:=nil;
	cargarLista(L);	//SE DISPONE
	writeln('-----Lista Cargada-----');
	imprimirLista(L);
	writeln;
	write('Ingrese un codigo a eliminar: ');readln(cod);
	eliminarFacturas(L,cod);
	writeln;
	writeln('-----Lista sin las facturas con codigo ',cod,'-----');	
	imprimirLista(L);
end.
