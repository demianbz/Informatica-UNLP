program MetodoSeleccion;
const
	dimF=50;

type
	vectorAleatorio = array [1..dimF] of integer;

//Modulo

procedure CargarVector (var V:VectorAleatorio ; var DimL: integer ; max,min: integer);
var
	rango,ale:integer;
begin
	rango:=max-min+1;
	ale:=min+random(rango);
	while ((ale<>min) and (DimL<DimF)) do
	begin
		DimL:=DimL+1;
		V[DimL]:= ale;
		ale:=min+random(rango);												
    end;

end;


procedure Seleccion (var V:vectorAleatorio ; dimL:integer);
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

procedure ImprimirVector (V:vectorAleatorio ; DimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		writeln('El numero ',i,' generado aleatoriamente fue: ',V[i]);
	end;
end;

//Programa Principal

var
	max,min:integer;
	V:vectorAleatorio;
	dimL:integer;
begin
	randomize;  {Inicializa el generador de números aleatorios}
	DimL:=0;
	write('Ingrese el Rango Minimo: ');	readln(min);	
	write('Ingrese el Rango Maximo: ');	readln(max);
	CargarVector(V,DimL,max,min);
	writeln('Desordenado:');
	writeln(' ');
	ImprimirVector(V,DimL);
	Seleccion(V,dimL);
	writeln('Ordenado:');
	writeln(' ');
	ImprimirVector(V,dimL);
end.
