package ar.edu.unlp.info.oo1.Ejercicio14_VolumenSuperficieDeSolidos;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class EsferaTest {

    private Esfera esfera;

    @BeforeEach
    void setUp() {
        esfera = new Esfera(2);
    }

    @Test
    void testGetVolumen() {
        assertEquals(
                (4.0 / 3.0) * Math.PI * Math.pow(2, 3),
                esfera.getVolumen(),
                0.01);
    }

    @Test
    void testGetSuperficie() {
        assertEquals(
                4 * Math.PI * Math.pow(2, 2),
                esfera.getSuperficie(),
                0.01);
    }
}