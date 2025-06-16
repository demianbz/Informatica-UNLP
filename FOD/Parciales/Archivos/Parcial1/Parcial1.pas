{1. Archivos Secuenciales
Un supermercado tiene 25 cajas que registran diariamente las ventas de productos. De cada venta se dispone: número de ticket, código 
del producto y cantidad de unidades vendidas del producto.	Al finalizar el día, los archivos correspondientes a las cajas se ordenan 
por código de producto para luego actualizar el archivo de productos. Los registros del archivo de productos contienen el código del 
producto, la descripción, la cantidad en existencia, el stock mínimo y el precio de venta actual. Implementar un programa que permita:
a) Dada la cantidad de cajas, actualizar la existencia de cada producto registrando la cantidad vendida en la jornada. 
Tenga en cuenta que el stock no puede quedar por debajo de cero.
b) Informar aquellos productos que dispongan unidades en existencia y no hayan sido vendidos.
c) Informar aquellos productos vendidos que quedaron por debajo del stock mínimo.
d) Informar para cada código de producto, el nombre y el monto total vendido, y también informar el monto total facturado en el día
 para todos los productos.
NOTA: No debe implementarse el ordenamiento de los archivos. Todos los archivos deben recorrerse una única vez}

program parcial1;
const
	valor_alto = 9999;
	cajas = 3; 	//25
	
type
	cantCajas = 1..cajas;

	infoMaestro = record 
		codigo:integer;
		descripcion:string;
		cantExistente:integer;
		stockMin:integer;
		precio:real;
	end;
	
	infoDetalle = record
		ticket:integer;
		codigo:integer;
		cantVen:integer;
	end;

	archivo_detalle = file of infoDetalle;
	archivo_maestro = file of infoMaestro;
	vectorDetalles = array [cantCajas] of archivo_detalle;
	vectorRegistros = array [cantCajas] of infoDetalle;

//Modulos

procedure leerMaestro(var m:infoMaestro);
begin
	write('Ingrese el codigo o 0 en caso de terminar: ');readln(m.codigo);
	if(m.codigo<>0)then begin
		write('Ingrese la descripcion: ');readln(m.descripcion);
		write('Ingrese la cantidad existente: ');readln(m.cantExistente);
		write('Ingrese el Srock Minimo: ');readln(m.stockMin);
		write('Ingrese el precio: ');readln(m.precio);
	end;
end;

{procedure crearMaestroDesdeTeclado(var mae:archivo_maestro);
var
	regMae:infoMaestro;
begin
	assign(mae,'ArchivoMaestro');
	rewrite(mae);
	leerMaestro(regMae);
	while(m.codigo<>0)do begin
		write(mae,regMae);
		leerMaestro(regMae);
	end;
	writeln('Archivo Maestro Creado');
	close(mae);
end;}

procedure crearMaestroDesdeTexto (var mae:archivo_maestro);
var
	archText:text;
	regMae:infoMaestro;
begin
	assign(archText,'maestro.txt');
	reset(archText);
	assign(mae,'ArchivoMaestro');
	rewrite(mae);
	while(not EOF(archText))do begin
		readln(archText,regMae.codigo,regMae.cantExistente,regMae.stockMin,regMae.precio,regMae.descripcion);
		write(mae,regMae);
	end;
	writeln('Archivo Maestro Creado');
	close(archText);
	close(mae);
end;

procedure crearUnDetalle(var det:archivo_detalle);
var
	archText:text;
	regDet:infoDetalle;
	nombreText:string;
	nombreDet:string;
begin
	write('Ingrese la ruta del Detalle ".txt": ');readln(nombreText);
	assign(archText,'nombreText');
	reset(archText);
	write('Ingrese un nombre para el archivo Detalle (binario): ');readln(nombreDet);
	assign(det,nombreDet);
	rewrite(det);
	while(not EOF(archText))do begin
		readln(regDet.ticket,regDet.codigo,regDet.cantVen);
		write(det,regDet);
	end;
	close(archText);
	close(det);
end;

procedure crearDetalles(var vecDet:vectorDetalles);
var
	i:cantCajas;
begin
	for i:=1 to cajas do begin
		crearUnDetalle(vecDet[i]);
		writeln('Archivo Detalle ',i,' Creado');
	end;
end;

procedure minimo(var vecDet:vectorDetalles ; var vecReg: vectoRegistros ; min:infoDetalle);
var
	i,pos: cantCajas;
begin
	min.codigo = valor_alto;
	for i:= 1 to cajas do begin
		if(vecReg[i].codigo<min.codigo)then begin
			min := vecReg[i];
			pos:=i;
		end;
	end;
	if(min.codigo <> valor_alto)then
		leer(vecDet[pos],vecR[pos]);
end;

procedure actualizarMaestro(var mae:archivo_maestro ; var vecDet:vectorDetalles);
var
	montoTotal,monto:real;
	min:infoDetalle;
	i:cantCajas;
	regMae:infoMaestro;
begin
	montoTotal:=0;
	for i:=1 to cajas do begin
		reset(vecDet[i]);	//abro archivo detalle
		leer(vecDet[i],vecReg[i]);	//guardo el archivo detalle en el vector de registros
	end;
	reset(mae);
	minimo(vecDet,vecReg,min);
	while(min.codigo<>valor_alto)do begin
		read(mae,regMae);
		while(regMae.codigo<>min.codigo)do begin
			read(mae,regMae);
		end;
		monto:=0;
		cantComprados:=0;
		while(regDet.codigo = min.codigo)do begin
			if(min.cant>regMae.cantExistente)then begin
				cantComprados := cantComprados + regMae.cantExistente;
				regMae.cantExistente:=0;
			end
			else begin
				cantComprados := cantComprados + min.cant;
				regMae.cantExistente := regMae.cantExistente - min.cant;
			end;
			minimo(vecDet,vecReg,min)
		end;
		monto := regMae.precio * cantComprados;
		if(regMae.cantExistente < regMae.stockMin)then
			writeln(regMae.codigo, 'cantAct: ',regMae.cantExistente);
		seek(mae,filsePos(mae)-1);
		write(mae,regMae);
		montoTotal:=montoTotal + monto
		writeln(regMae.codigo, 'Descr:',regMae.descripcion,'Monto:',monto);
	end;
	close(mae);
	for i:=1 to cajas do
		close(vecDet[i]);
	writeln('Monto total recaudado: ',montoTotal);
end;

procedure imprimirMaestro(var mae: arcMaestro);
var
    info: infoMaestro;
begin
    reset(mae);
    while(not eof(mae)) do
        begin
            read(mae, info);
            writeln(info.codigo, ' CantActual: ', info.cantActual);
        end;
    close(mae);
end;

//Programa Principal

var
	mae: archivo_maestro;
	vecDet: vectorDetalles;
begin
	crearMaestroDesdeTexto(mae);
	crearDetalles(vecDet);
	actualizarMaestro(mae,vecDet);
	imprimirMaetro(mae);
end.
