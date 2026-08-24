package ar.edu.unlp.info.oo1.Ejercicio15_ClienteDeCorreo;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CarpetaTest {
	private Email email;
	private ArrayList<Email> emails;
	private Carpeta carpeta;
	
	@BeforeEach
	void setUp(){
		email = new Email("Parcial","Objetos",new ArrayList<>());
		emails = new ArrayList<>();
		emails.add(email);
		carpeta = new Carpeta(emails,"Inbox");
	}
	
	@Test 
	public void testBuscarEmail() {
		assertEquals(email,carpeta.buscar("Parcial"));
	}
	
	@Test 
	public void testBuscarEmailInexistente() {
		assertNull(carpeta.buscar("Java"));
	}
	
	@Test
	public void testMoverEmail() {
		Carpeta origen = new Carpeta();
		Carpeta destino = new Carpeta();
		
		origen.agregarEmail(email);
		origen.mover(email, destino);
		
		assertNull(origen.buscar("Parcial"));
		assertEquals(email,destino.buscar("Parcial"));
	}
	
	@Test
	public void testTamañoCarpeta() {
		assertEquals(14,carpeta.tamaño());
	}
	

}
