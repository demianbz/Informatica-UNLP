package ar.edu.unlp.info.oo1.Ejercicio15_ClienteDeCorreo;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class EmailTest {
	private Email email;
	
	@BeforeEach
	void setUp(){
		email = new Email("Hola","Mundo",new ArrayList<>());
	}

	@Test
	public void testTamañoSinAdjuntos() {		
		assertEquals(9,email.tamaño());
	}

	
	@Test 
	public void testTamañoConAdjuntos() {
		ArrayList<Archivo> adjuntos = new ArrayList<>();
		adjuntos.add(new Archivo("foto"));
		adjuntos.add(new Archivo("pdf"));
		
		email = new Email("Hola","Mundo",adjuntos);
		
		assertEquals(16,email.tamaño());
	}
	
	@Test
	public void testCumple() {
		assertTrue(email.cumple("Hola"));
	}
	
	@Test
	public void testNoCumple() {
		assertFalse(email.cumple("Chau"));
	}
}
