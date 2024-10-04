package ejercicio2p5;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int horaApertura;
    private int horaCierre;
    private Auto [][] matriz;
    private int cantPiso;
    private int cantPlaza;
    
    public Estacionamiento(String unNombre , String unaDireccion){
        nombre = unNombre;
        direccion = unaDireccion;
        horaApertura = 8;
        horaCierre = 21;
        /*for(int i=0 ; i<5 ; i++){
            for(int j=0 ; j<10 ; j++)
                matriz[i][j] = null;
        }*/
    }
    
    public Estacionamiento(String unNombre , String unaDireccion , int unaHoraA , int unaHoraC , int N , int M){
        nombre = unNombre;
        direccion = unaDireccion;
        horaApertura = unaHoraA;
        horaCierre = unaHoraC;
        cantPiso = N;
        cantPlaza = M;
        matriz = new Auto [N][M];
    }



    
    public void registrarAuto(int X , int Y , Auto A){
        matriz[X][Y] = A ;
    }
    
    public String buscarAuto (int unaPatente){
        String aux = "Auto Inexistente";
        boolean encontre = false;
        int i=0 , j=0;
        while((!encontre)&&(i<cantPiso)){
            if(matriz[i][j].getPatente() == unaPatente){
                encontre = true;
                aux = "El auto con Patente "+ unaPatente + " se encuentra en el Piso "+ (i+1) +" Plaza "+ (j+1);
            }
            else{ 
                j++;
                if(j == cantPlaza){
                    j = 0;      //reincio las plazas
                    i++;        //aumento el piso
                }
            }
        }
        return aux;
    }       
    
    public int cantAutosPlaza (int Y){
        int cant = 0;
        for(int i=0 ; i<cantPiso ; i++){
            if(matriz[i][Y] != null)
                cant++;
        }
        return cant;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(int horaApertura) {
        this.horaApertura = horaApertura;
    }

    public int getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(int horaCierre) {
        this.horaCierre = horaCierre;
    }
    
    @Override
    public String toString(){
        String aux = "";
        int i,j;
        for(i=0 ; i<cantPiso ; i++){
            for(j=0 ; j<cantPlaza ; j++){
                aux = aux +"Piso "+ (i+1) +" Plaza "+ (j+1);
                if(matriz[i][j] != null)
                    aux = aux + matriz[i][j].toString();
                else
                    aux = aux + " Libre";
            }
        }
        return aux;
    }
    
}
