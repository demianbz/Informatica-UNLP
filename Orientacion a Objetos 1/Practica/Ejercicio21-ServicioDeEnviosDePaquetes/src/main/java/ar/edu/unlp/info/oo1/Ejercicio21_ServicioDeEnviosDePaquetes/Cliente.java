package ar.edu.unlp.info.oo1.Ejercicio21_ServicioDeEnviosDePaquetes;

import java.time.LocalDate;
import java.util.ArrayList;

public abstract class Cliente {
	private String direccion;
	private ArrayList<Envio> envios;
	
	public Cliente(String direccion) {
		this.direccion = direccion;
		this.envios = new ArrayList<>();
	}
	
	
	public void agregarEnvio(Envio envio) {
		this.envios.add(envio);
	}
	
	abstract public double descuento();
	
	public double montoAPagar(LocalDate fechaInicio, LocalDate fechaFin) {
		return this.envios.stream()
				.filter(envio -> envio.despachoEntre(fechaInicio, fechaFin))
				.mapToDouble(Envio::costo).sum() * this.descuento();
	}
	
}
