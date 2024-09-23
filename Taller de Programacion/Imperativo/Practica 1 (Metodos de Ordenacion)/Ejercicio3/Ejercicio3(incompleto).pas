{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de 
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje 
promedio otorgado por las críticas. 
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de 
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el 
código de la película -1. 
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje 
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos 
métodos vistos en la teoría. 
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje, 
del vector obtenido en el punto c)}

program ejercicio3;
type
	rango_cod = 1..8;
	
	pelicula = record
		codigo:integer;
		genero:rango_cod;
		puntaje:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:pelicula;
		sig:lista;
	end;
	
	vector = array [rango_cod] of lista;
	
	vectorPuntaje = array [rango_cod] of pelicula;
	


//Modulos

procedure AgregarAtras (var L:lista ; p:pelicula);
var
	nuevo,aux:lista;
begin
	new(nuevo);
	nuevo^.dato.codigo:=p.codigo;
	nuevo^.dato.genero:=p.genero;
	nuevo^.dato.puntaje:=p.puntaje;
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

procedure InicializarListas(var v:vector);
var
	i:integer;
begin
	for i:=1 to 8 do 
		v[i]:=nil;
end;

procedure leerPelicula (var p:pelicula);
begin
	write('Ingrese el codigo de Pelicula o -1 en caso de no leer mas peliculas: ');
	readln(p.codigo);
	if(p.codigo<>-1)then begin
		write('Ingrese el genero (de 1 a 8): ');
		readln(p.genero);
		write('Ingrese el puntaje: ');
		readln(p.puntaje);
	end;
end;

procedure CargarDatos(var v:vector );   //v: ptros al primero     {}
var																  {Una forma de hacerlo	}
	p:pelicula;  //vUlt: vector; // ptros al ultimo				  {	}
begin
	InicializarListas(v);
	leerPelicula(p);
	while(p.codigo<>-1)do begin
		AgregarAtras(v[p.genero],p);  //		AgregarAtras(v[p.genero],vUlt[p.genero],p);
		leerPelicula(p);
	end;
	writeln(' ');
	writeln('Termino la Lectura');
	writeln(' ');
end;

procedure ImprimirVectorLista(v:vector);
var
	i:integer;
	actual:lista;
begin
	for i := 1 to 8 do
	begin
		writeln('Genero ', i, ':');
		actual := v[i];
		while (actual <> nil) do
		begin
			writeln('------------------');
			writeln('  Codigo: ', actual^.dato.codigo);
			writeln('  Genero: ', actual^.dato.genero);
			writeln('  Puntaje: ', actual^.dato.puntaje);
			actual := actual^.sig;
		end;
		writeln;  
	end;
end;

procedure CodigoMax (L:lista ; var puntajemax,codmax:integer );
var
	max:integer;
begin
	max:=-1;
	while (L<>nil) do begin
		if(L^.dato.puntaje>max)then begin
			codmax:=L^.dato.codigo;
			puntajemax:=L^.dato.puntaje;
			max:=L^.dato.puntaje;
		end;
		L:=L^.sig;
	end;

end;

//b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje 
//obtenido entre todas las críticas, a partir de la estructura generada en a)..

procedure ObtenerMaximos (v:vector ; var vmax:vectorPuntaje );
var
	i:rango_cod;
	codmax,puntajemax:integer;
begin
	for i:=1 to 8 do begin
		CodigoMax(v[i],puntajemax,codmax);
		vmax[i].codigo:=codmax;
		vmax[i].puntaje:=puntajemax;
		vmax[i].genero:= i;
	end;
end;

procedure ImprimirVectorMaximos (vmax:vectorPuntaje);
var
	i:integer;
begin
	for i:=1 to 8 do 
		writeln('El codigo de pelicula con mayor puntaje del genero ',i,' fue: ',vmax[i].codigo,' con un puntaje de: ',vmax[i].puntaje);
end;

procedure OrdenarVector (var v:vectorPuntaje);
var
	i,j,pos,item:integer;
begin
	for i:=1 to (8-1) do begin
		pos:=i;
		for j:=i+1 to 8 do
			if (v[j].puntaje<v[pos].puntaje) then
				pos:=j;
		item:=v[pos].puntaje;
		v[pos].puntaje:=v[i].puntaje;
		v[i].puntaje:=item;
	end;	
end;

procedure ImprimirVectorOrdenado (vmax:vectorPuntaje);
var
	i:integer;
begin
	for i:=1 to 8 do begin
		writeln('Genero: ',vmax[i].genero);
		writeln('Codigo: ',vmax[i].codigo);
		writeln('Puntaje: ',vmax[i].puntaje);
	end;
		
end;

//Programa Principal

var
	v:vector;
	vmax:vectorPuntaje;
begin
	CargarDatos(v);
	writeln(' ');
	writeln('LISTA DE PELICULAS:');
	writeln(' ');
	ImprimirVectorLista(v);
	ObtenerMaximos(v,vmax);
	ImprimirVectorMaximos(vmax);
	writeln(' ');
	writeln('ORDENADO SELECCION:');
	writeln(' ');
	OrdenarVector(vmax);
	ImprimirVectorOrdenado(vmax);
	writeln(' ');
	writeln('El codigo de pelicula con mayor puntaje es: ',vmax[8].codigo);
	writeln('El codigo de pelicula con menor puntaje es: ',vmax[1].codigo);
	writeln;
	readln();
end.
