package ar.edu.unlp.info.oo1.Ejercicio11_CuentaConGanchos;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CuentaTest {
	private CajaDeAhorro caja;
	private CuentaCorriente corriente;
	
	@BeforeEach
	void setUp() {
		caja = new CajaDeAhorro();
		corriente = new CuentaCorriente();
	}
	
	
	//Verifica que una caja de ahorro pueda transferir dinero a una cuenta corriente
	@Test
	void testTransferenciaCajaACorriente() {
		caja.depositar(3000);
		
		assertTrue(caja.transferirACuenta(1000, corriente));
	}
	
	
	//Verifica que una cuenta corriente pueda transferir dinero a una caja de ahorro
	@Test
	void testTransferenciaCorrienteACaja() {
		corriente.depositar(3000);
		
		assertTrue(corriente.transferirACuenta(1000, caja));
	}

	//Verifica que una transferencia modifique correctamente los saldos involucrados
	@Test
	void testTrasferenciaActualizaSaldos() {
		corriente.depositar(3000);
		corriente.transferirACuenta(1000, caja);
		
		assertEquals(2000, corriente.getSaldo(), 0.01);
	}

}
