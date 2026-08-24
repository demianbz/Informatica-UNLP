package ar.edu.unlp.info.oo1.Ejercicio19_AlquilerDePropiedades;

import java.time.LocalDate;

public class Reserva {
	private DateLapse periodo;
	private Usuario inquilino;
	private Propiedad propiedad;
	
	public Reserva(DateLapse periodo, Propiedad propiedad, Usuario inquilino) {
		this.periodo = periodo;
		this.propiedad = propiedad;
		this.inquilino = inquilino;
	}
	
	
	public boolean seSuperpone(DateLapse periodo) {
		return periodo.overlaps(this.periodo);
	}
	
	
	public int cantDias() {
		return this.periodo.sizeInDays();
	}
	
	public double costo() {
		return this.cantDias() * this.propiedad.getPrecioPorNoche();
	}
	
	
	public boolean estaEnCurso() {
		LocalDate hoy = LocalDate.now();
		return this.periodo.includesDate(hoy);
	}
	
}
