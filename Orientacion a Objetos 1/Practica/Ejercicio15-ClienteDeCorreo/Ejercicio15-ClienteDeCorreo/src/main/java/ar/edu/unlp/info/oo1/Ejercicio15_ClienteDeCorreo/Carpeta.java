package ar.edu.unlp.info.oo1.Ejercicio15_ClienteDeCorreo;

import java.util.ArrayList;

public class Carpeta {
	private ArrayList<Email> emails;
	private String nombre;
	
	public Carpeta () {
		this.emails = new ArrayList<>();
	}
	
	public Carpeta(ArrayList<Email> emails, String nombre) {
		this.emails = emails;
		this.nombre = nombre;
	}
	
	
	public String getNombre() {
		return this.nombre;
	}
	
	//Mueve el email desde una carpeta de origen a una carpeta destino (se asume que el email esta en la carpeta origen)
	public void mover(Email email , Carpeta destino) {
		this.emails.remove(email);
		destino.agregarEmail(email);
	}
	
	public void agregarEmail(Email email) {
		this.emails.add(email);
	}
	
	
	public Email buscar(String texto) {
		return this.emails.stream()
				.filter(email -> email.cumple(texto))
				.findFirst().orElse(null);
	}
	
	public int tamaño() {
		return this.emails.stream()
				.mapToInt(email -> email.tamaño()).sum();
	}
	
	
}
