package ar.edu.unlp.info.oo1.Ejercicio14_VolumenSuperficieDeSolidos;

import java.util.ArrayList;

public class ReporteDeConstruccion {
	private ArrayList<Pieza> piezas;
	
	public ReporteDeConstruccion() {
		this.piezas = new ArrayList<>();
	}
	
	public void agregarPieza(Pieza pieza) {
		this.piezas.add(pieza);
	}
	
	public double volumenDeMaterial(String material) {
		return this.piezas.stream()
		.filter(p -> p.getMaterial().equals(material))
		.mapToDouble(Pieza::getVolumen).sum();
	}
	
	
	public double superficieDeColor(String color) {
		return this.piezas.stream()
				.filter(p -> p.getColor().equals(color))
				.mapToDouble(Pieza::getSuperficie).sum();
	}
}
