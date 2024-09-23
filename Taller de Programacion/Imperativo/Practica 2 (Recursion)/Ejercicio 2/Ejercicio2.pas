{ 2.- Escribir un programa que:
 
 a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
 “random” en el rango 100-200. Finalizar con el número 100.
 
 b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
 mismo orden que están almacenados.
 
 c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
 la lista en orden inverso al que están almacenados.
 
 d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
 valor de la lista.
 
 e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
 verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}


program ejercicio2;
const
	min = 100;
	max= 200;
	
type
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;


//Modulos


procedure AgregarAdelante (var L:lista ; ale:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=ale;
	nue^.sig:=nil;
	if (L=nil) then
		L:=nue
	else begin
		nue^.sig:=L;
		L:=nue;
	end;	
end;


procedure CargarListaRecursiva (var L:lista ); //Inciso A
var
	rango,ale:integer;
begin
	rango:=max-min+1;
	ale:=min+random(rango);
	if (ale<>100) then begin
		AgregarAdelante(L,ale);
		ale:=min+random(rango);
		CargarListaRecursiva(L);
	end;
end;

procedure ImprimirListaRecursiva (L:lista);  //Inciso B
begin
	if(L<>nil)then begin
		ImprimirListaRecursiva(L^.sig);
		writeln('Numero entre 100 y 200: ',L^.dato);
	end;
end;

procedure ImprimirListaRecursivaInverso (L:lista);  //Inciso C    //Preguntar si esta bien
begin
	if(L<>nil)then begin
		writeln('Numero entre 100 y 200: ',L^.dato);
		ImprimirListaRecursiva(L^.sig);

	end;
end;

function ObtenerMinimoRecursivo (L:lista ; minimo:integer):integer;  //Inciso D		//Preguntar si esta bien
begin
	if(L<>nil) then begin
		if(L^.dato<minimo)then 
			minimo:=L^.dato
		else
		ObtenerMinimoRecursivo(L^.sig,minimo)
	end
	else
		ObtenerMinimoRecursivo:=minimo;
end;

function BuscarValor (L:lista ; valor:integer):boolean;  //Inciso E		//Preguntar si esta bien
begin
	if (L<>nil) then begin
		if(valor=L^.dato)then
			BuscarValor:=true
		else
			BuscarValor(L^.sig,valor)
	end
	else
		BuscarValor:=false;
end;


//Programa Principal

var
	L:lista;
	valor,minimo:integer;
	encontre:boolean;
begin
	L:=nil;
	randomize;
	CargarListaRecursiva(L);
	writeln('Lista en el Orden que fueron Ingresados');
	writeln;
	ImprimirListaRecursiva(L);
	writeln;
	writeln('Lista en el Orden Inverso');
	writeln;
	ImprimirListaRecursivaInverso(L);
	minimo:=999;
	ObtenerMinimoRecursivo(L,minimo);
	writeln;
	writeln('El valor minimo de la Lista fue: ',minimo);
    writeln;
    write ('Ingrese un valor a buscar: ');
    read (valor);
    writeln;
    encontre:= BuscarValor(L,valor);
	if (encontre) then 
		writeln('El ', valor, ' esta en la Lista')
    else 
		writeln('El ', valor, ' no esta en la Lista');
end.
