program eliminarOrdenado;
type
	
	alumno = record
		nombre:string;
		dni:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:alumno;
		sig:lista;
	end;

//Modulos

procedure insertarOrdenado(var L:lista ; a:alumno);
var
	nue,ant,act:lista;
begin
	new(nue);nue^.dato:=a;nue^.sig:=nil;
	if(L=nil)then
		L:=nue
	else begin
		act:=L ; ant:=L;
		while((act<>nil)and(act^.dato.dni>a.dni))do begin
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
end;

procedure leerRegistro(var a :alumno);
begin
	write('Ingrese DNI: ');readln(a.dni);
	if(a.dni<>0)then
		write('Ingrese Nombre: ');readln(a.nombre);
end;

procedure cargarLista(var L:lista);
var
	a:alumno;
begin
	leerRegistro(a);
	while(a.dni<>0)do begin
		insertarOrdenado(L,a);
		leerRegistro(a);
	end;
end;

procedure imprimirLista(L:lista);
begin
	while(L<>nil)do begin
		writeln('DNI ',L^.dato.dni,' | NOMBRE ',L^.dato.nombre);
		L:=L^.sig;
	end;
end;

procedure eliminarOrdenado(var L:lista ; dni:integer);
var
	act,ant:lista;
begin
	act:=L;
	ant:=nil;
	while((act<>nil) and (act^.dato.dni>dni))do begin	//Salgo o porque llegue al final o porque encontre el elemento
		ant:=act;
		act:=act^.sig;
	end;
	
	if(act<>nil)and(act^.dato.dni=dni)then 
		if(act=L)then
			L:=L^.sig
	else
		ant^.sig:=act^.sig;
		
		
	dispose(act);
end;

procedure eliminarAlumno (var L:lista);
var
	dni:integer;
begin
	writeln;
	write('Ingrese el numero de dni a eliminar (que exista): ');readln(dni);
	writeln;
	eliminarOrdenado(L,dni);
end;

//Programa Principal 

var
	L:lista;
begin
	L:=nil;
	cargarLista(L);
	writeln('------Lista Ordenada por DNI------');
	writeln;
	imprimirLista(L);
	eliminarAlumno(L);
	writeln('------Lista con el DNI eliminado------');	
	writeln;
	imprimirLista(L);
end.
