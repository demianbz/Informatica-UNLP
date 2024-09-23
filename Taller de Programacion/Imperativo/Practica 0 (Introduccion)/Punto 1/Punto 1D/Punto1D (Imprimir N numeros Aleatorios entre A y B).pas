{d) Modifique el programa para que imprima N números aleatorios en el rango (A,B), donde N, A y B son 
números enteros que se leen por teclado.}

program GenerarNumerosAleatorios;
var
    N,A,B,i:integer;
    
begin
	randomize;  {Inicializa el generador de números aleatorios}
	
	writeln('Ingrese la cantidad de numeros aleatorios que desea imprimir: ');
	readln(N);
	
	writeln('Ingrese el Rango Inicial: ');
	readln(A);
	
	writeln('Ingrese el Rango Final: ');
	readln(B);
	
	
	for i := 1 to N do {Imprime 10 números aleatorios entre A y B}
    begin
		writeln('Numero aleatorio ', i, ' generado es: ', random(B-A)+1+A);  { random(AB) genera un número entre A y B }
																			 { (b - a) = la cantidad de números
																			   (+ 1) = Random(10) va de 0 hasta 9 (10 números)
																			   (+ a) = el mínimo número random es a}
																			
    end;

end.
