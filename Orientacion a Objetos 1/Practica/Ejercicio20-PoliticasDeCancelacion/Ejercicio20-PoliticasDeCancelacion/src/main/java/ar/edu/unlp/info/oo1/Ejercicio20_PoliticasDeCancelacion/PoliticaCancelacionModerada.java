package ar.edu.unlp.info.oo1.Ejercicio20_PoliticasDeCancelacion;

public class PoliticaCancelacionModerada {
	public double reembolso(Reserva reserva) {
		if(reserva.cantDias() >= 7) {
			return reserva.costo();
		}
		if(reserva.cantDias() > 2) {
			return reserva.costo() * 0.5;
		}
		return 0;
	}
}
