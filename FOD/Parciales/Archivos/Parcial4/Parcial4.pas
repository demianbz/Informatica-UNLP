{1. Archivos Secuenciales
Una cadena de tiendas de indumentaria posee un archivo maestro no ordenado con la información correspondiente a las prendas que se encuentran 
a la venta. De cada prenda se registra: cod_prenda, descripción, colores, tipo_prenda, stock y precio_unitario. Ante un eventual cambio de 
temporada, se deben actualizar las prendas a la venta. Para ello reciben un archivo conteniendo: cod_prenda de las prendas que quedarán 
obsoletas. Deberá implementar un procedimiento que reciba ambos archivos y realice la baja lógica de las prendas, para ello deberá modificar 
el stock de la prenda correspondiente a valor negativo.
Por último, una vez finalizadas las bajas lógicas, deberá efectivizar las mismas compactando el archivo. Para ello no podrá utilizar ninguna 
estructura auxiliar, debe resolverlo dentro del mismo archivo. Solo deben quedar en el archivo las prendas que no fueron borradas, una vez
realizadas todas las bajas físicas.}
program parcial4;
type

	prenda = record
		codigo:integer;
		descripcion:string[20];
		colores: string[20];
		tipo:string[20];
		stock:integer;
		precio:real;
	end;

	maestro = file of prenda;
	detalle = file of integer;
	

//Modulos

procedure cargarMaestro(var mae:maestro);
var
	archText:text;
	regMae:prenda;
begin
	assign(mae,'Archivo Maestro');
	assign(archText,'Maestro.txt');
	rewrite(mae);
	reset(archText);
	
	while(not EOF(archText))do begin
		readln(archText,regMae.codigo,regMae.descripcion);
		readln(archText,regMae.stock,regMae.colores);
		readln(archText,regMae.precio,regMae.tipo);
		write(mae,regMae);
	end;
	
	close(mae);
	close(archText);
end;

procedure cargarDetalle(var det:detalle);
var
	archText:text;
	codigo:integer;
begin
	assign(det,'Archivo Detalle');
	assign(archText,'Detalle.txt');
	rewrite(det);
	reset(archText);
	
	while(not EOF(archText))do begin
		readln(archText,codigo);
		write(det,codigo);
	end;
	
	close(det);
	close(archText);
end;

procedure bajasLogicas(var mae:maestro ; var det:detalle);
var
	regMae:prenda;
	codigo:integer;
	encontre:boolean;
begin
	reset(mae);
	reset(det);
	
	while(not EOF(det))do begin
		read(det,codigo);	
		encontre:=false;
		while((not EOF(mae)) and (not encontre))do begin
			read(mae,regMae);
			if(regMae.codigo = codigo)then begin
				regMae.stock := -1;
				seek(mae,filePos(mae)-1);
				write(mae,regMae);
				encontre:=true;
			end;
		end;
		seek(mae,0);	//Vuelvo al principio del maestro para el proximo codigo
	end;
	
	close(mae);
	close(det);
end;

procedure imprimirMaestro(var mae:maestro);
var
	regMae:prenda;
begin
	reset(mae);
	
	while(not EOF(mae))do begin
		read(mae,regMae);
		writeln('Codigo de Prenda: ',regMae.codigo,'  Stock: ',regMae.stock);
	end;
	
	close(mae);
end;

procedure bajasFisicas(var mae:maestro);	//La baja fisica la hago reemplazando por el ultimo registro valido del archivo
var
	regMae,regUltimo:prenda;
	posActual,posUltimo:integer;
begin
	//Abro el archivo
	reset(mae);
	//Obtengo la posicion del ultimo Registro
	posActual := 0;
	posUltimo := fileSize(mae)-1;
	
	//Recorro el archivo desde el inicio con una variable posActual
	while(posActual<=posUltimo)do begin
		seek(mae,posActual);	//Me paro en la posicion actual
		read(mae,regMae);
		
		if(regMae.stock < 0)then begin	//Si encuentro un registro con stock<0
		if(posActual = posUltimo)then begin	//Si es el ultimo solo hago el truncate
			seek(mae,posUltimo);
			truncate(mae);
			posUltimo := posUltimo-1;
		end
		else begin	//Sino Leo el ultimo registro y lo intercambio con la posActual, y haco el truncate
			//Traigo el ultimo registro
			seek(mae,posUltimo);
			read(mae,regUltimo);
			
			if(regUltimo.stock < 0)then begin	//Puede pasar que el ultimo que traigo tambien sea invalido entonces hago truncate directamente
				seek(mae,posUltimo);
				truncate(mae);
				posUltimo := posUltimo-1;
				//No aumento la posicion porque en la posicion en la que estoy sigo teniendo un registro invalido
			end
			else begin	//Si el que me traigo es valido, ahi si hago el reemplazo normalmente
				//Hago el intercambio del ultimo con la posActual
				seek(mae,posActual);
				write(mae,regUltimo);
				
				//Hago el truncate
				seek(mae,posUltimo);
				truncate(mae);
				posUltimo:=posUltimo-1;
				
				//Avanzo la posicion actual
				posActual := posActual +1;
			end;
		end;
		end
		else
			posActual := posActual +1;
	end;
	//Cierro el Archivo
	close(mae);
end;

//Programa Principal

var
	mae:maestro;
	det:detalle;
begin
	cargarMaestro(mae);	//SE DISPONE
	cargarDetalle(det);	//SE DISPONE
	writeln('-----Maestro Cargado-----');
	imprimirMaestro(mae);
	writeln;
	bajasLogicas(mae,det);
	bajasFisicas(mae);
	writeln('-----Maestro Actualizado-----');
	imprimirMaestro(mae);
end.
