package ar.edu.unlp.info.oo1.Ejercicio19_AlquilerDePropiedades;

import java.util.ArrayList;

public class Propiedad {
	private String direccion;
	private String nombre;
	private double precioPorNoche;
	private Usuario propietario;
	private ArrayList<Reserva> reservas;
	
	public Propiedad(String direccion, String nombre, double precioPorNoche) {
		this.direccion = direccion;
		this.nombre = nombre;
		this.precioPorNoche = precioPorNoche;
		this.reservas = new ArrayList<>();
	}
	
	public boolean estaDisponible(DateLapse periodo) {
		return this.reservas.stream().noneMatch(reserva -> reserva.seSuperpone(periodo));
	}
	
	public Reserva crearReserva(Usuario usuario, DateLapse periodo) {
		if(this.estaDisponible(periodo)) {
			Reserva reserva = new Reserva(periodo, this, usuario);
			this.reservas.add(reserva);
			usuario.agregarReserva(reserva);
			return reserva;
		}
		return null;
	}
	

	public void cancelarReserva(Reserva reserva) {
		if (!reserva.estaEnCurso()) {
			this.reservas.remove(reserva);
		}
	}

	public double montoTotal(DateLapse periodo) {
		return this.reservas.stream()
				.filter(reserva -> reserva.seSuperpone(periodo))
				.mapToDouble(Reserva::costo).sum();
	}
	
	
	public double getPrecioPorNoche() {
		return this.precioPorNoche;
	}
	
}
