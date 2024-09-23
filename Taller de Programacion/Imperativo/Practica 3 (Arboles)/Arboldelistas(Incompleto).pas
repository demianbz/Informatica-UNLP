{Un sistema de Gestion de Correos Electronicos desea manejar los correos recibidos por cada cliente. De cada Cliente se conoce su
Codigo(1..1000), direccion de email, y todos los mensajes  de correo que a recibido. De cada mensaje se conoce la direccion del emisor, la 
fecha de envio, el asunto, el texto y si ya fue leido.
Realizar un programa que  invoque a modulos para:

1.Leer y almacenar correos electronicos en una estructura de datos eficiente para la busqueda por codigo de cliente. La lectura finaliza al
ingresar  el ciente 0. De cada correo se lee el id de cliente, su direccion de correo  y toda la informacion del mensaje. La informacion debe
quedar agrupada por cliente.

2.Leer un codigo de cliente  e informar la cantidad de correos  sin leer.

3.Leer una direccion de correo e informar la cantidad de correos enviados desde dicha direccion.}

program ArbolDeListas;
const
	MaxCod = 1000;
type
	rango_cod = 1..MaxCod;
	
	mensaje = record
		emisor: string;
		fecha: string;
		asunto:string;
		leido:string;
		texto: string;
	end;
	
	cliente = record
		cod: rango_cod;
		email: string;
	end;
	
	mensajeLeido = record
		msj: mensaje;
		cli: cliente;
	end;

	lista = ^nodo2;
	nodo2 = record
		dato2: mensaje;
		sig2: lista;
	end;
	
	datoCliente = record
		cli:cliente;
		mensajes:lista;
	end;
	
	arbol = ^nodo;
	nodo = record 
		dato:datoCliente;
		HD:arbol;
		HI:arbol;
	end;
	
//Modulos

procedure leerMensaje (var m:mensajeLeido);
begin
	write('Ingrese el codigo del Cliente: '); readln(m.cli.cod);
	write('Ingrese el email del Cliente: '); readln(m.cli.email);
	write('Ingrese el emisor del Mensaje: '); readln(m.msj.emisor);
	write('Ingrese la fecha del Mensaje: '); readln(m.msj.fecha);
	write('Ingrese el asunto del Mensaje: '); readln(m.msj.asunto);
	write('Ingrese el texto del mensaje: '); readln(m.msj.texto);
	write('Ingrese 1 para indicar que el Mensaje fue leido o 0 en caso contrario: ');readln(m.msj.leido);
end;
	
procedure AgregarAdelante (var L:lista ; m:mensaje);
var
	nue:lista;
begin
	new(nue);
	nue^.dato2:=m;
	nue^.sig2:=nil;
	if(L=nil)then
		L:=nue
	else begin
		nue^.sig2:=L;
		L:=nue;
	end;
end;

procedure Agregar (var a:arbol ; m:mensajeLeido);
var
	nue:arbol;
begin
	if(a=nil)then begin
		new(nue);
		nue^.dato.cli:=m.cli;
		nue^.dato.mensajes:=m;
		AgregarAdelante(nue^.dato.mensajes, m.msj);
		nue^.HI:=nil;
		nue^.HD:=nil;
		a:=nue;
	end
	else begin
		if(a^.dato.cod =m.cli.cod) then
			AgregarAdelante(a^.dato.mensajes, m.msj)
		else
			if(a^.dato.cli.cod > m.cli.cod)then
				Agregar(a^.HI,m)
			else
				Agregar(a^.HD,m);
	end;
end;
	
	
function ContarCorreosNoLeidos ( L:lista) :integer;
var
	cant:integer;
begin
	while (L<>nil) do begin
		if(L^.dato2.leido = 0) then
			cant:=cant+1;
		L:=L^.sig2;
	end;
end;	


function CantCorreosSinLeer (a:arbol ;	cod:rango_cod):integer; //2.Leer un codigo de cliente  e informar la cantidad de correos  sin leer.
var
	retorno:integer;
begin
	if(a=nil) then
		retorno := -1
	else begin
		if(a^.dato.cli.cod = cod) then
			retorno:=ContarCorreosNoLeidos(a^.dato.mensaje) 
	else
		if(a^.dato.cod > cod ) then
			retorno:=CantCorreosSinLeer(a^.HI,cod)
		else
			retorno:=CantCorreosSinLeer(a^.HD,cod);
	end;
end;

procedure ImprimirLista (L:lista);
begin
	while (L<>nil) do begin
	writeln('Codigo del Cliente: ', L^.dato2.codigo);
	writeln('Email del Cliente: '); readln(m.cli.email);
	writeln('Emisor del Mensaje: '); readln(m.msj.emisor);
	writeln('Fecha del Mensaje: '); readln(m.msj.fecha);
	writeln('Asunto del Mensaje: '); readln(m.msj.asunto);
	writeln('Texto del mensaje: '); readln(m.msj.texto);
	writeln('Ingrese 1 para indicar que el Mensaje fue leido o 0 en caso contrario: ');readln(m.msj.leido);
		L:=L^.sig;
	end;
end;

procedure Imprimir (a:arbol);
begin
	writeln('-----Mensajes-----');
	writeln;
	ImprimirLista(a^.dato.mensajes);
	if(a^.dato.mensajes.leido = 1) then
		writeln('El mensaje fue Leido');
	else
		writeln('El mensaje no fue leido');
end;

procedure ImprimirOrdenCreciente (a:arbol);	//i. Informar los datos de los socios en orden creciente por número de socio
begin
	if(a<>nil)then begin
		ImprimirOrdenCreciente(a^.HI);
		Imprimir(a);
		ImprimirOrdenCreciente(a^.HD);
	end;
end;

	
procedure InformarOrdenCreciente (a:arbol) ;
begin
	writeln ('---------------------------------------------------');
	writeln;
	writeln('Arbol en Orden CRECIENTE (por Codigo de Cliente)');
	writeln;
	ImprimirOrdenCreciente(a);
	writeln;
end;	
	
//Programa Principal

var
	a:arbol;
	l:lista;
begin
	a:=nil;
	l:=nil;
	Agregar(a);
	InformarOrdenCreciente(a);
end;
