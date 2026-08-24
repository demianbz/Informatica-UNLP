package ar.edu.unlp.info.oo1.Ejercicio13_ImplementarInversores;

import java.util.ArrayList;

public class Inversor {
	private ArrayList<Inversion> inversiones;
	
    public Inversor() {
        this.inversiones = new ArrayList<>();
    }
    

    public void agregarInversion(Inversion inversion) {
        this.inversiones.add(inversion);
    }

    public void eliminarInversion(Inversion inversion) {
        this.inversiones.remove(inversion);
    }
    
    public ArrayList<Inversion> getInversiones(){
    	return this.inversiones;
    }

   
    
    public double getMontoTotal() { 	
    	return this.inversiones.stream()
    			.mapToDouble(Inversion::getValorActual).sum();
    	/*
    	 Haciendo For Each
    	 double total = 0;
    	 for(Inversion inversion : inversiones){
    	 	total += inversion.getValorActual();
    	 }
    	 */
    }
}
