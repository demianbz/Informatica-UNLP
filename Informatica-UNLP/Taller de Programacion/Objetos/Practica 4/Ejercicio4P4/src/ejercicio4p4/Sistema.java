package ejercicio4p4;

public abstract class Sistema {
    private Estacion estacion;
    private int cantAnios;
    private int anioInicial;
    private double [][] matriz;
    
    //Creacion del Sistema
    public Sistema(int CantidadAnios , int elAnio , Estacion unaEstacion){
        estacion = unaEstacion;
        setCantAnios(CantidadAnios);
        setAnio(elAnio);
        matriz = new double [cantAnios][12];
        for(int i=0 ; i<cantAnios ; i++){   //for para los años
            for(int j=0 ; j<12 ; j++)
                matriz[i][j] = 999;         //Inicializo cada temperatura en un valor muy alto;
        }
    } 


    public int getCantAnios() {
        return cantAnios;
    }

    public void setCantAnios(int cantAnios) {
        this.cantAnios = cantAnios;
    }

    public int getAnioInicial() {
        return anioInicial;
    }

    public void setAnio(int Anio) {
        this.anioInicial = Anio;
    }
    
    public void registrarTemp(int anio , int mes , int temp){
        matriz[anio - anioInicial ][mes-1] = temp;
    }
    
    public double obtenerTemp(int anio , int mes){
        return matriz[anio - anioInicial][mes - 1];
    }
    
    public String obtenerMayorTemp(){
        double mesMax = 0 , anioMax=0 , max=0;
        for(int i=0 ; i<cantAnios ; i++){
            for(int j=0 ; j<12 ; j++){
                if(matriz[i][j]>max){
                    max = matriz[i][j];
                    mesMax=j;
                    anioMax=i;
                }            
            }
        }        
        return "La temperatura maxima fue en el Anio "+ anioMax +" Mes "+ mesMax+1; 
    }
    
    public String toString (){
        String aux;
        aux = estacion.toString();
        return aux;
    }
    
}

    