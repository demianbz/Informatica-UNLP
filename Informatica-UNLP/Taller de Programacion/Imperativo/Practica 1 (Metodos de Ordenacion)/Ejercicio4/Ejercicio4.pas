{4.- Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código
de rubro (del 1 al 8) y precio. Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y 
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza 
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que 
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos 
métodos vistos en la teoría. 
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d)}

program punto2pr1;
const
	dimF = 30;

type 

	rango_rubro = 1..8;
	rango_3 = 1..dimF;
	
	producto = record
		codigo:integer;
		rubro:rango_rubro;
		precio:real;
	end;
	
	lista = ^nodo;
	nodo = record 
		dato:producto;
		sig:lista
	end;
	
	vector = array [rango_rubro] of lista;
	
	vector3 = array [rango_3] of producto;
	
	
	
//Modulos

procedure leerLibreria (var p:producto);
begin
	write('Ingrese el precio del producto (0 para terminar) : ');
	read(p.precio);
	if (p.precio <> 0) then begin
		write('Ingrese el codigo del producto : ');
		readln(p.codigo);
		write('Ingrese el rubro (1 a 8): ');
		readln(p.rubro);
	end;

end;

procedure InsertarOrdenado(var l:lista;p:producto);
var
	act,ant,nue:lista;
begin
	new (nue); 
    nue^.dato:= p;
    nue^.sig:=nil;
    
    if (L = nil) then   
		L:= nue
		
    else begin
		act:= L; 
		ant:=L;
		
		while((act <> nil) and (act^.dato.codigo < nue^.dato.codigo))do begin
			ant:=act;
			act:= act^.sig;
		end;
	
		if (act = L) then begin
			nue^.sig:= L;  
			L:= nue;
		end
    
		else begin
			ant^.sig:= nue;   
			nue^.sig:= act;
		end;
	
	end;
end;

procedure InicializarVector(var v:vector);
  var
    i:integer;
  begin 
    for i:=1 to 8 do
      v[i]:=nil;
  end;



procedure CargarVector (var v:vector );
var
	p:producto;
begin
	leerLibreria(p);
	while(p.precio<>0)do begin
		InsertarOrdenado(v[p.rubro],p);
		leerLibreria(p);
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
		writeln('Rubro ', i, ':');
		actual := v[i];
		while (actual <> nil) do
		begin
			writeln('------------------');
			writeln('  Codigo: ', actual^.dato.codigo);
			writeln('  Precio: ', actual^.dato.precio:2:2);
			writeln('  Rubro: ', actual^.dato.rubro);
			actual := actual^.sig;
		end;
		writeln;  
	end;
end;

procedure ImprimirCodigos(v:vector);
var
	i:integer;
	actual:lista;
begin
	for i:= 1 to 8 do begin
		writeln('Rubro ',i, ':');
		actual:= v[i];
		while (actual<>nil) do begin
	        writeln(' ');
			writeln('Codigo :',actual^.dato.codigo);
			actual:=actual^.sig;
		end;
		writeln;
	end;
end;

procedure CargarVector3 (var v3:vector3 ; var dimL:integer ; L:lista);
begin
		while((L<>nil) and (dimL<dimF)) do begin
			dimL:=dimL+1;
			v3[dimL]:=L^.dato;
			L:=L^.sig;
		end;
end;

procedure ImprimirVector3 (v3:vector3 ; dimL:integer);
var
	i:integer;
begin
		writeln('Impresion del rubro 3 :');
	for i := 1 to dimL do begin
		writeln(i);
		writeln(' Codigo del Producto :',v3[i].codigo); 
		writeln('Precio del Producto :',v3[i].precio:0:2);
		writeln;
	end;

end;

procedure OrdenarVector(var v3:vector3 ; dimL:integer);
  var  
    i,j:integer;
    aux:producto;
  begin
    for i:=2 to dimL do
      begin
        aux:=v3[i];
        j:=i-1;
        while((j>0)and(v3[j].precio>aux.precio))do
          begin
            v3[j+1]:=v3[j];
            j:=j-1;
          end;
        v3[j+1]:=aux;
      end;
  end;

procedure ImprimirVectorOrdenado (v3:vector3 ; dimL:integer);
var
	i:integer;
begin
	for i := 1 to dimL do begin
		writeln(i);
		writeln(' Codigo del Producto :',v3[i].codigo); 
		writeln('Precio del Producto :',v3[i].precio:0:2);
		writeln;
	end;

end;

function Promedio (v3:vector3;dimL:integer):real;
var
	i:integer;
	suma:real;
begin
	suma:=0;
	for i := 1 to dimL do 
		suma := v3[i].precio + suma;
	Promedio:= (suma / dimL);
end;



//Programa Principal
	
var
	v:vector;
	v3:vector3;
	dimL:integer;
begin
	dimL:=0;
	InicializarVector(v);
	CargarVector(v);
	if (v[3] <> nil) then begin
		CargarVector3(v3,dimL,v[3]);
		ImprimirVector3(v3,dimL)
	end
	else
		writeln ('El Rubro 3 esta vacio');
	//d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos métodos vistos en la teoría.
	OrdenarVector(v3,dimL);
	writeln(' ');
	writeln('VECTOR ORDENADO POR PRECIO (INSERCION): ');
	writeln(' ');
	ImprimirVectorOrdenado(v3,dimL);
	writeln('El promedio de los precios es: ',promedio(v3,dimL):2:2);
	
end.
