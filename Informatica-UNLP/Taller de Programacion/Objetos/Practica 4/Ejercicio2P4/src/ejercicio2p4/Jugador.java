package ejercicio2p4;

public class Jugador extends Empleados {
    
    private int numPartidos;
    private int numGoles;
    
    public Jugador (String unNombre , double unSueldo, int unaAntiguedad, int unNumPartido, int unNumGol){
        super(unNombre,unSueldo,unaAntiguedad); 
        setNumPartidos(unNumPartido);
        setNumGoles(unNumGol);
    }
    
    public void setNumPartidos (int N){
        numPartidos = N;
    }
    
    public int getNumPartidos (){
        return numPartidos;
    }
    
    public void setNumGoles (int N){
        numGoles = N;
    }
    
    public int getNumGoles (){
        return numGoles;
    }
    
    public double calcularEfectividad (){   //jugador es el promedio de goles por partido
        double aux;
        aux = (getNumGoles() / getNumPartidos());
        return aux;
    }

    public double calcularSueldoACobrar() { //El sueldo a cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad
        double aux;
        aux = super.calcularSueldoACobrar();
        if(calcularEfectividad() > 0.5)    //si el promedio de goles por partido es superior a 0,5 se adiciona un plus de otro sueldo básico.
            aux = aux + getSueldo();
        return aux;
    }
    
}
