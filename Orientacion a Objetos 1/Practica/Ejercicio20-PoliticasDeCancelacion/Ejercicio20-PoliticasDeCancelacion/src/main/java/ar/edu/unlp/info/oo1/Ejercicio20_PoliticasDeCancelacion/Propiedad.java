package ar.edu.unlp.info.oo1.Ejercicio20_PoliticasDeCancelacion;

import java.util.ArrayList;

public class Propiedad {
	private String direccion;
	private String nombre;
	private double precioPorNoche;
	private Usuario propietario;
	private ArrayList<Reserva> reservas;
	private PoliticaCancelacion politica;
	
	public Propiedad(String direccion, String nombre, double precioPorNoche, PoliticaCancelacion politica) {
		this.direccion = direccion;
		this.nombre = nombre;
		this.precioPorNoche = precioPorNoche;
		this.reservas = new ArrayList<>();
		this.politica = politica;
	}
	
	public void setPolitica(PoliticaCancelacion politica) {
		this.politica = politica;
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
	

	public double cancelarReserva(Reserva reserva) {
		if (!reserva.estaEnCurso()) {
			double monto = this.politica.reembolso(reserva);
			this.reservas.remove(reserva);
			return monto;
		}
		return 0;
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
