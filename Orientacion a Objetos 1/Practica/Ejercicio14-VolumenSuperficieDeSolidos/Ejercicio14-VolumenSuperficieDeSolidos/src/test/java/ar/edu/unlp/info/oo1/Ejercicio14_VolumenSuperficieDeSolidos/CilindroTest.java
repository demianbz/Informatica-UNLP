package ar.edu.unlp.info.oo1.Ejercicio14_VolumenSuperficieDeSolidos;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CilindroTest {

	 private Cilindro cilindro;

	    @BeforeEach
	    void setUp() {
	        cilindro = new Cilindro(10, 2);
	    }

	    @Test
	    void testGetVolumen() {
	        assertEquals(
	                Math.PI * Math.pow(2, 2) * 10,
	                cilindro.getVolumen(),
	                0.01);
	    }

	    @Test
	    void testGetSuperficie() {
	        assertEquals(
	                2 * Math.PI * 2 * 10
	                + 2 * Math.PI * Math.pow(2, 2),
	                cilindro.getSuperficie(),
	                0.01);
	    }
	}

