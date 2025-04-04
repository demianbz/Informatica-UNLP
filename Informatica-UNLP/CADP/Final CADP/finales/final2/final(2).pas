{Una empresa dispone de una estructura de datos con los clientes de su comercio (a lo sumo 500). De cada cliente se conoce el numero de 
cliente, el numero de dni y el monto que se paga. Se pide implementar un programa que informe la cantidad de clientes cuyo numero de DNI es
capicua(es igual leerlo de izquiera a derecha que de derecha a izquierda).}

program final2;

const
	dimF = 500;
	
type
	cliente = record
		numero:integer;
		dni:integer;
		monto:real;
	end;

	vectorClientes = array [1..dimF] of cliente;
	
//Modulos

procedure cargarVector(var v:vectorClientes ; var dimL:integer);	//SE DISPONE
begin
	v[1].dni := 31613;
	v[2].dni := 17947;
	v[3].dni := 26062;
	v[4].dni := 5885;
	v[5].dni := 30963;
	dimL:=5;
end;

function esCapicua (num:integer):boolean;
var
	digito,reverso,original:integer;
begin
	reverso:=0;
	original:=num;
	while(num>0)do begin
		digito:=num MOD 10;
		reverso:=reverso * 10 + digito;
		num:=num DIV 10
	end;
	esCapicua:=(reverso = original); 
end;

procedure capicua (v:vectorClientes ; dimL:integer);
var
	i:integer;
	num:integer;
	cant:integer;
begin
	cant:=0;
	for i:=1 to dimL do begin
		num:=v[i].dni;
		if(esCapicua(num))then
			cant:=cant+1;
	end;
	writeln('La cantidad de clientes con dni capicua es: ',cant);
end;
//Programa Principal

var
	v:vectorClientes;
	dimL:integer;
begin
	cargarVector(v,dimL);	//SE DISPONE	
	capicua(v,dimL);
end.
