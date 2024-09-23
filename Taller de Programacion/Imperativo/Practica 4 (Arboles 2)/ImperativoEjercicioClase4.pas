{1. Descargar el programa ImperativoEjercicioClase4.pas. y completar los módulos indicados
en el código.

a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se cargan código
de venta, código del producto vendido, cantidad de unidades vendidas y precio
unitario. El ingreso de las ventas finaliza cuando se lee el código de venta 0.

b. Imprimir el contenido del árbol ordenado por código de producto.

c. Retornar el menor código de producto.

d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.

e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

Program ImperativoClase4;

type 
		venta = record					//de cada venta
               codigoVenta: integer;
               codigoProducto: integer;
               cantUnidades: integer;
               precioUnitario: real;
             end;
     
     productoVendido = record			//de cada producto
                         codigo: integer;
                         cantTotalUnidades: integer;
                         montoTotal: real;
                       end;
                       
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: productoVendido;
                    HI: arbol;
                    HD: arbol;
                 end;
   
   
Procedure CargarVenta (var v: venta);
  begin
    v.codigoVenta:= random (51) * 100;
    If (v.codigoVenta <> 0)
    then begin
           v.codigoProducto:= random (100) + 1;
           v.cantUnidades:= random(15) + 1;
           v.precioUnitario:= (100 + random (100))/2;
         end;
end;    
     
     
Procedure ArmarProducto (var p: productoVendido; v: venta);
begin
     p.codigo:= v.codigoProducto;
     p.cantTotalUnidades:= v.cantUnidades;
     p.montoTotal:= v.cantUnidades * v.precioUnitario;  //la cantidad de unidades vendidas x el precio que vale el producto
end;     
 
     
Procedure InsertarElemento (var a: arbol; elem: venta);
var
	p: productoVendido;
Begin
    if (a = nil) 
    then begin
           new(a);
           ArmarProducto (p, elem);
           a^.dato:= p; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.codigoProducto = a^.dato.codigo) // criterio de ordenacion
         then begin
                a^.dato.cantTotalUnidades:= a^.dato.cantTotalUnidades + elem.cantUnidades; //sumo la cantidad total de unidades vendidas
                a^.dato.montoTotal:= a^.dato.montoTotal + (elem.cantUnidades * elem.precioUnitario); //sumo el monto total de las unidades vendidas
              end
         else if (elem.codigoProducto < a^.dato.codigo) //si el elemento que quiero insertar es mas chico que el que esta
              then InsertarElemento(a^.HI, elem)
              else InsertarElemento(a^.HD, elem); 
End;     

   
procedure ModuloA (var a: arbol);
{ Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total 
de unidades vendidas y el monto total. }
var 
	unaVenta: venta;  
Begin
	 writeln;
	 writeln ('----- Ingreso de ventas y armado de arbol de productos ----->');
	 writeln;
	 a:= nil;
	 CargarVenta (unaVenta); //primero cargo una venta
	 while (unaVenta.codigoVenta <> 0) do
	  begin
	   InsertarElemento (a, unaVenta); //despues cargo el producto vendido
	   CargarVenta (unaVenta);	//vuelvo a cargar una venta
	  end;
	 writeln;
	 writeln ('-----------------------------------------------');
	 writeln;
end;


procedure ImprimirArbol (a: arbol);
begin
    if (a <> nil)then begin
          if (a^.HI <> nil) then ImprimirArbol (a^.HI);
          writeln ('Codigo producto: ', a^.dato.codigo, ' Cantidad unidades: ', a^.dato.cantTotalUnidades, ' Monto total: ', a^.dato.montoTotal:2:2);
          if (a^.HD <> nil) then ImprimirArbol (a^.HD);
         end;
end;

procedure ModuloB (a: arbol);
{ Imprima el contenido del árbol ordenado por código de producto.}
begin
  writeln;
  writeln ('----- Modulo B ----->');
  writeln;
  if ( a = nil) then 
	writeln ('Arbol vacio')
  else 
	ImprimirArbol (a);
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

