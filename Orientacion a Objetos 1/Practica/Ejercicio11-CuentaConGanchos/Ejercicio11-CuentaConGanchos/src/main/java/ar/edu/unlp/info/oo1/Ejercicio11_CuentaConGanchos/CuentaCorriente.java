package ar.edu.unlp.info.oo1.Ejercicio11_CuentaConGanchos;

public class CuentaCorriente extends Cuenta{
	private double limiteDeDescubierto;
	
	public CuentaCorriente() {
		this.limiteDeDescubierto = 0;
	}
	
	public double getLimiteDeDescubierto() {
		return this.limiteDeDescubierto;
	}
	
	public void setLimiteDeDescubierto(double limiteDeDescubierto) {
		this.limiteDeDescubierto = limiteDeDescubierto;
	}

	
	public boolean puedeExtraer(double monto) {
		if(this.getSaldo() + this.getLimiteDeDescubierto() >= monto) {
			return true;
		}
		return false;
	}
	
	
}
