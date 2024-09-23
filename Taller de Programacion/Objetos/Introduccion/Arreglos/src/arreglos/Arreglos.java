/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package arreglos;
    import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author DEMIA
 */
public class Arreglos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String [] alumnos = new String[8];
        
        alumnos[0] = "Demian";
        alumnos[1] = "Camilo";
        alumnos[2] = "Stefano";
        alumnos[3] = "Agustin";
        
        int i;
        for(i=0 ; i<=3 ; i++ )
            System.out.println("Pos."+ i +" Esta "+ alumnos[i] );
       
        for(i=0 ; i<8 ; i++)
            alumnos[i]=GeneradorAleatorio.generarString(8);
        
        System.out.println("");
        System.out.println("-----Arreglo Aleatorio-----");        
        System.out.println("");
        
        
        for(i=0 ; i<8 ; i++)
            System.out.println(i +":"+ alumnos[i]);
        
    }
    
}
