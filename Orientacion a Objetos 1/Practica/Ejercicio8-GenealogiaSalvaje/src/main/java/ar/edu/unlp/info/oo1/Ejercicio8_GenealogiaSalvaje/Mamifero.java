package ar.edu.unlp.info.oo1.Ejercicio8_GenealogiaSalvaje;

import java.time.LocalDate;

public class Mamifero {
	private String identificador;
	private String especie;
	private LocalDate fechaNacimiento;
	private Mamifero padre;
	private Mamifero madre;
	
	public Mamifero() {
		
	}
	
	public Mamifero(String identificador) {
		this.identificador = identificador;
	}
	
	public Mamifero(String identificador, String especie, LocalDate fechaNacimiento) {
		this.identificador=identificador;
		this.especie = especie;
		this.fechaNacimiento = fechaNacimiento;
	}
	
	public String getIdentificador() {
		return this.identificador;
	}
	
	public void setIdentificador(String id) {
		this.identificador=id;
	}
	
	public String getEspecie() {
		return this.especie;
	}
	
	public void setEspecie(String especie) {
		this.especie=especie;
	}
	
	public LocalDate getFechaNacimiento() {
		return this.fechaNacimiento;
	}
	
	public void setFechaNacimiento(LocalDate fecha) {
		this.fechaNacimiento=fecha;
	}
	
	public Mamifero getPadre() {
		return this.padre;
	}
	
	public void setPadre(Mamifero padre) {
		this.padre = padre;
	}
	
	
	public Mamifero getMadre() {
		return this.madre;
	}
	
	public void setMadre(Mamifero madre) {
		this.madre = madre;
	}
	
	public Mamifero getAbueloMaterno() {
		if(this.madre != null) {
			return this.getMadre().getPadre();
		}
		else
			return null;
	}
	
	public Mamifero getAbuelaMaterna() {
		if(this.madre != null) {
			return this.getMadre().getMadre();
		}
		else
			return null;	
	}
	
	public Mamifero getAbueloPaterno() {
		if(this.padre != null) {
			return this.getPadre().getPadre();
		}
		else
			return null;
	}
	
	public Mamifero getAbuelaPaterna() {
		if(this.padre != null) {		
			return this.getPadre().getMadre();
		}
		else
			return null;	
	}
	
	public boolean tieneComoAncestroA(Mamifero unMamifero) {
		if(this.getPadre()==unMamifero) {
			return true;
		}
		
		if (this.getMadre()==unMamifero) {		
			return true;
		}
		
		if(getPadre() != null) {
			boolean esAncestro = getPadre().tieneComoAncestroA(unMamifero);
			if(!esAncestro) {
				if(getMadre() != null) {
				esAncestro = getMadre().tieneComoAncestroA(unMamifero);
				}
			}
			return esAncestro;	
		}
		
		if(getMadre() != null) {
			return getMadre().tieneComoAncestroA(unMamifero);
		}
		
		return false;
	}
	
	
}
