{a) Implemente un módulo CargarVector que cree un vector de enteros con a lo sumo 50 valores aleatorios. Los valores, generados 
aleatoriamente (entre un mínimo y máximo recibidos por parámetro), deben ser almacenados en el vector en el mismo orden que se 
generaron, hasta que se genere el minimo.}

program Vectores;
const
	DimF=50;

type
	
	VectorAleatorio = array[1..dimF]of integer;

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

procedure ImprimirVector (V:vectorAleatorio ; DimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		writeln('El numero ',i,' generado aleatoriamente fue: ',V[i]);
	end;
end;

var
   DimL,max,min: integer; 
   V: VectorAleatorio;
begin
	randomize;  {Inicializa el generador de números aleatorios}
	DimL:=0;
	writeln('Ingrese el Rango Minimo: ');
	readln(min);	
	writeln('Ingrese el Rango Maximo: ');
	readln(max);
	CargarVector(V,DimL,max,min);
	ImprimirVector(V,DimL);
end.

