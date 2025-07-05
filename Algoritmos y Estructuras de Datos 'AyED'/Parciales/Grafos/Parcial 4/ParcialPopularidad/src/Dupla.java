
public class Dupla {
	private int distancia;
	private boolean popular;
	
	public Dupla() {
		
	}
	
	public int getDistancia() {
		return distancia;
	}
	public void setDistancia(int distancia) {
		this.distancia = distancia;
	}
	public boolean isPopular() {
		return popular;
	}
	public void setPopular(boolean popular) {
		this.popular = popular;
	}
	
	public String toString() {
		return distancia + " " + popular;
	}
	
	
}
