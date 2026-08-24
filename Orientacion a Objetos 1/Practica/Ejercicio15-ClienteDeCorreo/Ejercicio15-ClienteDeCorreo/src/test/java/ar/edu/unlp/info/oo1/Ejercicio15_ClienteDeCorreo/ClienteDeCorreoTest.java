package ar.edu.unlp.info.oo1.Ejercicio15_ClienteDeCorreo;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ClienteDeCorreoTest {
	private Email email;
	private ClienteDeCorreo cliente;

	@BeforeEach
	void setUp(){
		email = new Email("Parcial","Objetos",new ArrayList<>());
		cliente = new ClienteDeCorreo();
	}
	

	
	@Test
	public void testBuscarCliente() {
		Carpeta inbox = new Carpeta();
		Carpeta trabajo = new Carpeta();
		
		trabajo.agregarEmail(email);
		ArrayList<Carpeta> carpetas = new ArrayList<>();
		carpetas.add(inbox);
		carpetas.add(trabajo);
		
		cliente = new ClienteDeCorreo(inbox,carpetas);
		
		assertEquals(email,cliente.buscar("Parcial"));
	}
	
	@Test
	public void testEspacioOcupado() {

	    Carpeta inbox = new Carpeta();

	    Email email = new Email(
	            "Hola",
	            "Mundo",
	            new ArrayList<>());

	    inbox.agregarEmail(email);

	    ArrayList<Carpeta> carpetas = new ArrayList<>();
	    carpetas.add(inbox);

	    ClienteDeCorreo cliente =
	            new ClienteDeCorreo(inbox, carpetas);

	    assertEquals(9, cliente.espacioOcupado());
	}

}
