package ar.edu.unlp.info.oo1.Ejercicio21_ServicioDeEnviosDePaquetes;

import java.time.LocalDate;

public class EnvioLocal extends Envio {
	private boolean entregaRapida;

	public EnvioLocal(LocalDate fecha, String direccionOrigen, String direccionDestino, double peso, boolean entregaRapida) {
		super(fecha, direccionOrigen, direccionDestino, peso);
		this.entregaRapida = entregaRapida;
	}

	
	public double costo() {
		if(this.getEntregaRapida()) {
			return 1500;
		}
		return 1000;
	}

	
	public void setEntregaRapida(boolean entregaRapida) {
		this.entregaRapida = entregaRapida;
	}
	
	public boolean getEntregaRapida() {
		return this.entregaRapida;
	}
}
