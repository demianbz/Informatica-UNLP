{ •Ambos archivos (maestro y detalle) están ordenados porcódigo del producto
 •En el archivo detalle solo aparecen productos que  existen en el archivo maestro
 •Cada producto del maestro puede ser, a lo largo del día, vendido más de una vez, por lo tanto, en el archivo
 detalle pueden existir varios registros correspondientes al mismo producto}

program MaestroDetalle;
const
	valoralto = '9999';
type
	str4 = string[4];
	prod = record
		cod:str4;
		descripcion:string[30];
		pu:real;
		cant:integer;
	end;
	
	v_prod = record
		cod:str4;
		cv:integer;	//Cantidad Vendida
	end;
	
			
	detalle = file of v_prod; 
	maestro = file of prod;	

procedure leer(var archivo:detalle ; var dato:v_prod);
begin
	if(not EOF(archivo))then
		read(archivo,dato)
	else
		dato.cod:=valoralto;
end;


var
	regm:prod;
	regd: v_prod;  
	mae1: maestro; 
	det1: detalle;
begin
	assign (mae1, 'maestro');  assign (det1, 'detalle');
	reset (mae1);  reset (det1);
	leer(det1,regd);  {se procesan todos los registros del archivo det1}
	while (regd.cod <> valoralto) do begin
		read(mae1, regm);
		while (regm.cod <> regd.cod) do
			read (mae1,regm);
		{ se procesan códigos iguales }
		while (regm.cod = regd.cod) do begin
			regm.cant := regm.cant - regd.cv;        
		leer(det1,regd);          
		end;
		{reubica el puntero}
		seek (mae1, filepos(mae1)-1);
		write(mae1,regm);
	end;
end.
