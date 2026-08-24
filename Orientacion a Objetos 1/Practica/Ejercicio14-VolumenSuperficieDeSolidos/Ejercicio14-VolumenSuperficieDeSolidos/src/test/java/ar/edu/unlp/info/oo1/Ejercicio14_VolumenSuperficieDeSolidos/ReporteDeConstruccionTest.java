package ar.edu.unlp.info.oo1.Ejercicio14_VolumenSuperficieDeSolidos;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ReporteDeConstruccionTest {

    private ReporteDeConstruccion reporte;

    @BeforeEach
    void setUp() {

        reporte = new ReporteDeConstruccion();

        Cilindro cilindro = new Cilindro(10, 2);
        cilindro.setMaterial("Hierro");
        cilindro.setColor("Rojo");

        Esfera esfera = new Esfera(2);
        esfera.setMaterial("Hierro");
        esfera.setColor("Azul");

        PrismaRectangular prisma =
                new PrismaRectangular(10, 5, 2);
        prisma.setMaterial("Madera");
        prisma.setColor("Rojo");

        reporte.agregarPieza(cilindro);
        reporte.agregarPieza(esfera);
        reporte.agregarPieza(prisma);
    }

    @Test
    void testVolumenDeMaterial() {

        double esperado =
                new Cilindro(10, 2).getVolumen()
                + new Esfera(2).getVolumen();

        assertEquals(
                esperado,
                reporte.volumenDeMaterial("Hierro"),
                0.01);
    }

    @Test
    void testSuperficieDeColor() {

        double esperado =
                new Cilindro(10, 2).getSuperficie()
                + new PrismaRectangular(10, 5, 2).getSuperficie();

        assertEquals(
                esperado,
                reporte.superficieDeColor("Rojo"),
                0.01);
    }

    @Test
    void testVolumenMaterialInexistente() {

        assertEquals(
                0,
                reporte.volumenDeMaterial("Plastico"),
                0.01);
    }

    @Test
    void testSuperficieColorInexistente() {

        assertEquals(
                0,
                reporte.superficieDeColor("Verde"),
                0.01);
    }
}
