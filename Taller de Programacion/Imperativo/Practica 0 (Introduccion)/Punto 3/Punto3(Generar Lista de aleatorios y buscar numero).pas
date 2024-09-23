program Listas;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;
	
{procedure AgregarAdelante(var L:lista ; ale:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:=ale;
	nuevo^.sig:=nil;
	if(L=nil)then
		L:=nuevo;
	else begin
		nuevo^.sig:=L;
		L:=nuevo;
	end;
end;}

//Modulos

procedure AgregarAtras (var L:lista ; ale:integer);
var
	nuevo,aux:lista;
begin
	new(nuevo);
	nuevo^.dato:=ale;
	nuevo^.sig:=nil;
	if(L=nil)then
		L:=nuevo
	else begin
		aux:=L;
		while(aux^.sig<>nil)do
			aux:=aux^.sig;
		aux^.sig:=nuevo;
	end;
	
end;


procedure CargarLista (var L:lista);
var
	ale,rango:integer;
begin
	rango:=150-100+1;
	ale:=100+random(rango);
	while(ale<>120)do begin
		AgregarAtras(L,ale);
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

function BuscarElemento (L:lista ; num:integer) :boolean;
var 
	aux:lista;
	encontre:boolean;
begin
	encontre:=false;
	aux:=L;
	while ((aux<>nil) and (encontre=false)) do
	begin
		if(aux^.dato=num) then
			encontre:=true
		else
			aux:=aux^.sig;
	end;
	BuscarElemento:=encontre;
end;

//Programa Principal

var
	num:integer;
	L:lista;
begin
	L:=nil;
	randomize;
	CargarLista(L);
	ImprimirLista(L);
	writeln('Ingresa el numero que queres buscar: ');
	readln(num);
	writeln('Resultado: ', buscarElemento(L,num));

end.


