package parcial2;

public class ConsumidorFinal {
    private int cuil;
    private String nombre;
    
    public ConsumidorFinal(int unCuil , String unNombre){
        cuil = unCuil;
        nombre = unNombre;
    }

    public int getCuil() {
        return cuil;
    }

    public void setCuil(int cuil) {
        this.cuil = cuil;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
