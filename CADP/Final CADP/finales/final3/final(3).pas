{Una facultad dispone de los dni de aquellos estudiantes que no cumplen con los requisitos  de regularidad (a lo sumo 1000) los cuales no
pueden seguir siendo estudiantes de la Facultad, ademas, Dispone de una estructura en la cual almacena todos los estudiantes ; de cada 
estudiante se conoce:  DNI , apellido y legajo. Esta estructura se encuentra ordenada por DNI. Se pide realizar un programa que elimine
(eficientemente en tiempo de ejecucion) de la estructura que posee todos los estudiantes, aquellos estudiantes que han perdido la regularidad.}

program final3;
const 
	dimF = 1000;
	
type
	
	estudiante = record 
		dni:integer;
		apellido:string;
		{legajo:integer;}
	end; 
	
	vectorDni = array [1..dimF] of integer;
	
	lista = ^nodo;
	nodo = record
		dato:estudiante;
		sig:lista;
	end;
	
//Modulos

procedure cargarVector(var v:vectorDni ; var dimL:integer);	//SE DISPONE
begin
	v[1]:=4545;
	v[2]:=7474;
	v[3]:=1212;
	v[4]:=9696;
	v[5]:=3434;
	v[6]:=5656;
	v[7]:=9797;
	dimL:=7;					
end;

procedure leerRegistro (var e:estudiante);
begin
	write('Ingrese dni: ');readln(e.dni);
	if(e.dni<>0)then 
		write('Ingrese apellido: ');readln(e.apellido);
end;

procedure insertarOrdenado (var L:lista ; e:estudiante);
var
	nue,act,ant:lista;
begin
	new(nue);nue^.sig:=nil;nue^.dato:=e;	//este es el dato que quiero insertar;
	if(L=nil)then
		L:=nue
	else begin
		ant:=L ; act:=L;
		while(act<>nil)and(act^.dato.dni<e.dni)do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(act=L)then begin
			nue^.sig:=L;
			L:=nue;
		end
		else begin
			ant^.sig:=nue;	nue^.sig:=act;
		end;
	end;
end;

procedure cargarLista (var L:lista);	//SE DISPONE
var
	e:estudiante;
begin
	leerRegistro(e);
	while(e.dni <> 0)do begin
		insertarOrdenado(L,e);
		leerRegistro(e);
	end;
end;

procedure imprimirLista(L:lista);
begin
	while(L<>nil)do begin
		writeln('DNI ',L^.dato.dni,' | APELLIDO ',L^.dato.apellido); 
		L:=L^.sig;
	end;
end;

function NoCumpleRegularidad (v:vectorDni ; dimL:integer ; dni:integer):boolean;
var
	i:integer;
	cumple:boolean;
begin
	i:=1;
	cumple:=false;
	while((i<=dimL) and (not cumple))do begin
		if(v[i]=dni)then
			cumple:=true
		else
			i:=i+1;
	end;
	NoCumpleRegularidad:=cumple;
end;

procedure eliminarOrdenado (var L:lista ; dni:integer);
var
	ant,act:lista;
begin
	act:=L;
	ant:=nil;
	while((act<>nil) and (act^.dato.dni<dni))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act<>nil)then 
		if(act=L)then
			L:=L^.sig
	else 
		ant^.sig:=act^.sig;
	dispose(act);
end;

procedure eliminarEstudiantes(var L:lista ; v:vectorDni ; dimL:integer);
var
	aux:lista;
	dni:integer;
begin
	aux:=L;
	while(aux<>nil)do begin
		dni:=aux^.dato.dni;
		if(NoCumpleRegularidad(v,dimL,dni))then 
			eliminarOrdenado(L,dni)
		else
			aux:=aux^.sig;
	end;
end;

//Programa Principal

var
	v:vectorDni;
	L:lista;
	dimL:integer;
begin
	L:=nil;
	dimL:=0;
	cargarVector(v,dimL);	//SE DISPONE
	cargarLista(L);		//SE DISPONE
	writeln('------Lista Ordenada por DNI------');
	writeln;	
	imprimirLista(L);
	eliminarEstudiantes(L,v,dimL);
	writeln;
	writeln('------Lista con el DNI eliminado------');
	writeln;	
	imprimirLista(L);	
end.
