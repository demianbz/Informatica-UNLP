package ar.edu.unlp.info.oo1.Ejercicio15_ClienteDeCorreo;

import java.util.ArrayList;

public class ClienteDeCorreo {
	private Carpeta inbox;
	private ArrayList<Carpeta> carpetas;
	
	public ClienteDeCorreo() {
		this.inbox = new Carpeta();
		this.carpetas = new ArrayList<>();
	}
	
	public ClienteDeCorreo(Carpeta inbox , ArrayList<Carpeta> carpetas) {
		this.inbox = inbox;
		this.carpetas = carpetas;
	}
	
	//Almacene en el inbox (una de las carpetas) el email que recibe como parametro
	public void recibir(Email email) {
		this.inbox.agregarEmail(email);
	}
	
	//Retorna el primer email en el Cliente de Correo cuyo titulo o cuerpo contienen en el texto indicado como parametro
	public Email buscar(String texto) {
		return this.carpetas.stream()
				.map(carpeta -> carpeta.buscar(texto))
				.filter(email -> email != null)
				.findFirst().orElse(null);
	}
	
	//Retorna la suma del espacio ocupado por todos los emails de todas las carpetas
	public int espacioOcupado(){
		return this.carpetas.stream()
				.mapToInt(carpeta -> carpeta.tamaño()).sum();
	}
	

	
}
