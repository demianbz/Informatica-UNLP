program potenciarecursion;

//Modulos 

function PotenciaRecursiva (x,n:integer):integer;
begin
	if(n=0) then
		PotenciaRecursiva:=1
	else if(n=1) then
		PotenciaRecursiva:=x
	else 
		PotenciaRecursiva:=x*PotenciaRecursiva(x,(n-1));
end;	


function PotenciaIterativa (x,n:integer):integer;
var
	i,pot:integeR;
begin
	if(n=0) then
		pot:=1
	else if (n=1) then
		pot:=x
	else begin
		pot:=1;
		for i:=1 to  n do 
			pot:=pot*x;
		end;
	PotenciaIterativa:=pot;
end;





//Programa Principal

var
	x,n:integer;
begin
	writeln('POTENCIACION');
	writeln(' ');
	write('Ingrese el numero Base: ');
	readln(x);
	write('Ingrese la Potencia: ');
	readln(n);
	writeln(' ');
	writeln('ITERATIVA');
	writeln(' ');
	writeln(x,' Elevado a la ',n,' es igual a: ',PotenciaIterativa(x,n));
	writeln(' ');
	writeln('RECURSIVA');
	writeln(' ');
	writeln(x,' Elevado a la ',n,' es igual a: ',PotenciaRecursiva(x,n));
end.
