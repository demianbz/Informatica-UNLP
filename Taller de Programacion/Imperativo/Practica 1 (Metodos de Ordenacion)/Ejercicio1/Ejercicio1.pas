{1-Se desea procesar la información de las ventas de productos de un comercio (como máximo 50). 
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el día de la venta, código del producto (entre 1
*  y 15) y cantidad vendida como máximo 99 unidades). El código y el dia deben generarse automáticamente (random) y la cantidad se debe leer.
*  El ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a mayor) de cada código par de producto junto a la 
* cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).
}

program punto1;
const
	dimF = 50;

type
	
	venta = record 
		dia:integer;
		codigo:integer;
		cantidad:integer;
	end;
	
	ventaPar = record
		codigopar:integer;
		cantidadpar:integer;
	end;
	
	vector = array [1..dimF] of venta;
	
	listaPar = ^nodo;
	nodo = record
		dato:ventaPar;
		sig:listaPar;
	end;


//Modulos

procedure LeerVenta (var vent:venta);
begin
	randomize;
	write('Ingrese el dia: ');
	readln(vent.dia);
	if(vent.dia<>0)then begin
		vent.codigo:=random(15)+1;
		write('Ingrese Cantidad: ');
		readln(vent.cantidad);
	end;
end;


procedure CargarVector (var v:vector ; var dimL:integer);
var
	vent: venta;
begin
	LeerVenta(vent); 
	while((vent.dia<>0)and (dimL<DimF))do begin
		dimL:=dimL+1;
		v[dimL]:=vent;
		LeerVenta(vent);
	end;
	writeln(' ');
	writeln('Termino la Lectura');
	writeln(' ');
end;

procedure ImprimirVector (v:vector ; dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		writeln('--------------');
		writeln('Dia: ',v[i].dia);
		writeln('Codigo: ',v[i].codigo);
		writeln('Cantidad: ',v[i].cantidad);	
	end;
end;

procedure OrdenarVector (var v:vector ; dimL:integer);
var
	i,j,pos:integer;
	item:venta;
begin
	for i:= 1 to (dimL-1) do begin  //Busca el minimo y guarda pos en la posicion
		pos:=i;
		for j:=i+1 to dimL do
			if (v[j].codigo<v[pos].codigo) then
				pos:=j;
		//Intercambia V[i] y v[pos]
		item:= v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	end;	
end;

{procedure EliminarVector(var v:vector ; dimL,inf,sup:integer);
var
 i:integer;

begin
  pude:= false;
  if ((pos>= 1) and (pos <= dimL) )then begin //Verifico si la posicion es valida
	for i:= pos to (dimL-1) do
		a[i]:= a[i+1]; 
   pude:= true;
   dimL:= dimL - 1; //Registro que se pudo realizar
  end;
end;

	
end;}

procedure AgregarAtras (var L:listaPar ; cod:integer ; cant:integer);
var
	nuevo,aux:listaPar;
begin
	new(nuevo);
	nuevo^.dato.codigopar:=cod;
	nuevo^.dato.cantidadpar:=cant;
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

procedure CortedeControl(v: vector; dimL: integer; var L: listaPar);
var
codigoActual: integer;
cantidadTotal,pos: integer;
aux: ventaPar;

begin
	pos:= 1;
	while (pos <=dimL) do
		begin
			codigoActual:= v[pos].codigo;
			cantidadTotal:= 0;
			while (pos <=dimL) and (codigoActual = v[pos].codigo) do //Como esta ordenado hago corte de control
				begin
					cantidadTotal:= cantidadTotal + v[pos].cantidad;
					pos:= pos+1;
				end;
			if	(codigoActual MOD 2 = 0) then //Si el codigo actual es Par lo cargo en la lista
				begin
					aux.codigopar:= codigoActual;
					aux.cantidadpar:= cantidadTotal;
					AgregarAtras(L,aux.codigopar,aux.cantidadpar); 
				end;
		end;
end;

procedure ImprimirLista (L:listaPar);
begin
	while (L<>nil) do begin
		writeln('Codigo: ', L^.dato.codigopar, ', Cantidad Vendida: ', L^.dato.cantidadpar);
		L:=L^.sig;
	end;
end;

//Programa Principal


var
	//sup,inf:integer;
	v:vector;
	dimL:integer;
	L:listaPar;
begin
	dimL:=0;
	L:=nil;
	CargarVector(v,dimL);
	ImprimirVector(v,dimL);
	OrdenarVector(v,dimL);
	writeln(' ');
	writeln('VENTAS ORDENADAS POR CODIGO:');
	writeln(' ');
	ImprimirVector(v,dimL);
	writeln(' ');
	{write('Ingrese el Codigo inferior para eliminar: ');
	readln(inf);
	write('Ingrese el Codigo superior para eliminar: ');
	readln(sup);	
	EliminarVector(v,dimL,inf,sup);}
	CortedeControl(v,dimL,L);
	writeln(' ');
	writeln('LISTA DE CODIGOS PARES');
	writeln(' ');
	ImprimirLista(L);
end.

