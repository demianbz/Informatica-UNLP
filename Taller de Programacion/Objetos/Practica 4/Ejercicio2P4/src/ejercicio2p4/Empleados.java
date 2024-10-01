package ejercicio2p4;

public abstract class Empleados {
    
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleados (String unNombre, double unSueldo, int unaAntiguedad){
        setNombre(unNombre);
        setSueldo(unSueldo);
        setAntiguedad(unaAntiguedad);
    }
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double unSueldo) {
        sueldo = unSueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int unaAntiguedad) {
        antiguedad = unaAntiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar() { //El sueldo a cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad
        double aux;
        aux = getSueldo() + (getSueldo()*0.10) * getAntiguedad();
        return aux;
    }
    
    public String toString (){  //por nombre, sueldo a cobrar y efectividad.
        String aux;
        aux = "Nombre: "+ getNombre() +" Sueldo: "+ this.calcularSueldoACobrar() + " Efectividad: "+ this.calcularEfectividad();
        return aux;
    }


}