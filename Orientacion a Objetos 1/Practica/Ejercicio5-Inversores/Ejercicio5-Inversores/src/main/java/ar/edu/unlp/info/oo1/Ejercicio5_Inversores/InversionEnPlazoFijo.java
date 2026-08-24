package ar.edu.unlp.info.oo1.Ejercicio5_Inversores;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class InversionEnPlazoFijo extends Inversion{
    private LocalDate fechaConstitucion;
    private double montoDepositado;
    private double porcentajeInteres;
    
    public InversionEnPlazoFijo(LocalDate fechaConstitucion,double montoDepositado,double porcentajeInteres) {
    	this.fechaConstitucion = fechaConstitucion;
    	this.montoDepositado = montoDepositado;
    	this.porcentajeInteres = porcentajeInteres;
    }
    
    public long calcularInteresesDiarios() {
    	return ChronoUnit.DAYS.between(this.fechaConstitucion,LocalDate.now());

    }
    
    public double calcularValor() {
    	
    	return this.montoDepositado + this.calcularInteresesDiarios();
    }
    

}
