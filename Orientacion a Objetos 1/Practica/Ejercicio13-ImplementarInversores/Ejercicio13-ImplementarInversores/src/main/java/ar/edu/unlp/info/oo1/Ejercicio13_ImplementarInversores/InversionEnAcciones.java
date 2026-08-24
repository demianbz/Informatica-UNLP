package ar.edu.unlp.info.oo1.Ejercicio13_ImplementarInversores;

public class InversionEnAcciones extends Inversion{
	private int cantidadAcciones;
	private Accion accion;
	

    public InversionEnAcciones(int cantidad, Accion accion) {
        this.cantidadAcciones = cantidad;
        this.accion = accion;
    }
    
    public double calcularValor() {
    	return this.accion.getValorUnitario() * this.cantidadAcciones;
    }
    
}
