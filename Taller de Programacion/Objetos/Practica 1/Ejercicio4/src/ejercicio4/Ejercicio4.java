/* 4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
*/

package ejercicio4;

import PaqueteLectura.Lector;

/**
 *
 * @author DEMIA
 */


public class Ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int [][] edificio = new int [8][4];
        
        //Cargar La Matriz
        
        System.out.print("Ingrese su numero de Piso: ");
        int numeroPiso = Lector.leerInt();
        System.out.print("Ingrese su numero de Oficina: ");
        int numeroOficina = Lector.leerInt();        
        while(numeroPiso!=9){
            edificio[numeroPiso][numeroOficina]=edificio[numeroPiso][numeroOficina]+1;
            
            System.out.print("Ingrese su numero de Piso: ");
            numeroPiso = Lector.leerInt();
            System.out.print("Ingrese su numero de Oficina: ");
            numeroOficina = Lector.leerInt();
        }    
       
        int i,j;
        
        for(i=0 ; i<8 ; i++){
            System.out.println(" En el Piso "+ i);
            for (j=0 ; j<4 ; j++)
                System.out.print(" y Oficina "+ j + " Hay "+ edificio[i][j] +" Personas|");
            
            System.out.println();
        }
    }
    
}
