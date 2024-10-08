
package parcial3;

public class Torneo {
    private String nombre;
    private Goleador [][] tabla;
    private int [] cantGoleadores; 
    private int cantFecha;
    private int cantGole;

    public Torneo (int F , int G , String unNombre){
        nombre = unNombre;
        tabla = new Goleador [F][G];
        cantGoleadores = new int [F];
        cantFecha = F;
        cantGole = G;
        for(int i=0 ; i<F ; i++)
            cantGoleadores[i]=0;
    }
    
    public void agregarGoleador(int fecha , Goleador unGoleador){
        tabla[fecha][cantGoleadores[fecha]] = unGoleador;
        cantGoleadores[fecha]++;
    }
    
    public Goleador obtenerPeorGoleador (int fecha){
        Goleador aux = new Goleador("","",0);
        int min=999;
        for (int i=0 ; i<cantGoleadores[fecha] ; i++){
            if(tabla[fecha][i].getGoles()<min){
                min = tabla[fecha][i].getGoles();
                aux = tabla[fecha][i];
            }
        }
        return aux; 
        }
    
    public int obtenerCantidadGoles(){
        int total=0;
        for(int i=0 ; i<cantFecha ; i++)
            total = total + cantGoleadores[i];
        return total;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString(){
        String aux;
        aux = "TORNEO 2024: "+ getNombre() +"\n";
        for(int i=0 ; i<cantFecha ; i++){
            aux = aux +"Fecha #" + (i+1) +" | "+ cantGoleadores[i] +" | Goleadores: ";
            for(int j=0 ; j<cantGole ; j++)
                if(tabla[i][j] != null)
                    aux = aux + tabla[i][j].toString();
            aux = aux + "\n";
        }
        return aux;
    }
    
    }
    

