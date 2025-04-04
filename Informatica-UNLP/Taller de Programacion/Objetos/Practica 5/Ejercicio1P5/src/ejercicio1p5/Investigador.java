
package ejercicio1p5;

public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private int cantSubsidio;
    private Subsidio [] subsidio ;

    public Investigador (String unNombre , int unaCategoria , String unaEspecialidad){
        nombre = unNombre;
        categoria = unaCategoria;
        especialidad = unaEspecialidad;
        subsidio = new Subsidio [5];
        cantSubsidio = 0;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if(cantSubsidio<5){
            subsidio[cantSubsidio] = unSubsidio;
            cantSubsidio++;
        }
    }
    
    public double obtenerDinero(){
        double aux=0;
        for(int i=0 ; i<this.cantSubsidio ; i++){
            aux = aux + this.subsidio[i].getMonto();
        }
        return aux;
    }
    
    public void otorgarTodosLosSubsidios(){
        for(int i=0 ; i<5 ; i++){
            if(this.subsidio[i].isOtorgado() == false)
                this.subsidio[i].setOtorgado(true);
        }
    }
    
    public int getCantSubsidio(){
        return cantSubsidio;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    @Override
    public String toString(){
        String aux;
        double cant = 0;
        aux = "Nombre: "+ getNombre() +" Categoria: "+ getCategoria() +" Especialidad: "+ getEspecialidad();
        for (int i=0 ; i<cantSubsidio ; i++)
            cant = cant + subsidio[i].getMonto();
        aux = aux +" Total de dinero de subsidios: "+ cant +"\n";
        return aux;
    }
    
}
