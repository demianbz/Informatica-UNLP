package ar.edu.unlp.info.oo1.Ejercicio2_BalanzaElectronica;

import java.time.LocalDate;
import java.util.ArrayList;

public class Balanza {
	private int cantidadDeProductos;
	private double precioTotal;
	private double pesoTotal;
	
	
	public void ponerEnCero() {
		this.cantidadDeProductos = 0;
		this.pesoTotal = 0;
		this.precioTotal = 0;
	}
	
	public void agregarProducto(Producto producto) {
		this.precioTotal += producto.getPrecio();
		this.cantidadDeProductos++;
		this.pesoTotal += producto.getPeso();
	}

	public double getPesoTotal() {
		return this.pesoTotal;
	}
	
	public double getPrecioTotal() {
		return this.precioTotal;
	}
	
	public int getCantidadDeProductos() {
		return this.cantidadDeProductos;
	}
	


	
	public Ticket emitirTicket() {
		return new Ticket(LocalDate.now(), this.getCantidadDeProductos(), this.getPesoTotal(), this.getPrecioTotal());
	}
	
	
}
