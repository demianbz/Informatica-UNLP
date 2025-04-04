program parcialClinicaTurnoN2024;
type
	atencion = record
		matricula:integer;
		dni:integer;
		mes:integer;
		diagnostico:char;
	end;
	paciente = record
		dni:integer;
		diag:char;
	end;
	arbol = ^nodo;
	nodo = record
		dato:paciente;
		hi:arbol;
		hd:arbol;
	end;
	vector = array[1..12] of arbol;
	procedure iniciarVec (var v:vector);
	var
		i:integer;
	begin
		for i:= 1 to 12 do
			v[i]:=nil;
	end;
	procedure imprimirArbol (a:arbol);
	begin
		if(a<>nil) then begin
			imprimirArbol(a^.hi);
			writeln ( ' dni del paciente : ', a^.dato.dni, ' y su cod de diagnostico es : ', a^.dato.diag);
			imprimirArbol(a^.hd);
		end;
		
	end;
	procedure imprimirVector (v:vector);
	var
		i:integer;
	begin
		for i:= 1 to 12 do begin
			writeln ( ' en el mes  ', i, ' las atenciones registradas son : ');
			imprimirArbol(v[i]);
		end;
	end;
	procedure PuntoA (var v:vector);
			procedure leerAtencion(var at:atencion);
			var
				vec : array[1..5] of char = ('L','M','N','O','P');
			begin
				writeln ( 'ingrese una matricula, 0 para cortar ');
				readln(at.matricula);
				if(at.matricula<>0) then begin
					at.dni:=random(5000)+1000;
					at.diagnostico:=vec[random(5)+1];
					at.mes:=random(12)+1;
				end;
			end;
			
			procedure insertarElemento (var a:arbol; at:atencion);
			begin
				if(a=nil) then begin
					new (a);
					a^.dato.dni:=at.dni;
					a^.dato.diag:=at.diagnostico;
					a^.hi:=nil;
					a^.hd:=nil;
				end
				else
					if(at.dni<=a^.dato.dni) then
						insertarElemento(a^.hi,at)
					else
						insertarElemento(a^.hd,at)
			end;
	var
		at:atencion;
	begin
		iniciarVec(v);
		leerAtencion(at);
		while(at.matricula<>0) do begin
			insertarElemento(v[at.mes],at);
			leerAtencion(at);
		end;
		imprimirVector(v);
	end;
	procedure PuntoB (v:vector; var mesMax:integer);
				function recorrerArbol (a:arbol):integer;
				begin
					if(a=nil) then 
						recorrerArbol:=0
					else
						recorrerArbol:=1 + recorrerArbol(a^.hi) + recorrerArbol(a^.hd) 
				end;
				procedure retornarMesMaximo(v:vector; pos,max:integer; var mesMax:integer);
				var
					cant:integer;
				begin
					if(pos<=12) then begin
						cant:=recorrerArbol(v[pos]);
						if(cant>max) then begin
							max:=cant;
							mesMax:=pos;
						end;
						retornarMesMaximo(v,pos+1,max,mesMax);		
					end;
				end;
				
	var
		max, pos:integer;
	begin
		pos:=1;
		max:=-1;
		retornarMesMaximo(v,pos,max,mesMax);
		writeln ( ' el mes con mayor cantidad de antenciones es el mes : ', mesMax);
	end;
	procedure PuntoC (v:vector; var existe:boolean);
				function ExisteDni (a:arbol; dni:integer):boolean;
				begin	
					if(a=nil) then
						ExisteDni:=false
					else
						if(dni = a^.dato.dni)then
							ExisteDni:=true
						else
							if(dni < a^.dato.dni) then
								ExisteDni:= ExisteDni(a^.hi,dni)
							else
								 ExisteDni:= ExisteDni(a^.hd,dni)
				end;
	var
		ok:boolean; i,dni:integer;
	begin		
		ok:=false;
		writeln ( ' ingrese dni del paciiente para ver si fue atendido ');
		readln (dni);
		i:=1;
		while((i<=12)and(not ok)) do begin
			ok:=ExisteDni(v[i],dni);
			i:=i + 1;
		end; 
		existe:=ok;
		if(existe ) then
			writeln ( ' el ppaciente ingresadoo fue atendidoo ')
		else
			writeln ( ' el ppaciente ingresadoo no fue atendidoo ')
			
	end;
var
	existe:boolean;
	mesMaxAtenciones:integer; v:vector;
begin
	PuntoA(v);
	PuntoB(v,mesMaxAtenciones);
	PuntoC(v,existe);
end.
