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


procedure GenerarArbol (var a: arbol);
var 
	unSocio: socio;  
begin
	randomize;
	a:=nil;
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

procedure InformarOrdenCreciente (a:arbol) ;
begin
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol en Orden CRECIENTE (por numero de socio)');
	writeln;
	ImprimirOrdenCreciente(a);
	writeln;
end;

procedure ImprimirOrdenDecreciente (a:arbol);	//i. Informar los datos de los socios en orden creciente por número de socio
begin
	if(a<>nil)then begin
		ImprimirOrdenDecreciente(a^.HD);
		writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);					
		ImprimirOrdenDecreciente(a^.HI);
		
	end;
end;

procedure InformarOrdenDecreciente (a:arbol) ;
begin
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol en Orden DECRECIENTE (por numero de socio)');
	writeln;
	ImprimirOrdenDecreciente(a);
	writeln;
end;

procedure BuscarMayor(a:arbol ; var MaxEdad,NumMax:integer); //iii. Informar el número de socio con mayor edad. 
begin														 //Debe invocar a un módulo recursivo que retorne dicho valor.	
	if(a<>nil)then begin
		if (a^.dato.edad >= MaxEdad) then begin			
				MaxEdad:=a^.dato.edad;
				NumMax:=a^.dato.numero;
		end;
		BuscarMayor(a^.HI,MaxEdad,NumMax);
		BuscarMayor(a^.HD,MaxEdad,NumMax);
	end;
end;

procedure SocioConMayorEdad (a:arbol);
var
	MaxEdad,NumMax:integer;
begin
	MaxEdad:=-1;
	NumMax:=0;
	BuscarMayor(a,MaxEdad,NumMax);
	if(MaxEdad=-1)then
		writeln('El Arbol esta vacio')
	else begin
	    writeln;
		writeln('------------------------------------');
		writeln;
		writeln('Numero de socio con mas edad: ',NumMax);
		writeln;

	end;
end;


function AumentarEdad(a: arbol): integer;
var
	resto: integer;
begin
	if (a = nil) then
		AumentarEdad := 0
    else begin
		resto := a^.dato.edad MOD 2;
		if (resto = 1) then
			a^.dato.edad := a^.dato.edad + 1;
			AumentarEdad := resto + AumentarEdad(a^.HI) + AumentarEdad(a^.HD);
    end;
end;


procedure AumentarEdadImpar(a:arbol);    //iv. Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios
begin									 //	  que se les aumentó la edad.
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Cantidad de socios que se les aumento la edad: ',AumentarEdad(a));
	writeln;

	
end;

function BuscarNombre (a:arbol ; nom:cadena15):boolean;
var 
	existe:boolean;
begin
	if(a=nil)then
		existe:=false
	else 
		if(a^.dato.nombre = nom)then
		existe:=true
	else begin
		existe:=BuscarNombre(a^.HI,nom);
		if(not (existe))then
		existe:=BuscarNombre(a^.HD,nom);	
	end;
	BuscarNombre:=existe;
end;




procedure InformarNombre(a:arbol);	//vi. Leer un nombre e informar si existe o no existe un socio con ese nombre. Debe invocar
var									//	  a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
	nom:cadena15;
begin
	writeln ('---------------------------------------------------');
	writeln;
	write('Ingrese el Nombre a Buscar: ');
	readln(nom);
	writeln;
	if BuscarNombre(a, nom) then
		writeln('El nombre ', nom, ' existe en el arbol')
    else
		writeln('El nombre ', nom, ' no existe en el arbol');
	writeln;
end;							

function ContarSocios (a:arbol):integer;
begin
	if (a = nil) then
		ContarSocios := 0
	else
		ContarSocios := 1 + ContarSocios(a^.HI) + ContarSocios(a^.HD);
end;


procedure CantidadSocios(a:arbol);	//vii. Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.			
begin
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Cantidad de socios: ',ContarSocios(a));
	writeln;
end;

function SumadeEdades(a:arbol):integer;	//Preguntar
begin
	
	if(a=nil)then
		SumadeEdades:=0
	else
		SumadeEdades:=SumadeEdades(a^.HI)+SumadeEdades(a^.HD)+a^.dato.edad;
end;

procedure PromedioEdad(a:arbol);	//viii. Informar el promedio de edad de los socios. Debe invocar a un módulo recursivo que
var																//      retorne el promedio de las edades de los socios.}
	total,cant:integer;
	promedio:real;
begin						              		
	writeln ('---------------------------------------------------');
	writeln;
	total:=SumadeEdades(a);
	cant:=ContarSocios(a);
	promedio:=total/cant;
	writeln('Promedio de Edad de los Socios: ',Promedio:2:2);
	writeln;
	writeln ('---------------------------------------------------');
end;										  
//Programa Principal

var
	a:arbol;
begin
	GenerarArbol(a);	//A
	InformarOrdenCreciente(a);	//B.i
	InformarOrdenDecreciente(a);	//B.ii
	SocioConMayorEdad(a);	//B.iii
	AumentarEdadImpar(a);	//B.iv
	InformarNombre(a);	//B.vi
	CantidadSocios(a);	//B.vii
	PromedioEdad(a);	//B.viii
end.
