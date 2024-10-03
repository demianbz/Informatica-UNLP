package ejercicio4p4;

public class Estacion {
    private String nombre;
    private double latitud;
    private double longitud;
    
    public Estacion (String unNombre, double unaLatitud, double unaLongitud){
        nombre = unNombre;
        latitud = unaLatitud;
        longitud = unaLongitud;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(int latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(int longitud) {
        this.longitud = longitud;
    }
    
    public String toString(){
        String aux;
        aux = getNombre() +" ("+ getLatitud() +"S - "+ getLongitud() +"O): \n";
        return aux;
    }
    
    
}
