package ar.edu.unlp.info.oo1.Ejercicio19_AlquilerDePropiedades;

import java.util.ArrayList;

public class Usuario {
	private String nombre;
	private String direccion;
	private int dni;
	private ArrayList<Reserva> reservas;
	private ArrayList<Propiedad> propiedades;
	
	public Usuario() {
		this.reservas = new ArrayList<Reserva>();
		this.propiedades = new ArrayList<Propiedad>();
	}
	
	public Usuario(String nombre, String direccion, int dni, ArrayList<Reserva> reservas, ArrayList<Propiedad> propiedades) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.dni = dni;
		this.reservas = reservas;
		this.propiedades = propiedades;
	}
	
	public void cancelarReserva(Reserva reserva) {
		this.reservas.remove(reserva);
	}
	
	public double calcularIngreso(DateLapse periodo) {
		return this.propiedades.stream()
		.mapToDouble(propiedad -> propiedad.montoTotal(periodo)).sum() * 0.75;
	}
	
	public void agregarReserva(Reserva reserva) {
		this.reservas.add(reserva);
	}
	
	
}
