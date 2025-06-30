{1. Archivos Secuenciales
Una empresa que comercializa fármacos recibe de cada una de sus 30 sucursales un resumen mensual de las ventas y desea analizar la 
información para la toma de futuras decisiones.El formato de los archivos que recibe la empresa es: cod_farmaco, nombre, fecha, 
cantidad_vendida, forma_pago (campo String indicando contado o tarjeta).
Los archivos de ventas están ordenados por: cod_farmaco y fecha.
Cada sucursal puede vender cero, uno o más veces determinado fármaco el mismo día, y la forma de pago podría variar en cada venta. Realizar 
los siguientes procedimientos:
a) Recibe los 30 archivos de ventas e informa por pantalla el fármaco con mayor cantidad_vendida.
b) Recibe los 30 archivos de ventas e informa por pantalla la fecha en la que se produjeron más ventas al
contado mostrando fecha y cantidad de pagos contado.
c) Recibe los 30 archivos de ventas y guarda en un archivo de texto un resumen de ventas por fecha y fármaco con el siguiente formato: 
cod_farmaco, nombre, fecha, cantidad_total_vendida. (el archivo de texto deberá estar organizado de manera tal que al tener que utilizarlo
pueda recorrerse el archivo realizando la menor cantidad de lecturas posibles). 
Nota: en el archivo de texto por: fecha, cada fármaco 
aparecerá a lo sumo una vez. Además de escribir cada procedimiento deberá declarar las estructuras de datos utilizadas.}
program parcial3;
const
	cantDet = 3;	//30
	valor_alto = 9999;
type

	farmaco = record
		cod_farmaco:integer;
		nombre:string[20];
		fecha:string[20];
		cantidad_vendida:integer;
		formaPago:string[10];
	end;

	detalle = file of farmaco;
	vectorDetalles = array [1..cantDet] of detalle;
	vectorRegistros = array [1..cantDet] of farmaco;

//Modulos

procedure leer(var det:detalle ; var regDet:farmaco);
begin
	if(not EOF(det))then
		read(det,regDet)
	else
		regDet.cod_farmaco := valor_alto;
end;

procedure cargarUnDetalle(var det:detalle);
var
	archText:text;
	nomDet:string;
	nomText:string;
	regDet:farmaco;
begin
	write('Ingrese la ruta del detalle (.txt) :');readln(nomText);
	assign(archText,nomText);
	reset(archText);
	write('Ingrese un nombre para el archivo detalle (binario) :');readln(nomDet);
	assign(det,nomDet);
	rewrite(det);
	while(not EOF(archText))do begin
		readln(archText,regDet.cod_farmaco,regDet.nombre);
		readln(archText,regDet.cantidad_vendida,regDet.fecha);
		readln(archText,regDet.formaPago);
		write(det,regDet);
	end;
	writeln;
	close(det);
	close(archText);
end;

procedure cargarDetalles(var vecDet:vectorDetalles);
var
	i:integer;
begin
	for i:=1 to cantDet do begin
		cargarUnDetalle(vecDet[i]);
	end;
end;

procedure minimo(var vecDet:vectorDetalles ; var vecReg:vectorRegistros ; var min:farmaco);
var
	i,pos:integer;
begin
	min.cod_farmaco:=valor_alto;
	min.fecha := 'ZZZ';
	for i:=1 to cantDet do begin
		if((vecReg[i].cod_farmaco < min.cod_farmaco) or ((vecReg[i].cod_farmaco = min.cod_farmaco) and (vecReg[i].fecha < min.fecha)))then begin
			min:=vecReg[i];
			pos:=i;
		end;
	end;
	if(min.cod_farmaco <> valor_alto)then
		leer(vecDet[pos],vecReg[pos]);
end;

procedure informar(vecDet:vectorDetalles);
var
	vecReg:vectorRegistros;
	i:integer;
	min:farmaco;
	codAct:integer;
	cantTotalVent,maxVent:integer;
	cantCont,maxCont:integer;
	fechaAct,fechaMax:string;
	cantFecha:integer;
	nombreAct,nombreMax:string;
	archText:text;
begin
	//Leo los Detalles
	for i:=1 to cantDet do begin
		reset(vecDet[i]);			//Abro el detalle
		leer(vecDet[i],vecReg[i]);	//Leo el detalle y lo guardo en el vector de registros
	end;
	
	//Creo el archivo de Texto. Inciso c)
	assign(archText,'Informe.txt');
	rewrite(archText);

	maxCont:=0;
	maxVent:=0;
	minimo(vecDet,vecReg,min);
	while(min.cod_farmaco<>valor_alto)do begin
		codAct:=min.cod_farmaco;
		nombreAct:=min.nombre;
		cantTotalVent:=0;
		while(min.cod_farmaco = codAct)do begin	//Mientras siga en el mismo codigo
			cantFecha:=0;
			fechaAct:=min.fecha;
			cantCont:=0;
			while((codAct = min.cod_farmaco) and (fechaAct = min.fecha))do begin	//Mientras siga en la misma fecha
				if(min.formaPago = 'Contado')then
					cantCont := cantCont + min.cantidad_vendida;
				cantFecha := cantFecha + min.cantidad_vendida;
				minimo(vecDet,vecReg,min);
			end;
			
			//Cargo el archivo de Texto
			writeln(archText,codAct,cantFecha,nombreAct);
			writeln(archText,fechaAct);
			
			if(cantCont>maxCont)then begin	//Inciso B)
				maxCont:=cantCont;
				fechaMax:=fechaAct;
			end;
			cantTotalVent := cantTotalVent + cantFecha;
		end;
		
		if(cantTotalVent>maxVent)then begin	//Inciso A)
			maxVent:=cantTotalVent;
			nombreMax:=nombreAct;
		end;
		
	end;
	
	writeln('El farmaco con mayor cantidad Vendida es: ',nombreMax);
	writeln('La fecha en la que se produjeron mas ventas al contado es: ',fechaMax,' con ',maxCont,' pedidos al contado');
	
	//Cierro los Detalles
	for i:=1 to cantDet do begin
		close(vecDet[i]);
	end;
	
	//Cierro el archivo de Texto
	close(archText);
end;



//Programa Principal

var
	vecDet:vectorDetalles;
begin
	cargarDetalles(vecDet);	//SE DISPONE
	informar(vecDet);
end.
