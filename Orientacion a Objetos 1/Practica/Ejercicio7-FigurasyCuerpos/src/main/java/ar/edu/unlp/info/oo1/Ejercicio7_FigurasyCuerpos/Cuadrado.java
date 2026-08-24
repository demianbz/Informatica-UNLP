package ar.edu.unlp.info.oo1.Ejercicio7_FigurasyCuerpos;

public class Cuadrado extends Figura2D{
	private double lado;
	
	public Cuadrado() {
		
	}
	
	public Cuadrado(double lado) {
		this.lado=lado;
	}
	
	public void setLado(double valor) {
		this.lado = valor;
	}
	
	public double getLado() {
		return this.lado;
	}
	
	public double getPerimetro() {
		return lado*4;
	}
	
	public double getArea() {
		return lado * lado;
	}

}
