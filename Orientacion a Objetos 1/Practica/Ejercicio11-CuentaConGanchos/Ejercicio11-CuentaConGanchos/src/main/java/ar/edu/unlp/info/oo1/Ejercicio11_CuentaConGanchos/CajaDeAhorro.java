package ar.edu.unlp.info.oo1.Ejercicio11_CuentaConGanchos;

public class CajaDeAhorro extends Cuenta{

	public boolean puedeExtraer(double monto) {
		if(this.getSaldo() >= monto * 1.02 ) {
			return true;
		}
		return false;
	}
	
	protected void extraerSinControlar(double monto) {
		super.extraerSinControlar(monto*1.02);
	}
	
	public void depositar(double monto) {
		super.depositar(monto*0.98);
	}
}

