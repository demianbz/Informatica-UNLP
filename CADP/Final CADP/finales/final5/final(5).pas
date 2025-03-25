{1.- Realice un programa que resuelva lo siguiente: dos amigos juegan a la batalla naval (simplificada). Para esto, cada amigo 
dispone de su tablero de 20 filas × 15 columnas donde en alguna posición del tablero tiene ubicados cada uno de sus 7 barcos 
(cada barco se encuentra en una única posición). El juego consiste en lo siguiente:
*
-Se juegan 10 rondas, en cada ronda, cada jugador invoca a la función dameNumeroFila y a la función dameNumeroColumna y a partir de 
esos valores se debe invocar al procedimiento juego, que dado un tablero, una fila y una columna, retorna verdadero si había un 
barco en esa posición o falso en caso contrario. Primero juega el jugador 1 y luego el 2 hasta que ocurran las 10 rondas.

-Luego de las 10 rondas se debe informar el puntaje de cada jugador, es decir, a cuántos barcos del otro jugador ha logrado hundir.

NOTAS: Las funciones dameNumeroFila y dameNumeroColumna no deben implementarse, solo invocarse. El resto de los módulos utilizados
deben implementarse. Además, declara todas las estructuras utilizadas. Tenga en cuenta que el mismo barco no debe contabilizarse
dos veces, es decir, si por azar se consulta la fila 1 columna 2 y ahí se encontraba un barco, si en alguna otra ronda al mismo
jugador le tocan esos mismos valores ya no se contará como que allí hay un barco porque ya fue hundido.}

program final5;
const
	dimC = 3;
	dimT = 3;
	cantRondas = 3;
type
	
	columnas = array [1..dimC] of integer;
	tableros = array [1..dimT] of columnas;
	
	
	
//Modulos

procedure cargarTablero (var t:tableros);
var
	i,j:integer;
	cant:integer;
	barco:integer;
begin
	cant:=0;
	for i:=1 to dimT do begin
		for j:=1 to dimC do begin
			if(cant<7)then begin
				write('Si quiere agregar un barco en la posicion (',i,',',j,') ingrese un 1 sino un 0: ');
				readln(barco);
				t[i][j]:=barco;
				if(barco=1)then
					cant:=cant+1;
			end
			else
				t[i][j]:=0;
		end;
	end;
end;

procedure imprimirTablero(t:tableros);
var
	i,j:integer;
begin
	for i:= 1 to dimT do begin
		for j:= 1 to dimC do begin
			write(t[i,j],'|');
		end;
		writeln;
	end;
end;

procedure cargarTableros (var t1,t2:tableros);
begin
	writeln('----Jugador 1----');
	writeln;
	cargarTablero(t1);
	writeln;
	imprimirTablero(t1);
	writeln;
	writeln('----Jugador 2----');
	writeln;
	cargarTablero(t2);
	writeln;
	imprimirTablero(t2);	
	writeln;
end;

procedure dameNumeroFila(var i:integer);	//SE DISPONE
begin
	i:=Random(3);
end;

procedure dameNumeroColumna(var j:integer);	//SE DISPONE
begin
	j:=Random(3);
end;

function juego (t:tableros ; i,j:integer):boolean;
begin
	juego:= (t[i][j] = 1);
end;

procedure jugar(var t1,t2:tableros ; var aciertos1,aciertos2:integer);
var
	r:integer;
	i,j:integer;
begin
	i:=0;
	j:=0;
	aciertos1:=0;
	aciertos2:=0;
	writeln('---------- JUEGO ----------');
	writeln;
	for r:= 1 to cantRondas do begin
		writeln('----Jugador 1----');
		dameNumeroFila(i);
		dameNumeroColumna(j);
		if(juego(t1,i,j))then begin
			aciertos1:=aciertos1+1;
			t1[i,j]:=0;
			writeln('ACERTASTE EL DISPARO');
		end
		else
			writeln('ERRASTE EL DISPARO');
		
		writeln;
		
		writeln('----Jugador 2----');
		if(juego(t2,i,j))then begin
			aciertos2:=aciertos2+1;
			t2[i,j]:=0;
			writeln('ACERTASTE EL DISPARO');
		end
		else
			writeln('ERRASTE EL DISPARO');
		writeln;
				
	end;
	writeln;
end;

procedure ganador (aciertos1,aciertos2:integer);
begin
	if(aciertos1>aciertos2)then
		writeln('GANADOR JUGADOR 1')
	else
		writeln('GANADOR JUGADOR 2');
	writeln;
	writeln('Puntaje Jugador 1: ',aciertos1);
	writeln('Puntaje Jugador 2: ',aciertos2);
end;

//Programa Principal

var
	t1:tableros;
	t2:tableros;
	aciertos1,aciertos2:integer;	
begin
	Randomize;
	cargarTableros(t1,t2);
	jugar(t1,t2,aciertos1,aciertos2);
	ganador(aciertos1,aciertos2);
end.
