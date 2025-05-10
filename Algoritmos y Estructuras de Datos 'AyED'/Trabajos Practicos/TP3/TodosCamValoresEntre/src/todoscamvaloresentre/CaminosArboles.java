package todoscamvaloresentre;

import java.util.LinkedList;
import java.util.List;

public class CaminosArboles {
    
    private static boolean cumple(int num , int min , int max){
        return (num>= min && num<= max);
    }
    
    public List<List<Integer>> todosLosCaminosConValoresEntre(GeneralTree<Integer> arbol , int min , int max){
        List<List<Integer>> lista = new LinkedList<>();
        if(arbol != null && !arbol.isEmpty() && cumple(arbol.getData(),min,max))
            metodoCaminosValoresEntre(arbol,min,max,lista,new LinkedList<Integer>());      
        return lista;
    }
    
    private static void metodoCaminosValoresEntre(GeneralTree<Integer> ab , int min , int max , List<List<Integer>> l , LinkedList<Integer> caminoAct){
        caminoAct.add(ab.getData());    //agrego el nodo actual porque solo llamo con nodos q su valor este en el rango
        if(ab.isLeaf()) //cuando es hoja creo la nueva lista para agregarla a la lista de listas
            l.add(new LinkedList<Integer>(caminoAct));  // guardo un "clon" de la lista(camino) porque si no hago el new se pierde la lista, cuando elimino lo guardado por el BACKTRACKING, 
        else{                                           //tengo que eliminar para seguir recorriendo y hacer el nuevo camino si es que hay mas caminos que cumplen  
            if(ab.hasChildren()){
                for (GeneralTree<Integer> hijo : ab.getChildren()){ //itero sobre cada hijo de la lista de los hijos
                    if(cumple(hijo.getData(),min,max))  //solo llamo a los hijos que estan entre los valores
                        metodoCaminosValoresEntre(hijo,min,max,l,caminoAct);    //llamo recursivamente al hijo que cumple
                }
            }   
        }
        caminoAct.remove(caminoAct.size()-1);  //cuando vuelvo de la recursion tengo que remover para armar las nuevas listas si es que hay mas caminos 
    }
    
    /*@Override
    public String toString (){
        return "";
    }*/
    
}
