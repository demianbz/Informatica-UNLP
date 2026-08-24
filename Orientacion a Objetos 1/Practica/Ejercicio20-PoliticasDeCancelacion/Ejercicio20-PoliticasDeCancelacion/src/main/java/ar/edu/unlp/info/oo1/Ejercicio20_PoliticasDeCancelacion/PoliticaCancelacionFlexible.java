package ar.edu.unlp.info.oo1.Ejercicio20_PoliticasDeCancelacion;

public class PoliticaCancelacionFlexible implements PoliticaCancelacion {
	public double reembolso(Reserva reserva) {
		return reserva.costo();
	}
}
