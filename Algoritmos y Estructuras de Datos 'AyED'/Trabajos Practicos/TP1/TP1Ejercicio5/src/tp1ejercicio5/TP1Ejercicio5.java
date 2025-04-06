/*
5. Dado un arreglo de valores tipo entero se desea calcular el valor máximo, mínimo, y promedio 
en un único método. Escriba tres métodos de clase, donde respectivamente: 
a. Devuelva lo pedido por el mecanismo de retorno de un método en Java ("return"). 
b. Devuelva lo pedido interactuando con algún parámetro (el parámetro no puede ser de 
tipo arreglo). 
c. Devuelva lo pedido sin usar parámetros ni la sentencia "return". 
 */
package tp1ejercicio5;


public class TP1Ejercicio5 {
    
     


    public static void main(String[] args) {
        int [] v = {2,4,6,8,10,12};
        
        Datos dat = new Datos();
 
        System.out.println("Inciso A");
        System.out.println(Calculadora.IncisoA(v).toString());
        
        System.out.println("Inciso B");
        Calculadora.IncisoB(v, dat);
        System.out.println(dat.toString());
        
        System.out.println("Inciso C");
        Calculadora.IncisoC(v);
        System.out.println(Calculadora.obtenerD());
        
    } 
    
    
    
}
