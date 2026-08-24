package ar.edu.unlp.info.oo1.Ejercicio9_RedDeAlumbrado;

import java.util.ArrayList;

public class Farola {
	private boolean encendida;
	private ArrayList<Farola> vecinos;
	
	public Farola() {
		this.encendida=false;
		this.vecinos = new ArrayList<Farola>();
	}
	
	/* 
	* Crea la relación de vecinos entre las farolas. La relación de vecinos 
	entre las farolas es recíproca, es decir el receptor del mensaje será vecino 
	de otraFarola, al igual que otraFarola también se convertirá en vecina del 
	receptor del mensaje 
	*/ 
	public void pairWithNeighbor(Farola otraFarola) {
		if(!this.vecinos.contains(otraFarola)) {	
			this.vecinos.add(otraFarola);
		}
		
		if(!otraFarola.vecinos.contains(this)) {
			otraFarola.vecinos.add(this);
		}
	}
	/* 
	* Retorna sus farolas vecinas 
	*/ 
	public ArrayList<Farola> getNeighbors(){
		return this.vecinos;
	}
	/* 
	* Si la farola no está encendida, la enciende y propaga la acción. 
	*/ 
	public void turnOn() {
		if(this.isOff()) {
			this.encendida = true;
			for(Farola vecino : vecinos) {
				vecino.turnOn();
			}
		}
	}
	/* 
	* Si la farola no está apagada, la apaga y propaga la acción. 
	*/ 
	public void turnOff() {
		if(this.isOn()) {
			this.encendida = false;
			for(Farola vecino : vecinos) {
				vecino.turnOff();
			}
		}
	}
	/* 
	* Retorna true si la farola está encendida. 
	*/ 
	public boolean isOn(){
		return this.encendida;
	}
	/* 
	* Retorna true si la farola está apagada. 
	*/ 
	public boolean isOff(){
		return !this.encendida;
	}
}
