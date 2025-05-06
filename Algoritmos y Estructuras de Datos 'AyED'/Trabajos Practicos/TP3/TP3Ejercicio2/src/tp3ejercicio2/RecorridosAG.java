package tp3ejercicio2;

import java.util.List;
import java.util.LinkedList;

public class RecorridosAG {
    
    /* Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
    pasados como parámetros, recorrido en preorden.*/
    public List<Integer> numerosImparesMayoresQuePreOrden (GeneralTree<Integer> a , Integer n){
        List<Integer> lista = new LinkedList<>();   //creo la lista inicialmente en null
        
        if(!a.isEmpty())
            recorridoPreOrden(a,n,lista);
        
        return lista;
            
    }
    
    /*Recorrido PreOrden: Tengo que procesar primero la raiz y luego los hijos*/
    public void recorridoPreOrden (GeneralTree<Integer> a , Integer n , List<Integer> lista){
        if(((a.getData()) % 2 != 0) && (a.getData()>n)) //si el numero es impar y mayor al valor n
            lista.add(a.getData());
        
        for(GeneralTree<Integer> hijo: a.getChildren()) //for each que recorre cada uno de los arboles hijos de izq a der
            recorridoPreOrden(hijo,n,lista);
        /*ese for each es lo mismo que hacer
        List<GeneralTree<Integer>> hijos = a.getChildren();
        for (int i = 0; i < hijos.size(); i++) {
            metodoNumerosImparesMayoresQuePreOrden(hijos.get(i), n, lista);
        }
        necesito crearme una lista para recorrer cada hijo que es una lista de hijos, es mas facil con el for each
        */
    }
    
    
    /* Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
    pasados como parámetros, recorrido en inorden.*/
    public List<Integer> numerosImparesMayoresQueInOrden (GeneralTree <Integer> a, Integer n){
        List<Integer> lista = new LinkedList<>();   //creo la lista inicialmente en null
        
        if(!a.isEmpty())
            recorridoInOrden(a,n,lista);
        
        return lista;
    }
    
    /*Recorrido InOrden: Tengo que procesar el primer hijo, despues la raiz y por ultimo los hijos restantes*/
    public void recorridoInOrden(GeneralTree<Integer> a , Integer n , List<Integer> lista){
        List<GeneralTree<Integer>> hijos = a.getChildren();
        if(!hijos.isEmpty())    //si la lista de hijos no esta vacia
            recorridoInOrden(hijos.get(0),n,lista);     //proceso el primer hijo
      
        if((a.getData() % 2 !=0) && (a.getData()>n))    //proceso la raiz
            lista.add(a.getData());
        
        if(hijos.size()>1){
            for(int i=1 ; i<hijos.size() ; i++){    //proceso el resto de los hijos
                GeneralTree<Integer> hijo = hijos.get(i);
                recorridoInOrden(hijo,n,lista);
            }
        }
    }    
    
    /* Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
    pasados como parámetros, recorrido en postorden.*/
    public List<Integer> numerosImparesMayoresQuePostOrden (GeneralTree <Integer> a,Integer n){
        List<Integer> lista = new LinkedList<>();   //creo la lista inicialmente en null
        
        if(!a.isEmpty())
            recorridoPostOrden(a,n,lista);
        
        return lista;
    }
    
    /*Recorrido PostOrden: Se procesan primero los hijos luego la raiz*/
    public void recorridoPostOrden(GeneralTree<Integer> a , Integer n, List<Integer> lista){
        for(GeneralTree<Integer> hijos: a.getChildren())
            recorridoPostOrden(hijos,n,lista);
        
        if((a.getData() % 2 != 0) && (a.getData()>n))
            lista.add(a.getData());
    }
    
    /* Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
    pasados como parámetros, recorrido por niveles.*/
    public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree <Integer> a,Integer n){
        List<Integer> lista = new LinkedList<>();   //creo la lista inicialmente en null
        
        if(!a.isEmpty())
            recorridoPorNiveles(a,n,lista);
        
        return lista;
    }

    /*Se procesan los nodos teniendo en cuenta sus niveles, primero la raiz. luego los hijos, los hijos de estos,etc*/
    public void recorridoPorNiveles(GeneralTree<Integer> a , Integer n , List<Integer> lista){
        Queue<GeneralTree<Integer>> cola = new Queue<>();
        cola.enqueue(a); //encolo la raiz
        while(!cola.isEmpty()){ //mientras la cola no se vacie
            GeneralTree<Integer> aux = cola.dequeue();  //desencolo la cola en aux
            if((aux.getData()% 2 != 0) && (aux.getData() > n))
                lista.add(aux.getData());
            for(GeneralTree<Integer> hijos : aux.getChildren()) //encolo los hijos
                cola.enqueue(hijos); 
        }
    }
    
        
}
