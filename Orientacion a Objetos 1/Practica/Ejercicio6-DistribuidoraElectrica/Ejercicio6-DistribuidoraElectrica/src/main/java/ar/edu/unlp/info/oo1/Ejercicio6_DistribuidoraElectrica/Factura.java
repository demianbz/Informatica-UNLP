package ar.edu.unlp.info.oo1.Ejercicio6_DistribuidoraElectrica;

import java.time.LocalDate;

public class Factura {
	 private Usuario usuario;
	    private LocalDate fechaEmision;
	    private CuadroTarifario cuadroTarifario;

	    public Factura(Usuario usuario,
	                   CuadroTarifario cuadroTarifario) {

	        this.usuario = usuario;
	        this.cuadroTarifario = cuadroTarifario;
	        this.fechaEmision = LocalDate.now();
	    }

	    public double costoConsumo() {
	        return usuario.ultimoConsumo().getEnergiaActiva()
	                * cuadroTarifario.getPrecioKWh();
	    }

	    public double bonificacion() {

	        if (usuario.ultimoConsumo()
	                .factorPotenciaEstimado() > 0.8) {

	            return costoConsumo() * 0.10;
	        }

	        return 0;
	    }

	    public double montoFinal() {
	        return costoConsumo() - bonificacion();
	    }
}
