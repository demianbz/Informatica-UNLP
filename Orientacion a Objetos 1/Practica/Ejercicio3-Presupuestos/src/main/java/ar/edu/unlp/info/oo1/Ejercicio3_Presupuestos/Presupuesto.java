package ar.edu.unlp.info.oo1.Ejercicio3_Presupuestos;

import java.time.LocalDate;
import java.util.ArrayList;

public class Presupuesto {
	private LocalDate fecha;
	private String cliente;
	private ArrayList<Item> items;
	
	public Presupuesto(String cliente) {
		this.cliente = cliente;
		this.fecha = LocalDate.now();
		this.items = new ArrayList<>();
	}
	
	
	public void agregarItem(Item item) {
		items.add(item);
	}
	
	public double calcularTotal() {
		double total=0;
		for(Item i : this.items) {
			total += i.costo();
		}
		return total;
	}
	
	
	
    public LocalDate getFecha() {
        return fecha;
    }

    public String getCliente() {
        return cliente;
    }
}
