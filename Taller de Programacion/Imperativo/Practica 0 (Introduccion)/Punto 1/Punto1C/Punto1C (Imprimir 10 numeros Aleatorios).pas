program GenerarNumerosAleatorios;
var
    i:integer;
begin
  randomize;  { Inicializa el generador de números aleatorios }

  { Imprime 10 números aleatorios entre 0 y 99 }
  for i := 1 to 10 do
  begin
    writeln('Numero aleatorio ', i, ' generado es: ', random(100));  { random(100) genera un número entre 0 y 100 }
  end;

end.

