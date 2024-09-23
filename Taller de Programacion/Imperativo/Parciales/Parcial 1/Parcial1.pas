{Una Clinica necesita  un sistema para  el procesamiento  de las atenciones realizadas a los pacientes
a) Implementar un Modulo  que lea informacion  de las atenciones. De cada atencion  se lee: DNI del paciente, 
numero de Mes y codigo de diagnostico (1 a 15). La lectura Finaliza con el mes 0. Se sugiere utilizar el modulo
LeerAtencion (). El modulo debe retornar las estructuras de datos:
i. Una estructura de datos eficiente para la busqueda por DNI del paciente. Para cada DNI debe almacenar la cantidad total de
ateciones recibidas.
ii. Otra estructura de datos con la cantidad de atenciones realizadas para cada diagnostico
b) Implementar un modulo que reciba  la estructura  en a)i, dos numeros de DNI  y un valor entero x . Este modulo debe retornar
la cantidad de pacientes con mas de x atenciones cuyos DNI estan entre los 2 numeros de DNI recibidos.
c) Implementar un Modulo RECURSIVO que reciba la estructura generada en a)ii. y retorne la cantidad de diagnosticos para los
cuales la cantidad de atenciones fue cero

NOTA: Implementar el programa principal, que invoque a los incisos a,b y c. En caso de ser necesario, puede utilizar los modulos 
que se encuentran a continuacion}

program Parcial1;
const
	codigomaxx = 15;
type
	rango_codigo = 1..codigomaxx;

	atencion = record
		DNI:integer;
		mes:integer;
		codigo:rango_codigo;
	end;

	atencionDNI = record
		DNI:integer;
		CantTotal:integer;
	end;


	arbol = ^nodo;
	nodo = record
		dato:atencionDNI;
		HI:arbol;
		HD:arbol;
	end;


	vector = array [rango_codigo] of integer;

//Modulos

procedure LeerAtencion(var a:atencion);
begin
	a.mes:=random(13);
	if(a.mes<>0)then begin
		a.dni:=random(100)+1;
		a.codigo:=random(15)+1;
	end;
end;

{i. Una estructura de datos eficiente para la busqueda por DNI del paciente. Para cada DNI debe almacenar la cantidad total de
ateciones recibidas.}


procedure Agregar (var a:arbol ; at:atencion);
var
	ad:atencionDNI;
begin
	if(a=nil)then begin
		new(a);
		ad.dni:=at.dni;
		ad.CantTotal:=1;
		a^.dato:=ad;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else 
		if(a^.dato.dni = at.dni)then begin
			a^.dato.CantTotal:=a^.dato.CantTotal+1;
		end
		else
			if(a^.dato.dni > at.dni)then
				Agregar(a^.HI,at)
			else
				Agregar(a^.HD,at);
end;

{ii. Otra estructura de datos con la cantidad de atenciones realizadas para cada diagnostico}

procedure InicializarVector (var v:vector);
var
	i:integer;
begin
	for i:=1 to codigomaxx do
		v[i]:=0;
end;



procedure CargarEstructuras(var a:arbol ; var v:vector);
var
	at:atencion;
begin
	randomize;
	InicializarVector(v);
	LeerAtencion(at);
	while(at.mes<>0)do begin
		Agregar(a,at);
		v[at.codigo]:=v[at.codigo]+1;
		LeerAtencion(at);
	end;
end;

procedure ImprimirArbol(a:arbol);
begin
	if(a<>nil)then begin
		ImprimirArbol(a^.HI);
		writeln('DNI: ',a^.dato.DNI,' Cantidad Total de Atenciones: ',a^.dato.CantTotal);
		ImprimirArbol(a^.HD);
	end;
end;

procedure ImprimirVector (v:vector);
var
	i:integer;
begin
	for i:=1 to codigomaxx do 
		writeln('La Cantidad de Acciones realizadas del Diagnostico: ',i,' fueron: ',v[i]);
end;

procedure ImprimirEstructuras(a: arbol ; v:vector);
begin
	writeln('ARBOL Ordenado por DNI:');
	writeln;
	ImprimirArbol(a);
	writeln;
	writeln('VECTOR:');
	writeln;
	ImprimirVector(v);
	writeln;
end;


{b) Implementar un modulo que reciba  la estructura  en a)i, dos numeros de DNI  y un valor entero x . Este modulo debe retornar
la cantidad de pacientes con mas de x atenciones cuyos DNI estan entre los 2 numeros de DNI recibidos.}

function CantAtenciones(a:arbol ; min,max,x:integer):integer;
begin
	if(a=nil)then
		CantAtenciones:=0
	else
		if((a^.dato.DNI>min)and(a^.dato.DNI<max))then begin
			if(a^.dato.CantTotal>x)then
				CantAtenciones:=1+CantAtenciones(a^.HI,min,max,x)+CantAtenciones(a^.HD,min,max,x);
		end
		else 
			if(a^.dato.DNI>min)then
				CantAtenciones:=CantAtenciones(a^.HI,min,max,x)
			else
				CantAtenciones:=CantAtenciones(a^.HD,min,max,x);
end;


procedure EntreDosValores (a:arbol);
var
	min,max,x,cant:integer;
begin
	writeln;
	write('Ingrese un DNI Inicial: ');
	readln(min);
	write('Ingrese un DNI Final (Mas Grande que el Inicial): ');
	readln(max);
	write('Ingrese un valor x: ');
	readln(x);
	cant:=CantAtenciones(a,min,max,x);
	if(cant=0)then
		writeln('No Hay Pacientes entre el DNI ',min,' y el DNI ',max,' con mas de ',x,' Atenciones o el arbol esta Vacio' )
	else begin
		writeln;
		writeln('La Cantidad de Pacientes entre el DNI ',min,' y el DNI ',max,' Con mas de ',x,' Atenciones es: ',cant);
	end;
	writeln;
end;

{c) Implementar un Modulo RECURSIVO que reciba la estructura generada en a)ii. y retorne la cantidad de diagnosticos para los
cuales la cantidad de atenciones fue cero}

function atencionesCero(v:vector; cant, dimL:integer):integer;
begin
    if (dimL = 0) then
        atencionesCero := cant
    else
        begin
            if(v[dimL] = 0) then
                cant:= cant + 1;
            atencionesCero:= atencionesCero(v, cant, dimL-1);
        end;
end;



procedure CantidadDiagnosticos (v:vector);
var
	cant,dimL:integer;
begin
	dimL:=15;
	writeln;
	cant:=0;
	writeln('La Cantidad de diagnosticos con Atenciones = 0 son: ',	atencionesCero(v,cant,dimL));
	writeln;
end;


//Programa Principal

var
	a:arbol;
	v:vector;
begin
	CargarEstructuras(a,v);		//A
	ImprimirEstructuras(a,v);
	EntreDosValores(a);			//B
	CantidadDiagnosticos(v);	//C
end.
