package ar.edu.unlp.info.oo1.Ejercicio4_BalanzaMejorada;

import java.time.LocalDate;
import java.util.ArrayList;

public class Balanza {
	private double precioTotal;
	private double pesoTotal;
	public ArrayList<Producto> productos;
	
	public Balanza() {
		
	}
	
	public Balanza(double precioTotal, double pesoTotal) {
		this.precioTotal = precioTotal;
		this.pesoTotal = pesoTotal;
		this.productos = new ArrayList<Producto>();
	}
	
	
	public void ponerEnCero() {
		this.pesoTotal = 0;
		this.precioTotal = 0;
		this.productos.clear();
	}
	
	public void agregarProducto(Producto producto) {
		this.productos.add(producto);
	}

	public double getPesoTotal() {
		return this.pesoTotal;
	}
	
	public double getPrecioTotal() {
		return this.precioTotal;
	}
	
	public int getCantidadDeProductos() {
		return this.productos.size();
	}
	
	public ArrayList<Producto> getProductos(){
		return this.productos;
	}


	
	public Ticket emitirTicket() {
		return new Ticket(LocalDate.now(), this.productos , this.getPesoTotal());
	}
	
	
}
