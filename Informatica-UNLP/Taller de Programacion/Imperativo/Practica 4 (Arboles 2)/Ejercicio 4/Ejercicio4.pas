{4. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:

a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.

i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.

ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).

b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.

c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.

d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.

e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.

f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.

g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.

h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.

i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).

j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}

program P4EJ4;
const
	Dias = 31;
	Meses = 12;
type
	rango_dia = 1..dias;
	rango_mes = 1..meses;
	
	
	prestamo = record
		isbn:integer;
		numero:integer;
		dia:rango_dia;
		mes:rango_mes;
		cantdias:integer;
	end;
	
	
	arbolA=^nodoA;
	nodoA=record
		dato:prestamo;
		HI:arbolA;
		HD:arbolA;
	end;
	
	
	prestamoLista=record
		numero:integer;
		dia:rango_dia;
		mes:rango_mes;
		cantdias:integer;
	end;
	

	lista=^nodo;
	nodo=record
		dato:prestamoLista;
		sig:lista;
	end;
	
	NodoPrestamos = record		//Esto tiene cada nodo del arbol 2
		isbn:integer;
		ListaP:lista;
	end;
	
	arbolB=^nodoB;
	nodoB=record
		dato:NodoPrestamos;
		HI:arbolB;
		HD:arbolB;
	end;
	
	prestamoF=record
		isbn:integer;
		cantTotal:integer;
	end;
	
	listaF=^nodoF;
	nodoF = record
		dato:prestamoF;
		sig:listaF;
	end;

	
	listaG=^nodoG;
	nodoG = record
		dato:prestamoF;
		sig:listaG;
	end;
	
	
//Modulos


procedure LeerPrestamo(var p:prestamo); //Random
begin
	p.isbn:=random(100);
	p.numero:=random(50);
	p.dia:=random(31)+1;
	p.mes:=random(12)+1;
	p.cantdias:=random(30);
end;

procedure Agregar(var a1:arbolA ; p:prestamo);
begin
	if(a1=nil)then begin
		new(a1);
		a1^.dato:=p;
		a1^.HI:=nil;
		a1^.HD:=nil;
	end
	else begin
		if(a1^.dato.isbn>=p.isbn)then
			Agregar(a1^.HI,p)
		else
			Agregar(a1^.HD,p);
	end;
end;

procedure AgregarAdelante (var L:lista ; p:prestamo);
var
	nue:Lista;
begin
	new(nue);
	nue^.dato.numero:=p.numero;
	nue^.dato.dia:=p.dia;
	nue^.dato.mes:=p.mes;
	nue^.dato.cantdias:=p.cantdias;	
	nue^.sig:=nil;
	if(L=nil)then
		L:=nue
	else begin
		nue^.sig:=L;
		L:=nue;
	end;
end;

{procedure Agregar2(var a2:arbolB ; p:prestamo) ;
begin
	if(a2^.dato.isbn = p.isbn)then 
		AgregarAdelante(a2^.dato.ListaP,p)
	else begin
		if(a2^.dato.isbn>p.isbn)then
			Agregar2(a2^.HI,p)
		else
			Agregar2(a2^.HD,p);
	end;
	
end;}

procedure Agregar2(var a2:arbolB ; p:prestamo);
begin
	if(a2=nil)then begin
		new(a2);
		a2^.dato.ListaP:=nil;
		a2^.dato.isbn:=p.isbn;
		AgregarAdelante(a2^.dato.ListaP,p);
		a2^.HI:=nil;
		a2^.HD:=nil;
	end
	else begin
		if(a2^.dato.isbn>p.isbn)then
			Agregar2(a2^.HI,p)
		else if(a2^.dato.isbn =p.isbn)then
					AgregarAdelante(a2^.dato.ListaP,p)
		else
			Agregar2(a2^.HD,p);
	end;
end;



{i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).}

procedure CargarArboles (var a1:arbolA ; var a2:arbolB);
var
	p:prestamo;
