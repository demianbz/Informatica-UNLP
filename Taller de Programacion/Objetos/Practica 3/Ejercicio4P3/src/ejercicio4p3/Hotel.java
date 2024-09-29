package ejercicio4p3;

public class Hotel {
    
    private Habitacion [] habitacion;
    private int dimL;
    private int dimF;
    
    public Hotel (){
        habitacion = new Habitacion[dimF];
        dimL = 0;
    }
    
    public Hotel (int N){
        habitacion = new Habitacion[N];
        dimL = 0;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }
    
    public boolean estadoHabitacion(){
        return habitacion[dimL].isOcupada();
    }
    
    public void ingresarCliente(int X ,Persona unCliente){
        habitacion[X] = new Habitacion(unCliente);
        dimL++;

    }
    
    public void aumentarPrecio (int unCosto){
        int i;
        for (i=0 ; i<dimL ; i++){
            int costoActual = habitacion[i].getCosto();
            habitacion[i].setCosto(costoActual+unCosto);    
        }
    }

    @Override
    public String toString() {
        if(dimL>0){
            for (int i=0 ; i<=dimL ; i++){
                return "Habitacion: " + (i+1) + " Costo, $" + habitacion[i].getCosto() +" "+ habitacion[i].toString() +'}';
            }
        }
        else
            return null;
        return null;
    }
    
    
    
}
