package ar.edu.unlp.info.oo1.Ejercicio13_ImplementarInversores;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class InversionEnPlazoFijoTest {

    private InversionEnPlazoFijo inversion;

    @BeforeEach
    void setUp() {
        inversion = new InversionEnPlazoFijo(
                LocalDate.now().minusDays(10),
                1000,
                0.01);
    }

    // Valor de borde: 0 días transcurridos
    @Test
    void testCalcularValorMismoDia() {

        InversionEnPlazoFijo inversionMismoDia =
                new InversionEnPlazoFijo(
                        LocalDate.now(),
                        1000,
                        0.01);

        assertEquals(1000,
                inversionMismoDia.calcularValor(),
                0.01);
    }

    // Partición válida: 10 días transcurridos
    @Test
    void testCalcularValorConIntereses() {

        assertEquals(1100,
                inversion.calcularValor(),
                0.01);
    }
}