begin
	a1:=nil;
	a2:=nil;
	randomize;
	LeerPrestamo(p);
	while(p.isbn<>0)do begin
		Agregar(a1,p);
		Agregar2(a2,p);
		LeerPrestamo(p);
	end;
end;

procedure ImprimirOrdenCreciente (a1:arbolA);	//i. Informar los datos de los socios en orden creciente por número de socio
begin
	if(a1<>nil)then begin
		ImprimirOrdenCreciente(a1^.HI);
		writeln ('ISBN: ', a1^.dato.isbn, ' Numero: ', a1^.dato.numero, ' Dia: ', a1^.dato.dia,' Mes: ',a1^.dato.mes,' Cant de Dias: ',a1^.dato.cantdias);	
		ImprimirOrdenCreciente(a1^.HD);
	end;
end;

procedure InformarOrdenCreciente (a1:arbolA) ;
begin
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol 1 en Orden CRECIENTE (por ISBN)');
	writeln;
	ImprimirOrdenCreciente(a1);
	writeln;
end;


function ObtenerMaximo (a1:arbolA):integer;
begin
	if(a1=nil)then
		ObtenerMaximo:=-1
	else begin
		if(a1^.HD = nil)then
			ObtenerMaximo:=a1^.dato.isbn
		else
			ObtenerMaximo:=ObtenerMaximo(a1^.HD);	//Solo el derecho por el criterio de busqueda
	end;
end;


procedure ISBNMasGrande (a1:arbolA); //b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más grande.
var
	MasGrande:integer;
begin
	writeln ('---------------------------------------------------');
	writeln;
	MasGrande:=ObtenerMaximo(a1);
	if(MasGrande<>-1)then
		writeln('ISBN mas grande: ',MasGrande)
	else
		writeln('Arbol Vacio');
	writeln;
end;


procedure ImprimirLista (n:NodoPrestamos);
begin
	writeln('ISBN: ',n.isbn);
	while(n.ListaP <> nil)do begin
		writeln('Numero: ',n.ListaP^.dato.numero,' Dia: ',n.ListaP^.dato.dia,' Mes: ',n.ListaP^.dato.mes,' Cant de Dias: ',n.ListaP^.dato.cantdias);
		n.ListaP:=n.ListaP^.sig;
	end;
end;


procedure ImprimirOrdenCreciente2 (a2:arbolB);	//i. Informar los datos de los socios en orden creciente por número de socio
begin
	if(a2<>nil)then begin
		ImprimirOrdenCreciente2(a2^.HI);
		ImprimirLista(a2^.dato);	
		ImprimirOrdenCreciente2(a2^.HD);
	end;
end;

procedure InformarOrdenCreciente2 (a2:arbolB);
begin
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol de lista 2 en Orden CRECIENTE (por ISBN)');
	writeln;
	ImprimirOrdenCreciente2(a2);
	writeln;
end;

function ObtenerMinimo (a2:arbolB):integer;
begin
	if(a2=nil)then
		ObtenerMinimo:=-1
	else begin
		if(a2^.HI = nil)then
			ObtenerMinimo:=a2^.dato.isbn
		else
			ObtenerMinimo:=ObtenerMinimo(a2^.HI);	//Solo el Izquierdo por el criterio de busqueda
	end;
end;


{c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.}
procedure ISBNMasChico (a2:arbolB);
var
	MasChico:integer;
begin
	writeln('---------------------------------------------------');
	writeln;
    MasChico:=ObtenerMinimo(a2);
	if(MasChico<>-1)then
		writeln('ISBN mas Chico: ',MasChico)
	else
		writeln('Arbol Vacio');
	writeln;
end;

{d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.}

function CantidadPrestamos(a1:arbolA ; num:integer):integer;
begin
	if(a1=nil)then
		CantidadPrestamos:=0
	else begin
		if(a1^.dato.numero = num)then
			CantidadPrestamos:=1+CantidadPrestamos(a1^.HI,num)+CantidadPrestamos(a1^.HD,num)
		else
			CantidadPrestamos:=CantidadPrestamos(a1^.HI,num)+CantidadPrestamos(a1^.HD,num);
	end;
