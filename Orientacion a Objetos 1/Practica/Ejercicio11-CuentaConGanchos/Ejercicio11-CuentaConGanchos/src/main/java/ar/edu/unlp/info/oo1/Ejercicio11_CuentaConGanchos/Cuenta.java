package ar.edu.unlp.info.oo1.Ejercicio11_CuentaConGanchos;

public abstract class Cuenta {
	private double saldo;
	
	public Cuenta() {
		this.saldo = 0;
	}
	public double getSaldo() {
		return this.saldo;
	}
	public void depositar(double monto) {
		this.saldo += monto;
	}
	public boolean extraer(double monto) {
		if(this.puedeExtraer(monto)) {
			this.extraerSinControlar(monto);
			return true;
		}
		return false;
	}
	protected void extraerSinControlar(double monto) {
		this.saldo -= monto;
	}
	public boolean transferirACuenta(double monto, Cuenta cuentaDestino) {
		if(this.puedeExtraer(monto)) {
			this.extraerSinControlar(monto);
			cuentaDestino.depositar(monto);
			return true;
		}
		return false;
	}
	abstract public boolean puedeExtraer(double monto);
}

