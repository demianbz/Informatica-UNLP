{Archivos - Actualización Maestro-Detalle – Inventario de Insumos de una Farmacia
Una farmacia mantiene información en un archivo maestro sobre sus insumos médicos. El archivo maestro contiene los siguientes campos:
Código de insumo, Nombre del insumo, Descripción, Stock actual, Stock mínimo y si requiere receta de archivo o no (la receta de archivo
es un adicional que se le hace a las recetas para medicamentos que requieren un control más estricto).
Además, la farmacia registra diariamente en un archivo detalle los insumos vendidos durante el día. El archivo detalle contiene:
Código de insumo, Cantidad vendida, Nombre del cliente y domicilio.
Ambos archivos están ordenados por código de insumo.
Requerimientos del programa:
1.Declarar los tipos de datos necesarios para la gestión de ambos tipos de archivos (registro maestro y detalle).
2.Implementar un procedimiento que realice la actualización del archivo maestro a partir de los detalles del mes (30 archivos detalle)
siguiendo estas reglas:
	-Por cada código de insumo que aparezca en el archivo detalle, se debe descontar del stock actual del maestro la cantidad vendida.
	-Si al actualizar un insumo, su stock actual queda por debajo del stock mínimo, se debe mostrar un mensaje por pantalla indicando 
	que es necesario reponer ese insumo (incluyendo su nombre, descripción, stock actual y mínimo).
	-Además, se debe cargar en un archivo de texto (declarado en el procedimiento) los medicamentos y clientes que necesitan receta de
	archivo.En caso de que el medicamento necesite receta de archivo, se carga: código de insumo, cantidad vendida, nombre del cliente
	y domicilio del cliente.}

program parcial1;
const
	detalles = 3;	//30
	valor_alto = 9999;

type
	cantDet = 1..detalles;

	maestro = record
		codigo:integer;
		nombre:string[10];
		descripcion:string[20];
		stockAct:integer;
		stockMin:integer;
		receta:string[10];
	end;

	detalle = record
		codigo:integer;
		cantVent:integer;
		nomCliente:string[10];
		domicilio:string[15];
	end;

	archivo_maestro = file of maestro;
	archivo_detalle = file of detalle;
	vectorDetalles = array [cantDet] of archivo_detalle;
	vectorRegistros = array [cantDet] of detalle;


//Modulos

procedure crearMaestro(var mae:archivo_maestro);
var
	archText:text;
	m:maestro;
begin
	assign(archText,'Maestro.txt');
	reset(archText);
	assign(mae,'Maestro');
	rewrite(mae);
	while(not EOF(archText))do begin
		readln(archText,m.codigo,m.nombre);
		readln(archText,m.stockAct,m.stockMin,m.receta);
		readln(archText,m.descripcion);
		write(mae,m);
	end;
	close(mae);
	close(archText);
end;

procedure crearUnDetalle(var det:archivo_detalle);
var
	d:detalle;
	archText:text;
	nomDet:string;
	nomText:string;
begin
	write('Ingrese la ruta del detalle (.txt) :');readln(nomText);
	assign(archText,nomText);
	reset(archText);
	write('Ingrese un nombre para el archivo detalle (binario) :');readln(nomDet);
	assign(det,nomDet);
	rewrite(det);
	while(not EOF(archText))do begin
		readln(archText,d.codigo,d.nomCliente);
		readln(archText,d.cantVent,d.domicilio);
		write(det,d);
	end;
	writeln;
	close(det);
end;

procedure crearDetalles(var vecDet:vectorDetalles);
var
	i:cantDet;
begin
	for i:=1 to detalles do begin
		crearUnDetalle(vecDet[i]);
	end;
end;

procedure leer(var det:archivo_detalle ; var regDet:detalle);
begin
	if(not EOF(det))then
		read(det,regDet)
	else
		regDet.codigo := valor_alto;
end;

procedure minimo(var vecDet:vectorDetalles ; var vecReg:vectorRegistros ; var min:detalle);
var
	i,pos:cantDet;
begin
	min.codigo := valor_alto;	//Inicializo el minimo
	for i:=1 to detalles do begin
		if(vecReg[i].codigo<min.codigo)then begin	//comparo el minimo
			min := vecReg[i];		//me guardo el registro minimo en min
			pos:=i;					//me guardo la posicion del minimo porque si leo ahora puede llegar otro mas chico despues
		end;
	end;
	if(min.codigo<>valor_alto)then begin	//Si se actualizo el minimo
		leer(vecDet[pos],vecReg[pos]);		//Leo ese registro del archivo y del vector de registros para avanzar y no leer siempre lo mismo
	end;
end;


procedure actualizarMaestro(var mae:archivo_maestro ; var vecDet:vectorDetalles);
var
	vecReg:vectorRegistros;
	i:cantDet;
	min:detalle;
	m:maestro;
	archText:text;
	codAct:integer;
	cantTotVent:integer;
begin
	reset(mae);
	//Creo el Archivo de Texto
	assign(archText,'Receta.txt');
	rewrite(archText);
	
	//Leo Detalles
	for i:=1 to detalles do begin
		reset(vecDet[i]);			//Abro el detalle
		leer(vecDet[i],vecReg[i]);	//Leo el detalle y lo guardo en el vector de registros
	end;
	
	//Llamo al proceso minimo para quedarme con el minimo y respetar el orden
	minimo(vecDet,vecReg,min);
	
	while(min.codigo<>valor_alto)do begin
		codAct:=min.codigo;
		//Leo el maestro hasta encontrar el codigo que quiero modificar
		repeat
			read(mae, m);
		until (m.codigo = codAct);
		
		//Acumulo todas las ventas del mismo codigo en la variable cantTotVent
		cantTotVent:=0;
		while(min.codigo = codAct)do begin
			cantTotVent := cantTotVent + min.cantVent;
			if(m.receta = 'Requiere')then
				writeln(archText, min.codigo, ' ',min.cantVent, ' ',min.nomCliente, ' ',min.domicilio);
			minimo(vecDet,vecReg,min);
		end;
		
		//Actualizo Maestro
		m.stockAct := m.stockAct - cantTotVent;	//Le decuento el stock Actual del maestro con la cant vendida del dia
		seek(mae,filePos(mae)-1);				//Posiciono el puntero una posicion atras porque cuando leo avanzo
		write(mae,m);							//Escribo el maestro con el stock modificado
		
		if(m.stockAct<m.stockMin)then begin	
			writeln('Es necesario reponer el insumo ',m.nombre,' "',m.descripcion,'" con StockAct:',m.stockAct,'  StockMin:',m.stockMin);
		end;
	end;
	//Cierro los detalles
	for i:=1 to detalles do begin
		close(vecDet[i]);
	end;
	//Cierro el maestro
	close(mae);
	//Cierro el archivo de texto
	close(archText);
end;


procedure imprimirMaestro(var mae: archivo_maestro);
var
    m: maestro;
begin
    reset(mae);
    writeln;
    writeln('-----Archivo Maestro Actualizado-----');
    while(not eof(mae)) do
        begin
            read(mae, m);
            writeln('Cod: ',m.codigo, ' StockActual: ', m.stockAct);
        end;
    close(mae);
end;


//Programa Principal

var
	mae:archivo_maestro;
	vecDet:vectorDetalles;
begin
	crearMaestro(mae);		//SE DISPONE
	crearDetalles(vecDet);	//SE DISPONE
	actualizarMaestro(mae,vecDet);
	imprimirMaestro(mae);
end.
