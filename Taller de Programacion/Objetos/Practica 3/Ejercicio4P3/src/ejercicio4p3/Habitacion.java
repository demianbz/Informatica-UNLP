package ejercicio4p3;
    import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    

    
    private int costo;
    private boolean ocupada = false;
    private Persona cliente = null;
    
    public Habitacion (int unCosto){
        costo = unCosto;
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
    
    public void ocupar (Persona C){
        cliente = C;
        ocupada = true;
    }
    
    public void aumentarCosto(int unCosto){
        costo = costo + unCosto;
    }
    
    

    @Override
    public String toString() {       
        if(ocupada == true)
            return " $"+ getCosto() +" Ocupada " + cliente.toString() + '}';
        else
            return "Libre"  + '}';
    }   
    
    
    
}
