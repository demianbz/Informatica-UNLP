{Una Clinica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes en Julio de 2024.
a) Implementar un modulo que lea la informacion de las atenciones. De cada atencion se lee: matricula del medico, dni del
paciente, dia y diagnostico (valor entre A y F). La lectura Finaliza con el dni 0 . Se sugiere utilizar el modulo  leerAtencion()
El modulo debe retornar dos estructuras:
i. Un arbol binario de busqueda ordenado por matricula del medico. Para cada matricula de medico debe almacenarse la cantidad
de atenciones realizadas
ii. Un vector que almacene en cada posicion el tipo del genero y la lista de los DNI de pacientes atendidos con ese diagnostico
b) Implementar un modulo que reciba el arbol generado en a), una matricula y retorne la cantidada total de atenciones realizadas
por los medicos con matricula superior a la matricula ingresada.
c) Realizar un modulo recursivo que reciba el vector generado en a) y retorne el diagnostico con mayor cantidad de pacientes 
atendidos.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c. En caso de ser necesario, puede utilizar los modulos
que se encuentran a continuacion.}

program Parcial2;
type

	atencion = record
		matricula:integer;
		DNI:integer;
		dia:integer;
		diagnostico:char;
	end;

	medico = record
		matricula:integer;
		cant:integer;
	end;

	arbol=^nodo;
	nodo=record
		dato:medico;
		HI:arbol;
		HD:arbol;
	end;

	lista = ^nodoL;
	nodoL = record
		dato:integer;
		sig:lista;
	end;
	
	vector = array ['A'..'F'] of lista;


//Modulos

procedure LeerAtencion (var at:atencion);
var
	v:array [1..6] of char = ('A','B','C','D','E','F');
begin
	at.DNI:=random(10);
	if(at.DNI<>0)then begin
		at.matricula:=random(200);
		at.dia:=random(31)+1;
		at.diagnostico:=v[random(6)+1];
	end;
end;

{i. Un arbol binario de busqueda ordenado por matricula del medico. Para cada matricula de medico debe almacenarse la cantidad
de atenciones realizadas}

procedure AgregarArbol(var a:arbol ; at:atencion);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.matricula:=at.matricula;
		a^.dato.cant:=1;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(a^.dato.matricula = at.matricula)then begin
			a^.dato.cant:=a^.dato.cant+1;
		end
	else
		if(a^.dato.matricula > at.matricula)then
			AgregarArbol(a^.HI,at)
		else
			AgregarArbol(a^.HD,at);
end;

procedure Imprimir (a:arbol);
begin
	writeln('Matricula de Medico: ',a^.dato.matricula);
	writeln('Cantidad de Atenciones: ',a^.dato.cant);
end;

procedure ImprimirArbol(a:arbol);
begin
	if(a<>nil)then begin
		ImprimirArbol(a^.HI);
		Imprimir(a);
		ImprimirArbol(a^.HD);
	end;
end;

procedure InicializarVectorLista(var v:vector);
var
	i:char;
begin
	for i:='A' to 'F' do
		v[i]:=nil;
end;	

{ii. Un vector que almacene en cada posicion el tipo del genero y la lista de los DNI de pacientes atendidos con ese 
diagnostico}

procedure AgregarAdelante (var L:lista ; dni:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=dni;
	nue^.sig:=nil;
	if(L=nil)then
		L:=nue
	else begin
		nue^.sig:=L;
		L:=nue;
	end;
end;

procedure ImprimirLista (L:lista);
begin
	while(L<>nil)do begin
		writeln('DNI: ',L^.dato);
		L:=L^.sig;
	end;
end;

procedure ImprimirVector (v:vector);
var
	i:char;
begin
		for i:='A' to 'F' do begin
			writeln ('Lista de Los DNI de pacientes atendidos por el DIAGNOSTICO ',i);
			ImprimirLista(v[i]);
		end;
end;

procedure CargarEstructuras (var a:arbol ; var v:vector);
var
	at:atencion;
begin
	a:=nil;
	randomize;
	LeerAtencion(at);
	InicializarVectorLista(v);
	while (at.dni<>0) do begin
		AgregarArbol(a,at);
		AgregarAdelante(v[at.diagnostico],at.dni);
		LeerAtencion(at);
	end;
	writeln('IMPRIMO ARBOL');
	writeln;
	ImprimirArbol(a);
	writeln('IMPRIMO VECTOR');
	writeln;
	ImprimirVector(v);
end;

{b) Implementar un modulo que reciba el arbol generado en a), una matricula y retorne la cantidada total de atenciones 
realizadas por los medicos con matricula superior a la matricula ingresada.}

function CantAtenciones (a:arbol ; m:integer):integer;
begin
	if(a=nil)then
		CantAtenciones:=0
	else
		if(a^.dato.matricula > m)then
			CantAtenciones:=a^.dato.cant+CantAtenciones(a^.HI,m)+CantAtenciones(a^.HD,m)
		else
			if(a^.dato.matricula>m)then
				CantAtenciones:=CantAtenciones(a^.HI,m)
			else
				CantAtenciones:=CantAtenciones(a^.HD,m);
end;


procedure IncisoB (a:arbol);
var
	matr:integer;
begin
	write('Ingrese una Matricula: ');
	readln(matr);
	writeln('La cantidad total de atenciones realizadas por los medicos con matricula superior a ',matr,' fueron: ',CantAtenciones(a,matr));
end;

{c) Realizar un modulo recursivo que reciba el vector generado en a) y retorne el diagnostico con mayor cantidad de pacientes 
atendidos.}


function calcularCantPacientes (l:lista):integer;
begin
	if(l=nil) then
		calcularCantPacientes:=0
	else
		calcularCantPacientes:=1 + calcularCantPacientes(l^.sig);
end;


procedure IncisoC (v:vector);
var
	MaxDiagnostico,i:char;
	max,cant:integer;
begin
	max:=-1;
	for i:='A' to 'F' do begin
		cant:=calcularCantPacientes(v[i]);
		if(cant>max)then begin
			max:=cant;
			MaxDiagnostico:=i;
		end;
	end;
	writeln('Diagnostico con mayor cantidad de pacientes Atendidos: ',MaxDiagnostico);
end;

//Programa Principal

var
	a:arbol;
	v:vector;
begin
	CargarEstructuras(a,v);		//A
	IncisoB(a);					//B
	IncisoC(v);					//C
end.
