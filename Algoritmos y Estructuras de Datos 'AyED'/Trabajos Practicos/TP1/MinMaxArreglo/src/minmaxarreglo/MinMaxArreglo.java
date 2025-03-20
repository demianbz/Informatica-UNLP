package minmaxarreglo;


public class MinMaxArreglo {
    
    public static void main(String[] args) {
        int [] Datos = {4 , 6 , 8, 10 , 12 , 14};
        Datos maxmin = new Datos();
        maxmin = Calculadora.maxmin(Datos);
        System.out.println("El Maximo del vector es: " + maxmin.getMax());
        System.out.println("El Minimo del vector es: " + maxmin.getMin()); 
        
    }
    
}
