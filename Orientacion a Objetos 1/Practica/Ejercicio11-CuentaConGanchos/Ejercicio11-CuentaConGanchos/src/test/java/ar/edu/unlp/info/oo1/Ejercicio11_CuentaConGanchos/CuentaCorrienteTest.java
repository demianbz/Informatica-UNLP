package ar.edu.unlp.info.oo1.Ejercicio11_CuentaConGanchos;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CuentaCorrienteTest {

	private CuentaCorriente cuenta;
	
	@BeforeEach
	void setUp() {
		cuenta = new CuentaCorriente();
	}
	
	//Verifica que una cuenta corriente recien creada tenga limite de descubierto igual a 0
	@Test
	void testCuentaCNuevaTieneDescubiertoCero() {
		assertEquals(0,cuenta.getLimiteDeDescubierto());
	}
	
	//Verifica que pueda realizar una extraccion cuando posee saldo suficiente
	@Test
	void testPuedeExtrearConSaldoSuficiente() {
		cuenta.depositar(1000);
		assertTrue(cuenta.extraer(500));
	}
	
	//Verifica que pueda extraer utilizando parte del limite de descubierto permitido
	@Test
	void testPuedeExtraerUsandoDescubierto() {
		cuenta.depositar(1000);
		cuenta.setLimiteDeDescubierto(500);
		
		assertTrue(cuenta.extraer(1200));
	}
	
	
	//Verifica que no pueda extraer cuando el monto supera el saldo + limite
	@Test
	void testNoPuedeExtraerSuperandoDescubierto() {
		cuenta.depositar(1000);
		cuenta.setLimiteDeDescubierto(500);
		
		assertFalse(cuenta.extraer(1600));
	}
	
}
