{Se lee informacion de Libros, de cada libro se conoce codigo de libro, nombre de autor, titulo, nombre de genero
me pide hacer un programa que almacene cada autor con su cantidad de total de libros.
La informacion viene ordenada por nombre de genero, la lectura finaliza con el codigo -1}


program final9;
type
	libro = record
		codigo:integer;
		autor:string;
		titulo:string;
		genero:string;
	end;
	
	infoLista = record
		autor:string;
		cantL:integer;
	end;
	
	
	libros = ^nodo;
	nodo = record
		dato:libro;
		sig:libros;
	end;
	
	lista = ^nodo2;
	nodo2 = record
		dato:infoLista;
		sig:lista;
	end;
	
	
procedure cargarLibros(var L:libros);	//SE DISPONE	
//IMPLEMENTO EL CARGAR LIBROS PARA PROBAR SI ESTA BIEN LO QUE HICE
var
    nue, ult: libros;
begin
    L := nil;
    ult := nil;

    // Libro 1
    new(nue);
    nue^.dato.codigo := 1;
    nue^.dato.autor := 'Borges';
    nue^.dato.titulo := 'Ficciones';
    nue^.dato.genero := 'Cuento';
    nue^.sig := nil;
    L := nue;
    ult := nue;

    // Libro 2
    new(nue);
    nue^.dato.codigo := 2;
    nue^.dato.autor := 'Borges';
    nue^.dato.titulo := 'El Aleph';
    nue^.dato.genero := 'Cuento';
    nue^.sig := nil;
    ult^.sig := nue;
    ult := nue;
    
    // Libro 3
    new(nue);
    nue^.dato.codigo := 3;
    nue^.dato.autor := 'Cortazar';
    nue^.dato.titulo := 'Rayuela';
    nue^.dato.genero := 'Novela';
    nue^.sig := nil;
    ult^.sig := nue;
    ult := nue;

    // Libro 4
    new(nue);
    nue^.dato.codigo := 4;
    nue^.dato.autor := 'Sabato';
    nue^.dato.titulo := 'El Tunel';
    nue^.dato.genero := 'Novela';
    nue^.sig := nil;
    ult^.sig := nue;
    ult := nue;

	// Libro 5
    new(nue);
    nue^.dato.codigo := 5;
    nue^.dato.autor := 'Borges';
    nue^.dato.titulo := 'El Pepe';
    nue^.dato.genero := 'Terror';
    nue^.sig := nil;
    ult^.sig := nue;
    ult := nue;


    // Nodo de corte (-1)
    new(nue);
    nue^.dato.codigo := -1;
    nue^.sig := nil;
    ult^.sig := nue;
    
 end;

procedure agregarAutor(var L:lista ; autor:string);
var
	nue:lista;
	encontre:boolean;
	aux:lista;
begin
	if(L=nil)then begin
		new(nue) ; nue^.dato.autor:=autor ; nue^.dato.cantL:=1 ; nue^.sig:=nil;
		L:=nue;
	end
	else begin
		aux:=L;
		encontre:=false;
		while((aux<>nil)and(not encontre))do begin
			if(aux^.dato.autor=autor)then begin
				aux^.dato.cantL:=aux^.dato.cantL+1;
				encontre := true;
			end;
			aux:=aux^.sig;
		end;
		if(not encontre)then begin
			new(nue);nue^.dato.autor:=autor;nue^.dato.cantL:=1;nue^.sig:=nil;
			nue^.sig:=L;
			L:=nue;
		end;
	end;
end;

procedure cargarLista(var L:lista ; listaL:libros);
begin
	while((listaL<>nil) and (listaL^.dato.codigo<>-1))do begin
		agregarAutor(L,listaL^.dato.autor);
		listaL:=listaL^.sig;
	end;
end;


procedure imprimirListaAutores(L:lista);
begin
    writeln('--- Cantidad de libros por autor ---');
    while L<>nil do begin
        writeln('Autor: ', L^.dato.autor, ' | Libros: ', L^.dato.cantL);
        L := L^.sig;
    end;
end;


var
	listaL:libros;
	L:lista;
begin
	cargarLibros(listaL);	//SE DISPONE
	L:=nil;
	cargarLista(L,listaL);
	imprimirListaAutores(L);
end.
