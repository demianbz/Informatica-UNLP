program algoritmos;
const
	dimF = 5;
	
type
	
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;
	
	vector = array [1..dimF] of integer;
	
	
//Modulos

procedure AgregarAdelante(var L:lista ; dato:integer);
var
	nue:lista;
begin
	new(nue); nue^.dato:=dato ; nue^.sig:=nil;
	if(L=nil)then 
		L:=nue
	else begin
		nue^.sig:=L;
		L:=nue;
	end;
end;


procedure AgregarAtras(var L:lista ; var ult:lista ; dato:integer);
var
	nue:lista;
begin
	new(nue); nue^.dato:=dato ; nue^.sig:=nil;
	if(L=nil)then begin
		L:=nue;
		ult:=nue;
	end
	else begin
		ult^.sig:=nue;
		ult:=nue
	end;
end;

procedure InsertarOrdenado(var L:lista ; dato:integer);
var
	nue,act,ant:lista;
begin
	new(nue); nue^.dato:=dato ; nue^.sig:=nil;
	if(L=nil)then 
		L:=nue
	else begin
		act:=L;
		while((act<>nil)and(act^.dato<dato))do begin
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

procedure EliminarUnaVez(var L:lista ; dato:integer);
var
	ant,act:lista;
begin
	act:=L;
	while((act<>nil) and (act^.dato <> dato))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=L)then begin
		L:=L^.sig;
	end
	else begin
		if((act<>nil) and (act^.dato = dato))then
			ant^.sig:=act^.sig;
	end;
	dispose(act);
end;

procedure EliminarMasDeUnaVez(var L:lista ; dato:integer);
var
	ant,act:lista;
begin
	act:=L;
	while(act<>nil)do begin
		if(act^.dato<>dato)then begin
			ant:=act;
			act:=act^.sig;
		end
		else begin
			if(L=act)then
				L:=L^.sig
			else
				ant^.sig:=act^.sig;
			dispose(act);
			if(L=act)then
				act:=L
			else
				act:=ant^.sig;
		end;
	end;
end;

function Capicua(num:integer):boolean;
var
	digito,invertido,original:integer;
begin
	invertido:=0;
	original:=num;
	while(num<>0)do begin
		digito:=num MOD 10;
		invertido := invertido * 10 + digito;
		num:=num DIV 10;
	end;
	
	Capicua := invertido = original;
end;


procedure EliminarPosVector(var v:vector ; var ok:boolean ; var dimL:integer ; pos:integer);
var
	i:integer;
begin
	ok := ((pos>0) and (pos<=dimL));	//Verifico que la posicion sea valida
	
	if(ok)then begin
		for i:=pos to (dimL-1) do //Hasta menos uno porque es una posicion menos
			v[i]:=v[i+1];	//Hago los corrimientos
		dimL:=dimL-1;
	end;
end;

procedure InsertarPosVector(var v:vector ; var ok:boolean ; var dimL:integer ; pos:integer ; dato:integer);
var
	i:integer;
begin
	ok:= ((pos>0) and (pos<=dimL) and (dimL+1 <= dimF));
	if(ok)then begin
		for i:=dimL downto pos do	//Arranco desde atras
			v[i+1] := v[i];	//Corrimientos
		v[pos]:= dato;
		dimL:=dimL+1;
	end;
end;

function buscarPosicion(v:vector ; dimL:integer ; dato:integer):integer;
var
	pos:integer;
begin
	pos:=1;
	while((pos <= dimL) and (v[pos]<dato))do 
		pos:=pos+1;
	buscarPosicion := pos;
end;

procedure InsertarOrdenadoVector(var v:vector ; var dimL:integer ; dato:integer);
var
	pos:integer;
	ok:boolean;
begin
	pos:=buscarPosicion(v,dimL,dato);
	InsertarPosVector(v,ok,dimL,pos,dato);
end;


//Programa Principal

var	
	L:lista;
	v:vector;
begin
	L:=nil;
end.
