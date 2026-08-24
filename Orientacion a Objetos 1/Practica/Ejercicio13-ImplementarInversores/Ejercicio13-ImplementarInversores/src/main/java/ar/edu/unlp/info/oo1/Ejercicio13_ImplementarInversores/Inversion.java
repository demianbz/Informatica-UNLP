package ar.edu.unlp.info.oo1.Ejercicio13_ImplementarInversores;

public abstract class Inversion {
	
	public abstract double calcularValor();
		
	public double getValorActual() {
		return this.calcularValor();
	}
	
	
}
