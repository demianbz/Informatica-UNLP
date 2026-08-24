package ar.edu.unlp.info.oo1.Ejercicio7_FigurasyCuerpos;

public class Circulo extends Figura2D {
	private double radio;
	
	public Circulo() {
		
	}

	public Circulo(double radio) {
		this.radio = radio;
	}
	
	public double getDiametro() {
		return radio*2;
	}
	
	public void setDiametro(double valor) {
		radio = valor / 2;
	}
	
	public double getRadio() {
		return this.radio;
	}
	
	public void setRadio(double valor) {
		this.radio = valor;
	}
	
	public double getPerimetro() {
		return Math.PI*this.getDiametro();
	}
	
	public double getArea() {
		return Math.PI*radio*radio;
	}
}
