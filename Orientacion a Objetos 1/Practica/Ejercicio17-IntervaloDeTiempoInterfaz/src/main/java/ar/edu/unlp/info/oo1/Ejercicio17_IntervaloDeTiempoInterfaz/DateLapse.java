package ar.edu.unlp.info.oo1.Ejercicio17_IntervaloDeTiempoInterfaz;

import java.time.LocalDate;

public interface DateLapse {
	public LocalDate getFrom();
	
	public LocalDate getTo();
	
	public int sizeInDays();
	
	public boolean includesDate(LocalDate other);
}
