{ 2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina 
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura 
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la 
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina. }

program punto2pr1;
const
	dimF = 300;

type 
	
	oficina = record
		codigo:integer;
		dni:integer;
		valor:integer;
	end;
	
	vector = array [1..dimF] of oficina;

//Modulos

procedure leerOficina (var ofi:oficina);
begin
	write('Ingrese el codigo de Identificacion o -1 en caso de no ingresar mas: ');
	readln(ofi.codigo);
	if(ofi.codigo<>-1)then begin
		write('Ingrese el DNI: ');
		readln(ofi.dni);
		write('Ingrese el valor de la expensa: ');
		readln(ofi.valor);
	end;
end;

procedure CargarVector (var v:vector ; var dimL:integer);
var
	ofi:oficina;
begin
	leerOficina(ofi);
	while((ofi.codigo<>-1)and(dimL<dimF))do begin
		dimL:=dimL+1;
		v[dimL]:=ofi;
		leerOficina(ofi);
	end;
	writeln(' ');
	writeln('Termino la Lectura');
	writeln(' ');
end;

procedure Insercion ( var v: vector; dimL: integer );
var
 i,j,actual: integer;	
		
begin
 for i:= 2 to dimL do begin 
     actual:= v[i].codigo;
     j:= i-1; 
     while ((j > 0) and (v[j].codigo > actual)) do      
       begin
         v[j+1].codigo:= v[j].codigo;
		 j:=j-1;
       end;  
     v[j+1].codigo:= actual; 
 end;
end;

procedure Seleccion (var v:vector ; dimL:integer);
var
	i,j,pos,item:integer;
begin
	for i:=1 to (dimL-1) do begin
		pos:=i;
		for j:=i+1 to dimL do
			if v[j].codigo<v[pos].codigo then
				pos:=j;
		item:=v[pos].codigo;
		v[pos].codigo:=v[i].codigo;
		v[i].codigo:=item;
	end;	
end;


procedure ImprimirVector (v:vector ; dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		writeln('---------------------------');
		writeln('Codigo de Identificacion : ',v[i].codigo);
		writeln('DNI : ',v[i].dni);
		writeln('El valor de la expensa : ',v[i].valor);
	end;
end;




//Programa Principal
	
var
	v:vector;
	dimL:integer;
begin
	dimL:=0;
	CargarVector(v,dimL);
	writeln('DESORDENADO:');
	writeln(' ');
	ImprimirVector(v,dimL);
	Insercion(v,dimL);
	writeln(' ');
	writeln('ORDENADO INSERCION:');
	writeln(' ');
	ImprimirVector(v,dimL);
	Seleccion(v,dimL);
	writeln(' ');
	writeln('ORDENADO SELECCION:');
	writeln(' ');
	ImprimirVector(v,dimL);
	
end.

