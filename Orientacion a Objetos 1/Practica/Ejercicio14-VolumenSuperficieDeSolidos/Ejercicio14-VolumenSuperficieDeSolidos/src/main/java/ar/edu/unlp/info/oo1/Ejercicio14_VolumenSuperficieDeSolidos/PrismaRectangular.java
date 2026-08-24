package ar.edu.unlp.info.oo1.Ejercicio14_VolumenSuperficieDeSolidos;

public class PrismaRectangular extends Pieza{
	private double ladoMayor;
	private double ladoMenor;
	private double altura;
	
	public PrismaRectangular() {
		
	}
	
	public PrismaRectangular(double ladoMayor, double ladoMenor, double altura) {
		this.ladoMayor = ladoMayor;
		this.ladoMenor = ladoMenor;
		this.altura = altura;
	}

	public double getVolumen() {
		return (ladoMayor * ladoMenor * altura);
	}


	public double getSuperficie() {
		return (2 * (ladoMayor * ladoMenor + ladoMayor * altura + ladoMenor * altura));
	}

}
