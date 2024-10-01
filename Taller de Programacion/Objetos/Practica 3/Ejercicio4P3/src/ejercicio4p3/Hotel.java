package ejercicio4p3;

import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    
    private Habitacion [] habitacion;

    private int dimF;
    
  
    
    public Hotel (int N){
        habitacion = new Habitacion[N];
        dimF = N;
        for (int i=0; i<N;i++){
            int costo = GeneradorAleatorio.generarInt(6000)+2000;
            habitacion[i] = new Habitacion(costo);
        }
    }


    
    public void ingresarCliente(int X ,Persona unCliente){ //X=1..N
        habitacion[X].ocupar(unCliente); //voy a la X-1 porque mi vector va de 0..N-1 y X es 1..N
       
    }
    
    public void aumentarPrecio (int unCosto){
        int i;
        for (i=0 ; i<dimF ; i++){
           
            habitacion[i].aumentarCosto(unCosto);    
        }
    }

    @Override
    public String toString() {
        String aux="";
            for (int i=0 ; i<dimF ; i++){
               aux = aux + "Habitacion: " + (i+1) + habitacion[i].toString() + "\n";
            }
      
            return aux;

    }
    
    
    
}