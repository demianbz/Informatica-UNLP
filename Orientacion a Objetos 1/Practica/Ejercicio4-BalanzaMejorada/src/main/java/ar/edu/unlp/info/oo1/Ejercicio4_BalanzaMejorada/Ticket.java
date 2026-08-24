package ar.edu.unlp.info.oo1.Ejercicio4_BalanzaMejorada;

import java.time.LocalDate;
import java.util.ArrayList;

public class Ticket {
	private LocalDate fecha;
	private ArrayList<Producto> productos;
	private double pesoTotal;
	private double precioTotal;
	
	
	public Ticket (LocalDate fecha, ArrayList<Producto> productos, double pesoTotal) {
		this.fecha = fecha;
		this.productos = new ArrayList<Producto>(productos);
		this.pesoTotal = pesoTotal;
	}
	
	
	public ArrayList<Producto> getProductos(){
		return this.productos;
	}
	
	public double impuesto() {
		return (this.precioTotal*0.21);
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public int getCantidadDeProductos() {
		return this.productos.size();
	}


	public double getPesoTotal() {
		return pesoTotal;
	}



	public double getPrecioTotal() {
		return this.productos.stream()
				.mapToDouble(Producto::getPrecio).sum();
	}


	
}
	
	
	
	
	

