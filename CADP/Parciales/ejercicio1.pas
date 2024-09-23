{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
película, para ello se debe leer y almacenar la información de las personas que desean participar de
dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación
que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega
una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

program ejercicio1;
type
	actores = record
		DNI: integer;
		apellido: string;
		nombre: string;
		edad: integer;
		codigo: 1..5;
	end;
	lista = ^nodo;
	nodo = record
		dato: actores;
		sig: lista;
	end;
	vectorContador = array [1..5] of integer;
procedure leerActores (var a: actores);
begin
	writeln('Ingresa el DNI del actor: ');
	readln(a.DNI);
	if (a.DNI <> 3354) then
	begin
		writeln('Ingresa el apellido del actor: ');
		readln(a.apellido);
		writeln('Ingresa el nombre del actor: ');
		readln(a.nombre);
		writeln('Ingresa la edad del actor: ');
		readln(a.edad);
		writeln('Ingresa el codigo del actor: ');
		readln(a.codigo);
	end;
end;
procedure crearLista (var pri:lista);
begin
	pri:= nil;
end;
procedure agregarAdelante (var pri:lista; nuevoActor: actores);
var
	nuevo: lista;
begin
	new (nuevo);
	nuevo^.sig:= pri;
	nuevo^.dato:= nuevoActor;
	pri:= nuevo;
end;
procedure cargarLista (var pri:lista);
var
	actor: actores;
begin
	repeat
		leerActores (actor);
		agregarAdelante (pri,actor);
	until (actor.DNI = 3354);
end;
procedure iniciarVector (var v:vectorContador);
var
	i:integer;
begin
	for i:= 1 to 5 do begin
		v[i]:= 0;
	end;
end;

{c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

procedure eliminarNodo(pri:lista; DNI: integer);
var
	actual, anterior: lista;
begin
	actual:= pri;
	while ((actual <> nil) and (actual^.dato.dni <> DNI)) do begin
		anterior:= actual;
		actual:= actual^.sig;
	end;
	if (actual <> nil) then
		if (actual = pri) then
			pri:= pri^.sig
		else
			anterior^.sig:= actual^.sig;
		dispose (actual);
end;

function cumplePar (DNI:integer): boolean;
var
	dig:integer;
	pares,impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while (DNI <> 0) do begin
		dig:= DNI mod 10;
		if (dig MOD 2= 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		DNI:= DNI div 10
	end;
	if (pares > impares) then
		cumplePar:= true
	else
		cumplePar:= false;
end;


procedure recorrer (var codigoMax1,codigoMax2,personasDNIpar: integer; var v:vectorContador; pri:lista);
var
	max1,max2,i: integer;
begin
	max1:= -1;
	max2:= -1;
	personasDNIpar:= 0;
	while (pri <> nil) do 
	begin
		v[pri^.dato.codigo]:= v[pri^.dato.codigo] + 1;
		if (cumplePar(pri^.dato.DNI))then
			personasDNIpar:= personasDNIpar + 1;
	end;
	for i:= 1 to 5 do begin
		if (v[i] > max1) then begin
			max2:= max1;
			max1:= v[i];
			codigoMax2:= codigoMax1;
			codigoMax1:= i;
			end
		else begin
			if(v[i] > max2) then begin
				codigoMax2:= i;
				max2:= v[i];
			end;
		end;
	end;
end;

var
	pri: lista;
	v: vectorContador;
	codigoMax1, codigoMax2, personasDNIpar: integer;
	eliminarDNI: integer;
begin
	crearLista (pri);
	iniciarVector (v);
	cargarLista (pri);
	recorrer (codigoMax1, codigoMax2, personasDNIpar, v, pri);
	writeln ('La cantidad de actores con DNI con digitos mas pares que impares es: ', personasDNIpar);
	writeln ('Los codigos de generos mas elegidos son: ', codigoMax1, ' y ', codigoMax2);
	writeln('Ingresa el DNI que desea eliminar: ');
	readln(eliminarDNI);
	eliminarNodo (pri, eliminarDNI);
end.
