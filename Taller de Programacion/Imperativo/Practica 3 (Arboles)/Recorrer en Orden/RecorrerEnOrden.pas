program Arboles;
type 

	arbol = ^nodo;
	
	nodo = record 
		dato:integer;
		HI:arbol;
		HD:arbol;
	end;
	
//Modulos

procedure Agregar (var a:arbol ; num:integer);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=num;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else 
		if(num <= a^.dato)then
			Agregar(a^.HI,num)
		else
			Agregar(a^.HD,num);
end;

procedure CargarArbol (var a:arbol);
var
	num:integer;
begin
	write('Ingrese el numero para Agregar o 0 en caso de no agregar mas: ');
	readln(num);
	while(num<>0)do begin
		Agregar(a,num);
		write('Ingrese el numero para Agregar o 0 en caso de no agregar mas: ');
		readln(num);
	end;
end;

procedure RecorrerEnOrden (a:arbol);
begin
	if(a<>nil)then begin
		RecorrerEnOrden(a^.HI);
		writeln('Numero: ',a^.dato);
		RecorrerEnOrden(a^.HD);
	end;
end;

function Buscar(a:arbol ; numero:integer):boolean;
begin
	if(a=nil)then 
		Buscar:=false
	else
		if(a^.dato=numero)then
		Buscar:=true
	else
		if(numero>a^.dato)then
			Buscar:=Buscar(a^.HD,numero)
		else
			Buscar:=Buscar(a^.HI,numero);
end;


//Programa Principal
var
	a:arbol;
	numero:integer;
begin
	a:=nil;
	CargarArbol(a);
	RecorrerEnOrden(a);
	write('Ingrese el Valor a Buscar: ');
	readln(numero);
	writeln;
	if (Buscar(a,numero)) then
		writeln('El numero ',numero,' se encuentra en el arbol')
	else
		writeln('El numero ',numero,' no se encuentra en el arbol');
end.
