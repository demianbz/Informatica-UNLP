package ejercicio4p3;
    import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    

    
    private int costo = GeneradorAleatorio.generarInt(6000)+2000;
    private boolean ocupada = false;
    private Persona cliente = null;
    
    public Habitacion (Persona unCliente){
        cliente = unCliente;
        ocupada = true;
    }
    
    
    public int getCosto() {
        return costo;
    }

    public void setCosto(int unCosto) {
        costo = unCosto;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
    
    public void ingresar (Persona C){
        cliente = C;
        ocupada = true;
    }

    @Override
    public String toString() {
        if(ocupada == true)
            return "Ocupada " + cliente.toString() + '}';
        else
            return "Libre"  + '}';
    }   
    
    
    
}
