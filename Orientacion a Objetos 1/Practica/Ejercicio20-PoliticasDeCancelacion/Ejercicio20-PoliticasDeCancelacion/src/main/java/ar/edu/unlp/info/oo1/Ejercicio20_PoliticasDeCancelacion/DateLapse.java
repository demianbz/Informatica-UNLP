package ar.edu.unlp.info.oo1.Ejercicio20_PoliticasDeCancelacion;

import java.time.*;
import java.time.temporal.ChronoUnit;

public class DateLapse {
	private LocalDate from;
	private LocalDate to;
	
	public DateLapse(LocalDate from, LocalDate to) {
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
	
	//Retorna true si el período de tiempo del receptor se superpone con el 
	//recibido por parámetro
	public boolean overlaps(DateLapse otroIntervalo) {
		return !(otroIntervalo.to.isBefore(this.from) || otroIntervalo.from.isAfter(this.to));
	}
	

}
