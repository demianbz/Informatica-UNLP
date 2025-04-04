package ejercicio2p4;

public class Entrenador extends Empleados {
    
    private int cantCampeonatos;
    
    public Entrenador (String unNombre, double unSueldo, int unaAntiguedad, int unaCantCampeonatos){
        super(unNombre,unSueldo,unaAntiguedad);
        setCantCampeonatos(unaCantCampeonatos);
    }

    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int unaCantCampeonatos) {
        cantCampeonatos = unaCantCampeonatos;
    }
    
    public double calcularEfectividad(){//entrenador es el promedio de campeonatos ganados por año de antigüedad
        double aux;
        aux = (getCantCampeonatos() / getAntiguedad());
        return aux;
    }


    public double calcularSueldoACobrar() { //El sueldo a cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad
        double aux;
        aux = super.calcularSueldoACobrar();
        if(getCantCampeonatos()>=1){    //se adiciona un plus por campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).
            aux = aux + 5000;
            if(getCantCampeonatos()>4)
                aux = aux + 25000;
            if(getCantCampeonatos()>10)
                 aux = aux + 25000;   
        }        
        return aux;
    }
    

}
