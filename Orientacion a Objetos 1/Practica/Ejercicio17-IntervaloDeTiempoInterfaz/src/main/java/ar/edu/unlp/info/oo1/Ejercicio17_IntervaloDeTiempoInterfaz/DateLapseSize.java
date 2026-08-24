package ar.edu.unlp.info.oo1.Ejercicio17_IntervaloDeTiempoInterfaz;

import java.time.LocalDate;

public class DateLapseSize implements DateLapse {
	private LocalDate from;
	private int sizeInDays;
	
	public DateLapseSize(LocalDate from, int sizeInDays) {
		this.from = from;
		this.sizeInDays = sizeInDays;
	}
	
	//	“Retorna la fecha de inicio del rango” 
	public LocalDate getFrom() {
		return this.from;
	}
	

	//“Retorna la fecha de fin del rango” 
	public LocalDate getTo() {
		return this.from.plusDays(this.sizeInDays);
	}
	
	
	//“retorna la cantidad de días entre la fecha 'from' y la fecha 'to'” 
	public int sizeInDays() {
		return this.sizeInDays;
	}
	
	
	//“recibe un objeto LocalDate y retorna true si la fecha está entre el from y 
	//el to del receptor y false en caso contrario”.
	public boolean includesDate(LocalDate other) {
		return !other.isBefore(this.from) && !other.isAfter(this.getTo()); // from <= other <= to
	}
}
