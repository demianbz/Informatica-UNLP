{Crear archivo binario desde un texto }

program TextoBinario;
type

	tRegistroVotos = record
		codProd:integer;
		codLoc:integer;
		nroMesa:integer;
		cantVotos:integer;
		desc:string;
	end;
	
	tArchVotos = file of tRegistroVotos;
	
var
	opc: byte;
	nomArch,nomArch2: string;
	arch: tArchVotos;
	carga: Text;	//archivo de texto con datos de los votos, se lee de el y se genera archivo binario
	votos: tRegistroVotos;
begin
	writeln('VOTOS');
	writeln;
	writeln('0. Terminar el programa');
	writeln('1. Crear un archivo binario desde un archivo de texto');
	writeln('2. Abrir un archivo binario y exportar a texto');
	repeat
		write('Ingrese el nro. de opcion: '); readln(opc);
		if(opc=1)or(opc=2)then begin
			writeln;
			write('Nombre del archivo de Votos: '); readln(nomArch);
			assign(arch,nomArch);
		end;
	{Opción 1 crea el archivo binario desde un texto}
	Case opc of 
    1: begin
		Write('Nombre del archivo de carga: ');
		ReadLn(nomArch2);
        Assign(carga, nomArch2); 
        Reset(carga); {abre archivo de texto con datos}
        Rewrite(arch); {crea nuevo archivo binario}
        while (not eof(carga)) do begin
			ReadLn(carga,votos.codProd,votos.codLoc, votos.nroMesa,votos.cantVotos,votos.desc); {lectura del archivo de texto}
			Write(arch, votos); {escribe binario}
	    end;
		Write('Archivo cargado.');
        ReadLn;
        Close(arch); Close(carga); {cierra los dos archivos}
        end;
    {Opcion 2 exporta el contenido del binario a un texto}
	2: begin
		Write('Nombre del archivo de texto: ');
		ReadLn(nomArch2);
		Assign(carga, nomArch2);  
		Reset(arch); {abre archivo binario}
		Rewrite(carga); {crea archivo de texto, se utiliza el mismo de opcion 1 a modo ejemplo}
	while (not eof(arch)) do begin
		Read(arch, votos); {lee votos del arch binario}
		WriteLn(carga,votos.codProd,' ',votos.codLoc,' ', votos.nroMesa,' ',votos.cantVotos,' ',votos.desc); 
		{escribe en el archivo texto los campos separados por el carácter blanco}
      end;
      Close(arch); Close(carga)
    end;
    end;
    until opc = 0;
end.
