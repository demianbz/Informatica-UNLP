{3.- Implementar un programa que invoque a los siguientes módulos.

a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).

b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)

c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}



program ejercicio3P2;
const 
	dimF = 20;
	min = 300;
	max = 1550;
type
	vector = array [1..dimF] of integer;

//Modulos

procedure CargarVectorRecursivo (var v:vector ; var dimL:integer);  //Inciso A
var
	valor,rango:integer;
begin
	rango:=max-min+1;
	valor:=min+random(rango);
	if (dimL<dimF) then begin
		dimL:=dimL+1;
		v[dimL]:=valor;
		CargarVectorRecursivo(v,dimL);
	end;
end;

procedure ImprimirVectorRecursivo(v:vector ; dimL:integer);
begin
	if (dimL > 0) then begin
		ImprimirVectorRecursivo(v, dimL-1);
		writeln('Numero entre (300 - 1550): ',v[dimL]);
	end;
	
end;


procedure Seleccion (var v:vector ; dimL:integer);
var
	i,j,pos,item:integer;
begin
	for i:=1 to (dimL-1) do begin
		pos:=i;
		for j:=i+1 to dimL do
			if v[j]<v[pos] then
				pos:=j;
		item:=v[pos];
		v[pos]:=v[i];
		v[i]:=item;
	end;	
end;


Procedure BusquedaDicotomica (v: vector; pri,ult: integer; dato:integer; var pos: integer);
var
	medio:integer;
begin
	if (pri > ult) then
		pos:=-1
		
	else begin
		medio:=(pri + ult) DIV 2;
			
		if (dato < v[medio]) then begin			//Si el dato es menor al medio
			ult:=medio-1;						//Me quedo con la parte Izquierda
			busquedaDicotomica(v,pri,ult,dato,pos);
		end
		
		else begin
			pri:=medio+1;					    //Sino me quedo con la parte derecha
			busquedaDicotomica(v,pri,ult,dato,pos);
		end;
	
	end;
	
	if ((pri<=ult) and (dato=v[medio])) then 
		pos:= medio;

end;

//Programa Principal

var
	v:vector;
	dato,pri,ult,pos,dimL:integer;
begin
	randomize;
	dimL:=0;
	CargarVectorRecursivo(v,dimL);
	ImprimirVectorRecursivo(v,dimL);
	Seleccion(v,dimL);
	writeln;
	writeln('Vector Ordenado: ');
	writeln;
	ImprimirVectorRecursivo(v,dimL);
	writeln;
	write('Ingrese el numero a buscar en el vector (entre ',min,' y ',max,') : ');
	readln(dato);
	writeln;
	pri:=1;
	ult:=dimL;
	pos:=0;
	BusquedaDicotomica(v,pri,ult,dato,pos);
	if(pos<>-1)then 
		writeln('El numero ',dato,' se encuentra en el vector en la posicion: ',pos)
	else
		writeln('El numero ',dato,' no se encuentra en el vector');
end.
