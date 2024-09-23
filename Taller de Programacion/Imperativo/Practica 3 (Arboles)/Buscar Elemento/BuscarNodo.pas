{1. Descargar el programa ImperativoEjercicioClase3.pas que contiene parte del código del
siguiente enunciado a resolver. Implementar lo indicado en el código.
Escribir un programa que:

a. Implemente un módulo que almacene información de socios de un club en un árbol binario
de búsqueda. De cada socio se debe almacenar número de socio, nombre y edad. La carga
finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio. La
información de cada socio debe generarse aleatoriamente.

b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :

i. Informar los datos de los socios en orden creciente.

ii. Informar los datos de los socios en orden decreciente.

iii. Informar el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.

iv. Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios
que se les aumentó la edad.

vi. Leer un nombre e informar si existe o no existe un socio con ese nombre. Debe invocar
a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.

vii. Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.

viii. Informar el promedio de edad de los socios. Debe invocar a un módulo recursivo que
retorne el promedio de las edades de los socios.}

program P3E1;
type 
	cadena15 = string [15];

	socio = record
		numero: integer;
	    nombre: cadena15;
		edad: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record			
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;

	
//Modulos

procedure GenerarArbol (var a: arbol);

	procedure CargarSocio (var s: socio);
    var 
		vNombres:array [0..9] of string= ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
	begin
		s.numero:= random (51) * 100;
		if (s.numero <> 0)then begin
			s.nombre:= vNombres[random(10)];
            s.edad:= 12 + random (79);
        end;
  end;  
  
	procedure InsertarElemento (var a: arbol; elem: socio);
    begin
		if (a = nil) then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
        end
		else 
			if (elem.numero < a^.dato.numero) then 
				InsertarElemento(a^.HI, elem)
            else 
				InsertarElemento(a^.HD, elem); 
	end;

var 
	unSocio: socio;  
begin
	writeln;
	writeln ('----- Ingreso de socios y armado del arbol ----->');
	writeln;
	CargarSocio (unSocio);
	while (unSocio.numero <> 0)do begin
		InsertarElemento (a, unSocio);
		CargarSocio (unSocio);
	end;
	writeln;
	writeln('Termino la Lectura');
	writeln;
end;

procedure ImprimirOrdenCreciente (a:arbol);	//i. Informar los datos de los socios en orden creciente por número de socio
begin
	if(a<>nil)then begin
		ImprimirOrdenCreciente(a^.HI);
		writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);	
		ImprimirOrdenCreciente(a^.HD);
	end;
end;


procedure ImprimirOrdenDecreciente (a:arbol);	//i. Informar los datos de los socios en orden creciente por número de socio
begin
	if(a<>nil)then begin
		ImprimirOrdenDecreciente(a^.HD);
		writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);					
		ImprimirOrdenDecreciente(a^.HI);
		
	end;
end;

//Programa Principal

var
	a:arbol;
begin
	randomize;
	a:=nil;
	GenerarArbol(a);	//A
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol en Orden CRECIENTE (por numero de socio)');
	writeln;
	ImprimirOrdenCreciente(a);	//B.i
	writeln;
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol en Orden DECRECIENTE (por numero de socio)');
	writeln;
	ImprimirOrdenDecreciente(a);	//B.ii
end.
