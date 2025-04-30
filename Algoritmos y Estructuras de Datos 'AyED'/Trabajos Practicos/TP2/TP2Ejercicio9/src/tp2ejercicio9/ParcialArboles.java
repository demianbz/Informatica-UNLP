
package tp2ejercicio9;

public class ParcialArboles {
    
    public BinaryTree<SumyDif> sumAndDif(BinaryTree<Integer> arbol){
        BinaryTree<SumyDif> nuevoAb = new BinaryTree<>();
        if(!arbol.isEmpty())
            return metodoSumAndDif(arbol,0,0);
        else
            return nuevoAb;

    }
    
    private BinaryTree<SumyDif> metodoSumAndDif(BinaryTree<Integer> ab , int numPadre , int suma ){
        BinaryTree<SumyDif> nuevoAb = new BinaryTree<>();
        suma += ab.getData();   //suma del camino
        int diferencia = ab.getData() - numPadre;   //diferencia entre el nodo actual y el nodo padre     
        SumyDif aux = new SumyDif(suma,diferencia);
        nuevoAb.setData(aux);
        
        if(ab.hasLeftChild()){
            nuevoAb.addLeftChild(metodoSumAndDif(ab.getLeftChild(),ab.getData(),suma));
        }
        if(ab.hasRightChild()){
            nuevoAb.addRightChild(metodoSumAndDif(ab.getRightChild(),ab.getData(),suma));
        }
        
        return nuevoAb;
    }
    
        public void imprimirPreorden(BinaryTree<SumyDif> arbol) {
    if (arbol != null && !arbol.isEmpty()) {
        System.out.println(arbol.getData());  // Imprime el nodo actual
        if (arbol.hasLeftChild()) {
            imprimirPreorden(arbol.getLeftChild());
        }
        if (arbol.hasRightChild()) {
            imprimirPreorden(arbol.getRightChild());
        }
    }
    
    
    
        }
}
