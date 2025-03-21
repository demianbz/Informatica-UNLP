{Una empresa dispone de la información de las asistencias de sus empleados durante un período de tiempo. De cada empleado conoce: DNI, 
apellido y nombre, código de departamento en el que trabaja (entre 1 y 100), fecha y si estuvo presente o no ese día (no todos los días se
pasa asistencia y los empleados pueden haber estado trabajando o haber faltado). Esta estructura se encuentra ordenada por código de 
departamento. Se pide realizar un programa que informe el departamento con más empleados presentes durante el período evaluado por la empresa.}


program final1;
type
	rango_cod = 1..100;


	empleado = record
		{dni:integer;}
		{apellido:string;}
		nombre:string;
		codigo:rango_cod;
		{fecha:string;}
		presente:boolean;
	end;

	lista = ^nodo;
	nodo = record
		dato:empleado;
		sig:lista;
	end;


//Modulos

procedure leerRegistro(var e:empleado);
var
	asistencia:integer;
begin
	write('Ingrese el nombre: ');readln(e.nombre);
	if(e.nombre<>'xxx')then begin
		write('Ingrese el codigo: ');readln(e.codigo);
		write('Ingrese la asistencia 1(presente), 0(ausente): ');readln(asistencia);
		if(asistencia=1)then
			e.presente:=true
		else
			e.presente:=false
	end;
end;

procedure insertarOrdenado(var L:lista ; e:empleado);
var
	nue,act,ant:lista;
begin
	new(nue);nue^.sig:=nil;nue^.dato:=e;
	if(L=nil)then
		L:=nue
	else begin
		ant:=L;act:=L;
		while((act<>nil)and(act^.dato.codigo<e.codigo))do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(act=L)then begin
			nue^.sig:=L;
			L:=nue;
		end
		else begin
			ant^.sig:=nue;
			nue^.sig:=act;
		end;
	end;
end;

procedure cargarLista(var L:lista); //SE DISPONE
var
	e:empleado;
begin
	leerRegistro(e);
	while(e.nombre<>'xxx')do begin
		insertarOrdenado(L,e);
		leerRegistro(e);
	end;
end;



procedure imprimirLista(L:lista);
begin
	writeln('------Lista Ordenada por codigo------');
	while(L<>nil)do begin
		writeln('Cod: ',L^.dato.codigo);
		writeln('Nom: ',L^.dato.nombre);
		write('Asistencia: ');
		if(L^.dato.presente)then
			writeln('Presente')
		else
			writeln('Ausente');
		L:=L^.sig;
	end;
end;

procedure corteDeControl(L:lista);
var
	cant:integer;
	max:integer;
	codAct:integer;
	codMax:integer;
begin
	max:=-1;
	while(L<>nil)do begin
		cant:=0;
		codAct:=L^.dato.codigo;
		while(L<>nil) and (codAct = L^.dato.codigo)do begin
			if(L^.dato.presente)then
				cant:=cant+1;
			L:=L^.sig;
		end;
		if(cant>=max)then begin
			max:=cant;
			codMax:=codAct;
		end;
	end;
	writeln('');
	writeln('El codigo de departamento con mas empleados presentes es ',codMax, ' con ',max,' empleados presentes');
end;

//Programa Principal

var
	L:lista;
begin
	L:=nil;
	cargarLista(L);	//SE DISPONE
	imprimirLista(L);
	corteDeControl(L);
end.
