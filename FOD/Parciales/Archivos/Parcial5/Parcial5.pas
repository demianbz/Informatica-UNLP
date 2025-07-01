{Archivos
Se desea manejar un archivo con información de profesionales de una clínica. Se sabe que el archivo utiliza la técnica de lista invertida
para aprovechamiento de espacio. Es decir las bajas se realizan apilando registros borrados y las altas reutilizando registros borrados. 
El registro en la posición 0 del archivo se usa como cabecera de la pila de registros borrados.
Type
  profesional = Record
    DNI: integer;
    nombre: String;
    apellido: String;
    sueldo: real;
  end;
  tArchivo = File of profesional;
Nota: El valor 0 en el campo DNI significa que no existen registros borrados, y -N indica que el próximo registro a reutilizar es el N, 
siendo éste un número relativo de registro válido.
Se solicita implementar los siguientes módulos:
(Crear el Archivo Maestro con un archivo de texto que se recibe como parámetro. Asumir que en el programa principal sólo está el hecho
el asign de los archivos. Tengan en cuenta la restricción de lectura de los campos en los archivos de texto)
Procedure crear(var arch: tArchivo; var info: TEXT);

(Abre el archivo y agrega una persona. La persona se recibe como parámetro y debe utilizar la política descripta anteriormente para 
recuperación de espacio)
Procedure agregar(var arch: tArchivo; p: profesional);

(Abre el archivo y elimina la persona que tiene el DNI que se recibe como parámetro manteniendo la política descripta anteriormente. 
La persona puede no existir. Si existe se agrega a la pila de bajas. Tenga en cuenta la restricción de lectura de los campos en archivos
de texto)
Procedure eliminar(var arch: tArchivo; DNI: integer; var bajas: TEXT);}

program parcial5;
type

	profesional = record
		dni:integer;
		nombre:string;
		apellido:string;
		sueldo:real;
	end;

	tArchivo = file of profesional;

//Modulos

{Crear el Archivo Maestro con un archivo de texto que se recibe como parámetro. Asumir que en el programa principal sólo está el hecho
el asign de los archivos. Tengan en cuenta la restricción de lectura de los campos en los archivos de texto}
procedure crear(var arch:tArchivo ; var info:text);
var
	p:profesional;
begin
	rewrite(arch);
	reset(info);
	
	p.dni :=0;
	write(arch,p);
	while(not EOF(info))do begin
		readln(info, p.dni, p.sueldo, p.nombre);
        readln(info, p.apellido);
        write(arch, p);
	end;
	
	close(arch);
	close(info);
end;

function existeProfesional(var a: tArchivo; dni: integer): boolean;
var
    ok: boolean;
    p: profesional;
begin
	reset(a);
    ok:= false;
    while((not eof(a)) and (not ok)) do
        begin
            read(a, p);
            if(p.dni = dni) then
                ok:= true;
        end;
    existeProfesional:= ok;
    close(a);
end;

procedure agregar(var arch:tArchivo ; p:profesional);
var
	head:profesional;
begin	
	if(not existeProfesional(arch,p.dni))then begin
		reset(arch);
		read(arch,head);
		if(head.dni = 0)then begin
			seek(arch,fileSize(arch));
			write(arch,p);
		end
		else begin
			seek(arch,head.dni*-1);
			read(arch,head);
			seek(arch,filePos(arch)-1);
			write(arch,p);
			seek(arch,0);
			write(arch,head);
		end;
	end;
	
	close(arch);
end;

procedure eliminar(var arch: tArchivo ; dni:integer ; var bajas:text);
var
	head,p:profesional;
begin
	if(existeProfesional(arch,dni))then begin
		reset(arch);
		rewrite(bajas);
		read(arch,head);
		read(arch,p);
		while(p.dni<>dni)do begin
			read(arch,p);
		end;
		seek(arch,filePos(arch)-1);
		write(arch,head);
		head.dni := (filePos(arch)-1) * -1;
		seek(arch,0);
		write(arch,head);
		writeln(bajas, p.dni, ' ', p.nombre, ' ', p.apellido, ' ', p.sueldo);
	end;
	
	close(arch);
	close(bajas);
end;

procedure imprimirArchivo(var arch:tArchivo);
var
    p:profesional;
begin
    reset(arch);
    read(arch,p);
    write('Head: ',p.dni,' ');
    while(not EOF(arch)) do begin
		read(arch, p);
        write(p.dni, ' ~ ');
    end;
    close(arch);
end;

//Programa Principal

var
	arch:tArchivo;
	info:text;
	bajas:text;
	p:profesional;
begin
	assign(arch,'Maestro');
	assign(info,'Info.txt');
	assign(bajas,'Bajas.txt');
	
	//Creo el archivo
	crear(arch,info);
	writeln('-----Archivo Creado-----');imprimirArchivo(arch);writeln;
	
	//Creo el profesional a agregar y lo agrego
	p.dni := 4574; p.nombre := 'Demian'; p.apellido := 'Bonzi';
	agregar(arch,p);
	writeln('-----Profesional ',p.nombre,' DNI: ',p.dni,' Agregado-----');imprimirArchivo(arch);writeln;
	
	//Elimino a el profesional con dni pasado como parametro
	eliminar(arch,p.dni,bajas);
	writeln('-----Profesional con DNI: ',p.dni,' Eliminado-----');imprimirArchivo(arch);writeln;
end.
