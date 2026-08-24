package ar.edu.unlp.info.oo1.Ejercicio6_DistribuidoraElectrica;

public class CuadroTarifario {
    private double precioKWh;

    public CuadroTarifario(double precioKWh) {
        this.precioKWh = precioKWh;
    }

    public double getPrecioKWh() {
        return precioKWh;
    }

    public void setPrecioKWh(double precioKWh) {
        this.precioKWh = precioKWh;
    }
}