end;

procedure InformarPrestamos (a1:arbolA);
var
	num:integer;
begin
	writeln('---------------------------------------------------');
	writeln;
	write('Ingrese el Numero de Socio: ');
	readln(num);
	writeln;
	writeln('La cantidad de Prestamos Realizados por el Socio de Numero |',num,'| es: ',CantidadPrestamos(a1,num));
	writeln;
end;


procedure CantidadPrestamos2(a2: arbolB; num: integer; var cant: integer);
var
	aux:lista;
begin
	if(a2<>nil)then begin
		aux:= a2^.dato.ListaP;
		while(aux<>nil)do begin
			if(aux^.dato.numero = num) then
						cant:= cant+1;
					aux:= aux^.sig;
				end;
			CantidadPrestamos2(a2^.HI, num, cant);
			CantidadPrestamos2(a2^.HD, num, cant);
		end;
end;	

{e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.}

procedure InformarPrestamos2 (a2:arbolB);
var
	num,cant:integer;
begin
	cant:=0;
	writeln('---------------------------------------------------');
	writeln;
	write('Ingrese Otro Numero de Socio: ');
	readln(num);
	writeln;
	CantidadPrestamos2(a2,num,cant);
	writeln('La cantidad de Prestamos Realizados por el Socio de Numero |',num,'| es: ',cant);
	writeln;
end;

{f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.}

procedure AgregarAdelanteF(var L: ListaF; f: prestamoF);
var
    nue: listaF;
begin
    new(nue);
    nue^.dato:= F;
    nue^.sig:= nil;
    if(L=nil)then
		L:=nue
	else begin
		nue^.sig:=L;
		L:=nue;
	end;	
end;


procedure CargarListaF (var L:listaF ; f:prestamoF);
begin
	if((L<>nil)and(f.isbn = L^.dato.isbn))then 
		L^.dato.cantTotal:=L^.dato.cantTotal+1	//Actualizo la cantidad
	else begin
		f.cantTotal:=1;
		AgregarAdelanteF(L,f);	//Cada nodo de la lista
	end;
end;

procedure RecorrerF (a1:arbolA ; var L:listaF);
var
	f:prestamoF;
begin
	if(a1<>nil)then begin
		RecorrerF(a1^.HD,L);
		f.isbn:=a1^.dato.isbn;
		CargarListaF(L,f);
		RecorrerF(a1^.HI,L);
	end;
end;

procedure ImprimirListaF(L: ListaF);
begin
	while(L<>nil) do
		begin
			writeln('ISBN=', L^.dato.isbn, ' Cantidad=', L^.dato.cantTotal);
			L:= L^.sig;
		end;
end;

procedure InformarListaF (a1:arbolA);
var
	L:listaF;
begin
	L:=nil;
	RecorrerF(a1,L);
	writeln('---------------------------------------------------');
	writeln;
	writeln('Lista F:');
	writeln;
	ImprimirListaF(L);
	writeln;
end;

{g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.}


procedure AgregarAdelanteG(var L: ListaG; g: prestamoF);
var
    nue: listaG;
begin
    new(nue);
    nue^.dato:= G;
    nue^.sig:= nil;
    if(L=nil)then
		L:=nue
	else begin
		nue^.sig:=L;
		L:=nue;
	end;	
end;



procedure RecorrerG(a2:arbolB ; var L:ListaG);
var
	aux:lista;
	g:prestamoF;
begin
	if(a2<>nil)then begin
		RecorrerG(a2^.HD,L);
		g.isbn:=a2^.dato.isbn;
		g.cantTotal:=0;
		aux:=a2^.dato.ListaP;
		while(aux<>nil) do begin
			g.cantTotal:= g.cantTotal+1;
			aux:= aux^.sig;
		end;
		AgregarAdelanteG(L, g);
		RecorrerG(a2^.HI,L);
	end;
end;

