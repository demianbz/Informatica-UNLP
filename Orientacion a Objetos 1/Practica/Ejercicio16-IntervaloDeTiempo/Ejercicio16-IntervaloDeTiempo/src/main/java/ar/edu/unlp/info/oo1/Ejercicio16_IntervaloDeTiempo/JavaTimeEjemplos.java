package ar.edu.unlp.info.oo1.Ejercicio16_IntervaloDeTiempo;

import java.time.*;
import java.time.temporal.ChronoUnit;



public class JavaTimeEjemplos {
	public static void main(String[] args) {
		
		//Crear una fecha determinada
		LocalDate fecha = LocalDate.of(1971, 9, 15);	// 15/09/1971
		LocalDate inicio = LocalDate.of(1971, 12, 15);	// 15/12/1971
		LocalDate fin = LocalDate.of(2032, 12, 15);		// 15/12/2032
		
		
		//Verificar si una fecha esta entre otras dos
		boolean estaEntre = fecha.isAfter(inicio) && fecha.isBefore(fin); // inicio < fecha < fin
		System.out.println(estaEntre);
		//Incluyendo extremos
		boolean estaEntreIncluyendo = !fecha.isBefore(inicio) && !fecha.isAfter(fin); // inicio <= fecha <= fin
		System.out.println(estaEntreIncluyendo);
		
		
		//Calcular dias entre dos fechas
		long dias = fecha.until(inicio, ChronoUnit.DAYS);
		System.out.println(dias);
		//Otra forma
		long diass = ChronoUnit.DAYS.between(fecha, inicio);
		System.out.println(diass);
		
		
		//Calcular meses entre dos fechas
		long meses = fecha.until(inicio, ChronoUnit.MONTHS);
		System.out.println(meses);
		
		
		//Calcular años entre dos fechas
		long años = fecha.until(inicio, ChronoUnit.YEARS);
		System.out.println(años);
	}
}
