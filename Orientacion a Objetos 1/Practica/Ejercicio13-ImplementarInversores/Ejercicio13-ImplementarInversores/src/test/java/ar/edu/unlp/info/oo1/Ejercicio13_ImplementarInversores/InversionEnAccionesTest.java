package ar.edu.unlp.info.oo1.Ejercicio13_ImplementarInversores;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class InversionEnAccionesTest {

    private InversionEnAcciones inversion;

    @BeforeEach
    void setUp() {
        inversion = new InversionEnAcciones(
                10,
                new Accion("YPF", 100));
    }

    // Valor de borde: 0 acciones
    @Test
    void testCalcularValorConCeroAcciones() {

        InversionEnAcciones inversionSinAcciones =
                new InversionEnAcciones(
                        0,
                        new Accion("YPF", 100));

        assertEquals(0,
                inversionSinAcciones.calcularValor(),
                0.01);
    }

    // Partición válida
    @Test
    void testCalcularValor() {

        assertEquals(1000,
                inversion.calcularValor(),
                0.01);
    }
}