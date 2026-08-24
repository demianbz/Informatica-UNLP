package ar.edu.unlp.info.oo1.Ejercicio21_ServicioDeEnviosDePaquetes;

public class ClienteCorporativo extends Cliente{
	private String empresa;
	private String cuit;
	
	public ClienteCorporativo(String direccion , String empresa , String cuit) {
		super(direccion);
		this.empresa = empresa;
		this.cuit = cuit;
	}	
	
	public double descuento() {
		return 1;
	}


}
