{Implementar un Modulo que lea compras de videojuegos . De cada compra se lee el codigo de videojuego, codigo  de cliente, dia y mes
La lectura finaliza  con el codigo de cliente 0. Se sugiere utilizar el modulo  leerCompra(). Se deben retornar dos estructutras de datos.
i.Una estructura eficiente para la busqueda por codigo de cliente 
ii. Otra estructura que almacena la cantidad de compras realizadas en cada mes
b)implementar un modulo que reciba la estructura generada en a)i, un codigo de cliente y retorne todas las compras que realizao dicho cliente
c)Implementar un modulo que reciba la estructura generada en a)ii. y retorne la misma estructura ordenadna por cantidad de mayor a menor}
	
program parcial3;
type
	
	compra = record
		juego:integer;
		cliente:integer;
		dia:integer;
		mes:integer;
	end;
	
	compra2 = record
		juego:integer;
		dia:integer;
		mes:integer;
	end;
	
	
	lista =^nodoL;
	nodoL = record
		dato:compra2;
		sig:lista;
	end;
	
	
	cli=record
		codCli:integer;
		l:lista;
	end;
	
	
	
	arbol=^nodo;
	nodo=record
		dato:cli;
		HI:arbol;
		HD:arbol;
	end;
	
	vector = array [1..12] of integer;
	
//Modulos

procedure LeerCompra (var c:compra);
begin
	c.cliente:=random(100);
	if(c.cliente<>0)then begin
		c.juego:=random(200);
		c.dia:=random(31)+1;
		c.mes:=random(12)+1;
	end;
end;

procedure AgregarAdelante (var L:lista ; c2:compra2);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=c2;
	nue^.sig:=nil;
	if(L=nil)then
		L:=nue
	else begin
		nue^.sig:=L;
		L:=nue;
	end;
end;


procedure AgregarArbol (var a:arbol ; c:compra);
var
	c2:compra2;
begin
	if(a=nil)then begin
		new(a);
		c2.juego:=c.juego;
		c2.dia:=c.dia;
		c2.mes:=c.mes;
		a^.dato.codCli:=c.cliente;
		a^.dato.l:=nil;
		a^.HI:=nil;
		a^.HD:=nil;
		AgregarAdelante(a^.dato.l,c2);
	end
	else
		if(a^.dato.codCli = c.cliente)then begin
			c2.juego:=c.juego;
			c2.dia:=c.dia;
			c2.mes:=c.mes;	
			AgregarAdelante(a^.dato.l,c2);
		end
		else
			if(a^.dato.codCli > c.cliente)then
				AgregarArbol(a^.HI,c)
			else
				AgregarArbol(a^.HD,c);
	
end;

procedure ImprimirLista (L:Lista);
begin
	while(L<>nil)do begin
		writeln('Codigo de Juego: ', l^.dato.juego, ' Mes: ', l^.dato.mes, ' Dia: ', l^.dato.dia);
        L:= L^.sig;
	end;	
end;

procedure ImprimirArbol (a:arbol);
begin
	if(a<>nil)then begin
		ImprimirArbol(a^.HI);
		writeln('Codigo de Cliente: ',a^.dato.codCli);
		ImprimirLista(a^.dato.l);
		ImprimirArbol(a^.HD);
	end;
end;

procedure IncisoA (var a:arbol);
var
	c:compra;
begin
	a:=nil;
	LeerCompra(c);
	while(c.cliente<>0)do begin
		AgregarArbol(a,c);
		LeerCompra(c);
	end;
	writeln('Imprimo INCISO A: ');
	ImprimirArbol(a);
end;

procedure RetornarNodo (a:arbol ; cod:integer ; var L2:lista);
begin
	if(a<>nil)then begin
		if(a^.dato.codCli = cod)then
			L2:=a^.dato.l
		else 
			if(a^.dato.codCli > cod)then 
				RetornarNodo(a^.HI,cod,L2)
			else
				RetornarNodo(a^.HD,cod,L2);
	end;
end;	

procedure IncisoB (a:arbol);
var
	cod:integer;
	L2:lista;
begin
	writeln('Ingrese un codigo de cliente');
	readln(cod);
	RetornarNodo(a,cod,L2);
	ImprimirLista(L2);
end;

//Programa Principal

var
	a:arbol;
begin
	IncisoA(a);
	IncisoB(a);
end.
