
import java.util.*;

public class Auto {
	private	String ciudad;
	private int combustible;
	private int cargas;
	List<String> camino;
	
	
	
	public Auto(String ciudad, int combustible, int cargas, List<String> camino) {
		super();
		this.ciudad = ciudad;
		this.combustible = combustible;
		this.cargas = cargas;
		this.camino = camino;
	}
	
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public int getCombustible() {
		return combustible;
	}
	public void setCombustible(int combustible) {
		this.combustible = combustible;
	}
	public int getCargas() {
		return cargas;
	}
	public void setCargas(int cargas) {
		this.cargas = cargas;
	}
	public List<String> getCamino() {
		return camino;
	}
	public void setCamino(List<String> camino) {
		this.camino = camino;
	}

	
	
}
