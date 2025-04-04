program MetodoInsercion;
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


procedure Insercion ( var v: vectorAleatorio; dimL: integer );
var
 i,j,actual: integer;	
		
begin
 for i:= 2 to dimL do begin 
     actual:= v[i];
     j:= i-1; 
     while ((j > 0) and (v[j] > actual)) do      
       begin
         v[j+1]:= v[j];
		 j:=j-1;
       end;  
     v[j+1]:= actual; 
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
	Insercion(V,dimL);
	writeln('Ordenado:');
	writeln(' ');
	ImprimirVector(V,dimL);
end.
