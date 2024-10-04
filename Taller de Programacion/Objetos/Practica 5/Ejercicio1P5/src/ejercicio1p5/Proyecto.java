package ejercicio1p5;

public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private int cantInv;
    private Investigador [] investigador;
    

    public Proyecto (String unNombre , int unCodigo , String unDirector){
        nombre = unNombre;
        codigo = unCodigo;
        director = unDirector;
        cantInv = 0;
        investigador = new Investigador [50];
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if(cantInv < 50){
            investigador[cantInv] = unInvestigador;
            cantInv++;
        }
    }

    public double dineroTotalOtorgado(){   //devolver el monto total otorgado en subsidios del proyecto 
        double aux=0;                        //(tener en cuenta todos los subsidios otorgados de todos los investigadores)
        for (int i=0 ; i<cantInv ; i++){
            aux = aux + investigador[i].obtenerDinero();
        }
        return aux;
    }

    public void otorgarTodos(String unNombre){ //otorgar todos los subsidios no-otorgados del investigador llamado nombre_completo
        int i=0;
        Investigador invAux;
        while(!investigador[i].getNombre().equals(unNombre) && i<cantInv ){
            i++;
        }
        if(investigador[i].getNombre().equals(unNombre)){
            invAux = investigador[i];
            investigador[i].otorgarTodosLosSubsidios();
        }    
    }    
    
    public int getCantInv(){
        return cantInv;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }
    
    @Override
    public String toString(){
        String aux = " ";
        aux = "Nombre: " + getNombre() +" Codigo: "+ getCodigo() +" Director: "+ getDirector() +" Dinero Total: "+ dineroTotalOtorgado() +"\n";
        for (int i=0 ; i<cantInv ; i++)
            aux = aux + this.investigador[i].toString();
        return aux;
    }
    
}
