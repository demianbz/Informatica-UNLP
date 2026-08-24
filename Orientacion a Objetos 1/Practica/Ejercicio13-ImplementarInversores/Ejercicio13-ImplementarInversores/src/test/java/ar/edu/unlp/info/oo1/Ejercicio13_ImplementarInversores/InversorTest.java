package ar.edu.unlp.info.oo1.Ejercicio13_ImplementarInversores;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class InversorTest {
	private Inversor inversor;
	private Inversion inversion;

	@BeforeEach
	void setUp(){
		inversor = new Inversor();
		inversion = new InversionEnPlazoFijo(LocalDate.now(),1000,0.01);
	}

	//Verifico que se agrega bien la inversion cuando la lista de inversiones esta vacia.
	@Test
	void testAgregarInversionConListaVacia(){
		inversor.agregarInversion(inversion);
		
		assertTrue(inversor.getInversiones().size()==1);
	}
	
	//Verifico que se agrega bien la inversion cuando la lista de inversiones ya contiente inversiones.
	@Test
	void testAgregarInversionConListaConInversiones() {
		inversor.agregarInversion(inversion);
		
		Inversion otraInversion = new InversionEnPlazoFijo(LocalDate.now(),2000,0.02);
		inversor.agregarInversion(otraInversion);
		
		assertEquals(2,inversor.getInversiones().size());
	}
	
	
	//Verifico que se elimina la inversion existente
	@Test
	void testEliminarInversion() {
		inversor.agregarInversion(inversion);
		inversor.eliminarInversion(inversion);
		
		assertTrue(inversor.getInversiones().isEmpty());
	}
	
	//Verifico el valor borde sin inversiones
	@Test
	void testGetMontoTotalSinInversiones() {
		assertEquals(0,inversor.getMontoTotal(),0.01);
	}
	
	//Verifico que devuelva correctamente el monto de una inversion
	@Test
	void testGetMontoTotalConInversion() {
		  Inversion inversion = new InversionEnAcciones(10,new Accion("YPF",100));
		  inversor.agregarInversion(inversion);
		  
		  assertEquals(1000,inversor.getMontoTotal(),0.01);
	}
	
	//Verifico que devuelva correctamente el monto de varias inversiones
	@Test
	void testGetMontoTotalConInversiones() {
		  Inversion inversionYPF = new InversionEnAcciones(10,new Accion("YPF",100));
		  inversor.agregarInversion(inversionYPF);
		  Inversion inversionPuma = new InversionEnAcciones(5,new Accion("Puma",50));
		  inversor.agregarInversion(inversionPuma);
		  
		  assertEquals(1250,inversor.getMontoTotal());
	}
}
