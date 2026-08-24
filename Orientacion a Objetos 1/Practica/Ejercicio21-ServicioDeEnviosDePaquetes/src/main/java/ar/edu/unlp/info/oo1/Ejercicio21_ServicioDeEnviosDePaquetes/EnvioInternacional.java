package ar.edu.unlp.info.oo1.Ejercicio21_ServicioDeEnviosDePaquetes;

import java.time.LocalDate;

public class EnvioInternacional extends Envio {
	private boolean entregaRapida;

	public EnvioInternacional(LocalDate fecha, String direccionOrigen, String direccionDestino, double peso, boolean entregaRapida) {
		super(fecha, direccionOrigen, direccionDestino, peso);
		this.entregaRapida = entregaRapida;
	}

	
	public double costo() {
		double costo = 0;
		if(this.getPeso()<=1000) {
			costo = 5000 + 10 * this.getPeso();
		}else {
			costo = 5000 + 12 * this.getPeso();
		}
		if(this.entregaRapida) {
			costo += 800;
		}
		return costo;
	}

	
	public void setEntregaRapida(boolean entregaRapida) {
		this.entregaRapida = entregaRapida;
	}
	
	public boolean getEntregaRapida() {
		return this.entregaRapida;
	}
}
