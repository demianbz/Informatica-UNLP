{2. Descargar el programa ImperativoEjercicioClase3.pas de la clase anterior e incorporar lo
necesario para:

i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.

ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.

iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.

iv. Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores
leídos y retorne la cantidad solicitada.}

program P4E2;
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
end;					

function ObtenerMaximo (a:arbol) :integer;
begin
	if(a=nil)then
		ObtenerMaximo:=-1
	else 
		if(a^.HD=nil)then
			ObtenerMaximo:=a^.dato.numero
		else
			ObtenerMaximo:=ObtenerMaximo(a^.HD);	//Le paso solo el hijo derecho porque esta ordenado por numero y aprovechamos eso
end;

procedure NumeroSocio (a:arbol); //i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
var
	NumeroMasGrande:integer;
begin
	writeln ('---------------------------------------------------');
	writeln;
	NumeroMasGrande:=ObtenerMaximo(a);
	if(NumeroMasGrande<>-1)then
		writeln('Numero de socio mas grande:',NumeroMasGrande)
	else
		writeln('Arbol Vacio');
	writeln;
end;


procedure ObtenerMinimo (a:arbol);
begin
	if(a<>nil)then begin
		if(a^.HI=nil)then begin
			writeln('Numero: ', a^.dato.numero);
			writeln('Nombre: ', a^.dato.nombre);
			writeln('Edad: ', a^.dato.edad);			
		end
		else
			ObtenerMinimo(a^.HI);	
	end
	else
		writeln('Arbol Vacio');
end;

procedure InformarSocioMasChico (a:arbol) ;	//ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
begin										//módulo recursivo que retorne dicho socio.
	writeln('---------------------------------------------------');
	writeln;
	writeln('Datos del Socio con el numero de socio Mas Chico: ');
	writeln;
	ObtenerMinimo(a);
	writeln;
end;	

function BuscarValor (a:arbol ; valor:integer):boolean;
begin
	if(a=nil)then
		BuscarValor:=false
	else 
		if(a^.dato.numero = valor)then
			BuscarValor:=true
	else 
	if(a^.dato.numero>valor)then
		BuscarValor:=BuscarValor(a^.HI,valor)
	else
		BuscarValor:=BuscarValor(a^.HD,valor);	
	
end;




procedure InformarValor (a:arbol);	//iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
var									//invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.
	valor:integer;
begin
	writeln('---------------------------------------------------');
	writeln;
	write('Ingrese el Numero de Socio a Buscar: ');
	readln(valor);
	writeln;
		if BuscarValor(a, valor) then
		writeln('El Socio con numero ',valor, ' existe en el arbol')
    else
		writeln('El Socio con numero ',valor, ' no existe en el arbol');
	writeln;
	
end;					
				
function ObtenerCantidadEntreDosNumeros (a: arbol; min, max: integer): integer;
begin
	if(a=nil)then
		ObtenerCantidadEntreDosNumeros:=0
	else begin
		if((a^.dato.numero>min) and (a^.dato.numero<max))then begin
			ObtenerCantidadEntreDosNumeros:=1+ObtenerCantidadEntreDosNumeros(a^.HI,min,max)+ObtenerCantidadEntreDosNumeros(a^.HD,min,max);
		end
		else 
			if(a^.dato.numero > min)then
				ObtenerCantidadEntreDosNumeros:=ObtenerCantidadEntreDosNumeros(a^.HI,min,max)
			else
				ObtenerCantidadEntreDosNumeros:=ObtenerCantidadEntreDosNumeros(a^.HD,min,max);
	end;
end;
				
					
procedure InformarEntreDosValores (a:arbol); //iv. Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
var				//entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores leídos y retorne la cantidad solicitada.	
	min,max:integer;
	CantidadDeSocios:integer;
begin
	writeln('---------------------------------------------------');
	writeln;
	write ('Ingrese primer numero de Socio: ');
	readln (min);
	write ('Ingrese segundo numero de Socio (mayor al primer numero): ');
	readln (max);
	writeln;
	CantidadDeSocios:=ObtenerCantidadEntreDosNumeros(a,min,max);
	if (CantidadDeSocios = 0) then 
		writeln ('No hay Socios con numero entre los numeros ', min, ' y ', max)
	else begin
         writeln;
         writeln ('La Cantidad total de Socios entre los numeros (',min,' y ',max,') es: ',ObtenerCantidadEntreDosNumeros(a,min,max)); 
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;
					  
//Programa Principal

var
	a:arbol;
begin
	GenerarArbol(a);	//1A
	InformarOrdenCreciente(a);	//1B.i
	InformarOrdenDecreciente(a);	//1B.ii
	SocioConMayorEdad(a);	//1B.iii
	AumentarEdadImpar(a);	//1B.iv
	InformarNombre(a);	//1B.vi
	CantidadSocios(a);	//1B.vii
	PromedioEdad(a);	//1B.viii
	NumeroSocio(a);		//2.i
	InformarSocioMasChico(a);	//2.ii
	InformarValor(a);		//2.iii
	InformarEntreDosValores(a);		//2.iv
end.
