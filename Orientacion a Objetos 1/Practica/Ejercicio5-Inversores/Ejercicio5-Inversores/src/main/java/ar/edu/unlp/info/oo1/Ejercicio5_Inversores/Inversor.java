package ar.edu.unlp.info.oo1.Ejercicio5_Inversores;

import java.util.ArrayList;

public class Inversor {
	private double valorActual;
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

    public double valorActual() {
        return this.inversiones.stream()
                .mapToDouble(Inversion::getValorActual)
                .sum();
    }
}
