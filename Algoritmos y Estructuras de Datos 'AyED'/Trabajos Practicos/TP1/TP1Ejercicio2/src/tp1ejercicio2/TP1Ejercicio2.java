/*Escriba un método de clase que dado un número n devuelva un nuevo arreglo de tamaño n 
con los n primeros múltiplos enteros de n mayores o iguales que 1. 
Ejemplo: f(5) = [5; 10; 15; 20; 25]; f(k) = {n*k donde k : 1..k} 
Agregue al programa la posibilidad de probar con distintos valores de n ingresandolos por 
teclado, mediante el uso de System.in. La clase Scanner permite leer de forma sencilla 
valores de entrada.*/

package tp1ejercicio2;

import java.util.Scanner;

public class TP1Ejercicio2 {

    public static void DevolverMultiplos(int n){
        int [] v = new int[n];
        for(int i=0 ; i<n ; i++){
            v[i]= n*(i+1);
            System.out.println(v[i]);
        }
    }
    
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        System.out.print("Ingrese un numero: ");
        int n = s.nextInt();
        System.out.println("Los primeros multiplos de "+ n);
       TP1Ejercicio2.DevolverMultiplos(n);
        
    }
    
}
