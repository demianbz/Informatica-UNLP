package devolverelcaminomaslargo;

import java.util.List;
import java.util.LinkedList;

public class CaminoMasLargo {
    
    private static boolean cumple(int num , int min , int max){
        return (num>= min && num<= max);
    }
    
    public List<Integer> camMasLargoDentroRango(GeneralTree<Integer> arbol , int min , int max){
        List<Integer> lista = new LinkedList<>();
        Maximo recorridoMax =  new Maximo(-1);
        if(arbol != null && !arbol.isEmpty() && cumple(arbol.getData(),min,max))
            metodoCaminoMasLargo(arbol,min,max,lista,new LinkedList<Integer>(),recorridoMax);
        return lista;
    }
    
    private void metodoCaminoMasLargo(GeneralTree<Integer> ab , int min , int max , List<Integer> l , LinkedList<Integer> lAux , Maximo recMax){
        lAux.add(ab.getData());    //añado porque se que cumple
        if(ab.isLeaf()){ //si es hoja osea llegue al final y los otros cumplen
            if(lAux.size()>recMax.getMaxRecorrido()){   //comparo la longitud maxima con la longitud de mi camino acutal , tengo que usar un objeto para pasar "por referecia"
                l.clear();  //primero limpio porque puedo haber agregado antes algo y despues se supero
                l.addAll(lAux);     // agrego la nueva lista maxima
                recMax.setMaxRecorrido(l.size());   //actualizo el nuevo maximo
            }                            
        }else{
            if(ab.hasChildren()){
                for(GeneralTree<Integer> hijo: ab.getChildren()){
                    if(cumple(hijo.getData(),min,max))
                        metodoCaminoMasLargo(hijo,min,max,l,lAux,recMax);
                }
                    
            }
        }
        lAux.remove(lAux.size()-1);
    }
    
    
}
