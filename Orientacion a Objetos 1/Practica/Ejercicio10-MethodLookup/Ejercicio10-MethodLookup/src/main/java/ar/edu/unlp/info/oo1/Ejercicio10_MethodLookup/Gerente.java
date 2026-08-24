package ar.edu.unlp.info.oo1.Ejercicio10_MethodLookup;

public class Gerente extends EmpleadoJerarquico{
	public double aportes() {
		return this.montoBasico()*0.05d;
	}
	
	public double montoBasico() {
		return 57000;
	}
}


