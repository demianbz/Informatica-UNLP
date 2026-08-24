package ar.edu.unlp.info.oo1.Ejercicio6_DistribuidoraElectrica;

public class Consumo {

private double energiaActiva;
private double energiaReactiva;

public Consumo(double energiaActiva, double energiaReactiva) {
    this.energiaActiva = energiaActiva;
    this.energiaReactiva = energiaReactiva;
}

public double getEnergiaActiva() {
    return energiaActiva;
}

public double getEnergiaReactiva() {
    return energiaReactiva;
}

public double factorPotenciaEstimado() {
    double total = energiaActiva + energiaReactiva;

    if (total == 0) {
        return 0;
    }

    return energiaActiva / total;
}
}