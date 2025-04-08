{4. Agregar al menú del programa del ejercicio 3, opciones para: 
a. Añadir uno o más empleados al final del archivo con sus datos ingresados por 
teclado. Tener en cuenta que no se debe agregar al archivo un empleado con 
un número de empleado ya registrado (control de unicidad). 
b. Modificar la edad de un empleado dado. 
c. Exportar el contenido del archivo a un archivo de texto llamado “todos_empleados.txt”. 
d. Exportar a un archivo de texto llamado: “faltaDNIEmpleado.txt”, los empleados  que no tengan cargado el DNI (DNI en 00). 
NOTA: Las búsquedas deben realizarse por número de empleado.}

program ejercicio4P1;
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


procedure imprimirEmpDeseado(var empleados:archivo_empleados);
var
	ApeNom:string;
	e:empleado;
begin
	writeln('-----Opcion 1-----');
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

procedure imprimirTodosEmpleados(var empleados:archivo_empleados);
var
	e:empleado;
begin
	writeln('-----Opcion 2-----');
	reset(empleados);
	writeln('-Empleados-');
	while(not EOF(empleados))do begin
		read(empleados,e);
		imprimirEmpleado(e);
	end;
	close(empleados);
end;

procedure imprimirPorJubilarse(var empleados:archivo_empleados);
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

function seRepite(var empleados:archivo_empleados ; numEmp:integer):boolean;
var
	repite:boolean;
	e:empleado;
begin
	repite:=false;
	while((not EOF(empleados))and(not repite))do begin
		read(empleados,e);
		if(e.numero = numEmp)then
			repite:=true;
	end;
	seRepite:=repite;
end;

procedure agregarEmpleados(var empleados:archivo_empleados);
var
    e: empleado;
begin
	writeln('-----Opcion 4-----');
    reset(empleados);
    leerEmpleado(e);
    while(e.apellido <> 'fin') do
        begin
            if(not(seRepite(empleados, e.numero))) then begin
                    seek(empleados, fileSize(empleados));	//Pongo el puntero en la ultima posicion
                    write(empleados, e);
            end;
            leerEmpleado(e);
        end;
    close(empleados);
end;

procedure modificarEdad(var empleados:archivo_empleados);
var
	e:empleado;
	encontre:boolean;
	num:integer;
	edad:integer;
begin
	writeln('-----Opcion 5-----');
	encontre:=false;
	reset(empleados);
	write('Ingrese el Numero del empleado para Modificar la edad: ');readln(num);
	while((not EOF(empleados)) and (not encontre ))do begin
		read(empleados,e);
		if(e.numero = num)then
			write('Ingrese la edad que quiere ponerle: ');readln(edad);
			e.edad:=edad;
			seek(empleados,filePos(empleados)-1);	//Esto pone el puntero en la posicion actual del puntero -1, porque cuando leo, avanzo 1
			write(empleados,e);		//escribo sobre el archivo y avanzo el puntero
			encontre:=true;
	end;
	close(empleados);
end;

procedure exportarTodos(var empleados:archivo_empleados);
var
	e:empleado;
	archivoTexto:text;
begin
	writeln('-----Opcion 6-----');
	reset(empleados);
	assign(archivoTexto,'todos_empleados.txt');
	rewrite(archivoTexto);
	while(not EOF(empleados))do begin
		read(empleados,e);
		writeln(archivoTexto,e.numero,' ',e.apellido,' ',e.nombre,' ',e.edad,' ',e.dni);//escribe en el archivo de texto los campos separados por el caracter blanco  
	end;
	close(empleados);
	close(archivoTexto);
	writeln('Se exporto correctamente el contenido');
end;

procedure exportarSinDni (var empleados:archivo_empleados);
var
	e:empleado;
	archivoTexto:text;
begin
	reset(empleados);
	writeln('-----Opcion 7-----');	
	assign(archivoTexto,'faltaDNIEmpleado.txt');
	rewrite(archivoTexto);
	while(not EOF(empleados))do begin
		read(empleados,e);
		if(e.dni=00)then
			writeln(archivoTexto,e.numero,' ',e.apellido,' ',e.nombre,' ',e.edad,' ',e.dni);//escribe en el archivo de texto los campos separados por el caracter blanco  
	end;
	close(archivoTexto);
	close(empleados);
	writeln('Se exporto correctamente el contenido');
end;

procedure procesarArchivo(var empleados:archivo_empleados);
var
	opcion:integer;
begin
	writeln('----MENU DE OPCIONES----');
	writeln('Opcion 1: Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado');
    writeln('Opcion 2: Listar en pantalla los empleados de a uno por linea');
    writeln('Opcion 3: Listar en pantalla los empleados mayores a 70 anios, proximos a jubilarse');
    writeln('Opcion 4: Agregar uno o mas empleados');
    writeln('Opcion 5: Modificar la edad de un empleado');
    writeln('Opcion 6: Exportar el contenido del archivo a un archivo de texto llamado todos_empleados.txt ');
    writeln('Opcion 7: Exportar a un archivo de texto llamado: faltaDNIEmpleado.txt, los empleados que no tengan cargado el DNI (DNI en 00)'); 
	readln(opcion);
	case opcion of
		1: imprimirEmpDeseado(empleados);
		2: imprimirTodosEmpleados(empleados);
		3: imprimirPorJubilarse(empleados);
		4: agregarEmpleados(empleados);
		5: modificarEdad(empleados);
		6: exportarTodos(empleados);
		7: exportarSinDni(empleados);
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
