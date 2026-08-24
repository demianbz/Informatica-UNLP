package ar.edu.unlp.info.oo1.Ejercicio15_ClienteDeCorreo;

import java.util.ArrayList;

public class Email {
	private String titulo;
	private String cuerpo;
	private ArrayList<Archivo> adjuntos;
	
	public Email() {
		
	}
	
	public Email(String titulo, String cuerpo, ArrayList<Archivo> adjuntos) {
		this.titulo = titulo;
		this.cuerpo = cuerpo;
		this.adjuntos = adjuntos;
	}
	
	public String getTitulo() {
		return this.titulo;
	}
	
	public String getCuerpo() {
		return this.cuerpo;
	}
	
	public ArrayList<Archivo> adjuntos(){
		return this.adjuntos;
	}
	
	public int tamaño() {
		int tamañoAdjuntos = this.adjuntos.stream().mapToInt(adjunto -> adjunto.tamaño()).sum();
		return getTitulo().length() + getCuerpo().length() + tamañoAdjuntos;
	}
	
	public boolean cumple(String texto) {
		return this.titulo.contains(texto) || this.cuerpo.contains(texto);
	}
	
}
