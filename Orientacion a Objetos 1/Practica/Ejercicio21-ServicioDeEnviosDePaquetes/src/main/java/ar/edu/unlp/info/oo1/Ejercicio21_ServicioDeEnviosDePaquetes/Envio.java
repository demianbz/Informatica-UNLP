package ar.edu.unlp.info.oo1.Ejercicio21_ServicioDeEnviosDePaquetes;

import java.time.LocalDate;

public abstract class Envio {
	private LocalDate fecha;
	private String direccionOrigen;
	private String direccionDestino;
	private double peso;
	
	public Envio(LocalDate fecha , String direccionOrigen , String direccionDestino , double peso) {
		this.fecha = fecha;
		this.direccionOrigen = direccionOrigen;
		this.direccionDestino = direccionDestino;
		this.peso = peso;
	}
	
	abstract public double costo();
	
	public boolean despachoEntre(LocalDate fechaInicio , LocalDate fechaFin) {
		return (!this.fecha.isBefore(fechaInicio) && !this.fecha.isAfter(fechaFin));
	}
	
	public double getPeso() {
		return this.peso;
	}
	
}
