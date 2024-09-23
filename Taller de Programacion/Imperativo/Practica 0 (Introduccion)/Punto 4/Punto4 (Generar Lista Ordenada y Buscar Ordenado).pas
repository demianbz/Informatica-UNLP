program ListasOrdenadas;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;

//Modulos

procedure InsertarOrdenado(var L:lista ; ale:integer);
var
	ant,act,nue:lista;
begin
	new(nue);
	nue^.dato:=ale;
	nue^.sig:=nil;
	
	if(L=nil)then
		L:=nue
		
	else begin
		act:=L;
		ant:=L;
		
		while (act<>nil)and(act^.dato<nue^.dato) do begin 
			ant:=act;
			act:=act^.sig;
		end;
		
		if(act=L)then begin
			nue^.sig:=L;
			L:=nue
		end
		
		else begin
			ant^.sig:=nue;
			nue^.sig:=act;
		end;
		
	end;
end;

procedure CargarListaOrdenada(var L:lista);
var
	rango,ale:integer;
begin
	rango:=150-100+1;
	ale:=100+random(rango);
	
	while(ale<>120)do begin
		InsertarOrdenado(L,ale);
		ale:=100+random(rango);
	end;
end;

procedure ImprimirLista (L:lista);
begin
	while(L<>nil) do begin
		writeln('El numero generado aleatoriamente fue:',L^.dato);
		L:=L^.sig;
	end;
	
end;

function BuscarElementoOrdenado (L:lista ; num:integer):boolean;
var
	encontre:boolean;
begin
	encontre:=false;
	while( (L<>nil) and (encontre=false)) do
	begin
		if(L^.dato=num) then
			encontre:=true
		else
			L:=L^.sig;
	end;
	BuscarElementoOrdenado:=encontre
end;

//Programa Principal

var
	L:lista;
	num:integer;
begin
	L:=nil;
	randomize;
	CargarListaOrdenada(L);
	ImprimirLista(L);
	writeln('Ingresa el numero que queres buscar: ');
	readln(num);
	writeln('Resultado: ', buscarElementoOrdenado(L,num));
end.
