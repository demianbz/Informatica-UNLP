package devolverelcaminomascorto;

import java.util.List;
import java.util.LinkedList;

public class CaminoMasCorto {
    
    private static boolean cumple(int num , int min , int max){
        return (num>= min && num<= max);
    }
    
    public List<Integer> camMasCortoDentroRango(GeneralTree<Integer> arbol , int min , int max){
        List<Integer> lista = new LinkedList<>();
        Minimo recorridoMin = new Minimo(999);
        if(arbol != null && !arbol.isEmpty() && cumple(arbol.getData(),min,max))
            metodoCaminoMasCorto(arbol,min,max,lista,recorridoMin,new LinkedList<Integer>());
        return lista;
    }
    
    private void metodoCaminoMasCorto(GeneralTree<Integer> ab , int min , int max , List<Integer> l , Minimo recMin , LinkedList<Integer> lAux){
        lAux.add(ab.getData());
        if(ab.isLeaf()){
            if(lAux.size()<recMin.getMinRecorrido()){
                l.clear();
                l.addAll(lAux);
                recMin.setMinRecorrido(lAux.size());
            }
        }
        else{
            if(ab.hasChildren()){
                for(GeneralTree<Integer> hijo : ab.getChildren()){
                    if(cumple(hijo.getData(),min,max))
                        metodoCaminoMasCorto(hijo,min,max,l,recMin,lAux);
                }
            }
        }
        lAux.remove(lAux.size()-1);
    }
    
}
