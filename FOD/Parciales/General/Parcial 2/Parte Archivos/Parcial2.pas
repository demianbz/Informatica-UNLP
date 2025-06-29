{EJERCICIO 1: ARCHIVOS
Enunciado
Una plataforma digital organiza cada año una serie de eventos de sesiones musicales en vivo.
Cada evento cuenta con múltiples presentaciones realizadas en distintas fechas, y un mismo
artista puede participar varias veces en el mismo evento un mismo año.
Se dispone de un archivo que contiene la información de cada presentación individual. Cada
registro indica: el código del artista, el nombre del artista, el año en el que se realizó la
presentación, el código del evento, el nombre del evento, la cantidad de "likes" recibidos durante
esa presentación, la cantidad de "dislikes" recibidos, y el puntaje otorgado por el jurado técnico a
dicha presentación. El archivo está ordenado por año, luego por código de evento, y finalmente
por código de artista.
Se solicita definir las estructuras de datos necesarias y escribir el módulo que reciba el archivo y
genere un informe por pantalla con el siguiente formato de ejemplo:
Resumen de menor influencia por evento.
Año: 2022
Evento: nombreEvento1 (Código: códigoEvento1)
Artista: nombreArtista1 (Código: códigoArtista1)
Likes totales: total likes artista 1
Dislikes totales: total dislikes artista 1
Diferencia: diferencia (likes totales - dislikes totales) de artista 1
Puntaje total del jurado: puntaje total obtenido por el artista 1
…
Artista: nombreArtistaN (Código: códigoArtistaN)
idem anterior pero para artista N
El artista “nomArtistaMenosInfluyente” fue el menos influyente de nombreEvento1 del año 2022.
…
Evento: nombreEventoN (Código: códigoEventoN)
idem anterior para cada artista en el evento N
Durante el año 2022 se registraron “nroPresentaciones” de presentaciones de artistas.
…
Año: N
idem anterior para cada evento del año N
Durante el año N se registraron “nroPresentaciones” de presentaciones de artistas.
El promedio total de presentaciones por año es de: “promedioPresentacionesPorAño” presentaciones.
Nota: El artista menos influyente del evento, es aquel con menor puntaje total del jurado
acumulado. En caso de empate, se debe elegir al que haya recibido más dislikes,
independientemente de la diferencia. En caso de que haya empate nuevamente, elegir
cualquiera de los que tiene el menor puntaje total del jurado y la mayor cantidad de dislikes.}
program parcial2;
const 
	valor_alto = 9999; 
	max = -1; 
type 
 
	presentacion = record 
		codArtista: integer; 
		nombreArtista: string[20]; 
		anio: integer; 
		codEvento: integer; 
		nombreEvento: string[20]; 
		cantLikes: longInt; 
		cantDislikes: longInt; 
		puntaje: real; 
	end;  
	 
	archivo = file of presentacion; 
 
procedure leer (var a: archivo; var reg: presentacion); 
begin 
	if (not(EOF(a))) then  
		read(a, reg) 
	else 
		reg.anio := valor_alto; 
end;

procedure informe (var a: archivo); 
var 
	reg, act: presentacion; 
    anios, presentacionesAnio, presentacionesTotal: integer; 
    puntajeMin: real; 
    nombreArtista: string[20]; 
    dislikesMax: longInt; 
begin  
    anios := 0; 
    reset(a); 
    leer(a, reg);  
    presentacionesTotal := 0; 
    writeln('Resumen de menor influencia por evento.'); 
    while (reg.anio <> valor_alto) do begin 
		act.anio := reg.anio; 
		writeln('Anio: ', act.anio); 
		anios := anios + 1; 
		presentacionesAnio := 0; 
        while (act.anio = reg.anio) do begin 
			act.codEvento := reg.codEvento; 
			act.nombreEvento := reg.nombreEvento; 
			puntajeMin := valor_alto; 
			dislikesMax := max; 
            writeln('Evento: ', act.nombreEvento, ' (Codigo: ', act.codEvento, ')'); 
            while (act.anio = reg.anio) and (act.codEvento = reg.codEvento) do begin 
				act.codArtista := reg.codArtista; 
				act.nombreArtista := reg.nombreArtista; 
				act.cantLikes := 0; 
				act.cantDislikes := 0;  
				act.puntaje := 0; 
				writeln('Artista: ', act.nombreArtista, ' (Codigo: ', act.codArtista, ')'); 
				while (act.anio = reg.anio) and (act.codEvento = reg.codEvento) and (act.codArtista = reg.codArtista) do begin 
					act.cantLikes := act.cantLikes + reg.cantLikes; 
					act.cantDislikes := act.cantDislikes + reg.cantDislikes; 
					act.puntaje := act.puntaje + reg.puntaje; 
                    presentacionesAnio := presentacionesAnio + 1; 
					leer(a,reg); 
				end; 
				if (act.puntaje < puntajeMin) or ((act.puntaje = puntajeMin) and  (act.cantDislikes > dislikesMax)) then begin 
					puntajeMin := act.puntaje; 
					dislikesMax := act.cantDislikes; 
					nombreArtista := act.nombreArtista; 
				end; 
				writeln('Likes totales: ', act.cantLikes); 
				writeln('Dislikes totales: ', act.cantDislikes); 
				writeln('Diferencia: ', (act.cantLikes - act.cantDislikes)); 
				writeln('Puntaje total del jurado: ', act.puntaje:2:2); 
       end; 
       writeln('El artista ', nombreArtista, ' fue el menos influyente de ', act.nombreEvento, ' del anio ', act.anio, '.'); 
       end;  
       writeln('Durante el anio ', act.anio, ' se registraron ', presentacionesAnio, ' de presentaciones de artistas.');  
       presentacionesTotal := presentacionesTotal + presentacionesAnio; 
    end;  
    writeln; 
    if anios > 0 then 
        writeln('El promedio total de presentaciones por anio es de: ', (presentacionesTotal / anios):0:2, ' presentaciones.')
    else 
		writeln('No se registraron presentaciones.'); 
    close(a); 
end;  

var
	a:archivo;
begin
	assign(a,'ArchivoPresentaciones.dat');
	informe(a);
end.
