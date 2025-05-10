/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package primercaminosumaminima;

import java.util.*;

public class CaminoSumaMinima {
    
    public List<Integer> buscarCaminoSumaMinima(GeneralTree<Integer> arbol){
        List<Integer> lista = new LinkedList<>();
        Minimo min = new Minimo(999);
        if(arbol != null && !arbol.isEmpty())
            metodoSumaMinima(arbol,lista,new LinkedList<>(),0,min);
        return lista;
    }
    
    private static int metodoSumaMinima(GeneralTree<Integer> ab , List<Integer> l , LinkedList<Integer> lAux , int sumaAct , Minimo sumaMin){
        lAux.add(ab.getData());
        sumaAct += ab.getData(); 
        if(ab.isLeaf()){
            if(sumaAct<sumaMin.getMin()){
                l.clear();
                l.addAll(lAux);
                sumaMin.setMin(sumaAct);
            }
        }
        else{
            for(GeneralTree<Integer> hijo : ab.getChildren()){
                sumaAct = metodoSumaMinima(hijo,l,lAux,sumaAct,sumaMin);
            }
        }
        lAux.remove(lAux.size()-1);
        return sumaMin.getMin();
    }
    
}
