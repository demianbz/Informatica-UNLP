package ejercicio3p4;

public class Trabajador extends Persona {
    
    private String tareaRealizada;
    
    
    public Trabajador (String unNombre, int unDni, int unaEdad, String unaTareaRealizada){
        super(unNombre, unDni, unaEdad);
        setTareaRealizada(unaTareaRealizada);
    }

            
    public String getTareaRealizada() {
        return tareaRealizada;
    }

    public void setTareaRealizada(String unaTareaRealizada) {
        tareaRealizada = unaTareaRealizada;
    }
    
    public String toString(){
        String aux;
        aux = super.toString()+ " Soy "+ getTareaRealizada();
        return aux;
    }
    
    

}
