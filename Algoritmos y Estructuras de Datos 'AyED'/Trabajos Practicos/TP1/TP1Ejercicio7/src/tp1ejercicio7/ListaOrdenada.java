/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tp1ejercicio7;

import java.util.*;

public class ListaOrdenada {
    
    public static ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1, ArrayList<Integer> lista2) {
        ArrayList<Integer> nuevaLis = new ArrayList<>();
        int indice1 = 0 ; int indice2 = 0;
        
        while((indice1<lista1.size()) && (indice2<lista2.size())){
            if(lista1.get(indice1)<lista2.get(indice2)){
                nuevaLis.add(lista1.get(indice1));
                indice1++;
            }else{
                nuevaLis.add(lista2.get(indice2));
                indice2++;
            }
        }
        
        //Puede ser que me pase de alguna de las dos listas y en la otra me quedaron elementos sin agregar, entonces tengo que verificar eso
        
        while(indice1<lista1.size()){
            nuevaLis.add(lista1.get(indice1));
            indice1++;           
        }
        
        while(indice2<lista2.size()){
            nuevaLis.add(lista2.get(indice2));
            indice2++;           
        }
        
        return nuevaLis;
        
    }
    
       
    public static void main(String[] args) {
        ArrayList<Integer> lista1 = new ArrayList<>();
        lista1.add(8);
        lista1.add(20);
        lista1.add(35);
        
        ArrayList<Integer> lista2 = new ArrayList<>();
        lista2.add(2);
        lista2.add(10);
        lista2.add(15);
        
        ArrayList<Integer> listaCombinada = combinarOrdenado(lista1, lista2);
        System.out.println("Lista Nueva Ordenada, combinando las dos listas: " + listaCombinada);
    }
    
    
    
}
