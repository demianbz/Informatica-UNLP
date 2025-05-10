
package comparararbolesgenerales;

import java.util.*;

public class CompararDosArboles {
    
    public boolean esSustituto(GeneralTree<Integer> arbol1 , GeneralTree<Integer> arbol2){
        boolean cumple = false;
        if(arbol1 != null && arbol2 != null){
            if(!arbol1.isEmpty() && !arbol2.isEmpty())
                cumple = metodoEsSustituto(arbol1,arbol2);
        }
        return cumple;
    }

    private boolean metodoEsSustituto(GeneralTree<Integer> ab1 , GeneralTree<Integer> ab2){
        boolean cumple = true;
        
        //Verificar que el arbol 1 sea par y mayor que arbol 2
        if(ab1.getData() % 2 != 0 || ab1.getData()<=ab2.getData())  //si no es par o si es menor listo no cumple retorno false
            return false;
        
        //Regla sobre hojas e hijos
        if(ab1.isLeaf())
            return true;
        
        if(!ab1.isLeaf() &&  ab2.isLeaf())
            return false;
        
        //ambos tienen hijos
        if(!ab1.isLeaf() &&  !ab2.isLeaf()){
            int contarParesA1 = contarHijosPares(ab1);
            int contarParesA2 = contarHijosPares(ab2);
        if(contarParesA1 <= contarParesA2){
            return false;
        }else{//recorro hijos
            Iterator<GeneralTree<Integer>> iterador1 = ab1.getChildren().iterator();
            Iterator<GeneralTree<Integer>> iterador2 = ab2.getChildren().iterator();
            while(cumple && iterador1.hasNext() && iterador2.hasNext()){
                cumple = metodoEsSustituto(iterador1.next(),iterador2.next());
            }
        }
            
        
        }
            
        return cumple;
    }
    
    private int contarHijosPares(GeneralTree<Integer> ab){
        int contador = 0;
        for(GeneralTree<Integer> hijo : ab.getChildren()){
            if(hijo.getData() % 2 == 0)
                contador ++;
        }
        return contador;
    }
    
}
