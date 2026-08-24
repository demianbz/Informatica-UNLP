package ar.edu.unlp.info.oo1.Ejercicio7_FigurasyCuerpos;

public class Cuerpo3D {
	private double altura;
	private Figura2D caraBasal;
	
	public Cuerpo3D() {
		
	}
		
	public Cuerpo3D (Figura2D caraBasal, double altura) {
		this.caraBasal = caraBasal;
		this.altura=altura;
	}
	
	public void setAltura(double valor) {
		this.altura = valor;
	}
	
	public double getAltura() {
		return this.altura;
	}
	
	public void setCaraBasal(Figura2D cara) {
		this.caraBasal = cara;
	}
	
	public double getVolumen() {
		return (caraBasal.getArea() * altura);
	}
	
	public double getSuperficieExterior() {
		return (2* caraBasal.getArea() + caraBasal.getPerimetro() * altura);
	}
}
