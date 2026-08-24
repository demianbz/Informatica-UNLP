package ar.edu.unlp.info.oo1.Ejercicio14_VolumenSuperficieDeSolidos;

public abstract class Pieza {
	private String material;
	private String color;
	
	
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}

	abstract public double getVolumen();
	
	abstract public double getSuperficie();
	
	
	
}
