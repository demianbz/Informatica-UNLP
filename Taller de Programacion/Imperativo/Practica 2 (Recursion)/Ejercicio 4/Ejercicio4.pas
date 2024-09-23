{Desafío…
4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}


program practica2ej4;

//Modulos



procedure Binario (num:integer);
begin
	if(num<>0)then begin
		Binario(num DIV 2);
		write(num MOD 2);{imprimo el resto que sera 0 o 1 y lo pongo luego de llamar al proceso para 
							imprimir de atras para adelante y dar vuelta la secuencia de binarios}
	end;
end;



//Programa Principal

var
  num:integer;
begin
	write('ingrese numero a convertir: ');
	readln(num);
    while(num<>0)do begin
		write('num en binario: ');
		Binario(num);
        writeln();
        writeln('ingrese numero a convertir: ');readln(num);
    end;		
end.
