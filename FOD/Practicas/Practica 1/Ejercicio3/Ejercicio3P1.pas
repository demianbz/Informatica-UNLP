{3. Realizar un programa que presente un menú con opciones para: 
a. Crear un archivo de registros no ordenados de empleados y completarlo con 
datos ingresados desde teclado. De cada empleado se registra: número de 
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con 
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido. 
b. Abrir el archivo anteriormente generado y 
i. 
Listar en pantalla los datos de empleados que tengan un nombre o apellido 
determinado, el cual se proporciona desde el teclado. 
ii. 
Listar en pantalla los empleados de a uno por línea.  
iii. 
Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse. 
NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario.}

program ejercicio3P1;
type

	empleado = record
        numero: integer;
        apellido: string;
        nombre: string;
        edad: integer;
        dni: integer;
    end;
    
    archivo_empleados = file of empleado;
    
//Modulos

procedure leerEmpleado (var e:empleado);
begin
    write('Ingrese el apellido del empleado: '); readln(e.apellido);
    if(e.apellido <> 'fin') then begin
		write('Ingrese el nombre del empleado: ');readln(e.nombre);
		write('Ingrese el numero del empleado: ');readln(e.numero);
		write('Ingrese la edad del empleado: ');readln(e.edad);
		write('Ingrese el DNI del empleado: ');readln(e.dni);
	end;
end;


procedure cargarArchivo(var empleados:archivo_empleados);
var
	e:empleado;
begin
	leerEmpleado(e);
	while(e.apellido<>'fin')do begin
		write(empleados,e);
		leerEmpleado(e);
	end;
	close(empleados);
end;


procedure imprimirEmpleado(e:empleado);
begin
    writeln('Apellido:',e.apellido,' Nombre:',e.nombre,' Numero:',e.numero,' Edad:',e.edad,' Dni: ',e.dni);
end;

function esta(e:empleado ; ApeNom:string):boolean;
begin
	esta := ((e.apellido = ApeNom) or (e.nombre = ApeNom));
end;


procedure incisoi(var empleados:archivo_empleados);
var
	ApeNom:string;
	e:empleado;
begin
	writeln('-----Inciso i-----');
	reset(empleados);	//Abrir el archivo antes de usarlo
	write('Ingrese un Apellido o Nombre: ');readln(ApeNom);
	while(not EOF(empleados))do begin
		read(empleados,e);
		if(esta(e,ApeNom))then begin
			writeln('Empleado "',ApeNom,'":');
			imprimirEmpleado(e);
		end;
	end;
	close(empleados);
end;

procedure incisoii(var empleados:archivo_empleados);
var
	e:empleado;
begin
	writeln('-----Inciso ii-----');
	reset(empleados);
	writeln('-Empleados-');
	while(not EOF(empleados))do begin
		read(empleados,e);
		imprimirEmpleado(e);
	end;
	close(empleados);
end;

procedure incisoiii(var empleados:archivo_empleados);
var
	e:empleado;
begin
	writeln('-----Opcion 3-----');
	reset(empleados);	//Abrir el archivo antes de usarlo
	while(not EOF(empleados))do begin
		read(empleados,e);
		if(e.edad>70)then begin
			writeln('-Empleados Proximos a jubilarse-');
			imprimirEmpleado(e);
		end;
	end;
	close(empleados);
end;

procedure procesarArchivo(var empleados:archivo_empleados);
var
	opcion:integer;
begin
	writeln('----MENU DE OPCIONES----');
	writeln('Opcion 1: Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado');
    writeln('Opcion 2: Listar en pantalla los empleados de a uno por linea');
    writeln('Opcion 3: Listar en pantalla los empleados mayores a 70 anios, proximos a jubilarse');
    writeln('Opcion 4: Salir del menu y terminar la ejecucion del programa');
	readln(opcion);
	case opcion of
		1: incisoi(empleados);//Inciso1
		2: incisoii(empleados);//Inciso2
		3: incisoiii(empleados);//Inciso3
	else
		writeln('Opcion no valida');
	end;
end;


//Programa Principal

var
	empleados:archivo_empleados;
	nom_fisico:string;
begin
	write('Ingrese el Nombre del archivo: '); readln(nom_fisico);
	assign(empleados,nom_fisico);
	rewrite(empleados);	//Abro el archivo
	cargarArchivo(empleados);
	procesarArchivo(empleados);
end.
