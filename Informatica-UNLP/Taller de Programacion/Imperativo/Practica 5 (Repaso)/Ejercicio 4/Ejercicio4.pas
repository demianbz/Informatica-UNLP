{4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se ingresa código, DNI de la persona, año y tipo de reclamo. El ingreso finaliza con el
código de igual a 0. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.

b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.

c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.

d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}


program E4P5;
type
	reclamo = record
		codigo:integer;
		DNI:integer;
		anio:integer;
		tipo:integer;
	end;

	reclamoL =record
		codigo:integer;
		anio:integer;
		tipo:integer;
	end;

	lista=^nodoL;
	nodoL=record
		dato:reclamoL;
		sig:lista;
	end;
	
	reclamoDNI=record
		DNI:integer;
		cant:integer;
		l:lista;
	end;

	arbol=^nodo;
	nodo=record
		dato:reclamoDNI;
		HI:arbol;
		HD:arbol;
	end;
	
	ListaYear=^nodoY;
	nodoY=record
		dato:integer;
		sig:ListaYear;
	end;
	
	
//Modulos

procedure LeerReclamo (var r:reclamo);
begin
	r.codigo:=random(30);
	if(r.codigo<>0)then begin
		r.DNI:=random(20);
		r.anio:=random(25)+2000;
		r.tipo:=random(10)+1;
	end;
end;

procedure AgregarAdelante (var L:lista ; r:reclamoL);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=r;
	nue^.sig:=nil;
	if(L=nil)then
		L:=nue
	else begin
		nue^.sig:=L;
		L:=nue;
	end;
end;


procedure Agregar (var a:arbol ; r:reclamo);
var
	r2:reclamoL;		//el contenido de la lista
begin
	if(a=nil)then begin
		new(a);
		a^.dato.l:=nil;
		a^.dato.DNI:=r.DNI;
		r2.codigo:=r.codigo; {Cargo El registro de la lista}
		r2.anio:=r.anio;
		r2.tipo:=r.tipo;
		a^.dato.cant:=1;	  	
		AgregarAdelante(a^.dato.l,r2);
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else 	
		if(a^.dato.DNI = r.DNI)then begin
			a^.dato.cant:=a^.dato.cant+1;
			r2.codigo:=r.codigo;
			r2.anio:=r.anio;
			r2.tipo:=r.tipo;
		    AgregarAdelante(a^.dato.l,r2);
		end
	else
		if(a^.dato.DNI > r.DNI)then
			Agregar(a^.HI,r)
		else
			Agregar(a^.HD,r);
end;


{a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.}

procedure CargarArbol (var a:arbol);
var
	r:reclamo;
begin
	randomize;
	a:=nil;
	LeerReclamo(r);
	while(r.codigo<>0)do begin
		Agregar(a,r);
		LeerReclamo(r);
	end;
end;

procedure ImprimirLista (r:reclamoDNI);
begin
	writeln('DNI: ',r.DNI);
	writeln('Cantidad de Reclamos: ',r.cant);
	while(r.l <>nil)do begin
		writeln('Codigo:',r.l^.dato.codigo,' Anio: ',r.l^.dato.anio,' Tipo: ',r.l^.dato.tipo);
		r.l:=r.l^.sig;
	end;
end;


procedure ImprimirArbol (a:arbol);
begin
	if(a<>nil)then begin
		ImprimirArbol(a^.HI);
		ImprimirLista(a^.dato);
		ImprimirArbol(a^.HD);
	end;
end;

procedure InformarArbol (a:arbol);
begin
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol Ordenado por DNI');
	writeln;
	ImprimirArbol(a);
	writeln;
end;


{b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.}

function CantidadReclamos (a:arbol ; DNI:integer):integer;
begin
	if(a=nil)then
		CantidadReclamos:=0
	else 
		if(a^.dato.DNI = DNI)then
			CantidadReclamos:=a^.dato.cant
		else
			if(a^.dato.DNI > DNI)then
				CantidadReclamos:=CantidadReclamos(a^.HI,DNI)
			else
				CantidadReclamos:=CantidadReclamos(a^.HD,DNI);
			
