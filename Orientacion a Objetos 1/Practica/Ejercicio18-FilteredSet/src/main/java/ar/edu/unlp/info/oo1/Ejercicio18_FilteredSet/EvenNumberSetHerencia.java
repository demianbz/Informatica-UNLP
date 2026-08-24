package ar.edu.unlp.info.oo1.Ejercicio18_FilteredSet;

import java.util.HashSet;

//Esta es la solucion que se realiza cuando se pide:
//“Se debe subclasificar una determinada clase y redefinir un método para que 
// haga lo siguiente”
// o sea HERENCIA

public class EvenNumberSetHerencia extends HashSet<Integer>{
	
	@Override
	public boolean add(Integer number) {
		if(number == null || number % 2 != 0) {
			return false;
		}
		
		return super.add(number);
	}
	
	
}

