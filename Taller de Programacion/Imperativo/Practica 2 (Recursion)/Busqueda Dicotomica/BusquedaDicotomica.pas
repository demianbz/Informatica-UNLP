program BusquedaDicotomica;
const 
	dimF = 20;
	min = 1;
	max = 100;
type
	vector = array [1..dimF] of integer;

//Modulos

procedure CargarVector (var v:vector ; var dimL:integer);  //Inciso A
var
	valor,rango:integer;
begin
	rango:=max-min+1;
	valor:=min+random(rango);
	while (dimL<dimF) do begin
		dimL:=dimL+1;
		v[dimL]:=valor;
		valor:=min+random(rango);
	end;
end;

procedure ImprimirVector(v:vector ; dimL:integer);
var
	i:integer;
begin
	for i :=1 to dimL do begin
		writeln('Numero entre (',min,' - ',max,'): ',v[i]);
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

function BusquedaDicotomica (v:vector ; dimL:integer ; num:integer):boolean;
var
	pri,ult,medio:integer;
	ok:boolean;
begin
	ok:=false;
	pri:=1;
	ult:=dimL;
	medio:=(pri+ult) DIV 2;
	
	while((pri<=ult) and (num<>v[medio])) do begin //
		if(num < v[medio])then  //Si el numero es mas chico que la mitad 
			ult:= medio-1		//entonces me quedo con la parte izquierda
		else 
			pri:=medio+1;		//Si no, me quedo con la parte derecha
	    medio:=(pri+ult) DIV 2;  //Vuelvo a partir a la mitad
	end;
	if ((pri<=ult) and (num=v[medio])) then 
		ok:=true;
	BusquedaDicotomica:= ok;	
end;
	




//PP

var
	v:vector;
	dimL:integer;
	num:integer;
begin
	randomize;
	dimL:=0;
	CargarVector(v,dimL);
	ImprimirVector(v,dimL);
	Seleccion(v,dimL);
	writeln;
	writeln('Vector Ordenado: ');
	writeln;
	ImprimirVector(v,dimL);
	writeln;
	write('Ingrese el numero a buscar en el vector (entre ',min,' y ',max,') : ');
	readln(num);
	writeln;
	if (BusquedaDicotomica(v,dimL,num))then
		writeln('El numero ',num,' Se encuentra en el vector')
	else
		writeln('El numero ',num,' No se encuentra en el vector');
end.