end;


procedure CantidadDeReclamos (a:arbol);
var
	DNI,cant:integer;
begin
	writeln ('---------------------------------------------------');
	writeln;
	write('Ingrese un DNI: ');
	readln(DNI);
	writeln;
	cant:=0;
	cant:=CantidadReclamos(a,DNI);
	if(cant=0)then
		writeln('El DNI ',DNI,' No tiene Reclamos o el Arbol esta vacio')
	else begin
		writeln('El DNI ',DNI,' Tiene una cantidad de ',cant,' reclamos');
	end;
	writeln;
end;

{c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.}

function CantReclamos (a:arbol ; min,max:integer):integer;
begin
	if(a=nil)then
		CantReclamos:=0
	else 
		if((a^.dato.DNI>min)and(a^.dato.DNI<max))then
			CantReclamos:=a^.dato.cant+CantReclamos(a^.HD,min,max)+CantReclamos(a^.HI,min,max)
		else 
			if(a^.dato.DNI>min)then
				CantReclamos:=CantReclamos(a^.HI,min,max)
			else
				CantReclamos:=CantReclamos(a^.HD,min,max)
				
end;



procedure EntreDos (a:arbol);
var
	min,max,CantTotal:integer;
begin
	writeln ('---------------------------------------------------');
	writeln;
	write('Ingrese un DNI Inicial: ');
	readln(min);
	write('Ingrese un DNI Final (Mas Grande que el Inicial): ');
	readln(max);
	writeln;
	CantTotal:=CantReclamos(a,min,max);
	if(CantTotal=0)then
		writeln('No Hay Reclamos entre el DNI ',min,' y el DNI ',max,' O el arbol esta Vacio' )
	else begin
		writeln('La Cantidad de Reclamos entre el DNI ',min,' y el DNI ',max,' Es: ',CantTotal);
	end;
	writeln;
end;


{d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}

procedure AgregarAdelanteY (var L:ListaYear ; codigo:integer);
var
	nue:ListaYear;
begin
	new(nue);
	nue^.dato:=codigo;
	nue^.sig:=nil;
	if(L=nil)then
		L:=nue
	else begin
		nue^.sig:=L;
		L:=nue;
	end;
end;

procedure GenerarListaYear (L:lista ; year:integer ; var LY:ListaYear);
begin
	while(L<>nil)do begin
		if(L^.dato.anio = year)then
			AgregarAdelanteY(LY,L^.dato.codigo);
		L:=L^.sig;
	end;
end;



procedure CodigosReclamos (a:arbol ; year:integer ; var L:ListaYear);
begin
	if(a<>nil)then begin
			CodigosReclamos(a^.HI, year, L);
			GenerarListaYear(a^.dato.l,year,L);			
			CodigosReclamos(a^.HD, year, L);
	end;
end;

procedure ImprimirListaY(L: ListaYear);
begin
	while(L<>nil)do begin
			write(' | CODIGO=', l^.dato);
			l:= l^.sig;
		end;
end;


procedure AnioCodigo (a:arbol);
var
	L:ListaYear;
	year:integer;
begin
	L:=nil;
	writeln ('---------------------------------------------------');
	writeln;
	write('Ingrese un Anio: ');
	readln(year);
	CodigosReclamos(a,year,L);
	writeln;
	writeln('Lista para el anio ', year, ': ');
	ImprimirListaY(L);
	writeln;
	writeln ('---------------------------------------------------');	
end;

//Programa Principal

var
	a:arbol;
begin
	CargarArbol(a);		//A
	InformarArbol(a);
	CantidadDeReclamos(a);		//B
	EntreDos(a);		//C
	AnioCodigo(a);		//D
end.
