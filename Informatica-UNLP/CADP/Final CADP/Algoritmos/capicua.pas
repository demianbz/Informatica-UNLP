program capicua;

var
	num,invertido,digito,numero:integer;
begin
	write('Ingrese un numero: '); readln(num);
	invertido:=0;
	numero:=num;
	while (num > 0) do begin
		digito := num MOD 10;		//Me quedo con el ultimo digito del numero
		invertido := invertido * 10 + digito;
		num := num DIV 10;		//Elimino el ultimo digito del numero
	end;
	if (invertido = numero)then
		writeln('El numero es capicua')
	else
		writeln('El numero NO es capicua');
end.
