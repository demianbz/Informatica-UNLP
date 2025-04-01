/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tipodedatoprimitivo;

/**
 *
 * @author DEMIA
 */
public class TipoDeDatoPrimitivo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int valor1 = 1;
        int valor2 = 2;
        
        System.out.println("La suma del valor1 y valor2 ANTES de la llamada al metodo es: "+(valor1+valor2));
        TipoDeDatoPrimitivo.ejemploParametroPrimitivo(valor1, valor2);
        System.out.println("La suma del valor1 y valor2 DESPUES de la llamada al metodo es: "+(valor1+valor2));        
        
        
    }
    
    public static void ejemploParametroPrimitivo (int valor1 , int valor2){
        valor1 = 10;
        System.out.println("La suma del valor1 y valor2 DENTRO del metodo es: "+(valor1+valor2));
    }
    
}
