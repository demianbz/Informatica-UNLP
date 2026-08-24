package ar.edu.unlp.info.oo1.Ejercicio11_CuentaConGanchos;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CajaDeAhorroTest {
	private CajaDeAhorro caja;
	
	@BeforeEach
	void setUp() {
		caja = new CajaDeAhorro();
	}

	
	//Verifica que al depositar se descuente la comision del 2%
	@Test
	void testDepositarDescuentaComision() {
		caja.depositar(1000);
		
		assertEquals(980, caja.getSaldo(), 0.01);
	}
	
	//Verifica que pueda extraer cuando el saldo alcanza para cubrir monto + comision
	@Test
	void testPuedeExtraerConFondosSuficientes() {
		caja.depositar(2000);
		
		assertTrue(caja.extraer(1000));
	}
	
	//Verifica que no pueda extraer cuando el saldo no alcanza para cubrir monto + comision.
	@Test
	void testNoPuedeExtrearSinFondosSuficientes() {
		caja.depositar(1000);
		
		assertFalse(caja.extraer(1000));
	}
	
	
	//Verifica que la extraccion descuente el monto solicitado mas el 2% de comision
	@Test
	void testExtraerDescuentaComision() {
		caja.depositar(2040 / 0.98);
		caja.extraer(1000);
		
		assertEquals(1020, caja.getSaldo(), 0.01);
	}
	
}
