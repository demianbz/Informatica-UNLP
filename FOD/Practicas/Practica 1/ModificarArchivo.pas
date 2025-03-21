program modificarArchivo;
type

	registro = record
		nombre: string[20];
		direccion: string[20];
		salario: real;
	end;
	
	empleado = file of registro;
	
//Modulos

procedure actualizar (var emp:empleado);
var
	e:registro;
begin
	reset(emp);	//se abre el archivo ya creado
	while (not EOF(emp)) do begin
		read(emp,e);	//leo lo que hay en el archivo y avanzo el puntero
		e.salario:=e.salario * 1.1;
		seek(emp,filePos(emp)-1);	//pongo el puntero en la posicion que quiero modificar
		write(emp,e);	//escribo el archivo el archivo modificado y avanzo el puntero
	end;
	close(emp); //cierro el archivo (SIEMPRE)
end;

procedure leerRegistro (var e:registro);
begin
	write('Ingrese el nombre: '); readln(e.nombre);
	write('Ingrese la direccion: '); readln(e.direccion);
	write('Ingrese el salario: '); readln(e.salario);
end;

procedure cargarArchivo(var emp:empleado);
var
	e:registro;
begin
	leerRegistro(e);
	while(e.salario<>0)do begin
		write(emp,e);
		leerRegistro(e);
	end;
	close(emp);
end;

procedure imprimirArchivo(var emp:empleado);
var
	e:registro;
begin
	reset(emp);	//Archivo ya creado, para operar debe abrirse
	while(not EOF(emp))do begin
		read(emp,e);	//leo y avanzo
		writeln('Nombre: ',e.nombre,' | Direccion: ',e.direccion,' | Salario: ',e.salario:2:2);
	end;
	close(emp);
end;

//Programa Principal

var
	emp:empleado;
	nomFisico:string;
begin
	write('Ingrese el Nombre del Archivo: '); readln(nomFisico);
	assign(emp,nomFisico);	//relacion entre nombre fisico y logico "Vinculacion"
	rewrite(emp);	//se crea el archivo
	cargarArchivo(emp);
	writeln;
	writeln('-----Archivo Cargado-----');
	imprimirArchivo(emp);
	actualizar(emp);
	writeln;
	writeln('-----Archivo Modificado-----');
	imprimirArchivo(emp);
end.
