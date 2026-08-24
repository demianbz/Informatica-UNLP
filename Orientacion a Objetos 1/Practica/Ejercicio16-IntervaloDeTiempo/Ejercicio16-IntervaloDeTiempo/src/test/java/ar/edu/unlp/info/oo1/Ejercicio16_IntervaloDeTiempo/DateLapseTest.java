package ar.edu.unlp.info.oo1.Ejercicio16_IntervaloDeTiempo;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class DateLapseTest {
	private DateLapse intervalo;
	
	@BeforeEach
	void setUp() {
		intervalo = new DateLapse(LocalDate.of(2000, 1, 1),LocalDate.of(2026, 12, 31));
	}
	
	@Test
	public void testSizeInDaysIgual0() {
		LocalDate fechaIgualFechaInicio = LocalDate.of(2000, 1, 1);
		LocalDate fechaInicio = intervalo.getFrom();
		intervalo = new DateLapse(fechaInicio,fechaIgualFechaInicio);
		
		assertEquals(0,intervalo.sizeInDays());
	}
	
	@Test
	public void testSizeInDaysMayor0(){
		assertTrue(intervalo.sizeInDays()>0);
	}
	
	@Test
	public void testIncludesDateUnDiaAntesDelIncio() {
		LocalDate other = LocalDate.of(1999, 12, 31);
		
		assertFalse(intervalo.includesDate(other));
	}
	
	@Test
	public void testIncludesDateDiaInicio() {
		LocalDate other = LocalDate.of(2000, 1, 1);
		
		assertTrue(intervalo.includesDate(other));
	}
	
	@Test
	public void testIncludesDateUnDiaDespuesDelInicio() {
		LocalDate other = LocalDate.of(2000, 1, 2);
		
		assertTrue(intervalo.includesDate(other));
	}
	
	@Test
	public void testIncludesDateUnDiaAntesDelFin() {
		LocalDate other = LocalDate.of(2026, 12, 30);
		
		assertTrue(intervalo.includesDate(other));
	}
	
	@Test
	public void testIncludesDateDiaFin() {
		LocalDate other = LocalDate.of(2026, 12, 31);
		
		assertTrue(intervalo.includesDate(other));
	}
	
	@Test
	public void testIncludesDateUnDiaDespuesDelFin() {
		LocalDate other = LocalDate.of(2027, 1, 1);
		
		assertFalse(intervalo.includesDate(other));
	}
}