function ObtenerMinimo (a: arbol): integer; //Obtener Minimo de Un Arbol Aprovechando el orden
begin
	if (a = nil) then 
		ObtenerMinimo:= 9999
    else 
		if (a^.HI = nil) then 
			ObtenerMinimo:= a^.dato.codigo	
        else
			ObtenerMinimo:= ObtenerMinimo (a^.HI)
  end;

procedure ModuloC (a: arbol);
{Retornar el menor código de producto.}   
var 
	menorCodigo: integer;
begin
  writeln;
  writeln ('----- Modulo C ----->');
  writeln;
  write ('Menor codigo de producto: ');
  writeln;
  menorCodigo:= ObtenerMinimo (a);
  if (menorCodigo = 9999) 
  then writeln ('Arbol vacio')
  else begin
         writeln;
         writeln ('El codigo menor es ', menorCodigo); 
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;


function CantidadDeCodigosMenores (a: arbol; cod: integer): integer;
begin
    if(a=nil)then
		CantidadDeCodigosMenores:=0
	else begin
		if(a^.dato.codigo < cod)then
			CantidadDeCodigosMenores:=CantidadDeCodigosMenores(a^.HI,cod)+CantidadDeCodigosMenores(a^.HD,cod)+1
		else
			CantidadDeCodigosMenores:=CantidadDeCodigosMenores(a^.HI,cod)//Le paso solo el izquierdo porque el arbol esta ordenado
	end;
end;

procedure ModuloD (a: arbol);
//Retornar la cantidad de códigos que existen en el árbol que son menores que un valor que se recibe como parámetro 
var cantidad, unCodigo: integer;
begin
  writeln;
  writeln ('----- Modulo D ----->');
  writeln;
  write ('Ingresar un codigo: ');
  readln (unCodigo);
  cantidad:= CantidadDeCodigosMenores (a, unCodigo);
  writeln;
  writeln ('La cantidad de codigos menores al codigo ', unCodigo, ' es: ', cantidad);
  writeln;
  writeln; 
  writeln ('-----------------------------------------------');
  writeln;
end;

function ObtenerMontoTotalEntreDosCodigos (a: arbol; min, max: integer): real;
begin
	if(a=nil)then
		ObtenerMontoTotalEntreDosCodigos:=0
	else begin
		if((a^.dato.codigo>min) and (a^.dato.codigo<max))then begin
			ObtenerMontoTotalEntreDosCodigos:=a^.dato.montoTotal+ObtenerMontoTotalEntreDosCodigos(a^.HI,min,max)+ObtenerMontoTotalEntreDosCodigos(a^.HD,min,max);
		end
		else 
			if(a^.dato.codigo > min)then
				ObtenerMontoTotalEntreDosCodigos:=ObtenerMontoTotalEntreDosCodigos(a^.HI,min,max)
			else
				ObtenerMontoTotalEntreDosCodigos:=ObtenerMontoTotalEntreDosCodigos(a^.HD,min,max);
	end;
end;

procedure ModuloE (a: arbol);
//Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos 
//comprendidos entre los dos valores recibidos (sin incluir).    
var 
	codigo1, codigo2: integer;
    montoTotal: real;
begin
  writeln;
  writeln ('----- Modulo E ----->');
  writeln;
  write ('Ingrese primer codigo de producto: ');
  readln (codigo1);
  write ('Ingrese segundo codigo de producto (mayor al primer codigo): ');
  readln (codigo2);
  writeln;
  montoTotal:= ObtenerMontoTotalEntreDosCodigos (a, codigo1, codigo2);
  if (montoTotal = 0) 
  then writeln ('No hay codigos entre ', codigo1, ' y ', codigo2)
  else begin
         writeln;
         writeln ('El monto total entre el codigo (',codigo1, ') y el codigo (', codigo2, ') es: ', montoTotal:2:2); 
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

var 
	a: arbol; 
Begin
  randomize;
  ModuloA (a);
  ModuloB (a);
  ModuloC (a);
  ModuloD (a);
  ModuloE (a);   
End.
