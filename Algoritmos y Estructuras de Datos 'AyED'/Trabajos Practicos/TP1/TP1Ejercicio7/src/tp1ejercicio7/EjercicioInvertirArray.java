/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1ejercicio7;

import java.util.*;

public class EjercicioInvertirArray {
    
    public static void invertirArrayList(ArrayList<Integer> lista) {
        invertirArrayListRecursivo(lista, 0, lista.size()-1);     //la lista va de 0 a n-1
    }
    
    private static void invertirArrayListRecursivo(ArrayList<Integer> lista, int inicio, int fin) {
        if(inicio < fin) {
            int aux = lista.get(inicio);            //me guardo el valor del inicio en un auxiliar para no perderlo
            lista.set(inicio, lista.get(fin));      //Pongo en la posicion "inicio" lo que hay en la posicion "fin"
            lista.set(fin, aux);                    //Pongo en la posicion fin lo que hay en la posicion inicio en un principio
            invertirArrayListRecursivo(lista, inicio+1, fin-1);   //llamo recursivamente decrementando los indices, avanzando en el inicio y retrocediendo en el fin
        }
    }
    
        public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<Integer>();
        lista.add(10);
        lista.add(11);
        lista.add(12);
        lista.add(13);
        lista.add(14);
        
        System.out.println("----Lista----");
        for(Integer n: lista)
            System.out.println(n);
        
        System.out.println("");
        invertirArrayList(lista);
        
        System.out.println("----Lista Invertida----");
        for(Integer n: lista)
            System.out.println(n);
    }

    
    
    
}
