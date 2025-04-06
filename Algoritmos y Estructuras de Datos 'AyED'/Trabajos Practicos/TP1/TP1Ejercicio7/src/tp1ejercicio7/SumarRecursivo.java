
package tp1ejercicio7;

import java.util.*;

public class SumarRecursivo {
    
    public static int sumarLinkedList(LinkedList<Integer> lista) {
        return sumarLinkedListRecursivo(lista, lista.size()-1);
    }
    
    public static int sumarLinkedListRecursivo(LinkedList<Integer> lista , int n){
        if(n<0)
            return 0;
        else
            return lista.get(n) + sumarLinkedListRecursivo(lista,n-1);
    }
    
    public static void main (String[] args) {
        LinkedList<Integer> lista = new LinkedList<>();
        lista.add(2);
        lista.add(4);
        lista.add(8);
        lista.add(10);
        
        System.out.println("Resultado total de los numeros de la lista: " + sumarLinkedList(lista));
    }
    
    
}
