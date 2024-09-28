package ejercicio2p3;

/**
 *
 * @author alumnos
 */
public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    public Autor(){
        
    }
    
    public Autor(String unNombre , String unaBiografia , String unOrigen){
        nombre = unNombre;
        biografia = unaBiografia;
        origen = unOrigen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String unaBiografia) {
        biografia = unaBiografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String unOrigen) {
        origen = unOrigen;
    }

    
    
    @Override
    public String toString() {
        return "Nombre del Autor: "+ nombre +", Biografia: "+ biografia +", Origen: "+ origen +'}';
    }


    

}
