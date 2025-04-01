/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tipodedatoreferencial;

import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DEMIA
 */
public class TipoDeDatoReferencial {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        List<Integer> numeros = new ArrayList<>(Arrays.asList(1,2,3,4,5));  //Creo una lista e inicializo con numeros
        System.out.println("Lista Original: "+ numeros);
        
        List<Integer> pares = new ArrayList<>();    //Creo la lista para numero pares
        TipoDeDatoReferencial.DevolverPorParametro(numeros, pares);
        System.out.println("Lista de Pares: "+ pares);
        
        
    }
 
    public static void DevolverPorParametro(List<Integer> numeros , List<Integer> pares ){
        for(int elem: numeros){     //Recorro la lista y voy iterando sobre los elementos atravez de "elem"
            if(elem % 2 == 0){      //Si el numero es par
                pares.add(elem);    //Agrego a la lista de numero pares
            }
        //otra opcion es que se reciba solo una lista y hacer un return de la nueva lista de pares creada dentro del metodo
        }
    }
    
}
