{La biblioteca de la Facultad dispone de sus préstamos ordenados por código de tema (1..15). De cada préstamo se conoce: código 
de tema, fecha y el código del libro prestado.
Se pide realizar un programa que informe, el código de tema con más cantidad de préstamos, y la cantidad total de préstamos por 
cada tema. Declare todas las estructuras utilizadas para resolver el programa.
Considerar: que la solución propuesta debe optimizar el tiempo de ejecución y la memoria estática.}

program final7;
type
	rango_tema = 0..5;

	prestamo = record
		codigo:rango_tema;
		fecha:integer;
		codL:integer;
	end;

	lista = ^nodo;
	nodo = record
		dato:prestamo;
		sig:lista;
	end;

//Modulos

procedure leerPrestamo(var p:prestamo);
begin
	write('Ingrese el codigo: ');readln(p.codigo);
	write('Ingrese la fecha: ');readln(p.fecha);
	write('Ingrese el codL: ');readln(p.codL);
end;

procedure imprimirPrestamo(p:prestamo);
begin
	writeln('-Codigo: ',p.codigo,'   -Fecha: ',p.fecha,'   -Codigo Libro: ',p.codL);
end;

procedure imprimirLista(L:lista);
begin
	while(L<>nil)do begin
		imprimirPrestamo(L^.dato);
		L:=L^.sig;
	end;
end;

procedure insertarOrdenado(var L:lista ; p:prestamo);
var
	nue,act,ant:lista;
begin
	new(nue);nue^.dato:=p;nue^.sig:=nil;
	act:=L;ant:=L;
	if(L=nil)then
		L:=nue
	else begin
		while(act<>nil)and(act^.dato.codigo<p.codigo)do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(L=act)then begin
			nue^.sig:=L;
			L:=nue;
		end
		else begin
			ant^.sig:=nue;
			nue^.sig:=act;
		end;
	end;
end;

procedure cargarLista(var L:lista);
var
	p:prestamo;
begin
	leerPrestamo(p);
	while(p.codigo<>0)do begin
		insertarOrdenado(L,p);
		leerPrestamo(p);	
	end;
end;

procedure corteDeControl(L:lista);
var
	codMax,temaAct:rango_tema;
	max:integer;
	cantP:integer;
begin
	max:=0;
	while(L<>nil)do begin
		cantP:=0;
		temaAct:=L^.dato.codigo;
		while(L<>nil)and(L^.dato.codigo = temaAct)do begin
			cantP:=cantP+1;
			L:=L^.sig;
		end;
		if(cantP>max)then begin
			codMax:=temaAct;
			max:=cantP;
		end;
		writeln('La cantidad total de prestamos del tema ',temaAct,' es: ',cantP);
	end;
	writeln('El Codigo de tema con mas cantidad de prestamos es ',codMax);
end;


//Programa Principal

var
	L:lista;
begin
	L:=nil;
	cargarLista(L);	//SE DISPONE
	writeln('-----Lista Cargada-----');
	imprimirLista(L);
	writeln;
	corteDeControl(L);
end.
