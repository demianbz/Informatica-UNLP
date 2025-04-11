{1. Una empresa posee un archivo con información de los ingresos percibidos por diferentes 
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado, 
nombre y monto de la comisión. La información del archivo se encuentra ordenada por 
código de empleado y cada empleado puede aparecer más de una vez en el archivo de 
comisiones.  
Realice un procedimiento que reciba el archivo anteriormente descrito y lo compacte. En 
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una 
única vez con el valor total de sus comisiones. 
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser 
recorrido una única vez.}

program ejercicio1p2;
const
	valor_alto = 9999;
type

	empleado = record
		codigo:integer;
		nombre:string;
		monto:real;
	end;

	archivo_empleados = file of empleado;


//Modulos

procedure imprimirEmpleado(var e:empleado);
begin
	writeln('-Codigo:',e.codigo,'  -Nombre:',e.nombre,'  -Monto:',e.monto:2:2);
end;

procedure leerEmpleado(var e:empleado);
begin
	write('Ingrese el codigo: ');readln(e.codigo);
	if(e.codigo<>0)then begin
		write('Ingrese el nombre: ');readln(e.nombre);
		write('Ingrese el monto: ');readln(e.monto);
	end;
end;

procedure cargarDetalle(var det:archivo_empleados);
var
	e:empleado;
begin
	reset(det);
	leerEmpleado(e);
	while(e.codigo<>0)do begin
		write(det,e);
		leerEmpleado(e);
	end;
	close(det);
end;

procedure imprimirArchivo(var arch:archivo_empleados);
var
	e:empleado;
begin
	reset(arch);
	while(not EOF(arch))do begin
		read(arch,e);
		imprimirEmpleado(e);
	end;
	close(arch)
end;

procedure leer(var det:archivo_empleados ; var e:empleado);
begin
	if(not EOF(det))then
		read(det,e)
	else
		e.codigo:=valor_alto;
end;

procedure cargarMaestro(var det:archivo_empleados ; var mae:archivo_empleados);
var
	e,empAux:empleado;
	montoTotal:real;
begin
	reset(det);
	assign(mae,'Maestro');
	rewrite(mae);
	leer(det,e);
	while(e.codigo<>valor_alto)do begin
		empAux:=e;
		montoTotal:=0;
		while(empAux.codigo = e.codigo)do begin		//mientras este en el mismo empleado sumo los montos
			montoTotal := montoTotal + e.monto;
			leer(det,e);
		end;
		empAux.monto:=montoTotal;
		write(mae,empAux);			//escribo en el maestro el empleado modificado con el monto total 
	end;
	close(det);
	close(mae);
end;


//Programa Principal

var
	mae:archivo_empleados;
	det:archivo_empleados;
begin
	assign(det,'Detalle');
	rewrite(det);
	cargarDetalle(det);	//se dispone
	cargarMaestro(det,mae);
	writeln;
	writeln('-----Archivo Original-----');
	imprimirArchivo(det);
	writeln;
	writeln('-----Archivo Compactado-----');
	imprimirArchivo(mae);
end.

