package ar.edu.unlp.info.oo1.Ejercicio14_VolumenSuperficieDeSolidos;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class PrismaRectangularTest {

    private PrismaRectangular prisma;

    @BeforeEach
    void setUp() {
        prisma = new PrismaRectangular(10, 5, 2);
    }

    @Test
    void testGetVolumen() {
        assertEquals(
                10 * 5 * 2,
                prisma.getVolumen(),
                0.01);
    }

    @Test
    void testGetSuperficie() {
        assertEquals(
                2 * ((10 * 5) + (10 * 2) + (5 * 2)),
                prisma.getSuperficie(),
                0.01);
    }
}