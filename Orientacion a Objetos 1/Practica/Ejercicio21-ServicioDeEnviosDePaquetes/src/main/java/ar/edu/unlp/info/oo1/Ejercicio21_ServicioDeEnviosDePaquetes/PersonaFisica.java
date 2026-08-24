package ar.edu.unlp.info.oo1.Ejercicio21_ServicioDeEnviosDePaquetes;

public class PersonaFisica extends Cliente {
	private String nombre;
	private int dni;
	
	public PersonaFisica(String direccion , String nombre , int dni) {
		super(direccion);
		this.nombre = nombre;
		this.dni = dni;
	}	
	
	public double descuento() {
		return 0.90;
	}


	
}
