{ •Ambos archivos (maestro y detalle) están ordenados por el mismo criterio
 •En el archivo detalle solo aparecen empleados que existen en el archivo maestro
 •Cada empleado del archivo maestro a lo sumo puede aparecer una vez en el archivo detalle}
 
program MaestroDetalle;
type
	emp = record   
		direccion: string[30];                     
		nombre: string[30];
		cht: integer; 
	end;
	                        
	e_diario = record
		nombre: string[30];                    
		cht: integer; 
	end;
			
	detalle = file of e_diario; {archivo que contiene la informacion diaria}
	maestro = file of emp;	{archivo que contiene la informacion de los completa}

var
	regm:emp;
	regd: e_diario;  
	mae1: maestro; 
	det1: detalle;
begin
	assign (mae1, 'maestro');
	assign (det1, 'detalle');
	{proceso principal}
	reset (mae1);  reset (det1);
	while (not eof(det1)) do begin
		read(mae1, regm);
		read(det1,regd);
		while (regm.nombre <> regd.nombre) do
			read (mae1,regm);
		regm.cht := regm.cht + regd.cht;
		seek (mae1, filepos(mae1)-1);
		write(mae1,regm);
	end;
end.
