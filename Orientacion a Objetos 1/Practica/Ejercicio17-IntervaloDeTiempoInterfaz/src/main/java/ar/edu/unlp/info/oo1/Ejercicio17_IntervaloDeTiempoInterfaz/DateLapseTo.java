package ar.edu.unlp.info.oo1.Ejercicio17_IntervaloDeTiempoInterfaz;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DateLapseTo implements DateLapse{
	private LocalDate from;
	private LocalDate to;
	
	public DateLapseTo(LocalDate from, LocalDate to) {
		this.from = from;
		this.to = to;
	}
	
	//	“Retorna la fecha de inicio del rango” 
	public LocalDate getFrom() {
		return this.from;
	}
	

	//“Retorna la fecha de fin del rango” 
	public LocalDate getTo() {
		return this.to;
	}
	
	
	//“retorna la cantidad de días entre la fecha 'from' y la fecha 'to'” 
	public int sizeInDays() {
		return (int) ChronoUnit.DAYS.between(this.from, this.to);
	}
	
	
	//“recibe un objeto LocalDate y retorna true si la fecha está entre el from y 
	//el to del receptor y false en caso contrario”.
	public boolean includesDate(LocalDate other) {
		return !other.isBefore(this.from) && !other.isAfter(this.to); // from <= other <= to
	}
}
