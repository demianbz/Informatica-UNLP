{1. Archivos Secuenciales 
Suponga que tiene un archivo con información referente a los empleados que trabajan en 
una multinacional. De cada empleado se conoce el dni (único), nombre, apellido, edad, 
domicilio y fecha de nacimiento. 
Se solicita hacer el mantenimiento de este archivo utilizando la técnica de reutilización de 
espacio llamada lista invertida. 
Declare las estructuras de datos necesarias e implemente los siguientes módulos: 
Agregar empleado: solicita al usuario que ingrese los datos del empleado y lo agrega al 
archivo sólo si el dni ingresado no existe. Suponga que existe una función llamada 
existeEmpleado que recibe un dni y un archivo y devuelve verdadero si el dni existe en el 
archivo o falso en caso contrario. La función existeEmpleado no debe implementarla. Si el 
empleado ya existe, debe informarlo en pantalla. 
Quitar empleado: solicita al usuario que ingrese un dni y lo elimina del archivo solo si este 
dni existe. Debe utilizar la función existeEmpleado. En caso de que el empleado no exista 
debe informarse en pantalla. 
Nota: Los módulos que debe implementar deberán guardar en memoria secundaria todo 
cambio que se produzca en el archivo. }
program parcial2;
const
	valor_alto = 9999;

type
	empleado = record
		dni:integer;
		nombre:string[10];
		apellido:string[10];
		edad:integer;
		domicilio:string[30];
		nacimiento:string[10];
	end;

	archEmp = file of empleado;

//Modulos

function existeEmpleado(var arch:archEmp ; dni:integer):boolean;	//SE DISPONE

procedure leer(var arch:archEmp ; var e:empleado);
begin
	if(not EOF(arch))then
		read(arch,e)
	else
		e.dni := valor_alto;
end;

procedure leerEmpleado(var e:empleado);
begin
	write('Ingrese el Dni: ');readln(e.dni);
    write('Ingrese el Nombre: ');readln(e.nombre);
    write('Ingrese el apellido: ');readln(e.apellido);
    write('Ingrese la edad: ');readln(e.edad);
    write('Ingrese el domicilio: ');readln(e.domicilio);
    write('Ingrese la fecha de Nacimiento: ');readln(e.nacimiento);
end;

procedure AgregarEmpleado(var arch:archEmp);
var
	head,e:empleado;
begin
	reset(arch);
	
	leer(arch,head);
	leerEmpleado(e);
	if(not existeEmpleado(arch,e.dni))then begin
		if(head.dni = 0)then begin	//Si el registro cabecera(head) es 0 significa que no tengo espacio para reutilizar (osea agrego al final)
			seek(arch,fileSize(arch));	//Posiciono el puntero al final
			write(arch,e);	//Escribo al final el registro empleado
		end
		else begin
			seek(arch,head.dni * -1);	//Posiciono el puntero en donde hay espacio para reutilizar (ej -5 * -1 = 5)
			leer(arch,head);			//Leo el registro en el que estoy parado y me lo guardo en (head), este va a ser el proximo a reutilizar
			seek(arch,filePos(arch)-1);	//Posiciono el puntero una posicion mas atras porque avanze cuando lei
			write(arch,e);				//Escribo la posicion a reutilizar con el nuevo registro
			seek(arch,0);				//Posiciono el puntero en el registro cabecera(head)
			write(arch,head);			//Escribo el registro cabecera con la proxima direccion a utilizar que me guarde previamente
		end;
	end
	else
		writeln('El empleado con dni ',e.dni,' ya existe');
	
	close(arch);
end;

procedure QuitarEmpleado(var arch:archEmp);
var
	dni:integer;
	head,e:empleado;
begin
	reset(arch);
	leer(arch,head);
	write('Ingrese un DNI para dar de Baja: ');readln(dni);
	if(existeEmpleado(arch,dni))then begin
		leer(arch,e);
		while(e.dni <> dni)do
			leer(arch,e);
		seek(arch,filePos(arch)-1);	//Me posiciono en la posicion que quiero eliminar(donde esta el Dni)-1(el -1 es porque cuando hago el read avanzo
		write(arch,head);			//Pongo en esa posicion lo que hay en el registro cabecera(espacio a reutilizar)
		head.dni := (filePos(arch)-1)*-1;	//Ahora en el registro cabecera pongo la posicion en la que elimine recien
		seek(arch,0);				//Me posiciono en el registro cabecera
		write(arch,head);			//Escribo el registro cabecera con esa posicion
	end
	else
		writeln('El empleado con dni ',e.dni,' no existe');
	close(arch);
end;


//Programa Principal

var
	arch:archEmp;
begin
	assign(arch,'Archivo Empleado');
	AgregarEmpleado(arch);
	QuitarEmpleado(arch);
end.
