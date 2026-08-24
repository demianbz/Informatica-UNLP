package ar.edu.unlp.info.oo1.Ejercicio14_VolumenSuperficieDeSolidos;

public class Cilindro extends Pieza{
	private double altura;
	private double radio;
	
	public Cilindro() {
		
	}
	
	public Cilindro(double altura , double radio) {
		this.altura = altura;
		this.radio = radio;
	}

	public double getVolumen() {
		return (Math.PI * Math.pow(radio, 2) * altura);
	}


	public double getSuperficie() {
		return (2 * Math.PI * radio * altura+2 * Math.PI * Math.pow(radio, 2));
	}
	
}
