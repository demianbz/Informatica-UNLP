package tp2ejercicio5;

public class ProfundidadDeArbolBinario {
    private BinaryTree<Integer> ab;

    
    public ProfundidadDeArbolBinario(BinaryTree<Integer> unArbol){
        ab = unArbol;
    }
    
    public int sumaElementosProfundidad(int p){
        if(!ab.isEmpty())
            return MetodoSumaElementosProfundidad(ab,p,0);
        else
            return 0;
    }
    
    public int MetodoSumaElementosProfundidad (BinaryTree<Integer> ab , int p , int nivelAct){//devuelve la suma de todos los nodos del árbol que se encuentren a la profundidad pasada como argumento.
        if(p == nivelAct){
            return ab.getData();
        } else {
            int suma = 0;
            if(ab.hasLeftChild()) suma+= MetodoSumaElementosProfundidad(ab.getLeftChild(),p, nivelAct+1);
            if(ab.hasRightChild()) suma+= MetodoSumaElementosProfundidad(ab.getRightChild(),p, nivelAct+1);
            return suma;
        }
    }

}