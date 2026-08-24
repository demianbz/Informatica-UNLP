package ar.edu.unlp.info.oo1.Ejercicio5_Inversores;

public class Accion {

    private String nombre;
    private double valorUnitario;

    public Accion(String nombre, double valorUnitario) {
        this.nombre = nombre;
        this.valorUnitario = valorUnitario;
    }

    public String getNombre() {
        return nombre;
    }

    public double getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(double valorUnitario) {
        this.valorUnitario = valorUnitario;
    }
}