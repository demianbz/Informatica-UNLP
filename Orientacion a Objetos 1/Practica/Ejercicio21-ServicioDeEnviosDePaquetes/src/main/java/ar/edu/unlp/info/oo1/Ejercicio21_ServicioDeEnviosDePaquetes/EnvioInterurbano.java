package ar.edu.unlp.info.oo1.Ejercicio21_ServicioDeEnviosDePaquetes;

import java.time.LocalDate;

public class EnvioInterurbano extends Envio {
	private double distancia;

	public EnvioInterurbano(LocalDate fecha, String direccionOrigen, String direccionDestino, double peso , double distancia) {
		super(fecha, direccionOrigen, direccionDestino, peso);
		this.distancia = distancia;
		
	}

	
	
	public double getDistancia() {
		return this.distancia;
	}



	public void setDistancia(double distancia) {
		this.distancia = distancia;
	}



	public double costo() {
		if(this.getDistancia() < 100) {
			return 20 * this.getPeso();
		}
		if(this.getDistancia() <= 500) {
			return 25 * this.getPeso();
		}
		return 30 * this.getPeso();
	}

}
