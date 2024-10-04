package ejercicio2p5;

public class Auto {
    private String nombreDueño;
    private int patente;

    public Auto(String unNombreDueño, int unaPatente) {
        nombreDueño = unNombreDueño;
        patente = unaPatente;
    }
    
    

    public String getNombreDueño() {
        return nombreDueño;
    }

    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }

    public int getPatente() {
        return patente;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }
    
    @Override
    public String toString(){
        String aux = " ";
        aux = " Nombre del dueño: "+ getNombreDueño() +" Patente: "+ getPatente()+" \n";
        return aux;
    }
    
}
