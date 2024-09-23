{e) Modifique el programa para que imprima números aleatorios en el rango (A,B) hasta que se genere un 
valor igual a F, el cual no debe imprimirse. F, A y B son números enteros que se leen por teclado.}

program GenerarNumerosAleatorios;
var
    ale,F,A,B:integer;
    
begin
	randomize;  {Inicializa el generador de números aleatorios}
	
	writeln('Ingrese el numero que no desea imprimir: ');
	readln(F);
	
	writeln('Ingrese el Rango Inicial: ');
	readln(A);
	
	writeln('Ingrese el Rango Final: ');
	readln(B);
	
	ale:= random(B-A)+1+A;
	
	while(ale<>F) do
	begin
		writeln('el numero aleatorio generado es: ', ale);
		ale:= random(B-A)+1+A;												
    end;
	writeln('El Proceso termino porque se ingreso el numero no deseado: ', F);
end.
