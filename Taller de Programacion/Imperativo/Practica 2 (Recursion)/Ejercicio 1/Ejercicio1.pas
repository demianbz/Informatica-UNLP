{1.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de a lo sumo 15 números enteros “random” mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con 
el valor 20.
b. Un módulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un módulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores pares contenidos en el vector.
e. Un módulo recursivo que reciba el vector generado en a) y devuelva el máximo valor del vector.
f. Un módulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector o falso en caso contrario.
g. Un módulo que reciba el vector generado en a) e imprima, para cada número contenido en el vector, sus dígitos en el orden en que aparecen en el número. 
Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 142, se debe imprimir 1  4  2
}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);               //inciso A

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  randomize;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer);                     //inciso B
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);            //inciso C
begin    	
	if dimL > 0 then begin
		ImprimirVectorRecursivo(v,(dimL-1));
		writeln(v[dimL]);
	end;
end;

    
function SumarRecursivo (v: vector;dimL: integer): integer;

  Begin
	if dimL = 0 then
			SumarRecursivo := 0  // Caso base: si la posición supera la dimensión lógica, devuelve 0
	else if v[dimL] mod 2 = 0 then
		SumarRecursivo := v[dimL] + SumarRecursivo(v, dimL-1)  // Si el valor es par, lo suma y continúa con la recursión
	else
		SumarRecursivo := SumarRecursivo(v, dimL-1);  // Si el valor no es par, solo continúa con la recursión
  End;


function  ObtenerMaximo (v: vector; dimL: integer): integer;
	function maximoRecursivo(v: vector; diml: integer; max: integer): integer;
	begin
		if (diml = 0) then
			maximoRecursivo:= max
		else
		begin
			if(v[diml] > max) then
				max:= v[diml];
			maximoRecursivo:= maximoRecursivo(v,diml-1,max);
		end;
	end;
var max: integer;
begin
	max:= -99;
	obtenermaximo:= maximoRecursivo(v,diml,max);
end;     
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;
begin
	if (diml > 0) then
		begin
			if (valor = v[diml]) then
				BuscarValor:= True
			else
				BuscarValor:= BuscarValor(v,diml-1,valor);
		end
	else
		BuscarValor:= False;
end; 

procedure ImprimirDigitos (v: vector; dimL: integer);
	procedure imprimirDigitosRecursivo(numero: integer);
	begin
		if numero <> 0 then
			begin
				imprimirDigitosRecursivo(numero div 10);
				write(numero mod 10,' ');
			end;
	end;
var i: integer;
begin    
	for i:= 1 to DimF do
		begin
			writeln('numero ',i,': ', v[i]);
			imprimirDigitosRecursivo(v[i]);
			writeln;
		end;
end; 

var dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
Begin 
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);
                       ImprimirVectorRecursivo (v, dimL);
                     end;
  writeln;
  writeln;                   
  suma:= SumarRecursivo(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);
end.
