
package parcial3;

public class Goleador {
    private String nombre;
    private String equipo;
    private int goles;
    
    public Goleador (String unNombre , String unEquipo , int cantGoles){
        nombre = unNombre;
        equipo = unEquipo;
        goles = cantGoles;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = getNombre() +" "+ getEquipo() +" "+ getGoles() +" ";
        return aux;
    }
    
    
}
