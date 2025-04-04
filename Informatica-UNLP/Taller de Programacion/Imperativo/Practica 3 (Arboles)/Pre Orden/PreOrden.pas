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

procedure PostOrden (a:arbol);
begin
	if(a<>nil)then begin
		PostOrden(a^.HI);		
		PostOrden(a^.HD);
		writeln('Numero: ',a^.dato);
	end;
end;

//Programa Principal
var
	a:arbol;
begin
	a:=nil;
	CargarArbol(a);
	PostOrden(a);
end.