procedure ImprimirListaG (L:ListaG);
begin
	while(L<>nil) do
		begin
			writeln('ISBN=', L^.dato.isbn, ' Cantidad=', L^.dato.cantTotal);
			L:= L^.sig;
		end;
end;


procedure InformarListaG (a2:arbolB);
var
	L:ListaG;
begin
	L:=nil;
	RecorrerG(a2,L);
	writeln('---------------------------------------------------');
	writeln;
	writeln('Lista G:');
	writeln;
	ImprimirListaG(L);
	writeln;
end;


{i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}

function CantTotalPrestamos1(a1:arbolA ; min,max:integer):integer;
begin
	if(a1=nil)then
		CantTotalPrestamos1:=0
	else begin
		if((a1^.dato.isbn >= min) and (a1^.dato.isbn <= max))then 
			CantTotalPrestamos1:=1+CantTotalPrestamos1(a1^.HI,min,max)+CantTotalPrestamos1(a1^.HD,min,max)
		else
		if(min<a1^.dato.isbn)then
			CantTotalPrestamos1:=CantTotalPrestamos1(a1^.HI,min,max)
		else
			CantTotalPrestamos1:=CantTotalPrestamos1(a1^.HD,min,max);
	end;
end;


procedure EntreDosValores1(a1:arbolA);
var
	min,max:integer;
	canttotal:integer;
begin
	writeln('---------------------------------------------------');
	writeln;
	write('Ingrese un ISBN Inicial: ');
	readln(min);
	write('Ingrese un ISBN Final (Mayor al Inicial): ');
	readln(max);
	canttotal:=CantTotalPrestamos1(a1,min,max);
	if (canttotal = 0) then 
		writeln ('No hay codigos entre ', min, ' y ', max)
	else begin
         writeln;
         writeln ('La Cantidad total de Prestamos entre el ISBN (',min,') y el ISBN (', max,') es: ',canttotal); 
         writeln;
    end;
end;


{j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}

procedure CantTotalPrestamos2(a2:arbolB ; min,max:integer ; var cant:integer);
var
	aux:lista;
begin
	if(a2<>nil)then begin
		if((a2^.dato.isbn >= min) and (a2^.dato.isbn <= max))then begin
			aux:= a2^.dato.ListaP;
			while (aux <> nil) do begin
				cant:= cant+1;
				aux:= aux^.sig;
			end;
			CantTotalPrestamos2(a2^.HI, min, max, cant);
			CantTotalPrestamos2(a2^.HD, min, max, cant);
		end
			else
			if(a2^.dato.isbn > min) then
				CantTotalPrestamos2(a2^.HI, min, max, cant)
			else
				CantTotalPrestamos2(a2^.HD, min, max, cant);
		end;
end;



procedure EntreDosValores2(a2:arbolB);
var
	cant,min,max:integer;
begin
	writeln('---------------------------------------------------');
	writeln;
	write('Ingrese un ISBN Inicial: ');
	readln(min);
	write('Ingrese un ISBN Final (Mayor al Inicial): ');
	readln(max);
	cant:=0;
	CantTotalPrestamos2(a2,min,max,cant);
	if (cant = 0) then 
		writeln ('No hay codigos entre ', min, ' y ', max)
	else begin
         writeln;
         writeln ('La Cantidad total de Prestamos entre el ISBN (',min,') y el ISBN (', max,') es: ',cant); 
         writeln;
    end;
end;


//Programa Principal

var
	a1:arbolA;
	a2:arbolB;
begin
	CargarArboles(a1,a2);	//A.i,.ii
	InformarOrdenCreciente(a1);	//1B
	ISBNMasGrande(a1);	//B
	InformarOrdenCreciente2(a2); //1C
	ISBNMasChico(a2);	//C
	InformarPrestamos(a1);	//D
	InformarPrestamos2(a2);	//E
	InformarListaF(a1);	//F
	InformarListaG(a2);	//G
	EntreDosValores1(a1);	//I
	EntreDosValores2(a2);	//J
end.
